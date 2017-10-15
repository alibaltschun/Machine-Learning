function [ outputPosterior ] = getPosterior( likeLiHood , prior )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    a = []
    for i=1 : 15
        a = [a ; likeLiHood(i,1) * likeLiHood(i,2) * prior(i)];
    end
    outputPosterior = a;
end

