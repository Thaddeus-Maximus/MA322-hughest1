%
% An example test script for assignment 1
%
% change lastName to your last name to test your functions
lastName = 'Hughes';

% a list of the root finding methods
program = {'Interpolation','Secant','Newton'};

% three standard function you should be able solve
testFunc = {'''tstFunc1''', '@(x) x^3-x', '@(x) exp(x)+x'};
testFuncPrime = {'''tstFuncPrime1''', '@(x) 3*x^2-1', '@(x) exp(x)+1'};

% settings for interpolation on sin(x)
s{1,1,1} = [-0.8, 0.9, 10^-8, 20, 1];
s{1,1,2} = [-0.8, 0.9, 10^-8, 50, 1];
s{1,1,3} = [0.1, 0.9, 10^-8, 20, 1];

% settings for interpolation on x^3-x
s{1,2,1} = [-5, 2, 10^-8, 50, 1];
s{1,2,2} = [-5, 2, 10^-8, 2, 0];

% setting for interpolation on exp(x)+x
s{1,3,1} = [-2, 2, 10^-8, 50, 1];
s{1,3,2} = [-0.5672, 2, 10^-8, 5, 1];

% settings for secant on sin(x)
s{2,1,1} = [0.7, 0.9, 10^-8, 30, 1];
s{2,1,2} = [-0.8, 0.9, 10^-8, 20, 1];
s{2,1,3} = [0.7, 0.9, 10^-8, 5, 1];

% settings for secant on x^3-x
s{2,2,1} = [-0.2, -0.1, 10^-8, 50, 1];
s{2,2,2} = [1.5, 1.9, 10^-8, 2, 1];

% setting for secant on exp(x)+x
s{2,3,1} = [0, 1, 10^-8, 30, 1];
s{2,3,2} = [-0.5672, 2, 10^-8, 5, 1];

% setting for newton on sin(x)
s{3,1,1} = [0.9, 10^-8, 20, 1];
s{3,1,2} = [0.9, 10^-8, 20, 1];
s{3,1,3} = [0.9, 10^-8, 5, 1];

% settings for newton on x^3-x
s{3,2,1} = [2, 10^-8, 50, 1];
s{3,2,2} = [10, 10^-8, 2, 1];

% setting for newton on exp(x)+x
s{3,3,1} = [1, 10^-8, 20, 1];
s{3,3,2} = [-0.5672, 2, 10^-8, 5, 1];

numTest = [3,2,2];
more off;

for solver = 1:length(program)
   for prob = 1:length(testFunc)
      for tst = 1:numTest(prob)
         if solver < 3
            % Run Student Code
            cmdStud = sprintf('[xRt,fRt,itrCnt,stat] = %s_%s(%s,%1.4f,%1.4f,%1.8f,%d,%d);', ...
                    lastName, program{solver}, testFunc{prob}, ...
                    s{solver,prob,tst}(1), s{solver,prob,tst}(2), s{solver,prob,tst}(3), ...
                    s{solver,prob,tst}(4), s{solver,prob,tst}(5));
            fprintf('\nRunning \n%s \n', cmdStud)
            eval(cmdStud);
            fprintf('\n Solution is \n')
            fprintf('[xRt,fRt,itrCnt,stat] = [%1.8f, %1.8f, %d, %d]', xRt, fRt, itrCnt, stat)

            % Run Prof Code
            cmdProf = sprintf('[xRt,fRt,itrCnt,stat] = %s_%s(%s,%1.4f,%1.4f,%1.8f,%d,%d);', ...
                    'Holder', program{solver}, testFunc{prob}, ...
                    s{solver,prob,tst}(1), s{solver,prob,tst}(2), s{solver,prob,tst}(3), ...
                    s{solver,prob,tst}(4), s{solver,prob,tst}(5));
            fprintf('\n\nRunning \n%s \n', cmdProf)
            eval(cmdProf);
            fprintf('\n Solution is \n')
            fprintf('[xRt,fRt,itrCnt,stat] = [%1.8f, %1.8f, %d, %d]', xRt, fRt, itrCnt, stat)
            
            fprintf('\n\nMake sure the returns reasonably match \n\n')
            fprintf('Pres any key to continue \n\n')
            fprintf('************************************\n\n')
            pause
         else
            cmdStud = sprintf('[xRt,fRt,itrCnt,stat] = %s_%s(%s,%s,%1.4f,%1.8f,%d,%d);', ...
                    lastName, program{solver}, testFunc{prob}, testFuncPrime{prob}, ...
                    s{solver,prob,tst}(1), s{solver,prob,tst}(2), ...
                    s{solver,prob,tst}(3), s{solver,prob,tst}(4));
            fprintf('Running \n%s \n', cmdStud)
            eval(cmdStud);
            fprintf('\nSolution is \n')
            fprintf('[xRt,fRt,itrCnt,stat] = [%1.8f, %1.8f, %d, %d]', xRt, fRt, itrCnt, stat)

            cmdProf = sprintf('[xRt,fRt,itrCnt,stat] = %s_%s(%s,%s,%1.4f,%1.8f,%d,%d);', ...
                    'Holder', program{solver}, testFunc{prob}, testFuncPrime{prob}, ...
                    s{solver,prob,tst}(1), s{solver,prob,tst}(2), ...
                    s{solver,prob,tst}(3), s{solver,prob,tst}(4));
            fprintf('Running \n%s \n', cmdProf)
            eval(cmdProf);
            fprintf('\nSolution is \n')
            fprintf('[xRt,fRt,itrCnt,stat] = [%1.8f, %1.8f, %d, %d]', xRt, fRt, itrCnt, stat)          

            fprintf('\n\nPres any key to continue \n\n')
            fprintf('************************************\n\n')
            pause
         end
      end
   end
end
