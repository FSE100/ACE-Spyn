global key
InitKeyboard();

brick.SetColorMode(1, 2);

while 1
    pause(0);
    reading = brick.TouchPressed(2);
    switch key
        case'uparrow' %forward
            brick.MoveMotor('BC', 100);
            brick.StopMotor('BC');
        case 'z' %forward right
            brick.MoveMotor('C', 100);
            %brick.MoveMotor('B', 50);
            brick.StopMotor('C');
            %brick.StopMotor('B');
        case 'x' %forward left
            %brick.MoveMotor('C', 50);
            brick.MoveMotor('B', 100);
            %brick.StopMotor('C');
            brick.StopMotor('B');
        case 'rightarrow' %back right
            %brick.MoveMotor('B', -50);
            brick.MoveMotor('C', -100);
            %brick.StopMotor('B');
            brick.StopMotor('C');
        case 'leftarrow' %back left
            brick.MoveMotor('B', -100);
            %brick.MoveMotor('B', -50);
            %brick.StopMotor('C');
            brick.StopMotor('B');
        case 'downarrow' %back
            brick.MoveMotor('BC', -100);
            brick.StopMotor('BC');
        case 'a'
            brick.MoveMotorAngleRel('D', 20, -15, 'Coast');
            brick.WaitForMotor('D');
        case 's'
        	brick.MoveMotorAngleRel('D', 20, 15, 'Coast');
            brick.WaitForMotor('D');
        case 'p'
            CloseKeyboard();
            finalTest;
            return;
        case 'l'
        	disp("Color = " + brick.ColorCode(1));
            disp("Touching = " + brick.TouchPressed(2));
            disp("Ultrasonic = "+ brick.UltrasonicDist(4));
    end
end