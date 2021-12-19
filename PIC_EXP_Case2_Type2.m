clear;
clc;
x=[1,2,3,4,5];

SCIT100 =  [    0.0268    0.1895    0.1953    0.1877    0.1676];
ReCIT100 = [    0.0617    0.2985    0.3309    0.3146    0.2965];
FRCIT100 = [    0.0811    0.2342    0.3359    0.3405    0.2746];
SCIT200 =  [    0.0050    0.0950    0.1077    0.1058    0.0934];
ReCIT200 = [    0.0110    0.2007    0.2154    0.2192    0.1860];
FRCIT200 = [    0.0833    0.1759    0.1746    0.1481    0.1254];

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
ylim([-0.02,0.4]);
set(gca,'xtick',[1,2,3,4,5]);
set(gca,'ytick',[0 0.1 0.2 0.3]);
xlabel('Size of \itZ','Fontname','Times New Roman');
ylabel('Type II error rate','Fontname','Times New Roman');