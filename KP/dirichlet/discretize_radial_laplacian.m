%% Discretize spherical Laplacian with Dirichlet BC

function [Lmat, D1mat, D2mat] = discretize_radial_laplacian(rvec)

% Inputs:
% - rvec  : grid points in radial direction
% - alpha : \partial_n u + \alpha u = 0 (Robin BC)
% Ouputs:
% - Lmat  : discrete spherical laplacian matrix 

N = length(rvec) ; % number of grid points in radial direction
dr = rvec(2) - rvec(1) ; % mesh size

%% Second derivative matrix (d^2/dr^2)

evec  = ones(N,1) ;
D2mat = (1/dr^2) * spdiags([evec -2*evec evec], -1:1, N, N) ;
D2mat(1,2) = 2/dr^2 ;   % Neumann BC 
D2mat(1,:) = 3*D2mat(1,:) ; % Triple due to limit of first derivative at origin
D2mat(N,N-1) = 0 ; % 
D2mat(N,N) = 0  ;


%% First derivative matrix (d/dr)

D1mat = (1/(2*dr)) * spdiags([-evec evec], [-1 1], N, N) ;
D1mat(1,2) = 0 ; % Approximate first derivature at origin by second derivative (see line 22)
D1mat(N,N-1) = -1/dr ; 
D1mat(N,N) = 0 ; 

% v = evec./[1; rvec(2:end)] ;
% v1 = [v(2:end); v(end)] ; v2 = [v(1); v(1:end-1)] ;
% D1 = spdiags([-v1 v2], [-1 1], N, N) ; 
% D1(1,2) = 0 ; % first derivative at origin goes to second derivative, see line 20
% D1(N,N-1) = 0 ; % Nuemann BC
% D1 = (1/(2*dr))*D1 ;


%% Radial laplacian matrix

Lmat = D2mat + spdiags(2./[1;rvec(2:end)], 0, N, N)*D1mat ;


end