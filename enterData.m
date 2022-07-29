

function [subject]= enterData(fileName,j)
%enterDATA loads data from an excel sheet to a table in matlab


%% reads and seperates data from excel file

data=readtable(fileName);   %load file specifed in fileName
reported_score=table2array(data(1:6,1:5));  %break up data into the two seperate arrays: scores and weights
reported_weight=string(table2array(data(:,6:8)));

%% add weights

weight_name=["mental", "physical", "temporal", "performance" ,"effort" ,"frustration"];
weight_string=join(reported_weight,1); % Joins the reported weights together by columns

% the count functions adds up each time the weight appears in the string
weight_count=[];
for i = 1:6
    weight_count(i,:)=count(weight_string,weight_name(i));
end

%Checks to ensure weights add up to the correct number, if not a warning is given
if sum(weight_count,1)==[15 15 15]
else
    warning("Weights in AUF0%d do not add up to 15. Check spelling in the excel sheet for weights" ,j)
end

%Create a 3 by 5 array to match the size of score array
weight=[weight_count(:,1) weight_count(:,1) weight_count(:,2) weight_count(:,2) weight_count(:,3)];

%creates table that stores each particpants information in a table attached to a structure
task_cat= categorical(["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);
task_cat=reordercats(task_cat,["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);
task_string=string(task_cat);
sub_score=string(["mental" "physical" "temporal" "perfromance" "effort" "frustration"]);

subject.score=array2table(reported_score,'VariableNames',task_string ,'rowNames',sub_score);
subject.weight=array2table(weight,'VariableNames',task_string ,'rowNames',sub_score);

end

