%% Description
% This script taks the matched indicies and finds the corresponding
% xproj/yproj coordinates in the EEG coords file

%Titus John
%5/5/17

    
 %%

 function  [matchedCoords, matchedLabel] = matchEEGcoords(matchedIndicies, eegcoords)
 
    matchedCoords = [];
 
     for i =1: length(matchedIndicies(:,1))

            matchedLabel(i)= eegcoords.EEG(matchedIndicies(i));
            
            matchedCoords(i,1)= eegcoords.xproj(matchedIndicies(i)); 
            matchedCoords(i,2)= eegcoords.yproj(matchedIndicies(i));
            
     end
 
 end