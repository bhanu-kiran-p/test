syms x;
func = @(x) x^3-x-1;
tol = 1e-10;
x0 = 1.3;
x1 = 1.5;
maxIter = 100;
root = secantsMethod(func,x0,x1,tol,maxIter);
