function [ output_args ] = pembulatan( A2 )
a = [];
for j=1 : length(A2)
    if(A2(1,j) > 0.90)
        b = 1;
    else
        b = 0;
    end
    a = [a ;b];
end
    output_args = a;
end

