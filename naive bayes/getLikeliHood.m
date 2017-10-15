function [ classOutput ] = getLikeliHood( datInput, meanAtribute , Variance )
    likelihood = [];
    for i=1 : 15
        likelihood = [ likelihood ;(1/(Variance(i,1)*sqrt(44/7)))* exp(-1*(datInput(1,1)-meanAtribute(i,1)).^(2))/(2*(Variance(i,1).^(2))), (1/(Variance(i,2)*sqrt(44/7)))* exp(-1*(datInput(1,2)-meanAtribute(i,2)).^(2))/(2*(Variance(i,2).^(2)))];
    end
    classOutput = likelihood;
end

