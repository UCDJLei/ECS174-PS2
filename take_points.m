% gigput 
I1 = imread('wdc1.jpg'); 
I2 = imread('wdc2.jpg'); 
n = 12;


figure, imshow(I1);
points1 = zeros(2,n);
hold on

for i=1:n
[x, y] = ginput(1);
points1(:,i) = [x, y];
plot(points1(:,1), points1(:,2), '+');
end
hold off



figure, imshow(I2);
points2 = zeros(2,n);
hold on

for i=1:n
[x, y] = ginput(1);
points2(:,i) = [x, y];
plot(points2(:,1), points2(:,2), '+');
end
hold off