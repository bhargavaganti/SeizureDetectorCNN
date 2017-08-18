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

    for i =5
        szFolder = strcat('szNum',num2str(i));
        lastFile = files(length(files)).name; 
        lastFileParts=strsplit(lastFile,'_')
        
        numFilePart = lastFileParts{2};
        szEpochsNum= str2num(numFilePart(1)) %this represents the number of sz epochs in the file
        
         numFilePart = lastFileParts{1};
         szFileNum  = str2num(numFilePart(end));
        
        
        for i =1:fileNum
            szFileName = strcat('SZEpoch',num2str(szFileNum),'_',num2str(szEpochsNum),'.txt')
        end
        
    end
    
     

end