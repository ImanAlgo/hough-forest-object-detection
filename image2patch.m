% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

function patchset = image2patch( testimg )
%IMAGE2PATCH split image to patch set


[y,x] = size(testimg);
[testhor, testver] = hor_ver(testimg);
pt = 0;
for minX=1:18:x

    mx = minX;
    if minX+17 > x
        mx = x-17;
    end

    for minY=1:18:y
        my = minY;
        if minY+17 > y
            my = y-17;
        end
        patch(:,:,1) =  mat2gray(testimg(my:my+17,mx:mx+17));
        patch(:,:,2) =  mat2gray(testhor(my:my+17,mx:mx+17));
        patch(:,:,3) =  mat2gray(testver(my:my+17,mx:mx+17));
        
        pt = pt + 1;
        patchset(pt).appearance = patch;
        patchset(pt).center = [mx+9;my+9];
    end
end

end

