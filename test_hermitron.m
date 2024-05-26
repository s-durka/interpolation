% TEST 1
% Define known points and their function values (quadratic function)
x = [-1, 0, 1];
F = x.^2;

% No derivatives known (empty arrays)
dF1 = [];
dFn = [];

% Points where we want to interpolate
t = linspace(-1, 1, 5);

% Known exact values at points t
exact_values = t.^2;

% Call hermitron
interpolated_values = hermitron(t, x, F, dF1, dFn);

% Display results
disp('Test 1: Basic Polynomial Interpolation');
disp('Exact values:');
disp(exact_values);
disp('Interpolated values:');
disp(interpolated_values);

% TEST 2
% Define known points and their function values (cubic function)
x = [-1, 0, 1];
f = x.^3;

dF1 = [3*x(1)^2];
% dFn = [3*x(3)^2];
dFn = [];



% Points where we want to interpolate
% t = linspace(-1, 1, 5);
t = [x, 2];
ff = t.^3;
% Known exact values at points t
exact_values0 = t.^3

% Call hermitron
interpolated_values1 = hermitron(t, x, f, dF1, dFn)
interpolated_values2 = hermitron(t, t, ff, dF1, dFn)

x = [-1, 0, 1];
f = x.^6;
dF1 = [6*x(1)^5, 30*x(1)^4];
dFn = [6*x(3)^5, 30*x(3)^4];

t
exact_values = t.^6
interpolated_values3 = hermitron(t, x, f, dF1, dFn)


x = [-1, 2];
f = [3, 0];
dF1 = [5];
dFn = [2];

t = [-1, 2, 3];

interpolated_values4 = hermitron(t, x, f, dF1, dFn)



% Display results
% disp('Test 2: Including First Derivatives');
% disp('Exact values:');
% disp(exact_values);
% disp('Interpolated values:');
% disp(interpolated_values);

% f = @(x) -x.^4;
% df = @(x) -4*x.^3;
% ddf = @(x) -12*x.^2;
% x = [-1, 1];
% F = f(x)
% dF1 =[df(x(1)), ddf(x(1))]
% dFn = [df(x(2)), ddf(x(2))]

% t = [-1, 1, 2];

% interpolated_values5 = hermitron(t, x, F, dF1, dFn)