%image sampling Lenna.jpg
% image1 = imread('Lenna.jpg');
% sample_2 = image1(1:2:end, 1:2:end);
% sample_4 = image1(1:4:end, 1:4:end);
% sample_8 = image1(1:8:end, 1:8:end);
% sample_16 = image1(1:16:end, 1:16:end);
% subplot(3,2,1); imshow(image1); title('Original image');
% subplot(3,2,2); imshow(sample_2); title('Sampled by 2');
% subplot(3,2,3); imshow(sample_4); title('Sampled by 4');
% subplot(3,2,4); imshow(sample_8); title('Sampled by 8');
% subplot(3,2,5); imshow(sample_16); title('Sampled by 16');

%sampling cameman.jpg
image2 = imread('cameman.jpg');
sp_2 = image2(1:2:end, 1:2:end);
sp_4 = image2(1:4:end, 1:4:end);
sp_8 = image2(1:8:end, 1:8:end);
sp_16 = image2(1:16:end, 1:16:end);
subplot(3,2,1); imshow(image2); title('Original image');
subplot(3,2,2); imshow(sp_2); title('Sampled by 2');
subplot(3,2,3); imshow(sp_4); title('Sampled by 4');
subplot(3,2,4); imshow(sp_8); title('Sampled by 8');
subplot(3,2,5); imshow(sp_16); title('Sampled by 16');