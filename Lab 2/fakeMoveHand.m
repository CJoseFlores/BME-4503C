a = arduino();

emgFakeValue = 0.180834; % Fake starting value of 0.180834 V

% Control the number of iterations.
iterations = 0;
toggleIncDec = 0;
%toggleSqueeze = 0;
stepDown = 0;

buttonPin = 'D2';
servoPin = 'D3';
configurePin(a, buttonPin,'pullup');

s = servo(a, servoPin);

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
    
    buttonState = readDigitalPin(a, buttonPin);
    
    % Move the servo if the button is pressed.
    if(~buttonState)
        
        % Only increase voltage to 3V+ a single time for each button press.
        if(~stepDown)
            emgFakeValue = emgFakeValue + 3; % Scale upwards
        end
        writePosition(s,0.7); % Move the servo to pull paper.
        stepDown = 1;
    else
        
        % If the button is depressed, decrease voltage by 3V a single time.
        if(stepDown)
            emgFakeValue = emgFakeValue - 3; % scale back down.
            stepDown = 0;
        end
        writePosition(s,0); % Move the servo to release paper.
    end
    
    
    fprintf("EMG Vout: %f V\n", emgFakeValue);
    
    pause(0.1);
    iterations = iterations + 1;
end

clear;