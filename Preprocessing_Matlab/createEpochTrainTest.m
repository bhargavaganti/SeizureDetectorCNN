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
    close all

    szFolderPath = strcat('/Users/titusjohn/Documents/GitHub/SeizureClassfication/szEpochs/')
    sleepFolderPath = strcat('/Users/titusjohn/Documents/GitHub/SeizureClassfication/sleepEpochs/')
    files = dir;
    
    

    for i =27
        
        %Get the parts of name of the SZ files
        patientFolder = strcat('/Users/titusjohn/Documents/GitHub/SeizureClassfication/szNum',num2str(i));
        cd (patientFolder)
        files = dir;
 
        lastFile = files(length(files)).name; 
        lastFileParts=strsplit(lastFile,'_')
            
        numFilePart = lastFileParts{1};
        temp = strsplit(numFilePart,'Epoch');
        szFileNum  =  temp{2};
         
         count = 1
          %Pick of the num of sz files
         for k =3:length(files)
                TF = contains(files(k).name,strcat('Non',lastFileParts{1}));
                
                
                if TF == 0
                   
                    currentSzFile = files(k).name;
                    count = count+1;
                    currentSzFileParts =strsplit( currentSzFile ,'_');
                    temp2 = strsplit( currentSzFileParts{2},'.');
                    szEpochFileNums(count) = str2num(temp2{1});
                end

          end
        
        
        
        szEpochsNum= max(szEpochFileNums); %this represents the number of sz epochs in the file
        
     
        
         figure(1)
         hold on
         title('SZ FFTs')
         xlabel('Frequncy')
         ylabel('Power')
         ylim([0 25])
            for j =1:szEpochsNum
                 szFileName = strcat('SZEpoch',num2str(szFileNum),'_', num2str(j) ,'.txt')
                 s= dir(szFileName);
                 if s.bytes > 100
                     rawSzData = csvread(szFileName);
                     szMaxFFT= findMaxFFT(rawSzData,'r');

                     szFileMat = strcat(szFolderPath,'SZEpoch',num2str(szFileNum),'_', num2str(j) ,'.mat');
                    % save(szFileMat, 'szMaxFFT');
                 end
            end
        
            
            
         %Pick of random files based on number sz files
          %10:1
          r = randi([1, length(files)-szEpochsNum-10],1,szEpochsNum*1);
        %(length(files)-szEpochsNum)
            
        
        figure(1)
        hold on 
        title('Merge FFTs')
        xlabel('Frequncy')
        ylabel('Power')
        ylim([0 25])
            for j =1:length(r)
                  sleepFileName = strcat('NonSZEpoch',num2str(szFileNum),'_', num2str(r(j)) ,'.txt')     
                  s= dir(sleepFileName);
                  if s.bytes> 100
                      rawSleepData = csvread(sleepFileName);
                      sleepMaxFFT= findMaxFFT(rawSleepData,'b');

                      sleepFileMat = strcat(sleepFolderPath,'NonSZEpoch',num2str(szFileNum),'_', num2str(r(j)) ,'.mat');             
                      %save(sleepFileMat, 'sleepMaxFFT')
                  end
            end
        
            
      figure(3)
      hold on 
      title('Merged Data')
      
      
      
      
    end
    
    
    
    
     

end