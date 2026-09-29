function root = secantsMethod(func, x0, x1,tol,  maxIter)
if nargin < 4
    tol = 1e-6;
end

if nargin < 5
    maxIter= 100;
end
iter = 0;
while iter < maxIter
    iter = iter + 1;
    fx0 = func(x0);
    fx1 = func(x1);

    if abs(fx1-fx0) < eps
        error('Derivative near zero, Secants method may fail');
    end

    x2 = (fx1*x0 - fx0*x1)/(fx1-fx0);
    if abs(x2-x1) < tol
        break;
    end

    x0 = x1;
    x1 = x2;
end
root = x1;
fprintf('Root found at x = %.6f after %d iterations\n', root, iter);
end

