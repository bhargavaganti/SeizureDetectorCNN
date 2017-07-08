% Titus John 
% Childrens National Medical Center
% Jun 29,2017
%----------------------------------------------------
% Take the wave coefficents and convert it to a stacked image that is then
%fed into the classifier

% Stack the wave coefficents into a image that is 


% The wave coeffiicents are then translated into image for and the images
% are stacked together


% Have to stack image together to form overall image


% input
% input the wave coefficents for each of the channel epochs

% Output
% stacked image 


%----------------------------------------------------
function  [t,period,waveCatRows] = waveCoefstoStackedImage(wt, period,Fs)
   
    %Sampling specs
        dt = 1/Fs;
        Norig = Fs;
   
    % Specify the image dimensions 
            nRows = 21;
        
      % This specifys the overall time array over which the data is sampled
         t = 0:dt:(Norig*dt*nRows)-dt;
            for i =1:nRows
                if i ==1
                    waveCatRows = wt{i};
                else
                    waveCatRows = cat(2, wt{i},waveCatRows);
                end
            end

    
      
        
        

end
