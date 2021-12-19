clc;
clear;
tic;
nsamples = 50;
n = 5; % dimension
%-------------Score Matrix
ScoreSCI = zeros(1,n);
ScoreRCI = zeros(1,n);
ScoreSCI2 = zeros(1,n);
ScoreRCI2 = zeros(1,n);
for Times = 1:1000 % 1000 times
    TimeIs = Times
    %-------------data generating Case I
    z = (rand(nsamples,n)*2-1);
    z = z - mean(z);
    a = rand*0.8+0.2;
    b = rand*0.8+0.2;
    n1 = (rand(nsamples,1)*2-1)*0.2;
    n2 = (rand(nsamples,1)*2-1)*0.2;
    n1 = n1 - mean(n1);
    n2 = n2 - mean(n2);
    x = z(:,1);
    z(:,1) = a*x + n1;
    y = b*z(:,1) + n2;
    %-------------Type I error
    for Num = 1:n
        for k = 1:Num
            M = nchoosek(1:Num,k);
            [rowId,~] = find(M == 1);
            for p = 1:length(rowId)
                conset = z(:,M(p,:));
                ScoreSCI(Num) = ScoreSCI(Num) + SCIT(x,y,conset);
                ScoreRCI(Num) = ScoreRCI(Num) + ReCIT(x,y,conset);
            end
        end
    end  
    %-------------Type II error
    for Num = 2:n
        for k = 1:Num-1
            M = nchoosek(2:Num,k);
            for p = 1:size(M,1)
                conset = z(:,M(p,:));
                ScoreSCI2(Num) = ScoreSCI2(Num) + SCIT(x,y,conset); 
                ScoreRCI2(Num) = ScoreRCI2(Num) + ReCIT(x,y,conset); 
            end
        end
    end
    %-------------unconditional independent test
    ScoreSCI2(Num) = ScoreSCI2(Num) + SCIT(x,y,[]); 
    ScoreRCI2(Num) = ScoreRCI2(Num) + ReCIT(x,y,[]); 
    %-------------calculate
    ScoreSCIT = ScoreSCI;
    ScoreRCIT = ScoreRCI;
    ScoreSCIT2 = ScoreSCI2;
    ScoreRCIT2 = ScoreRCI2;
    div = [1,2,4,8,16];
    for k = 1:5
        ScoreSCIT(k) = 1-(ScoreSCI(k)/(Times*div(k)));
        ScoreRCIT(k) = 1-(ScoreRCI(k)/(Times*div(k)));
        ScoreSCIT2(k) = ScoreSCI2(k)/(Times*div(k));
        ScoreRCIT2(k) = ScoreRCI2(k)/(Times*div(k));
    end
    %%%%%%% Results ->
exp_1 = [ScoreSCIT;ScoreRCIT;ScoreSCIT2;ScoreRCIT2]
% exp01 = [ScoreSCIT;ScoreSCIT2]
end
toc;