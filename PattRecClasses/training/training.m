filepath = 'Sounds/Training/kanker';
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
hmm = MakeLeftRightHMM(8, GaussD, cell2mat(fvs), lData)