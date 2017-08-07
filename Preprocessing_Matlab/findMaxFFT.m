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

figure(1)
hold on

for n = 2:20
        
        currentChannel =  (data(1726000*(n-1):1726000*n));

        freqData = detrend( currentChannel);
         % 256 point fft
        y_fft = fft(freqData ,128) ;
        % plotting of spectra
        p  = abs(y_fft.^2) ;
        df = Fs/Npoint_fft ;
        ff = 0:df:Fs/2-df ;
        %save(filename,'p');
        
        allFFT(n,:)= log(p(1:end/2)); 
        
        plot (ff,log(p(1:end/2)),'b')
        count = count+1;
    
end