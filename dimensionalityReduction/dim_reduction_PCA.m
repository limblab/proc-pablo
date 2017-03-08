
%
% PCA of neural activity. 
%
%   function dim_red_PCA = dim_reduction_PCA( binnedData, varargin )
%
% Inputs (opt)              : [defaults]
%       smoothed_FR         : matrix with smoothed FRs (1 col is time) or
%                               binned_data struct with field
%                               smoothedspikerate 
%       method              : 'pca' or 'fa'
%       (discard_neurons)   : array with the nbr of the neural channels
%                               to be excluded from the analysis
%       (norm_FR)           : [false] bool to normalize (z-score) the firing rates
%       (show_plot)         : [false] bool to plot the variance explained by the
%                               components
%
% Outputs:
%       dim_red_PCA         : struct with fields:
%       	coeff           : Principal Component Coefficients (pxp). Columns contain coeffs for one PC
%           eigen           : eigenvalues of w
%           Score           : are the representations of DATA in the principal component space. Score = Data*coeff
%           Tsquared        : Hotelling's T-squared statistic for each observation in X
%           Explained       : percentage of the total variance explained by each PC. explained = (latent./(sum(latent)))x100 
% 

function dim_red_PCA = dim_reduction_PCA( binnedData, varargin )

[coeff,scores,latent,tsquared,explained] = pca(binnedData);

cumExpVar = cumsum(explained); %Cumulative Explained Variance
numPCAs = find(cumExpVar>70,1) -1; % Number of PCA that account for 70% variance
figure; plot (cumExpVar, 'LineWidth', 2);xlabel('# PCAs'); ylabel('Cumulative Explained Variance'); %set(gcf,'color','w'); 
hold on; plot(numPCAs,cumExpVar(numPCAs), 'r.', 'markersize', 20);
% -----------------
% create struct to return

        dim_red_PCA.coeff        = coeff;
        dim_red_PCA.scores       = scores;
        dim_red_PCA.latent       = latent;
        dim_red_PCA.tsquared     = tsquared;
        dim_red_PCA.explained    = explained;
        dim_red_PCA.numPCAs      = numPCAs;
end