clc;
clear;
tic;
nsamples = 100;
n = 5; % dimension
%-------------Score Matrix
ScoreSCI = zeros(1,n);
ScoreRCI = zeros(1,n);
ScoreSCI2 = zeros(1,n);
ScoreRCI2 = zeros(1,n);
for Times = 1:1000 % 1000 times
    TimeIs = Times
    %-------------data generating Case II
    for i = 1:5
        x = (rand(nsamples,1)*2-1);
        A = rand(1,i)*0.8+0.2;
        B = rand(1,i)*0.8+0.2;
        nz =  (rand(nsamples,i)*2-1)*0.2;
        z = x*A + nz;
        ny =  (rand(nsamples,1)*2-1)*0.2;
        y = 0;
        for t = 1:i
            y = y + B(t)*z(:,t);
        end
        y = y + ny;
        %-------------Type I error
        ScoreSCI(i) = ScoreSCI(i) + SCIT(x,y,z);
        ScoreRCI(i) = ScoreRCI(i) + ReCIT(x,y,z);
        %-------------------- type II begin ----------------------
        if i>1 % not z1
            for k = 1:i-1
                A = nchoosek(1:i,k);
                lenA = size(A,1);
                for p = 1:lenA
                    conset = z(:,A(p,:));
                    ScoreSCI2(i) = ScoreSCI2(i) + SCIT(x,y,conset);
%                     ScoreRCI2(i) = ScoreRCI2(i) + ReCIT(x,y,conset);
                end
                ScoreSCI2(i) = ScoreSCI2(i) + SCIT(x,y,[]);
%                 ScoreRCI2(i) = ScoreRCI2(i) + ReCIT(x,y,[]);
            end
        else % test whether x perp y
            ScoreSCI2(i) = ScoreSCI2(i) + SCIT(x,y,[]);
%             ScoreRCI2(i) = ScoreRCI2(i) + ReCIT(x,y,[]);
        end
    end
    %-------------calculate
    ScoreSCIT = ScoreSCI;
%     ScoreRCIT = ScoreRCI;
    ScoreSCIT2 = ScoreSCI2;
%     ScoreRCIT2 = ScoreRCI2;
    div = [1,3,8,17,34]; % add emptyset
    for k = 1:5 
        ScoreSCIT(k) = 1-(ScoreSCIT(k)/(Times*div(1)));
%         ScoreRCIT(k) = 1-(ScoreRCIT(k)/(Times*div(1)));
        ScoreSCIT2(k) = ScoreSCIT2(k)/(Times*div(k));
%         ScoreRCIT2(k) = ScoreRCIT2(k)/(Times*div(k));
    end
   exp_2 = [ScoreSCIT;ScoreSCIT2]
end
toc;