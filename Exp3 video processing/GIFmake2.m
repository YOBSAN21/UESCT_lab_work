 
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
    q(1)=0;%������߾���ֵΪ��
    q(2)=0;%�����ұ߾���ֵΪ��
    set(gca,'position',q);
    frame=getframe(gcf,[1,1,128,128]);%
    im=frame2im(frame);%����gif�ļ���ͼ�������index����ͼ��
    imshow(im);
    [I,map]=rgb2ind(im,256);
    k=i-0;
    if k==1;
        imwrite(I,map,filename,'gif','Loopcount',inf,...
            'DelayTime',0.1);%loopcountֻ����i==1��ʱ�������
    else
        imwrite(I,map,filename,'gif','WriteMode','append',...
            'DelayTime',0.1);%DelayTime��������gif�ļ��Ĳ��ſ���
    end
end
close all;
