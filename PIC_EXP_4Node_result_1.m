clear;
clc;
x=[1,2,3,4,5];
SCIT  = [0.6133    0.9695    0.7302    0.7425    0.9891    0.8323    0.7944    0.9959    0.8699    0.8406    0.9939    0.9001    0.8643    0.9963    0.9157];
ReCIT = [0.5037    0.9360    0.6291    0.6803    0.9843    0.7859    0.7998    0.9890    0.8705    0.8634    0.9920    0.9137    0.8728    0.9854    0.9150];
FRCIT = [0.4462    0.9203    0.5747    0.6901    0.9806    0.7925    0.8005    0.9898    0.8714    0.8478    0.9879    0.9018    0.8702    0.9928    0.9182];
SCIT_Recall = SCIT([1,4,7,10,13]);
ReCIT_Recall = ReCIT([1,4,7,10,13]);
FRCIT_Recall = FRCIT([1,4,7,10,13]);
SCIT_Precision = SCIT([2,5,8,11,14]);
ReCIT_Precision = ReCIT([2,5,8,11,14]);
FRCIT_Precision = FRCIT([2,5,8,11,14]);
SCIT_F1 = SCIT([3,6,9,12,15]);
ReCIT_F1 = ReCIT([3,6,9,12,15]);
FRCIT_F1 = FRCIT([3,6,9,12,15]);

lw = 2;
plot(x,SCIT_Recall,'*-r','LineWidth',lw); 
hold on;
plot(x,SCIT_Precision,'*--r','LineWidth',lw);
hold on;
plot(x,SCIT_F1,'*:r','LineWidth',lw);
hold on;
plot(x,ReCIT_Recall,'o-b','LineWidth',lw);
hold on;
plot(x,ReCIT_Precision,'o--b','LineWidth',lw);
hold on;
plot(x,ReCIT_F1,'o:b','LineWidth',lw);
hold on;
plot(x,FRCIT_Recall,'x-k','LineWidth',lw);
hold on;
plot(x,FRCIT_Precision,'x--k','LineWidth',lw);
hold on;
plot(x,FRCIT_F1,'x:k','LineWidth',lw);
hold on;
grid on;
xlim([0.8,5.2]);
ylim([0.3,1.05]);
set(gca,'xtick',[1:1:5]);
set(gca,'xTickLabel',{25,50,100,150,200},'FontSize',15);
set(gca,'ytick',[0.4 0.6 0.8 1.0]);
xlabel('Sample size','FontSize',18,'Fontname','Times New Roman');
ylabel('Recall/Precision/F1','FontSize',18,'Fontname','Times New Roman');
legend('SCIT-Recall','SCIT-Precision','SCIT-F1','ReCIT-Recall','ReCIT-Precision','ReCIT-F1','KCIT-Recall','KCIT-Precision','KCIT-F1','Fontname','Times New Roman');