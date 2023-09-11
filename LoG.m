function mask = LoG(kernel, sigma)
    [X,Y] = meshgrid(-(kernel-1)/2:(kernel-1)/2);
    mask = ((X.^2 + Y.^2 - 2*sigma^2)/(sigma^4)) .* exp(-(X.^2 + Y.^2)/(2*sigma^2));
end
