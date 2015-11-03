words = {'kanker','griep', 'diarree', 'hoofdpijn', 'geirriteerde','moe', 'tyfus', 'tering', 'pijn','diabetes'};
recObj = audiorecorder(fs, bits, 1);
disp('Start speaking.')
recordblocking(recObj, 2);
disp('End of Recording.');
fileName = strcat(num2str(n), '.wav');
data = getaudiodata(recObj);
[mfcc, sg, f, t] = GetSpeechFeatures(data, fs, 0.03, 13);
for i=1:size(mfcc,1)
    mfcc(i,:) = mfcc(i,:) - mean(mfcc(i,:));
    mfcc(i,:) = mfcc(i,:) / std(mfcc(i,:));
end
[vel, acc] = computeDynamicFeatures(mfcc);
fv = [mfcc; vel; acc];
votes = zeros(size(hmms));
for h= 1:size(hmms,2)
    prob = logprob(hmms{h}, fv);
    votes(h) = prob;
end
[argvalue, argmax] = max(votes);
disp(words{argmax})