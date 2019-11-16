global key
InitKeyboard();

while 1
    pause(0);
    reading = brick.TouchPressed(2);
    switch key
        case'uparrow' %forward
            brick.MoveMotor('BC', 100);
            brick.StopMotor('BC');
        case 'z' %forward right
            brick.MoveMotor('C', 100);
            brick.MoveMotor('B', 50);
            brick.StopMotor('C');
            brick.StopMotor('B');
        case 'x' %forward left
            brick.MoveMotor('C', 50);
            brick.MoveMotor('B', 100);
            brick.StopMotor('C');
            brick.StopMotor('B');
        case 'rightarrow' %back right
            brick.MoveMotor('C', -100);
            brick.MoveMotor('B', -50);
            brick.StopMotor('C');
            brick.StopMotor('B');
        case 'leftarrow' %back left
            brick.MoveMotor('C', -50);
            brick.MoveMotor('B', -100);
            brick.StopMotor('C');
            brick.StopMotor('B');
        case 'downarrow' %back
            brick.MoveMotor('BC', -100);
            brick.StopMotor('BC');
        case 0 %err
            disp('No key being pressed');
        case 'q' %end
            break;
    end
end
CloseKeyboard();