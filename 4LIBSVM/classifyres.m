clear;
clc;
addpath('./mrmr');
addpath('./libsvm/windows');
load('landmarks.mat');
load('lbp_organ.mat');

maxres=zeros(1,500);

lie=0;
for tiaonum=1610:10:1700
lie=lie+1;

image_chara=[];
image_chara=[image_chara zscore(image_landmark)];
image_chara=[image_chara zscore(lbp_feature)];
chara_num= mrmr_mid_d(image_chara,label_class, tiaonum);
image_chara_p=zeros(213,tiaonum);
for i=1:tiaonum
    image_chara_p(:,i)=image_chara(:,chara_num(i));
end

[pc,score,latent,tsquare] = pca(image_chara_p);
a=cumsum(latent)./sum(latent);
timessnum=find(a>0.8,1);
if timessnum<20
    timessnum=20;
end
res=[];

for times=timessnum:212

image_chara_pca= image_chara_p*pc(:,1:times); 

[image_chara_hang image_chara_lie]=size(image_chara_pca);
rightnum=0;

for i=1:image_chara_hang
    image_lib=image_chara_pca;
    label_lib=label_class;
    image_test=[];
    label_test=[];
    image_lib(i,:)=[];
    label_lib(i,:)=[];
    image_test=image_chara_pca(i,:);
    label_test=label_class(i,:);
    [predict_label, accuracy] = image_classify(image_lib,label_lib,image_test,label_test);

    if label_test == predict_label
        rightnum=rightnum+1;
    end

end

accuracy=rightnum/image_chara_hang;
res=[res; accuracy];
times
end

maxres(1,lie)=max(res);
end
