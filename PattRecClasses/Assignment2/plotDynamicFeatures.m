function plotDynamicFeatures(filename)
    [mfcc, sg, f, t] = getFeatures(filename);
    [vel, acc] = computeDynamicFeatures(mfcc);
    function plot1(data)
        imagesc('XData',t,'YData',f,'CData',data);
        axis xy;
        axis([0, t(size(t,1)-1), 0, f(size(f,1)-1)]);
        colormap gray;
        colorbar;
        xlabel('time (seconds)')
        ylabel('frequency')
    end
    subplot(3,1,1)
    plot1(mfcc);
    title('Ceptogram for female');
    subplot(3,1,2)
    plot1(vel);
    title('First order diff (velocity)');
    subplot(3,1,3)
    plot1(acc);
    title('Second order diff (acceleration)');
end
    