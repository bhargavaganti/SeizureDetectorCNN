% Titus John
%  5- 11- 17
% Matched EEG to freq data
%% Info
%input
% matched EEG data to be pushed into

%output
%freq data representations of the data

%% Loop through each of the channels in the matched data

function [B1, B2, B3] = matchedEEGtooFreq(matchedEEGData, Fs)
            for i =1:length(matchedEEGData(:,1))

                 %Grab the current channel
                    eegChannel = matchedEEGData(i,:);

                 %Power Spectrum of current channel
                    Y = fft(eegChannel);
                    L = 500; % 1second epoch of data
                    P2 = abs(Y/L);
                    P1 = P2(1:L/2+1);
                    P1(2:end-1) = 2*P1(2:end-1);
                    freq = Fs*(0:(L/2))/L;

                %% fourier transform of the data channels
                [B1channel, B2channel, B3channel] =  parseWaveDatatoFreqBands (P1, freq); %BN will reprsent a magnitude by channel matrix 

                B1(i) = B1channel;
                B2(i) = B2channel;
                B3(i) = B3channel;
            end
end