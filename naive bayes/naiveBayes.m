function [ outputClass ] = naiveBayes( dataTrain , meanOfAtribute , variance , prior )
    likelihood      = [];
    posterior       = [];
    [likelihood]    = getLikeliHood( dataTrain, meanOfAtribute , variance );
    [posterior]     = getPosterior( likelihood , prior );
    [outputClass]   = getClass(posterior);
end

