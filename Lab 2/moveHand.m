clear;
a = arduino();

% Pin Labels.
emgPin = 'A0';
servoPin = 'D3';

s = servo(a, servoPin);

while(1)
    
    % Read output voltage from EMG sensor.
    rawVoltage = readVoltage(a, emgPin);
    
    % Open the claw if EMG voltage is above 1.1V, otherwise close it.
    if(rawVoltage >= 1.1)
        writePosition(s,0.45);
    else
        writePosition(s,0);
    end
    
    fprintf("EMG Vout: %f V \n", rawVoltage);
    
    % Pause for 0.5 seconds.
    pause(0.5);
end

clear;