function [matches, nonMatches, types] = edges(edge, ground)
    matches = edge & ground;
    nonMatches = edge & ~ground;
    types = zeros(size(edge));
    types(matches) = 1; % true positive
    types(~edge & ground) = 2; % false negative
    types(~ground & edge) = 3; % false positive
    types(~edge & ~ground) = 4; % true negative
end
