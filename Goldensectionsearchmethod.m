function main_golden_search()
% MAIN_GOLDEN_SEARCH Main script to execute the Golden Section Search
clc; clear;
% 1. Define your specific objective function
% f(x) = 8*e^(1-x) + 7*ln(x)
my_func = @(x) 8 * exp(1 - x) + 7 * log(x);
% 2. Define parameters
lower_bound = 1;
upper_bound = 2;
tolerance = 0.23;
% 3. Run the optimization function (defined below)
[x_min, f_min] = golden_section_search(my_func, lower_bound, upper_bound, tolerance);
% 4. Print final optimal results
fprintf('Optimal x (Minimum point): %.5f\n', x_min);
fprintf('Minimum function value: %.5f\n', f_min);
end
function [x_opt, f_opt] = golden_section_search(func, a, b, tol)
% GOLDEN_SECTION_SEARCH Local function that finds the minimum
% of a function and prints an iteration table.
% Define the golden ratio multiplier
phi = (3-sqrt(5)) / 2;
rphi = 1-phi ;% Approximately 0.61803
% Calculate initial interior probe points
x1 = a + phi * (b - a);
x2 = a + rphi * (b - a);
% Evaluate function values at initial points
f1 = func(x1);
f2 = func(x2);
% --- Print Table Header ---
fprintf('\n%4s | %10s | %10s | %10s | %10s | %10s | %10s | %10s\n', ...
    'Iter', 'a', 'b', 'x1', 'x2', 'f(x1)', 'f(x2)', 'Interval');
fprintf('%s\n', repmat('-', 1, 92));
iter = 0;
% Iterative loop until the interval is narrower than the tolerance
while (b - a) > tol
    iter = iter + 1;
    % Print current iteration values before updating the boundaries
    fprintf('%4d | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f\n', ...
        iter, a, b, x1, x2, f1, f2, (b - a));
    if f1 < f2
        % The minimum lies in the left sub-interval [a, x2]
        b = x2;
        x2 = x1;
        f2 = f1;
        % Calculate new x1
        x1 =a + phi * (b - a);
        f1 = func(x1);
    else
        % The minimum lies in the right sub-interval [x1, b]
        a = x1;
        x1 = x2;
        f1 = f2;
        % Calculate new x2
        x2 = a + rphi * (b - a);
        f2 = func(x2);
    end
end
% Print the very last iteration bounds reached
fprintf('%4d | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f | %10.5f\n', ...
    iter+1, a, b, x1, x2, f1, f2, (b - a));
fprintf('%s\n\n', repmat('-', 1, 92));
% Return the midpoint of the final optimal interval
x_opt = (a + b) / 2;
f_opt = func(x_opt);
end
