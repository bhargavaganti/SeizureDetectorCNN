%% Spatial Conversion Master
%Titus John
%May 4, 2017
%%  Master script to take the parsed EEG and convert into the spatial maps of intrest

%%  Load meta data related to epilepsy data
Fs = 500; 
load('MetaData/matchedCoords.mat');


%% Used for meshing the raw image together
    % The grid to interpolate the data too
    [xq,yq] = meshgrid(-16:.1:16, -16:.1:16);

%% Have to spilt the raw data file into epochs for parsing


    for j =  40:60%(length(data)/500) %this corrponds to the overall length of the data being put in
        
        endIndex = j * 500; 
        startIndex= endIndex - 499; 
       
        
        
        matchedEEGData1 = data(1:19,startIndex:endIndex); % 1-19 correspond to the channels being pulled
        matchedEEGData2 = data(23:24,startIndex:endIndex); %  23-24 also correspond to channels being pulled
        matchedEEGData =   vertcat(matchedEEGData1, matchedEEGData2);

        [epochImage] =  eegEpochtoSpatial (matchedEEGData, matchedCoords, Fs);
        
         figure
         hold on
         %
        % imshow(epochImage)
         mesh(xq, yq, epochImage)
        
        allEpochImages{j} = epochImage;
        
        
    end