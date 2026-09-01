syms x y;
f = x^2 + y^2;
point = [0, 0];
concavity = checkConcavity(f,point);
disp(concavity);