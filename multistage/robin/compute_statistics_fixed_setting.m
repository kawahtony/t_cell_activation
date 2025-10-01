

% Clean up
clear ; close all ; % clc ;


%% Number of stages

N = 4 ; M = N ;


%% Dimensional quantitites

K_10 = 1/3 ; 


%% Nondimensional parameters

D = 1.8e-4 ;
mu_0 = 1/240 ;
f = 5e-3 ;
k_01 = 1 ; 
p = 5 ;
q = 10 ; 
kappa = 0 ;


%% Kinetic matrix

% Kinetic matrix with nAPC
ovec = ones(N,1) ; 
Mnmat = spdiags([p*ovec, -(p + q)*ovec, q*ovec], -1:1, N, N) ;
Mnmat(1,1) = -(p + 1) ;
Mnmat(N,N) = -q ; 

% Kinetic matrix with cAPC
ovec = ones(M-1,1) ; 
Mcmat = spdiags([p*ovec, -(p + q)*ovec, q*ovec], -1:1, M-1, M-1) ;
Mcmat(1,1) = -(p + 1) ;

% Eigen-decomposition of kinetic matrices
[Vnmat, temp1] = eig(full(Mnmat)) ; Vninvmat = inv(Vnmat) ;
lambda_n_vec = diag(temp1) ;
[Vcmat, temp1] = eig(full(Mcmat)) ; Vcinvmat = inv(Vcmat) ;
lambda_c_vec = diag(temp1) ;


%% Solve for nu

max_nu_num = 100000 ;
opts = optimoptions('fsolve', 'Display', 'off') ;
fun = @(nu) (kappa - 1).*sin(nu/sqrt(D))./nu + cos(nu/sqrt(D))/sqrt(D) ;

nu0set = sqrt(D)*pi * [0.01, 1:100 , (0:max_nu_num) + 0.5']'  ;
nuset = zeros(size(nu0set)) ;

for k = 1:length(nu0set)
    nuset(k) = fsolve(fun, nu0set(k), opts) ;   
end

% Make sure nu's are unique!
nuset = uniquetol(nuset, 1e-6) ;

% Make sure nu's are positive!
nuset = nuset(nuset > 0) ;


%% Compute statistics

[P_bind, tau_bind, sig_bind] = compute_stat(D, kappa, mu_0, f, k_01, p, N, ...
                                            Vnmat, Vninvmat, Vcmat, Vcinvmat, ...
                                            lambda_n_vec, lambda_c_vec, nuset) ;


disp(['Binding probability = ', num2str(P_bind)])

disp(['Mean binding time = ', num2str(tau_bind)])

disp(['SD of binding time = ', num2str(sig_bind)])