function [z] = semitonos(foto)

% Pattering - Matrices de Rylander. 
m0 =  [ 0   0   0   0 ;
        0   0   0   0 ;
        0   0   0   0 ;
        0   0   0   0 ];
  
m1 =  [255  0   0   0 ;
        0   0   0   0 ;
        0   0   0   0 ;
        0   0   0   0 ];
  
m2 =  [255  0   0   0 ;
        0   0   0   0 ;
        0   0  255  0 ;
        0   0   0   0 ];
  
m3 =  [255  0  255  0 ;
        0   0   0   0 ;
        0   0  255  0 ;
        0   0   0   0 ];
  
m4 =  [255  0  255  0 ;
        0   0   0   0 ;
       255  0  255  0 ;
        0   0   0   0 ];
  
m5 =  [255  0  255  0 ;
       255  0   0   0 ;
       255  0  255  0 ;
        0   0   0   0 ];
  
m6 =  [255  0  255  0 ;
       255  0   0   0 ;
       255  0  255  0 ;
        0   0  255  0 ];
  
m7 =  [255  0  255  0 ;
       255  0  255  0 ;
       255  0  255  0 ;
        0   0  255  0 ];
  
m8 =  [255  0  255  0 ;
       255  0  255  0 ;
       255  0  255  0 ;
       255  0  255  0 ];
  
m9 =  [255 255 255  0 ;
       255  0  255  0 ;
       255  0  255  0 ;
       255  0  255  0 ];
  
m10 = [255 255 255  0 ;
       255  0  255  0 ;
       255  0  255 255;
       255  0  255  0 ];
  
m11 = [255 255 255 255;
       255  0  255  0 ;
       255  0  255 255;
       255  0  255  0 ];
  
m12 = [255 255 255 255;
       255  0  255  0 ;
       255 255 255 255;
       255  0  255  0 ];
  
m13 = [255 255 255 255;
       255 255 255  0 ;
       255 255 255 255;
       255  0  255  0 ];
  
m14 = [255 255 255 255;
       255 255 255  0 ;
       255 255 255 255;
       255  0  255 255];
  
m15 = [255 255 255 255;
       255 255 255 255;
       255 255 255 255;
       255  0  255 255];
  
m16 = [255 255 255 255;
       255 255 255 255;
       255 255 255 255;
       255 255 255 255];
  
% Transformamos de RGB a 16 niveles de Grises.
  foto = imread(foto);
  foto = rgb2gray(foto);
  foto = round(foto/17);
  [height, width] = size(foto);
  z = zeros(height * 4, width * 4);
  
  for i = 1:height
      for j = 1:width
          i_min = 1 + (4 * (i - 1));
          i_max = i_min + 3;
          j_min = 1 + (4 * (j - 1));
          j_max = j_min + 3;
          if (foto(i, j) == 0)
               z(i_min : i_max, j_min : j_max) = m0;
          elseif (foto(i, j) == 1)
               z(i_min : i_max, j_min : j_max) = m1;
          elseif (foto(i, j) == 2)
               z(i_min : i_max, j_min : j_max) = m2;
          elseif (foto(i, j) == 3)
               z(i_min : i_max, j_min : j_max) = m3;
          elseif (foto(i, j) == 4)
               z(i_min : i_max, j_min : j_max) = m4;
          elseif (foto(i, j) == 5)
               z(i_min : i_max, j_min : j_max) = m5;
          elseif (foto(i, j) == 6)
               z(i_min : i_max, j_min : j_max) = m6;
          elseif (foto(i, j) == 7)
               z(i_min : i_max, j_min : j_max) = m7;
          elseif (foto(i, j) == 8)
               z(i_min : i_max, j_min : j_max) = m8;
          elseif (foto(i, j) == 9)
               z(i_min : i_max, j_min : j_max) = m9;
          elseif (foto(i, j) == 10)
               z(i_min : i_max, j_min : j_max) = m10;
          elseif (foto(i, j) == 11)
               z(i_min : i_max, j_min : j_max) = m11;
          elseif (foto(i, j) == 12)
               z(i_min : i_max, j_min : j_max) = m12;
          elseif (foto(i, j) == 13)
               z(i_min : i_max, j_min : j_max) = m13;
          elseif (foto(i, j) == 14)
               z(i_min : i_max, j_min : j_max) = m14;
          elseif (foto(i, j) == 15)
               z(i_min : i_max, j_min : j_max) = m15;
          elseif (foto(i, j) == 16)
               z(i_min : i_max, j_min : j_max) = m16;
          end
      end     
  end

end

