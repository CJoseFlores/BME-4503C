clear;
a = arduino();

% Pin Labels.
emgPin = 'A0';
servoPin = 'D3';

s = servo(a, servoPin);

iterations = 0;

% Read the emg sensor for 10 seconds (21 iterations with 0.5 pauses).
% (measure at 0, then up to 10 seconds).
while(iterations < 21)
    
    % Read output voltage from EMG sensor.
    rawVoltage = readVoltage(a, emgPin);
    
    % Turn on the LED if the read voltage is greater than 3.
    if(rawVoltage > 3)
        %
    else
        %
    end
    
    fprintf("EMG Vout: %f V \n", rawVoltage);
    
    % Pause for 0.5 seconds.
    pause(0.5);
    iterations = iterations + 1;
end

% Rotate the servo
writePosition(s,0)
pause(1);
writePosition(s,0.7)
pause(1)
writePosition(s,0);



clear;