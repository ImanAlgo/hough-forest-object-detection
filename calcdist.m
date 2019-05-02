% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

function distances = calcdist(data,point)
% The following is the fastest Matlab code that I know for calculating Euclidean distances
% between a test point and all points in a training set. It is fast because it uses the identity
% (a − b)2 = a2 − 2ab + b2 to avoid copying data.

% input: data matrix, single point (points are column vectors)
% output: row vector of distances

distances = sum(data'.^2, 2) - 2*data'*point + point'*point;
distances = sqrt(distances);
end