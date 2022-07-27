%% loads data from excel documant and saves to a mat file

%% variables
subID=01;
fileLocation=("C:\Users\emmaa\Documents\GitHub\nasa-tlx_data_analysis\try\");
%% load data 

if subID<10
    fileName=sprintf("AUF0%dV01TLX",subID);
else 
    fileName=sprintf("AUF%dV01TLX",subID);
end

AUF=enterData(fileName,subID);

%% save data
fileNameSave=append(fileLocation,fileName,".mat");
save(fileNameSave,'AUF')
