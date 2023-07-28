function retval = crop_image (filename, x1, y1, x2, y2)

my_image = imread(filename);

%imshow(my_image);

cropped_image = my_image(y1:y2, x1:x2, :);

figure(1);
imshow(cropped_image);
drawnow();

%%%cropped_filename = [filename, '.cropped.png']
cropped_filename = ['CROPPED - ', filename]

imwrite(cropped_image, cropped_filename);

end