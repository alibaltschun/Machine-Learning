function [ output_args ] = activation_function( x , y , sesuatu )
    output_args = exp( - power(norm(x-y),2)/(2*power(sesuatu,2)));
end

