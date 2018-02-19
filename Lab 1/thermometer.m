% Continuously read temperature from the TMP35 Sensor for 10 seconds.

a = arduino(); % Create Arduino object

% Pin labels
tempPin = 'A0';
speakerPin = 'D6';

temp = 1.0; % Holds the temperature reading.
iterations = 0; % Count iterations to know when to stop.
tempArray = []; % Holds all the temp values.

% Read the temperature sensor for 10 seconds (21 iterations with 0.5 pauses).
% (measure at 0, then up to 10 seconds).
while(iterations < 21)
    
    % Read output voltage from temp sensor, and convert to temp in C.
    rawVoltage = readVoltage(a, tempPin);
    temp = (rawVoltage - 0.5) * 100;
    %fprintf("TMP35 Vout: %f V | Temp: %f C | Time Elapsed: %fs\n", rawVoltage, temp, elapsedTime);
    
    % Buzz the speaker if the temperature is above 25C.
    if(temp >= 25.0)
        playTone(a, speakerPin, 1500, 1);
    end
    
    tempArray = [tempArray, temp];
    pause(0.5);
    iterations = iterations + 1; % Increment iterations count.
end

% Generate time array.
time = [];
for i = 0:+0.5:10
    time = [time, i];
end
lengthTime = length(time); % prepare for smoothing the curve.

% Use splines to interpolate a smoother curve,
% with 10 times as many points,
% that goes exactly through the same data points.
samplingRateIncrease = 10;
newXSamplePoints = linspace(min(time), max(time), lengthTime * samplingRateIncrease);
smoothedY = spline(time, tempArray, newXSamplePoints);

% Now flip back
xSmooth = newXSamplePoints;
ySmooth = smoothedY;
plot(xSmooth, ySmooth); % Smoothed curve.
 
clear % Clear variables.






