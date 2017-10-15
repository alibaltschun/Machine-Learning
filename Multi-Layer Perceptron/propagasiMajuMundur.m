function [ bobot1Baru bobot2Baru c] = propagasiMajuMundur( inputan , bobot1i , bobot2i ,lr)
target = eye(3);
dataA1 = [];
dataA2 = [];
dataW2 = [];
dataE  = [];
bobot1 = bobot1i;
bobot2 = bobot2i;
[panjang lebar] = size(inputan);

for j=1 : panjang
    inp     = [inputan(j,1) inputan(j,2)];
    V1      = inp * bobot1;
    A1      = [];   
    
    for i=1:length(V1)
        A1  = [A1 ,(1 / ( 1 + exp(-V1(1,i))))];
    end
    
    V2      = A1 * bobot2;
    A2      = [];  
    for i=1:length(V2)
        A2 = [A2 ,(1 / ( 1 + exp(-V2(1,i))))];
    end
    
    dataE   = [dataE ;(target(inputan(1,3),:) - A2)];
    dataA2  = [dataA2 ; A2];
    dataA1  = [dataA1 ; A1];
end
c = mean(dataE);

[panjang1 lebar1] = size(bobot1);
[panjang2 lebar2] = size(bobot2);
DW2 = [];
DW1 = [];
d2  = [];
d1  = [];
for i=1 : length(inputan)
    xd2 = [];
    for j=1 : lebar2
        xd2 = [xd2 dataA2(i,j) * (1 -dataA2(i,j)) * dataE(i,j)];
    end
    d2 = [ d2; xd2];
end
for i=1 :length(inputan)
    xd1 = [];
    for j=1 : lebar1
        xd1 = [xd1 dataA1(i,j) * (1 - dataA1(i,j)) * bobot2(:,j) *  d2(:,j)'];
    end
    d1 = [ d1; xd1];
end
for i=1 : panjang2
    a = [];
    for j=1 : lebar2
        b = 0;
        for k=1 : lebar2
            b = b + d2(i,k) * dataA1 (i,j);
        end
        a = [a b];
    end
    DW2 = [DW2 ; a];
end
for i=1 : panjang1
    a = [];
    for j=1 : lebar1
        b = 0;
        for k=1 : lebar1
            b = b + d1(i,k) * inputan (i,j);
        end
        a = [a b];
    end
    DW1 = [DW1 ; a];
end


bobot1Baru = bobot1;
bobot2Baru = bobot2;

    
end

