% Thaddeus Hughes
% I pledge this is my code

% This is exercise 6

function [xstar,fxstar,nitr,status]= ...
Interpolation(f,a,b,epsilon,maxitr,loud)
    nitr=0;   % Number of iterations
    status=1; % Assume failure
    while nitr<maxitr && status % Run while still failed and under max iterations
      % Cache function values (because efficiencies)
      fa=feval(f,a);
      fb=feval(f,b);
      
      if (fb==fa)
        c = c + epsilon;
      else
        c = a-(a-b)/(fa-fb)*fa;
      end
      fc = feval(f,c);
      if fc > 0
        b=c;
      elseif fc < 0
        a=c;
      else
        status=0;
      end
      
      if abs(fb-fa)<epsilon
          status=0;
      end
      
      if loud
          fprintf('Iteration %d: interval is [%.6f, %.6f]; best function value is %.6f\n', nitr, a, b, fc)
      end
      
      nitr=nitr+1;
      
    end
    xstar = a;
    fxstar = feval(f,a);
end