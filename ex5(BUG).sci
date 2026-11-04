img = imread('egg.jpg');
imshow(img);
title('Anh goc');

figure();
imhist(img);
title('Histogram');

img_eq = imhisteq(img);
figure();
imshow(img_eq);
title('Can bang Histogram');

// 4. Làm mờ ảnh (Blurring)
h = fspecial('average', [5 5]);
img_blur = imfilter(img, h);
figure();
imshow(img_blur);
title('Lam mo anh');

// 5. Chèn dấu bản quyền (Watermarking đơn giản)
img_wm = img;
img_wm(20:40, 20:150, :) = 255; // Chèn vùng đánh dấu bản quyền
figure();
imshow(img_wm);
title('Chen Watermark');
