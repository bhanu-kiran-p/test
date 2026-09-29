function concavity = checkConcavity(func, point)
    syms x y;
    vars = [x, y];
    H = hessian(func, vars);
    H_func = matlabFunction(H, 'Vars', {vars});
    H_at_point = H_func(point);
    definiteness = checkDefiniteness(H_at_point);
    switch definiteness
        case 'Positive Definite'
            concavity = 'Strictly Convex (Local Minimum)';
        case 'Positive Semi Definite'
            concavity = 'Convex (Possible local Minimum)';
        case 'Negative Definite'
            concavity = 'Strictly Concave (Local Maximum)';
        case 'Negative Semi Definite'
            concavity = 'Concave (Possible Local Minimum)';
        otherwise
            concavity = 'Sudden Point';
    end
end

