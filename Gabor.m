I1 = rgb2gray(imread('Batik (1).jpg'));
I2 = rgb2gray(imread('Batik (20).jpg'));
GLCM1 = graycomatrix(I1);
GLCM2 = graycomatrix(I2);
stats1 = graycoprops(GLCM1,{'contrast','correlation','energy','homogeneity'});
Contrast1 = stats1.Contrast;
Correlation1 = stats1.Correlation;
Energy1 = stats1.Energy;
Homogeneity1 = stats1.Homogeneity;
stats2 = graycoprops(GLCM2,{'contrast','correlation','energy','homogeneity'});
Contrast2 = stats2.Contrast;
Correlation2 = stats2.Correlation;
Energy2 = stats2.Energy;
Homogeneity2 = stats2.Homogeneity;
str1 = strcat('contrast=', num2str(Contrast1),',Correlation=',num2str(Correlation1),',Energy=',num2str(Energy1),',Homogeneity=',num2str(Homogeneity1));
str2 = strcat('contrast=', num2str(Contrast2),',Correlation=',num2str(Correlation2),',Energy=',num2str(Energy2),',Homogeneity=',num2str(Homogeneity2));
figure
subplot(2,1,1), imshow(I1), title (str1);
subplot(2,1,2), imshow(I2), title (str2);