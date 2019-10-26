passenger = 0;
dropOffFound = 0;
pathfinding = 1;

touchPort = 2;
ultrasonicPort = 3;
colorPort = 1;
leftMotor = 'C';
rightMotor = 'B';

brick.SetColorMode(colorPort, 2);

while pathfinding
	pause(1);
  ultrasonicRead = brick.UltrasonicDist(3);
  touchRead = brick.TouchPressed(2);
  colorRead = brick.ColorCode(1);
  
  if colorRead ~= 7 %if it's not normal
  	switch colorRead
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
  	
        elif touchRead
  	%hit a wall in front
  	brick.MoveMotor('CB' -50);
    pause(1);
    brick.MoveMotor(rightMotor, 100);
    brick.MoveMotor(leftMotor, 50);
    pause(1);
    
  elif ultrasonicRead > 5
  	%lost the wall, start turning
  	brick.MoveMotor(leftMotor, 100);
  	brick.MoveMotor(rightMotor, 50);
    pause(.2);
    if ultrasonicRead > 5
    	brick.MoveMotor(leftMotor, 100);
      brick.MoveMotor(rightMotor, 50);
      pause(1);
    end
    end
  end
  brick.MoveMotor('BC', 100);
end