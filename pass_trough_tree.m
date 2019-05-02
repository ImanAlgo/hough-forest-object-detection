% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

function leaf = pass_trough_tree(tree ,patch)
%PASS_TROUGH_TREE pass patchap trough tree and return the leaf which patchap ends in it

while tree.leaf == false
    child = bitest(patch, tree.binarytest);
    if child == 'l'
        tree = tree.lchild;
    elseif child == 'r'
        tree = tree.rchild;
    end
end    
leaf = tree;

end

