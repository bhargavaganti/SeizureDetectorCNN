
%%  eegDatatooSpatialRep
%Titus John
%May 4,2017


%Input 
%Raw EEG data(18-24 channels)
%Raw EEG data signal labels
%eeg labeled 2d projections

%Output
%Spatial representation of the EEG data


function [epochImage ] =  eegEpochtoSpatial (matchedEEGData, eeg2Dproj, Fs)

 %% Loop through each of the channels in the matched data
    [B1, B2, B3] = matchedEEGtooFreq(matchedEEGData, Fs);

 %%  Interpolate EEG data to spatial map 
    [epochImage ] = spatialInterpolation (eeg2Dproj, B1, B2, B3 );

end