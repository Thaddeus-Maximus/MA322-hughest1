% Thaddeus Hughes
% I pledge this is my code

function [x, status] = Hughes_ConjugateGradient(Q, b, x, itrBnd, tol)
    r = b - Q*x;
    p = r;
    k = 0;
    r_mag = r'*r;
    status=1;
    
    % Iterate over everything, or a certain bound
    for i=1:min(length(b), itrBnd)
        Qp=Q*p; % Caching, also helps keeps order of ops easier
        alpha = r_mag/(p'*Qp);
        
        x = x + alpha*p;
        r = r - alpha*Qp;
        r_mag_new = r'*r;
        
        % Check if we can terminate early
        if sqrt(r_mag_new) < tol
            break;
        end
        beta = (r_mag_new)/(r_mag);
        p = r + beta*p;
        r_mag = r_mag_new;
    end
    if sqrt(r*r') <= tol
         status=0;
    end
end