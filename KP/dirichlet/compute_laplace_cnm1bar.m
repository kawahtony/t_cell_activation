function [val, res] = compute_laplace_cnm1bar(D, f, k_01, p, mu_0, lambda, N, tol) 


%% Compute the conditional moment of binding flux using truncated series representation

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


% Compute laplace transform of kernel at s = 0
K = k_01*(1 - (p/(1+p))^(N-1)) + f*k_01*(1 - (p/(lambda+p))^(N-1)) ;


while abs(res) > tol
    
    n = n + 1 ;

    % Spatial ev
    nu = n*pi*sqrt(D) ;

    % An
    An = nu^2 + mu_0 + (1 + f)*k_01 ;
           
    % Spatial component sn
    sn = 2*(-1)^(n+1) ;

    % Temporal component Tn
    Tn = 1/(An - K) ;
    
    % Update
    res = sn * Tn ;
    val = val + res ;
   

end


% Total density of c_{N-1}
val = f*k_01 * p^(N-2)/(lambda+p)^(N-1) * val ;


end