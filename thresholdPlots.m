% thresholdPlots.m
% gets all of the threshold plots for the specified threshold (j). Also
% creates a matrix (outputValues) with information output of
% greenIntensityFinder.m


outputValues = ["fileName","Threshold","originalMean","thresholdMean","originalArea","thresholdArea","maxGreen","minGreen"];
folderOut = 'outputs/thresholdPlots/dataSet2/';
folderIn = 'inputs/dataSet2/';
dataFileName = 'dataSet2.mat';

for i = 1:4
    for j = 0:25:255
        fileName = sprintf('agrodrench%d.png', i);
        threshold = j;
        [originalMean,thresholdMean,originalArea,thresholdArea,maxGreen,minGreen] = greenIntensityFinder(fileName,folderOut,folderIn,threshold);
        outputValues(end+1,:) = [string(fileName),string(threshold),string(originalMean),string(thresholdMean),string(originalArea),string(thresholdArea),string(maxGreen),string(minGreen)];
    end
end
for i = 1:4
    for j = 0:25:255
        fileName = sprintf('control%d.png', i);
        threshold = j;
        [originalMean,thresholdMean,originalArea,thresholdArea,maxGreen,minGreen] = greenIntensityFinder(fileName,folderOut,folderIn,threshold);
        outputValues(end+1,:) = [string(fileName),string(threshold),string(originalMean),string(thresholdMean),string(originalArea),string(thresholdArea),string(maxGreen),string(minGreen)];
    end
end
save(dataFileName)