function [ output_args ] = hitung_prob( x,y,cov)

output_args = exp(- power(norm(x-y),2) /(2 * power(cov,2)));

end

