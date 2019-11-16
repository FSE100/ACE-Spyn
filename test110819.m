passenger = 0;
dropOffFound = 0;
pathfinding = 1;
colorRead = 0;
touchRead = 0;
touchRead2 = 0;
ultrasonicRead = 0.0;
global key
InitKeyboard();
manual = 0;

leftMotor = 'C';
rightMotor = 'B';

brick.SetColorMode(1, 2);

while pathfinding
    pause(0);
    ultrasonicRead = brick.UltrasonicDist(4);
    disp('Ultrasonic = ' + ultrasonicRead);
    touchRead = brick.TouchPressed(2);
    touchRead2 = brick.TouchPressed(3);
    colorRead = brick.ColorCode(1);
        %brick.ColorCode(1) ~= 7 %if it's not normal
        disp(brick.ColorCode(1));
        switch brick.ColorCode(1)
            case 5
                %red, stop for a few seconds
                brick.StopMotor('CB', "Coast");
                pause(4);
                break;
            case 2
                %pickup
                if passenger == 0
                    passenger = 1;
                    %perform pickup
                    manual = 1;
                    disp("manualC");
                    while manual
                        disp("IN MANUAL WL");
                        pause(0);
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
                            case 'a'
                                brick.MoveMotorAngleRel('D', 20, -15, 'Coast');
                                brick.WaitForMotor('D');
                            case 's'
                                brick.MoveMotorAngleRel('D', 20, 15, 'Coast');
                                brick.WaitForMotor('D');
                            case 'p'
                                    manual = 0;
                                    break;
                            case 'l'
                                disp("Color = " + brick.ColorCode(1));
                                disp("Touching = " + brick.TouchPressed(2));
                                disp("Ultrasonic = "+ brick.UltrasonicDist(4));
                        end
                    end
                end
                break;
            case 3
                %dropoff
                if passenger == 1
                    passenger = 0;
                    %perform dropoff
                       
                    manual = 0;
                    while manual 
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
                            case 'a'
                                brick.MoveMotorAngleRel('D', 20, -15, 'Coast');
                                brick.WaitForMotor('D');
                            case 's'
                                brick.MoveMotorAngleRel('D', 20, 15, 'Coast');
                                brick.WaitForMotor('D');
                            case 'p'
                                manual = 0;
                                break;
                            case 'l'
                                disp("Color = " + brick.ColorCode(1));
                                disp("Touching = " + brick.TouchPressed(2));
                                disp("Ultrasonic = "+ brick.UltrasonicDist(4));
                        end 
                    end
                else
                    %begin tracking movements OR ignore
                    %if time permits
                end
                break;
        end
                
    if brick.TouchPressed(2) || brick.TouchPressed(3) 
                disp(brick.TouchPressed(2));
                %hit a wall in front
                brick.MoveMotor('CB', -50);
                pause(1);
                brick.MoveMotor('B', 75);
                brick.MoveMotor('C', 0);
                pause(1);
                
    elseif brick.UltrasonicDist(4) > 15 || brick.UltrasonicDist(4) < 1
                disp("UR" + ultrasonicRead);
                %lost the wall, start turning
                brick.MoveMotor('C', 100);
                brick.MoveMotor('B', 10);
                pause(.2);
%     if brick.UltrasonicDist(4) > 6 || brick.UltrasonicDist(4) < 1
%                 brick.MoveMotor('C', 100);
%                 brick.MoveMotor('B', 70);
%                 pause(1);
%     
    end
       
    brick.MoveMotor('BC', 100);
    disp("End of WL");
end