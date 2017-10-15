function [ outputClass ] = getClass( porsterior )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    a = [];
    for i=1 : 15
        a = [ a ; porsterior(i),i];
    end
    a = sortrows(a,1);
    outputClass = a(15,2);
end

