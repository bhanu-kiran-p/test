function min = steepestDescentMethod(func, grad, x0, maxIter)
    if nargin <4
        maxIter = 100;
    end
    iter = 0;
    while iter < maxIter
        iter = iter + 1;
        gx = grad(x0);
        syms a;
        ax = func(x0-a*gx);
        dax = diff(ax);
        a0 = newtonRalphsonMethod(ax,dax,0);
        x1 = x0 - a0*gx;
        fx = func(x1);
        fprintf("Iteraton %d", iter);
        fprintf(" Gradient g");
        disp(gx);
        fprintf("New Point");
        disp(x1);
        fprintf("f(x^(1))");
        disp(fx);
        x0 = x1;
    end
    min = x0;
end

