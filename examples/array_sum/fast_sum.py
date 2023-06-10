import time
import random
import numpy as np

arr = [random.random() for i in range(1000000)]
start = time.perf_counter()
out = sum(arr)
end = time.perf_counter()
print("Pure python:",str(end-start) + "s, total",out)

arr = np.random.rand(1000000)
start = time.perf_counter()
out = np.sum(arr)
end = time.perf_counter()
print("Numpy:",str(end-start) + "s, total",out)
