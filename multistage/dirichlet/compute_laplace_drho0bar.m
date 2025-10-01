function [val, res] = compute_laplace_drho0bar(D, f, k_01, mu_0, N, ...
                                              Vnmat, Vninvmat, Vcmat, Vcinvmat, ...
                                              lambda_n_vec, lambda_c_vec, tol)



%% Compute the conditional moment of binding flux using truncated series representation

%% Inputs:
% kappa : Robin BC coefficient (\partial_n u + kappa u = 0 at r=1)
% f : fraction of cAPC to nAPC binding rates
% k_01 : binding rate with cAPC (first stage)
% p : forward transition rat
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

while abs(res) > tol
    
    n = n + 1 ;

    % Spatial ev
    nu = n*pi*sqrt(D) ;

    % An
    An = nu^2 + mu_0 + (1 + f)*k_01 ;
    
    % Khat
    Khat = 0 ;
    for j = 1:N
        Khat = Khat - k_01*Vnmat(1,j)*Vninvmat(j,1)/lambda_n_vec(j) ;
    end
    for j = 1:N-1
        Khat = Khat - f*k_01*Vcmat(1,j)*Vcinvmat(j,1)/lambda_c_vec(j) ;
    end        

    % dKhat
    dKhat = 0 ;
    for j = 1:N
        dKhat = dKhat - k_01*Vnmat(1,j)*Vninvmat(j,1)/lambda_n_vec(j)^2 ;
    end
    for j = 1:N-1
        dKhat = dKhat - f*k_01*Vcmat(1,j)*Vcinvmat(j,1)/lambda_c_vec(j)^2 ;
    end     

    % dThat
    dThat = (dKhat - 1)/(An - Khat)^2 ;

    % Spatial component sn
    sn = 2*(-1)^(n+1) ;

    % Update
    res = sn*dThat ;
    val = val + res ;
   

end

    


end