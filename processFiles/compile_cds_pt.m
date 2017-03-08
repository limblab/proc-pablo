clear; clc;
% This is a wrapper function to convert a .nev file to CDS format

monkey = 'Jango'; 
ranBy = 'Pablo';
lab = 1;
task ='WF'; % Usually 3 letters

direc = 'C:\Users\Pablo_Tostado\Desktop\Northwestern_University\MyWorkFolder\Analysis\Data\Jango\IsometricTask\Dec_13_16\';
direcmap = 'C:\Users\Pablo_Tostado\Desktop\Northwestern_University\MyWorkFolder\Analysis\Data\Jango\MapFiles\';

filename = {'IsometricTask_brainEMG_121306_001.nev'}; % continue adding files if necessary
mapfiles = {'Jango_RightM1_utahArrayMap.cmp'}; % continue adding mapfiles if necessary
array_names = {'arrayM1'};  


%% load data into cds:
cds=commonDataStructure(); %make blank cds class:

for filenum = 1:length(filename)
    
    mapFile = [direcmap mapfiles{filenum}];
    filePath = [direc filename{filenum}];
    
    cds.file2cds(filePath,lab,['array' array_names{filenum}],['monkey' monkey],...
            ['task' task],['ranBy' ranBy],'ignoreJumps',['mapFile' mapFile]);
end

save([direc 'cds.mat'], 'cds');

%% Convert to Matt's By Trial data struct
clc;
params.meta = struct('TrialTable', cds.trials); %Add TrialTable to output struct.
params.exclude_units = 255; %Only exclude invalid, keep unsorted units.
params.trial_results = 'R'; %If we want only successful trials. (all_points will disregard this)
params.bin_size = 0.01;     %Bin size
params.all_points = true;   %Include all points, so that trials concatenate (will disregard results).

[trial_data,td_params] = parseFileByTrial(cds, params);

%% Do pca

%First concatenate spikes + emg to have continuous data



