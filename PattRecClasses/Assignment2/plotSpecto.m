function plotSpecto(filename)
    [mfcc, sg, f, t] = getFeatures(filename);
    axis xy;
    axis([0, t(size(t,1)-1), 0, f(size(f,1)-1)]);
    imagesc('XData',t,'YData',f,'CData',log(sg));
    colorbar;
    xlabel('time (seconds)');
    ylabel('frequency'); 
    title(strcat('Spectogram for - ', filename));
end