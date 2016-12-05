% Thaddeus Hughes
% I pledge this is my code

% This is exercise 8

function [xstar,fxstar,nitr,status]= ...
Hughes_Newton(f,fp,x0,epsilon,maxitr,loud)
    nitr=0;   % Number of iterations
    status=1; % Assume failure
    while nitr<maxitr && status
      fprimex0 = feval(fp, x0);
      fx0 = feval(f, x0);
      
      % Handle case of zero derivative; move a little bit rightward to get
      % off the peak/trough
      if fprimex0==0
          x0=x0+epsilon;
      else
          x0=x0-fx0/fprimex0;
      end
      fx0 = feval(f, x0);
      
      if abs(fx0) < epsilon
          status=0;
      end
      
      if loud
        fprintf('Iter: %d Approximate solution: %.6f\n', nitr, x0)
      end
      nitr=nitr+1;
    end
    xstar = x0;
    fxstar = fx0;
end