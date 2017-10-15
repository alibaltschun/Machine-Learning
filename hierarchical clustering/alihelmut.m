dataTrain = csvread('Hierarchical_7.csv');
scatter(dataTrain(:,1),dataTrain(:,2));

jenisProximity = 4;
dataTrainCluster = [];
for i=1 : length(dataTrain)
    dataTrainCluster = [dataTrainCluster; i , dataTrain(i,:) ];
end
dataTrainClusterBaru = [];
banyakClass = max(dataTrainCluster(:,1));
for z=1 : length(dataTrain)-1
    jarakAntarCluster = [];
    
    length(unique(dataTrainCluster(:,1)))
    for i=1 : banyakClass-1
        for k=i+1 : banyakClass
            cluster1 = [];
            cluster2 = [];
            for j=1 : length(dataTrainCluster)
                if(dataTrainCluster(j,1) == i)
                    cluster1 = [cluster1 ; dataTrain(j,:)];
                elseif (dataTrainCluster(j,1) == k)
                    cluster2 = [cluster2 ; dataTrain(j,:)];
                end
            end
            if((isempty(cluster1) | isempty (cluster2))~=1)
                jarakAntarCluster = [jarakAntarCluster; i k MinMaxAvgCtr(cluster1,cluster2,jenisProximity)];
            end
        end
    end
    jarakAntarCluster = sortrows(jarakAntarCluster,3);
    dataTrainCluster2 = [];
    banyakClass = banyakClass +1;
    for i=1 : length(dataTrain)
       if(  dataTrainCluster(i,1) == jarakAntarCluster(1,1) | dataTrainCluster(i,1) == jarakAntarCluster(1,2))
           dataTrainClusterBaru = [dataTrainClusterBaru; banyakClass dataTrainCluster(i,1), jarakAntarCluster(1,3)];
           dataTrainCluster2 = [dataTrainCluster2; banyakClass , dataTrain(i,:)];
       else
            dataTrainCluster2 = [dataTrainCluster2; dataTrainCluster(i,:)];
       end
    end
    dataTrainCluster = dataTrainCluster2;
end
