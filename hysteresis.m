function final = hysteresis(img, low, high)
    [rows, cols] = size(img);
    final1 = zeros(rows, cols);
    for i = 1:rows
        for j = 1:cols
            if (img(i, j) >= high)
                final1(i, j) = 2;
            elseif (img(i, j) >= low)
                final1(i, j) = 1;
            end
        end
    end
    final = zeros(rows, cols); 
    for i = 2:rows-1
        for j = 2:cols-1
            if (final1(i, j) == 2)
                final(i, j) = 1;
            elseif (final1(i, j) == 1)
                if (sum(sum(final1(i-1:i+1, j-1:j+1) == 2)) > 0)
                    final(i, j) = 1;
                end
            end
        end
    end
end
