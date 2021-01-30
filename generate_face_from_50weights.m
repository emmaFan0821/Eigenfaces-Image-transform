%% generate_face_from_50weights
function im_re50=generate_face_from_50weights(weights_of_face50,eignfaces_blk50)
BLK50=zeros(135000,50);
for i=1:50
    matrix50=eignfaces_blk50(:,:,i);
    column50=stretch(matrix50);
    BLK50(:,i)=column50;
end
eigenface50=zeros(135000,1);
for i=1:50
    mode50=dot(BLK50(:,i),BLK50(:,i));
    mode50=sqrt(mode50);
    eigenface50(:,i)=BLK50(:,i)./mode50;
end

im_re_column50=eigenface50*weights_of_face50;
max_imre=max(max(im_re_column50));
min_imre=min(min(im_re_column50));
for i=1:length(im_re_column50)
    im_re_column50(i)=(im_re_column50(i)-min_imre)/(max_imre-min_imre);
end
im_re50=restore(im_re_column50);
end


