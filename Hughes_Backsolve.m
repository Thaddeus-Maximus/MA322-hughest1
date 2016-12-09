function [x,status]=Hughes_Backsolve(L,U,p,b)
  y = zeros(size(L, 1), 1)
  for i=1:size(L,1)
      if(i>1)
        leftover =L(i,1:i-1)*y(i-1);
      else
        leftover=0;
      end
      leftover
      y(i)=b(i)-leftover;
  end
  y