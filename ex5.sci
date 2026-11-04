// 1. Nạp thư viện IPCV và đọc ảnh
atomsLoad('IPCV');
img = imread('egg.jpg');

// 2. Chuyển sang ảnh mức xám
if size(img, 3) == 3 then
    img_gray = rgb2gray(img);
else
    img_gray = img;
end

// 3. Tính toán cân bằng Histogram
[counts, bins] = imhist(img_gray);
total_pixels = size(img_gray, 1) * size(img_gray, 2);
cdf = cumsum(counts) / total_pixels;
img_eq = uint8(round(cdf(double(img_gray) + 1) * 255));

// 4. Hiển thị kết quả
figure(1);
clf(); // Xóa cửa sổ cũ

// Ô 1: Ảnh mức xám gốc
subplot(2, 2, 1);
imshow(img_gray);
title('Ảnh mức xám gốc (egg.jpg)');

// Ô 2: Histogram ảnh gốc (Dùng bar thay vì gọi imhist trực tiếp)
subplot(2, 2, 2);
[c_orig, b_orig] = imhist(img_gray);
bar(b_orig, c_orig);
title('Histogram ảnh gốc');

// Ô 3: Ảnh sau khi cân bằng
subplot(2, 2, 3);
imshow(img_eq);
title('Ảnh sau khi cân bằng Histogram');

// Ô 4: Histogram sau khi cân bằng
subplot(2, 2, 4);
[c_eq, b_eq] = imhist(img_eq);
bar(b_eq, c_eq);
title('Histogram sau cân bằng');
