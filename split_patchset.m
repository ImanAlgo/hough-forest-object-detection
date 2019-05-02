% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

function [ patchL, patchR ] = split_patchset( patchsindex, binarytest )
%split_patchset split patchs to tow set dependance on binarytest

global trainPatch; 
tpnum = size(patchsindex,2);
p = binarytest.point1(1,1);
q = binarytest.point1(2,1);
r = binarytest.point2(1,1);
s = binarytest.point2(2,1);
ch = binarytest.ch;
t = binarytest.handicap;
pr = 0;
pl = 0;
patchL = [];
patchR = [];
for i=1:tpnum
    index = patchsindex(i);
    if trainPatch(index).appearance(p,q,ch) < trainPatch(index).appearance(r,s,ch)+t
        pl = pl + 1;
        patchL(pl) = index;
    else
        pr = pr + 1;
        patchR(pr) = index;
    end
end
end

