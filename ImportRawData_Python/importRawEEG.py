import os, sys
import pyedflib
import numpy as np
import numpy, scipy.io

for i in range (7,205):

    szNum = i;
    eventStampsFileNum = 'eventStamps' + str(i) +'.txt'
    eventFileName = '/media/titusaj/7B3CED566590EA15/ictal_SZ/EMU_SEIZURES_1-205/eventStamps/' + eventStampsFileNum
    print(eventFileName)



    fileNum = 'SZ_' + str(i)+'.edf'
    fileName = "/media/titusaj/7B3CED566590EA15/ictal_SZ/EMU_SEIZURES_1-205/"+fileNum;
    print(fileName)



    f = pyedflib.EdfReader(fileName)
    print('got here')
    n = f.signals_in_file
    signal_labels = f.getSignalLabels()
    sigbufs = np.zeros((21, f.getNSamples()[0]))
    signal_annotations = f.readAnnotations()
    for i in xrange(0,20):
        sigbufs[i, :] = f.readSignal(i)
    print(sigbufs.shape)



    f = open(eventFileName, 'r')
    l = f.readlines();
    print(l)

    elements = []
    SZStart =  []
    SZEnd = []
    checkSleep = 0

    for element in l:
        elements = element.split('\t')
        print(elements)




    if len(elements) == 4:
        SZStart = elements[1]
        SZEnd = elements[3]

    if len(elements) == 6:
        SleepStart=elements[1]
        SZStart = elements[3]
        SZEnd = elements[5]
        checkSleep = 1


    samplingRate = 500;
    epochSize = 3;


    print(SZStart)
    print(SZEnd)
    SZStart = round(float(SZStart),0)
    SZEnd = round(float(SZEnd),0)
    print(SZStart)
    print(SZEnd)

    SZStartSamples = int(SZStart*samplingRate)
    SZEndSamples = int(SZEnd*samplingRate)

    '''
    if checkSleep ==1:
        SleepStart = round(float(SleepStart),0)
        SleepStartSamples = SleepStart*samplingRate
        #Sleep Epochs
        epochSleepSampleSize = (samplingRate*epochSize)
        print(type(epochSleepSampleSize))
        totalSleepEpochs = int((SZStartSamples - SleepStartSamples)/epochSleepSampleSize)
        print(totalSleepEpochs)

        '''


    #Patient Epoch Folder
    patientEpochsDir = 'szNum'+str(szNum)
    os.mkdir(patientEpochsDir, 0755 );

    #Epoch Size
    epochSampleSize = (samplingRate*epochSize)

    #Sz Epochs
    totalSzEpochs = int((SZEndSamples - SZStartSamples)/epochSampleSize)
    print(totalSzEpochs)

    #Sz count
    szCount =1

    for x in xrange(1,totalSzEpochs):
        print('Epoch'+str(x))
        szEpochFilename = 'SZEpoch' +str(szNum)+'_'+str(x) + '.txt'
        channelData = sigbufs[:,int(SZStartSamples+szCount*x):int((SZStartSamples+szCount*x)+epochSampleSize)]
        szFilePathName = patientEpochsDir+'/' +szEpochFilename
        np.savetxt(szFilePathName, channelData, delimiter=',')
        szCount = szCount + 1;




    #Non-Sz Epochs
    totalNonSzEpochs = int((SZStartSamples-1)/epochSampleSize)
    print(totalNonSzEpochs)

    #Non-Sz count
    nonSzCount =1

    for x in xrange(1,totalNonSzEpochs):
        print('Epoch'+str(x))
        nonSzEpochFilename = 'NonSZEpoch'  +str(szNum)+'_'+str(x) + '.txt'
        channelData = sigbufs[:,int(1+nonSzCount*x):int((1*nonSzCount*x)+epochSampleSize)]
        nonSzFilePathName = patientEpochsDir+'/' +nonSzEpochFilename
        np.savetxt(nonSzFilePathName, channelData, delimiter=',')
        nonSzCount = nonSzCount + 1;



'''

    print(checkSleep)

    szCount =1
    sleepCount = 1

    if checkSleep == 0:
        for x in xrange(1,totalSzEpochs):
            print('Epoch'+str(x))
            szEpochFilename = 'SZEpoch' + str(i) + str(x) + '.txt'
            channelData = sigbufs[:,int(SZStartSamples+szCount*x):int((SZStartSamples+szCount*x)+epochSampleSize)]
            np.savetxt(szEpochFilename, channelData, delimiter=',')
            szCount = szCount + 1;

    if checkSleep == 1:
        for x in xrange(1,totalSzEpochs):
            print('Epoch'+str(x))
            szEpochFilename = 'SZEpoch' + str(i) + str(x) + '.txt'
            channelData = sigbufs[:,int(SZStartSamples+szCount*x):int((SZStartSamples+szCount*x)+epochSampleSize)]
            np.savetxt(szEpochFilename, channelData, delimiter=',')
            szCount = szCount + 1;

        for x in xrange(1,totalSleepEpochs):
            print('Epoch'+str(x))
            sleepEpochFilename = 'SleepEpoch' + str(i) +str(x) + '.txt'
            channelData = sigbufs[:,int(SleepStartSamples+sleepCount*x):int((SleepStartSamples+sleepCount*x)+epochSampleSize)]
            np.savetxt(sleepEpochFilename, channelData, delimiter=',')
            sleepCount = sleepCount + 1;

'''
