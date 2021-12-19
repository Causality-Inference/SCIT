clc
clear
for Times = 1:10 % 1000 times
    TimeIs = Times
    nsamplesM = [50 100 200 500 1000];
    for i = 1:length(nsamplesM)
        nsamples = nsamplesM(i);
        %-------------------data generating Case I-------------------
        x = (rand(nsamples,1)*2-1);
        e1 = (rand(nsamples,1)*2-1);
        e2 = (rand(nsamples,1)*2-1);
        z = x + e1;
        y = z(:,1) + e2;
        %-------------------CI Test-----------------------------------
        tic
        ind1 = SCIT(x,y,z);
        tscit = toc;
        tic
        ind2 = ReCIT(x,y,z);
        trecit = toc;
        tic
        ind3 = KCIT(x,y,z);
        tkcit = toc;
        tM1 = [tscit,trecit,tkcit];
        if i == 1
            tM2 = tM1;
        else
            tM2 = [tM2;tM1]
        end
    end
    tCell{Times} = tM2;
end
    