% Trial 1
% addpath("C:\Users\emmaa\Documents\GitHub\nasa-tlx_data_analysis")
% How to save data/add in data
% Looking at struct files

%% Variable

subID=03;

%% import data

data=readtable("AUF03V01TLX");
reported_score=table2array(data(1:6,1:5));
reported_weight=string(table2array(data(:,6:8)));

%% add weights

weight_name=["mental", "physical", "temporal", "performance" ,"effort" ,"frustration"];
weight_string=join(reported_weight,1);

weight_count=[];
for i = 1:6
    weight_count(i,:)=count(weight_string,weight_name(i));
end

weight=[weight_count(:,1) weight_count(:,1) weight_count(:,2) weight_count(:,2) weight_count(:,3)];

%% add data to stuct
task_cat= categorical(["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);
task_cat=reordercats(task_cat,["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);
task_string=string(task_cat);
sub_score=string(["mental" "physical" "temporal" "perfromance" "effort" "frustration"]);


% AUF(99).score=array2table(reported_score,'VariableNames',[task_string] ,'rowNames',sub_score);
% AUF(99).weight=array2table(zeros(6:5),'VariableNames',[task_string] ,'rowNames',sub_score);
AUF(subID).score=reported_score;
AUF(subID).weight=weight;


%% find workload score

wws=[];
uws=[];
for j = 1:3
    wws(j,:)=sum(AUF(j).score.*AUF(j).weight)/15;
    uws(j,:)=sum(AUF(j).score)/15;
end

%% grab indivual scores
mental=[]


for k=1:6
   mental(j,:)=AUF(j).score(j,:) 
    
end

%% Graphs

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
bar(task_cat,mean(wws))
hold on
er= errorbar(mean(wws,1),std(wws,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Weighted workload score")
hold off

figure(3)   %Menatal demand
bar(task_cat,mean(wws))
hold on
er= errorbar(mean(wws,1),std(wws,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Weighted workload score")
hold off
