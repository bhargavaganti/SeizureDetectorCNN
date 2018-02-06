%%%Grab EEG vectors data%%%
%Target the directory
list = dir('C:\Users\Shawn Ma\Documents\2017Summer\SeizureData\Epoch128\szEpochs');
%load all .mat files as a matrix
for i = 3:size(list, 1)
    filename = strcat(list(i).folder, '\', list(i).name);
    szfft(:,i-2) = importdata(filename);
end

%Target the directory
list = dir('C:\Users\Shawn Ma\Documents\2017Summer\SeizureData\Epoch128\sleepEpochs');
%load all .mat files as a matrix
for i = 3:size(list, 1)
    filename = strcat(list(i).folder, '\', list(i).name);
    slfft(:,i-2) = importdata(filename);
end

M_sz = max(szfft);M_sz = max(M_sz);
m_sz = min(szfft);m_sz = min(m_sz);
M_sl = max(slfft);M_sl = max(M_sl);
m_sl = min(slfft);m_sl = min(m_sl);
M = max(M_sz, M_sl); m = min(m_sz, m_sl);

scale = M - m;
szfft = (szfft - m) / scale * 255; szfft_scl = round(szfft);
slfft = (slfft - m) / scale * 255; slfft_scl = round(slfft);

save('szfft_scl.mat'); save('slfft_scl.mat');


