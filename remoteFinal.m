%Setting up the keyboard i/o
global key
InitKeyboard();

% Remote while loop
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
        case 'a' %Lifting person ramp-hook up
            brick.MoveMotorAngleRel('D', 20, -15, 'Coast');
            brick.WaitForMotor('D');
        case 's' %Lifting person ramp-hoop down
        	brick.MoveMotorAngleRel('D', 20, 15, 'Coast');
            brick.WaitForMotor('D');
        case 'p' %Exiting Remote and calling finalTest (car) class
            CloseKeyboard();
            %Call to the finalTest (car) function
            finalTest;
            return;
    end
end