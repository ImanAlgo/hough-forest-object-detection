% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

function tpatchs = getTrainPatchs(  )
%GETTRAINPATCHS prepare train patche from a dataset

path = 'dataset/CarData/TrainImages/';

p = 0;
centroid = [50; 20];
for i=0:499

    negPath = sprintf('%sneg-%d.pgm',path,i);
    negPic = imread(negPath);
    [horNP, verNP] = hor_ver(negPic);
    
    for col=6:18:78
        minX = col;
        maxX = minX+17;
                
        
        % row=1
        minY = 3;
        maxY = 20;
        patch = negPic(minY:maxY,minX:maxX);
        hor = horNP(minY:maxY,minX:maxX);
        ver = verNP(minY:maxY,minX:maxX);
        p = p + 1;
        tpatchs(p).appearance(:,:,1) =  mat2gray(patch);
        tpatchs(p).appearance(:,:,2) =  mat2gray(hor);
        tpatchs(p).appearance(:,:,3) =  mat2gray(ver);
        tpatchs(p).class = 0;
        
        
        % row=2
        minY = 21;
        maxY = 38;
        patch = negPic(minY:maxY,minX:maxX);
        hor = horNP(minY:maxY,minX:maxX);
        ver = verNP(minY:maxY,minX:maxX);
        p = p + 1;
        tpatchs(p).appearance(:,:,1) =  mat2gray(patch);
        tpatchs(p).appearance(:,:,2) =  mat2gray(hor);
        tpatchs(p).appearance(:,:,3) =  mat2gray(ver);
        tpatchs(p).class = 0;
        
        
    end
    
end


for i=0:549
    
    posPath = sprintf('%spos-%d.pgm',path,i);
    posPic = imread(posPath);
    [horPP, verPP] = hor_ver(posPic);    
    for col=6:18:78
        minX = col;
        maxX = minX+17;
                
        
        % row=1
        minY = 3;
        maxY = 20;
        patch = posPic(minY:maxY,minX:maxX);
        hor = horPP(minY:maxY,minX:maxX);
        ver = verPP(minY:maxY,minX:maxX);
        p = p + 1;
        tpatchs(p).appearance(:,:,1) =  mat2gray(patch);
        tpatchs(p).appearance(:,:,2) =  mat2gray(hor);
        tpatchs(p).appearance(:,:,3) =  mat2gray(ver);
        tpatchs(p).class = 1;
        pcent = [minX+9; minY+9];
        tpatchs(p).offset = centroid - pcent;
        
        
        % row=2
        minY = 21;
        maxY = 38;
        patch = posPic(minY:maxY,minX:maxX);
        hor = horPP(minY:maxY,minX:maxX);
        ver = verPP(minY:maxY,minX:maxX);
        p = p + 1;
        tpatchs(p).appearance(:,:,1) =  mat2gray(patch);
        tpatchs(p).appearance(:,:,2) =  mat2gray(hor);
        tpatchs(p).appearance(:,:,3) =  mat2gray(ver);
        tpatchs(p).class = 1;
        pcent = [minX+9; minY+9];
        tpatchs(p).offset = centroid - pcent;
        
        
    end

end

