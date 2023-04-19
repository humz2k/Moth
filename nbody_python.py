import numpy as np
import time

a = np.ones((10,3))
print(np.sum(a,0))

'''
def calcAcc(pos,acc):
    for i in range(pos.shape[0]):
        for j in range(pos.shape[0]):
            diff = pos[j,:] - pos[i,:]
            dist2 = diff[0]*diff[0] + diff[1]*diff[1] + diff[2]*diff[2]
            if dist2 != 0:
                rdist2 = 1/dist2
                acc[i,:] += rdist2 * diff

def add(arr1,arr2,mul):
    for i in range(arr2.shape[0]):
        arr2[i,:] += arr1[i,:] * mul

n = 100
nsteps = 10
dt = 0.005

pos = np.arange(n*3).reshape(n,3).astype(np.float32)
vel = np.zeros_like(pos).astype(np.float32)
acc = np.zeros_like(pos).astype(np.float32)
start = time.perf_counter_ns()
calcAcc(pos,acc)
for i in range(nsteps):
    add(acc,vel,0.5*dt)
    add(vel,pos,dt)
    acc[:] = 0
    calcAcc(pos,acc)
    add(acc,vel,0.5*dt)
end = time.perf_counter_ns()
print((end-start)*1e-9)




'''