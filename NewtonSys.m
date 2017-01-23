function [x,nrmfx,numitr,status]=NewtonSys(f,df,x0,epsilon,maxiter)
    
    x=x0;
    numitr=0;
    nrmfx=epsilon*2;
    while nrmfx>epsilon;
        fx = feval(f,x);
        dfx = feval(df,x);
        deltaX=-fx/dfx;
        x=deltaX-x;
        numitr=numitr+1;
    end
        
    
    status=0;
    
end