function testHMMs(hmms)
% words = {'kanker','griep', 'diarree', 'hoofdpijn', 'geirriteerde','moe'};
words = {'kanker','griep', 'diarree', 'hoofdpijn', 'geirriteerde','moe'};
correct = 0;
incorrect = 0;
for i = 1:size(words,2)
    filepath = strcat('Sounds/Test/', cell2mat(words(i)));
    dirData = dir(filepath);
    dirIndex = [dirData.isdir];
    fileList = {dirData(~dirIndex).name};
    fv_old = getFeatureVectors(strcat(filepath, '/1.wav'));
    for wav = fileList
        fv = getFeatureVectors(strcat(filepath, '/', cell2mat(wav)));
        votes = zeros(size(hmms));
        for h= 1:size(hmms,2)
            prob = logprob(hmms{h}, fv);
            votes(h) = prob;
        end
        [argvalue, argmax] = max(votes);
        if argmax == i
            correct = correct + 1;
        else
            incorrect = incorrect + 1;
            disp(strcat('Misclassified ', words{i}, wav, ' as ', words{argmax}))
        end
    end
end
correct
incorrect