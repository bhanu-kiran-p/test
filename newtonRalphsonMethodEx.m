syms x;
func = @(x) x^3-x-1;
dfunc = @(x) 3*x^2 - 1;
tol = 1e-10;
x0 = 1.5;
maxIter = 100;
root = newtonRalphsonMethod(func, dfunc, x0,tol, maxIter);
