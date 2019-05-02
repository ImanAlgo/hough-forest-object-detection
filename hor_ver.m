% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

function [ horiResponse, vertResponse ] = hor_ver( img )
%hor_ver Compute Vertical and Horizontal Edge Responses of an Image


intImage = integralImage(img);
 
% Construct Harr-like wavelet filters
horiH = integralKernel([1 1 4 3; 1 4 4 3], [-1, 1]); % horizontal filter
vertH = horiH.'; % vertical filter; note use of the dot before '
 
% Compute filter responses
horiResponse = abs(integralFilter(intImage, horiH));
vertResponse = abs(integralFilter(intImage, vertH));

[my mx] = size(img);
newsize = size(intImage) - horiH.Size;
horiResponse(newsize(1)+1:my, newsize(2)+1:mx) = 0;
newsize = size(intImage) - vertH.Size;
vertResponse(newsize(1)+1:my, newsize(2)+1:mx) = 0;

 


%figure; imshow(abs(horiResponse), []); title('Horizontal edge responses');
%figure; imshow(abs(vertResponse), []); title('Vertical edge responses');

end