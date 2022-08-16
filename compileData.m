%% Load all .mat files, then find weighted workload score before graphing

%% Variables

subjects=[1:4 5:7 9 11:12];

%% load tlx


j=1;
for k=subjects
    if j==1
        fileName=sprintf("AUF%02dV01RetestTLX.mat",k);
        fileLocation=sprintf("Z:\\Shuqi\\NirsAutomaticityStudy\\Data\\AUF%02d\\V01Retest\\",k);
        legend_name=sprintf("AUF01Retest"); % label for legend when graphing  
    else
        fileName=sprintf("AUF%02dV01TLX.mat",k);
        fileLocation=sprintf("Z:\\Shuqi\\NirsAutomaticityStudy\\Data\\AUF%02d\\V01\\",k);
        legend_name=sprintf("AUF%02d",k); % label for legend when graphing
    end
    load(fileLocation+fileName);   
    AUF(j)=subjectData; 
    leg(j)=legend_name; % label for legend when graphing
    j=j+1; %counter
end

%% load alphabet and fNIRS
m=1;
for k=subjects
    if m==1
        fileName=sprintf("AUF%02dV01RetestDTdata.mat",k);
        fileLocation=sprintf("Z:\\Shuqi\\NirsAutomaticityStudy\\Data\\AUF%02d\\V01Retest\\",k);
    else
        fileName=sprintf("AUF%02dV01DTdata.mat",k);
        fileLocation=sprintf("Z:\\Shuqi\\NirsAutomaticityStudy\\Data\\AUF%02d\\V01\\",k);
    end
    load(fileLocation+fileName);
    placeHolder=DTdata.data.alphabetRate;
    placeHolder2=DTdata.statsTables.tablePFC_All.T;
    placeHolder3=DTdata.data.walkSpeed;
    AUF(m).alphabet=transpose([placeHolder(1,:); placeHolder(3,:); placeHolder(2,:); placeHolder(4,:)]);    %place data in same order as TLX 
    AUF(m).fNIRS=transpose([placeHolder2(1:2,:); placeHolder2(8:10,:)]);    %place data in same order as tlx
    AUF(m).speed=transpose([placeHolder3(2,:); placeHolder3(4:5,:)]);
    m=m+1; %counter
end

%% grab indivual scores

for j=1:length(subjects)
   mental(j,:)=AUF(j).score{1,:};
   physical(j,:)=AUF(j).score{2,:};
   temporal(j,:)=AUF(j).score{3,:};
   performance(j,:)=AUF(j).score{4,:};
   effort(j,:)=AUF(j).score{5,:};
   frustration(j,:)=AUF(j).score{6,:};
   alphabetArray(j,:)=mean(AUF(j).alphabet,'omitnan'); %takes the average over availabe trials
   fNIRSArray(j,:)=AUF(j).fNIRS;
   speedArray(j,:)=mean(AUF(j).speed); %taking the average speed over all six trials
end



%% find workload score

for j = 1:length(subjects)
    wws(j,:)=sum(times(AUF(j).score{:,:},AUF(j).weight{:,:}))/15;
    uws(j,:)= mean(AUF(j).score{:,:}); % unweighted workload is just the average of all subscores
end

wws(4,:)= [nan nan nan nan nan]; % AUF04 incorrectly scored weights