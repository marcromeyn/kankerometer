fs = 44100;
bits = 16;
recObj = audiorecorder(fs, bits, 1);

for n = 1:10
    %# Record voice for 2 seconds.
    disp('Start speaking.')
    recordblocking(recObj, 2);
    disp('End of Recording.');
    fileName = strcat(num2str(n+10), '.wav');
    audiowrite(strcat('Sounds/Training/tering/', fileName), myRecording, fs);
    disp('Wait for it...');
    pause(1);
end

