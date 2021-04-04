clear;
clc;
load('Chehra_f1.0.mat');
load('images_points.mat');

image_landmark=zeros(213,98);

for ge=1:213
image_classone=image_class(ge,:);
image_one=im2double(reshape(image_classone,256,256));

disteye=norm([image_point(ge,23),image_point(ge,23+49)]-[image_point(ge,26),image_point(ge,26+49)]);
bili=30.0/disteye;
image_suo=imresize(image_one,bili);

image_point_suo=features(image_suo,refShape,RegMat);

image_landmark(ge,:)=image_point_suo;

distanl=30.0;
face_xmin=floor(image_landmark(ge,23)-1.3*distanl);
face_xmax=ceil(image_landmark(ge,23)+2.2*distanl);
face_ymin=floor(image_landmark(ge,23+49)-1.2*distanl);
face_ymax=ceil(image_landmark(ge,23+49)+2.9*distanl);

faceone=imcrop(image_suo,[face_xmin,face_ymin,abs(face_xmax-face_xmin),abs(face_ymax-face_ymin)]);  

image_landmark(ge,1:49)=image_landmark(ge,1:49)-face_xmin;
image_landmark(ge,1+49:49+49)=image_landmark(ge,1+49:49+49)-face_ymin;

end

clearvars -except label_class image_landmark
save landmarks.mat