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
    for state = 2:15
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
            for j = 1:size(pX, 1)
                for k = 1:size(pX, 2)
                    pX(j,k) = prob(hmm.OutputDistr(j), fv(:,k));
                end
            end
            [alfaHat, c] = forward(hmm.StateGen, pX);
            score = score + prod(c);
        end
        if score > bestScore
            bestScore = score;
            states = state;
        end
    end
end