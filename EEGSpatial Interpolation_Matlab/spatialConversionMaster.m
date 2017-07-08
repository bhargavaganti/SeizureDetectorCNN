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

figCounter = 1;

    for j =  1:10:80%(length(data)/500) %this corrponds to the overall length of the data being put in
        
         %Know at epoch 40 the seizure begins
        
        endIndex = j * 500; 
        startIndex= endIndex - 499; 
       
        
        
        matchedEEGData1 = data(1:19,startIndex:endIndex); % 1-19 correspond to the channels being pulled
        matchedEEGData2 = data(23:24,startIndex:endIndex); %  23-24 also correspond to channels being pulled
        matchedEEGData =   vertcat(matchedEEGData1, matchedEEGData2);
        
      

        
        [wt, period] = matchedEEGDatoWaveCoefs(matchedEEGData,Fs); %Takes the matched EEG data and 
        [t,period,waveCatRows] = waveCoefstoStackedImage(wt, period,Fs);
        
%         [epochImage] =  eegEpochtoSpatial (matchedEEGData, matchedCoords, Fs);
%         
%          figure
%          hold on
%          %
%         % imshow(epochImage)
%          fig = mesh(xq, yq, epochImage);
%         
%          figCounter = figCounter+1;
%          filename = strcat('fig',num2str(figCounter),'.png');
%          imwrite(epochImage,filename);
%          
%         allEpochImages{figCounter} = epochImage;

        figure
        imagesc(t,period, abs(waveCatRows));
        if j <40
            title('Non-Seizure')
        else
            title('Seizure')
        end
        
     
        
    end
    
