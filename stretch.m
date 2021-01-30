function column=stretch(matrix)
column=zeros(135000,1);
for j=1:300
    column(((j-1)*450+1):450*j)=matrix(:,j);
end 
end
