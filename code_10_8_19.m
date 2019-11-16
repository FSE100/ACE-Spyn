% 1: Find the largest of three numbers

num1 = input('Give first number: ');
num2 = input('Give second number: ');

if num1 > num2
    disp('num1 is greater than num2');
    largest = num1;
    fprintf('largest number is %i \r\n', largest);
else
    disp('num1 is NOT greater than num2');
    largest = num2;
    fprintf('largest number is %i \r\n', largest);
end

    
% 2: Find the largest of three numbers
n1 = input('num1: ');
n2 = input('num2: ');
n3 = input('num3: ');

if n1 > n2 && n1 > n3
    fprintf('The largest number of the three is %i \r\n', n1);
elseif n3 > n2 && n3 > n1
    fprintf('The largest number of the three is %i \r\n', n3);
elseif n2 > n3 && n2 > n1
    fprintf('The largest number of the three is %i \r\n', n2);
end

% 3: Find if three numbers are in ascending order

n1 = input('num1: ');
n2 = input('num2: ');
n3 = input('num3: ');

if n1 < n2 && n2 < n3
    fprintf('The numbers %i and %i and %i are in ascending order %i \r\n', n1, n2, n3);
    fprintf('\r\n');
else
    fprintf('The numbers %i and %i and %i are NOT in ascending order %i \r\n', n1, n2, n3);
    fprintf('\r\n');
end

% 4: Summation of integers between two numbers (inclusive)

n1 = input('num1: ');
n2 = input('num2: ');

if n1 > n2
    fprintf('The sum of integers between %i and %i inclusive is: %i', n2, n1);
    t = 0;
    for v = n2:+1.0:n1
        t = t + v;
    end
        disp(t);
elseif n2 > n1
    fprintf('The sum of integers between %i and %i inclusive is: %i', n1, n2);
    t = 0;
    for v = n1:+1.0:n2
        t = t + v;
    end
        disp(t);
end

% 5: See if number is multiple of the other number

n1 = input('num1: ');
n2 = input('num2: ');

if n1 > n2
    if mod(n1, n2) == 0
        fprintf('%i is a multiple of %i \r\n', n1, n2);
    else
        fprintf('%i is NOT a multiple of %i \r\n', n1, n2);
    end
elseif n2 > n1
    if mod(n2, n1) == 0
        fprintf('%i is a multiple of %i \r\n', n2, n1);
    else
        fprintf('%i is NOT a multiple of %i \r\n', n2, n1);
    end
end