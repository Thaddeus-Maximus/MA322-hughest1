% Thaddeus Hughes
% I pledge this is my code

function [x,nrmfx,numitr,status]=NewtonSys(f,df,x0,epsilon,maxiter)
    
    x=x0;
    numitr=0;
    
    fx = feval(f,x);
    dfx = feval(df,x);
    nrmfx=norm(fx);
    
    while nrmfx>epsilon
        fx = feval(f,x);
        dfx = feval(df,x);
        deltaX=dfx\fx;
        nrmfx=norm(fx);
        
        x=x-deltaX;
        
        numitr=numitr+1;
        if numitr>maxiter
            status=1;
            return
        end
    end
        
    
    status=0;
    
end