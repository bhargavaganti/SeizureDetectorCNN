% Titus John 
% Childrens National Medical Center
% Jun 29,2017
%----------------------------------------------------
% This scipt takes the raw matched EEG data, does a wavelet transform, and
% spits of the coefficents for forming an spectral image 
% Input is the raw data sorted by the channels and the 
% This represent the data stream for the c


% Output
%
%


%----------------------------------------------------

function [waveletData] = matchedEEGDatoWaveCoefs(matchedEEGData,Fs)


    for i = 1: length(matchedEEGdata(:,1) %number of channels where the data is looped


        spectralData = cwt(data,Fs);
    end



end





