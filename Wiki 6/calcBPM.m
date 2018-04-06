clear;

% Loading the sample video.
obj = VideoReader('10_sec_vid.mp4');
video = read(obj);

% Displaying the loaded video.
% for i=1:300
%     figure(1);
%     clf
%     image(video(:,:,:,i))
%     pause(.1)
% end

% for i=1:300
%     figure(1);
%     colormap gray
%     imagesc(video(:,:,1,i));
%     title('Red Image');
%     figure(2);
%     colormap gray
%     imagesc(video(:,:,2,i));
%     title('Green Image');
%     figure(3);
%     colormap gray
%     imagesc(video(:,:,3,i));
%     title('Blue Image');
%     pause(.1);
% end

for i=1:300
    figure(1);clf
    image(video(:,:,2,i))
    colormap gray
    colorbar
    figure(2);
    avrgR=mean2(video(295:364,1050:1150,1,i));
    avrgG=mean2(video(295:364,1050:1150,2,i));
    avrgB=mean2(video(295:364,1050:1150,3,i));
    plot(i,avrgG,'ko')
    hold on
    pause(.1)
end

    