clc
clear all
lastName = 'Hughes'

more off;
numTests = 12;
tol = 10^-6;

for t = 1:numTests
   fprintf('\n\n#####  New Random Test #####\n\n')

   randNumRows = round(5*rand(1) + 3);
   randA = round(20*rand(randNumRows) - 10);

   if mod(t,4) == 0
      fprintf('This random matrix is positive definite\n\n')
      % an easy way to get a positive definite matrix
      randA = randA'*randA  
   elseif mod(t,4) == 1
      fprintf('This random matrix is positive definite\n\n')
      % another easy way to get a positive definite matrix
      randA = randA + randA';
      randA = randA + max(sum(abs(randA)))*eye(randNumRows)+1
   elseif mod(t,4) == 2
      fprintf('This random matrix is not square\n\n')
      % send a nonsquare matrix
      randA = [randA randA]
   else mod(t,4) == 3
      fprintf('This random matrix''s status is unknown\n\n')
      % send the original random matrix
      randA = randA % which is a bit silly
   end

   cmd1 = sprintf('[L1,s1] = %s_CholeskyInner(randA)', lastName);
   cmd2 = sprintf('[L2,s2] = Holder_CholeskyInner(randA)');
   cmd3 = sprintf('[L3,s3] = chol(randA, ''lower'')');

   fprintf('\n\nYour code run as:%s\n\nReturns:\n',cmd1)
   eval(cmd1);
   fprintf('\n\nMy code run as:%s\n\nReturns:\n',cmd2)
   eval(cmd2);
   if mod(t,4) ~= 2
      fprintf('\n\nMatlab''s code run as:%s\n\nReturns:\n',cmd3)
      eval(cmd3);
   else
      fprintf('\n\nMatlab''s chol command won''t receive non-square matrices\n')
      s3 = 1; % assume matlab failed
   end

   fprintf('\n\n')

   if ~s1 && norm(L1*L1' - randA) + norm(triu(L1,1)) < tol
      fprintf('Your code correctly factors randA\n\n')
   elseif ~s1 && norm(L1*L1' - randA) + norm(triu(L1,1)) >= tol
      fprintf('Your code failed to factor randA although status indicates it did\n\n')
   else
      fprintf('Your status indicates that randA is not postive definite\n\n')
   end

   if ~s2 && norm(L2*L2' - randA) + norm(triu(L2,1)) < tol
      fprintf('My code correctly factors randA\n\n')
   elseif ~s1 && norm(L1*L1' - randA) + norm(triu(L1,1)) >= tol
      fprintf('My code failed to factor randA although status indicates it did\n\n')
   else
      fprintf('My status indicates that randA is not postive definite\n\n')
   end

   if ~s3 && norm(L3*L3' - randA) + norm(triu(L3,1)) < tol
      fprintf('Matlab''s code correctly factors randA\n\n')
   elseif ~s1 && norm(L1*L1' - randA) + norm(triu(L1,1)) >= tol
      fprintf('Matlab''s code failed to factor randA although status indicates it did\n\n')
   else
      fprintf('Matlab''s status indicates that randA is not postive definite\n\n')
   end

   fprintf('\n Press a key to continue \n\n')
   pause

end
