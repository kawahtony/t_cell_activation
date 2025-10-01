clear ; clc ; close all

azure = [0, 128, 255]/255 ; 
coral = [255, 127, 80]/255 ;
jade = [0, 168, 107]/255 ; 


%%

f = 1e-2 ; 
k_01 = 1 ;
p = 0.1 ; 
mu_0 = 1/240 ;

N1 = 6 ; 
N2 = 9 ; 
N3 = 12 ;


%% Plot

% lambdaset = 2.^(linspace(-3, 0, 300))' ;
lambdaset = linspace(0, 1.1, 300) ;

figure(1) ; clf ; 
tiledlayout(1,3)

%--------------------------------------------------------------------------
% Plot Fc

nexttile

N = N1 ; 
Fcset = f ./ (f + ((lambdaset + p)/(1 + p)).^(N-1)) ;
plot(lambdaset, Fcset, '-', 'LineWidth', 3, 'Color', azure, 'DisplayName', '$N=6$') ; hold on ;

N = N2 ;
Fcset = f ./ (f + ((lambdaset + p)/(1 + p)).^(N-1)) ;
plot(lambdaset, Fcset, '--', 'LineWidth', 3, 'Color', coral, 'DisplayName', '$N=9$') ; hold on ;

N = N3 ; 
Fcset = f ./ (f + ((lambdaset + p)/(1 + p)).^(N-1)) ;
plot(lambdaset, Fcset, ':', 'LineWidth', 3, 'Color', jade, 'DisplayName', '$N=12$') ; 


leg = legend ; 
set(leg, 'interpreter', 'Latex', 'Box', 'off', 'Position', [0.0970    0.2359    0.0808    0.2006])
set(gcf, 'defaultTextInterpreter', 'Latex') 
set(gca, 'FontSize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
xlabel('$\lambda$') ; ylabel('$F_{\rm c}$') ; 
grid on ;
xticks([0, 0.25, 0.5, 0.75, 1])
xticklabels({'0', '', '0.5', '', '1'})
yticks([0, 0.25, 0.5, 0.75, 1])
ylim([-0.1, 1.1])
xlim([-0.05, 1.05]) ; 


title('(a) $F_\mathrm{c}$', 'Units', 'normalized', 'Position', [0.15 1.01])


%--------------------------------------------------------------------------
% Plot P_bind_c

nexttile

N = N1 ; 
P_bind_c_set = f*k_01*(p./(lambdaset + p)).^(N-1) ./ (mu_0 + k_01*(p/(1 + p))^(N-1) + f*k_01*(p./(lambdaset + p)).^(N-1) ) ;
plot(lambdaset, P_bind_c_set, '-', 'LineWidth', 3, 'Color', azure) ; hold on ; 

N = N2 ; 
P_bind_c_set = f*k_01*(p./(lambdaset + p)).^(N-1) ./ (mu_0 + k_01*(p/(1 + p))^(N-1) + f*k_01*(p./(lambdaset + p)).^(N-1) ) ;
plot(lambdaset, P_bind_c_set, '--', 'LineWidth', 3, 'Color', coral) ; hold on ; 

N = N3 ; 
P_bind_c_set = f*k_01*(p./(lambdaset + p)).^(N-1) ./ (mu_0 + k_01*(p/(1 + p))^(N-1) + f*k_01*(p./(lambdaset + p)).^(N-1) ) ;
plot(lambdaset, P_bind_c_set, ':', 'LineWidth', 3, 'Color', jade) ; 


set(gcf, 'defaultTextInterpreter', 'Latex') 
set(gca, 'FontSize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
xlabel('$\lambda$') ; ylabel('$P_{\rm bind,c}$') ; 
grid on ;
xlim([-0.05, 1.05]) ; 
ylim([-0.005, 0.255])
ylim([-0.05 0.35])
xticks([0, 0.25, 0.5, 0.75, 1])
xticklabels({'0', '', '0.5', '', '1'})
title('(b) $P_\mathrm{bind,c}$', 'Units', 'normalized', 'Position', [0.2 1.01])

%--------------------------------------------------------------------------
% Plot tau_bind_c

nexttile

N = N1 ; 
num = 1 + k_01*(1 - (p/(1+p))^(N-1)*(1 + (N-1)/(1+p))) + ...
      f*k_01*(1./lambdaset - (p./(lambdaset+p)).^(N-1).*(1./lambdaset + (N-1)./(lambdaset+p))) ;
denom = mu_0 + k_01*(p/(1+p))^(N-1) + f*k_01*(p./(lambdaset+p)).^(N-1) ;
tau_bind_c_set = (N - 1)./(lambdaset + p) + num./denom ;
plot(lambdaset, tau_bind_c_set, '-', 'LineWidth', 2.7, 'Color', azure) ; hold on ;

N = N2 ; 
num = 1 + k_01*(1 - (p/(1+p))^(N-1)*(1 + (N-1)/(1+p))) + ...
      f*k_01*(1./lambdaset - (p./(lambdaset+p)).^(N-1).*(1./lambdaset + (N-1)./(lambdaset+p))) ;
denom = mu_0 + k_01*(p/(1+p))^(N-1) + f*k_01*(p./(lambdaset+p)).^(N-1) ;
tau_bind_c_set = (N - 1)./(lambdaset + p) + num./denom ;
plot(lambdaset, tau_bind_c_set, '--', 'LineWidth', 2.4, 'Color', coral) ; hold on ;

N = N3 ; 
num = 1 + k_01*(1 - (p/(1+p))^(N-1)*(1 + (N-1)/(1+p))) + ...
      f*k_01*(1./lambdaset - (p./(lambdaset+p)).^(N-1).*(1./lambdaset + (N-1)./(lambdaset+p))) ;
denom = mu_0 + k_01*(p/(1+p))^(N-1) + f*k_01*(p./(lambdaset+p)).^(N-1) ;
tau_bind_c_set = (N - 1)./(lambdaset + p) + num./denom ;
plot(lambdaset, tau_bind_c_set, ':', 'LineWidth', 2.7, 'Color', jade) ;



set(gcf, 'defaultTextInterpreter', 'Latex') 
set(gca, 'FontSize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
xlabel('$\lambda$') ; ylabel('$\tau_{\rm bind,c}$') ; 
grid on ;
xlim([-0.05, 1.05]) ; 
ylim([270, 630])
xticks([0, 0.25, 0.5, 0.75, 1])
xticklabels({'0', '', '0.5', '', '1'})
title('(c) $\tau_\mathrm{bind,c}$', 'Units', 'normalized', 'Position', [0.2 1.01])

%--------------------------------------------------------------------------

set(gcf, 'Position', [190         197        1219         348])
annotation('rectangle',[0.02 0.03 0.97 0.97], 'Color','w');
% exportgraphics(gcf, 'neu_lambda.pdf')
% print('neu_lambda', '-dsvg')