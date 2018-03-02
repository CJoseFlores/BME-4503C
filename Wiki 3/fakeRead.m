a = arduino();

emgFakeValue = 0.180834; % Fake starting value of 0.180834 V

% Control the number of iterations.
iterations = 0;
toggleIncDec = 0;
toggleSqueeze = 0;

fprintf("EMG Vout: %f V\n", emgFakeValue);

% Continue to loop for 100 iterations.
while(iterations < 100)
    randInc = rand * 0.01;
    
    % Randomly increase or decrease the base value.
    if(toggleIncDec == 0)
        emgFakeValue = emgFakeValue + randInc;
        toggleIncDec = 1;
    else
        emgFakeValue = emgFakeValue - randInc;
        toggleIncDec = 0;
    end
    
    % Simluate the squeeze. 
    if(iterations > 50)
        if(toggleSqueeze == 0)
            emgFakeValue = emgFakeValue + 3; % Scale upwards
            toggleSqueeze = 1;
        end
    end
    
    % Turn on the LED as a result of the squeeze.
    if(toggleSqueeze == 1)
        writeDigitalPin(a, 'D5', 1);
    end
    
    
    fprintf("%f\n", emgFakeValue);
    
    pause(0.1);
    iterations = iterations + 1;
end

clear;