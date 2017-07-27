%Normalize the set
n = 66;
for i = 1:66
    filename = strcat('sleepFFT', num2str(i), '.mat');
    slfft(:,i) = importdata(filename);
end

slfft_lg = log(slfft);

M = max(slfft_lg);M = max(M);
m = min(slfft_lg);m = min(m);
scale = M - m;
slfft_lg = (slfft_lg - m) / scale * 255;
slfft_scl = round(slfft_lg);
%Feed it into Python
