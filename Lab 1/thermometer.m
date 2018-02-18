% Continuously read temperature from the TMP35 Sensor for 10 seconds.

a = arduino(); % Create Arduino object

% Pin labels
tempPin = 'A0';
speakerPin = 'D6';

temp = 1.0; % Holds the temperature reading.
tic; % Starts the timer
elapsedTime = toc; % Used to keep track of the time elapsed.

while(elapsedTime <= 10)
    
    % Read output voltage from temp sensor, and convert to temp in C.
    rawVoltage = readVoltage(a, tempPin);
    temp = (rawVoltage - 0.5) * 100;
    fprintf("TMP35 Vout: %f V | Temp: %f C | Time Elapsed: %fs\n", rawVoltage, temp, elapsedTime);
    
    % Buzz the speaker if the temperature is above 25C.
    if(temp >= 25.0)
        playTone(a, speakerPin, 1500, 1);
    end
    
    pause(0.5);
    elapsedTime = toc; % Grab current time elapsed
end
 
clear % Clear variables.






