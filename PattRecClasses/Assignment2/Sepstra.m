[female, fFs] = audioread('Sounds/female.wav');
[male, mFs] = audioread('Sounds/male.wav');
[mfcc, sg, f, t] = GetSpeechFeatures(female, fFs, 0.03, 30);
[mfcc_male, sg_male, f_male, t_male] = GetSpeechFeatures(male, mFs, 0.03, 30);

for i=1:size(mfcc,1)
    mfcc(i,:) = mfcc(i,:) - mean(mfcc(i,:));
    mfcc(i,:) = mfcc(i,:) / std(mfcc(i,:));
    mfcc_male(i,:) = mfcc_male(i,:) - mean(mfcc_male(i,:));
    mfcc_male(i,:) = mfcc_male(i,:) / std(mfcc_male(i,:));
end
axis([0, 2, 0, 2e4]);
imagesc('XData',t,'YData',f,'CData',mfcc);
axis xy;
xlabel('time (seconds)');
ylabel('frequency');

