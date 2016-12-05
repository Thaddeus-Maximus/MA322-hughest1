% Thaddeus Hughes
% I pledge this is my code

% This is exercise 6

function [xstar,fxstar,nitr,status]= ...
Hughes_Interpolation(f,a,b,epsilon,maxitr,loud)
    nitr=0;   % Number of iterations
    status=1; % Assume failure
    while status % Run while still failed and under max iterations
      % Cache function values (because efficiencies)
      fa=feval(f,a);
      fb=feval(f,b);
      
      if (fb==fa)
        c = c + epsilon;
      else
        c = a-(a-b)/(fa-fb)*fa;
      end
      fc = feval(f,c);
      
      if fa*fb>0
          fprintf('Error: function values are same sign at interval endpoints');
          status=3;
          xstar=NaN;
          fxstar=NaN;
          return;
      elseif fc==0
          status=0;
      elseif fa*fc < 0
          b=c;
          fb=fc;
      elseif fb*fc < 0
          a=c;
          fa=fc;
      else
          
      end
      
      if abs(fb-fa)<epsilon
          status=0;
      end
      
      if loud
          fprintf('Iteration %d: interval is [%.6f, %.6f]; best function value is %.6f\n', nitr, a, b, fc);
      end
      
      nitr=nitr+1;
      
      if nitr>=maxitr
          fprintf('Reached iteration limit');
          status=2;
          break
      end
      
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