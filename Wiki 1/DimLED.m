% Poll every 0.05s for Potentiometer voltage, and change LED PWM as needed.
% Stops after 10 seconds.
a = arduino();

tic % Starts the timer
elapsedTime = toc; % Used to keep track of the time elapsed.
while(elapsedTime <= 10)
    voltageRef = 5; % Supplied voltage. 
    rawVoltage = readVoltage(a, 'A0');
    pwmValue = rawVoltage / voltageRef; % Scale voltage to 0 - 1 value for PWM.
    writePWMDutyCycle(a, 'D11', pwmValue);
    pause(0.05); % Very small delay to continue polling.
    elapsedTime = toc; % Refresh time.
end
writePWMDutyCycle(a, 'D11', 0); % Turn off LED.

clear % Clear variables




