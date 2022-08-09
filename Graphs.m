

task_cat= categorical(["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);
task_cat=reordercats(task_cat,["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);
legAlt=[leg(:,1:3) leg(:,5:end)];

%% Workload

figure(1)   %Unweighted workload 
bar(task_cat,mean(uws,1));
hold on
er= errorbar(mean(uws,1),std(uws,1));
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
ylabel('Rating')
title('Unweighted workload scores')
p=plot(task_cat,uws, '.-','MarkerSize',14);
legend(p,leg)
hold off

figure(2)   %weighted workload
bar(task_cat,mean(wws,1,'omitnan'))
hold on
er= errorbar(mean(wws,1,'omitnan'),std(wws,1,'omitnan'));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Weighted workload score")
p=plot(task_cat,[wws(1:3,:); wws(5:end,:)], '.-','MarkerSize',14);
legend(p,legAlt)
hold off

figure(3)   %Menatal demand
subplot(2,3,1)
bar(task_cat,mean(mental,1))
hold on
er= errorbar(mean(mental,1),std(mental,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Mental demand score")
p=plot(task_cat,mental, '.-','MarkerSize',14);
legend(p,leg)
hold off

subplot(2,3,2) %Physical demand
bar(task_cat,mean(physical,1))
hold on
er= errorbar(mean(physical,1),std(physical,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Physical demand score")
p=plot(task_cat,physical, '.-','MarkerSize',14);
legend(p,leg)
hold off

subplot(2,3,3)   %Temporal demand
bar(task_cat,mean(temporal,1))
hold on
er= errorbar(mean(temporal,1),std(temporal,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Temporal demand score")
p=plot(task_cat,temporal, '.-','MarkerSize',14);
legend(p,leg)
hold off

subplot(2,3,4)   %Performance
bar(task_cat,mean(performance,1))
hold on
er= errorbar(mean(performance,1),std(performance,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Performance score")
p=plot(task_cat,performance, '.-','MarkerSize',14);
legend(p,leg)
hold off

subplot(2,3,5)   %Effort
bar(task_cat,mean(effort,1))
hold on
er= errorbar(mean(effort,1),std(effort,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Effort score")
p=plot(task_cat,effort, '.-','MarkerSize',14);
legend(p,leg)
hold off

subplot(2,3,6)  %frustration demand
bar(task_cat,mean(frustration,1))
hold on
er= errorbar(mean(frustration,1),std(frustration,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Frustration score")
p=plot(task_cat,frustration, '.-','MarkerSize',14);
legend(p,leg)
hold off

%% Alphabet Rate

%wws vs alphabet rate
figure(9) 
subplot(2,2,1)
plot(wws(:,1),alphabetArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Weighted workload scores vs Alphabet Rate: Stand 2')

subplot(2,2,2)
plot(wws(:,2),alphabetArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Weighted workload scores vs Alphabet Rate: Stand 3')

subplot(2,2,3)
plot(wws(:,3),alphabetArray(:,3),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Weighted workload scores vs Alphabet Rate: Walk 2')

subplot(2,2,4)
plot(wws(:,4),alphabetArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Weighted workload scores vs Alphabet Rate: Walk 3')

figure(22) %uws vs alphabet rate
subplot(2,2,1)
plot(uws(:,1),alphabetArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Unweighted workload scores vs Alphabet Rate: Stand 2')

subplot(2,2,2)
plot(uws(:,2),alphabetArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Unweighted workload scores vs Alphabet Rate: Stand 3')

subplot(2,2,3)
plot(uws(:,3),alphabetArray(:,3),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Unweighted workload scores vs Alphabet Rate: Walk 2')

subplot(2,2,4)
plot(uws(:,4),alphabetArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Unweighted workload scores vs Alphabet Rate: Walk 3')

%Mental vs alphabet rate
figure(11) 
subplot(2,2,1)
plot(mental(:,1),alphabetArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Mental Demand scores vs Alphabet Rate: Stand 2')

subplot(2,2,2)
plot(mental(:,2),alphabetArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Mental Demand scores vs Alphabet Rate: Stand 3')

subplot(2,2,3)
plot(mental(:,3),alphabetArray(:,3),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Mental Demand scores vs Alphabet Rate: Walk 2')

subplot(2,2,4)
plot(mental(:,4),alphabetArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Mental Demand scores vs Alphabet Rate: Walk 3')

%Temporal vs alphabet rate
figure(23) 
subplot(2,2,1)
plot(temporal(:,1),alphabetArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Temporal Demand scores vs Alphabet Rate: Stand 2')

subplot(2,2,2)
plot(temporal(:,2),alphabetArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Temporal Demand scores vs Alphabet Rate: Stand 3')

subplot(2,2,3)
plot(temporal(:,3),alphabetArray(:,3),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Temporal Demand scores vs Alphabet Rate: Walk 2')

subplot(2,2,4)
plot(temporal(:,4),alphabetArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Temporal Demand scores vs Alphabet Rate: Walk 3')

%Physical vs alphabet rate
figure(24) 
subplot(2,2,1)
plot(physical(:,1),alphabetArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Physical Demand scores vs Alphabet Rate: Stand 2')

subplot(2,2,2)
plot(physical(:,2),alphabetArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Physical Demand scores vs Alphabet Rate: Stand 3')

subplot(2,2,3)
plot(physical(:,3),alphabetArray(:,3),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Physical Demand scores vs Alphabet Rate: Walk 2')

subplot(2,2,4)
plot(physical(:,4),alphabetArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Physical Demand scores vs Alphabet Rate: Walk 3')

%performance vs alphabet rate
figure(26) 
subplot(2,2,1)
plot(performance(:,1),alphabetArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Performance scores vs Alphabet Rate: Stand 2')

subplot(2,2,2)
plot(performance(:,2),alphabetArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Performance scores vs Alphabet Rate: Stand 3')

subplot(2,2,3)
plot(performance(:,3),alphabetArray(:,3),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Performance scores vs Alphabet Rate: Walk 2')

subplot(2,2,4)
plot(performance(:,4),alphabetArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Performance scores vs Alphabet Rate: Walk 3')

%Effort vs alphabet rate
figure(25) 
subplot(2,2,1)
plot(effort(:,1),alphabetArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Effort scores vs Alphabet Rate: Stand 2')

subplot(2,2,2)
plot(effort(:,2),alphabetArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Effort scores vs Alphabet Rate: Stand 3')

subplot(2,2,3)
plot(effort(:,3),alphabetArray(:,3),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Effort scores vs Alphabet Rate: Walk 2')

subplot(2,2,4)
plot(effort(:,4),alphabetArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Effort scores vs Alphabet Rate: Walk 3')
 
%Frustration vs alphabet rate
figure(27) 
subplot(2,2,1)
plot(frustration(:,1),alphabetArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Frustration scores vs Alphabet Rate: Stand 2')

subplot(2,2,2)
plot(frustration(:,2),alphabetArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Frustration scores vs Alphabet Rate: Stand 3')

subplot(2,2,3)
plot(frustration(:,3),alphabetArray(:,3),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Frustration scores vs Alphabet Rate: Walk 2')

subplot(2,2,4)
plot(frustration(:,4),alphabetArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('AlphabetRate')
xlabel('Workload rating')
title('Frustration scores vs Alphabet Rate: Walk 3')

%% fNirs

%wws vs fnirs
figure(12) 
subplot(2,3,1)
plot(wws(:,1),fNIRSArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Weighted Workload vs fNIRS: Stand 2')

subplot(2,3,2)
plot(wws(:,2),fNIRSArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Weighted Workload vs fNIRS: Stand 3')

subplot(2,3,4)
plot(wws(:,3),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Weighted Workload vs fNIRS: Walk 2')

subplot(2,3,5)
plot(wws(:,4),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Weighted Workload vs fNIRS: Walk 3')

subplot(2,3,6)
plot(wws(:,5),fNIRSArray(:,5),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Weighted Workload vs fNIRS: Walk')

%Uws vs fnirs
figure(11) 
subplot(2,3,1)
plot(uws(:,1),fNIRSArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Unweighted Workload vs fNIRS: Stand 2')

subplot(2,3,2)
plot(uws(:,2),fNIRSArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Unweighted Workload vs fNIRS: Stand 3')

subplot(2,3,4)
plot(uws(:,3),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Unweighted Workload vs fNIRS: Walk 2')

subplot(2,3,5)
plot(uws(:,4),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Unweighted Workload vs fNIRS: Walk 3')

subplot(2,3,6)
plot(uws(:,5),fNIRSArray(:,5),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Unweighted Workload vs fNIRS: Walk')

%Mental vs fnirs
figure(13) 
subplot(2,3,1)
plot(mental(:,1),fNIRSArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Mental Demand vs fNIRS: Stand 2')

subplot(2,3,2)
plot(mental(:,2),fNIRSArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Mental Demand vs fNIRS: Stand 3')

subplot(2,3,4)
plot(wws(:,3),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Mental Demand vs fNIRS: Walk 2')

subplot(2,3,5)
plot(wws(:,4),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Mental Demand vs fNIRS: Walk 3')

subplot(2,3,6)
plot(wws(:,5),fNIRSArray(:,5),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Mental Demand vs fNIRS: Walk')

%Physical vs fnirs
figure(16) 
subplot(2,3,1)
plot(physical(:,1),fNIRSArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Physical Demand vs fNIRS: Stand 2')

subplot(2,3,2)
plot(physical(:,2),fNIRSArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Physical Demand vs fNIRS: Stand 3')

subplot(2,3,4)
plot(physical(:,3),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Physical Demand vs fNIRS: Walk 2')

subplot(2,3,5)
plot(physical(:,4),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Physical Demand vs fNIRS: Walk 3')

subplot(2,3,6)
plot(physical(:,5),fNIRSArray(:,5),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Physical Demand vs fNIRS: Walk')

%Temporal vs fnirs
figure(17) 
subplot(2,3,1)
plot(temporal(:,1),fNIRSArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Temporal Demand vs fNIRS: Stand 2')

subplot(2,3,2)
plot(temporal(:,2),fNIRSArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Temporal Demand vs fNIRS: Stand 3')

subplot(2,3,4)
plot(temporal(:,3),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Temporal Demand vs fNIRS: Walk 2')

subplot(2,3,5)
plot(temporal(:,4),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Temporal Demand vs fNIRS: Walk 3')

subplot(2,3,6)
plot(temporal(:,5),fNIRSArray(:,5),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Temporal Demand vs fNIRS: Walk')

%Performmance vs fnirs
figure(18) 
subplot(2,3,1)
plot(performance(:,1),fNIRSArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Performance vs fNIRS: Stand 2')

subplot(2,3,2)
plot(performance(:,2),fNIRSArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Performance vs fNIRS: Stand 3')

subplot(2,3,4)
plot(performance(:,3),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Performance vs fNIRS: Walk 2')

subplot(2,3,5)
plot(performance(:,4),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Performance vs fNIRS: Walk 3')

subplot(2,3,6)
plot(performance(:,5),fNIRSArray(:,5),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Performance vs fNIRS: Walk')

%Effort vs fnirs
figure(19)
subplot(2,3,1)
plot(effort(:,1),fNIRSArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Effort vs fNIRS: Stand 2')

subplot(2,3,2)
plot(effort(:,2),fNIRSArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Effort vs fNIRS: Stand 3')

subplot(2,3,4)
plot(effort(:,3),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Effort vs fNIRS: Walk 2')

subplot(2,3,5)
plot(effort(:,4),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Effort vs fNIRS: Walk 3')

subplot(2,3,6)
plot(effort(:,5),fNIRSArray(:,5),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Effort vs fNIRS: Walk')

%Frustration vs fnirs
figure(20) 
subplot(2,3,1)
plot(frustration(:,1),fNIRSArray(:,1),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Frustration vs fNIRS: Stand 2')

subplot(2,3,2)
plot(frustration(:,2),fNIRSArray(:,2),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Frustration vs fNIRS: Stand 3')

subplot(2,3,4)
plot(frustration(:,3),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Frustration vs fNIRS: Walk 2')

subplot(2,3,5)
plot(frustration(:,4),fNIRSArray(:,4),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Frustration vs fNIRS: Walk 3')

subplot(2,3,6)
plot(frustration(:,5),fNIRSArray(:,5),'.','MarkerSize',12);
xlim([0 100])
ylabel('fNIRS')
xlabel('Workload rating')
title('Frustration vs fNIRS: Walk')

%% alphabet vs fNirs

figure(15) %alphabet vs fnirs
subplot(2,2,1)
plot(transpose(alphabetArray(:,1)),transpose(fNIRSArray(:,1)),'.','MarkerSize',12);
ylabel('fNIRS')
xlabel('alphabet rate')
title('fNIRS vs Alphabet Rate: Stand 2')

subplot(2,2,2)
plot(transpose(alphabetArray(:,2)),transpose(fNIRSArray(:,2)),'.','MarkerSize',12);
ylabel('fNIRS')
xlabel('alphabet rate')
title('fNIRS vs Alphabet Rate: Stand 3')

subplot(2,2,3)
plot(transpose(alphabetArray(:,3)),transpose(fNIRSArray(:,3)),'.','MarkerSize',12);
ylabel('fNIRS')
xlabel('alphabet rate')
title('fNIRS vs Alphabet Rate: Walk 2')

subplot(2,2,4)
plot(transpose(alphabetArray(:,4)),transpose(fNIRSArray(:,4)),'.','MarkerSize',12);
ylabel('fNIRS')
xlabel('alphabet rate')
title('fNIRS vs Alphabet Rate: Walk 3')





