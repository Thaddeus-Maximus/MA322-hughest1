% Thaddeus Hughes
% I pledge this is my own code

function [z] = Hughes_LagrangePoly(x,y,v)
x=x(:);
y=y(:);
v=v(:);

n = length(x) - 1;
ni = length(v);
L = ones(ni,n+1);

for j = 1:n+1
    for i = 1:n+1
          if i~=j
               L(:,j) = L(:,j).*(v - x(i))/(x(j)-x(i));
          end 
     end 
end
 
z = L*y;

% plot(x,y,'o');
% hold on
% plot(v,z);