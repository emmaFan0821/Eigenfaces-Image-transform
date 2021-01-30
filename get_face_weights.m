%get_face_weights
function [weights_of_face] = get_face_weights(im, eignfaces_blk)
im = im2double(im);
im_column=stretch(im);
eigenface=get_eigenface(eignfaces_blk);
weights_of_face=zeros(100,1);
for i=1:100
    w=im_column.*eigenface(:,i);
    weights_of_face(i)=sum(w)/135000;
end
end