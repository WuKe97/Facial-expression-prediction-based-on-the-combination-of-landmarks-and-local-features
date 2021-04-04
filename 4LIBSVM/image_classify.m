function [predict_label, accuracy,dec_values] = image_classify(image_train,label_train,image_test,label_test)

model = libsvmtrain(label_train,image_train,'-t 0 -q');
[predict_label, accuracy, dec_values] = libsvmpredict(label_test,image_test,model);

end