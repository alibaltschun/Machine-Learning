function [ output_args ] = getSSE( inp ,centroid )
    a = 0;
    for i=1 : length(inp)
        a = norm((inp(i,1:2))-centroid(inp(i,3)));
    end

output_args = a;
end

