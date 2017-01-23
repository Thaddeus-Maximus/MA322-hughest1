% Thaddeus Hughes
% I pledge this is my code

function [alpha,status]=Hughes_leastSquares(x,y,n)
    x=x(:);
    y=y(:);
    l=size(x,1);
    Q=ones(l,n+1);
    for i=0:n
        Q(:,i+1)=x.^i;
    end
    Q
    alpha = (Q'*Q)\(Q'*y);
    status=1;
end