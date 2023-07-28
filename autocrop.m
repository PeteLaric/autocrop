% autocrop.m
% (cc) BY 2023-07-28 Pete Laric / www.PeteLaric.com
% A tool to automate the cropping of photos in batches, rather than having to
% do it manually or individually.  This tool searches the local directory for
% .PNG images (easily changed to another supported file format), opens them one
% at a time, and crops them to the rectangular coordinates specified by x1, x2,
% y1, and y2.  It may take some expertimentation to find the correct values,
% but I assure you, if you have a bunch of photos to crop using identical
% parameters (e.g. webcam screenshots), this tool will ultimately make your
% life a LOT easier!  Use in concert with another tool I wrote today (autoanim)
% to create some cool animations from webcam screenshots with near-zero effort.

clear all
clc

% crop coordinates -- alter these to fit your needs
img_width = 947  % Alioth:947
img_height = 532 % Alioth:532
x1 = 162         % Alioth:162
y1 = 284         % Alioth:284
x2 = x1+img_width
y2 = y1+img_height

% create a list of image files in the current directory
system('ls *.png > list.txt')
fp = fopen('list.txt')

% now chunk through the list and crop each one
while (!feof(fp))
  
  filename = fgets(fp);
  filename = strtrim(filename) % remove trailing whitespace/newline chars

  % prepend "CROPPED" designator to output image filenames for easy sorting
  cropped_filename = ['CROPPED - ', filename]

  crop_image(filename, x1, y1, x2, y2)

end

fclose(fp)


