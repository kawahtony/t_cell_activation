%% Investigate different regime of p and q
% - Fix f, k_01

% Clean up
clear ; clc ; close all ;

addpath('..') ;


%% Number of stages

N = 6 ; M = N ; 


%% Nondimensional parameters

f = 5e-3 ;
k_01 = 1; 
mu_0 = 1/240 ;


%% Loop over different transition rate p


[pp, qq] = meshgrid(0.1:0.1:10) ;

PP = zeros(size(pp)) ;
TT = zeros(size(pp)) ;
SS = zeros(size(pp)) ;


for i = 1:size(pp,1)
    for j = 1:size(pp,2)
        % Extract p and q
        p = pp(i,j) ;    
        q = qq(i,j) ;
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
        % Compute stats
        [P_bind, tau_bind, sig_bind] = compute_stat(N, M , p, Mmat) ;
        % Save
        PP(i,j) = P_bind ; 
        TT(i,j) = tau_bind ; 
        SS(i,j) = sig_bind ;
    end
end


%% Save

filename = ['N=', num2str(N), '.mat'] ;
save(filename, 'pp', 'qq', 'PP', 'TT', 'SS')


%% Plot statistics

% figure(1) ; clf ;
% surf(pp, qq, real(PP), 'EdgeColor', 'none')
% set(gcf, 'defaultTextInterpreter', 'Latex') ; 
% set(gca, 'FontSize', 20)
% xlabel('$p$') ; ylabel('$q$') ; 
% set(gcf, 'Position', [158   318   360   249])
% 
% figure(2) ; clf ;
% surf(pp, qq, real(TT), 'EdgeColor', 'none')
% set(gcf, 'defaultTextInterpreter', 'Latex') ; 
% set(gca, 'FontSize', 20) 
% xlabel('$p$') ; ylabel('$q$') ; 
% set(gcf, 'Position', [519   318   360   249])
% 
% figure(3) ; clf ;
% surf(pp, qq, real(SS), 'EdgeColor', 'none')
% set(gcf, 'defaultTextInterpreter', 'Latex') ; 
% set(gca, 'FontSize', 20) ; 
% xlabel('$p$') ; ylabel('$q$') ; 
% set(gcf, 'Position', [880   318   360   249])
