
clear ; close all ; % clc 

%% Number of stages

N = 6 ; M = N ;


%% Nondimensional parameters

mu_0 = 1/240 ;
f = 1e-2 ; 
k_01 = 1 ; 
p = 0.1 ;
lambda = 0.6 ;

D = 1.8e-3 ;
kappaset = 10.^linspace(-1, 3, 40)' ;
P_bind_c_set = zeros(length(kappaset), 1)' ; 
tau_bind_c_set = zeros(length(kappaset), 1)' ; 

tol = 1e-6 ;

for i = 1:length(kappaset)

    kappa = kappaset(i) ;

    %% Solve for nu
    
    max_nu_num = 50000 ;
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

    cnm1bar = compute_laplace_cnm1bar(D, kappa, f, k_01, p, mu_0, lambda, N, nuset, tol) ;
    P_bind_c = p * cnm1bar ;
    dcnm1bar = compute_laplace_dcnm1bar(D, kappa, f, k_01, p, mu_0, lambda, N, nuset, tol) ;
    tau_bind_c = -dcnm1bar / cnm1bar ;

    P_bind_c_set(i) = P_bind_c ;
    tau_bind_c_set(i) = tau_bind_c ;
    disp([num2str(i), ' / ', num2str(length(kappaset))])

end


% figure(1) ; clf ; 
% semilogx(kappaset, P_bind_c_set, 'k-') ; 


filename = ['kappa_lambda=', num2str(lambda), '.mat'] ;
save(filename, 'kappaset', 'P_bind_c_set', 'tau_bind_c_set')