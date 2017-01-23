% Thaddeus Hughes
% I pledge this is my own code

function [a,Rsqr,pVal,yHat,cInt,pInt] = Hughes_linearRegression(X,y,V,conf)
    % X is m by n; Xij has ith sample of jth regressor
    % y is column vector; yi is ith sample of response
    % V is optional q by n
    % conf is optional q by 1
    
    % Outputs
    % row vector a of coefficients
    % R squared value
    % vector of p values for model parameters
    % vector of model predictions yHat
    % vector to construct confidence intervals
    % vector to construct prediction intervals

     n=size(X,2)
     l=size(X,1)
        
    Q=ones(l,n+1);
    Q(:,2:n+1)=X;
    a = (Q'*Q)\(Q'*y);
    
    Rsqr=0;
    
    ybar = sum(y)/l;
    Xbar = sum(X)/l;
    SStot = sum((y-ybar).^2);
    SSres = 0;
    for i=1:l
        f = a(1) + X(i,:)*a(2:n+1);
        SSres = SSres + (y(i)-f)^2;
    end
    Rsqr = 1- SSres/SStot;
    
    pVal=0;
    yHat=0;
    cInt=0;
    pInt=0;