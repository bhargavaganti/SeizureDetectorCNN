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

function    MaxFFT= findMaxFFT(rawData, linecolor)

Fs = 500 ;
duration = 0.001 ;
t = 0: 1/Fs:duration-(1/Fs) ;
f  = 1000 ;
Npoint_fft = 256 ;


% figure(1)
% title('Sleep')
% hold on


% for  i = 1:length(sleepData)/500
%         if i ==1
%             sleepEpochs{i} = sleepData(1:21,1:500);
%         else
%             sleepEpochs{i} = sleepData(1:21,500*(i-1):500*i);
%         end
%         
% end

 
 

    
        for n = 1:21
                currentChannel =  rawData(n,:);


                freqData = detrend( currentChannel);
                 % 256 point fft
                y_fft = fft(freqData ,256) ;
                % plotting of spectra
                p  = abs(y_fft.^2) ;
                df = Fs/Npoint_fft ;
                ff = 0:df:Fs/2-df ;
                %save(filename,'p');

                allFFT(n,:)= log(p(1:end/2)); 

             %   plot (ff,log(p(1:end/2)),'b')
               

        end
    
        for n =1:length(allFFT(1,:))
            MaxFFT(n) = max(allFFT(:,n)); 

        end


         plot(ff, MaxFFT,linecolor)
%         
%         allMaxFFTsz(i,:) = szMaxFFT;
    



% figure(3)
% hold on 
% for i=1: length(allMaxFFTSleep(:,1))
%     plot(ff,allMaxFFTsz(i,:),'r')
%       plot(ff,allMaxFFTSleep(i,:),'b')
% end


end
