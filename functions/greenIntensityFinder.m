% Read in original RGB image.


function [M,threshM,orignalArea,threshArea,maxGreen,minGreen] = greenIntensityFinder(fileName,folderOut,folderIn,threshold)
titleName = [folderIn,fileName];
temp = join(titleName);
rgbImage = imread(temp);
greenChannel = rgbImage(:,:,2); % Green channel
allBlack = zeros(size(rgbImage, 1), size(rgbImage, 2), 'uint8');
[row,col] = size(greenChannel);
greenChannelNew = greenChannel;
greenChannelNew(greenChannelNew<threshold) = 0;
M = mean(greenChannel,'all');
threshM = mean(greenChannelNew,'all');
just_green = cat(3, allBlack, greenChannelNew, allBlack);
orignalArea = nnz(greenChannel);
threshArea = nnz(greenChannelNew);
maxGreen = max(greenChannelNew,[],'all');
minGreen = min(greenChannelNew(greenChannelNew>0));
% Display them all.
subplot(2, 1, 1);
imshow(rgbImage);
fontSize = 20;
temp = ['Original Image of ', fileName];
titleName = join(temp);
title(titleName, 'FontSize', fontSize)
subplot(2, 1, 2);
imshow(just_green)
titleName = sprintf('Threshold Green %d', threshold);
title(titleName, 'FontSize', fontSize)
thresholdSTR = sprintf('%d.png', threshold);
titleName = [folderOut,fileName,thresholdSTR];
temp = join(titleName);
saveas(gcf,temp)
end

