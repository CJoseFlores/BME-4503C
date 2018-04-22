clear;

video = videoinput('winvideo', 1);
video.ReturnedColorSpace = 'rgb';


preview(video)

for i=1:200
    figure(1);
    frame = getsnapshot(video);
    
    figure(2);
    imshow(frame);
    
    figure(3);
    avrgG=mean2(frame(105:148,441:488,2));

    plot(i,avrgG,'ko')
    hold on
end