function DrawKmeansClustering(normTrainingWineData, randNormWineDataC1, randNormWineDataC2, randNormWineDataC3, sqeuclidianTrainingIndex, sqAlignedTrainingClassCentre, cityblockTrainingIndex, cityAlignedTrainingClassCentre, cosineTrainingIndex, cosAlignedTrainingClassCentre, correlationTrainingIndex, corrAlignedTrainingClassCentre)
    %Draw Kmeans clustered training data
    KmeansTrainingDataC1 = zeros(1,13);
    KmeansTrainingDataC2 = zeros(1,13);
    KmeansTrainingDataC3 = zeros(1,13);
    for j = 1:size(sqeuclidianTrainingIndex,1)
        if sqeuclidianTrainingIndex(j) == 1
            if all(KmeansTrainingDataC1) == 0
                KmeansTrainingDataC1 = normTrainingWineData(j,:);
            else
                KmeansTrainingDataC1 = [KmeansTrainingDataC1; normTrainingWineData(j,:)];
            end
        elseif sqeuclidianTrainingIndex(j) == 2
            if all(KmeansTrainingDataC2) == 0
                KmeansTrainingDataC2 = normTrainingWineData(j,:);
            else
                KmeansTrainingDataC2 = [KmeansTrainingDataC2; normTrainingWineData(j,:)];
            end
        elseif sqeuclidianTrainingIndex(j) == 3
            if all(KmeansTrainingDataC3) == 0
                KmeansTrainingDataC3 = normTrainingWineData(j,:);
            else
                KmeansTrainingDataC3 = [KmeansTrainingDataC3; normTrainingWineData(j,:)];
            end
        end
    end

    figure;
    scatter (KmeansTrainingDataC1(:, 7), KmeansTrainingDataC1(:, 11));
    hold on;
    scatter (KmeansTrainingDataC2(:, 7), KmeansTrainingDataC2(:, 11));
    hold on;
    scatter (KmeansTrainingDataC3(:, 7), KmeansTrainingDataC3(:, 11));
    hold on;
    scatter (sqAlignedTrainingClassCentre(1,7), sqAlignedTrainingClassCentre(1,11));
    hold on;
    scatter (sqAlignedTrainingClassCentre(2,7), sqAlignedTrainingClassCentre(2,11));
    hold on;
    scatter (sqAlignedTrainingClassCentre(3,7), sqAlignedTrainingClassCentre(3,11));
    hold off;
    legend('Class 1','Class 2','Class 3', 'Class1Centre', 'Class2Centre', 'Class3Centre') ;
    xlabel('Dimension 7');
    ylabel('Dimension 11');
    title('Kmeans Training Data Clustering on sqeuclidean');

    %Draw Kmeans clustered training data cityblock
    KmeansTrainingDataC1 = zeros(1,13);
    KmeansTrainingDataC2 = zeros(1,13);
    KmeansTrainingDataC3 = zeros(1,13);
    for j = 1:size(cityblockTrainingIndex,1)
        if cityblockTrainingIndex(j) == 1
            if all(KmeansTrainingDataC1) == 0
                KmeansTrainingDataC1 = normTrainingWineData(j,:);
            else
                KmeansTrainingDataC1 = [KmeansTrainingDataC1; normTrainingWineData(j,:)];
            end
        elseif cityblockTrainingIndex(j) == 2
            if all(KmeansTrainingDataC2) == 0
                KmeansTrainingDataC2 = normTrainingWineData(j,:);
            else
                KmeansTrainingDataC2 = [KmeansTrainingDataC2; normTrainingWineData(j,:)];
            end
        elseif cityblockTrainingIndex(j) == 3
            if all(KmeansTrainingDataC3) == 0
                KmeansTrainingDataC3 = normTrainingWineData(j,:);
            else
                KmeansTrainingDataC3 = [KmeansTrainingDataC3; normTrainingWineData(j,:)];
            end
        end
    end

    figure;
    scatter (KmeansTrainingDataC1(:, 7), KmeansTrainingDataC1(:, 11));
    hold on;
    scatter (KmeansTrainingDataC2(:, 7), KmeansTrainingDataC2(:, 11));
    hold on;
    scatter (KmeansTrainingDataC3(:, 7), KmeansTrainingDataC3(:, 11));
    hold on;
    scatter (cityAlignedTrainingClassCentre(1,7), cityAlignedTrainingClassCentre(1,11));
    hold on;
    scatter (cityAlignedTrainingClassCentre(2,7), cityAlignedTrainingClassCentre(2,11));
    hold on;
    scatter (cityAlignedTrainingClassCentre(3,7), cityAlignedTrainingClassCentre(3,11));
    hold off;
    legend('Class 1','Class 2','Class 3', 'Class1Centre', 'Class2Centre', 'Class3Centre') ;
    xlabel('Dimension 7');
    ylabel('Dimension 11');
    title('Kmeans Training Data Clustering on cityblock');

    %Draw Kmeans clustered training data cosineTrainingIndex
    KmeansTrainingDataC1 = zeros(1,13);
    KmeansTrainingDataC2 = zeros(1,13);
    KmeansTrainingDataC3 = zeros(1,13);
    for j = 1:size(cosineTrainingIndex,1)
        if cosineTrainingIndex(j) == 1
            if all(KmeansTrainingDataC1) == 0
                KmeansTrainingDataC1 = normTrainingWineData(j,:);
            else
                KmeansTrainingDataC1 = [KmeansTrainingDataC1; normTrainingWineData(j,:)];
            end
        elseif cosineTrainingIndex(j) == 2
            if all(KmeansTrainingDataC2) == 0
                KmeansTrainingDataC2 = normTrainingWineData(j,:);
            else
                KmeansTrainingDataC2 = [KmeansTrainingDataC2; normTrainingWineData(j,:)];
            end
        elseif cosineTrainingIndex(j) == 3
            if all(KmeansTrainingDataC3) == 0
                KmeansTrainingDataC3 = normTrainingWineData(j,:);
            else
                KmeansTrainingDataC3 = [KmeansTrainingDataC3; normTrainingWineData(j,:)];
            end
        end
    end

    figure;
    scatter (KmeansTrainingDataC1(:, 7), KmeansTrainingDataC1(:, 11));
    hold on;
    scatter (KmeansTrainingDataC2(:, 7), KmeansTrainingDataC2(:, 11));
    hold on;
    scatter (KmeansTrainingDataC3(:, 7), KmeansTrainingDataC3(:, 11));
    hold on;
    scatter (cosAlignedTrainingClassCentre(1,7), cosAlignedTrainingClassCentre(1,11));
    hold on;
    scatter (cosAlignedTrainingClassCentre(2,7), cosAlignedTrainingClassCentre(2,11));
    hold on;
    scatter (cosAlignedTrainingClassCentre(3,7), cosAlignedTrainingClassCentre(3,11));
    hold off;
    legend('Class 1','Class 2','Class 3', 'Class1Centre', 'Class2Centre', 'Class3Centre') ;
    xlabel('Dimension 7');
    ylabel('Dimension 11');
    title('Kmeans Training Data Clustering on cosine');

    %Draw Kmeans clustered training data correlationTrainingIndex
    KmeansTrainingDataC1 = zeros(1,13);
    KmeansTrainingDataC2 = zeros(1,13);
    KmeansTrainingDataC3 = zeros(1,13);
    for j = 1:size(correlationTrainingIndex,1)
        if correlationTrainingIndex(j) == 1
            if all(KmeansTrainingDataC1) == 0
                KmeansTrainingDataC1 = normTrainingWineData(j,:);
            else
                KmeansTrainingDataC1 = [KmeansTrainingDataC1; normTrainingWineData(j,:)];
            end
        elseif correlationTrainingIndex(j) == 2
            if all(KmeansTrainingDataC2) == 0
                KmeansTrainingDataC2 = normTrainingWineData(j,:);
            else
                KmeansTrainingDataC2 = [KmeansTrainingDataC2; normTrainingWineData(j,:)];
            end
        elseif correlationTrainingIndex(j) == 3
            if all(KmeansTrainingDataC3) == 0
                KmeansTrainingDataC3 = normTrainingWineData(j,:);
            else
                KmeansTrainingDataC3 = [KmeansTrainingDataC3; normTrainingWineData(j,:)];
            end
        end
    end

    figure;
    scatter (KmeansTrainingDataC1(:, 7), KmeansTrainingDataC1(:, 11));
    hold on;
    scatter (KmeansTrainingDataC2(:, 7), KmeansTrainingDataC2(:, 11));
    hold on;
    scatter (KmeansTrainingDataC3(:, 7), KmeansTrainingDataC3(:, 11));
    hold on;
    scatter (corrAlignedTrainingClassCentre(1,7), corrAlignedTrainingClassCentre(1,11));
    hold on;
    scatter (corrAlignedTrainingClassCentre(2,7), corrAlignedTrainingClassCentre(2,11));
    hold on;
    scatter (corrAlignedTrainingClassCentre(3,7), corrAlignedTrainingClassCentre(3,11));
    hold off;
    legend('Class 1','Class 2','Class 3', 'Class1Centre', 'Class2Centre', 'Class3Centre') ;
    xlabel('Dimension 7');
    ylabel('Dimension 11');
    title('Kmeans Training Data Clustering on correlation');

    %Draw actual training data
    figure;
    scatter (randNormWineDataC1(:, 7), randNormWineDataC1(:, 11));
    hold on;
    scatter (randNormWineDataC2(:, 7), randNormWineDataC2(:, 11));
    hold on;
    scatter (randNormWineDataC3(:, 7), randNormWineDataC3(:, 11));
    hold off;
    legend('Class 1','Class 2','Class 3') ;
    xlabel('Dimension 7');
    ylabel('Dimension 11');
    title('Actual Training Data Clustering');
end