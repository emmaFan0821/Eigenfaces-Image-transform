close all; clc;
%% Orthonormal basis %%
Face=load('data_for_labC.mat');
eignfaces_blk=Face.eignfaces_blk;
figure,
for i=1:25
    subplot(5,5,i),imshow(eignfaces_blk(:,:,i))
end

BLK=zeros(135000,100);
for i=1:100
    matrix=eignfaces_blk(:,:,i);
    column=stretch(matrix);
    BLK(:,i)=column;
end

diag=zeros(100*100,1);
for i=1:100
    for j=1:100
        diag(i,j)=round(dot(BLK(:,i),BLK(:,j)));        
    end
end
isortho=isdiag(diag);
if isortho
    fprintf('The eigenfaces are orthogonal\n')
else
    fprintf('The eigenfaces are not orthogonal')
end
%normalize them to be orthonormal
[eigenface]=get_eigenface(eignfaces_blk);
diag2=zeros(100,100);
for i=1:100
    for j=1:100
        diag2(i,j)=round(dot(eigenface(:,i),eigenface(:,j)));        
    end
end
%% Evaluating the Eigenfaces weights of a face %%
im=imread('find_id.jpg');
[weights_of_face] = get_face_weights(im, eignfaces_blk);
figure,
x=1:1:100;
plot(x,weights_of_face,'-b'); 
legend('weights of test face');   
xlabel('basis')  
ylabel('weight') 

%% Face generation from its “weights” %%
im_re=generate_face_from_weights(weights_of_face,eignfaces_blk);
figure,
subplot(1,2,1);imshow(im);title('original im');
subplot(1,2,2);imshow(im_re);title('restored im');
PSNR1=psnr(im,im_re);
fprintf('PSNR of im and im_restored：%fdB\n',PSNR1)
%try 50 weights
weights_of_face50 = weights_of_face(1:50);
eignfaces_blk50 = eignfaces_blk(:,:,1:50);
im_re50=generate_face_from_50weights(weights_of_face50,eignfaces_blk50);
figure,
subplot(1,2,1);imshow(im_re);title('restored im');
subplot(1,2,2);imshow(im_re50);title('restored im 50 weights');
PSNR2=psnr(im,im_re50);
fprintf('PSNR of im and im_restored (50 weights)：%fdB\n',PSNR2)

%% Recognizing an employee from his/her image %%
employees_DB=Face.employees_DB;
[ID,ID_list] = get_employees_ID_from_DB (employees_DB,weights_of_face);
figure,
x=1:1:100;
plot(x,ID_list,'-r'); 
legend('distance of weights');   
xlabel('ID')  
ylabel('distance') 
fprintf('the employee ID is: %d\n', ID);
%show the most approximate image-ID
weight_ID=employees_DB(ID).weights;
weight_ID=weight_ID(1:100)';

im_id=generate_face_from_weights(weight_ID,eignfaces_blk);
figure,
subplot(1,3,1);imshow(im);title('original im');
subplot(1,3,2);imshow(im_re);title('restored im');
subplot(1,3,3);imshow(im_id);title('approximate im');
PSNR3=psnr(im,im_id);
fprintf('PSNR of im and approximate im：%fdB\n',PSNR3)

