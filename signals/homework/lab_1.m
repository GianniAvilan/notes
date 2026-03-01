%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 341 Lab 2 - Time Domain Analysis of Continuous-Time Systems%
% Author: Gianni Avilan                                 %
% 02.04.2026                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear           % clear existing variables from the workspace
close all       % close all figures
clc             % clear the command window of text

%% Problem 8

clear
close all
clc

fprintf('Problem 8:\n\n');
% generate time vector 
t = [0:.001:5];
% generate f(t) vector
f = t.*exp(-t);
% plot function, set parameters
figure();
plot(t,f);
title('Problem 8');
xlim([0,5]); ylim([min(f), max(f)]);
xlabel('t'); ylabel('f(t)');
legend('te^{-t}');

fprintf('See displayed figure.\n\n');

%% Problem 11
clear
close all
clc

fprintf('Problem 11:\n\n');
% generate A matrix
A = [1:3; 4:6; 7:9];
% create column vector from values of A, display output
fprintf('The column vector of A, row by row, is\n');
a = [A(1,:) A(2,:) A(3,:)]'

%% Problem 12
clear
close all
clc

fprintf('Problem 12: \n\n');
% generate two random complex numbers%
function[z_3, z_4] = complex_mult_div(z_1, z_2)
    % multiply/divide
    z_3 = z_1*z_2; z_4 = z_1/z_2;
    % print results
    fprintf('The product of %i + j%i and %i + j%i is %i + j%i\n', real(z_1), imag(z_1), real(z_2), imag(z_2), real(z_3), imag(z_3));
fprintf('The division of %i + j%i and %i + j%i is %.i + j%.i\n\n', real(z_1), imag(z_1), real(z_2), imag(z_2), real(z_4), imag(z_4));
end

%test the function
fprintf('Testing the function,\n\n');
fprintf('Providing two complex numbers, z1 = -3+2j and z2 = 2-4j,\n\n');
complex_mult_div(-3+j*2, 2-j*4);


%% Problem 13
clear
close all
clc

fprintf('Problem 13: \n\n');
function[max_value] = absolute_max(x1, x2)
    %put numbers in array, abs() them, return max from the array
    value_array = [x1, x2];
    abs_array = abs(value_array);
    max_value = max(abs_array);
    fprintf('The highest absolute value between %f and %f is %f\n', x1, x2, max_value);
end

%test the function
fprintf('Testing the function,\n\n');
fprintf('Providing two numbers, x1 = -3 and x2 = 2,\n\n');
absolute_max(-3,2);

fprintf('Providing three numbers, x1 = -3, x2 = 2, x3 = 5, returns an error,\n\n')
absolute_max(-3,2,5);

%% Problem 14
clear
close all
clc

fprintf('Problem 14: \n\n');
function[descending_vector, zero_elements_count, non_zero_vector] = vector_manipulation(input_vector)
    fprintf('The given vector, sorted into descending order, is\n');
    % use built-in sort function
    descending_vector = sort(input_vector,'descend')
    % init non-zero vector
    non_zero_vector = zeros(1,length(input_vector));
    % for loop through vector to count 0 elements
    zero_elements_count = 0;
    for i=1:length(input_vector)
        if input_vector(i) == 0
            zero_elements_count=zero_elements_count+1;
        % we can also fill the non-zero vector at the same time
        else
            non_zero_vector(i) = input_vector(i); 
        end
    end
    fprintf('The number of zero elements in this vector is %f\n\n', zero_elements_count);
    fprintf('The vector of non-zero elements from the input vector is\n');
    non_zero_vector
end

% test the function
fprintf('Testing the function,\n\n');
fprintf('Providing a vector a = [0 0 2 4 5 -4 5 2],\n')
a = [0 0 2 4 5 -4 5 2];
vector_manipulation(a);

%% Problem 15
clear
close all
clc

fprintf('Problem 15: \n\n')
% generate vector for primes
nums = 3:101;
% init output vector, add 3 (won't show up in the for loop) 
output_vector = [3];
% check primes using remainders
for i= 1:length(nums)
    remainder = rem(nums(i),6);
    if (remainder == 1 || remainder == 5)
        % add primes to output
        output_vector = [output_vector, nums(i)];
    end
end
fprintf('All primes between 3 and 101 are contained in the following vector:\n')
output_vector

%% Problem 17
clear
close all
clc

fprintf('Problem 16: \n\n');
% set up the symbolic expressions
syms x y
eqn1 = y == 1 - x^2; eqn2 = y == 1 + x;
% solve 
sol = solve([eqn1, eqn2], [x,y]);
% display solutions
fprintf('The solution to the system of equations y = 1-x^{2}; y=1+x is:\n');
fprintf('x = %i; y=%i\n', sol.x(1), sol.y(1));