filepath = 'Sounds/Training/kanker';
dirData = dir(filepath);
dirIndex = [dirData.isdir];
fileList = {dirData(~dirIndex).name};
fvs = {};
for wav = fileList
    fv = getFeatureVectors(strcat(filepath, '/', cell2mat(wav)));
    fvs{index} = fv;
    index = index + 1;
end