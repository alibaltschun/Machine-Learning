% dataTrain = csvread('R15.csv');
% dataTrain2 = [dataTrain(:,1),dataTrain(:,2)];
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

centroid  = [];
for i=1 : 15
    centroid = [centroid; dataTrainNormal(i*40,1) dataTrainNormal(i*40,2)];
end

dataTrain3 = [];
for i=1 : length(dataTrain)
    jarak = [];
    for j=1 : length(centroid)
        jarak = [jarak; norm(dataTrainNormal(i,:)-centroid(j,:)) j ];
    end
    jarak = sortrows(jarak,1);
    dataTrain3 = [ dataTrain3; dataTrainNormal(i,1) dataTrainNormal(i,2) jarak(1,2)]; 
end

centroid = [];
for i=1 : 15
    data = [];
    for j=1 : length(dataTrain3)
        if(dataTrain3(j,3) == i)
           data = [data;  dataTrain3(j,1) dataTrain3(j,2)]; 
        end
    end
    centroid = [centroid; mean(data)];  
end