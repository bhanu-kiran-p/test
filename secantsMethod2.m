syms x;
func = @(x) exp(x)-2;
tol = 1e-4;
x1 = 1.2;
x0 = 1;
maxIter = 2;
root = secantsMethod(func, x0,x1, tol, maxIter);
