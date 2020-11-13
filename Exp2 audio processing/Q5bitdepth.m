
% changing the bitdepth
Bit depth is sometimes referred to as the sample format or audio resolution.
high bit-depth means wider spectrum of frequency and high Quality
[y,Fs] = audioread('Nokia.wav');
sound(y,Fs);
sound(y,Fs,16);%play with a bit depth of 16
sound(y,Fs,8);%play with a bit depth of 8
%for 4 bitdepth we need to quantization
four_bit=zeros(size(y));
low_b=min(y); 
high_b=max(y);
coverage=(high_b(1)-low_b(1))/16;
len=max(size(y));
chann=min(size(y));
for i=1:len
 for j=1:chann
    if(y(i,j)<(low_b(1)+coverage))
        four_bit(i,j)=low_b(1)+coverage/2;
    elseif(y(i,j)<(low_b(1)+2*coverage))
        four_bit(i,j)=low_b(1)+3*coverage/2;
    elseif(y(i,j)<(low_b(1)+3*coverage))
       four_bit(i,j)=low_b(1)+5*coverage/2;
    elseif(y(i,j)<(low_b(1)+4*coverage))
        four_bit(i,j)=low_b(1)+7*coverage/2;
    elseif(y(i,j)<(low_b(1)+5*coverage))
        four_bit(i,j)=low_b(1)+9*coverage/2;
    elseif(y(i,j)<(low_b(1)+6*coverage))
        four_bit(i,j)=low_b(1)+11*coverage/2;
    elseif(y(i,j)<(low_b(1)+7*coverage))
        four_bit(i,j)=low_b(1)+13*coverage/2;
    elseif(y(i,j)<(low_b(1)+8*coverage))
        four_bit(i,j)=low_b(1)+15*coverage/2;
    elseif(y(i,j)<(low_b(1)+9*coverage))
        four_bit(i,j)=low_b(1)+17*coverage/2;
    elseif(y(i,j)<(low_b(1)+10*coverage))
       four_bit(i,j)=low_b(1)+19*coverage/2;
    elseif(y(i,j)<(low_b(1)+11*coverage))
        four_bit(i,j)=low_b(1)+21*coverage/2;
    elseif(y(i,j)<(low_b(1)+12*coverage))
        four_bit(i,j)=low_b(1)+23*coverage/2;
    elseif(y(i,j)<(low_b(1)+13*coverage))
        four_bit(i,j)=low_b(1)+25*coverage/2;
    elseif(y(i,j)<(low_b(1)+14*coverage))
        four_bit(i,j)=low_b(1)+27*coverage/2;
    elseif(y(i,j)<(low_b(1)+15*coverage))
        four_bit(i,j)=low_b(1)+29*coverage/2;
    elseif(y(i,j)<(low_b(1)+16*coverage))
        four_bit(i,j)=low_b(1)+31*coverage/2;
    end
 end
end
sound(four_bit, Fs);% play with a bit depth of 4
[z,Fz] = audioread('I Will Always Love You.mp3');
sound(z,Fz);
sound(z,Fz,16);
sound(z,Fz,8);
% for four bit the same code like nokia.wav. just to avoid redundancy in i
% didnot write here
four_bit=zeros(size(z));
low_b=min(z); high_b=max(z);
coverage=(high_b(1)-low_b(1))/16;
len=max(size(z));chann=min(size(z));
for i=1:len
 for j=1:chann
    if(z(i,j)<(low_b(1)+coverage))
        four_bit(i,j)=low_b(1)+coverage/2;
    elseif(z(i,j)<(low_b(1)+2*coverage))
        four_bit(i,j)=low_b(1)+3*coverage/2;
    elseif(z(i,j)<(low_b(1)+3*coverage))
       four_bit(i,j)=low_b(1)+5*coverage/2;
    elseif(z(i,j)<(low_b(1)+4*coverage))
        four_bit(i,j)=low_b(1)+7*coverage/2;
    elseif(z(i,j)<(low_b(1)+5*coverage))
        four_bit(i,j)=low_b(1)+9*coverage/2;
    elseif(z(i,j)<(low_b(1)+6*coverage))
        four_bit(i,j)=low_b(1)+11*coverage/2;
    elseif(z(i,j)<(low_b(1)+7*coverage))
        four_bit(i,j)=low_b(1)+13*coverage/2;
    elseif(z(i,j)<(low_b(1)+8*coverage))
        four_bit(i,j)=low_b(1)+15*coverage/2;
    elseif(z(i,j)<(low_b(1)+9*coverage))
        four_bit(i,j)=low_b(1)+17*coverage/2;
    elseif(z(i,j)<(low_b(1)+10*coverage))
       four_bit(i,j)=low_b(1)+19*coverage/2;
    elseif(z(i,j)<(low_b(1)+11*coverage))
        four_bit(i,j)=low_b(1)+21*coverage/2;
    elseif(z(i,j)<(low_b(1)+12*coverage))
        four_bit(i,j)=low_b(1)+23*coverage/2;
    elseif(z(i,j)<(low_b(1)+13*coverage))
        four_bit(i,j)=low_b(1)+25*coverage/2;
    elseif(z(i,j)<(low_b(1)+14*coverage))
        four_bit(i,j)=low_b(1)+27*coverage/2;
    elseif(z(i,j)<(low_b(1)+15*coverage))
        four_bit(i,j)=low_b(1)+29*coverage/2;
    elseif(z(i,j)<(low_b(1)+16*coverage))
        four_bit(i,j)=low_b(1)+31*coverage/2;
    end
 end
end
sound(four_bit,Fz);
[w,Fw] = audioread('Myvoice.wav');
sound(w,Fw);
sound(w,Fw,16);
sound(w,Fw,8);
four_bit=zeros(size(w));
low_b=min(w); 
high_b=max(w);
coverage=(high_b(1)-low_b(1))/16;
len=max(size(w));
chann=min(size(w));
for i=1:len
 for j=1:chann
    if(w(i,j)<(low_b(1)+coverage))
        four_bit(i,j)=low_b(1)+coverage/2;
    elseif(w(i,j)<(low_b(1)+2*coverage))
        four_bit(i,j)=low_b(1)+3*coverage/2;
    elseif(w(i,j)<(low_b(1)+3*coverage))
       four_bit(i,j)=low_b(1)+5*coverage/2;
    elseif(w(i,j)<(low_b(1)+4*coverage))
        four_bit(i,j)=low_b(1)+7*coverage/2;
    elseif(w(i,j)<(low_b(1)+5*coverage))
        four_bit(i,j)=low_b(1)+9*coverage/2;
    elseif(w(i,j)<(low_b(1)+6*coverage))
        four_bit(i,j)=low_b(1)+11*coverage/2;
    elseif(w(i,j)<(low_b(1)+7*coverage))
        four_bit(i,j)=low_b(1)+13*coverage/2;
    elseif(w(i,j)<(low_b(1)+8*coverage))
        four_bit(i,j)=low_b(1)+15*coverage/2;
    elseif(w(i,j)<(low_b(1)+9*coverage))
        four_bit(i,j)=low_b(1)+17*coverage/2;
    elseif(w(i,j)<(low_b(1)+10*coverage))
       four_bit(i,j)=low_b(1)+19*coverage/2;
    elseif(w(i,j)<(low_b(1)+11*coverage))
        four_bit(i,j)=low_b(1)+21*coverage/2;
    elseif(w(i,j)<(low_b(1)+12*coverage))
        four_bit(i,j)=low_b(1)+23*coverage/2;
    elseif(w(i,j)<(low_b(1)+13*coverage))
        four_bit(i,j)=low_b(1)+25*coverage/2;
    elseif(w(i,j)<(low_b(1)+14*coverage))
        four_bit(i,j)=low_b(1)+27*coverage/2;
    elseif(w(i,j)<(low_b(1)+15*coverage))
        four_bit(i,j)=low_b(1)+29*coverage/2;
    elseif(w(i,j)<(low_b(1)+16*coverage))
        four_bit(i,j)=low_b(1)+31*coverage/2;
    end
 end
end
sound(four_bit,Fw);

