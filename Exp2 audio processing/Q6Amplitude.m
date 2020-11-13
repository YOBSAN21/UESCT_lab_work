
%changing the amplitude
The higher the amplitude the louder the sound
 [y,Fs] = audioread('Nokia.wav');
[z,Fz] = audioread('I Will Always Love You.mp3');
[w,Fw] = audioread('Myvoice.wav');

%changing the Amplitude by 1/2
p = audioplayer(0.5*y,Fs);
q = audioplayer(0.5*z,Fz);
r = audioplayer(0.5*w,Fw);

playblocking(p);
playblocking(q);
playblocking(r);

%changing the Amplitude by 1/4
p = audioplayer(0.25*y,Fs);
q = audioplayer(0.25*z,Fz);
r = audioplayer(0.25*w,Fw);

playblocking(p);
playblocking(q);
playblocking(r);

%doubling the Amplitude 
p = audioplayer(2*y,Fs);
q = audioplayer(2*z,Fz);
r = audioplayer(2*w,Fw);

playblocking(p);
playblocking(q);
playblocking(r);

%changing the Amplitude by 4
 p = audioplayer(4*y,Fs);
q = audioplayer(4*z,Fz);
r = audioplayer(4*w,Fw);

playblocking(p);
playblocking(q);
playblocking(r);
