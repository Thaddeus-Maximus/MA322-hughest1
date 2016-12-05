% Thaddeus Hughes
% I pledge this is my code

% This is an in-class note

function [xstar,fxstar,nitr,status]= ...
Bisection(f,a,b,epsilon,maxitr,loud)
    nitr=0;   % Number of iterations
    status=1; % Assume failure
    while nitr<maxitr && status % Run while still failed and under max iterations
      % Cache function values (because efficiencies)
      fa=feval(f,a);
      fb=feval(f,b);
      
      if fa*fb > 0
        status=3;
        fprintf('Error: signs agree at endpoints\n');
        return;
      elseif fa*fb == 0
      
      elseif fa*fb < 0
      
      else
        status=2;
        return;
      end
      
      if abs(fb-fa)<epsilon
          status=0;
      end
      
      if loud
          fprintf('Iteration %d: interval is [%.6f, %.6f]; best function value is %.6f\n', nitr, a, b, fa)
      end
      
      nitr=nitr+1;
      
    end
    xstar = a;
    fxstar = feval(f,a);
end