clear;
clc;
load('images_points.mat');

img_organ=zeros(213,5400);
for ge=1:213
        
image_classone=image_class(ge,:);
image_one=im2double(reshape(image_classone,256,256));

% figure;
% imshow(image_one);hold on;
% plot(image_point(ge,1:49),image_point(ge,50:98),'g*','MarkerSize',6);hold on;  %显示49个标点
% for i=1:49
%     c=num2str(i);
%     c=[' ',c];
%     text(image_point(ge,i),image_point(ge,i+49),c)
% end
% hold on;

dzeye=2;
xminzeye=floor(min([image_point(ge,1) image_point(ge,20)]))-dzeye;
xmaxzeye=ceil(max([image_point(ge,5) image_point(ge,23)]))+dzeye;
yminzeye=floor(min([image_point(ge,1+49) image_point(ge,2+49) image_point(ge,3+49) image_point(ge,4+49) image_point(ge,5+49)]))-dzeye;
ymaxzeye=ceil(max([image_point(ge,20+49) image_point(ge,23+49) image_point(ge,24+49) image_point(ge,25+49)]))+dzeye;

zuo_eye=imcrop(image_one,[xminzeye,yminzeye,abs(xmaxzeye-xminzeye),abs(ymaxzeye-yminzeye)]); 
img1=imresize(zuo_eye,[30,45]);

dyeye=2;
xminyeye=floor(min([image_point(ge,6) image_point(ge,26)]))-dyeye;
xmaxyeye=ceil(max([image_point(ge,10) image_point(ge,29)]))+dyeye;
yminyeye=floor(min([image_point(ge,6+49) image_point(ge,7+49) image_point(ge,8+49) image_point(ge,9+49) image_point(ge,10+49)]))-dyeye;
ymaxyeye=ceil(max([image_point(ge,26+49) image_point(ge,29+49) image_point(ge,30+49) image_point(ge,31+49)]))+dyeye;

you_eye=imcrop(image_one,[xminyeye,yminyeye,abs(xmaxyeye-xminyeye),abs(ymaxyeye-yminyeye)]);  
img2=imresize(you_eye,[30,45]);


dnose=2;
xminnose=floor(min([image_point(ge,15)]))-dnose;
xmaxnose=ceil(max([image_point(ge,19)]))+dnose;
yminnose=floor(min([image_point(ge,13+49)]))-dnose;
ymaxnose=ceil(max([image_point(ge,15+49) image_point(ge,16+49) image_point(ge,17+49) image_point(ge,18+49) image_point(ge,19+49)]))+dnose;

c_nose=imcrop(image_one,[xminnose,yminnose,abs(xmaxnose-xminnose),abs(ymaxnose-yminnose)]);  
img3=imresize(c_nose,[30,45]);

dmouth=2;
xminmouth=floor(min([image_point(ge,32) image_point(ge,33) image_point(ge,43)]))-dmouth;
xmaxmouth=ceil(max([image_point(ge,37) image_point(ge,38) image_point(ge,39)]))+dmouth;
yminmouth=floor(min([image_point(ge,32+49) image_point(ge,33+49) image_point(ge,34+49) image_point(ge,35+49) image_point(ge,36+49) image_point(ge,37+49) image_point(ge,38+49)]))-dmouth;
ymaxmouth=ceil(max([image_point(ge,32+49) image_point(ge,38+49) image_point(ge,39+49) image_point(ge,40+49) image_point(ge,41+49) image_point(ge,42+49) image_point(ge,43+49)]))+dmouth;

c_mouth=imcrop(image_one,[xminmouth,yminmouth,abs(xmaxmouth-xminmouth),abs(ymaxmouth-yminmouth)]);  
img4=imresize(c_mouth,[30,45]);

img_organ(ge,1:1350)=reshape(img1,1,1350); 
img_organ(ge,1351:2700)=reshape(img2,1,1350);
img_organ(ge,2701:4050)=reshape(img3,1,1350); 
img_organ(ge,4051:5400)=reshape(img4,1,1350); 
end


clearvars -except img_organ label_class
save cut_organ.mat