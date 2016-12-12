lastName='Hughes';

more off;
numTests = 10000;
tol = 10^-6;
errs=0;

for t = 1:numTests
   fprintf('\n\n#####  New Random Test #####\n\n')

   randNumRows = round(3*rand(1) + 3);
   randNumCols = round(3*rand(1) + 3);
   fprintf('A randomly generated matrix\n')
   randA = round(10*rand(randNumRows, randNumCols))

   cmd1 = sprintf('[L1,U1,p1] = %s_lu(randA)', lastName);
   cmd2 = sprintf('[L2,U2,p2] = Holder_lu(randA)');
   cmd3 = sprintf('[L3,U3,p3] = lu(randA)');

   fprintf('\n\nMy code run as:%s\n\nReturns:\n',cmd2)
   eval(cmd2);
   fprintf('\n\nYour code run as:%s\n\nReturns:\n',cmd1)
   eval(cmd1);
   
   fprintf('\n\nMatlab''s code run as:%s\n\nReturns:\n',cmd3)
   eval(cmd3);
   fprintf('Convert to the permuation matrix to a permutation vector\n')
   p3 = [p3*[1:length(p3)]']'
   
   U1
   U2
   tstSum1 = norm(L1*U1 - randA(p1,:)) + norm(triu(L1,1)) + norm(tril(U1,-1));
   
   tstSum2 = norm(L2*U2 - randA(p2,:)) + norm(triu(L2,1)) + norm(tril(U2,-1));
   tstSum3 = norm(L3*U3 - randA(p3,:)) + norm(triu(L3,1)) + norm(tril(U3,-1));

   if tstSum1 < tol
      fprintf('Your code correctly factors A\n\n')
      
   else
      fprintf('Your code failed to factor A\n\n')
      errs=errs+1;
      pause
   end

   if tstSum2 < tol
      fprintf('My code correctly factors A\n\n')
   else 
      fprintf('My code failed to factor A\n\n')
   end

   if tstSum3 < tol
      fprintf('Matlab''s code correctly factors A\n\n')
   else 
      fprintf('Matlab''s code failed to factor A\n\n')
   end

%    fprintf('\n Press a key to continue \n\n')
%    pause

end

errs
