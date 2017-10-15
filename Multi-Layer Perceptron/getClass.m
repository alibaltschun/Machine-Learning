function [ hasilclass ] = getClass( dataTrain )
target = eye(3);
a = 0;
if(dataTrain == target(1,:))
    a = 1;
elseif(dataTrain == target(2,:))
    a = 2;
elseif(dataTrain == target(3,:))
    a = 3;
else
    a = 3;
end
hasilclass = a;
end

