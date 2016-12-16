clc
clear all
lastName='Hughes'

more off;
numTests = 9;
tol = 10^-8;

for t = 0:numTests
   fprintf('\n\n#####  New Random Test #####\n\n')

   n = round(997*rand(1) + 3);
   Q = round(20*rand(n) - 10);
   b= round(10*rand(n,1)-5);

   if mod(t,2) == 0
      [U,D] = eig(Q' + Q);
      Q = U*diag(5*rand(n,1)+1)*U';
   elseif mod(t,2) == 1
      Q = Q + Q';
      Q = Q + max(sum(abs(Q)))*eye(n)+10;
   end
   x0 = 5*rand(n,1);

   if t == numTests % test finding the solution before the n-th step
      Q = eye(3);
      b = [0;1;0];
      x0 = [1;0;0];
   end
   fprintf('Size of Q is %d x %d\n', n, n)

   if t < numTests
      randItrBnd = round(0.5 + n*rand(1));
   else
      randItrBnd = inf;
   end
   randTol = 10^(-(1 + round(7*rand(1))));

   eval(sprintf('[x1, s1] = %s_ConjugateGradient(Q, b, x0, randItrBnd, randTol);', lastName));
   [x2, s2] = Holder_ConjugateGradient(Q, b, x0, randItrBnd, randTol);

   if (s1 == s2) && (s2 == 0) && (norm(x1 - x2) < tol) && ...
      (norm(Q*x1-b) < randTol) && (norm(Q*x2 - b) < randTol)
      fprintf('Both codes correctly solved the problem\n')
      fprintf('\tOur solutions differ by %f\n', norm(x1 - x2))
      fprintf('\tMy residual is %f\n', norm(Q*x2 - b))
      fprintf('\tYour residual is %f\n', norm(Q*x1-b))
   elseif (s1 == s2) && (s2 == 1)
      fprintf('Both codes failed to solve the system\n')
   else
      fprintf('Our codes do not agree\n')
   end
   
   fprintf('Press enter to continue\n')
   pause
end
