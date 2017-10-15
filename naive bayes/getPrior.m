function [ outputPrior ] = getPrior( data )
    a = unique(data);
    b = [];
    total = 0;
    for i=1 : length(a)
        d =0;
        for j=1 : length(data)
            if(data(j) == a(i))
            d = d + 1;
            end  
        end
        b = [ b ; a(i) d/length(data) d ];
    end
    outputPrior = b;
end

