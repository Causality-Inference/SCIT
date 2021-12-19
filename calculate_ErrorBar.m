clear
clc
load scoreCell_200.mat
d = scoreCell;
n = size(d,2);
e = d{1};
errorBar = zeros(size(e,1),size(e,2));
errorMean = zeros(size(e,1),size(e,2));
for i = 1:size(e,1)
    for j = 1:size(e,2)
        temp = [];
        for k = 1:n
            s = d{k};
            temp = [temp,s(i,j)];
        end
        errorBar(i,j) = std(temp);
        errorMean(i,j) = mean(temp);
    end
end
errorMean
errorBar
for t = 1:size(errorBar,2)
    temp = [errorMean(:,t),errorBar(:,t)];
    if t == 1
        printLatex = temp;
    else
        printLatex = [printLatex,temp];
    end
end
printLatex

% errorMeanFig = [errorMean(:,1)',errorMean(:,2)',errorMean(:,3)',errorMean(:,4)',errorMean(:,5)',]
% errorBar = [errorBar(:,1)',errorBar(:,2)',errorBar(:,3)',errorBar(:,4)',errorBar(:,5)',]