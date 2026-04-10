%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 341 Lab 3 - Continuous-Time System Analysis using Laplace Transform %
% Author: Gianni Avilan & Alyx Wilhelm                                    %
% 04.7.2026                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear           % clear existing variables from the workspace
close all       % close all figures
clc             % clear the command window of text

%% Problem 1

clear;
close all;
clc;

%{
In MATLAB, computing the unilateral Laplace transform of a function is as
simple as declaring a function (using symbolic variables) and using the
built-in laplace() function.
%}

% a)
fprintf('Part a)\n\n')
syms t s;
x = exp(-3*t) + exp(3*t);
X = laplace(x);
simplify(X);
pretty(ans)
fprintf('\n')

% c)
fprintf('Part c)\n\n')
x = 3*cos(2*t) + sin(3*pi*t);
X = laplace(x);
simplify(X);
pretty(ans)
fprintf('\n')

% f)
fprintf('Part f)\n\n')
x = heaviside(t) + heaviside(t-1) + heaviside(t-2);
X = laplace(x);
simplify(X);
pretty(ans)
fprintf('\n')

% g)
fprintf('Part g)\n\n')
x = dirac(t) + dirac(t-1);
X = laplace(x);
simplify(X);
pretty(ans)
fprintf('\n')

%% Problem 2

clear;
close all;
clc;

%{
The inverse Laplace in MATLAB is the same process, using ilaplace()
instead.
%}

% a)
fprintf('Part a)\n\n')
syms s t;
X = 1+(1/s)+(1/s^2)+(1/s^3)+(1/s^4)+(1/s^5);
x = ilaplace(X);
simplify(x);
pretty(ans)
fprintf('\n')

% b)
fprintf('Part b)\n\n')
X = (1/(s-4*1i)) + (2/(s-4));
x = ilaplace(X);
simplify(x);
pretty(ans)
fprintf('\n')

%% Problem 5

clear;
close all;
clc;

%{
The initial value theorem states the limit of some time-domain function
f(t), as t approaches zero, is equal to the limit of its s-domain
equivalent times s, sF(s), as s approaches infinity.
%}

% find the s-domain equivalent of sin(t)/t
syms t s;
x = (sin(t)/t);
X = laplace(x);
limit(s*X,inf)

%{
The limit as s approaches infinity is 1, verifying that the limit of
sin(t)/t as t approaches 0 is 1.
%}

%% Problem 6

clear;
close all;
clc;

% a)
fprintf('Part a)\n\n')

%{
The partial fraction expansion of an s-domain function may be accomplished
using the residue() function, which produces the residues, poles, and direct
term (there will be no direct term in this expansion) of a rational polynomial function
%}

% express coefficients of the numerator and denominator
b = [1 -1 2]; a = [1 -2 -5 6];
[r,p,k] = residue(b,a);

% use the residues and poles to construct the expanded expression
syms s;
X = r(1)/(s-p(1)) + r(2)/(s-p(2)) + r(3)/(s-p(3));
pretty(X)

%% Problem 7

clear;
close all;
clc;

% c)
fprintf('Part c)\n\n')

%{
The inverse process, expressing a partial fraction expansion in rational
form, may be accomplished by simply inputting the applicable values of
[r,p,k] into the argument of residue, which will then return [b,a]
%}

% express residue, poles, and direct terms
r = [3 2]; p = [-4 1]; k = [1 2 6];

% find resulting numerator and denominator
[b,a] = residue(r,p,k);
syms s;
X = (b(1)*s^4 + b(2)*s^3 + b(3)*s^2 + b(4)*s + b(5))/(a(1)*s^2 + a(2)*s + a(3));
% express rational form
pretty(X)

%% Problem 8

clear;
close all;
clc;

%{
In the s-domain, convolution is equivalent to multiplication; therefore, to
easily find the convolution of two time-domain functions, we can convert
them to the s-domain, multiply them, and then convert the result back to
the time-domain.
%}

%{ 
set up variables, functions (No need to include u(t) since MATLAB 
does a unilateral transform by default)
%}

syms t s; x = 5*exp(-t); h = t*exp(-t);

% convert to Laplace, multiply
X = laplace(x); H = laplace(h);
conv = X*H;
x_h = ilaplace(conv);
simplify(x_h);
pretty(ans)

%% Problem 10

clear;
close all;
clc;

%{
By converting both sides of the equation to the s-domain, and evaluating
for given initial conditions, we may solve the equation algebraically and
then convert back to the time domain.
%}

% set up variables, expressions, initial conditions
syms t s Y;
X = laplace(t*exp(-t)); 
y0 = 2; yd0 = 1;
Y1 = s*Y - y0; Y2 = s*Y1-yd0;

% then, solve for the result algebraically and convert back to time domain

G = 2*Y2 + Y1 - X;
SOL = solve(G,Y);
ilaplace(SOL)













