function testHMMs(hmms)
words = {'kanker','moe', 'diabetes', 'tyfus'};
confMatrix = zeros(size(hmms), size(hmms));
for i = 1:size(words,2)
    filepath = strcat('Sounds/Test_new/', cell2mat(words(i)));
    dirData = dir(filepath);
    dirIndex = [dirData.isdir];
    fileList = {dirData(~dirIndex).name};
    for wav = fileList
        fv = getFeatureVectors(strcat(filepath, '/', cell2mat(wav)));
        votes = zeros(size(hmms));
        for h= 1:size(hmms,2)
            prob = logprob(hmms{h}, fv);
            votes(h) = prob;
        end
        [argvalue, argmax] = max(votes);
        if argmax == i
            confMatrix(i, i) = confMatrix(i, i) + 1;
        else
            confMatrix(i, argmax) = confMatrix(i, argmax) + 1;
            confMatrix(argmax, i) = confMatrix(argmax, i) + 1;
            disp(strcat('Misclassified ', words{i}, wav, ' as ', words{argmax}))
        end
    end
end
words
confMatrix