function [ output_args ] = MinMaxAvgCtr( cluster1 , cluster2 , jenis)
[panjang1 lebar1] = size(cluster1);
[panjang2 lebar2] = size(cluster2);
data = [];
if(jenis < 4)
    for i=1:panjang1
        for j=1:panjang2
            data =  [data; i j norm(cluster1(i,:)-cluster2(j,:))];
        end
    end
    if(jenis == 1)
        data = sortrows(data,3);
        output_args = data(1,3);
    elseif (jenis == 2)
        data = sortrows(data,3);
        output_args = data(end,3);
    elseif (jenis == 3)
        output_args = mean(data(:,3));
    end
else
    avgCluster1 = mean(cluster1);
    avgCluster2 = mean(cluster2);
    output_args = norm(avgCluster1-avgCluster2);
end

