passenger = 0;
dropOffFound = 0;
pathfinding = 1;
colorRead = 0;
touchRead = 0;
ultrasonicRead = 0.0;

leftMotor = 'C';
rightMotor = 'B';

brick.SetColorMode(1, 2);

while pathfinding
    pause(0);
    ultrasonicRead = brick.UltrasonicDist(4);
    disp('Ultrasonic = ' + ultrasonicRead);
    touchRead = brick.TouchPressed(2);
    disp('Touch = ' + touchRead);
    colorRead = brick.ColorCode(1);
    disp('Color = ' + colorRead);
    
    if colorRead == 2
        %brick.ColorCode(1) ~= 7 %if it's not normal
        disp(brick.ColorCode(1));
        switch brick.ColorCode(1)
            case 5
                %red, stop for a few seconds
                brick.StopMotor('CB', Brake);
                pause(4);
                break;
            case 2
                %pickup
                if passenger == 0
                    passenger = 1;
                    %perform pickup
                end
            case 3
                %dropoff
                if passenger == 1
                    passenger = 0;
                    %perform dropoff
                else
                    %begin tracking movements OR ignore
                end
        end
                
    elseif brick.TouchPressed(2)
                disp(brick.TouchPressed(2));
                %hit a wall in front
                brick.MoveMotor('CB', -50);
                pause(1);
                brick.MoveMotor('B', 100);
                brick.MoveMotor('C', 50);
                pause(1);
                
                elseif brick.UltrasonicDist(4) > 8 || brick.UltrasonicDist(4) < 1
                disp(ultrasonicRead);
                %lost the wall, start turning
                brick.MoveMotor('C', 100);
                brick.MoveMotor('B', 50);
                pause(.2);
                if brick.UltrasonicDist(4) > 8 || brick.UltrasonicDist(4) < 1
                    brick.MoveMotor('C', 100);
                    brick.MoveMotor('B', 50);
                    pause(1);
                end
    end
    brick.MoveMotor('BC', 100);
    brick.StopMotor('BC');
end