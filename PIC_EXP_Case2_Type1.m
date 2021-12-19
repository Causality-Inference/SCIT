clear;
clc;
x=[1,2,3,4,5];

SCIT100 =  [    0.0450    0.0500    0.0580    0.0520    0.0560];
ReCIT100 = [    0.0429    0.0517    0.0570    0.0504    0.0509];
FRCIT100 = [    0.0450    0.0525    0.0487    0.0425    0.0450];
SCIT200 =  [    0.0490    0.0520    0.0560    0.0520    0.0490];
ReCIT200 = [    0.0484    0.0462    0.0462    0.0581    0.0484];
FRCIT200 = [    0.0460    0.0530    0.0483    0.0496    0.0474];

lw = 1;

plot(x,SCIT100,'*-r','LineWidth',lw);
hold on;
plot(x,SCIT200,'*--r','LineWidth',lw);
hold on;
plot(x,ReCIT100,'o-b','LineWidth',lw);
hold on;
plot(x,ReCIT200,'o--b','LineWidth',lw);
hold on;
plot(x,FRCIT100,'x-k','LineWidth',lw);
hold on;
plot(x,FRCIT200,'x--k','LineWidth',lw);
hold on;
grid on;
xlim([0.8,5.2]);
ylim([0.03,0.07]);
set(gca,'xtick',[1,2,3,4,5]);
set(gca,'ytick',[0.04 0.05 0.06]);
xlabel('Size of \itZ','Fontname','Times New Roman');
ylabel('Type I error rate','Fontname','Times New Roman');