lastName='Hughes';

more off;
numTests = 3;
tol = 10^-4;
deg = 1:5;

for t = 0:numTests
   fprintf('\n\n#####  New Random Test #####\n\n')

   n = 10 + round(10*rand(1));
   x = 5*rand(n,1)+1;
   y = 5*rand(n,1)+1;
   x = fix(x*100)/100;
   y = fix(y*100)/100;
   m = deg(round(5*rand(1)+0.5));

   fprintf('\tNumber of points is %d\n', n);
   fprintf('\tDegree of polynomial is %d\n', m);

   cmd1 = sprintf('[c1] = %s_leastSquares(%s, %s, %d);', ...
                  lastName, mat2str(x), mat2str(y), m);
   eval(cmd1);
   fprintf('\nYour command run as:\n\n')
   disp(cmd1)
   fprintf('\n\nreturns\n\nc1 = %s\n\n',mat2str(c1))

   [c2] = Holder_leastSquares(x, y, m);

   fprintf('\nMy code returns\n\nc2 = %s\n\n', mat2str(c2))

   %if (s1 == s2) && (s2 == 0) && (norm(c1(:) - c2(:)) < tol)
   if (norm(c1(:) - c2(:)) < tol)
      fprintf('Our codes agree and here are plots of our solutions\n')
      close all;
      w = min(x):0.01:max(x);
      f1 = polyval(fliplr([c1(:)]'),w);
      f2 = polyval(fliplr([c2(:)]'),w);
      figure
      plot(x,y,'d')
      hold on
      plot(w,f1)
      figure
      plot(x,y,'d')
      hold on
      plot(w,f2)
   %elseif (s1 == s2) && (s1 == 1)
   %   fprintf('Both codes failed to solve the system\n')
   else
      fprintf('Our codes do not agree\n')
   end
   
   fprintf('Press enter to continue\n')
   pause
   close all;
end
