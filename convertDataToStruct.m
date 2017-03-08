
%Wrapping function to convert data into struct type

baseDirectory = 'C:\Users\Pablo_Tostado\Desktop\Northwestern_University\MyWorkFolder\Analysis\Data\Jango\IsometricTask\';
convertFolders = 'Jan_16_17';

%Convert to BDF
%convertNEVToBDF (baseDirectory,convertFolders)

filePath = 'C:\Users\Pablo_Tostado\Desktop\Northwestern_University\MyWorkFolder\Analysis\Data\Jango\IsometricTask\Jan_16_17\BDFStructs\FreeReaching_brainEMG_011617_001';
load(filePath);

bdf_struct = out_struct;
%Plot all EMGs
plot_all_emgs( bdf_struct )