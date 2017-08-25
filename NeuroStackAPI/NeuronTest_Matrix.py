## Simple neuron test
## copyright(c) 2017 General Vision

import sys
import os
import ctypes
from ctypes import *
from array import array
import scipy.io as sio
import numpy as np

#-------------------------------------------------
# Edit the path of the CogniPat SDK folder
#
appPath = os.getcwd()
binPath = os.sep.join(appPath.split(os.sep)[:-1])
#
#-------------------------------------------------
print(binPath)
gvDll = ctypes.CDLL(binPath + "\\bin\\x64\\CogniPat_Simu.dll")
if (gvDll.Connect(0)!=0): #0=simu, 1=NeuroStack
  print ("Cannot connect to NeuroMem hardware. Check your plaform\n")
  sys.exit()

print("DLL rev " + repr(gvDll.Version()))
print("Network size="+repr(gvDll.CountNeuronsandReset()))
print("Maxif=" + repr(gvDll.Read(1,7)))
print("Minif=" + repr(gvDll.Read(1,6)))

###Loading data###
vects = sio.loadmat('C:\Users\Xinyang\Documents\MATLAB\sz_sl.mat')
sz_vects = vects['szfft_scl']
sl_vects = vects['slfft_scl']

#print("\nLearning three vectors of LENGTH components with identical values")
LENGTH=sz_vects.shape[0];
bytearray = c_int * LENGTH
vector=bytearray()


###Train the seizure data###
for i in range(sz_vects.shape[1]):
  for j in range(0,LENGTH):
    vector[j] = sz_vects[j, i];
  gvDll.Learn(vector, LENGTH, 1);

###Train the nonseizure data###
for i in range(sl_vects.shape[1]):
  for j in range(0,LENGTH):
    vector[j] = sl_vects[j, i];
  gvDll.Learn(vector, LENGTH, 2);

#for i in range(0,LENGTH):
#  vector[i]=20;
#gvDll.Learn(vector, LENGTH, 100);

print("\nDisplaying the neurons' content")
ncount=gvDll.CommittedNeurons();
print ("Committed neurons= " + repr(ncount)); #should return the value 3
gvDll.Write(1,13,16) #Set network to Save and Restore mode
gvDll.Write(1,12,0) #Resetchain to point at 1st committed neuron
component=bytearray()
for i in range(0,ncount):
  print("Neuron %u: [" % i),
  for i in range(0,LENGTH):
    print (gvDll.Read(1,1)),
  print ("]  AIF= %3u  CAT %3u" % (gvDll.Read(1,5),gvDll.Read(1,4) & 0x7FFF))
gvDll.Write(1,13,0) # Set network to Normal mode

print("\nRecognition of new vectors")

# initializing the variables to hold the result of a recognition
# with up to k responses of the top firing neurons, if applicable
k=ncount
bytearray = c_int * k
dists=bytearray()
cats=bytearray()
nids=bytearray()

#print("\nVector of components equal to 14. Uncertainty, but closer to neuron 2")
for i in range(sl_vects.shape[1]):
  for j in range(0,LENGTH):
    vector[j] = sl_vects[j, i];
  gvDll.Recognize(vector, LENGTH, k, byref(dists), byref(cats), byref(nids));
  for _ in range (0,k):
    print("dist= %u, cat= %u, nid= %u" % (dists[_],cats[_],nids[_]))
  print("The vector belongs to category: %u." % cats[0])

#print("\nVector of components equal to 12. Uncertainty, but closer to neuron 1")
#for i in range(0,LENGTH):
#  vector[i]=12;
#gvDll.Recognize(vector, LENGTH, k, byref(dists), byref(cats), byref(nids));
#for i in range (0,k):
#  print("dist= %u, cat= %u, nid= %u" % (dists[i],cats[i],nids[i]))