function hmms = createHMMs
words = {'kanker','griep', 'diarree', 'hoofdpijn', 'geirriteerde','moe'};
sizes = [6, 6, 7, 9, 10, 4];
% words = {'kanker', 'diabetes'};
% sizes = [6, 9];
hmms = {};
for i = 1:size(words,2)
    filepath = strcat('Sounds/Training/', cell2mat(words(i)));
    dirData = dir(filepath);
    dirIndex = [dirData.isdir];
    fileList = {dirData(~dirIndex).name};
    nSamples = size(fileList);
    fvs = {};
    lData = zeros(nSamples);    
    index = 1;
    for wav = fileList
%         strcat(filepath, '/', cell2mat(wav))
        fv = getFeatureVectors(strcat(filepath, '/', cell2mat(wav)));
        fvs{index} = fv;
        lData(index) = size(fv, 2);
        index = index + 1;
    end
%     hmms{i} = MakeLeftRightHMM(getOptimalStates(words{i}), GaussD, cell2mat(fvs), lData);
    hmms{i} = MakeLeftRightHMM(sizes(i) + 3, GaussD, cell2mat(fvs), lData);
end
