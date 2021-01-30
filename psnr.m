function PSNR=psnr(im,im1)
im=double(im); 
im1=double(im1); 
[h,w]=size(im);
MSE=sum(sum((im-im1).^2))/(h*w);   
PSNR=10*log10(255^2/MSE);           
end

