clear;
clc;
x=[1,2,3,4,5];

SCIT100 =  [    0.0190    0.0218    0.0207    0.0202    0.0193];
ReCIT100 = [    0.0463    0.0442    0.0456    0.0478    0.0472];
FRCIT100 = [    0.1163    0.1163    0.1163    0.1250    0.1105];
SCIT200 =  [    0.0035    0.0053    0.0038    0.0042    0.0047];
ReCIT200 = [    0.0175    0.0181    0.0178    0.0190    0.0190];
FRCIT200 = [    0.0556    0.0556    0.0417    0.0451    0.0395];

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
ylim([-0.01,0.15]);
set(gca,'xtick',[1,2,3,4,5]);
set(gca,'ytick',[0 0.04 0.08 0.12]);
xlabel('Size of \itZ','Fontname','Times New Roman');
ylabel('Type II error rate','Fontname','Times New Roman');