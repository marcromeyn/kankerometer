function fv = getFeatureVectors(filepath)
    [mfcc, sg, f, t] = getFeatures(filepath);
    [vel, acc] = computeDynamicFeatures(mfcc);
    fv = [mfcc; vel; acc];
end