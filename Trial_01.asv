% Trial 1
% addpath("C:\Users\emmaa\Documents\GitHub\nasa-tlx_data_analysis")
% How to save data/add in data
% Looking at struct files


%% import data

data=readtable("AUF01V01TLX");
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


%% find workload score

wws= sum(reported_score.*weight)/15;
uws=sum(reported_score)/15;

%% Graphs

task= categorical(["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);
task=reordercats(task,["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);

figure(1)
bar(task,uws)
xlabel("Task")
ylabel('Rating')
title('Unweighted workload scores')

figure(2)
bar(task,wws)
xlabel("Task")
ylabel("Rating")
title("Weighted workload score")



