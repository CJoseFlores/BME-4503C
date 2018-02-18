% Play a tone of frequency 1500Hz for 1 second after a button press.
% Script ends and clears variables after 20 seconds.

a = arduino();

configurePin(a,'D12','pullup'); % Enable pullup resistor on D12.

tic % Start timer
elapsedTime = toc; % Keep track of time elapsed

while(elapsedTime <= 20)
    buttonState = readDigitalPin(a, 'D12');
    if ~buttonState
        playTone(a, 'D11', 1500, 1);
    end
    pause(0.05); % Pause a very small amount of time to allow polling.
    elapsedTime = toc; % Refresh elapsed time.
end

clear % Clear variables.




