function plotinHasil (datas)
a = datas;
b = (datas(:,1:2));
for i=1:size(a,1)
    if a(i,3) == 1
        scatter(b(i,1), b(i,2), '^', '.r');
        hold on;
    elseif a(i,3) == 2
        scatter(b(i,1), b(i,2), '^', '.g');
        hold on;
    elseif a(i,3) == 3
        scatter(b(i,1), b(i,2), '^','.b');
        hold on;
    elseif a(i,3) == 4
        scatter(b(i,1), b(i,2), '^','.k');
        hold on;
    elseif a(i,3) == 5
        scatter(b(i,1), b(i,2), '+','.r');
        hold on;
    elseif a(i,3) == 6
        scatter(b(i,1), b(i,2), '+','.g');
        hold on;
    elseif a(i,3) == 7
        scatter(b(i,1), b(i,2), '+','.b');
        hold on;
    elseif a(i,3) == 8
        scatter(b(i,1), b(i,2), '+','.k');
        hold on;
    elseif a(i,3) == 9
        scatter(b(i,1), b(i,2), '*','.r');
        hold on;
    elseif a(i,3) == 10
        scatter(b(i,1), b(i,2), '*','.g');
        hold on;
    elseif a(i,3) == 11
        scatter(b(i,1), b(i,2), '*','.b');
        hold on;
    elseif a(i,3) == 12
        scatter(b(i,1), b(i,2), '*','.k');
        hold on;
    elseif a(i,3) == 13
        scatter(b(i,1), b(i,2), 'o','.r');
        hold on;
    elseif a(i,3) == 14
        scatter(b(i,1), b(i,2), 'o','.g');
        hold on;
    elseif a(i,3) == 15
        scatter(b(i,1), b(i,2), 'o','.b');
        hold on;
    end

end