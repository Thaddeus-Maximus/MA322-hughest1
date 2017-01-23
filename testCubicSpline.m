function testcubicSpline(lastName)

more off;
numTests = 6;
tol = 10^(-6);

for t = 1:numTests
   fprintf('\n\n#####  New Random Test #####\n\n')
   s = 5 + round(10*rand(1));
   badData = 1;
   while badData
      x = sort((0.5*rand(1,s) - 0.25)*s);
      x = fix(x*10)/10;
      if length(unique(x)) == s
         badData = 0;
      end
   end
   y = 0.1*s*rand(1,s);
   y = fix(y*10)/10;
   fprintf('The number of data points is %d \n', s)
   close all;
   vCmd = 'v = linspace(min(x),max(x),100);';
   fprintf('The data is\n\nx = %s\n\ny = %s\n\n%s\n', ...
           mat2str(x), mat2str(y), vCmd);
   eval(vCmd);
   cmd = sprintf('[z1] = %s_cubicSpline(x,y,v);', lastName);
   fprintf('\nYour code run as \n\n%s\n\n', cmd)
   eval(cmd)
   fprintf('My code run as \n\n[z2] = Holder_cubicSpline(x,y,v);\n\n')
   [z2] = Holder_cubicSpline(x,y,v);
   figure
   plot(v,z1,'b', 'linewidth', 2)
   hold on
   plot(x,y,'r*', 'linewidth', 4)
   title('Your solution is blue', 'fontsize', 12)
   figure
   plot(v,z2,'k', 'linewidth', 2)
   hold on
   plot(x,y,'r*', 'linewidth', 4)
   title('My solution is black', 'fontsize', 12)
   fprintf('Make sure the graphs look the same.\n')
   if norm(z1 - z2) < tol
      fprintf('Both codes correctly solved the problem\n')
      fprintf('\tOur solutions differ by ||z1 - z2|| = %f\n', norm(z1 - z2))
   else
      fprintf('Our codes do not agree\n')
   end
   fprintf('Press enter to continue\n')
   pause
end

close all;
