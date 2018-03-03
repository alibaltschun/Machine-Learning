DATASET         = csvread('data_train_PNN.csv');

RESULT = [];
COV = 0.01;
for z=1:1000
    z
    ACCURACY_CV = [];
    for y=0:4
        Y = [];
        DATA_TRAIN = [];
        DATA_VALIDATION = DATASET((y*30)+1:((y+1)*30),:);
        
        if(y<4)
            DATA_TRAIN  = DATASET((y+1)*30+1:150,:);
        end
        if(y>0)
            DATA_TRAIN = [DATA_TRAIN; DATASET(1:y*30,:)];
        end
        
        for i=1:20 
            PROB = [0,0,0;0,0,0];
            for j=1:120
                DIST = activation_function(DATA_VALIDATION(i,1:3),DATA_TRAIN(j,1:3),COV);
                PROB(1,DATA_TRAIN(j,4)+1) = PROB(1,DATA_TRAIN(j,4)+1)+ DIST;
                PROB(2,DATA_TRAIN(j,4)+1) = PROB(2,DATA_TRAIN(j,4)+1)+1;
            end
            PROB = [PROB(1,1)/(PROB(2,1)+ power(10,-10)) PROB(1,2)/(PROB(2,2)+ power(10,-10)) PROB(1,3)/(PROB(2,2)+ power(10,-10))];
            [VALUE,INDEX] = max(PROB);
            Y = [Y;INDEX-1];
        end

        ACCURACY = 0;
        for i=1:20
            if(Y(i) == DATA_VALIDATION(i,4))
                ACCURACY = ACCURACY + 1;
            end
        end
        ACCURACY = ACCURACY/20;
        
        ACCURACY_CV = [ACCURACY_CV; ACCURACY];
    end
    RESULT = [RESULT; mean(ACCURACY_CV)];
    COV = COV + 0.01;
%     plot(ACCURACY_CV)
end

plot(RESULT)

% =========================================================================

DATA_TEST = csvread('data_test_PNN.csv'); 

[MAX_ACCURACY,OPTIMAL_COV] = max(RESULT);
OPTIMAL_COV = OPTIMAL_COV * 0.01;

DATA_TEST_LABEL = [];
for i=1:30
    PROB = [0,0,0;0,0,0];
    for j=1:150
          DIST = activation_function(DATA_TEST(i,1:3),DATASET(j,1:3),OPTIMAL_COV);
          PROB(1,DATASET(j,4)+1) = PROB(1,DATASET(j,4)+1)+ DIST;
          PROB(2,DATASET(j,4)+1) = PROB(2,DATASET(j,4)+1)+1;
    end
    PROB = [PROB(1,1)/(PROB(2,1)+ power(10,-10)) PROB(1,2)/(PROB(2,2)+ power(10,-10)) PROB(1,3)/(PROB(2,2)+ power(10,-10))];
    [VALUE,INDEX] = max(PROB);
    DATA_TEST_LABEL = [DATA_TEST_LABEL;INDEX-1];
end


