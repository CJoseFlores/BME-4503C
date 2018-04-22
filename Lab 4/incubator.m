clear;
a = arduino();

% Pin assignments
tmpPin = 'A0';

while(1)
   
    % Calculating temperature in Fahrenheit.
    rawVoltage = readVoltage(a, tmpPin);
    tmpInC = (rawVoltage - 0.5) * 100;
    tmpInF = (tmpInC * (9/5)) + 32;
    
    
    fprintf("Temperature: %f deg F\n", tmpInF);
    pause(0.5);
end