clear
tic
I1 = imread('images/boat/img1.pgm');
I2 = imread('images/boat/img2.pgm');

I1 = im2single(I1);
I2 = im2single(I2);

qual = 0.01;
poi1 = myHarris(I1,qual);
poi2 = myHarris(I2,qual);

% poi1 = detectHarrisFeatures(I1);
% poi2 = detectHarrisFeatures(I2);


[f1, validpts1] = extractFeatures(I1, poi1);
[f2, validpts2] = extractFeatures(I2, poi2);

map = nnMatch(double(f1), double(f2), 0.6, 0.01);
% map = matchFeatures(f1, f2) ;

matchedPoints1 = validpts1(map(:,1),:);
matchedPoints2 = validpts2(map(:,2),:);
figure;
showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);

toc