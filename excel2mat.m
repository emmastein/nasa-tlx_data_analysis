%% loads data from excel documant and saves to a mat file

%% variables
clear;

subID=13;

%% load data 

if subID==1
    fileName=sprintf("AUF%02dV01RetestTLX",subID);
    fileLocation=sprintf("Z:\\Shuqi\\NirsAutomaticityStudy\\Data\\AUF%02d\\V01Retest\\",subID);
else
    fileName=sprintf("AUF%02dV01TLX",subID);
    fileLocation=sprintf("Z:\\Shuqi\\NirsAutomaticityStudy\\Data\\AUF%02d\\V01\\",subID);
end

filePlace=fileLocation+fileName+".xlsx";
subjectData=enterData(filePlace,subID);

%% save data

fileNameSave=append(fileLocation,fileName,".mat");
save(fileNameSave,'subjectData')
