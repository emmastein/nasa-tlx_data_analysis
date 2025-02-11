%%graphs

task_cat= categorical(["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);
task_cat=reordercats(task_cat,["stand 2" "stand 3" "walk 2" "walk 3" "walk"]);

% figure(1)   %Unweighted workload 
% bar(task_cat,mean(uws,1))
% 
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
% subplot(2,3,1)
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
% subplot(2,3,2) %Physical demand
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
% subplot(2,3,3)   %Temporal demand
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
% subplot(2,3,4)   %Performance
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
% subplot(2,3,5)   %Effort
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
% subplot(2,3,6)  %frustration demand
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

% figure(9) %wws vs alphabet rate
% subplot(2,2,1)
% p=plot(wws(:,1),alphabetArray(:,1),'.','MarkerSize',12);
% xlim([0 100])
% ylabel('AlphabetRate')
% xlabel('Workload rating')
% title('Weighted workload scores vs Alphabet Rate: Stand 2')
% 
% subplot(2,2,2)
% p=plot(wws(:,2),alphabetArray(:,2),'.','MarkerSize',12);
% xlim([0 100])
% ylabel('AlphabetRate')
% xlabel('Workload rating')
% title('Weighted workload scores vs Alphabet Rate: Stand 3')
% 
% subplot(2,2,3)
% p=plot(wws(:,3),alphabetArray(:,3),'.','MarkerSize',12);
% xlim([0 100])
% ylabel('AlphabetRate')
% xlabel('Workload rating')
% title('Weighted workload scores vs Alphabet Rate: Walk 2')
% 
% subplot(2,2,4)
% p=plot(wws(:,4),alphabetArray(:,4),'.','MarkerSize',12);
% xlim([0 100])
% ylabel('AlphabetRate')
% xlabel('Workload rating')
% title('Weighted workload scores vs Alphabet Rate: Walk 3')


% figure(10)  %uww vs alphabet rate
% p=plot(uws(:,1:4),alphabetArray(:,:),'.','MarkerSize',12);
% xlim([0 100])
% ylabel('AlphabetRate')
% xlabel('Workload rating')
% title('Unweighted workload scores vs Alphabet Rate')
% legend(p,task_cat(1:4))
% 
% figure(11) %metnal demand vs alphabet rate
% p=plot(mental(:,1:4),alphabetArray(:,:),'.','MarkerSize',12);
% xlim([0 100])
% ylabel('AlphabetRate')
% xlabel('Workload rating')
% title('Mental Demand vs Alphabet Rate')
% legend(p,task_cat(1:4))
% 
% figure(12) %wws vs fnirs
% p=plot(wws(:,1),fNIRSArray(:,1),'.','MarkerSize',12);
% xlim([0 100])
% ylabel('fNIRS')
% xlabel('Workload rating')
% title('Weighted Workload vs fNIRS')

% 
% figure(13) %uws vs fnirs
% p=plot(uws(:,:),fNIRSArray(:,:),'.','MarkerSize',12);
% xlim([0 100])
% ylabel('fNIRS')
% xlabel('Workload rating')
% title('Unweighted Workload vs fNIRS')
% legend(p,task_cat)
% 
% figure(14) %mental vs fnirs
% p=plot(mental(:,:),fNIRSArray(:,:),'.','MarkerSize',12);
% xlim([0 100])
% ylabel('fNIRS')
% xlabel('Workload rating')
% title('Mental demand vs fNIRS')
% legend(p,task_cat)
% 
figure(15) %alphabet vs fnirs
p=plot(transpose(alphabetArray(:,:)),transpose(fNIRSArray(:,1:4)),'.','MarkerSize',12);
ylabel('fNIRS')
xlabel('alphabet rate')
title('fNIRS vs Alphabet Rate')
legend(p)
