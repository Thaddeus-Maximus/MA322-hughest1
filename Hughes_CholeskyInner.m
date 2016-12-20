% Thaddeus Hughes
% I pledge this is my code

function [L,s] = Hughes_CholeskyInner(A)
    tol = 1e-8;
    [m n] = size(A);
    L=zeros(m,m);
    if m~=n
        L=NaN;
        s=1;
        return
    end
    for i=1:m
        for j=1:i
            if j == i
                inRoot = A(i,i)-sum(L(i,1:j-1).^2);
                if inRoot < 0
                    L=NaN;
                    s=1;
                    return
                end
                L(i,i)= sqrt(inRoot);
            else
                if L(j,j) == 0
                    L=NaN;
                    s=1;
                    return
                end
                L(i,j) = (A(i,j)-L(i,1:j-1)*L(j,1:j-1)'  )/L(j,j);
            end
        end
    end
    s=0;
end