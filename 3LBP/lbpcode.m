function imgOutput = b_getLBP_yuan(img, radius, neighbors)
    
    imgSize = size(img);    
    if numel(imgSize) > 2    
        imgInput = rgb2gray(img);    
    else
        imgInput = img;
    end
        
   
    [rows, cols] = size(imgInput);
    rows=int16(rows);
    cols=int16(cols);
    imgOutput = uint8(zeros(rows-2*radius, cols-2*radius));


    for k=0:neighbors-1
              
        rx = radius * cos(2.0 * pi * k / neighbors);
        ry = -radius * sin(2.0 * pi * k / neighbors);
           
        rxMin = floor(rx);
        rxMax = ceil(rx);
        ryMin = floor(ry);
        ryMax = ceil(ry);
               
        tx = rx - rxMin;
        ty = ry - ryMin;
       
        w1 = (1-tx) * (1-ty);
        w2 = tx * (1-ty);
        w3 = (1-tx) * ty;
        w4 = tx * ty;

       
        for i=radius+1:rows-radius
            for j=radius+1:cols-radius
                center = imgInput(i, j);                
                neighbor = imgInput(i+rxMin, j+ryMin)*w1 + imgInput(i+rxMin, j+ryMax)*w2 + imgInput(i+rxMax, j+ryMin)*w3 + imgInput(i+rxMax, j+ryMax)*w4;
                if neighbor > center
                    flag = 1;
                else
                    flag = 0;
                end
                
                imgOutput(i-radius, j-radius) = bitor(imgOutput(i-radius, j-radius), bitshift(flag, neighbors-k-1));
            end
        end
    end
end
