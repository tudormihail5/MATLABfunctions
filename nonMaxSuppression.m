function final = nonMaxSuppression(magnitude, direction)
[rows, cols] = size(magnitude);
final = zeros(rows, cols);
for i = 2:rows-1
    for j = 2:cols-1
        angle = direction(i, j);
        if (angle < 0)
            angle = angle + 180;
        end
        if ((angle >= 67.5 && angle < 112.5))
            neighbors = [magnitude(i+1, j) magnitude(i-1, j)];
        elseif ((angle >= 22.5 && angle < 67.5) || (angle >= 112.5 && angle < 157.5))
            neighbors = [magnitude(i+1, j-1) magnitude(i-1, j+1)];
        elseif ((angle >= 0 && angle < 22.5) || (angle >= 157.5 && angle < 180))
            neighbors = [magnitude(i, j+1) magnitude(i, j-1)];
        end
        if (magnitude(i, j) >= max(neighbors))
            final(i, j) = magnitude(i, j);
        end
    end
end
end
