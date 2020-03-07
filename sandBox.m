% Read in original RGB image.
fileName = 'GFP control1.jpeg';
threshold = 200;

function [] = greenIntensityFinder(fileName,threshold)
rgbImage = imread(fileName);
% Extract color channels.
% redChannel = rgbImage(:,:,1); % Red channel
greenChannel = rgbImage(:,:,2); % Green channel
% blueChannel = rgbImage(:,:,3); % Blue channel
% Create an all black channel.
allBlack = zeros(size(rgbImage, 1), size(rgbImage, 2), 'uint8');
[row,col] = size(greenChannel);
greenChannelNew = greenChannel;
greenChannelNew(greenChannelNew<threshold) = 0;
M = mean(greenChannel,'all')
threshM = mean(greenChannelNew,'all')
% for i = 1:row
%     for j = 1:col
%         if greenChannel < threshHold
%             greenChannelNew(i,j) =  0;
%         end
%     end
% end
% Create color versions of the individual color channels.
% just_red = cat(3, redChannel, allBlack, allBlack);
just_green = cat(3, allBlack, greenChannelNew, allBlack);
% just_blue = cat(3, allBlack, allBlack, blueChannel);
% Recombine the individual color channels to create the original RGB image again.
% recombinedRGBImage = cat(3, redChannel, greenChannelNew, blueChannel);


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
titleName = [fileName,thresholdSTR];
temp = join(titleName);
saveas(gcf,temp)
end
% Set up figure properties:
% Enlarge figure to full screen.
% set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0, 1, 1]);
% Get rid of tool bar and pulldown menus that are along top of figure.
% set(gcf, 'Toolbar', 'none', 'Menu', 'none');
% Give a name to the title bar.
% set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off')

