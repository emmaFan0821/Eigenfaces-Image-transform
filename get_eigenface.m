%% normalize them to be orthonormal %%
function [eigenface]=get_eigenface(eignfaces_blk)
BLK=zeros(135000,100);
for i=1:100
    matrix=eignfaces_blk(:,:,i);
    column=stretch(matrix);
    BLK(:,i)=column;
end

eigenface=zeros(135000,1);
for i=1:100
    mode=dot(BLK(:,i),BLK(:,i));
    mode=sqrt(mode);
    eigenface(:,i)=BLK(:,i)./mode;
end
end
