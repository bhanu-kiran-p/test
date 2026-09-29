syms x;
func = @(x) exp(x)-2;
dfunc = @(x) exp(x);
tol = 1e-4;
x0 = 1;
maxIter = 2;
root = newtonRalphsonMethod(func, dfunc, x0,tol, maxIter);
