import pyedflib
import numpy as np
import numpy, scipy.io

f = pyedflib.EdfReader("/Users/titusjohn/Documents/EMU Seizures/SZ 2/NKT/EEG2100/MG111114_1-1+.edf")
n = f.signals_in_file
signal_labels = f.getSignalLabels()
sigbufs = np.zeros((n, f.getNSamples()[0]))

for i in np.arange(n):
    sigbufs[i, :] = f.readSignal(i)

print (sigbufs.shape)
print (signal_labels)
print type(sigbufs), sigbufs.shape
