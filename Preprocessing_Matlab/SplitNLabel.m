%%%%%Split and label%%%%%
% Xinyuan Ma (Shawn)
% 11/272017

%function  [sp_sig_data, sp_sig_label] = split_label(annfile, datafile)

%%
%%From annotation get seizure time

%Filename and dir
filename_ann = 'C:\Users\Shawn Ma\Desktop\csv_data\MG11111C_1-1+_data10_annotations.csv';
ann = importdata(filename_ann);

for i = 1:length(ann)
    
    sp_ann{i} = strsplit(ann{i},',');
    
end

for j = 2:length(sp_ann)
    
    if isempty(findstr(char(sp_ann{1,j}(2)), 'SZ')) == 0
        sz_start = str2num(char(sp_ann{1,j}(1)));
    end
    
    if isempty(findstr(char(sp_ann{1,j}(2)), 'END')) == 0
        sz_end = str2num(char(sp_ann{1,j}(1)));
    end
    
end


%%
%%Spliting and labeling
window_scl = 3;%6,9
freq = 500;
%filename_data = '';
%sig_data = importdata(filename_signals);

sig_data = importdata('C:\Users\Shawn Ma\Desktop\csv_data\MG11111C_1-1+_data10_data.csv'); 

%%effective channels select to be added
%eff_chl = array;
%sig_data = sig_data(:,eff_chl);

sig_data_t = size(sig_data.data,1); sig_data_chl = size(sig_data.data,2);
len = window_scl * freq;



for i = 1:floor(sig_data_t/len)-1
    
    sp_sig_data(:,:,i) = sig_data.data((i-1)*len+1:i*len, :);
    
    %judging time window within/without seizure onset time scale
    if ( sz_start < str2num(char(sig_data.rowheaders((i-1)*len+2))) && str2num(char(sig_data.rowheaders((i-1)*len+2))) < sz_end )|| ...
           ( sz_start < str2num(char(sig_data.rowheaders(i*len+2))) && str2num(char(sig_data.rowheaders(i*len+2)))  < sz_end )
       %seizure label for signal matrices 
       sp_sig_label(i) = true;
    else
        sp_sig_label(i) = false;
    end
    
end