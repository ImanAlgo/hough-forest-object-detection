% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

function u = uncertainty( trainindex, type )
%uncertainty calculate uncertainty in patch set depending on type = class or type = offset

if isempty(trainindex); u=inf; return; end

global trainPatch;
tpnum = size(trainindex,2);

if strcmp(type, 'class')
    c = 0;
    for i=1:tpnum
        c = c + trainPatch(trainindex(i)).class;
    end
    if (c == 0)||(c == tpnum)
        u = 0;
    else
        c = c / tpnum;
        entropy = (-c * log(c)) - ((1-c)*log(1-c));
        u = tpnum * entropy;
    end
end

if strcmp(type, 'offset')
    offnum = 0;
    da = [0;0];
    for i=1:tpnum
        if trainPatch(trainindex(i)).class == 1
           da =  da + trainPatch(trainindex(i)).offset;
           offnum = offnum + 1;
        end
    end
    if offnum == 0 
        u = inf;
    else
        da = da / offnum;
        u = 0;
        for i=1:tpnum
            if trainPatch(trainindex(i)).class == 1
               %u =  u + sum((trainPatch(trainindex(i)).offset - da) .^ 2);
               u =  u + calcdist(trainPatch(trainindex(i)).offset , da);
            end           
        end
        %u = norm(u);
    end
end