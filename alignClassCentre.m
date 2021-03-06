function alignedTrainingClassCentre = alignClassCentre(trainingIndex, trainingClassCentre, k)
    alignedTrainingClassCentre = zeros(k,13);
    classSize = [39, 47, 32];
    index = 1;
    for j = 1:k
        trainingClassLabel = mode(trainingIndex(index:classSize(j)+index-1,:));
        alignedTrainingClassCentre(trainingClassLabel,:) = trainingClassCentre(j,:);
        index = classSize(j)+index;
    end
end
