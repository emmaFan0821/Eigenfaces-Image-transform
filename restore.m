function matrix=restore(column)
[~,n]=size(column);
matrix=zeros(450,300);
for i=1:n
    for j=1:300
        matrix(:,j)=column(((j-1)*450+1):450*j,i);
    end
end
end
