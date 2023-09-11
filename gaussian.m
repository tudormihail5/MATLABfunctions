function [Gx, Gy] = gaussian(size, sigma)
    [X,Y] = meshgrid(-(size-1)/2:(size-1)/2);
    G = exp(-(X.^2 + Y.^2)/(2*sigma^2));
    Gx = -(X / sigma^2) .* G;
    Gy = -(Y / sigma^2) .* G;
end
