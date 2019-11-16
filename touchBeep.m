reading = brick.TouchPressed(2);
while 1
    touch = brick.TouchPressed(2); % Read a touch sensor connected to port 1.
    if touch
        brick.beep();
        brick.beep();
        brick.beep();
        brick.beep();
        brick.beep();
        brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();brick.beep();% Beep if the sensor was touched.
        break;            % End program
    end
end