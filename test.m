% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

choice = input('\n*** Detecting car in a test image *** \n 1) Detecting by fast method \n 2) detecting by slow method (it takes about 30 minutes) \nEnter number:');

if choice == 1; method = 'fast'; end
if choice == 2; method = 'slow'; end

choice = input('\n choice an image from test dataset (write a number between 0 to 169):');

testpath = sprintf('dataset/CarData/TestImages/test-%d.pgm',choice);


load 'forest.mat';


figure('Name','Original Image')
imshow(testpath);
houghimg = getHoughImage(forest,testpath,method);
%figure
%imshow(houghimg);
figure('Name','Hough Image')
imshow(mat2gray(houghimg));

[v i] = max(houghimg);
[d j] = max(v);
x = j;
y = i(j);

fprintf('\nCentroid of Bounding Box is [%d, %d].\n',x,y);

minxb = x - 50;
minyb = y - 20;
maxxb =  100;
maxyb =  40;

testp = imread(testpath);
J = imcrop(testp,[minxb minyb maxxb maxyb]);
figure('Name','Crop the detected object'); imshow(J);