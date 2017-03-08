
% This is my function to evaluate a fit.
% It gives the R2 coefficient.

function [Rsquared, vaf] = evaluateFit_funct(inputData, predictedData)

% Sum (predictions - input)^2
meanSquaredError = (inputData - predictedData).^2;
sumMeanSquareError = sum(meanSquaredError,2);

% Sum (MeanInput - Input)^2
meanError = (mean(inputData,2) - inputData).^2;
sumMeanError = sum(meanError,2);

Rsquared = 1 - (sumMeanSquareError - sumMeanError);

end