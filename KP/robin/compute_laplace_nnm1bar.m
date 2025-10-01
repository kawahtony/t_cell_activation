function [val, res] = compute_laplace_nnm1bar(D, kappa, f, k_01, p, mu_0, r, N, nuset, tol) 



%% Inputs:
% kappa : Robin BC coefficient (\partial_n u + kappa u = 0 at r=1)
% f : fraction of cAPC to nAPC binding rates
% k_01 : binding rate with cAPC (first stage)
% p : forward transition rate
% N : number of binding stages 
% Vcmat, Vcinvmat : eigenvector matrix of eigen-decomposition of kinetic
% matrix with cAPC
% lambda_c_vec : vector of eigenvalues of kinetic matrix with cAPC
% nuset : a finite subset of eigenvalue in ascending order
% betamat, zmat : partial fraction decomposition of Tn (time componenet in
% separation of variable solution)
% m : moment
% tol : truncate series when a term is less than tol (in magnitude)


%% Truncated series solution for Jbind


% Initialization
n = 0 ; 
res = 1 ; 
val = 0 ;



K = k_01*(1 - (p/(1+p))^(N-1)) + f*k_01*(1 - (p/(r+p))^(N-1)) ;


while abs(res) > tol
    
    n = n + 1 ;

    % Extract nu
    nu = nuset(n) ;

    % An
    An = nu^2 + mu_0 + (1 + f)*k_01 ;
           
    % Spatial component sn
    alpha = nu/sqrt(D) ;
    sn = kappa*sin(alpha)/pi/(2*alpha - sin(2*alpha)) ;

    % Temporal component Tn
    Tn = 1/(An - K) ;
    
    % Update
    res = sn * Tn ;
    val = val + res ;
   

end

% Total density of (laplace transformed) rho
val = 4*pi*val ;

% Total density of (laplace transformed) c_{N-1}
val = k_01*p^(N-2)/(1+p)^(N-1) * val ;


end