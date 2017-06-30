% Titus John 
% Childrens National Medical Center
% Jun 29,2017
%----------------------------------------------------
% This scipt takes the raw matched EEG data, does a wavelet transform, and
% spits of the coefficents for forming an spectral image 
% Input is the raw data sorted by the channels and the 
% This represent the data stream for the c3


% Output
%
%


%----------------------------------------------------

function [wt, period] = matchedEEGDatoWaveCoefs(matchedEEGData,Fs)
        Norig = numel(matchedEEGData(1,:)); %get the length of the epock
        dt = 1/Fs; % sampling period
        t = 0:dt:Norig*dt-dt; % get the sampling time
      
        for i = 1: length(matchedEEGData(:,1)) %number of channels where the data is looped
            currentChannel = matchedEEGData(i,:);  % This pulls the current channel from the 
            [wt{i}, period] = cwt(currentChannel,Fs);  % Wt will be size period x t
            
        end



end





