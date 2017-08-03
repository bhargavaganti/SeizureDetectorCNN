% Titus John
% 7/21/2017
%%%%%%%%%%%%%%%%%%%%%%
% input -  
% Case Name
%Channel Number
%Epoch Numer
%Class -  Sleep/Sz
%Fs - Sampling Rate

% output - 

%files
%%%%%%%%%%%%%%%%%%%%%%

function splitMatixSaveLabeled(data) %(CaseName, ChannelNum, EpochNum, Class,Fs)


%     overallSamples = length(data);
%     timeSeconds = 1:1:(overallSamples/fs); 
    
    epochTime = 1;%seconds
    epochSize = epochTime*500; 
    
       
    clinicalStartedSamples = 8039.693 *500; 
    clinicalEndSamples = 8110.471 * 500;
    
    
    sleepStartSamples = 1;
    sleepEndSamples =  8039.693 *500; 
    
%     numSleepEpochs = floor(((sleepEndSamples - sleepStartSamples)/500)/epochTime)
%      
%          for i=1:numSleepEpochs
%              sleepFilename = strcat('sleep_',num2str(i),'.mat'); 
%              
%             if i == 1
%                 startSleepEpoch = sleepStartSamples
%                 endSleepEpoch = startSleepEpoch + epochSize
% 
%                  %assign the data
% %                 figure
% %                 plot(data( startSleepEpoch: endSleepEpoch ))
%                    sleepEpoch = data( startSleepEpoch: endSleepEpoch );
%                    save(sleepFilename, 'sleepEpoch');
%             end
% 
% 
%                 startSleepEpoch = endSleepEpoch; 
%                 endSleepEpoch = startSleepEpoch + epochSize; 
% 
%                  %assign the data
% %                 figure
% %                 plot(data( startSleepEpoch: endSleepEpoch ))
%                  sleepEpoch = data( startSleepEpoch: endSleepEpoch );
%                   save(sleepFilename, 'sleepEpoch');
% 
%           end
%    
     
     
   
    
    numSzEpochs = floor(((clinicalEndSamples - clinicalStartedSamples)/500)/epochTime)
    
    for i=1:numSzEpochs
        SZFilename = strcat('SZ_',num2str(i)); 
        
        if i == 1
            startSzEpoch = clinicalStartedSamples
            endSzEpoch = clinicalStartedSamples + epochSize
            
             %assign the data
%             figure
%             plot(data(startSzEpoch:endSzEpoch))

                   SZEpoch = (data(startSzEpoch:endSzEpoch));
                   save(SZFilename, 'SZEpoch');
           
        end
           
            
            startSzEpoch = endSzEpoch; 
            endSzEpoch = startSzEpoch + epochSize; 
            
             %assign the data
%             figure
%             plot(data(startSzEpoch:endSzEpoch))
                    SZEpoch = (data(startSzEpoch:endSzEpoch));
                   save(SZFilename, 'SZEpoch');
            
            
    end
   
        
        
    
    
    %filename = strcat(CaseName, ChannelNum, EpochNum, Class)

end

    
    
   