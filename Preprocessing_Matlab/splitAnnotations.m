function splitAnnotations
    files  = dir;
    
    for i = 3:length(dir)
                %Load the file into space and get the annotations into form
                currentFile = files(i).name 
                data = importdata(currentFile,'\n');
                
                %Split time and annotations 
                rawAnn = data{3};
                splitAnn = strsplit(rawAnn,'-');
                
                rawTime = data{1};
                splitTime = strsplit(rawTime,'-');
                
                %filename for saving timepicked data
                rawFileSplit= strsplit(currentFile,'annotation');
                fileNum = rawFileSplit{2}; 
                
                 sleepExist = 0; 
                 szStartExist = 0;
                 szEndExist = 0; 
                 
                 %look for the annotation ASLEEP SZ and ENDS
                for j =1:length(splitAnn)
                        currentAnnotation = splitAnn{j}; 

                       sleepk = findstr(currentAnnotation,'ASLEEP' );
                       szStartk = findstr(currentAnnotation, 'SZ' );
                       szEndk = findstr(currentAnnotation, 'ENDS' );
                       szEndk = findstr(currentAnnotation, 'END' );
            
                       
                        %pick of the indicies for the annotations of note
                                if   sleepk >0
                                    sleepIndex = j;
                                    sleepExist = 1; 
                                end

                                if    szStartk >0 
                                    szStartIndex = j;
                                    szStartExist = 1;
                                end
                                
                                if   szEndk >0
                                     szEndIndex = j;
                                      szEndExist = 1; 
                                end

                                 if sleepExist == 1
                                    sleepStartTime = splitTime{sleepIndex};
                                 end

                                 if szStartExist ==1
                                    szStartTime = splitTime{szStartIndex};
                                 end

                                 if szEndExist ==1
                                    szEndTime = splitTime{szEndIndex};
                                 end 
                   end
                    
                
                   if sleepExist == 1 && szStartExist ==1  && szEndExist ==1
                       'got here 1' 
                       eventStamps = strcat('Sleep','\t',sleepStartTime,'\t','SZ Start','\t',szStartTime,'\t','SZ End','\t',szEndTime )
                   else
                       'got here 2' 
                       eventStamps = strcat('SZ Start','\t',szStartTime,'\t','SZ End','\t',szEndTime )
                   end
                   
                        eventStampesFileName = strcat('eventStamps',fileNum);
                    
                        fid = fopen(eventStampesFileName ,'wt');
                        fprintf(fid, eventStamps);
                        fclose(fid);
                  
                
          
                 
    end
   
    
      
 
    
    
   
    
end