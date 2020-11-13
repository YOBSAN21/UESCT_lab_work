%Experiment 1
%Q8 ycbcr
 RGB = imread('flower.tif');
 YCBCR = rgb2ycbcr(RGB); 
 Y = YCBCR(:,:,1); 
 imshow(Y);
 %9
a= imread('flower.tif'); 
ainverse = 255-a;
imshow(ainverse);
 %Q10
RGB=imread('flower.tif');
red=RGB(:,:,1); 
green=RGB(:,:,2); 
blue=RGB(:,:,3); 
ab=zeros(size(RGB,1),size(RGB,2),class(RGB)); %allblack >>
red_channel=cat(3,red,ab,ab); 
green_channel=cat(3,ab,green,ab); 
blue_channel=cat(3,ab,ab,blue); 
subplot(3,3,2);subimage(RGB);title('OriginalRGBimage'); 
subplot(3,3,4);subimage(red_channel);title('Redchannel'); 
subplot(3,3,5);subimage(green_channel);title('Greenchannel'); 
subplot(3,3,6);subimage(blue_channel);title('Bluechannel'); 
%Q11
%image sampling Lenna.jpg 
image1= imread('Lenna.jpg'); 
sample_2 = image1(1:2:end, 1:2:end); 
sample_4 = image1(1:4:end, 1:4:end); 
sample_8 = image1(1:8:end, 1:8:end); 
sample_16 = image1(1:16:end, 1:16:end); 
subplot(3,2,1); imshow(image1); title('Original image');
subplot(3,2,2); imshow(sample_2); title('Sampled by 2'); 
subplot(3,2,3); imshow(sample_4); title('Sampled by 4'); 
subplot(3,2,4); imshow(sample_8); title('Sampled by 8');
subplot(3,2,5); imshow(sample_16); title('Sampled by 16');

%sampling cameman.jpg 
image2= imread('cameman.jpg'); 
sp_2 = image2(1:2:end,1:2:end); 
sp_4 = image2(1:4:end,1:4:end); 
sp_8 = image2(1:8:end,1:8:end); 
sp_16 = image2(1:16:end, 1:16:end); 
subplot(3,2,1); imshow(image2); title('Original image'); 
subplot(3,2,2); imshow(sp_2); title('Sampled by 2'); 
subplot(3,2,3); imshow(sp_4); title('Sampled by 4'); 
subplot(3,2,4); imshow(sp_8); title('Sampled by 8'); 
subplot(3,2,5); imshow(sp_16); title('Sampled by 16');

%12
%huffman coding
  image1 = imread('flowergray.jpg');
  image2 = imread('Lenna.jpg');
  image3 = imread('cameman.jpg');
 figure;
 subplot(2, 1, 1);
 imshow(image1);
 subplot(2, 1, 2);
 hisObj1 = histogram(image1, 256, 'Normalization', 'probability')
 grid on;
 xlabel('Gray Level');
 ylabel('Probability');
 
 figure;
 subplot(2, 1, 1);
 imshow(image2);
 subplot(2, 1, 2);
 hisObj2 = histogram(image2, 256, 'Normalization', 'probability')
 grid on;
 xlabel('Gray Level');
 ylabel('Probability');
 
 figure;
 subplot(2, 1, 1);
 imshow(image3);
 subplot(2, 1, 2);
 hisObj3 = histogram(image3, 256, 'Normalization', 'probability')
 grid on;
 xlabel('Gray Level');
 ylabel('Probability');
 
 
% find the probability of each image
 p = hisObj1.Values;
 q = hisObj2.Values;
 r = hisObj3.Values;
 
 [hp,ep]=Huffman_code(p);
 [hq,eq]=Huffman_code(q);
 [hr,er]=Huffman_code(r);
