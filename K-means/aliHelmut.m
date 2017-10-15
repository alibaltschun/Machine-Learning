% dataTrain = csvread('R15.csv');
% % scatter(dataTrain(:,1),dataTrain(:,2));
% % plotHasil(dataTrain);
% max1 = 0.999;
% min1 = 0.001;
% max2 = max(dataTrain);
% min2 = min(dataTrain);
% 
% 
% dataTrainNormal = [];
% for i=1 : length(dataTrain)
%     dataTrainNormal = [dataTrainNormal; normalisasi(dataTrain(i,1), min2(1,1), max2(1,1), min1, max1) , normalisasi(dataTrain(i,2), min2(1,2), max2(1,2), min1, max1)];
% end
% 
% centroid = rand(15,2);
% % centroid  = [];
% % for i=1 : 15
% %     x = floor(1 +( 40 - 1) * rand(1,1));
% %     centroid = [centroid; dataTrainNormal(x*i,1) dataTrainNormal(x*i,2)];
% % end
% 
% eppoch = 0;
% y = centroid - 0.1;
% while (isequal(centroid,y)==0)
%     eppoch = eppoch + 1
%     centroid = y;
%     [x y] = clustering ( dataTrainNormal , centroid );
% end
% 
% 
% z = [];
% for i=1 : 15
%     z = [z;centroid(i,1) centroid(i,2) i];
% end
plotHasil(x);
% hold on
% 
% plotinHasil2(z);
% [ SSE ] = getSSE(x,centroid);
