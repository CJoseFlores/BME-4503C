a = arduino();
s = servo(a, 'D3', 'MinPulseDuration', 600*10^-6, 'MaxPulseDuration', 2100*10^-6);
while(1)
sensorVal= readVoltage(a,'A1');
fprintf('%.3f\n', sensorVal);
if(sensorVal >= 1.2)
writePosition(s, 0.45);
current_pos = readPosition(s);
current_pos = current_pos*150;
fprintf('Current motor position is %d degrees\n', current_pos);
else
writePosition(s, 0);
current_pos = readPosition(s);
current_pos = current_pos*180;
fprintf('Current motor position is %d degrees\n', current_pos);
end
pause(0.27);
end