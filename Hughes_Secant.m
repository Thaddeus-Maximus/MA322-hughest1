% Thaddeus Hughes
% I pledge this is my code

% This is exercise 7

function [xstar,fxstar,nitr,status]= ...
Hughes_Secant(f,a,b,epsilon,maxitr,loud)
    nitr=0;   % Number of iterations
    status=1; % Assume failure
    while nitr<=maxitr && status
      % Cache function values (because efficiencies)
      fa=feval(f,a);
      fb=feval(f,b);
      if (fb==fa)
        c = c + epsilon;
      else
        c = a - (b-a)/(fb-fa)*fa;
      end
      fc = feval(f,c);
      
      if min(abs([fb,fa]))<epsilon
          status=0;
      end
      
      if loud
        fprintf('Iteration %d: interval is [%.6f, %.6f]; best function value is %.6f\n', nitr, a, b, fc)
      end
      
      nitr=nitr+1;
      
      a=b;
      b=c;
    end
    sols=[a,b,(a+b)/2];
    fsols=[];
    for i=1:3
        fsols(i)=feval(f, sols(i));
    end
    [dummy, istar]=min(abs(fsols));
    fxstar = fsols(istar);
    xstar = sols(istar);
end