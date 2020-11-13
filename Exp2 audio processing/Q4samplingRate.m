% changing sampling rate
[y,Fs]= audioread('Nokia.wav');
[x,Fx] = audioread('I Will Always Love You.mp3');
[w,Fw] = audioread('Myvoice.wav');
  A = audioplayer(y,Fs);
  B = audioplayer(x,Fx);
  C = audioplayer(w,Fw);
% playing the audio
playblocking(A);
playblocking(B);
playblocking(C);
% Reducing the sampling rate  increase the duraton to play and decreases the
% pitches of the audio
% Higher	sample rate	for	playback leads to… 
% Shorter duration and higher pitch 
% Lower sample rate for playback	leads	to... 
% Longer  duration and lower pitch 
  A.SampleRate = 0.5*Fs;
  B.SampleRate = 0.5*Fx;
  C.SampleRate = 0.5*Fw;
playblocking(A);
playblocking(B);
playblocking(C);
 A.SampleRate = 0.25*Fs;%sampled by 1/2
 B.SampleRate = 0.25*Fx;
 C.SampleRate = 0.25*Fw;
playblocking(A);
playblocking(B);
playblocking(C);
  A.SampleRate = 0.125*Fs;
  B.SampleRate = 0.125*Fx;
  C.SampleRate = 0.125*Fw;
playblocking(A);
playblocking(B);
playblocking(C);
  A.SampleRate = 0.0625*Fs;
  B.SampleRate = 0.0625*Fx;
  C.SampleRate = 0.0625*Fw;
playblocking(A);
playblocking(B);
playblocking(C);



