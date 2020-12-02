clc;clear;close all;
image_folder = 'Tubes';
total_images=114;
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
opts = statset('Display','final');
[idx,C] = kmeans(X,10);
%clustering
figure;
plot(X(idx==2,1),X(idx==2,2),'r.','MarkerSize',24)
hold on
plot(X(idx==1,1),X(idx==1,2),'g.','MarkerSize',24)
plot(X(idx==3,1),X(idx==3,2),'b.','MarkerSize',24)
plot(X(idx==4,1),X(idx==4,2),'y.','MarkerSize',24)
plot(X(idx==5,1),X(idx==5,2),'c.','MarkerSize',24)
plot(X(idx==6,1),X(idx==6,2),'m.','MarkerSize',24)
plot(X(idx==7,1),X(idx==7,2),'b.','MarkerSize',24)
plot(X(idx==8,1),X(idx==8,2),'k.','MarkerSize',24)
plot(X(idx==9,1),X(idx==9,2),'w.','MarkerSize',24)
plot(X(idx==10,1),X(idx==10,2),'r.','MarkerSize',24)
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3)
legend('Cluster 1','Cluster 2','Centroids','Location','best')
title('Cluster Assignments and Centroids')
xlabel('Contrast')
ylabel('Correlation')
h = gca;
xlim(h.XLim+.5*[-1,1])
ylim(h.YLim+.5*[-1,1])
hold off