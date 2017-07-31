## Simple neuron test
## copyright(c) 2017 General Vision

import sys
import os
import ctypes
import scipy.io as sio
import numpy as np
from ctypes import *
from array import array

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

#Loading data
#---------------------------------------------

mat_contents = sio.loadmat('C:\Users\Xinyang\Desktop\slfft_scl.mat')
data_arr = mat_contents['slfft_scl']
data_mtr = np.asmatrix(data_arr)


#---------------------------------------------


#print("\nLearning three vectors of LENGTH components with identical values")
LENGTH=data_arr.shape[0];
QUANT = data_arr.shape[1]
bytearray = c_int * LENGTH
vector=bytearray()

for j in range(0, QUANT):
  for i in range(0,LENGTH):
    vector[i]=data_arr[i,j];
    #print vector[i]
  gvDll.Learn(vector, LENGTH, 1);
  print j


print("\nDisplaying the neurons' content")
ncount=gvDll.CommittedNeurons();
print ("Committed neurons= " + repr(ncount)); #should return the value 3
gvDll.Write(1,13,16) #Set network to Save and Restore mode
gvDll.Write(1,12,0) # Resetchain to point at 1st committed neuron
component=bytearray()
for i in range(0,ncount):
  print("Neuron %u: [" % i),
  for i in range(0,LENGTH):
    print (gvDll.Read(1,1)),
  print ("]  AIF= %3u  CAT %3u" % (gvDll.Read(1,5),gvDll.Read(1,4) & 0x7FFF))
gvDll.Write(1,13,0) # Set network to Normal mode

print("\nRecognition of new vectors")

