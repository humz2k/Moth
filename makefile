BUILD_DIR ?= build
SOURCEDIR ?= src
LLVM_DIR ?= $(shell brew --prefix llvm)

SOURCES := $(shell find $(SOURCEDIR) -name '*.c') $(shell find $(SOURCEDIR) -name '*.cpp')
OBJECTS_1 := $(SOURCES:%.c=%.o)
OBJECTS := $(OBJECTS_1:%.cpp=%.o)
OUTPUTS := $(OBJECTS:src%=build%)
MY_CC ?= clang -Wall -Wpedantic -Wno-gnu -Wno-newline-eof

moth: $(OUTPUTS) $(BUILD_DIR)/moth.yy.c $(BUILD_DIR)/moth.tab.c 
	$(MY_CC) -O3 -Ibdwgc/include -I$(shell llvm-config --includedir) -I$(SOURCEDIR) -I$(BUILD_DIR) $^ bdwgc/libgc.a $(shell llvm-config --cflags --ldflags --system-libs --libs core orcjit native) -o $@

$(BUILD_DIR)/%.yy.c: src/%.l | $(BUILD_DIR)
	flex -o $@ $<

$(BUILD_DIR)/%.tab.c: src/%.y | $(BUILD_DIR)
	bison -Wcounterexamples -d -o $@ $^

$(BUILD_DIR)/%.o: src/%.c | $(BUILD_DIR)
	$(MY_CC) -O3 -Ibdwgc/include -I$(shell llvm-config --includedir) $(shell llvm-config --cflags) -I$(SOURCEDIR) -I$(BUILD_DIR) -o $@ $< -c

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)/backend
	mkdir -p $(BUILD_DIR)/backend/moth_ops
	mkdir -p $(BUILD_DIR)/backend/moth_llvm
	mkdir -p $(BUILD_DIR)/parser
	mkdir -p $(BUILD_DIR)/generic_list
	mkdir -p $(BUILD_DIR)/generic_table

.PHONY: clean

clean:
	rm -rf $(BUILD_DIR)
	rm -rf moth