monkey= 'MonkeyName'; 
ranBy= 'Person';
lab= LABNUMBER;
task='TASK_CODE'; % Usually 3 letters

direc = 'PATH_TO_FOLDER_CONTAINING_FILES';
direcmap = 'PATH_TO_FOLDER_CONTAINING_MAPFILES';

filename = {'Name_of_file'}; % continue adding files if necessary
mapfiles = {'Name_of_mapfile'}; % continue adding mapfiles if necessary
array_names = {'ArrayName'}; % 

% example for dual array:
%   filename = {'monkey_name_recording_m1','monkey_name_recording_pmd'};
%   mapfiles = {'mapfileM1','mapfilePMd'};
%   arraynames = {'M1','PMd'};

%% load data into cds:
cds=commonDataStructure(); %make blank cds class:

for filenum = 1:length(filename)
    
    mapFile = [direcmap mapfiles{filenum}];
    
    cds.file2cds(filename{filenum},lab,['array' array_names{filenum}],['monkey' monkey],...
            ['task' task],['ranBy' ranBy],'ignoreJumps',['mapFile' mapFile]);
end
