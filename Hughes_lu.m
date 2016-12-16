% Thaddeus Hughes
% I pledge this is my code


function [L,U,P] = Hughes_lu(A)
% Matrix size
[n, n1]=size(A);

% Defaults for L and U
L=eye(n);
P=1:n;
U=A;
for j = 1:1:min(n,n1)
  % Grab index to swap at
  [~, m]=max(abs(U(j:n, j)));     
  m = m + j-1;
  % If row to swap at isn't the end
  if m ~= j
    % Upper matrix row swaps
    U([m,j],:) =  U([j,m], :);
    % Permutation vector swap
    P([m,j]) =  P([j,m]);
    % After first round, start swapping in the lower matrix
    if j > 1;
      L([m,j],1:j-1) =  L([j,m], 1:j-1);
    end;
  end
  for i = j+1:n 
    % Avoid divide by zero errors
    if U(j,j)~=0
        L(i, j)= U(i, j) / U(j, j);
        U(i, :)=  U(i, :) - L(i, j)*U(j, :);
    end
  end
end