function [xRoot, fRoot, itrCount, stat] = ...
         Holder_Bisection(fName, l, r, xTol, fTol, itrLimit, verbose)

% Make some initializations
Terminate = false;
itrCount = 0;
xRoot = NaN; % Default to an unkown root
fRoot = NaN; % Default is an unknown estimate at the root
stat = 1;    % Default is failure

%Get function values at end points
fLeft = feval(fName, l);
fRight = feval(fName, r);

% Check to make sure we have a change in sign
if (sign(fLeft) == sign(fRight)) && (sign(fLeft) ~= 0)
   fprintf('Error: function values agree in sign at interval end points\n')
   return;
else
   % Enter the search for the root
   while Terminate == false
      % print the state of the search if desired
      if verbose
         fprintf('Iteration %d: interval is [%f, %f]; best function value is %f\n', ...
              itrCount, l, r, min(abs(fLeft), abs(fRight)))
      end
      if abs(fLeft) < fTol
         % fprintf('root is %f with function value %f\n', l, fLeft)
         xRoot = l;
         fRoot = fLeft;
         stat = 0;
         Terminate = true;
      elseif abs(fRight) < fTol
         % fprintf('root is %f with function value %f\n', r, fRight)
         xRoot = r;
         fRoot = fRight;
         stat = 0;
         Terminate = true;
      elseif (abs(fLeft) >= fTol) && (abs(fRight) >= fTol)
         % Calculate midpoint
         xMid = (l+r)/2;
         fMid = feval(fName, xMid);
         % Check to see if the interval is sufficiently small to terminate
         if abs(r-l) < xTol
            % fprintf('root is %f with function value %f\n', xMid, fMid)
            xRoot = xMid;
            fRoot = fMid;
            stat = 0;
            Terminate = true;
         elseif abs(r-l) >= xTol
            % check to make sure another iteration is appropriate
            if itrCount >= itrLimit
               % fprintf('Reached iteration limit, returning best solution calculate\n')
               if abs(fLeft) < abs(fRight)
                  xRoot = l;
                  fRoot = fLeft;
                  Terminate = true;
               elseif abs(fLeft) >= abs(fRight)
                  xRoot = r;
                  fRoot = fRight;
                  Terminate = true;
               else
                  fprintf('Error: unable to compare function values\n')
                  return;
               end
            elseif itrCount < itrLimit
               itrCount = itrCount + 1;
               % Update interval
               if (sign(fMid) == sign(fLeft)) || (sign(fMid) == 0)
                  l = xMid;
                  fLeft = fMid;
               elseif (sign(fMid) == sign(fRight)) && (sign(fMid) ~= 0)
                  r = xMid;
                  fRight = fMid;
               else
                  fprintf('Error: Unable to idenfity change in sign at end points\n')
                  return;
               end
            else
               fprintf('Error: itrCount does not compare with the iteration limit.\n')
               return;
            end
         else
            fprintf('Error: Unable to idenfity interval width\n')
         end
      else
         fprintf('Error: Unable to compare to function tolorance\n')
         return;
      end
   end % while search loop
end
