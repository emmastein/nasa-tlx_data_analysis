%% Load all .mat files, then find weighted workload score before graphing

%% Variables

subjects=[1:7 9 11:12];

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

%% load alphabet
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
    AUF(m).alphabet=transpose([placeHolder(1,:); placeHolder(3,:); placeHolder(2,:); placeHolder(4,:)]);
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
   alphabet_array(j,:)=mean(AUF(j).alphabet);
end



%% find workload score

for j = 1:length(subjects)
    wws(j,:)=sum(times(AUF(j).score{:,:},AUF(j).weight{:,:}))/15;
    uws(j,:)= mean(AUF(j).score{:,:}); % unweighted workload is just the average of all subscores
end


%% graphs

task_cat= categorical(["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);
task_cat=reordercats(task_cat,["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);

% figure(1)   %Unweighted workload 
% bar(task_cat,mean(uws,1))
% hold on
% er= errorbar(mean(uws,1),std(uws,1));
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
% ylabel('Rating')
% title('Unweighted workload scores')
% p=plot(task_cat,uws, '.-','MarkerSize',14);
% legend(p,leg)
% hold off
% 
% figure(2)   %weighted workload
% bar(task_cat,mean(wws,1))
% hold on
% er= errorbar(mean(wws,1),std(wws,1));
% er.Color = [0 0 0];  
% er.LineStyle = 'none';  
% ylabel("Rating")
% title("Weighted workload score")
% p=plot(task_cat,wws, '.-','MarkerSize',14);
% legend(p,leg)
% hold off
% 
% figure(3)   %Menatal demand
% bar(task_cat,mean(mental,1))
% hold on
% er= errorbar(mean(mental,1),std(mental,1));
% er.Color = [0 0 0];  
% er.LineStyle = 'none';  
% ylabel("Rating")
% title("Mental demand score")
% p=plot(task_cat,mental, '.-','MarkerSize',14);
% legend(p,leg)
% hold off
% 
% figure(4)   %Physical demand
% bar(task_cat,mean(physical,1))
% hold on
% er= errorbar(mean(physical,1),std(physical,1));
% er.Color = [0 0 0];  
% er.LineStyle = 'none';  
% ylabel("Rating")
% title("Physical demand score")
% p=plot(task_cat,physical, '.-','MarkerSize',14);
% legend(p,leg)
% hold off
% 
% figure(5)   %Temporal demand
% bar(task_cat,mean(temporal,1))
% hold on
% er= errorbar(mean(temporal,1),std(temporal,1));
% er.Color = [0 0 0];  
% er.LineStyle = 'none';  
% ylabel("Rating")
% title("Temporal demand score")
% p=plot(task_cat,temporal, '.-','MarkerSize',14);
% legend(p,leg)
% hold off
% 
% figure(6)   %Performance
% bar(task_cat,mean(performance,1))
% hold on
% er= errorbar(mean(performance,1),std(performance,1));
% er.Color = [0 0 0];  
% er.LineStyle = 'none';  
% ylabel("Rating")
% title("Performance score")
% p=plot(task_cat,performance, '.-','MarkerSize',14);
% legend(p,leg)
% hold off
% 
% figure(7)   %Effort
% bar(task_cat,mean(effort,1))
% hold on
% er= errorbar(mean(effort,1),std(effort,1));
% er.Color = [0 0 0];  
% er.LineStyle = 'none';  
% ylabel("Rating")
% title("Effort score")
% p=plot(task_cat,effort, '.-','MarkerSize',14);
% legend(p,leg)
% hold off
% 
% figure(8)   %frustration demand
% bar(task_cat,mean(frustration,1))
% hold on
% er= errorbar(mean(frustration,1),std(frustration,1));
% er.Color = [0 0 0];  
% er.LineStyle = 'none';  
% ylabel("Rating")
% title("Frustration score")
% p=plot(task_cat,frustration, '.-','MarkerSize',14);
% legend(p,leg)
% hold off

figure(9) %wws vs alphabet rate
p=plot(wws(:,1:4),alphabet_array(:,:),'.','MarkerSize',12);
legend(p,task_cat(1:4))

figure(10)  %uww vs alphabet rate
p=plot(uws(:,1:4),alphabet_array(:,:),'.','MarkerSize',12);
legend(p,task_cat(1:4))



