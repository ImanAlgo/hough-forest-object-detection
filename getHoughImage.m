% Hough Forest for Object detection
% Final Project
% Iman Mohammadi 
% University of Tehran
% Departman of Algorithms and Computation
% 2013/01/31

function houghIMG = getHoughImage( forest, imgpath, type )
%GETBOUNDINGBOX return hough image depending on given forest
% each column of bbx is a boundin box as [left; top; width; height]

trnum = size(forest,2);
testimg = imread(imgpath);
[y, x] = size(testimg);
houghIMG = zeros(y,x);
patchset = image2patch(testimg);
ptnum = size(patchset,2);
sigma2 = 64;
sigma2doubl = sigma2 * 2;
pisigma2doubl = (2*pi*sigma2);

if strcmp(type,'fast')

for pt=1:ptnum
   pcent = patchset(pt).center;
   
   for tr=1:trnum
       leaf = pass_trough_tree(forest(tr),patchset(pt));
       if ~isempty(leaf.offset)
           dnum = size(leaf.offset,2);
           for d=1:dnum
               xloc = pcent - leaf.offset(:,d);
               if (xloc(1,1)>0) && (xloc(2,1)>0) && (xloc(1,1)<=x) && (xloc(2,1)<=y)
                houghIMG(xloc(2,1), xloc(1,1)) = houghIMG(xloc(2,1), xloc(1,1)) + (leaf.classrate/dnum);
               end
           end
       end
   end
   
end

elseif strcmp(type, 'slow')


for pt=1:ptnum
   pcent = patchset(pt).center;
   
   for xloc=pcent(1,1)-50:pcent(1,1)+50
       if (xloc > 0) && (xloc <= x)
       for yloc=pcent(2,1)-20:pcent(2,1)+20
           if (yloc > 0) && (yloc <= y)
           loc = [xloc;yloc];
           pcent_minus_loc = (pcent - loc);
           treeres = 0;

           for tr=1:trnum
               leaf = pass_trough_tree(forest(tr),patchset(pt));
               if ~isempty(leaf.offset)
                dnum = size(leaf.offset,2);
                sm = 0;
                for d=1:dnum
                   epower = exp(-((norm(pcent_minus_loc - leaf.offset(:,d))^2)/sigma2doubl));
                   sm = sm + (epower / pisigma2doubl);
                end
                treeres = treeres + ((sm / dnum)*leaf.classrate);
               end
           end
           houghIMG(loc(2,1), loc(1,1)) = houghIMG(loc(2,1), loc(1,1)) + (treeres / trnum);
           end
       end
       end
   end
end

end
               
end


