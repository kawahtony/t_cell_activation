function [P_bind_n, tau_bind_n, sig_bind_n, ...
          P_bind_c, tau_bind_c, sig_bind_c] = compute_stat(N, M, p, Mmat) 

y0 = zeros(N+M-1, 1) ; y0(1) = 1 ;

L = -Mmat\y0 ;
P_bind_n = p * L(N) ;
P_bind_c = p * L(end) ;

Lp = (-Mmat\(Mmat\y0))  ;
tau_bind_n = (-p/P_bind_n) * Lp(N) ;
tau_bind_c = (-p/P_bind_c) * Lp(end) ;

Lpp = 2 * ( Mmat\(Mmat\(Mmat\y0)) ) ;
sig_bind_n = sqrt(-p/P_bind_n * Lpp(N) - tau_bind_n^2) ;
sig_bind_c = sqrt(-p/P_bind_c * Lpp(end) - tau_bind_c^2) ;

end