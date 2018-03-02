% Read EMG Voltage Values from the MyoWare EMG board.

a = arduino();

% Pin Label.
emgPin = 'A0';
ledPin = 'D5';

iterations = 0;

% Read the emg sensor for 10 seconds (21 iterations with 0.5 pauses).
% (measure at 0, then up to 10 seconds).
while(iterations < 21)
    
    % Read output voltage from EMG sensor.
    rawVoltage = readVoltage(a, emgPin);
    
    % Turn on the LED if the read voltage is greater than 3.
    if(readVoltage > 3)
        writeDigitalPin(a, ledPin, 1);
    else
        writeDigitalPin(a, ledPin, 0);
    end
    
    fprintf("EMG Vout: %f V \n", rawVoltage);
    
    % Pause for 0.5 seconds.
    pause(0.5);
    iterations = iterations + 1;
end

clear;