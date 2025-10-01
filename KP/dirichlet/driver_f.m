
clear ; close all ; % clc 

%% Number of stages

N = 6 ; M = N ;


%% Nondimensional parameters

mu_0 = 1/240 ;
lambda = 0.2 ;
k_01 = 1 ; 
p = 0.1 ;

D = 1.8e-3 ;

fset = 10.^linspace(-3, 0, 300)' ;
P_bind_c_set = zeros(length(fset), 1)' ; 
tau_bind_c_set = zeros(length(fset), 1)' ; 


%%

tol = 1e-8 ;


for i = 1:length(fset)

    f = fset(i) ;    

    cnm1bar = compute_laplace_cnm1bar(D, f, k_01, p, mu_0, lambda, N, tol) ;
    P_bind_c = p * cnm1bar ;
    dcnm1bar = compute_laplace_dcnm1bar(D, f, k_01, p, mu_0, lambda, N, tol) ;
    tau_bind_c = -dcnm1bar / cnm1bar ;

    P_bind_c_set(i) = P_bind_c ; 
    tau_bind_c_set(i) = tau_bind_c ;
    disp([num2str(i), ' / ', num2str(length(fset))])

end


filename = 'f.mat' ;
save(filename, 'fset', 'P_bind_c_set', 'tau_bind_c_set') ;


