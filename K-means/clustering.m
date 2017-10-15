function [ x y ] = clustering( dataInput, centroid  )
dataOutput = [];
for i=1 : length(dataInput)
    jarak = [];
    for j=1 : length(centroid)
        jarak = [jarak; norm(dataInput(i,:)-centroid(j,:)) j ];
    end
    jarak = sortrows(jarak,1);
    dataOutput = [ dataOutput; dataInput(i,1) dataInput(i,2) jarak(1,2)];
end

centroidOutput = [];
for i=1 : 15
    data = [];
    a = 0;
    for j=1 : length(dataOutput)
        if(dataOutput(j,3) == i)
            data = [data;  dataOutput(j,1) dataOutput(j,2)];
            a = 1;
        end
    end
    if(a == 1)
        centroidOutput = [centroidOutput; mean(data)];
    else
        centroidOutput = [centroidOutput; rand(1,1) rand(1,1)];
    end
end
x = dataOutput;
y = centroidOutput;
end

