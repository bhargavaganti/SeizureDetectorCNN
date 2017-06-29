%% eegVectorize
%Titus John
%Jun 26, 2017
%%  Master script to take the parsed EEG and convert into the spatial maps of intrest
%Input: Will be the eeg data which is matrix n x m where n is the number of
%channels and m is the samples in the 

%%  Load meta data related to epilepsy data
Fs = 500; 
load('MetaData/matchedCoords.mat');

%% Have to spilt the raw data file into epochs for parsing


    for j =  40:60%(length(data)/500) %this corrponds to the overall length of the data being put in
        
        endIndex = j * 500; 
        startIndex= endIndex - 499; 
       
        
        
        matchedEEGData1 = data(1:19,startIndex:endIndex); % 1-19 correspond to the channels being pulled
        matchedEEGData2 = data(23:24,startIndex:endIndex); %  23-24 also correspond to channels being pulled
        matchedEEGData =   vertcat(matchedEEGData1, matchedEEGData2);

        [B1, B2, B3] = matchedEEGtooFreq(matchedEEGData, Fs); 
        
        
    end
