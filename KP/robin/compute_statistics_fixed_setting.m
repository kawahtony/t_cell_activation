
clear ; close all ; % clc 

%% Number of stages

N = 3 ; M = N ;


%% Nondimensional parameters

mu_0 = 1/240 ;
f = 1e-1 ; 
k_01 = 1 ; 
p = 0.6 ;
r = 0.1 ;

D = 1.8e-4 ;
kappa = 100 ;


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

tol = 1e-10 ;

cnm1bar = compute_laplace_cnm1bar(D, kappa, f, k_01, p, mu_0, r, N, nuset, tol) ;

P_bind_c = p * cnm1bar ;


dcnm1bar = compute_laplace_dcnm1bar(D, kappa, f, k_01, p, mu_0, r, N, nuset, tol) ;

tau_bind_c = -dcnm1bar / cnm1bar ;


disp(['Binding probability = ', num2str(P_bind_c)]) 

% P_bind_c_neu = f*k_01*(p/(r+p))^(N-1) / (mu_0 + k_01*(p/(1+p))^(N-1) + f*k_01*(p/(r+p))^(N-1)) ;

% disp(['Neu Binding probability = ', num2str(P_bind_c_neu)]) 

disp(['Mean binding time = ', num2str(tau_bind_c)])
