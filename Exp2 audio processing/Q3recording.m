
% Record Voice and Play 
fileName = 'Myvoice.wav';
fprintf('Press any key to start %g seconds of recording... \n',10);
pause; 
fprintf('Recording...\n'); 
Fs = 44100;
rcd = audiorecorder(Fs,16,1);
count = 10;
for i= 1:10
record(rcd, 10) 
pause(1) 
fprintf('%d\n', count);
count = count-1;
end
fprintf('Finished recording.\n'); 
fprintf('Press any key to play the recording...\n'); 
pause;
play(rcd);
y = getaudiodata(rcd);
plot(y);
audiowrite(fileName,y,round(Fs));