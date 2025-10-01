function [P_bind, tau_bind, sig_bind] = compute_stat(D, kappa, mu_0, f, k_01, p, N, ...
                                                     Vnmat, Vninvmat, Vcmat, Vcinvmat, ...
                                                     lambda_n_vec, lambda_c_vec, nuset)


%% Before summing

tol = 1e-8 ; 


%% Compute binding probability

rho0bar_hat = compute_laplace_rho0bar(D, kappa, f, k_01, mu_0, N, ...
                                        Vnmat, Vninvmat, Vcmat, Vcinvmat, ...
                                        lambda_n_vec, lambda_c_vec, nuset, tol) ;


temp1 = 0 ;
for j = 1:N-1
    temp1 = temp1 + f*k_01*Vcmat(N-1,j)*Vcinvmat(j,1)/lambda_c_vec(j) ;
end

P_bind = - p * temp1 * rho0bar_hat ;


%% Compute conditional mean binding time 


drho0bar_hat = compute_laplace_drho0bar(D, kappa, f, k_01, mu_0, N, ...
                                        Vnmat, Vninvmat, Vcmat, Vcinvmat, ...
                                        lambda_n_vec, lambda_c_vec, nuset, tol) ;


temp2 = 0 ;
for j = 1:N-1
    temp2 = temp2 + f*k_01*Vcmat(N-1,j)*Vcinvmat(j,1)/lambda_c_vec(j)^2 ;
end


dLcM1bar_hat = -drho0bar_hat*temp1 - rho0bar_hat*temp2 ;

tau_bind = -p/P_bind * dLcM1bar_hat ;


%% Compute conditional variance of binding time 


d2rho0bar_hat = compute_laplace_d2rho0bar(D, kappa, f, k_01, mu_0, N, ...
                                          Vnmat, Vninvmat, Vcmat, Vcinvmat, ...
                                          lambda_n_vec, lambda_c_vec, nuset, tol) ;
  

temp3 = 0 ;
for j = 1:N-1
    temp3 = temp3 + f*k_01*Vcmat(N-1,j)*Vcinvmat(j,1)/lambda_c_vec(j)^3 ;
end


d2LcM1bar_hat = -d2rho0bar_hat*temp1 - 2*drho0bar_hat*temp2 - 2*rho0bar_hat*temp3 ;

sig_bind = sqrt((p/P_bind)*d2LcM1bar_hat - tau_bind^2) ;


end