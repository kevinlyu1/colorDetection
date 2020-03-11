% intensityPlots.m
% creates a line plot with the x axis as the green intensity and y axis as
% the number of pixels in the picture.
clc
folderOut = 'outputs/intensityPlots/dataSet2/';
folderIn = 'inputs/dataSet2/';


fileName = sprintf('agrodrench1.png');
titleName = [folderIn,fileName];
temp = join(titleName);
rgbImage = imread(temp);
[row1,col1] = size(rgbImage);

fontSize = 20;
maxX = 270;
maxY = (row1*col1)/9;

for i = 1:4
    fileName = sprintf('agrodrench%d.png', i);
    titleName = [folderIn,fileName];
    temp = join(titleName);
    rgbImage = imread(temp);
    greenChannel = rgbImage(:,:,2); % Green channel
    bins = zeros([256,1]);
    for j = 1:256
        bins(j) = length(find(greenChannel == j-1));
    end
    numBins = 256;
    h = plot(0:255,bins);
    xlim([0,maxX])
    ylim([0,maxY])
    titleName = sprintf('Green Intensity Values');
    title(titleName, 'FontSize', fontSize)
    xlabel('Green Intensity Level')
    ylabel('Number of Pixels')
    thresholdSTR = sprintf('hist.png');
    titleName = [folderOut,fileName,thresholdSTR];
    temp = join(titleName);
    saveas(gcf,temp)
end

for i = 1:4
    fileName = sprintf('control%d.png', i);
    titleName = [folderIn,fileName];
    temp = join(titleName);
    rgbImage = imread(temp);
    greenChannel = rgbImage(:,:,2); % Green channel
    bins = zeros([256,1]);
    for j = 1:256
        bins(j) = length(find(greenChannel == j-1));
    end
    numBins = 256;
    h = plot(0:255,bins);
    xlim([0,maxX])
    ylim([0,maxY])
    titleName = sprintf('Green Intensity Values');
    title(titleName, 'FontSize', fontSize)
    xlabel('Green Intensity Level')
    ylabel('Number of Pixels')
    thresholdSTR = sprintf('hist.png');
    titleName = [folderOut,fileName,thresholdSTR];
    temp = join(titleName);
    saveas(gcf,temp)
    endls