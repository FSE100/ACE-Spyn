global key
InitKeyboard();
brick.SetColorMode(1, 2);

while 1
    pause(0);
    %reading = brick.TouchPressed(2);
    switch key
        case'uparrow'
            brick.MoveMotor('BC', 100);
            brick.StopMotor('BC');
        case 'downarrow'
            brick.MoveMotor('C', 100);
            brick.StopMotor('C');
            colorRead = brick.ColorCode(2);
            disp(colorRead);
        case 'leftarrow'
            brick.MoveMotor('BC', -100)
            brick.StopMotor('BC');
        case 'rightarrow'
            brick.MoveMotor('B', 100);
            brick.StopMotor('B');
            
        
        case 0
            disp('No key being pressed');
        
        case 'q'
            break;
    end
end
CloseKeyboard();