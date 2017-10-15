function [ hasil ] = normalisasi(inp, min, max, min1, max1)
hasil = ((max1 - min1 ) * (inp - min) / (max - min)) + min1;
end

