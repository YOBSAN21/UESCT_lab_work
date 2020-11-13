% Read the audio 
[y,Fs] = audioread('Nokia.wav'); 
%play the audio 
sound(y,fs); 
 
t1 = linspace(0,length(y)/Fs,length(y)); >> plot(t1,y);
%Q2
 [y,Fs] = audioread('I Will Always Love You.mp3'); 
 sound(y,Fs); 
 t = linspace(0,length(y)/Fs,length(y)); 
 plot(t,y);

 %Q3 recording
 % Record Voice and Play 
% fileName = 'Myvoice.wav'; 
% fprintf('Press any key to start %g seconds of recording... \n',10); 
% pause; 
% fprintf('Recording...\n'); 
% rcd = audiorecorder(44100,16,1); 
% count = 10; 
% Fs = 44100; 
% for i= 1:10
%     record(rcd, 10) 
%     pause(1) 
%     fprintf('%d\n', count); 
%     count = count-1; 
% end
% fprintf('Finished recording.\n');
% fprintf('Press any key to play the recording...\n'); 
% pause;
% play(rcd);
% y = getaudiodata(rcd);
% plot(y); 
% audiowrite(fileName,y,round(Fs));
%Q4 
%sampling rate

% [y,Fs]= audioread('Nokia.wav');
% [x,Fx] = audioread('I Will Always Love You.mp3');
% [w,Fw] = audioread('Myvoice.wav');
% 
% A = audioplayer(y,Fs);
% B = audioplayer(x,Fx);
% C = audioplayer(w,Fw);
% 
% playing the audio
% playblocking(A);
% playblocking(B);
% playblocking(C);
% 
%  A.SampleRate = 0.5*Fs;
% B.SampleRate = 0.5*Fx;
% C.SampleRate = 0.5*Fw;
% 
% playblocking(A);
% playblocking(B);
% playblocking(C);
% 
% A.SampleRate = 0.25*Fs;
% B.SampleRate = 0.25*Fx;
% C.SampleRate = 0.25*Fw;
% 
% playblocking(A);
% playblocking(B);
% playblocking(C);
% 
%  A.SampleRate = 0.125*Fs;
% B.SampleRate = 0.125*Fx;
% C.SampleRate = 0.125*Fw;
% 
% playblocking(A);
% playblocking(B);
% playblocking(C);
% 
% A.SampleRate = 0.0625*Fs;
% B.SampleRate = 0.0625*Fx;
% C.SampleRate = 0.0625*Fw;
% 
% playblocking(A);
% playblocking(B);
% playblocking(C);
% 
% Q5
% changing the bitdepth
% 
% [y,Fs] = audioread('Nokia.wav');
% sound(y,Fs);
% sound(y,Fs,16);
% sound(y,Fs,8);
% sound(y,Fs,4); %not supported, Currently only 8, 16, and 24-bit audio is supported.
% 
% [z,Fz] = audioread('I Will Always Love You.mp3');
% sound(z,Fz);
% sound(z,Fz,16);
% sound(z,Fz,8);
% sound(z,Fz,4); %not supported , Currently only 8, 16, and 24-bit audio is supported.
% 
% [w,Fw] = audioread('Myvoice.wav');
% sound(w,Fw);
% sound(w,Fw,16);
% sound(w,Fw,8);
% sound(w,Fw,4); %not supported, Currently only 8, 16, and 24-bit audio is supported.
% 
% Q6 sampling rate
% 
% %changing the amplitude
% 
% [y,Fs] = audioread('Nokia.wav');
% [z,Fz] = audioread('I Will Always Love You.mp3');
% [w,Fw] = audioread('Myvoice.wav');
% 
% %changing the Amplitude by 1/2
% p = audioplayer(0.5*y,Fs);
% q = audioplayer(0.5*z,Fz);
% r = audioplayer(0.5*w,Fw);
% 
% playblocking(p);
% playblocking(q);
% playblocking(r);
% 
% %changing the Amplitude by 1/4
% p = audioplayer(0.25*y,Fs);
% q = audioplayer(0.25*z,Fz);
% r = audioplayer(0.25*w,Fw);
% 
% playblocking(p);
% playblocking(q);
% playblocking(r);
% 
% %doubling the Amplitude
% p = audioplayer(2*y,Fs);
% q = audioplayer(2*z,Fz);
% r = audioplayer(2*w,Fw);
% 
% playblocking(p);
% playblocking(q);
% playblocking(r);
% 
% %changing the Amplitude by 4
% p = audioplayer(4*y,Fs);
% q = audioplayer(4*z,Fz);
% r = audioplayer(4*w,Fw);
% 
% playblocking(p);
% playblocking(q);
% playblocking(r);
% 
% 
