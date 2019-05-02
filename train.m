% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31


% Prepare train data

global trainPatch;
trainPatch = getTrainPatchs();
tpnum = size(trainPatch,2);

% Constract Forest

trainindex = randperm(tpnum);

for i=1:5
    tt = cputime;
    forest(i) = getTree(trainindex, 1);
    tt = cputime - tt
    save(sprintf('backup%d',i))
end
trainindex = [];
for tp=1:tpnum
    cr = 0;
    for tree=1:5
        leaf = pass_trough_tree(forest(tree), trainPatch(tp));
        cr = cr + leaf.classrate;
    end
    cr = cr / 5;
    if cr >= .3 && cr <= .7
        trainindex(end+1) = tp;
    end
end
tm10 = length(trainindex)
for i=6:10
    tt = cputime;
    forest(i) = getTree(trainindex, 1);
    tt = cputime - tt
    save(sprintf('backup%d',i))
end

trainindex = [];
for tp=1:tpnum
    cr = 0;
    for tree=1:10
        leaf = pass_trough_tree(forest(tree), trainPatch(tp));
        cr = cr + leaf.classrate;
    end
    cr = cr / 10;
    if cr >= .4 && cr <= .6
        trainindex(end+1) = tp;
    end
end
tm15 = length(trainindex)
for i=11:15
    tt = cputime;
    forest(i) = getTree(trainindex, 1);
    tt = cputime - tt
    save(sprintf('backup%d',i))
end

save('forest','forest')
