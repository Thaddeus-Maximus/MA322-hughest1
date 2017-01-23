lastName='Hughes'
more off;
numTests = 10;
tol = 10^-4;

% Faber-Jackson Data
M = [-20.2; -21.2; -21.3; -20.1; -22.2; -21.7; -17.5; ...
     -20.7; -21.7; -22.7; -21.2];
v = [240; 285; 265; 200; 295; 315; 150; 290; 260; 400; 255];

% Bridge Data
Xbridge = [17300, 24200, 24400, 3900, 13300, 5140, 6560]';
ybridge = [92, 74, 97, 13, 79, 21, 19]';

for t = 1:numTests
   if t == 1
      fprintf('\n\n#####  Faber-Jackson Data (no optional input) #####\n\n')
      cmd1 = sprintf('[a1, R1, p1] = %s_linearRegression(M,log10(v));', lastName);
      cmd2 = sprintf('[a2, R2, p2] = %s_linearRegression(M,log10(v));', 'Holder');
      fprintf('Running: %s\n', cmd1)
      eval(cmd1);
      fprintf('Results are: \n\ta1 = %s \n\tR1 = %1.2f \n\tp1 = %s\n', ...
              mat2str(a1), R1, mat2str(p1))
      fprintf('\n\nRunning: %s\n', cmd2)
      eval(cmd2);
      fprintf('Results are: \n\ta2 = %s \n\tR2 = %1.2f \n\tp2 = %s\n', ...
              mat2str(a2), R2, mat2str(p2))
      fprintf('\nPress a key to continue\n')
      pause
   elseif t == 2
      fprintf('\n\n#####  Faber-Jackson Data (optional input 1) #####\n\n')
      cmd1 = sprintf('[a1, R1, p1, y1] = %s_linearRegression(M,log10(v),M);', lastName);
      cmd2 = sprintf('[a2, R2, p2, y2] = %s_linearRegression(M,log10(v),M);', 'Holder');
      fprintf('Running: %s\n', cmd1)
      eval(cmd1);
      y1 = fix(y1*100)/100;
      fprintf('Results are: \n\ta1 = %s \n\tR1 = %1.2f \n\tp1 = %s \n\ty1 = %s\n', ...
              mat2str(a1), R1, mat2str(p1), mat2str(y1))
      fprintf('\n\nRunning: %s\n', cmd2)
      eval(cmd2);
      y2 = fix(y2*100)/100;
      fprintf('Results are: \n\ta2 = %s \n\tR2 = %1.2f \n\tp2 = %s \n\ty2 = %s\n', ...
              mat2str(a2), R2, mat2str(p2), mat2str(y2))
      fprintf('\nPress a key to continue\n')
      pause
   elseif t == 3
      fprintf('\n\n#####  Faber-Jackson Data (optional input 2) #####\n\n')
      cmd1 = sprintf('[a1, R1, p1, y1, c1, s1] = %s_linearRegression(M,log10(v),M);', lastName);
      cmd2 = sprintf('[a2, R2, p2, y2, c2, s2] = %s_linearRegression(M,log10(v),M);', 'Holder');
      fprintf('Running: %s\n', cmd1)
      eval(cmd1);
      y1 = fix(y1*100)/100;
      c1 = fix(c1*100)/100;
      s1 = fix(s1*100)/100;
      fprintf('Results are: \n\ta1 = %s \n\tR1 = %1.2f \n\tp1 = %s \n\ty1 = %s \n\tc1 = %s \n\ts1 = %s\n', ...
              mat2str(a1), R1, mat2str(p1), mat2str(y1), mat2str(c1), mat2str(s1))
      fprintf('\n\nRunning: %s\n', cmd2)
      eval(cmd2);
      y2 = fix(y2*100)/100;
      c2 = fix(c2*100)/100;
      s2 = fix(s2*100)/100;
      fprintf('Results are: \n\ta2 = %s \n\tR2 = %1.2f \n\tp2 = %s \n\ty2 = %s \n\tc2 = %s \n\ts2 = %s\n', ...
              mat2str(a2), R2, mat2str(p2), mat2str(y2), mat2str(c2), mat2str(s2))
      fprintf('\nPress a key to continue\n')
      pause
   elseif t == 4
      fprintf('\n\n#####  Faber-Jackson Data (optional input 3) #####\n\n')
      cmd1 = sprintf('[a1, R1, p1, y1, c1, s1] = %s_linearRegression(M,log10(v),[-22.2;-19.4],[0.7;0.99]);', lastName);
      cmd2 = sprintf('[a2, R2, p2, y2, c2, s2] = %s_linearRegression(M,log10(v),[-22.2;-19.4],[0.7;0.99]);', 'Holder');
      fprintf('Running: %s\n', cmd1)
      eval(cmd1);
      y1 = fix(y1*100)/100;
      c1 = fix(c1*100)/100;
      s1 = fix(s1*100)/100;
      fprintf('Results are: \n\ta1 = %s \n\tR1 = %1.2f \n\tp1 = %s \n\ty1 = %s \n\tc1 = %s \n\ts1 = %s\n', ...
              mat2str(a1), R1, mat2str(p1), mat2str(y1), mat2str(c1), mat2str(s1))
      fprintf('\n\nRunning: %s\n', cmd2)
      eval(cmd2);
      y2 = fix(y2*100)/100;
      c2 = fix(c2*100)/100;
      s2 = fix(s2*100)/100;
      fprintf('Results are: \n\ta2 = %s \n\tR2 = %1.2f \n\tp2 = %s \n\ty2 = %s \n\tc2 = %s \n\ts2 = %s\n', ...
              mat2str(a2), R2, mat2str(p2), mat2str(y2), mat2str(c2), mat2str(s2))
      fprintf('\nPress a key to continue\n')
      pause
   elseif t == 5
      fprintf('\n\n##### Bridge Data (simple linear) #####\n\n')
      X = Xbridge;
      y = ybridge;
      cmd1 = sprintf('[a1, R1, p1, y1, c1, s1] = %s_linearRegression(X,y,X,0.7*ones(7,1));', lastName);
      cmd2 = sprintf('[a2, R2, p2, y2, c2, s2] = %s_linearRegression(X,y,X,0.7*ones(7,1));', 'Holder');
      fprintf('Running: %s\n', cmd1)
      eval(cmd1);
      y1 = fix(y1*100)/100;
      c1 = fix(c1*100)/100;
      s1 = fix(s1*100)/100;
      fprintf('Results are: \n\ta1 = %s \n\tR1 = %1.2f \n\tp1 = %s \n\ty1 = %s \n\tc1 = %s \n\ts1 = %s\n', ...
              mat2str(a1), R1, mat2str(p1), mat2str(y1), mat2str(c1), mat2str(s1))
      fprintf('\n\nRunning: %s\n', cmd2)
      eval(cmd2);
      y2 = fix(y2*100)/100;
      c2 = fix(c2*100)/100;
      s2 = fix(s2*100)/100;
      fprintf('Results are: \n\ta2 = %s \n\tR2 = %1.2f \n\tp2 = %s \n\ty2 = %s \n\tc2 = %s \n\ts2 = %s\n', ...
              mat2str(a2), R2, mat2str(p2), mat2str(y2), mat2str(c2), mat2str(s2))
      fprintf('\nPress a key to continue\n')
      pause
   elseif t == 6
      fprintf('\n\n##### Bridge Data (X and ln(X)) #####\n\n')
      X = [Xbridge, log(Xbridge)];
      y = ybridge;
      cmd1 = sprintf('[a1, R1, p1, y1, c1, s1] = %s_linearRegression(X,y,X,0.7*ones(7,1));', lastName);
      cmd2 = sprintf('[a2, R2, p2, y2, c2, s2] = %s_linearRegression(X,y,X,0.7*ones(7,1));', 'Holder');
      fprintf('Running: %s\n', cmd1)
      eval(cmd1);
      y1 = fix(y1*100)/100;
      c1 = fix(c1*100)/100;
      s1 = fix(s1*100)/100;
      fprintf('Results are: \n\ta1 = %s \n\tR1 = %1.2f \n\tp1 = %s \n\ty1 = %s \n\tc1 = %s \n\ts1 = %s\n', ...
              mat2str(a1), R1, mat2str(p1), mat2str(y1), mat2str(c1), mat2str(s1))
      fprintf('\n\nRunning: %s\n', cmd2)
      eval(cmd2);
      y2 = fix(y2*100)/100;
      c2 = fix(c2*100)/100;
      s2 = fix(s2*100)/100;
      fprintf('Results are: \n\ta2 = %s \n\tR2 = %1.2f \n\tp2 = %s \n\ty2 = %s \n\tc2 = %s \n\ts2 = %s\n', ...
              mat2str(a2), R2, mat2str(p2), mat2str(y2), mat2str(c2), mat2str(s2))
      fprintf('\nPress a key to continue\n')
      pause
   elseif t == 7
      fprintf('\n\n##### Bridge Data (ln(X)) #####\n\n')
      X = log(Xbridge);
      y = ybridge;
      cmd1 = sprintf('[a1, R1, p1, y1, c1, s1] = %s_linearRegression(X,y,X,0.7*ones(7,1));', lastName);
      cmd2 = sprintf('[a2, R2, p2, y2, c2, s2] = %s_linearRegression(X,y,X,0.7*ones(7,1));', 'Holder');
      fprintf('Running: %s\n', cmd1)
      eval(cmd1);
      y1 = fix(y1*100)/100;
      c1 = fix(c1*100)/100;
      s1 = fix(s1*100)/100;
      fprintf('Results are: \n\ta1 = %s \n\tR1 = %1.2f \n\tp1 = %s \n\ty1 = %s \n\tc1 = %s \n\ts1 = %s\n', ...
              mat2str(a1), R1, mat2str(p1), mat2str(y1), mat2str(c1), mat2str(s1))
      fprintf('\n\nRunning: %s\n', cmd2)
      eval(cmd2);
      y2 = fix(y2*100)/100;
      c2 = fix(c2*100)/100;
      s2 = fix(s2*100)/100;
      fprintf('Results are: \n\ta2 = %s \n\tR2 = %1.2f \n\tp2 = %s \n\ty2 = %s \n\tc2 = %s \n\ts2 = %s\n', ...
              mat2str(a2), R2, mat2str(p2), mat2str(y2), mat2str(c2), mat2str(s2))
      fprintf('\nPress a key to continue\n')
      pause
   elseif t >= 8
      fprintf('\n\n##### Random Problem  #####\n\n')
      numSamples = round(50 + 5*randn(1));
      numIndVar = round(2 + 4*rand(1));
      X = 20*rand(numSamples, numIndVar);
      coef = round(100*rand(numIndVar+1,1));
      y = 100*rand(numSamples,1);
      cmd1 = sprintf('[a1, R1, p1] = %s_linearRegression(X,y);', lastName);
      cmd2 = sprintf('[a2, R2, p2] = %s_linearRegression(X,y);', 'Holder');
      fprintf('Running: %s\n', cmd1)
      eval(cmd1);
      a1 = fix(a1*100)/100;
      p1 = fix(p1*100)/100;
      fprintf('Results are: \n\ta1 = %s \n\tR1 = %1.2f \n\tp1 = %s\n', mat2str(a1), R1, mat2str(p1))
      fprintf('\n\nRunning: %s\n', cmd2)
      eval(cmd2);
      a2 = fix(a2*100)/100;
      p2 = fix(p2*100)/100;
      fprintf('Results are: \n\ta2 = %s \n\tR2 = %1.2f \n\tp2 = %s\n', mat2str(a2), R2, mat2str(p2))
      fprintf('\nPress a key to continue\n')
      pause
   end
end
