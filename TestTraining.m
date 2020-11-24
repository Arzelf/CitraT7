clc;clear;close all;
image_folder = 'Tubes/Dataset';
filenames = dir(fullfile(image_folder,'*.jpg'));
total_images=115;
for n = 1:total_images
full_name = fullfile(image_folder, strcat('Batik (',num2str(n),').jpg')) ;
Img = imread(full_name);
img1 = rgb2gray(Img);
GLCM = graycomatrix(img1,'Offset',[0 1; -1 1; -1 0; -1 -1]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
CON(n) = mean(stats.Contrast);
CORR(n) = mean(stats.Correlation);
X = [CON;CORR]';
end