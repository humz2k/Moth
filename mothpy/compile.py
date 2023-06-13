from .lexing import *
from .parsing import *
import os
from llvmlite import binding

def compile_moth(filename, llvm_compiler="llc", optimization_level=3, threaded=False, n_threads=5, echo_compile=False):
    """
    Compiles a Moth source file to an object file.

    Parameters
    ----------
    filename : str
        The path to the Moth source file to compile.

    llvm_compiler : str, optional
        The LLVM compiler to use (default is 'llc').

    optimization_level : int, optional
        The optimization level to use (default is 3).

    threaded : bool, optional
        Whether to use multi-threading (default is False).

    n_threads : int, optional
        The number of threads to use (default is 5).

    echo_compile : bool, optional
        Whether to print the compile commands (default is False).

    Returns
    -------
    tuple
        Paths to the generated object file, the optimized LLVM file, and the LLVM file.
    """
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "tokens.txt")
    tokens = lex_file(filename, path)
    parsed = parse(tokens, path)
    module = parsed.eval(filename, threaded, n_threads)
    
    output_code = "\n".join(line for line in str(module).split("\n") if not line.startswith("target"))
    target = 'target triple = "' + binding.get_default_triple() + '"\n'
    output_code = target + output_code
    
    tmp_ll_path = filename + ".tmp.ll"
    with open(tmp_ll_path, "w") as file:
        file.write(output_code)
        
    opt_ll_path = filename + ".tmp.opt.ll"
    command = f'opt {tmp_ll_path} -passes="always-inline,mem2reg" -S -o {opt_ll_path}'
    if echo_compile:
        print(command)
    os.system(command)
    
    tmp_obj_path = filename + ".tmp.o"
    command = f'{llvm_compiler} -filetype=obj {opt_ll_path} -o {tmp_obj_path} -O{optimization_level}'
    if echo_compile:
        print(command)
    os.system(command)
    
    return tmp_obj_path, opt_ll_path, tmp_ll_path

def link_files(filepaths, output_filepath, is_shared, compile_only=False, compiler="gcc-13",
               garbage_collector_tools=None, c_tools=None, file_tools=None, threading_tools=None,regex_tools=None,
               math_tools = None, io_tools = None, rand_tools = None, stdlib_tools = None,
               threaded=False, n_threads=5, echo_compile=False, mpi_tools=None):
    """
    Links several files together into a single output file.

    Parameters
    ----------
    filepaths : list of str
        The paths to the files to link.

    output_filepath : str
        The path to the output file to create.

    is_shared : bool
        Whether to create a shared library.

    compile_only : bool, optional
        Whether to stop after compilation (default is False).

    compiler : str, optional
        The compiler to use (default is 'gcc-13').

    garbage_collector_tools : str, optional
        The path to the garbage collector tools file (default is None).

    c_tools : str, optional
        The path to the C tools file (default is None).

    file_tools : str, optional
        The path to the file tools file (default is None).

    threading_tools : str, optional
        The path to the threading tools file (default is None).

    threaded : bool, optional
        Whether to use multi-threading (default is False).

    n_threads : int, optional
        The number of threads to use (default is 5).

    echo_compile : bool, optional
        Whether to print the compile commands (default is False).

    mpi_tools : str, optional
        The path to the MPI tools file (default is None).
    """

    base_dir = os.path.dirname(os.path.abspath(__file__))
    stdlib_dir = os.path.join(base_dir,'..',"stdlib")
    
    if garbage_collector_tools is None:
        garbage_collector_tools = os.path.join(base_dir, "gc_tools.c")
    if c_tools is None:
        c_tools = os.path.join(base_dir, "c_tools.c")
    if file_tools is None:
        file_tools = os.path.join(base_dir, "file_tools.c")
    if mpi_tools is None:
        mpi_tools = os.path.join(base_dir, "mpi_tools.c")
    if regex_tools is None:
        regex_tools = os.path.join(base_dir, "regex_tools.c")
    if math_tools is None:
        math_tools = os.path.join(stdlib_dir,"math_lib.o")
    if io_tools is None:
        io_tools = os.path.join(stdlib_dir,"io_lib.o")
    if rand_tools is None:
        rand_tools = os.path.join(stdlib_dir,"rand_lib.o")
    if stdlib_tools is None:
        stdlib_tools = os.path.join(stdlib_dir,"stdlib_lib.o")

    if threaded and threading_tools is None:
        threading_tools = os.path.join(base_dir, "threading_tools.c")
    else:
        threading_tools = ""

    gc_lib_path = os.path.abspath(os.path.join(os.path.dirname( __file__ ), '..','bdwgc','libgc.a'))
    filepaths += [garbage_collector_tools, c_tools, gc_lib_path, file_tools, threading_tools, regex_tools,math_tools,io_tools,rand_tools,stdlib_tools]
    files_str = " ".join(filepaths)

    shared_flag = " -shared" if is_shared else ""
    compile_flag = " -O3" + (" -c" if compile_only else "")
    thread_flag = " -pthread" if threaded else ""
    mpi_flag = " " + mpi_tools if "mpi" in compiler else ""

    command = f'{compiler} {files_str} {mpi_flag} -o {output_filepath} {shared_flag} {compile_flag} {thread_flag}'
    if not compile_only:
        if echo_compile:
            print(command)
        os.system(command)
    else:
        os.system("cp " + filepaths[0] + " " + output_filepath)
