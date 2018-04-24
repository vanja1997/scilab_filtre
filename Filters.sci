function newimg = rvb2nb(img)
	// conversion d'une image en noir et blanc

	r = img(:,:,1)
	g = img(:,:,2)
	b = img(:,:,3)
	newimg = imlincomb(0.299,r,0.587,g,0.114,b)
endfunction

function y = demon(x)
    [nl,nc]=size(x)
    y = [];
    for i=2:nl-1
        for j=2:nc-1
            y(i,j)=(x(i,j)+x(i-1,j-1)+x(i,j-1)+x(i+1,j-1)+x(i-1,j)+x(i+1,j)+x(i-1,j+1)+x(i,j+1)+x(i+1,j+1))/9
        end
    end
endfunction


function zoomed_im = zoom(original_im,zoom_multipl)

    [x,y,c] = size(original_im);

    for i=1 : x
        for j=1 : y
            for mod_x = ((zoom_multipl *(i -1))+1) : (((zoom_multipl *(i -1))+1) + zoom_multipl)
                for mod_y = ((zoom_multipl *(j -1))+1) : (((zoom_multipl *(j -1))+1) + zoom_multipl)
                    zoomed_im(mod_x,mod_y,:) = matrix(original_im(i,j,:),1,c)
                end
            end
        end
    end
endfunction


function newimg = flipImageVertic(img)

    [x,y,c] = size(img)
    for i = 1 : x
       for j = 1 : y/2+1
          newimg(i,j,:) = matrix(img(i,y-j+1,:),1,c)
          newimg(i,y-j+1,:) = matrix(img(i,j,:),1,c)
       end
    end
endfunction

function newimg = flipImageHoriz(img)
     [x,y,c] = size(img)
     for i = 1 : x/2+1
        for j = 1 : y
            newimg(i,j,:) = matrix(img(x-i+1,j,:),1,c)
            newimg(x-i+1,j,:) = matrix(img(i,j,:),1,c)
        end 
     end
endfunction

function newimg = flipImageBoth(img)
     [x,y,c] = size(img)
     for i=1:x
        for j=1:y/2+1
            newimg(i,j,:)=matrix(img(x-i+1, y-j+1,:),1,3)
            newimg(x-i+1, y-j+1,:)=matrix(img(i,j,:),1,3)
        end
     end
endfunction

function blurred_image = gaussianBlur(image)
    H = fspecial('gaussian',27,3);
    blurred_image = imfilter(image,H);
endfunction

function contourpre =gradientprewitt(image)
    image = rvb2nb(image)
    contourpre = edge(image,'prewitt')
endfunction

function contourpre =gradientsobel(image)
    H = fspecial('sobel');
    contourpre = imfilter(image,H);
endfunction

function contourpre =gradientcanny(image)
    image = rvb2nb(image)
    contourpre = edge(image,'canny')
endfunction

function negative = negatif(image)
    negative = 255 - image
endfunction

function rouge =red(image)
    Blanc = uint8(zeros(image(:,:,1)))
	rouge = image(:,:,1)
	rouge(:,:,2) = Blanc
	rouge(:,:,3) = Blanc
endfunction

function bleu =blue(image)
    Blanc = uint8(zeros(image(:,:,1)))
	bleu(:,:,1)= Blanc
	bleu(:,:,2)= Blanc
	bleu(:,:,3)= image(:,:,3)
endfunction

function vert =green(image)
    Blanc = uint8(zeros(image(:,:,1)))
	vert(:,:,1) = Blanc
	vert(:,:,2) = image(:,:,2)
	vert(:,:,3) = Blanc
endfunction

