function states = getOptimalStates(word)
    filepath = strcat('Sounds/Training/', word);
    dirData = dir(filepath);
    dirIndex = [dirData.isdir];
    fileList = {dirData(~dirIndex).name};
    nSamples = size(fileList);
    fvs = {};
    lData = zeros(nSamples);
    index = 1;
    bestScore = 0;
    states = 0;
    for state = 2:10
        for wav = fileList
            fv = getFeatureVectors(strcat(filepath, '/', cell2mat(wav)));
            fvs{index} = fv;
            lData(index) = size(fv, 2);
            index = index + 1;
        end
        hmm = MakeLeftRightHMM(state, GaussD, cell2mat(fvs), lData);
        pX = zeros(size(hmm.OutputDistr,1), size(fv, 2));
        score = 0;
        for wav = fileList
            prob = logprob(hmm, fv);
            score = score + prob;
        end
        if score > bestScore || score == 0
            states
            bestScore
            bestScore = score;
            states = state;
        end
    end
end