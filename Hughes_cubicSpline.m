% Thaddeus Hughes
% I pledge this is my code

function [z]=Hughes_cubicSpline(x,y,v)

% Set data to column vector
x=x(:);
y=y(:);
% Set vector to evaluate spline over to column vector
v=v(:);


% Initial plot
% plot(x,y,'o');

% Number of datapoints
n=size(x,1);

% Deltas in x and y directions
delx = x(2:end)-x(1:end-1)
dely = y(2:end)-y(1:end-1)

% Formulate matrix to solve
A(1,1)=2*(delx(1+1) + delx(1));
for i=2:n-2
    A(i,i)=2*(delx(i+1) + delx(i));
    A(i-1,i)= delx(i);
    A(i,i-1)=A(i-1,i);
end

% Create vector to solve with
for i=2:n-1
    y2(i-1,1)=-6*( dely(i-1)/(delx(i-1)) - dely(i)/(delx(i)));
end

% Solution vector. Pad with zeroes
s=zeros(n,1);
s(2:end-1)=A\y2
s(end)=0;

% Pull out polynomial constants from solution vector
a=y
b=dely./delx - delx.*(s(2:end)+2*s(1:end-1))/6
c=s(1:end-1)/2
d=(s(2:end)-s(1:end-1))/6./delx

% Evaluate polynomial over v
nv=size(v,1);
z=NaN(nv,1);
for section=1:n-1
    
    % Select datapoints that are valid for this range.
%     if (section == 1)
%         k = find(v<=x(section+1));
%     elseif (section == n-1)
%         k = find(x(section)<=v);
%     else
        k = find(x(section)<=v & v<=x(section+1));
%     end
    thisv = v(k)';
        
    % Actually evaluate polynomial in this range
    z(k) = a(section) + b(section)*(thisv-x(section))+c(section)*(thisv-x(section)).^2 + d(section)*(thisv-x(section)).^3;
end

% Final plot
%hold on
%plot(v,z)