%generate_face_from_weights
function [im_re]=generate_face_from_weights(weights_of_face,eignfaces_blk)
eigenface=get_eigenface(eignfaces_blk);
im_re_column=eigenface*weights_of_face;
max_imre=max(max(im_re_column));
min_imre=min(min(im_re_column));
for i=1:length(im_re_column)
    im_re_column(i)=(im_re_column(i)-min_imre)/(max_imre-min_imre);
end
im_re=restore(im_re_column);
end

