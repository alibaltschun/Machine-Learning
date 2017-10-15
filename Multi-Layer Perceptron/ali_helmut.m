dataTrain1   = csvread('spiral.csv');
dataTrain = [];
lr     = 0.001;
bobot1 = 0.0001 * rand([2,3]);
bobot2 = 0.0001 * rand([3,3]);
target = eye(3);
MSE    = [];
E      = [];
A1     = [];
A2     = [];
[panjang lebar] = size(dataTrain);
max1 = 0.999;
min1 = 0.001;
maxA = max(dataTrain1(:,1));
minA = min(dataTrain1(:,1));
maxB = max(dataTrain1(:,2));
minB = min(dataTrain1(:,2));


for i=1 : length(dataTrain1)
    dataTrain = [dataTrain; normalisasi( dataTrain1(i,1) ,minA, maxA, min1, max1)  normalisasi( dataTrain1(i,2), minB, maxB, min1, max1) dataTrain1(i,3)];
end

% % plotHasil(dataTrain);

% 
for i=1 : 20
[bobot1Baru bobot2Baru c] = propagasiMajuMundur( dataTrain , bobot1 , bobot2 ,lr);
bobot2  = bobot2+bobot2Baru;
bobot1  = bobot1+bobot1Baru;
MSE     = [MSE ; c];
i
end
 aa = [];
 for i=1 : length(dataTrain)
    [ a b c]  = propagasiMaju( dataTrain(i,:) , bobot1 , bobot2);   
    aa = [aa; a];
    A2      = [A2; b];
    E       = [E; c];
 end
%  
 
% x = [dataTrain(1,1) dataTrain(1,2)];
% A1 = x*bobot1;
% y =[];
% [panjang lebar] = size(A2)
% for j=1 : panjang
%     D2  = [];
%     DW2 = [];
%     d   = [];
%     for i=1 : lebar
%         D2 = [ D2 (A2(j,i) * (1 - A2(j,i)) * b(j,i))];
%         d  = [d lr * D2(1,i) * A1(1,i)];
%     end
%     DW2 = [DW2 d ]; 
%     y   = [y;  d ];
% end



% hasilTesting    = [];
% hasilClass      = [];
% for i=1: banyakData
%     a = [];
%     a = [ a pembulatan(A2(i,:))];  
%     hasilTesting = [hasilTesting ; a];
%     hasilClass = [hasilClass; getClass( hasilTesting(i,:) )];
% end

% for epoch=1 : 10000
%     hasil1  = [];
%     error1  = [];
%     hasilA1 = [];
%         for i=1: banyakData
%             [ a b c] = propagasiMajuMundur( dataTrain(i,:) , bobot1 , bobot2 , target , lr);
%             hasil1 = [ hasil1 ; a];
%             bobot2 = bobot2 + b;
%             bobot1 = bobot1 + c;
%         end
%     epoch
% end
 
%  for i=1: banyakData
%     [A1 b  c] = propagasiMaju( dataTrain(i,:) , bobot1 , bobot2);         
%     A2  = [A2; b];
%     E = [E; c];
%  end


% 
% hasilPerfom = [];
% for epoch=1 : 2
%      for i=1: banyakData
%          A2 = [];
%          E  = [];
%          for j=1: banyakData
%             [A1 b  c] = propagasiMaju( dataTrain(j,:) , bobot1 , bobot2);         
%             A2  = [A2; b];
%             E   = [E; c];
%          end
%          if mod(i,5) == 1
%              DW2 = [];
%              [ DW2 ] = propagasiMundur( A1 ,A2(i,:) ,mean(E) ,lr , bobot2 ) ;
%              bobot2 = bobot2 + DW2;
%          end
%      epoch
%      end
% end
% % end
% 
% 
% 
% hasilTesting = [];
% hasilClass = [];
% for i=1: banyakData
%     a = [];
%       a = [ a pembulatan(A2)];  
%     hasilTesting = [hasilTesting ; a];
%     hasilClass = [hasilClass; getClass( hasilTesting(i,:) )];
% end

% [perfom] = getPerfome( dataTrain , hasilClass , 2 );
% hasilPerfom = [hasilPerfom ; perfom];
% end