clc
clear
tic
scoreB = [];
for Times = 1:100
    Times
    dataUrl{1} = '.\dataset\cancer.net';
    dataUrl{2} = '.\dataset\asia.net';
    dataUrl{3} = '.\dataset\child.net';
    dataUrl{4} = '.\dataset\insurance.net';
    dataUrl{5} = '.\dataset\Alarm.net';
    dataUrl{6} = '.\dataset\barley.net';
    for dataId = 1:size(dataUrl,2)
        [skeleton,names] = readRnet(dataUrl{dataId});
        skeleton = sortskeleton(skeleton);
        nSample = 200; % sample size 20 ~ 40
        data = genData(skeleton, nSample);
        conSize = 1; % conditional set size
        %--------------------------------PC_SCIT----------------------------------------------------
        Cskeleton = PC_sklearn_SCIT(data,conSize);
        score1 = getRPF(Cskeleton,skeleton);
        %--------------------------------PC_ReCIT----------------------------------------------------
        Cskeleton = PC_sklearn_ReCIT(data,conSize);
        score2 = getRPF(Cskeleton,skeleton);
        %--------------------------------Results----------------------------------------------------
        temp  = [score1(1),score2(1),score1(2),score2(2),score1(3),score2(3)];
        if dataId == 1 
            scoreA = temp;
        else
            scoreA = [scoreA;temp];
        end
    end
    scoreCell{Times} = scoreA; % to calculate error bar
    if isempty(scoreB)
        scoreB = scoreA;
    else
        scoreB = scoreB + scoreA;
    end
    scrorePrint = scoreB/Times
    toc
end

function [ skeleton]=sortskeleton( skeleton)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[nNode]=size(skeleton, 1);
dGraph=skeleton;
%apporixmate topical sort
idx=zeros(nNode,1);
nodeFlag=true(nNode, 1);
for iPass=1:nNode
    % find the mininmal in-degree variable
    nodeIdx=find(nodeFlag==true);
    for i = 1:length(nodeIdx)
        inSum=sum(dGraph(:, nodeIdx(i)));
        if inSum ==0
            break;
        end
    end
    % remove this node and its out degree
    idx(iPass)=nodeIdx(i);
    nodeFlag(nodeIdx(i))=false;
    dGraph(nodeIdx(i), :)=0;
end
skeleton=skeleton(idx, idx);
end

function[data]=genData(skeleton,nsamples)
[dim, ~]=size(skeleton);
data = rand(nsamples, dim)*2-1;
for k = 1:dim
    data(:,k) = data(:,k) - mean(data(:,k));
end
for i=1:dim
    parentidx=find(skeleton(:,i)==true);
    for j=1:length(parentidx)
        if parentidx(j)==i
            parentidx(j)=[];
        end
    end
    if ~isempty(parentidx)
        pasample = 0;
        for w = 1:length(parentidx)
            pasample = pasample + data(:, parentidx(w))*(rand*0.8+0.2);
        end
        n =  (rand(nsamples,1)*2-1)*0.2;
        n = n - mean(n);
        data(:, i)= pasample + n;
    end
end
end