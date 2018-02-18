a = arduino(); % Assumes genuine ardunio.

% Connect LED to D11, and turn on.
writeDigitalPin(a,'D11',0);
pause(0.1);
writeDigitalPin(a,'D11',1);
pause(10);
writeDigitalPin(a,'D11',0);

clear % Clear variables


