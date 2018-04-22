clear;
a = arduino();

% Pin assignments
tmpPin = 'A0';
motorPin = 'D7';
heatPadPin = 'D6';

writeDigitalPin(a, heatPadPin, 1);

while(1)
   
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
    pause(0.5);
end