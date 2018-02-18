% Continuously read temperature from the TMP35 Sensor for 10 seconds.

a = arduino(); % Create Arduino object

% Pin labels
tempPin = 'A0';
ledOne = 'D2';
ledTwo = 'D3';
ledThree = 'D4';

temp = 1.0; % Holds the temperature reading.
tic; % Starts the timer
elapsedTime = toc; % Used to keep track of the time elapsed.

while(elapsedTime <= 10)
    
    % Read output voltage from temp sensor, and convert to temp in C.
    rawVoltage = readVoltage(a, tempPin);
    temp = (rawVoltage - 0.5) * 100;
    fprintf("TMP35 Vout: %f V | Temp: %f C | Time Elapsed: %fs\n", rawVoltage, temp, elapsedTime);
    
    % Turn on 1 LED if temp < 20C, 2 LEDs if 20C >= temp < 23C,
    % And turn on all LEDs if temp >= 23 C
    if(temp < 20.0)
        writeDigitalPin(a,ledOne,1);
        writeDigitalPin(a,ledTwo,0);
        writeDigitalPin(a,ledThree,0);
    elseif(temp >= 20.0 && temp < 23.0)
        writeDigitalPin(a,ledOne,1);
        writeDigitalPin(a, ledTwo,1);
        writeDigitalPin(a,ledThree,0);
    else
        writeDigitalPin(a,ledOne,1);
        writeDigitalPin(a, ledTwo,1);
        writeDigitalPin(a,ledThree,1);
    end
    
    pause(0.5);
    elapsedTime = toc; % Grab current time elapsed
end
 
clear % Clear variables.






