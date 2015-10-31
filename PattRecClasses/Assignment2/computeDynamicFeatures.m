function [velocity, acc] = computeDynamicFeatures(mfcc)
    velocity = [diff(mfcc,1,2), zeros(size(mfcc,1),1)];
    acc = [diff(velocity,1,2), zeros(size(mfcc,1),1)];    
end
    
    