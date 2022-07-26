

function [subject]= enterData(fileName,j)
%enterDATA adds data to stucture


%% reads and seperates data from excel file

data=readtable(fileName);
reported_score=table2array(data(1:6,1:5));
reported_weight=string(table2array(data(:,6:8)));

%% add weights

weight_name=["mental", "physical", "temporal", "performance" ,"effort" ,"frustration"];
weight_string=join(reported_weight,1); % Joins the reported weights together by columns

weight_count=[];
for i = 1:6
    weight_count(i,:)=count(weight_string,weight_name(i));
end

%Checks to ensure weights are correct
if sum(weight_count,1)==[15 15 15]
else
    warning("Check spelling in weights")
end

%Create a 3 by 5 array to match the size of score array
weight=[weight_count(:,1) weight_count(:,1) weight_count(:,2) weight_count(:,2) weight_count(:,3)];

subject(j).score=reported_score;
subject(j).weight=weight;
end

