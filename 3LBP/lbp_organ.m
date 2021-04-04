clear
clc
load('cut_organ.mat');

lbp_feature=zeros(213,20480);

for ge = 1:213

img1=img_organ(ge,1:1350); 
image_faceone=reshape(img1,30,45);
[xlen,ylen]=size(image_faceone);
xlen=xlen+2;
xlabel=[0 xlen/4 xlen/4*2 xlen/4*3 xlen-2];
ylabel=[0 ylen/5 ylen/5*2 ylen/5*3 ylen/5*4 ylen];
image_chara=[];
for xnum = 1:4
    for ynum = 1:5
        histone=imhist(lbpcode(image_faceone(xlabel(xnum)+1:xlabel(xnum+1),ylabel(ynum)+1:ylabel(ynum+1)),1,8));
        histone=histone(1:256,:)';
        image_chara=[image_chara histone];
    end
end
lbp_feature(ge,1:5120)=image_chara;


img2=img_organ(ge,1351:2700); 
image_faceone=reshape(img2,30,45);
[xlen,ylen]=size(image_faceone);
xlen=xlen+2;
xlabel=[0 xlen/4 xlen/4*2 xlen/4*3 xlen-2];
ylabel=[0 ylen/5 ylen/5*2 ylen/5*3 ylen/5*4 ylen];
image_chara=[];
for xnum = 1:4
    for ynum = 1:5
        histone=imhist(lbpcode(image_faceone(xlabel(xnum)+1:xlabel(xnum+1),ylabel(ynum)+1:ylabel(ynum+1)),1,8));
        histone=histone(1:256,:)';
        image_chara=[image_chara histone];
    end
end
lbp_feature(ge,5121:10240)=image_chara;


img3=img_organ(ge,2701:4050); 
image_faceone=reshape(img3,30,45);
[xlen,ylen]=size(image_faceone);
xlen=xlen+2;
xlabel=[0 xlen/4 xlen/4*2 xlen/4*3 xlen-2];
ylabel=[0 ylen/5 ylen/5*2 ylen/5*3 ylen/5*4 ylen];
image_chara=[];
for xnum = 1:4
    for ynum = 1:5
        histone=imhist(lbpcode(image_faceone(xlabel(xnum)+1:xlabel(xnum+1),ylabel(ynum)+1:ylabel(ynum+1)),1,8));
        histone=histone(1:256,:)';
        image_chara=[image_chara histone];
    end
end
lbp_feature(ge,10241:15360)=image_chara;


img4=img_organ(ge,4051:5400);
image_faceone=reshape(img4,30,45);
[xlen,ylen]=size(image_faceone);
xlen=xlen+2;
xlabel=[0 xlen/4 xlen/4*2 xlen/4*3 xlen-2];
ylabel=[0 ylen/5 ylen/5*2 ylen/5*3 ylen/5*4 ylen];
image_chara=[];
for xnum = 1:4
    for ynum = 1:5
        histone=imhist(lbpcode(image_faceone(xlabel(xnum)+1:xlabel(xnum+1),ylabel(ynum)+1:ylabel(ynum+1)),1,8));
        histone=histone(1:256,:)';
        image_chara=[image_chara histone];
    end
end
lbp_feature(ge,15361:20480)=image_chara;

end

clearvars -except lbp_feature label_class
save lbp_organ.mat