clear ; clc ; close all

azure = [0, 128, 255]/255 ; 
coral = [255, 127, 80]/255 ;
jade = [0, 168, 107]/255 ; 


%%

f = 1e-2 ; 
mu_0 = 1/240 ; 
k_01 = 1 ; 
N = 6 ; 


%% Check location of maximizer p_max

% p_crit = @(N, lambda) 1 ./ ( nthroot(k_01/mu_0 * (1./lambda - 1), N) - 1 ) ;
% 
% lambdaset = linspace(0.1, 0.99, 100) ;
% 
% figure(1) ; clf ; 
% plot(lambdaset, p_crit(6, lambdaset), 'k-') ; hold on ;
% plot(lambdaset, p_crit(12, lambdaset), 'r-') ;


%% Plot

pset = linspace(0.01, 1.05, 1000)' ;

figure(1) ; clf ; 
tiledlayout(1,3)

%--------------------------------------------------------------------------
% Plot Fc

nexttile

lambda = 0.2 ;
Fcset = f ./ (f + ((lambda + pset)./(1 + pset)).^(N-1)) ;
plot(pset, Fcset, '-', 'LineWidth', 3, 'Color', azure, 'DisplayName', '$\lambda=0.2$') ; hold on ;

lambda = 0.4 ;
Fcset = f ./ (f + ((lambda + pset)./(1 + pset)).^(N-1)) ;
plot(pset, Fcset, '--', 'LineWidth', 3, 'Color', coral, 'DisplayName', '$\lambda=0.4$') ; hold on ;

lambda = 0.6 ;
Fcset = f ./ (f + ((lambda + pset)./(1 + pset)).^(N-1)) ;
plot(pset, Fcset, ':', 'LineWidth', 3, 'Color', jade, 'DisplayName', '$\lambda=0.6$') ; hold on ;


leg = legend ; 
set(leg, 'interpreter', 'Latex', 'Box', 'off', 'Position', [0.2209024509746,0.451436782431328,0.080803865678395,0.200574711821545])
set(gcf, 'defaultTextInterpreter', 'Latex') 
set(gca, 'FontSize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
xlabel('$p$') ; ylabel('$F_{\rm c}$') ; 
grid on ;
xlim([-0.05 1.05]) ; ylim([-0.02 1.02])
xticks([0, 0.25, 0.5, 0.75, 1])
xticklabels({'0', '', '0.5', '', '1'})
yticks([0, 0.25, 0.5, 0.75, 1])
% title('(a) $F_\mathrm{c}$', 'Units', 'normalized', 'Position', [0.15 1.01])


%--------------------------------------------------------------------------
% Plot P_bind_c

nexttile

lambda = 0.2 ;
P_bind_c_set = f*k_01*(pset./(lambda + pset)).^(N-1) ./ (mu_0 + k_01*(pset./(1 + pset)).^(N-1) + f*k_01*(pset./(lambda + pset)).^(N-1) ) ;
plot(pset, P_bind_c_set, '-', 'LineWidth', 3, 'Color', azure) ; hold on ;
[~,idx] = max(P_bind_c_set) ;
plot(pset(idx), P_bind_c_set(idx), 'o', 'MarkerSize', 12, 'Color', azure, 'MarkerFaceColor', azure)

lambda = 0.4 ;
P_bind_c_set = f*k_01*(pset./(lambda + pset)).^(N-1) ./ (mu_0 + k_01*(pset./(1 + pset)).^(N-1) + f*k_01*(pset./(lambda + pset)).^(N-1) ) ;
plot(pset, P_bind_c_set, '--', 'LineWidth', 3, 'Color', coral) ; hold on ; 
[~,idx] = max(P_bind_c_set) ;
plot(pset(idx), P_bind_c_set(idx), 'o', 'MarkerSize', 12, 'Color', coral, 'MarkerFaceColor', coral)

lambda = 0.6 ;
P_bind_c_set = f*k_01*(pset./(lambda + pset)).^(N-1) ./ (mu_0 + k_01*(pset./(1 + pset)).^(N-1) + f*k_01*(pset./(lambda + pset)).^(N-1) ) ;
plot(pset, P_bind_c_set, ':', 'LineWidth', 3, 'Color', jade) ; hold on ; 
[~,idx] = max(P_bind_c_set) ;
plot(pset(idx), P_bind_c_set(idx), 'o', 'MarkerSize', 12, 'Color', jade, 'MarkerFaceColor', jade)

set(gcf, 'defaultTextInterpreter', 'Latex') 
set(gca, 'FontSize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
xlabel('$p$') ; ylabel('$P_{*, \rm{c}}$') ; 
grid on ;
xlim([-0.05 1.05]) ; ylim([-0.02 0.22])
xticks([0, 0.25, 0.5, 0.75, 1])
xticklabels({'0', '', '0.5', '', '1'})
% title('(b) $P_{*, \rm{c}}$', 'Units', 'normalized', 'Position', [0.2 1.01])

%--------------------------------------------------------------------------
% Plot tau_bind_c

nexttile

lambda = 0.2 ;
num = 1 + k_01*( 1 - (pset./(1+pset)).^(N-1).*(1 + (N-1)./(1+pset)) ) + ...
      f*k_01*( lambda - (pset./(1./lambda+pset)).^(N-1) .* (lambda + (N-1)./(1./lambda+pset)) ) ;
denom = mu_0 + k_01*(pset./(1+pset)).^(N-1) + f*k_01*(pset./(1./lambda+pset)).^(N-1) ;
tau_bind_c_set = (N - 1)./(1/lambda + pset) + num./denom ;
plot(pset, tau_bind_c_set, '-', 'LineWidth', 3, 'Color', azure) ; hold on ; 

lambda = 0.4 ;
num = 1 + k_01*( 1 - (pset./(1+pset)).^(N-1).*(1 + (N-1)./(1+pset)) ) + ...
      f*k_01*( lambda - (pset./(1./lambda+pset)).^(N-1) .* (lambda + (N-1)./(1./lambda+pset)) ) ;
denom = mu_0 + k_01*(pset./(1+pset)).^(N-1) + f*k_01*(pset./(1./lambda+pset)).^(N-1) ;
tau_bind_c_set = (N - 1)./(1/lambda + pset) + num./denom ;
plot(pset, tau_bind_c_set, '--', 'LineWidth', 3, 'Color', coral) ; hold on ;


lambda = 0.6 ;
num = 1 + k_01*( 1 - (pset./(1+pset)).^(N-1).*(1 + (N-1)./(1+pset)) ) + ...
      f*k_01*( lambda - (pset./(1./lambda+pset)).^(N-1) .* (lambda + (N-1)./(1./lambda+pset)) ) ;
denom = mu_0 + k_01*(pset./(1+pset)).^(N-1) + f*k_01*(pset./(1./lambda+pset)).^(N-1) ;
tau_bind_c_set = (N - 1)./(1/lambda + pset) + num./denom ;
plot(pset, tau_bind_c_set, ':', 'LineWidth', 3, 'Color', jade) ; hold on ; 


set(gcf, 'defaultTextInterpreter', 'Latex') 
set(gca, 'FontSize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
xlabel('$p$') ; ylabel('$\tau_{*, \rm{c}}$') ; 
grid on ;
xlim([-0.05, 1.05]) ; ylim([30, 520])
xticks([0, 0.25, 0.5, 0.75, 1])
xticklabels({'0', '', '0.5', '', '1'})
% title('(c) $\tau_{*, \rm{c}}$', 'Units', 'normalized', 'Position', [0.2 1.01])

%--------------------------------------------------------------------------

set(gcf, 'Position', [190         197        1219         348])
% annotation('rectangle',[0.02 0.03 0.97 0.97], 'Color','w');



% Create textbox
annotation(gcf,'textbox',...
    [0.273995077932732,0.807471264367816,0.029532403609516,0.090954022988506],...
    'String',{'(a)'},...
    'Interpreter','latex',...
    'FontSize',20,...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(gcf,'textbox',...
    [0.575061525840856,0.804597701149425,0.029532403609516,0.090954022988506],...
    'String','(b)',...
    'Interpreter','latex',...
    'FontSize',20,...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(gcf,'textbox',...
    [0.880229696472523,0.793103448275862,0.029532403609515,0.090954022988506],...
    'String','(c)',...
    'Interpreter','latex',...
    'FontSize',20,...
    'FitBoxToText','off',...
    'EdgeColor','none');


% exportgraphics(gcf, 'neu_p.pdf')
% print('neu_p', '-dsvg')