function [x,status]=Hughes_Backsolve(L,U,p,b)
    status=0;
    
%     if size(U,1) > size(U,2)
%         status=2;
%         x=NaN
%         return;
%     end
    %2 inconsistent
    %1 consistent infinite sols 
    y=zeros(size(L,1),1);
    for i = 1:size(L,1)
        y(i)=(b(p(i)) - L(i,1:i-1)*y(1:i-1))/L(i,i);
    end
    
    y
    
    if size(U,2)>size(U,1)
        status=1;
    end
    if size(U,1)>size(U,2) && sum(abs(y(size(U,2)+1:end))) >1e-8
        status=2;
        x=NaN;
        return;
    end    
    
    x=zeros(size(U,2),1);
    for i = min(size(U)):-1:1
        j=i;
        while j<size(U,2) && U(i,j)==0
            x(j)=0;
            status=1;
            j=j+1;
        end
        if U(i,j)~=0
            x(j)=(y(i) - U(i,j+1:end)*x(j+1:end))/U(i,j);
        else
            x(j)=0;
            status=1;
        end
    end