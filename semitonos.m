function [z] = semitonos(image_name)
% Idea of semitones took from: http://dasan.sejong.ac.kr/~dihan/ip/P06_chapter6_ENG.pdf
% Rylander's recursive pattering (tones from 0 - 16):
t0 =   [0   0   0   0 ;
        0   0   0   0 ;
        0   0   0   0 ;
        0   0   0   0 ];
  
t1 =  [255  0   0   0 ;
        0   0   0   0 ;
        0   0  255  0 ;
        0   0   0   0 ];
  
t2 =  [255  0  255  0 ;
        0   0   0   0 ;
        0   0  255  0 ;
        0   0   0   0 ];
  
t3 =  [255  0  255  0 ;
        0   0   0   0 ;
       255  0  255  0 ;
        0   0   0   0 ];
  
t4 =  [255  0  255  0 ;
       255  0   0   0 ;
       255  0  255  0 ;
        0   0   0   0 ];
  
t5 =  [255  0  255  0 ;
       255  0   0   0 ;
       255  0  255  0 ;
        0   0  255  0 ];
  
t6 =  [255  0  255  0 ;
       255  0  255  0 ;
       255  0  255  0 ;
        0   0  255  0 ];
  
t7 =  [255  0  255  0 ;
       255  0  255  0 ;
       255  0  255  0 ;
       255  0  255  0 ];
  
t8 =  [255 255 255  0 ;
       255  0  255  0 ;
       255  0  255  0 ;
       255  0  255  0 ];
  
t9 =  [255 255 255  0 ;
       255  0  255  0 ;
       255  0  255 255;
       255  0  255  0 ];
  
t10 = [255 255 255 255;
       255  0  255  0 ;
       255  0  255 255;
       255  0  255  0 ];
  
t11 = [255 255 255 255;
       255  0  255  0 ;
       255 255 255 255;
       255  0  255  0 ];
  
t12 = [255 255 255 255;
       255 255 255  0 ;
       255 255 255 255;
       255  0  255  0 ];
  
t13 = [255 255 255 255;
       255 255 255  0 ;
       255 255 255 255;
       255  0  255 255];
  
t14 = [255 255 255 255;
       255 255 255 255;
       255 255 255 255;
       255  0  255 255];
  
t15 = [255 255 255 255;
       255 255 255 255;
       255 255 255 255;
       255 255 255 255];
   
  SEM = cat(3, t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15)
  
% Transformamos de RGB a 16 niveles de Grises.
  img = imread(image_name);
  % Check if is black and white or rgb
  if size(img,3) == 3
    img = rgb2gray(img);
  end
  img = round(img/17);
  [h, w] = size(img);
  z = zeros(h * 4, w * 4);
  
  for i = 1:h
      for j = 1:w
          i_min = 1 + (4 * (i - 1));
          i_max = i_min + 3;
          j_min = 1 + (4 * (j - 1));
          j_max = j_min + 3;
          
          temp_semitone = img(i,j);
          z(i_min : i_max, j_min : j_max) = SEM(:,:,temp_semitone + 1);
      end     
  end

end

