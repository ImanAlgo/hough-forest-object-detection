% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

function child = bitest( testpatch, binarytest )
%BITEST determin wether testpatch must pass trough from left child or right child

p = binarytest.point1(1,1);
q = binarytest.point1(2,1);
r = binarytest.point2(1,1);
s = binarytest.point2(2,1);
ch = binarytest.ch;
t = binarytest.handicap;

if testpatch.appearance(p,q,ch) < testpatch.appearance(r,s,ch)+t
    child = 'l';
else
    child = 'r';
end

end

