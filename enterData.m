

function [subject]= enterData(fileName,j)
%enterDATA adds data to stucture


%% reads and seperates data from excel file

data=readtable(fileName);
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

subject(j).score=reported_score;
subject(j).weight=weight;
end

