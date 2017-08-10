function splitAnnotations
    files  = dir;
    
    for i = 3:length(dir)
        %Load the file into space and get the annotations into form
        currentFile = files(i).name; 
        data = importdata(currentFile,'\n');
        rawAnn = data{3};
        splitAnn = strsplit(rawAnn,'-');
        
         %look for the annotation asleep SZ and ENDS
        for j =1:length(splitAnn)
            
        end
        
    end
    
   
    
end