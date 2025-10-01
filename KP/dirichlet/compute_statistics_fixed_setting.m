
clear ; close all ; % clc 

%% Number of stages

N = 10 ; M = N ;


%% Nondimensional parameters

mu_0 = 1/240 ;
f = 1e-1 ; 
k_01 = 1 ; 
p = 0.5 ;
r = 0.3 ;

D = 1.8e-3 ;


%% Compute statistics


tol = 1e-10 ;

cnm1bar = compute_laplace_cnm1bar(D, f, k_01, p, mu_0, r, N, tol) ;

P_bind_c = p * cnm1bar ;


dcnm1bar = compute_laplace_dcnm1bar(D, f, k_01, p, mu_0, r, N, tol) ;
tau_bind_c = -dcnm1bar / cnm1bar ;



disp(['Binding probability = ', num2str(P_bind_c)]) 

disp(['Mean binding time = ', num2str(tau_bind_c)])

% disp(['SD of binding time = ', num2str(sig_bind_c)])