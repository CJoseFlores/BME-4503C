clear;
%a = arduino();

% Pin assignments
tmpPin = 'A0';
motorPin = 'D7';
heatPadPin = 'D6';

% Used to fake the temperature for the incubator.
fakeTemp = 75.357771;
firstCross = 0; 

while(1)
    
    % Increase the temperature by a random amount to creep upwards.
    if(fakeTemp >= 98.6 && (firstCross))
        randInc = - (rand * 0.011);
    elseif (fakeTemp >= 101.6 && (~firstCross))
        randInc = - (rand * 0.011);
        firstCross = 1;
    elseif (fakeTemp >= 95)
        randInc = rand * 0.011;
    else
        randInc = rand * 0.085;
    end
    
    fakeTemp = fakeTemp + randInc;
    
    % Turn on fan when past threshold, or turn on heatPad when too cold.
    %if(fak%eTemp >= 98.6)
    %    writeDigitalPin(a, heatPadPin, 0);
    %    writeDigitalPin(a, motorPin, 1);
    %else
    %   writeDigitalPin(a, heatPadPin, 1);
    %    writeDigitalPin(a, motorPin, 0);
    %end
    
    
    
    fprintf("Temperature: %f deg F\n", fakeTemp);
    pause(0.3);
end