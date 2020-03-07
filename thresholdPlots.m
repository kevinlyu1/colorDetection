% thresholdPlots.m
% gets all of the threshold plots for the specified threshold (j). Also
% creates a matrix (outputValues) with information output of
% greenIntensityFinder.m


outputValues = ["fileName","Threshold","originalMean","thresholdMean","originalArea","thresholdArea","maxGreen","minGreen"];
folderOut = 'outputs/thresholdPlots/';
folderIn = 'inputs/dataSet1/';

for i = 1:8
    for j = 0:25:255
        fileName = sprintf('agrodrench%d.jpeg', i);
        threshold = j;
        [originalMean,thresholdMean,originalArea,thresholdArea,maxGreen,minGreen] = greenIntensityFinder(fileName,folderOut,folderIn,threshold);
        outputValues(end+1,:) = [string(fileName),string(threshold),string(originalMean),string(thresholdMean),string(originalArea),string(thresholdArea),string(maxGreen),string(minGreen)];
    end
end
save('agrodrench.mat')