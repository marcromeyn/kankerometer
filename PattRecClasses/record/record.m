fs = 44100;
bits = 16;
recObj = audiorecorder(fs, bits, 1);

%# Record voice for 2 seconds.
disp('Start speaking.')
recordblocking(recObj, 2);
disp('End of Recording.');

%# Play back the recording.
play(recObj);

myRecording = getaudiodata(recObj);

%# Plot the waveform.
plot(myRecording);

% audiowrite(myRecording, fs, bits, '/Sounds/kanker');