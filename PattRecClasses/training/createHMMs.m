function hmms = createHMMs
words = {'kanker','moe', 'diabetes', 'tyfus'};
sizes = [9, 6, 12, 8];
hmms = {};
for i = 1:size(words,2)
    filepath = strcat('Sounds/Training_new/', cell2mat(words(i)));
    dirData = dir(filepath);
    dirIndex = [dirData.isdir];
    fileList = {dirData(~dirIndex).name};
    nSamples = size(fileList);
    fvs = {};
    lData = zeros(nSamples);    
    index = 1;
    for wav = fileList
        fv = getFeatureVectors(strcat(filepath, '/', cell2mat(wav)));
        fvs{index} = fv;
        lData(index) = size(fv, 2);
        index = index + 1;
    end
    hmms{i} = MakeLeftRightHMM(sizes(i) + 3, GaussD, cell2mat(fvs), lData);
end
