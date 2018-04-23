clear;
a = arduino();

% Pin assignments
tmpPin = 'A0';
motorPin = 'D7';
heatPadPin = 'D6';

timeInSeconds = 0;

% Keep the incubator on for 1 hour, and record temperatures.
while(timeInSeconds < 3600)
   
    % Calculating temperature in Fahrenheit.
    rawVoltage = readVoltage(a, tmpPin);
    tmpInC = (rawVoltage - 0.5) * 100;
    tmpInF = (tmpInC * (9/5)) + 32;
    
    % Turn on fan when past threshold, or turn on heatPad when too cold.
    if(tmpInF >= 98)
        writeDigitalPin(a, heatPadPin, 0);
        writeDigitalPin(a, motorPin, 1);
    else
        writeDigitalPin(a, heatPadPin, 1);
        writeDigitalPin(a, motorPin, 0);
    end
    
    fprintf("Temperature: %f deg F\n", tmpInF);
    
    % Plot recorded temperatures.
    figure(1);
    plot(timeInSeconds,fakeTemp, 'ko');
    title('Temperature Inside Incubator');
    xlabel('Time (in seconds)');
    ylabel('Temperature (in deg F)');
    hold on;
    
    pause(1);
end

clear;