clear;
clc;
x=[1,2,3,4,5];

SCIT100 =  [    0.0471    0.0465    0.0519    0.0499    0.0482];
ReCIT100 = [    0.0440    0.0451    0.0464    0.0505    0.0463];
FRCIT100 = [    0.0452    0.0452    0.0439    0.0423    0.0467];
SCIT200 =  [    0.0538    0.0496    0.0485    0.0529    0.0525];
ReCIT200 = [    0.0461    0.0520    0.0480    0.0450    0.0450];
FRCIT200 = [    0.0550    0.0430    0.0463    0.0456    0.0478];

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