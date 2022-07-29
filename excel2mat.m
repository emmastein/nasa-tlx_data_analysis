%% loads data from excel documant and saves to a mat file

%% variables
clear;

subID=03;

%% load data 

fileName=sprintf("AUF%02dV01TLX",subID);
fileLocation=sprintf("C:\\Users\\emmaa\\Documents\\GitHub\\nasa-tlx_data_analysis\\try\\AUF%02d\\V01\\",subID);
filePlace=fileLocation+fileName+".xlsx";

subjectData=enterData(filePlace,subID);

%% save data

fileNameSave=append(fileLocation,fileName,".mat");
save(fileNameSave,'subjectData')
