f = @(x) x(1) + 0.5*x(2) + 0.5*(x(1)^2) + x(2)^2 + 3;
grad_f = @(x) [1+x(1); 0.5 + 2*x(2)];
disp(grad);
x = [0;0];
fprintf("Initial Point : [%d, %d]^T\n\n", x(1), x(2));
for k = 1:2
    g = grad_f(x);
    syms alpha
    x_alpha = x - alpha*g;
    f_aplha = x_alpha(1) + 0.5*x_alpha(2) + 0.5*x_alpha(1)^2 + x_alpha(2)^2 +3;
    df_alpha = diff(f_aplha, alpha);
    alpha_opt = double(solve(df_alpha == 0, alpha));
    alpha_min = min(alpha_opt);
    x = x - alpha_min*g;
    fprintf("Iteration : %d\n", k);
    fprintf(" gradient : [%f, %f]^T\n", g(1), g(2));
    fprintf(" new point : [%f, %f]^T\n", x(1), x(2));
    fprintf(" f(x^(%d)) : %d\n", k, f(x));
    fprintf("\n");
end