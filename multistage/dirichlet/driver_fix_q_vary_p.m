% - Fix f, k_01
% - Fix q and vary p

% Clean up
clear ; clc ; close all ;


%% Nondimensional parameters

D = 1.8e-3 ;
mu_0 = 1/240 ; 
f = 5e-3 ;
k_01 = 1 ; 
q = 10 ;


%% Loop 

Nset = (2:6)' ;
pset = linspace(0.1, 10, 100)' ;
P_bind_set = zeros(size(pset)) ;
tau_bind_set = zeros(size(pset)) ;
sig_bind_set = zeros(size(pset)) ;

for i = 1:length(Nset)
    N = Nset(i) ; M = N ;     
    for j = 1:length(pset)
        % Extract p 
        p = pset(j) ;    
        % Kinetic matrix With APC
        ovec = ones(N,1) ;
        Mnmat = full(spdiags([p*ovec, -(p + q)*ovec, q*ovec], -1:1, N, N)) ;
        Mnmat(1,1) = -(p + 1) ;
        Mnmat(N,N) = -q ;    
        % Kinetic matrix With cAPC
        ovec = ones(M-1,1) ; 
        Mcmat = full(spdiags([p*ovec, -(p + q)*ovec, q*ovec], -1:1, M-1, M-1)) ;
        Mcmat(1,1) = -(p + 1) ;
        % Eigen-decomposition of kinetic matrices
        [Vnmat, temp1] = eig(full(Mnmat)) ; Vninvmat = inv(Vnmat) ;
        lambda_n_vec = diag(temp1) ;
        [Vcmat, temp1] = eig(full(Mcmat)) ; Vcinvmat = inv(Vcmat) ;
        lambda_c_vec = diag(temp1) ;
        % Compute stats
        [P_bind, tau_bind, sig_bind] = ...
            compute_stat(D, mu_0, f, k_01, p, N, Vnmat, Vninvmat, Vcmat, Vcinvmat, ...
                         lambda_n_vec, lambda_c_vec) ;
        % Save
        P_bind_set(j) = P_bind ; 
        tau_bind_set(j) = tau_bind ; 
        sig_bind_set(j) = sig_bind ;
        disp([num2str(j), '/', num2str(length(pset))])
    
    end
    filename = ['D=', num2str(D), '/N=', num2str(N), '/q=', num2str(q), '.mat'] ;
    save(filename, 'pset', 'P_bind_set', 'tau_bind_set', 'sig_bind_set')
end
