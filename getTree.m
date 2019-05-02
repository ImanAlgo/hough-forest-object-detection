% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

function tree = getTree( trainindex, level )
%GETTREE Constract a tree and train it by trainPatch

global trainPatch;
tpnum = size(trainindex,2);

if (level > 15) || (tpnum <= 30)
    tree.leaf = true;
    tree.offset = [];
    cr = 0;
    c1 = 0;
    for i=1:tpnum
        index = trainindex(i);
        cr = cr + trainPatch(index).class;
        if trainPatch(index).class == 1
            c1 = c1 + 1;
            tree.offset(:,c1) = trainPatch(index).offset;
        end
    end
    tree.classrate = cr / tpnum;
    
    
else
    utype = {'class','offset'};
    ut = randi(2);


    
    thisU = uncertainty(trainindex, utype(ut))/2;
    if thisU == inf || thisU == 0
        ut = mod(ut,2)+1;
        thisU = uncertainty(trainindex, utype(ut))/2;
        if thisU == inf || thisU == 0
            % All of the patchs are negative then it does not give any more
            % information by spliting the patchs hence return this node as
            % a leaf
            tree.leaf = true;
            tree.offset = [];
            cr = 0;
            c1 = 0;
            for i=1:tpnum
                index = trainindex(i);
                cr = cr + trainPatch(index).class;
                if trainPatch(index).class == 1
                    c1 = c1 + 1;
                    tree.offset(:,c1) = trainPatch(index).offset;
                end
            end
            tree.classrate = cr / tpnum;
            return;
        end
    end
    
    
    
    
    npx = 18;
    channel = 3;
    tree.leaf = false;

    %u = inf;
    minU = inf;
    counter = 1;
    %nn=0;
    %su=0;
    while (counter <= level*200) %|| minU == inf
        tree.binarytest = pickbt(npx, channel);
        [patchL, patchR] = split_patchset(trainindex, tree.binarytest);
        u = uncertainty(patchL, utype(ut)) + uncertainty(patchR, utype(ut));

        %su = su + u;
        if minU > u
            minU = u;
            opt = tree.binarytest;
        end
        counter = counter + 1;
%        if (minU == inf) || (su == 0)
%            nn = nn+1;
%        end
%        if nn > 500
%            ut = mod(ut,2)+1;
            %thisU = uncertainty(trainindex, utype(ut))/2;
%            counter = 0;
%            nn = 0;
%            su = 0;
%        end
    end
    tree.binarytest = opt;
    [patchL, patchR] = split_patchset(trainindex, opt);
    tree.lchild = getTree(patchL, level+1);
    tree.rchild = getTree(patchR, level+1);

end
end

