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


Fs = 500 ;
duration = 0.001 ;
t = 0: 1/Fs:duration-(1/Fs) ;
f  = 1000 ;
Npoint_fft = 256 ;


figure(1)
title('Sleep')
hold on

for n = 1:21
        
        currentChannel =  sleepData(n,:);

        freqData = detrend( currentChannel);
         % 256 point fft
        y_fft = fft(freqData ,256) ;
        % plotting of spectra
        p  = abs(y_fft.^2) ;
        df = Fs/Npoint_fft ;
        ff = 0:df:Fs/2-df ;
        %save(filename,'p');
        
        allFFT(n,:)= log(p(1:end/2)); 
        
        plot (ff,log(p(1:end/2)),'b')
        count = count+1;
    
end

for n =1:length(allFFT(1,:))
        sleepMaxFFT(n) = max(allFFT(:,n)); 
        
end
    
    plot(ff, sleepMaxFFT,'r')






figure(2)
title('SZ')
hold on

for n = 1:21
        
        currentChannel =  szData(n,:);

        freqData = detrend( currentChannel);
         % 256 point fft
        y_fft = fft(freqData ,256) ;
        % plotting of spectra
        p  = abs(y_fft.^2) ;
        df = Fs/Npoint_fft ;
        ff = 0:df:Fs/2-df ;
        %save(filename,'p');
        
        allFFT(n,:)= log(p(1:end/2)); 
        
        plot (ff,log(p(1:end/2)),'b')
        count = count+1;
    
end

for n =1:length(allFFT(1,:))
        szMaxFFT(n) = max(allFFT(:,n)); 
        
end
    
    plot(ff, szMaxFFT,'r')