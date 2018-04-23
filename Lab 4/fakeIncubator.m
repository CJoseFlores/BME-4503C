clear;
%a = arduino();

% Pin assignments
tmpPin = 'A0';
motorPin = 'D7';
heatPadPin = 'D6';

% Used to fake the temperature for the incubator.
fakeTemp = 75.357771;
firstCross = 0; 

timeInSeconds = 0;

while(timeInSeconds < 3600)
    
    % Increase the temperature by a random amount to creep upwards.
    if(fakeTemp >= 98.6 && (firstCross))
        randInc = - (rand * 0.11);
    elseif (fakeTemp >= 100 && (~firstCross))
        randInc = - (rand * 0.11);
        firstCross = 1;
    elseif (fakeTemp >= 98)
        randInc = rand * 0.011;
    elseif (fakeTemp >= 97)
        randInc = rand * 0.019;
    elseif (fakeTemp >= 95)
        randInc = rand * 0.025;
    elseif (fakeTemp >= 93)
        randInc = rand * 0.031;
    elseif (fakeTemp >= 91)
        randInc = rand * 0.051;
    elseif (fakeTemp >= 88)
        randInc = rand * 0.061;
    elseif (fakeTemp >= 85)
        randInc = rand * 0.075;
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
    
    timeInSeconds = timeInSeconds + 1;
    
    figure(1);
    plot(timeInSeconds,fakeTemp, 'ko');
    title('Temperature Inside Incubator');
    xlabel('Time (in seconds)');
    ylabel('Temperature (in deg F)');
    hold on;
    
    pause(1);
end