% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

function binarytest = pickbt(dim, channel)
%PICKBT pick an binary test function in random

binarytest.ch = randi(channel);

binarytest.point1 = randi(dim,2,1);
binarytest.point2 = randi(dim,2,1);

binarytest.handicap = rand;

end

