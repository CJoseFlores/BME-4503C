% Continuously check the tiltswitch for states. Turn on Green LED if
% switch is at open/off state, and turn on Red LED if switch is closed,
% i.e. when it is tilted.

a = arduino(); % Create an arduino object

% Pins for LEDs and tilt sensor
baseLed = 'D3'; % Green LED in figure.
tiltLed = 'D2'; % Red LED in figure.
tiltSensor = 'D4';

% Keep track of time elapsed.
tic;
elapsedTime = toc;

while(elapsedTime <= 10)
    % Green LED on when circuit flat.
    if(readDigitalPin(a, tiltSensor))
        writeDigitalPin(a, baseLed, 0);
        writeDigitalPin(a, tiltLed, 1);
    % Red LED on when circuit is tilted.
    else
        writeDigitalPin(a, baseLed, 1);
        writeDigitalPin(a, tiltLed, 0);
    end
    
    elapsedTime = toc;
    fprintf("Elapsed Time: %fs\n", elapsedTime);
    
end

clear % Clear Variables