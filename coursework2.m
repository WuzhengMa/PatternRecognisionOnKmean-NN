clear all;
close all;
clc;
%% Q1)A) la lalalala lalala
load wine.data.csv;
classIdentifier = wine_data(:,1);
wineData = wine_data(:,2:14);
normWineData = normr(wineData);

wineDataC1 = wineData(1:59,:);
wineDataC2 = wineData(60:130,:);
wineDataC3 = wineData(131:178,:);
normWineDataC1 = normr(wineDataC1);
normWineDataC2 = normr(wineDataC2);
normWineDataC3 = normr(wineDataC3);

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


%% Q1)B) wakakakakakaka 

covMatrixAll = cov(wineData);
covMatrixAllNorm = cov(normWineData);

covMatrixC1 = cov(wineDataC1);
covMatrixC2 = cov(wineDataC2);
covMatrixC3 = cov(wineDataC3);
covMatrixC1Norm = cov(normWineDataC1);
covMatrixC2Norm = cov(normWineDataC2);
covMatrixC3Norm = cov(normWineDataC3);

%% Q1)C)

figure;
scatter (normWineDataC1(:, 5), normWineDataC1(:, 13),30, 'b', 'x');
hold on;
scatter (normWineDataC2(:, 5), normWineDataC2(:, 13),30, 'r');
hold on;
scatter (normWineDataC3(:, 5), normWineDataC3(:, 13),30, 'k', '^');
hold on;
xlabel('Dimension 5');
ylabel('Dimension 13');
title('Dimensions with largest covariance');

[V1, D1] = eig(covMatrixC1Norm);
V1_selected = [V1(5, 13), V1(13, 13)];

p1 = [0.1, 0.99];
p2 = p1 + 0.01*V1_selected;
dp = 0.03*V1_selected;
%quiver(V1(5, 13), V1(13, 13), 0.1);
quiver(p1(1),p1(2),dp(1),dp(2),0, 'b');

[V2, D2] = eig(covMatrixC2Norm);
V2_selected = [V2(5, 13), V2(13, 13)];

p1 = [0.2, 0.97];
p2 = p1 + 0.01*V2_selected;
dp = 0.03*V2_selected;
%quiver(V1(5, 13), V1(13, 13), 0.1);
quiver(p1(1),p1(2),dp(1),dp(2),0, 'r');

[V3, D3] = eig(covMatrixC3Norm);
V3_selected = [V3(5, 13), V3(13, 13)];

p1 = [0.17, 0.98];
p2 = p1 + 0.01*V3_selected;
dp = 0.03*V3_selected;
%quiver(V1(5, 13), V1(13, 13), 0.1);
quiver(p1(1),p1(2),dp(1),dp(2),0, 'k');


legend('Class 1','Class 2','Class 3', 'Class 1 Eigenvector', 'Class 2 Eigenvector', 'Class 3 Eigenvector') ;
hold off;

min = 9999999;
for i = 1:13
    for j=1:13
        if min > abs(covMatrixC3(i, j))
            min = abs(covMatrixC3(i, j));
            x_min = i; y_min = j;
        end
    end
end


figure;
scatter (normWineDataC1(:, 7), normWineDataC1(:, 11));
hold on;
scatter (normWineDataC2(:, 7), normWineDataC2(:, 11));
hold on;
scatter (normWineDataC3(:, 7), normWineDataC3(:, 11));
hold off;
legend('Class 1','Class 2','Class 3') ;
xlabel('Dimension 7');
ylabel('Dimension 11');
title('Dimensions with lowest covariance');

%end
%scatter (covMatrixC1(1, :), covMatrixC1(2, :));

%%Q1)D)

