function [TPR, FPR] = ROC(edge, ground)
    [~, ~, types] = edges(edge, ground);
    TP = sum(types == 1); % true positives
    FN = sum(types == 2); % false negatives
    FP = sum(types == 3); % false positives
    TN = sum(types == 4); % true negatives
    TPR = TP / (TP + FN);
    FPR = FP / (FP + TN);
end
