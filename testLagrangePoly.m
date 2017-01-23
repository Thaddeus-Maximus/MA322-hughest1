lastName='Hughes';

numTests = 10;

for t = 1:numTests
   fprintf('\n\n#####  New Random Test #####\n\n')

   n = round(7*rand(1) + 3);
   x = 20*randn(n,1);
   y = 10*randn(n,1);
   x = fix(x*100)/100;
   y = fix(y*100)/100;
   v = linspace(min(x)-0.2, max(x)+0.2, 200);

   cmd1 = sprintf('[z1] = %s_LagrangePoly(x,y,v);', lastName);
   cmd2 = sprintf('[z2] = %s_LagrangePoly(x,y,v);', 'Holder');

   fprintf('Problem has %d data points with\n', n)
   fprintf('\tx = %s\n', mat2str(x))
   fprintf('\ty = %s\n', mat2str(y))

   fprintf('\nRunning %s\n', cmd1)
   eval(cmd1)
   fprintf('\nA plot of the result with the data is displayed\n')
   figure
   plot(x, y, 'k*', 'linewidth', 3)
   hold on;
   plot(v, z1, 'b', 'linewidth', 2)

   fprintf('\nRunning %s\n', cmd2)
   eval(cmd2)
   fprintf('\nA plot of the result with the data is displayed\n')
   figure
   plot(x, y, 'k*', 'linewidth', 3)
   hold on;
   plot(v, z2, 'b', 'linewidth', 2)

   if norm(z1-z2) < 10^(-6)
      fprintf('\nOur polynomial evaluations agree\n')
   else
      fprintf('\nOur polynomial evaluations disagree\n')
   end

   fprintf('\nPress enter to continue\n')
   pause
   close all;
end
