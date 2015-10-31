function plotCepto(filename)
    [mfcc, sg, f, t] = getFeatures(filename);
    axis([0, t(size(t,1)-1), 0, f(size(f,1)-1)]);
    imagesc('XData',t,'YData',f,'CData',mfcc);
    axis xy;
    colorbar;
    xlabel('time (seconds)');
    ylabel('frequency');
    title(strcat('Ceptogram for - ', filename))
end