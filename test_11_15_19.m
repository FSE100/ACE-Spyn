passenger = 0;
dropOffFound = 0;
pathfinding = 1;
colorRead = 0;
touchRead = 0;
touchRead2 = 0;
ultrasonicRead = 0.0;
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
                pause(5);
                brick.MoveMotor('BC', 100);
                test_11_15_19;
            case 3
                %pickup
                if passenger == 0
                    passenger = 1;
                    brick.StopMotor('CB', "Coast");
                    keyTest2;
                end
                break;
            case 4
                %dropoff
                if passenger == 1
                    passenger = 0;
                    brick.StopMotor('CB', "Coast");
                    keyTest2;
                %else
                    %begin tracking movements OR ignore
                    %if time permits
                %end
                end
                break;
        end
                
    if brick.TouchPressed(2) || brick.TouchPressed(3) 
                disp(brick.TouchPressed(2));
                %hit a wall in front
                brick.MoveMotor('BC', -50);
                pause(1);
                brick.MoveMotor('B', 55);
                brick.MoveMotor('C', 0);
                pause(1);
                
    elseif brick.UltrasonicDist(4) > 15 || brick.UltrasonicDist(4) < 1
                disp("UR" + ultrasonicRead);
                %lost the wall, start turning
                brick.MoveMotor('C', 90);
                brick.MoveMotor('B', 0);
                %maybe stop
                %rel angle??
                pause(.3);
%     if brick.UltrasonicDist(4) > 6 || brick.UltrasonicDist(4) < 1
%                 brick.MoveMotor('C', 100);
%                 brick.MoveMotor('B', 70);
%                 pause(1);
%     
    end
       
    brick.MoveMotor('BC', 90);
    disp("End of WL");
end