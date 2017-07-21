import pyedflib
import numpy as np
import numpy, scipy.io

f = pyedflib.EdfReader("/Users/titusjohn/Desktop/SZ 1/NKT/EEG2100/MG111113_1-1+.edf")
print('got here')
n = f.signals_in_file
signal_labels = f.getSignalLabels()
sigbufs = np.zeros((n, f.getNSamples()[0]))

for i in np.arange(n):
    sigbufs[i, :] = f.readSignal(i)

channel1= sigbufs[1,:]
print(channel1.shape)

np.savetxt('test.txt', channel1, delimiter=',')

print (sigbufs.shape)
print (signal_labels)
print type(sigbufs), sigbufs.shape
