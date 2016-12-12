lastName='Hughes'

tol = 10^-2;
numTests = 5000;
errs=0;

for tst = 1:numTests
   statType = round(3*rand(1)-0.5);
   fprintf('\n\n#####  New Random Test #####\n\n')
   if statType == 0
      fprintf('Generating a feasible problem with a unique solution.\n')
      randNumCols = round(3*rand(1) + 3);
      randNumRows = randNumCols + round(3*rand(1));
      randA = round(10*rand(randNumRows, randNumCols));
      randSol = round(4*rand(randNumCols,1)-2);
      b = randA*randSol
      [L,U,p] = Holder_lu(randA)
      b
   
      cmd1 = sprintf('[x1,s1] = %s_Backsolve(L,U,p,b)', lastName);
      cmd2 = sprintf('[x2,s2] = Holder_Backsolve(L,U,p,b)');
   
      fprintf('\n\nYour code run as: \n%s\n\nReturns:\n',cmd1)
      eval(cmd1);
      fprintf('\n\nMy code run as: \n%s\n\nReturns:\n',cmd2)
      eval(cmd2);
   
      tstSum1 = norm(x1 - randSol) + norm(randA*x1 - b);
      tstSum2 = norm(x2 - randSol) + norm(randA*x2 - b);
   
      if tstSum1 < tol
         fprintf('Your code correctly solved LUx = b\n\n')
      else
         fprintf('Your code failed to solve LUx = b\n\n')
         errs=errs+1;
         fprintf('\n Press a key to continue \n\n')
         pause
      end
   
      if tstSum2 < tol
         fprintf('My code correctly solved LUx = b\n\n')
      else
         fprintf('My code failed to solve LUx = b\n\n')
      end
   
      
   elseif statType == 1
      fprintf('Generating a feasible problem with an infinite number of solutions.\n')
      randNumRows = round(3*rand(1) + 3); 
      randNumCols = randNumRows + round(3*rand(1)+1);
      randA = round(10*rand(randNumRows, randNumCols));
      randSol = round(4*rand(randNumCols,1)-2);
      b = randA*randSol
      [L,U,p] = Holder_lu(randA)
   
      cmd1 = sprintf('[x1,s1] = %s_Backsolve(L,U,p,b)', lastName);
      cmd2 = sprintf('[x2,s2] = Holder_Backsolve(L,U,p,b)');
   
      fprintf('\n\nYour code run as: \n%s\n\nReturns:\n',cmd1);
      eval(cmd1);
      fprintf('\n\nMy code run as: \n%s\n\nReturns:\n',cmd2);
      eval(cmd2);
   
      tstSum1 = norm(randA*x1 - b);
      tstSum2 = norm(randA*x2 - b);
   
      if tstSum1 < tol
         fprintf('Your code correctly solved LUx = b\n\n')
      else
         fprintf('Your code failed to solve LUx = b\n\n')
         errs=errs+1;
         fprintf('\n Press a key to continue \n\n')
         pause
      end
      
      if tstSum2 < tol
         fprintf('My code correctly solved LUx = b\n\n')
      else
         fprintf('My code failed to solve LUx = b\n\n')
      end
   
   elseif statType == 2
      fprintf('Generating an infeasible problem.\n')
      randNumCols = round(3*rand(1) + 3); 
      randNumRows = randNumCols;
      randA = round(10*rand(randNumRows, randNumCols));
      linComb = round(4*rand(2,randNumCols)-2);
      A = [randA; linComb*randA]
      b = [randA*ones(randNumCols,1); 2+linComb*randA*ones(randNumCols,1)]
      [L,U,p] = Holder_lu(A)
   
      cmd1 = sprintf('[x1,s1] = %s_Backsolve(L,U,p,b)', lastName);
      cmd2 = sprintf('[x2,s2] = Holder_Backsolve(L,U,p,b)');
   
      fprintf('\n\nYour code run as: \n%s\n\nReturns:\n',cmd1);
      eval(cmd1);
      fprintf('\n\nMy code run as: \n%s\n\nReturns:\n',cmd2);
      eval(cmd2);
   
      if s1 == 2
         fprintf('Your code correctly identified the inconsistency of LUx = b\n\n')
      else
         fprintf('Your code failed to identified the inconsistency of LUx = b\n\n')
         errs=errs+1;
         fprintf('\n Press a key to continue \n\n')
         pause
      end
   
      if s2 == 2
         fprintf('My code correctly identified the inconsistency of LUx = b\n\n')
      else
         fprintf('My code failed to identified the inconsistency of LUx = b\n\n')
      end
   
   end

   %fprintf('\n Press a key to continue \n\n')
   %pause

end

fprintf('%d errors.\n', errs);
