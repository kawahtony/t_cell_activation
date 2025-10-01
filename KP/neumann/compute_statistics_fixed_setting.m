
clear ; clc 

%% Numer of stages

N = 6 ; M = N ;


%% Nondimensional parameters

f = 1e-2 ; 
k_01 = 1 ; 
p = 0.1 ; 
lambda = 0.1 ;
mu_0 = 1/240 ;


%% Kinetic matrix

Mmat = zeros(M+N-1, M+N-1) ;
Mmat(1,1) = -(mu_0 + (1 + f)*k_01) ;
Mmat(1,2:N) = 1 ; 
Mmat(1,N+1:end) = lambda ;
Mmat(2,1) = k_01 ;
Mmat(N+1,1) = f*k_01 ;

% Kinetic matrix with nAPC
ovec = ones(N-1,1) ; 
Mnmat = spdiags([p*ovec, -(1 + p)*ovec], -1:0, N-1, N-1) ;
Mnmat(N-1,N-1) = -(1 + p) ;
Mmat(2:N,2:N) = Mnmat ;

% Kinetic matrix with cAPC
ovec = ones(M-1,1) ; 
Mcmat = spdiags([p*ovec, -(lambda + p)*ovec], -1:0, M-1, M-1) ;
Mcmat(M-1,M-1) = -(lambda + p) ;
Mmat(N+1:N+M-1,N+1:N+M-1) = Mcmat ;



%% Compute statistics


[P_bind_n, tau_bind_n, sig_bind_n, P_bind_c, tau_bind_c, sig_bind_c] = ...
    compute_stat(N, M, p, Mmat) ;


% disp('For nAPC chain : ')
% 
% disp(['Binding probability = ', num2str(P_bind_n)]) 
% 
% disp(['Mean binding time = ', num2str(tau_bind_n)])
% 
% disp(['SD of binding time = ', num2str(sig_bind_n)])


% disp('For cAPC chain : ')
% 
% disp(['Binding probability = ', num2str(P_bind_c)]) 
% 
% disp(['Mean binding time = ', num2str(tau_bind_c)])
% 
% disp(['SD of binding time = ', num2str(sig_bind_c)])



num = 1 + k_01*(1 - (p/(1+p))^(N-1)*(1 + (N-1)/(1+p))) + ...
      f*k_01*(1/lambda - (p/(lambda+p))^(N-1)*(1/lambda + (N-1)/(lambda+p))) ;
denom = mu_0 + k_01*(p/(1+p))^(N-1) + f*k_01*(p/(lambda+p))^(N-1) ;
tau_bind_c_exact = (N - 1)/(lambda + p) + num/denom ;
tau_bind_n_exact = (N - 1)/(1 + p) + num/denom ;

disp(tau_bind_c_exact)
disp(tau_bind_n_exact)

% num = 1 + k_01*(1 - (p/(1+p))^(N-1)*(1 + (N-1)/(1+p))) ;
% denom = mu_0 + k_01*(p/(1+p))^(N-1) + f*k_01 ;
% tau_bind_c_limit = (N-1)/p + num/denom ;
% disp(tau_bind_c_limit)




