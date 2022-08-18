close all;
clear ColorOrd colorOrder;
set(groot,'DefaultAxesColorOrder','default')

task_cat= categorical(["Stand 2" "Stand 3" "Walk 2" "Walk 3" "Walk"]);
task_cat=reordercats(task_cat,["Stand 2" "Stand 3" "Walk 2" "Walk 3" "Walk"]);
task_str= ["Stand2" "Stand3" "Walk2" "Walk3" "Walk"];
speed_str=["Walk2_Walk" "Walk3_Walk"];
alphabet_str=["Stand3_Stand2" "Walk2_Stand2" "Walk3_Stand2"];

deltaSpeed=[speedArray(:,1)-speedArray(:,3) , speedArray(:,2)-speedArray(:,3)];
deltaAlphabet=[alphabetArray(:,2)-alphabetArray(:,1),alphabetArray(:,3)-alphabetArray(:,1),alphabetArray(:,4)-alphabetArray(:,1)];

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

%% Workload

figure(1)   %Unweighted workload 
bar(task_cat,mean(uws,1));
hold on
er= errorbar(mean(uws,1),std(uws,1));
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
ylabel('Rating')
title('Unweighted workload scores')
set(gca,'ColorOrderIndex',1)
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
set(gca,'ColorOrderIndex',1)
p=plot(task_cat,wws, '.-','MarkerSize',14);
legend(p,leg)
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
set(gca,'ColorOrderIndex',1)
p=plot(task_cat,mental, '.-','MarkerSize',14);
hold off


subplot(2,3,2) %Physical demand
bar(task_cat,mean(physical,1))
hold on
er= errorbar(mean(physical,1),std(physical,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Physical demand score")
set(gca,'ColorOrderIndex',1)
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
set(gca,'ColorOrderIndex',1)
p=plot(task_cat,temporal, '.-','MarkerSize',14);
hold off

subplot(2,3,4)   %Performance
bar(task_cat,mean(performance,1))
hold on
er= errorbar(mean(performance,1),std(performance,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Performance score")
set(gca,'ColorOrderIndex',1)
p=plot(task_cat,performance, '.-','MarkerSize',14);
hold off

subplot(2,3,5)   %Effort
bar(task_cat,mean(effort,1))
hold on
er= errorbar(mean(effort,1),std(effort,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Effort score")
set(gca,'ColorOrderIndex',1)
p=plot(task_cat,effort, '.-','MarkerSize',14);
hold off

subplot(2,3,6)  %frustration demand
bar(task_cat,mean(frustration,1))
hold on
er= errorbar(mean(frustration,1),std(frustration,1));
er.Color = [0 0 0];  
er.LineStyle = 'none';  
ylabel("Rating")
title("Frustration score")
set(gca,'ColorOrderIndex',1)
p=plot(task_cat,frustration, '.-','MarkerSize',14);
legend(p,leg)
hold off

%% Alphabet Rate

%wws vs alphabet rate
figure(4)
for i=1:4
    subplot(2,2,i)
    hold on
    for j=1:length(subjects)
        plot(wws(j,i),alphabetArray(j,i),'.','MarkerSize',12);
    end
    xlim([0 100])
    ylim([.1 .7])
    ylabel('Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Weighted Workload Score vs Alphabet Rate')

figure(5) %uws vs alphabet rate
for i=1:4
    subplot(2,2,i)
    hold on
    for j=1:length(subjects)
        plot(uws(j,i),alphabetArray(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:)); 
    end
    xlim([0 100])
    ylim([.1 .7])
    ylabel('Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Uweighted Workload Score vs Alphabet Rate')

%Mental vs alphabet rate
figure(6)
for i=1:4
    subplot(2,2,i)
    hold on
    for j=1:length(subjects)
        plot(mental(j,i),alphabetArray(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:))
    end
    xlim([0 100])
    ylim([.1 .7])
    ylabel('Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Mental Demand Subscore vs Alphabet Rate')

%Temporal vs alphabet rate
figure(7) 
for i=1:4
    subplot(2,2,i)
    hold on
    for j=1:length(subjects)
        plot(temporal(j,i),alphabetArray(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([.1 .7])
    ylabel('AlphabetRate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
 legend(leg)
sgtitle('Temporal Demand Subscore vs Alphabet Rate')

%Physical vs alphabet rate
figure(8)
for i=1:4     
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(physical(j,i),alphabetArray(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([.1 .7])
    ylabel('AlphabetRate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Physical Demand Subscore vs Alphabet Rate')

%performance vs alphabet rate
figure(9)
for i=1:4     
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(performance(j,i),alphabetArray(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([.1 .7])
    ylabel('Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Performance Subscore vs Alphabet Rate')

%Effort vs alphabet rate
figure(10)
for i=1:4     
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(effort(j,i),alphabetArray(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([.1 .7])
    ylabel('Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Effort Subscore vs Alphabet Rate')
 
%Frustration vs alphabet rate
figure(11)
for i=1:4     
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(frustration(j,i),alphabetArray(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([.1 .7])
    ylabel('Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Frustration Subscore vs Alphabet Rate')

%% fNirs

%wws vs fnirs
figure(12)
k=1;
for i=1:6
    if i==3
    else
        subplot(2,3,i)     
        hold on
        for j=1:length(subjects)
            plot(wws(j,k),fNIRSArray(j,k),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
        end
        xlim([0 100])
        ylim([-5 11])
        ylabel('fNIRS')
        xlabel('Workload rating')
        title(task_cat(k))
        hold off
        k=k+1;
    end
end
legend(leg)
sgtitle('Weighted Workload Score vs fNIRS')

%Uws vs fnirs
figure(13) 
k=1; 
for i=1:6     
    if i==3     
    else
        subplot(2,3,i)              
        hold on         
        for j=1:length(subjects)
            plot(uws(j,k),fNIRSArray(j,k),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
        end
        xlim([0 100])
        ylim([-5 11])
        ylabel('fNIRS')
        xlabel('Workload rating')
        title(task_cat(k))
        hold off
        k=k+1;
    end
end
legend(leg)
sgtitle('Unweighted Workload Score vs fNIRS')

%Mental vs fnirs
figure(14) 
k=1; 
for i=1:6     
    if i==3     
    else
        subplot(2,3,i)              
        hold on         
        for j=1:length(subjects)
            plot(mental(j,k),fNIRSArray(j,k),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
        end
        xlim([0 100])
        ylim([-5 11])
        ylabel('fNIRS')
        xlabel('Workload rating')
        title(task_cat(k))
        hold off
        k=k+1;    
    end
end
legend(leg)
sgtitle('Mental Demand Subscore vs fNIRS')

%Physical vs fnirs
figure(15) 
k=1; 
for i=1:6     
    if i==3     
    else
        subplot(2,3,i)              
        hold on         
        for j=1:length(subjects)
            plot(physical(j,k),fNIRSArray(j,k),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
        end
        xlim([0 100])
        ylim([-5 11])
        ylabel('fNIRS')
        xlabel('Workload rating')
        title(task_cat(k))
        hold off
        k=k+1;    
    end
end
legend(leg)
sgtitle('Physical Demand Subscore vs fNIRS')

%Temporal vs fnirs
figure(16) 
k=1; 
for i=1:6     
    if i==3     
    else
        subplot(2,3,i)              
        hold on         
        for j=1:length(subjects)
            plot(temporal(j,k),fNIRSArray(j,k),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
        end
        xlim([0 100])
        ylim([-5 11])
        ylabel('fNIRS')
        xlabel('Workload rating')
        title(task_cat(k))
        hold off
        k=k+1;   
    end
end
legend(leg)
sgtitle('Temporal Demand Subscore vs fNIRS')

%Performmance vs fnirs
figure(17) 
k=1; 
for i=1:6     
    if i==3     
    else
        subplot(2,3,i)              
        hold on         
        for j=1:length(subjects)
            plot(performance(j,k),fNIRSArray(j,k),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
        end
        xlim([0 100])
        ylim([-5 11])
        ylabel('fNIRS')
        xlabel('Workload rating')
        title(task_cat(k))
        hold off
        k=k+1;   
    end
end
legend(leg)
sgtitle('Performance Subscore vs fNIRS')

%Effort vs fnirs
figure(18)
k=1; 
for i=1:6     
    if i==3     
    else
        subplot(2,3,i)              
        hold on         
        for j=1:length(subjects)
            plot(effort(j,k),fNIRSArray(j,k),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
        end
        xlim([0 100])
        ylim([-5 11])
        ylabel('fNIRS')
        xlabel('Workload rating')
        title(task_cat(k))
        hold off
        k=k+1;   
    end
end
legend(leg)
sgtitle('Effort Subscore vs fNIRS')

%Frustration vs fnirs
figure(19) 
k=1; 
for i=1:6     
    if i==3     
    else
        subplot(2,3,i)              
        hold on         
        for j=1:length(subjects)
            plot(frustration(j,k),fNIRSArray(j,k),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
        end
        xlim([0 100])
        ylim([-5 11])
        ylabel('fNIRS')
        xlabel('Workload rating')
        title(task_cat(k))
        hold off
        k=k+1;  
    end
end
legend(leg)
sgtitle('Frustration Subscore vs fNIRS')


%% alphabet vs fNirs

figure(20) %alphabet vs fnirs
for i=1:4     
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(transpose(alphabetArray(j,i)),transpose(fNIRSArray(j,i)),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    ylabel('fNIRS')
    xlabel('alphabet rate')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Alphabet Rate vs fNIRS')

%% Walk speed vs workload scores

% wws vs walk speed
figure(21) 
for i=3:5     
    subplot(1,3,i-2)     
    hold on     
    for j=1:length(subjects)
        plot(wws(j,i),speedArray(j,i-2),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([.4 1.2])
    ylabel('Walk Speed')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Weighted Workload Score vs Walk Speed')

figure(22) %uws vs walk speed
for i=3:5     
    subplot(1,3,i-2)     
    hold on     
    for j=1:length(subjects)
        plot(uws(j,i),speedArray(j,i-2),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([.4 1.2])
    ylabel('Walk Speed')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Unweighted Workload Score vs Walk Speed')

%Mental vs walk speed
figure(23) 
subplot(1,3,1)
for i=3:5     
    subplot(1,3,i-2)     
    hold on     
    for j=1:length(subjects)
        plot(mental(j,i),speedArray(j,i-2),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([.4 1.2])    
    ylabel('Walk Speed')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Mental Demand Subscore vs Walk Speed')

%Temporal vs walk speed
figure(24)
for i=3:5     
    subplot(1,3,i-2)     
    hold on     
    for j=1:length(subjects)
        plot(temporal(j,i),speedArray(j,i-2),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
       ylim([.4 1.2])
    ylabel('Walk Speed')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Temporal Demand Subscore vs Walk Speed')

%Physical vs walk speed
figure(25) 
subplot(1,3,1)
for i=3:5     
    subplot(1,3,i-2)     
    hold on     
    for j=1:length(subjects)
        plot(physical(j,i),speedArray(j,i-2),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([.4 1.2])    
    ylabel('Walk Speed')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Physical Demand Subscore vs Walk Speed')

%performance vs walk speed
figure(26)
for i=3:5     
    subplot(1,3,i-2)     
    hold on     
    for j=1:length(subjects)
        plot(performance(j,i),speedArray(j,i-2),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([.4 1.2]) 
    ylabel('Walk Speed')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Performance Subscore vs Walk Speed')

%Effort vs walk speed
figure(27)
for i=3:5     
    subplot(1,3,i-2)     
    hold on     
    for j=1:length(subjects)
        plot(effort(j,i),speedArray(j,i-2),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([.4 1.2])
    ylabel('Walk Speed')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Effort Subscore vs Walk Speed')

%Frustration vs walk speed
figure(28)

for i=3:5     
    subplot(1,3,i-2)     
    hold on     
    for j=1:length(subjects)
        plot(frustration(j,i),speedArray(j,i-2),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([.4 1.2])
    ylabel('Walk Speed')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Frustration Subscore vs Walk Speed')

%% deltaSpeed Vs Workload

figure(30)
for i=1:2     
    subplot(1,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(uws(j,i+2),deltaSpeed(j,i),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([-.4 0])
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
    ylim([-.4 0])
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
    ylim([-.4 0])
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
    ylim([-.4 0])
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
    ylim([-.4 0])
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
    ylim([-.4 0])
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
    ylim([-.4 0])
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
    ylim([-.4 0])
    ylabel('Change in Speed')
    xlabel('Workload rating')
    title(task_cat(i+2))
    hold off
end
legend(leg)
sgtitle('Frustration Subscore vs Change in Walk Speed')

%% Change in Alphabet Rate vs workload

figure(40)
for i=2:4
    subplot(2,2,i)
    hold on
    for j=1:length(subjects)
        plot(wws(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12);
    end
    xlim([0 100])
    ylim([-.25 .15])
    ylabel('Change in Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Weighted Workload Score vs Change in Alphabet Rate')

figure(45) %uws vs alphabet rate
for i=2:4
    subplot(2,2,i)
    hold on
    for j=1:length(subjects)
        plot(uws(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:)); 
    end
    xlim([0 100])
    ylim([-.25 .15])
    ylabel('Change in Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Uweighted Workload Score vs Change in Alphabet Rate')

%Mental vs alphabet rate
figure(46)
for i=2:4
    subplot(2,2,i)
    hold on
    for j=1:length(subjects)
        plot(mental(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:))
    end
    xlim([0 100])
    ylim([-.25 .15])
    ylabel('Change in Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Mental Demand Subscore vs Change in Alphabet Rate')

%Temporal vs alphabet rate
figure(47) 
for i=2:4
    subplot(2,2,i)
    hold on
    for j=1:length(subjects)
        plot(temporal(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([-.25 .15])
    ylabel('AlphabetRate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
 legend(leg)
sgtitle('Temporal Demand Subscore vs Change in Alphabet Rate')

%Physical vs alphabet rate
figure(48)
for i=2:4     
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(physical(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([-.25 .15])
    ylabel('AlphabetRate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Physical Demand Subscore vs Change in Alphabet Rate')

%performance vs alphabet rate
figure(49)
for i=2:4    
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(performance(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([-.25 .15])
    ylabel('Change in Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Performance Subscore vs Change in Alphabet Rate')

%Effort vs alphabet rate
figure(50)
for i=2:4     
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(effort(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([-.25 .15])
    ylabel('Change in Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Effort Subscore vs Change in Alphabet Rate')
 
%Frustration vs alphabet rate
figure(51)
for i=2:4   
    subplot(2,2,i)     
    hold on     
    for j=1:length(subjects)
        plot(frustration(j,i),deltaAlphabet(j,i-1),'.','MarkerSize',12,'color' ,ColorOrd(j,:));
    end
    xlim([0 100])
    ylim([-.25 .15])
    ylabel('Change in Alphabet Rate')
    xlabel('Workload rating')
    title(task_cat(i))
    hold off
end
legend(leg)
sgtitle('Frustration Subscore vs Change in Alphabet Rate')

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


%% Correlations

% workload vs alphabet
for j=1:4
    [r,pval]=corr(wws(:,j),alphabetArray(:,j),'rows','complete');
    results.pear.WwsAlphabet(j,:)=[r,pval];
    [r,pval]=corr(uws(:,j),alphabetArray(:,j));
    results.pear.UwsAlphabet(j,:)=[r,pval];
    [r,pval]=corr(mental(:,j),alphabetArray(:,j));
    results.pear.MentalAlphabet(j,:)=[r,pval];
    [r,pval]=corr(physical(:,j),alphabetArray(:,j));
    results.pear.PhysicalAlphabet(j,:)=[r,pval];
    [r,pval]=corr(temporal(:,j),alphabetArray(:,j));
    results.pear.TemporalAlphabet(j,:)=[r,pval];
    [r,pval]=corr(performance(:,j),alphabetArray(:,j));
    results.pear.PerformanceAlphabet(j,:)=[r,pval];
    [r,pval]=corr(effort(:,j),alphabetArray(:,j));
    results.pear.EffortAlphabet(j,:)=[r,pval];
    [r,pval]=corr(frustration(:,j),alphabetArray(:,j));
    results.pear.FrustrationAlphabet(j,:)=[r,pval];
    
    [r,pval]=corr(wws(:,j),alphabetArray(:,j),'rows','complete','type','spearman');
    results.spear.WwsAlphabet(j,:)=[r,pval];
    [r,pval]=corr(uws(:,j),alphabetArray(:,j),'type','spearman');
    results.spear.UwsAlphabet(j,:)=[r,pval];
    [r,pval]=corr(mental(:,j),alphabetArray(:,j),'type','spearman');
    results.spear.MentalAlphabet(j,:)=[r,pval];
    [r,pval]=corr(physical(:,j),alphabetArray(:,j),'type','spearman');
    results.spear.PhysicalAlphabet(j,:)=[r,pval];
    [r,pval]=corr(temporal(:,j),alphabetArray(:,j),'type','spearman');
    results.spear.TemporalAlphabet(j,:)=[r,pval];
    [r,pval]=corr(performance(:,j),alphabetArray(:,j),'type','spearman');
    results.spear.PerformanceAlphabet(j,:)=[r,pval];
    [r,pval]=corr(effort(:,j),alphabetArray(:,j),'type','spearman');
    results.spear.EffortAlphabet(j,:)=[r,pval];
    [r,pval]=corr(frustration(:,j),alphabetArray(:,j),'type','spearman');
    results.spear.FrustrationAlphabet(j,:)=[r,pval];
end

results.workloadVsAlphabet.wwsVsAlphabet=array2table([results.pear.WwsAlphabet results.spear.WwsAlphabet],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(1:4)));
results.workloadVsAlphabet.uwsVsAlphabet=array2table([results.pear.UwsAlphabet results.spear.UwsAlphabet],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(1:4)));
results.workloadVsAlphabet.mentalVsAlphabet=array2table([results.pear.MentalAlphabet results.spear.MentalAlphabet],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(1:4)));
results.workloadVsAlphabet.temporalVsAlphabet=array2table([results.pear.TemporalAlphabet results.spear.TemporalAlphabet],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(1:4)));
results.workloadVsAlphabet.physicalVsAlphabet=array2table([results.pear.PhysicalAlphabet results.spear.PhysicalAlphabet],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(1:4)));
results.workloadVsAlphabet.performanceVsAlphabet=array2table([results.pear.PerformanceAlphabet results.spear.PerformanceAlphabet],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(1:4)));
results.workloadVsAlphabet.effortVsAlphabet=array2table([results.pear.EffortAlphabet results.spear.EffortAlphabet],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(1:4)));
results.workloadVsAlphabet.frustrationVsAlphabet=array2table([results.pear.FrustrationAlphabet results.spear.FrustrationAlphabet],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(1:4)));

% workload vs fNIRS
for j=1:5
    [r,pval]=corr(wws(:,j),fNIRSArray(:,j),'rows','complete');
    results.pear.WwsfNIRS(j,:)=[r,pval];
    [r,pval]=corr(uws(:,j),fNIRSArray(:,j));
    results.pear.UwsfNIRS(j,:)=[r,pval];
    [r,pval]=corr(mental(:,j),fNIRSArray(:,j));
    results.pear.MentalfNIRS(j,:)=[r,pval];
    [r,pval]=corr(physical(:,j),fNIRSArray(:,j));
    results.pear.PhysicalfNIRS(j,:)=[r,pval];
    [r,pval]=corr(temporal(:,j),fNIRSArray(:,j));
    results.pear.TemporalfNIRS(j,:)=[r,pval];
    [r,pval]=corr(performance(:,j),fNIRSArray(:,j));
    results.pear.PerformancefNIRS(j,:)=[r,pval];
    [r,pval]=corr(effort(:,j),fNIRSArray(:,j));
    results.pear.EffortfNIRS(j,:)=[r,pval];
    [r,pval]=corr(frustration(:,j),fNIRSArray(:,j));
    results.pear.FrustrationfNIRS(j,:)=[r,pval];
    
    [r,pval]=corr(wws(:,j),fNIRSArray(:,j),'rows','complete','type','spearman');
    results.spear.WwsfNIRS(j,:)=[r,pval];
    [r,pval]=corr(uws(:,j),fNIRSArray(:,j),'type','spearman');
    results.spear.UwsfNIRS(j,:)=[r,pval];
    [r,pval]=corr(mental(:,j),fNIRSArray(:,j),'type','spearman');
    results.spear.MentalfNIRS(j,:)=[r,pval];
    [r,pval]=corr(physical(:,j),fNIRSArray(:,j),'type','spearman');
    results.spear.PhysicalfNIRS(j,:)=[r,pval];
    [r,pval]=corr(temporal(:,j),fNIRSArray(:,j),'type','spearman');
    results.spear.TemporalfNIRS(j,:)=[r,pval];
    [r,pval]=corr(performance(:,j),fNIRSArray(:,j),'type','spearman');
    results.spear.PerformancefNIRS(j,:)=[r,pval];
    [r,pval]=corr(effort(:,j),fNIRSArray(:,j),'type','spearman');
    results.spear.EffortfNIRS(j,:)=[r,pval];
    [r,pval]=corr(frustration(:,j),fNIRSArray(:,j),'type','spearman');
    results.spear.FrustrationfNIRS(j,:)=[r,pval];
end

results.workloadVsfNIRS.wwsVsfNIRS=array2table([results.pear.WwsfNIRS results.spear.WwsfNIRS],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat));
results.workloadVsfNIRS.uwsVsfNIRS=array2table([results.pear.UwsfNIRS results.spear.UwsfNIRS],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat));
results.workloadVsfNIRS.mentalVsfNIRS=array2table([results.pear.MentalfNIRS results.spear.MentalfNIRS],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat));
results.workloadVsfNIRS.temporalVsfNIRS=array2table([results.pear.TemporalfNIRS results.spear.TemporalfNIRS],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat));
results.workloadVsfNIRS.physicalVsfNIRS=array2table([results.pear.PhysicalfNIRS results.spear.PhysicalfNIRS],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat));
results.workloadVsfNIRS.performanceVsfNIRS=array2table([results.pear.PerformancefNIRS results.spear.PerformancefNIRS],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat));
results.workloadVsfNIRS.effortVsfNIRS=array2table([results.pear.EffortfNIRS results.spear.EffortfNIRS],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat));
results.workloadVsfNIRS.frustrationVsfNIRS=array2table([results.pear.FrustrationfNIRS results.spear.FrustrationfNIRS],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat));

%workload vs walk speed
for j=3:5    
    [r,pval]=corr(wws(:,j),speedArray(:,j-2),'rows','complete');
    results.pear.WwsSpeed(j,:)=[r,pval];
    [r,pval]=corr(uws(:,j),speedArray(:,j-2));
    results.pear.UwsSpeed(j,:)=[r,pval];
    [r,pval]=corr(mental(:,j),speedArray(:,j-2));
    results.pear.MentalSpeed(j,:)=[r,pval];
    [r,pval]=corr(physical(:,j),speedArray(:,j-2));
    results.pear.PhysicalSpeed(j,:)=[r,pval];
    [r,pval]=corr(temporal(:,j),speedArray(:,j-2));
    results.pear.TemporalSpeed(j,:)=[r,pval];
    [r,pval]=corr(performance(:,j),speedArray(:,j-2));
    results.pear.PerformanceSpeed(j,:)=[r,pval];
    [r,pval]=corr(effort(:,j),speedArray(:,j-2));
    results.pear.EffortSpeed(j,:)=[r,pval];
    [r,pval]=corr(frustration(:,j),speedArray(:,j-2));
    results.pear.FrustrationSpeed(j,:)=[r,pval];
    
    [r,pval]=corr(wws(:,j),speedArray(:,j-2),'rows','complete','type','spearman');
    results.spear.WwsSpeed(j,:)=[r,pval];
    [r,pval]=corr(uws(:,j),speedArray(:,j-2),'type','spearman');
    results.spear.UwsSpeed(j,:)=[r,pval];
    [r,pval]=corr(mental(:,j),speedArray(:,j-2),'type','spearman');
    results.spear.MentalSpeed(j,:)=[r,pval];
    [r,pval]=corr(physical(:,j),speedArray(:,j-2),'type','spearman');
    results.spear.PhysicalSpeed(j,:)=[r,pval];
    [r,pval]=corr(temporal(:,j),speedArray(:,j-2),'type','spearman');
    results.spear.TemporalSpeed(j,:)=[r,pval];
    [r,pval]=corr(performance(:,j),speedArray(:,j-2),'type','spearman');
    results.spear.PerformanceSpeed(j,:)=[r,pval];
    [r,pval]=corr(effort(:,j),speedArray(:,j-2),'type','spearman');
    results.spear.EffortSpeed(j,:)=[r,pval];
    [r,pval]=corr(frustration(:,j),speedArray(:,j-2),'type','spearman');
    results.spear.FrustrationSpeed(j,:)=[r,pval];
end

results.workloadVsSpeed.wwsVsSpeed=array2table([results.pear.WwsSpeed(3:5,:) results.spear.WwsSpeed(3:5,:)],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(3:5)));
results.workloadVsSpeed.uwsVsSpeed=array2table([results.pear.UwsSpeed(3:5,:) results.spear.UwsSpeed(3:5,:)],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(3:5)));
results.workloadVsSpeed.mentalVsSpeed=array2table([results.pear.MentalSpeed(3:5,:) results.spear.MentalSpeed(3:5,:)],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(3:5)));
results.workloadVsSpeed.temporalVsSpeed=array2table([results.pear.TemporalSpeed(3:5,:) results.spear.TemporalSpeed(3:5,:)],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(3:5)));
results.workloadVsSpeed.physicalVsSpeed=array2table([results.pear.PhysicalSpeed(3:5,:) results.spear.PhysicalSpeed(3:5,:)],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(3:5)));
results.workloadVsSpeed.performanceVsSpeed=array2table([results.pear.PerformanceSpeed(3:5,:) results.spear.PerformanceSpeed(3:5,:)],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(3:5)));
results.workloadVsSpeed.effortVsSpeed=array2table([results.pear.EffortSpeed(3:5,:) results.spear.EffortSpeed(3:5,:)],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(3:5)));
results.workloadVsSpeed.frustrationVsSpeed=array2table([results.pear.FrustrationSpeed(3:5,:) results.spear.FrustrationSpeed(3:5,:)],'VariableNames',string(["Pearson's r","Pearson's pval","Spearman's r","Spearman's pval"]),'rowNames',string(task_cat(3:5)));

results=rmfield(results, ["pear" "spear"]);

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

