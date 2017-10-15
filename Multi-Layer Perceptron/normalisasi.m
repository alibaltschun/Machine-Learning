function [ hasil ] = normalisasi(inp, min, max, min1, max1)
% hasil = (inp - min )/ (max-min)
%     hasil = (max1-min1)/(max-min)*(inp-max)+max1;
hasil = ((max1 - min1 ) * (inp - min) / (max - min)) + min1;
end

