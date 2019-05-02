% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

clc 

choice = input('\n 1) Detect car in an test image \n 2) Costract and training a forest (it takes about 32 hours) \nEnter number:');
if choice == 1
    eval('test')
end
if choice == 2
    eval('train')
end