

% Clean up
clear ; %close all ; % clc ; 



%% Number of stages

N = 6 ; M = N ; 


%% Nondimensional parameters

mu_0 = 1/240 ;
f = 5e-3 ;
k_01 = 1 ; 

p = 10 ;
q = 1 ; 


%% Kinetic matrix

Mmat = zeros(N+M, N+M) ;
Mmat(1,1) = -(mu_0 + (1 + f)*k_01) ;
Mmat(1,2) = 1 ; 
Mmat(1,N+2) = 1 ; 
Mmat(2,1) = k_01 ;
Mmat(N+2,1) = f*k_01 ; 

% Kinetic matrix with nAPC
ovec = ones(N,1) ; 
Mnmat = spdiags([p*ovec, -(p + q)*ovec, q*ovec], -1:1, N, N) ;
Mnmat(1,1) = -(p + 1) ;
Mnmat(N,N) = -q ; 
Mmat(2:N+1,2:N+1) = Mnmat ;

% Kinetic matrix with cAPC
ovec = ones(M-1,1) ; 
Mcmat = spdiags([p*ovec, -(p + q)*ovec, q*ovec], -1:1, M-1, M-1) ;
Mcmat(1,1) = -(p + 1) ;
Mmat(N+2:N+M,N+2:N+M) = Mcmat ;


%%

% Compute stats
[P_bind, tau_bind, sig_bind] = compute_stat(N, M , p, Mmat) ;

disp(['Binding probability = ', num2str(P_bind)])

disp(['Mean binding time = ', num2str(tau_bind)])

disp(['SD of binding time = ', num2str(sig_bind)])
