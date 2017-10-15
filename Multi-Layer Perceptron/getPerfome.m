function [ perfom] = getPerfome( dataTrain , dataTest , jenisOutput )
%jenis: 1=micro , 2=macro ,3=simple accu
    a = unique(dataTrain(:,3));
    hasil = []; %tp fn fp tn
    
    for i=1 : length(a)
        tp = 0;
        tn = 0;
        fp = 0;
        fn = 0;
        for j=1 : length(dataTrain)
            if(dataTrain(j,3) == a(i))
                if(dataTest(j) == dataTrain(j,3))
                    tp = tp+1;
                end
                if(dataTest(j) ~= dataTrain(j,3))
                    fn = fn+1;
                end
            else
                if(a(i) == dataTrain(j,3))
                    fp = fp+1;
                end
                if(a(i) ~= dataTrain(j,3))
                    tn = tn+1;
                end
            end
        end
        hasil = [ hasil; tp fn fp tn];
    end
    hasil;
    hasilPerKelas = []; % recall precision f1
    
    [xx yy] = size(hasil);
    for i=1 : xx
           recall           = (hasil(i,1)+1) / ( hasil(i,1) + hasil(i,2) +1);
           precision        = (hasil(i,1)+1) / ( hasil(i,1) + hasil(i,3) +1);
           f1               = ( 2 * recall * precision ) / ( precision + recall);
           hasilPerKelas    = [hasilPerKelas; recall precision f1];
    end
       
    if(jenisOutput == 2)   
       perfom = mean(hasilPerKelas(:,3));
    elseif (jenisOutput == 1)
        r = mean(hasilPerKelas(:,1));
        p = mean(hasilPerKelas(:,2))
        perfom      = ( 2 * r * p ) / ( r + p);
    elseif (jenisOutput == 3)
        tp = 0;
        for i=1 : length(hasil)
            tp = tp + hasil(i,1);
        end
        perfom = tp / length(dataTrain(:,3));
    end 
end

