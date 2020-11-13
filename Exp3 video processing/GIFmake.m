 
clc;clear all;close all;
% make a gif picture
filename= 'face.gif';
for i=1:10 % 10 is how many pic selected to make a gif image
    str=sprintf('%d.jpg',i);
    Img=imread(str);
    Img=imresize(Img,[128,128]);
    figure(i)
    imshow(Img);
    set(gcf,'color','w');
    set(gca,'units','pixels','Visible','off');
    q=get(gca,'position');
    q(1)=0;% Set left distance value to zero
    q(2)=0; % Sets the right distance value to zero
    set(gca,'position',q);
    frame=getframe(gcf,[1,1,128,128]);%
    im=frame2im(frame);% Make gif file, image must be index image
    imshow(im);
    [I,map]=rgb2ind(im,256);
    k=i-0;
    if k==1;
        imwrite(I,map,filename,'gif','Loopcount',inf,...
            'DelayTime',0.1);%loopcount only works if i==1
    else
        imwrite(I,map,filename,'gif','WriteMode','append',...
            'DelayTime',0.1);%DelayTime is used to set the playback speed of gif files
    end
end
close all;
