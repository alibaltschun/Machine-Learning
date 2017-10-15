% dataTrain   = csvread('r15.csv');
% plotHasil(dataTest);
% 
% meanOfAtribute = []
% for i=1 : 15  
%     meanOfAtribute = [ meanOfAtribute ; mean(dataTrain((40*(i-1) + 1):(40*i),1)) , mean(dataTrain((40*(i-1) + 1):(40*i),2))];
% end
% [prior] = getPrior(dataTrain(:,3));
% 
% standarDeviasi = []
% variance = [];
% for i=1 :15
%     a = 0;
%     b = 0;
%     for j=1 : 40
%         a = a + (dataTrain(((40*(i-1))+j),1) - meanOfAtribute(i,1)).^2;
%         b = b + (dataTrain(((40*(i-1))+j),2) - meanOfAtribute(i,2)).^2;
%     end
%     standarDeviasi  = [ standarDeviasi ; a/40,b/40];
%     variance        = [variance ; sqrt(a/40), sqrt(b/40)];
% end
% 
% dataTest = []
% for i=1 : 600
%     likelihood      = [];
%     posterior       = [];
%     [likelihood]    = getLikeliHood( dataTrain(i,:), meanOfAtribute , variance );
%     [posterior]     = getPosterior( likelihood , prior(:,2) );
%     [outputClass]   = getClass(posterior);
%       outputClass     = naiveBayes( dataTrain(i,:) , meanOfAtribute , variance , prior(:,2 ));
%       dataTest        = [dataTest ; dataTrain(i,1),dataTrain(i,2), outputClass];
% end
[a] = getPerfome( dataTrain , dataTest , 1 );
% decbound2D(dataTrain(:,1),dataTest(:,2), meanOfAtribute , variance , prior);
