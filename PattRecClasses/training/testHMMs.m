function testHMMs(hmms)
% words = {'kanker','griep', 'diarree', 'hoofdpijn', 'geirriteerde','moe'};
words = {'kanker', 'diabetes'};
correct = 0;
incorrect = 0;
for i = 1:size(words,2)
    filepath = strcat('Sounds/Training/', cell2mat(words(i)));
    dirData = dir(filepath);
    dirIndex = [dirData.isdir];
    fileList = {dirData(~dirIndex).name};
    for wav = fileList
        fv = getFeatureVectors(strcat(filepath, '/', cell2mat(wav)));
        votes = zeros(size(hmms));
        for h= 1:size(hmms,2)
            pX = zeros(size(hmms{h}.OutputDistr,1), size(fv, 2));
            for j = 1:size(pX, 1)
                for k = 1:size(pX, 2)
                    pX(j,k) = prob(hmms{h}.OutputDistr(j), fv(:,k));
                end
            end
            [alfaHat, c] = forward(hmms{h}.StateGen, pX);
            votes(h) = prod(c);
        end
        [argvalue, argmax] = max(votes);
        if argmax == i
            correct = correct + 1;
        else
            incorrect = incorrect + 1;
            strcat(' Misclassified ', words{i}, wav, ' as ', words{argmax}) 
        end
    end
end
correct
incorrect