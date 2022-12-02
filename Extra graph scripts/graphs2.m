close all;
clear ColorOrd colorOrder;
set(groot,'DefaultAxesColorOrder','default')



ColorOrderNirsAutomaticity

k=0;
for j=1:length(subjects)+1
    if j==9
        j=j+1;
    else
    k=k+1;
    ColorOrd(k,:)=colorOrder(j,:);
   
    end
end
set(groot,'DefaultAxesColorOrder',ColorOrd)

task_cat= categorical(["Stand 2" "Stand 3" "Walk 2" "Walk 3" "Walk"]);
task_cat=reordercats(task_cat,["Stand 2" "Stand 3" "Walk 2" "Walk 3" "Walk"]);
task_str= ["Stand2" "Stand3" "Walk2" "Walk3" "Walk"];
speed_str=["Walk2_Walk" "Walk3_Walk"];
alphabet_str=["Stand3_Stand2" "Walk2_Stand2" "Walk3_Stand2"];

%%delta speed and alpahbet

deltaSpeed=[speedArray(:,1)-speedArray(:,3) , speedArray(:,2)-speedArray(:,3)];
deltaAlphabet=[alphabetArray(:,2)-alphabetArray(:,1),alphabetArray(:,3)-alphabetArray(:,2),alphabetArray(:,4)-alphabetArray(:,1)];


%% ks test

for j=1:5
    results.norm.wws.(task_str(j))=kstest(wws(:,j)); 
    results.norm.uws.(task_str(j))=kstest(uws(:,j)); 
    results.norm.mental.(task_str(j))=kstest(mental(:,j));
    results.norm.temporal.(task_str(j))=kstest(temporal(:,j)); 
    results.norm.physical.(task_str(j))=kstest(physical(:,j));  
    results.norm.performance.(task_str(j))=kstest(performance(:,j));
    results.norm.effort.(task_str(j))=kstest(effort(:,j)); 
    results.norm.frustration.(task_str(j))=kstest(frustration(:,j)); 
    if j<3
        results.norm.deltaSpeed.(speed_str(j))=kstest(deltaSpeed(:,j));
        results.norm.speedArray.(task_str(j+2))=kstest(speedArray(:,j));
        results.norm.alphabetArray.(task_str(j))=kstest(alphabetArray(:,j));
        results.norm.deltaAlphabet.(alphabet_str(j))=kstest(deltaAlphabet(:,j));
    elseif j<4
        results.norm.speedArray.(task_str(j+2))=kstest(speedArray(:,j));
        results.norm.alphabetArray.(task_str(j))=kstest(alphabetArray(:,j));
        results.norm.deltaAlphabet.(alphabet_str(j))=kstest(deltaAlphabet(:,j));
    elseif j<5
        results.norm.alphabetArray.(task_str(j))=kstest(alphabetArray(:,j));  
    end
end

%% deltaSpeed Vs Workload

figure(30)
for i=1:2     
    subplot(1,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(uws(j,i+2),deltaSpeed(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('Change in Speed')
    xlabel('Workload rating')
    title(task_cat(i+2))
    hold off
end
legend(leg)
sgtitle('Unweighted Workload Score vs Change in Walk Speed')

figure(31)
for i=1:2     
    subplot(1,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(wws(j,i+2),deltaSpeed(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('Change in Speed')
    xlabel('Workload rating')
    title(task_cat(i+2))
    hold off
end
legend(leg)
sgtitle('Weighted Workload Score vs Change in Walk Speed')

figure(32)
for i=1:2     
    subplot(1,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(mental(j,i+2),deltaSpeed(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('Change in Speed')
    xlabel('Workload rating')
    title(task_cat(i+2))
    hold off
end
legend(leg)
sgtitle('Mental Demand Subscore vs Change in Walk Speed')

figure(33)
for i=1:2     
    subplot(1,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(temporal(j,i+2),deltaSpeed(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('Change in Speed')
    xlabel('Workload rating')
    title(task_cat(i+2))
    hold off
end
legend(leg)
sgtitle('Temporal Demand Subscore vs Change in Walk Speed')

figure(34)
for i=1:2     
    subplot(1,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(physical(j,i+2),deltaSpeed(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('Change in Speed')
    xlabel('Workload rating')
    title(task_cat(i+2))
    hold off
end
legend(leg)
sgtitle('Physical Demand Subscore vs Change in Walk Speed')

figure(35)
for i=1:2     
    subplot(1,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(performance(j,i+2),deltaSpeed(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('Change in Speed')
    xlabel('Workload rating')
    title(task_cat(i+2))
    hold off
end
legend(leg)
sgtitle('Performance Subscore vs Change in Walk Speed')

figure(36)
for i=1:2     
    subplot(1,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(effort(j,i+2),deltaSpeed(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('Change in Speed')
    xlabel('Workload rating')
    title(task_cat(i+2))
    hold off
end
legend(leg)
sgtitle('Effort Subscore vs Change in Walk Speed')

figure(37)
for i=1:2     
    subplot(1,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(frustration(j,i+2),deltaSpeed(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('Change in Speed')
    xlabel('Workload rating')
    title(task_cat(i+2))
    hold off
end
legend(leg)
sgtitle('Frustration Subscore vs Change in Walk Speed')

%% Change in Alphabet Rate vs workload

figure(4)
for i=2:4
    subplot(2,2,i)
    hold on
    for j=1:length(subjects)
        plot(wws(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12);
    end
    xlim([0 100])
    ylabel('Change in Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Weighted Workload Score vs Change in Alphabet Rate')

figure(5) %uws vs alphabet rate
for i=2:4
    subplot(2,2,i)
    hold on
    for j=1:length(subjects)
        plot(uws(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:)); 
    end
    xlim([0 100])
    ylabel('Change in Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Uweighted Workload Score vs Change in Alphabet Rate')

%Mental vs alphabet rate
figure(6)
for i=2:4
    subplot(2,2,i)
    hold on
    for j=1:length(subjects)
        plot(mental(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:))
    end
    xlim([0 100])
    ylabel('Change in Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Mental Demand Subscore vs Change in Alphabet Rate')

%Temporal vs alphabet rate
figure(7) 
for i=2:4
    subplot(2,2,i)
    hold on
    for j=1:length(subjects)
        plot(temporal(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('AlphabetRate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
 legend(leg)
sgtitle('Temporal Demand Subscore vs Change in Alphabet Rate')

%Physical vs alphabet rate
figure(8)
for i=2:4     
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(physical(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('AlphabetRate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Physical Demand Subscore vs Change in Alphabet Rate')

%performance vs alphabet rate
figure(9)
for i=2:4    
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(performance(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('Change in Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Performance Subscore vs Change in Alphabet Rate')

%Effort vs alphabet rate
figure(10)
for i=2:4     
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(effort(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('Change in Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Effort Subscore vs Change in Alphabet Rate')
 
%Frustration vs alphabet rate
figure(11)
for i=2:4   
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(frustration(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylabel('Change in Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Frustration Subscore vs Change in Alphabet Rate')

%% Correlations

%Workload vs change in alphabet rate

for j=2:4
    [r,pval]=corr(wws(:,j),deltaAlphabet(:,j-1),'rows','complete');
    [r2,pval2]=corr(wws(:,j),deltaAlphabet(:,j-1),'rows','complete','type','spearman');
    placeHolder4.wws(j,:)=[r pval r2 pval2];
    
    [r,pval]=corr(uws(:,j),deltaAlphabet(:,j-1),'rows','complete');
    [r2,pval2]=corr(uws(:,j),deltaAlphabet(:,j-1),'rows','complete','type','spearman');
    placeHolder4.uws(j,:)=[r pval r2 pval2];
    
    [r,pval]=corr(mental(:,j),deltaAlphabet(:,j-1));
    [r2,pval2]=corr(mental(:,j),deltaAlphabet(:,j-1),'type','spearman');
    placeHolder4.mental(j,:)=[r pval r2 pval2];
    
    [r,pval]=corr(temporal(:,j),deltaAlphabet(:,j-1));
    [r2,pval2]=corr(temporal(:,j),deltaAlphabet(:,j-1),'type','spearman');
    placeHolder4.temporal(j,:)=[r pval r2 pval2];   
    
    [r,pval]=corr(physical(:,j),deltaAlphabet(:,j-1));
    [r2,pval2]=corr(physical(:,j),deltaAlphabet(:,j-1),'type','spearman');
    placeHolder4.physical(j,:)=[r pval r2 pval2];    
    
    [r,pval]=corr(performance(:,j),deltaAlphabet(:,j-1));
    [r2,pval2]=corr(performance(:,j),deltaAlphabet(:,j-1),'type','spearman');
    placeHolder4.performance(j,:)=[r pval r2 pval2];    
    
    [r,pval]=corr(effort(:,j),deltaAlphabet(:,j-1));
    [r2,pval2]=corr(effort(:,j),deltaAlphabet(:,j-1),'type','spearman');
    placeHolder4.effort(j,:)=[r pval r2 pval2];
    
    [r,pval]=corr(frustration(:,j),deltaAlphabet(:,j-1));
    [r2,pval2]=corr(frustration(:,j),deltaAlphabet(:,j-1),'type','spearman');
    placeHolder4.frustration(j,:)=[r pval r2 pval2];
    
end

results.workloadVsDeltaAlphabet.wwsVsDeltaAlphabet=array2table(placeHolder4.wws(2:4,:),'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',alphabet_str);
results.workloadVsDeltaAlphabet.uwsVsDeltaAlphabet=array2table(placeHolder4.uws(2:4,:),'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',alphabet_str);
results.workloadVsDeltaAlphabet.mentalVsDeltaAlphabet=array2table(placeHolder4.mental(2:4,:),'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',alphabet_str);
results.workloadVsDeltaAlphabet.temporalVsDeltaAlphabet=array2table(placeHolder4.temporal(2:4,:),'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',alphabet_str);
results.workloadVsDeltaAlphabet.physicalVsDeltaAlphabet=array2table(placeHolder4.physical(2:4,:),'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',alphabet_str);
results.workloadVsDeltaAlphabet.performanceVsDeltaAlphabet=array2table(placeHolder4.temporal(2:4,:),'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',alphabet_str);
results.workloadVsDeltaAlphabet.effortVsDeltaAlphabet=array2table(placeHolder4.effort(2:4,:),'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',alphabet_str);
results.workloadVsDeltaAlphabet.frustrationVsDeltaAlphabet=array2table(placeHolder4.frustration(2:4,:),'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',alphabet_str);

clear placeHolder4;

% Workload vs change in speed
for j=1:2
    [r,pval]=corr(wws(:,j+2),deltaSpeed(:,j),'rows','complete');
    [r2,pval2]=corr(wws(:,j+2),deltaSpeed(:,j),'rows','complete','type','spearman');
    placeHolder4.wws(j,:)=[r pval r2 pval2];
    
    [r,pval]=corr(uws(:,j+2),deltaSpeed(:,j),'rows','complete');
    [r2,pval2]=corr(uws(:,j+2),deltaSpeed(:,j),'rows','complete','type','spearman');
    placeHolder4.uws(j,:)=[r pval r2 pval2];
    
    [r,pval]=corr(mental(:,j+2),deltaSpeed(:,j));
    [r2,pval2]=corr(mental(:,j+2),deltaSpeed(:,j),'type','spearman');
    placeHolder4.mental(j,:)=[r pval r2 pval2];
    
    [r,pval]=corr(temporal(:,j+2),deltaSpeed(:,j));
    [r2,pval2]=corr(temporal(:,j+2),deltaSpeed(:,j),'type','spearman');
    placeHolder4.temporal(j,:)=[r pval r2 pval2];   
    
    [r,pval]=corr(physical(:,j+2),deltaSpeed(:,j));
    [r2,pval2]=corr(physical(:,j+2),deltaSpeed(:,j),'type','spearman');
    placeHolder4.physical(j,:)=[r pval r2 pval2];    
    
    [r,pval]=corr(performance(:,j+2),deltaSpeed(:,j));
    [r2,pval2]=corr(performance(:,j+2),deltaSpeed(:,j),'type','spearman');
    placeHolder4.performance(j,:)=[r pval r2 pval2];    
    
    [r,pval]=corr(effort(:,j+2),deltaSpeed(:,j));
    [r2,pval2]=corr(effort(:,j+2),deltaSpeed(:,j),'type','spearman');
    placeHolder4.effort(j,:)=[r pval r2 pval2];
    
    [r,pval]=corr(frustration(:,j+2),deltaSpeed(:,j));
    [r2,pval2]=corr(frustration(:,j+2),deltaSpeed(:,j),'type','spearman');
    placeHolder4.frustration(j,:)=[r pval r2 pval2];
    
end

results.workloadVsDeltaSpeed.wwsVsDeltaSpeed=array2table(placeHolder4.wws,'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',speed_str);
results.workloadVsDeltaSpeed.uwsVsDeltaSpeed=array2table(placeHolder4.uws,'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',speed_str);
results.workloadVsDeltaSpeed.mentalVsDeltaSpeed=array2table(placeHolder4.mental,'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',speed_str);
results.workloadVsDeltaSpeed.temporalVsDeltaSpeed=array2table(placeHolder4.temporal,'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',speed_str);
results.workloadVsDeltaSpeed.physicalVsDeltaSpeed=array2table(placeHolder4.physical,'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',speed_str);
results.workloadVsDeltaSpeed.performanceVsDeltaSpeed=array2table(placeHolder4.temporal,'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',speed_str);
results.workloadVsDeltaSpeed.effortVsDeltaSpeed=array2table(placeHolder4.effort,'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',speed_str);
results.workloadVsDeltaSpeed.frustrationVsDeltaSpeed=array2table(placeHolder4.frustration,'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',speed_str);
  