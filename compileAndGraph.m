%% Load all .mat files, then find weighted workload score before graphing

%% Variables

subID=3;

%% load

for j=1:subID
    fileName=sprintf("AUF%02dV01TLX.mat",j);
    fileLocation=sprintf("C:\\Users\\emmaa\\Documents\\GitHub\\nasa-tlx_data_analysis\\try\\AUF%02d\\V01\\",j);
    load(fileLocation+fileName);
    AUF(j)=subjectData;
end

%% find workload score

for j = 1:subID
    wws(j,:)=sum(times(AUF(j).score{:,:},AUF(j).weight{:,:}))/15;
    uws(j,:)= mean(AUF(j).score{:,:});
end

%% grab indivual scores

for j=1:subID
   mental(j,:)=AUF(j).score{1,:};
   physical(j,:)=AUF(j).score{2,:};
   temporal(j,:)=AUF(j).score{3,:};
   performance(j,:)=AUF(j).score{4,:};
   effort(j,:)=AUF(j).score{5,:};
   frustration(j,:)=AUF(j).score{6,:};
end

%% graphs

task_cat= categorical(["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);
task_cat=reordercats(task_cat,["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);

figure(1)   %Unweighted workload 
bar(task_cat,mean(uws,1))
hold on
er= errorbar(mean(uws,1),std(uws,1));
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
ylabel('Rating')
title('Unweighted workload scores')
hold off

figure(2)   %weighted workload
bar(task_cat,mean(wws,1))
hold on
er= errorbar(mean(wws,1),std(wws,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Weighted workload score")
hold off

figure(3)   %Menatal demand
bar(task_cat,mean(mental,1))
hold on
er= errorbar(mean(mental,1),std(mental,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Mental demand score")
hold off

figure(4)   %Physical demand
bar(task_cat,mean(physical,1))
hold on
er= errorbar(mean(physical,1),std(physical,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Physical demand score")
hold off

figure(5)   %Temporal demand
bar(task_cat,mean(temporal,1))
hold on
er= errorbar(mean(temporal,1),std(temporal,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Temporal demand score")
hold off

figure(6)   %Performance
bar(task_cat,mean(performance,1))
hold on
er= errorbar(mean(performance,1),std(performance,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Performance score")
hold off

figure(7)   %Effort
bar(task_cat,mean(effort,1))
hold on
er= errorbar(mean(effort,1),std(effort,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Effort score")
hold off

figure(8)   %frustration demand
bar(task_cat,mean(frustration,1))
hold on
er= errorbar(mean(frustration,1),std(frustration,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Frustration score")
hold off
