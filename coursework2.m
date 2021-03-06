clear all;
close all;
clc;

L2Accuracy = zeros(1, 100);
L1Accuracy = zeros(1, 100);
HIAccuracy = zeros(1, 100);
CLAccuracy = zeros(1, 100);
MNAccuracy = zeros(1, 100);
C2Accuracy = zeros(1, 100);

for attempts = 1:100
%for attempts = 1
%% Q1)A) la lalalala lalala
load wine.data.csv;
classIdentifier = wine_data(:,1);
wineData = wine_data(:,2:14);
normWineData = normc(wineData);
%normWineData = wineData;

wineDataC1 = wineData(1:59,:);
wineDataC2 = wineData(60:130,:);
wineDataC3 = wineData(131:178,:);
normWineDataC1 = normWineData(1:59,:);
normWineDataC2 = normWineData(60:130,:);
normWineDataC3 = normWineData(131:178,:);

%Split data into training, validation, testing set
randWineDataC1 = wineDataC1(randperm(59),:);
randWineDataC2 = wineDataC2(randperm(71),:);
randWineDataC3 = wineDataC3(randperm(48),:);

randNormWineDataC1 = normWineDataC1(randperm(59),:);
randNormWineDataC2 = normWineDataC2(randperm(71),:);
randNormWineDataC3 = normWineDataC3(randperm(48),:);

trainingWineData = [randWineDataC1(1:39,:); randWineDataC2(1:47,:); randWineDataC3(1:32,:)];
validationWineData = [randWineDataC1(40:46,:); randWineDataC2(48:55,:); randWineDataC3(33:37,:)];
testingWineData = [randWineDataC1(47:59,:); randWineDataC2(56:71,:); randWineDataC3(38:48,:)];

%Split data into unit norm l2 training, validation, testing set
normTrainingWineData = [randNormWineDataC1(1:39,:); randNormWineDataC2(1:47,:); randNormWineDataC3(1:32,:)];
normValidationWineData = [randNormWineDataC1(40:46,:); randNormWineDataC2(48:55,:); randNormWineDataC3(33:37,:)];
normTestingWineData = [randNormWineDataC1(47:59,:); randNormWineDataC2(56:71,:); randNormWineDataC3(38:48,:)];

%Class labels
trainingDataClassLabel = [ones(1,39), 2*ones(1,47), 3*ones(1,32)];
validationDataClassLabel = [ones(1,7), 2*ones(1,8), 3*ones(1,5)];
testingDataClassLabel = [ones(1,13), 2*ones(1,16), 3*ones(1,11)];

trainingWineDataC1 = randWineDataC1(1:39,:);
trainingWineDataC2 = randWineDataC2(1:47,:);
trainingWineDataC3 = randWineDataC3(1:32,:);
trainingNormWineDataC1 = randNormWineDataC1(1:39,:);
trainingNormWineDataC2 = randNormWineDataC2(1:47,:);
trainingNormWineDataC3 = randNormWineDataC3(1:32,:);

%% Q1)B) wakakakakakaka 

covMatrixAll = cov(trainingWineData);
covMatrixAllNorm = cov(normTrainingWineData);

covMatrixC1 = cov(trainingWineDataC1);
covMatrixC2 = cov(trainingWineDataC2);
covMatrixC3 = cov(trainingWineDataC3);
covMatrixC1Norm = cov(trainingNormWineDataC1);
covMatrixC2Norm = cov(trainingNormWineDataC2);
covMatrixC3Norm = cov(trainingNormWineDataC3);

%% Q1)C)
% 
% figure;
% scatter (normWineDataC1(:, 5), normWineDataC1(:, 13),30, 'b', 'x');
% hold on;
% scatter (normWineDataC2(:, 5), normWineDataC2(:, 13),30, 'r');
% hold on;
% scatter (normWineDataC3(:, 5), normWineDataC3(:, 13),30, 'k', '^');
% hold on;
% xlabel('Dimension 5');
% ylabel('Dimension 13');
% title('Dimensions with largest covariance');
% 
% [V1, D1] = eig(covMatrixC1Norm);
% V1_selected = [V1(5, 13), V1(13, 13)];
% 
% %p1 = [0.08, 0.1];
% C1Mean = [mean(normWineDataC1(:, 5)), mean(normWineDataC1(:, 13))];
% p1 = C1Mean;
% p2 = p1 + 0.01*V1_selected;
% dp = 0.03*V1_selected;
% %quiver(V1(5, 13), V1(13, 13), 0.1);
% quiver(p1(1),p1(2),dp(1),dp(2),0, 'b');
% 
% [V2, D2] = eig(covMatrixC2Norm);
% V2_selected = [V2(5, 13), V2(13, 13)];
% 
% %p1 = [0.07, 0.04];
% C2Mean = [mean(normWineDataC2(:, 5)), mean(normWineDataC2(:, 13))];
% p1 = C2Mean;
% p2 = p1 + 0.5*V2_selected;
% dp = 0.1*V2_selected;
% %quiver(V1(5, 13), V1(13, 13), 0.1);
% quiver(p1(1),p1(2),dp(1),dp(2),0, 'r');
% 
% [V3, D3] = eig(covMatrixC3Norm);
% V3_selected = [V3(5, 13), V3(13, 13)];
% 
% %p1 = [0.075, 0.06];
% C3Mean = [mean(normWineDataC3(:, 5)), mean(normWineDataC3(:, 13))];
% p1 = C3Mean;
% p2 = p1 + 0.5*V3_selected;
% dp = 0.2*V3_selected;
% %quiver(V1(5, 13), V1(13, 13), 0.1);
% quiver(p1(1),p1(2),dp(1),dp(2),0.7, 'k');
% 
% 
% legend('Class 1','Class 2','Class 3', 'Class 1 PC', 'Class 2 PC', 'Class 3 PC') ;
% scatter(C1Mean(1), C1Mean(2),50, 'b', '*');
% scatter(C2Mean(1), C2Mean(2),50, 'r', '*');
% scatter(C3Mean(1), C3Mean(2),50, 'k', '*');
% 
% hold off;
% 
% minimum = 9999999;
% maximum = 0;
% for i = 1:12
%     for j=i:13
%         if minimum > abs(covMatrixC1(i, j))
%             minimum = abs(covMatrixC1(i, j));
%             x_min = i; y_min = j;
%         end
%         if maximum < abs(covMatrixC3(i, j))
%             maximum = abs(covMatrixC3(i, j));
%             x_max = i; y_max = j;
%         end
%     end
% end
% 
% C1Mean = [mean(normWineDataC1(:, 7)), mean(normWineDataC1(:, 11))];
% C2Mean = [mean(normWineDataC2(:, 7)), mean(normWineDataC2(:, 11))];
% C3Mean = [mean(normWineDataC3(:, 7)), mean(normWineDataC3(:, 11))];
% figure;
% scatter (normWineDataC1(:, 7), normWineDataC1(:, 11));
% hold on;
% scatter (normWineDataC2(:, 7), normWineDataC2(:, 11));
% hold on;
% scatter (normWineDataC3(:, 7), normWineDataC3(:, 11));
% legend('Class 1','Class 2','Class 3') ;
% xlabel('Dimension 7');
% ylabel('Dimension 11');
% title('Dimensions with lowest covariance');
% scatter(C1Mean(1), C1Mean(2),50, 'b', '*');
% scatter(C2Mean(1), C2Mean(2),50, 'r', '*');
% scatter(C3Mean(1), C3Mean(2),50, 'y', '*');
% hold off;


%scatter (covMatrixC1(1, :), covMatrixC1(2, :));

%% Q1)D)

% L2Accuracy = zeros(1, 100);
% L1Accuracy = zeros(1, 100);
% HIAccuracy = zeros(1, 100);
% CLAccuracy = zeros(1, 100);
% MNAccuracy = zeros(1, 100);
% C2Accuracy = zeros(1, 100);

%L2-Euclidean distance
L2index = knnsearch(normTrainingWineData, normTestingWineData);
L2ClassLabel = zeros(1,40);
L2Accurate = zeros(1,40);
for i = 1:size(normTestingWineData, 1)
    L2ClassLabel(i) = trainingDataClassLabel(L2index(i));
    if L2ClassLabel(i) == testingDataClassLabel(i)
        L2Accurate(i) = 1;
    else 
        L2Accurate(i) = 0;
    end
end
L2Accuracy(attempts) = sum(L2Accurate)/size(normTestingWineData, 1);

%L1-CityBlock distance
L1index = knnsearch(normTrainingWineData, normTestingWineData, 'Distance', 'cityblock');
L1ClassLabel = zeros(1,40);
L1Accurate = zeros(1,40);
for i = 1:size(normTestingWineData, 1)
    L1ClassLabel(i) = trainingDataClassLabel(L1index(i));
    if L1ClassLabel(i) == testingDataClassLabel(i)
        L1Accurate(i) = 1;
    else 
        L1Accurate(i) = 0;
    end
end
L1Accuracy(attempts) = sum(L1Accurate)/size(normTestingWineData, 1);

%Chi-square distance 
normChiIndex = chiSqrDist(normTrainingWineData, normTestingWineData);
chiClassLabel = zeros(1,40);
C2Accurate = zeros(1,40);
for i = 1:size(normTestingWineData, 1)
    chiClassLabel(i) = trainingDataClassLabel(normChiIndex(i));
    if chiClassLabel(i) == testingDataClassLabel(i)
        C2Accurate(i) = 1;
    else 
        C2Accurate(i) = 0;
    end
end
C2Accuracy(attempts) = sum(C2Accurate)/size(normTestingWineData, 1);

%Histogram-intersection
HIindex = zeros(1, size(normTestingWineData, 2))';
HIClassLabel = zeros(1,40);
HIAccurate = zeros(1,40);
for j = 1:size(normTestingWineData, 1)
    minDist = histogram_intersection(normTestingWineData(j, :), normTrainingWineData);
%     for i = 1:size(trainingWineData, 1)
%         if abs(histogram_intersection(testingWineData(j, :), trainingWineData(i, :))) < minDist
%             minDist = abs(histogram_intersection(testingWineData(j, :), trainingWineData(i, :)));
%             HIindex(j) = i;
%         end
%     end
    [~, HIindex(j)] = min(minDist);
    
end
for i = 1:size(normTestingWineData, 1)
    HIClassLabel(i) = trainingDataClassLabel(HIindex(i));
    if HIClassLabel(i) == testingDataClassLabel(i)
        HIAccurate(i) = 1;
    else 
        HIAccurate(i) = 0;
    end
end
HIAccuracy(attempts) = sum(HIAccurate)/size(normTestingWineData, 1);

%Correlation distance
correlationIndex = knnsearch(normTrainingWineData, normTestingWineData, 'Distance', 'correlation');
correlationClassLabel = zeros(1,40);
CLAccurate = zeros(1,40);
for i = 1:size(normTestingWineData, 1)
    correlationClassLabel(i) = trainingDataClassLabel(correlationIndex(i));
    if correlationClassLabel(i) == testingDataClassLabel(i)
        CLAccurate(i) = 1;
    else 
        CLAccurate(i) = 0;
    end
end
CLAccuracy(attempts) = sum(CLAccurate)/size(normTestingWineData, 1);


%Mahalanobis distance
mahalanobisIndex = knnsearch(normTrainingWineData, normTestingWineData, 'Distance', 'mahalanobis', 'Cov', covMatrixAllNorm);
mahalanobisClassLabel = zeros(1,40);
MNAccurate = zeros(1,40);

for i = 1:size(normTestingWineData, 1)
    mahalanobisClassLabel(i) = trainingDataClassLabel(mahalanobisIndex(i));
    if mahalanobisClassLabel(i) == testingDataClassLabel(i)
        MNAccurate(i) = 1;
    else 
        MNAccurate(i) = 0;
    end
end
MNAccuracy(attempts) = sum(MNAccurate)/size(normTestingWineData, 1);

end

errorMatrix = [1-mean(L2Accuracy, 2), 1-mean(L1Accuracy, 2), 1-mean(C2Accuracy, 2), 1-mean(HIAccuracy, 2), 1-mean(CLAccuracy, 2), 1-mean(MNAccuracy, 2)];