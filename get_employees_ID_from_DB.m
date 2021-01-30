%get_employees_ID_from_DB
function [ID,ID_list] = get_employees_ID_from_DB (employees_DB,weights_of_face)
ID_list=zeros(100,1);
for k=1:100
    DB=employees_DB(k).weights;
    DB=DB(1:100)';
    DB=DB/135000;
    distance_2=(DB-weights_of_face).^2;
    distance=sqrt(sum(distance_2));
    ID_list(k)=distance;
end
ID=find(ID_list==min(ID_list));
end
