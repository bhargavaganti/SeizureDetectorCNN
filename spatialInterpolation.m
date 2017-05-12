%% 
%Titus John
% May 5,2017

%This is used in the interpolation of the Wavelet fft data to the eeg
%spatial map 

%B1:B3 - n x eeg channel count
%sptialMap - xproj, yproj of spatial coordinates matched to the eeg Daata

function [epochImage]= spatialInterpolation (spatialMap, B1, B2, B3 )
   
   % These are the projections from the EEG coordinates 
   xProj = spatialMap(:,1);
   yProj = spatialMap(:,2);

    % The grid to interpolate the data too
    [xq,yq] = meshgrid(-16:.1:16, -16:.1:16);
    
    % Interpolation of the diffrent frequncies
    vq1 = griddata(xProj,yProj,B1,xq,yq,'cubic');
    vq2 = griddata(xProj,yProj,B2,xq,yq,'cubic');
    vq3 = griddata(xProj,yProj,B3,xq,yq,'cubic');
    
    
%     vq1 = normr(vq1); 
%     vq2 = normr(vq2); 
%     vq3 = normr(vq3); 

    % cat the diffrent channels to form the image
        epochImage = cat(3, vq1,vq2,vq3);
     
   %%  normalizedEpochImage 
        normimg = uint8(zeros(size(epochImage))); %// Allocate output image
        for idx = 1 : 3
            chan = epochImage(:,:,idx);
            minvalue = min(chan(:));
            maxvalue = max(chan(:));
            normimg(:,:,idx) = uint8((chan-minvalue)*255/(maxvalue-minvalue)); %// Cast back to uint8
        end
        
       epochImage = rgb2hsv(uint16(epochImage));

end


  
