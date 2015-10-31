function plotCorr(filename)
    [data, fFs] = audioread(strcat('Sounds/',filename));
    [mfcc, sg, f, t] = GetSpeechFeatures(data, fFs, 0.03, 13);
    for i=1:size(mfcc,1)
        mfcc(i,:) = mfcc(i,:) - mean(mfcc(i,:));
        mfcc(i,:) = mfcc(i,:) / std(mfcc(i,:));
    end
    corr1 = corr(transpose(mfcc));
    corr2 = corr(log(transpose(sg)));
    function plot1(corr)
        axis([0, t(size(t,1)-1), 0, f(size(f,1)-1)]);
        imagesc(abs(corr));
        colormap gray;
        colorbar;
        ylabel('time series')
        xlabel('time series')
    end
    subplot(1,2,1);
    plot1(corr1);
    title('Correlation matrix for female ceptogram')
    subplot(1,2,2);
    plot1(corr2);
    title('Correlation matrix for female spectogram')
end