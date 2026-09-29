function root = newtonRalphsonMethod(func, dfunc, x0, tol, maxIter)
   if nargin < 4
       tol = 1e-6;     %1e-6 = 10^(-16)
   end

   if nargin < 5
       maxIter= 100;
   end
   iter = 0;
   while iter < maxIter
       iter = iter + 1;
       fx = func(x0);
       dfx = dfunc(x0);
       
       if abs(dfx) < eps  % eps =2.22e-16
           error('Derivative near zero, Newtons-Ralphson method may fail');
       end

       % Newton-Ralphson formula
       x1 = x0-fx/dfx;
       if abs(x1-x0) < tol
           break;
       end

       % update for the next iteration
       x0 = x1;
   end
   root = x0;
   fprintf('Root found at x = %.6f after %d iterations\n', root, iter);
end

