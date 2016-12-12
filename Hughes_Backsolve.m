function [x,status]=Hughes_Backsolve(L,U,p,b)
    status=0;
    %2 inconsistent
    %1 consistent infinite sols
    y=zeros(size(U,2),1);
    for i = 1:size(L,1)
        y(i)=(b(p(i)) - L(i,1:i-1)*y(1:i-1))/L(i,i);
    end
    
    x=zeros(size(U,2),1);
    for i = size(U,2):-1:1
        x(i)=(y(i) - U(i,i+1:end)*x(i+1:end))/U(i,i);
    end