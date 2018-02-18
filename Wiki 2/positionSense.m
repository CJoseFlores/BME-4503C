% Continuously check the position sensor to see if there is something
% infront of it (within 5 inches), and turn on LED. Stop after 10 seconds.

a = arduino(); % Create an arduino object
sensor = addon(a, 'JRodrigoTech/HCSR04', 'D2', 'D4'); % Create Sensor Object.

sensorLED = 'D3'; % RED LED in figure.

% Keep track of time elapsed.
tic;
elapsedTime = toc;

while(elapsedTime <= 10)
    valInMeters = readDistance(sensor);
    valInInches = 39.3701 * valInMeters; % Converting meters to inches.
    
    % Turn on LED if object is 5 inches or closer, otherwise keep it off.
    if(valInInches <= 5)
        writeDigitalPin(a, sensorLED, 1);
    else
        writeDigitalPin(a, sensorLED, 0);
    end

    elapsedTime = toc;
    fprintf("Elapsed Time: %fs\n", elapsedTime);
    
end

clear % Clear Variables