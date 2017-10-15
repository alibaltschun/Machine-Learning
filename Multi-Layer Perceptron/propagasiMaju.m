function [ a b c] = propagasiMaju( inputan , bobot1 , bobot2 )
target = eye(3);
inp = [inputan(1,1) inputan(1,2)];
V1 = inp * bobot1;

A1 = [];    
for i=1:length(V1)
    A1 = [A1 ,(1 / ( 1 + exp(-1 * V1(1,i))))];
end

V2 = A1 * bobot2;
A2 = [];  
for i=1:length(V2)
    A2 = [A2 ,(1 / ( 1 + exp(-1 *V2(1,i))))];
end
E = target(inputan(1,3),:) - A2;
b = A2;
c = E;
a = A1;
end

