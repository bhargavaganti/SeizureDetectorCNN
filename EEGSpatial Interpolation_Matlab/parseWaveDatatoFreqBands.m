%%  Filter wavelet data into the given frequncy bands

%Titus John
%May 4, 2017

%input

%output

function [B1, B2, B3] =  parseWaveDatatoFreqBands (P1, freq)
        
        P1= P1';
        freq = freq';

        B1check = 0;
        B2check = 0;
        B3check = 0;

        for i =1:length(freq)       

                if freq(i) > 1 && B1check ==0  %pick of the index where the freq value becomes greater than 7
                       B1(2) = i-1;
                       B1check = 1;
                end

                if freq(i) > 4 && B2check ==0  %pick of the index where the freq value becomes greater than 14      
                       B2(2) = i-1;
                       B2check = 1;
                end

                if freq(i)>10 && B3check ==0  %pick of the index where the freq value becomes greater than 49
                       B3(2) = i-1;
                       B3check = 1;
                end           

        end
     
        %set the starting point of the given data 
        B1(1) = 1; 
        B2(1) = B1(2) +1;
        B3(1) = B2(2) +1;
       
        
        %loop through the wave data to get the given wave data
        for i =1:3
            B = eval(strcat('B',num2str(i)));
            BChannelFreq = freq(B(1): B(2),:);
            BChannelP1= P1(B(1): B(2),:);
            
    
            if i==1
                B1 = trapz( BChannelFreq , BChannelP1 );
            elseif i==2
                B2= trapz( BChannelFreq , BChannelP1 );
            elseif i ==3
                B3 =  trapz( BChannelFreq , BChannelP1 );
            end
            
            
        end

end