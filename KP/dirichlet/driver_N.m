
clear ; close all ; % clc 


%% Nondimensional parameters

f = 1e-2 ; 
mu_0 = 1/240 ;
k_01 = 1 ; 
p = 0.1 ;
lambda=  0.2 ; 

D = 1.8e-3 ;
kappa = 1 ;

Nset = (2:15)' ;
P_bind_c_set = zeros(length(Nset), 1)' ; 
tau_bind_c_set = zeros(length(Nset), 1)' ; 



%%

tol = 1e-6 ;


for i = 1:length(Nset)

    N = Nset(i) ;    

    cnm1bar = compute_laplace_cnm1bar(D, f, k_01, p, mu_0, lambda, N, tol) ;
    P_bind_c = p * cnm1bar ;
    dcnm1bar = compute_laplace_dcnm1bar(D, f, k_01, p, mu_0, lambda, N, tol) ;
    tau_bind_c = -dcnm1bar / cnm1bar ;

    P_bind_c_set(i) = P_bind_c ; 
    tau_bind_c_set(i) = tau_bind_c ;
    disp([num2str(i), ' / ', num2str(length(Nset))])

end


filename = 'N.mat' ;
save(filename, 'Nset', 'P_bind_c_set', 'tau_bind_c_set') ;


