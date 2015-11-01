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

<<<<<<< HEAD
audiowrite('Sounds/Test/kanker/20.wav', myRecording, fs);
=======
audiowrite('Sounds/Test/diabetes/10.wav', myRecording, fs);
>>>>>>> ca2317979cf24bfadfe8774077b31b70338436ea
