clear;
clc;
x=[1,2,3,4,5];
f500 =  [0.0140    0.0430    0.0490    0.1460    0.1820]	;				
k500 =  [0.0010    0.1810    0.2340    0.4610    0.5440];				
f1000 = [0.0060    0.0170    0.0200    0.0640    0.0810];					
k1000 = [0    0.0440    0.0680    0.0070    0.0620];				
f2000 = [0.0052    0.0157    0.0183    0.0444    0.0496];					
k2000 = [0    0.0183    0.0235    0.1305    0.1723];	

lw = 1;

p(1) = plot(x,f500,'*-r','LineWidth',lw);
hold on;
p(2) = plot(x,k500,'*--r','LineWidth',lw);
hold on;
p(3) = plot(x,f1000,'o-b','LineWidth',lw);
hold on;
p(4) = plot(x,k1000,'o--b','LineWidth',lw);
hold on;
p(5) = plot(x,f2000,'x-k','LineWidth',lw);
hold on;
p(6) = plot(x,k2000,'x--k','LineWidth',lw);
hold on;
%grid on;
xlabel('The number of {\its_i}','Fontname','Times New Roman','FontSize',12);
ylabel('Error rate');

ah1=axes('position',get(gca,'position'),'visible','off'); 
h1=legend(ah1,p(1:2),'SCIT ({\itn}=50)','SCIT ({\itn}=100)','Fontname','Times New Roman','FontSize');
ah2=axes('position',get(gca,'position'),'visible','off');
h2=legend(ah2,p(3:4),'ReCIT ({\itn}=50)','ReCIT ({\itn}=100)','Fontname','Times New Roman','FontSize');
ah3=axes('position',get(gca,'position'),'visible','off');
h3=legend(ah3,p(5:6),'KCIT ({\itn}=50)','KCIT ({\itn}=100)','Fontname','Times New Roman','FontSize');
set(h1,'edgecolor','white');
set(h2,'edgecolor','white');
set(h3,'edgecolor','white');
