%Setting up global vars for method references
passenger = 0;
dropOffFound = 0;
pathfinding = 1;
colorRead = 0;
touchRead = 0;
touchRead2 = 0;
ultrasonicRead = 0.0;
manual = 0;

%Motor references
leftMotor = 'C';
rightMotor = 'B';

%Color mode for Car (sends back color code value)
brick.SetColorMode(1, 2);

% Loop for the Pathfinding algorithm
while pathfinding
    %Zero pause ensures quick detection without issues
    pause(0);
    %Reference for ultrasonic sensor (for output to the command window)
    ultrasonicRead = brick.UltrasonicDist(4);
    disp('Ultrasonic = ' + ultrasonicRead);
    %Separate references for each touch sensor
    touchRead = brick.TouchPressed(2);
    touchRead2 = brick.TouchPressed(3);
    %Color read setup + switch for pickup, drop-off, stop cases
    colorRead = brick.ColorCode(1);
        %brick.ColorCode(1) ~= 7 %if it's not normal
        disp(brick.ColorCode(1));
        switch brick.ColorCode(1)
            case 5
                %red, stop for a few seconds
                brick.StopMotor('CB', "Coast");
                pause(5);
                brick.MoveMotor('BC', 100);
                %go back to start of this class
                finalTest;
            case 3
                %pickup @ Green color
                if passenger == 0
                    passenger = 1;
                    brick.StopMotor('CB', "Coast");
                    %call to Remote class for control
                    remoteFinal;
                end
                break;
            case 4
                %dropoff @ Blue color
                if passenger == 1
                    passenger = 0;
                    brick.StopMotor('CB', "Coast");
                    %call to Remote class for control
                    remoteFinal;
                end
                break;
        end
    
    %Sensing if either touch sensor triggered by hitting wall in front
    if brick.TouchPressed(2) || brick.TouchPressed(3)
                %display to command window for proofchecking
                disp(brick.TouchPressed(2));
                %Moving car due to touching wall on front
                %scoot the car back a bit
                brick.MoveMotor('BC', -55);
                pause(.6);
                %turn car 90 degrees left
                brick.MoveMotor('B', 12);
                pause(.9);
    
    %Sensing if Ultrasonic sensor out of range and turning 90 deg right
    elseif brick.UltrasonicDist(4) > 18 || brick.UltrasonicDist(4) < 1
                disp("UR" + ultrasonicRead);
                %Moving car since wall lost (out of range)
                %Via both motor commands, turning to right
                brick.MoveMotor('C', 90);
                brick.MoveMotor('B', -10);
                pause(.4);
    end
    
    %If everything else regular (wood color or white) + in range
    %Move forward
    brick.MoveMotor('BC', 90);
    %End of pathfinding while loop; goes back up to Pathfinding start
    disp("End of WL");
end