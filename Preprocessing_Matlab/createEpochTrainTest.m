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
function parseEpochData

files = dir;

    for i =5
        
        %Get the parts of name of the SZ files
        szFolder = strcat('szNum',num2str(i));
        lastFile = files(length(files)).name; 
        lastFileParts=strsplit(lastFile,'_')
        
        
        
         numFilePart = lastFileParts{1};
         szFileNum  = str2num(numFilePart(end));
        
        
        numFilePart = lastFileParts{2};
        szEpochsNum= str2num(numFilePart(1)) %this represents the number of sz epochs in the file
        
     
        
         figure(1)
         hold on
         title('SZ FFTs')
            for j =1:szFileNum
                szFileName = strcat('SZEpoch',num2str(szFileNum),'_', num2str(j) ,'.txt')
                 rawSzData = csvread(szFileName);
                 szMaxFFT= findMaxFFT(rawSzData,'r');

            end
        
            
            
         %Pick of random files based on number sz files
          %10:1
            
            
            
        
        figure(2)
        hold on 
        title('SZ FFTs')
            for j =1:sleepFileNum
                 sleepFileName = strcat('SZEpoch',num2str(sleepFileNum),'_', num2str(j) ,'.txt')
                 rawSleepData = csvread(sleepFileName);
                 sleepMaxFFT= findMaxFFT(rawSleepData,'r');

            end
        
    end
    
    
    
    
     

end