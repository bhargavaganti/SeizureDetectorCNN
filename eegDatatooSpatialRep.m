
%%  eegDatatooSpatialRep
%Titus John
%May 4,2017


%Input 
%Raw EEG data(18-24 channels
%Raw EEG data signal labels
%eeg labeled 2d projections

%Output
%Spatial representation of the EEG data


function [spatialRep] =  eegDatatooSpatialRep (eegDataRawdata, eegSignalLabels, eeg2Dproj)

fs=500; %Hz sampling rate of the EEG data 

%% Match the data from the EEG to the channel 2d proj map
[matchedEEGData] = matchRawEEGtoChannelMap(

%% Wavelet transform of the data channels
%BN will reprsent a magnitude by channel matrix
[B1, B2 B3] = matchedEEGtooBandWave(matchedEEGData, fs)

%%  Interpolate EEG data to spatial map 


end