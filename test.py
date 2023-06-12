import numpy as np

a = np.arange(3*2).reshape(3,2)
b = np.arange(3).reshape(3,1,1)
print(a)
print(b)
print(a + b)