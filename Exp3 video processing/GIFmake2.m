 
clc;clear all ;close all;
filename= 'face.gif';
prompt = 'Insert the Image Name : ';
for i=1:10 % 10 is how many pic selected to make a gif image
    str=input(prompt,'s');
    Img=imread(str);
    Img=imresize(Img,[128,128]);
    figure(i)
    imshow(Img);
    set(gcf,'color','w');
    set(gca,'units','pixels','Visible','off');
    q=get(gca,'position');
    q(1)=0;%设置左边距离值为零
    q(2)=0;%设置右边距离值为零
    set(gca,'position',q);
    frame=getframe(gcf,[1,1,128,128]);%
    im=frame2im(frame);%制作gif文件，图像必须是index索引图像
    imshow(im);
    [I,map]=rgb2ind(im,256);
    k=i-0;
    if k==1;
        imwrite(I,map,filename,'gif','Loopcount',inf,...
            'DelayTime',0.1);%loopcount只是在i==1的时候才有用
    else
        imwrite(I,map,filename,'gif','WriteMode','append',...
            'DelayTime',0.1);%DelayTime用于设置gif文件的播放快慢
    end
end
close all;
