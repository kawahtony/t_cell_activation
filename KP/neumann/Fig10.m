clear ; clc ; close all

azure = [0, 128, 255]/255 ; 
coral = [255, 127, 80]/255 ;
jade = [0, 168, 107]/255 ; 

ms = 10 ; 


%%

f = 1e-2 ; 
mu_0 = 1/240 ; 
k_01 = 1 ; 
p = 0.1 ;
% lambda = 0.2 ; 


%%

% lambdaset = linspace(0.1, 0.9, 300) ;
% N_crit_set = zeros(size(lambdaset)) ;
% 
% for k = 1:length(lambdaset)
%     lambda = lambdaset(k) ;
%     temp = k_01/mu_0 * (log(1 + p) - log(lambda + p)) / (log(lambda + p) - log(p)) ;
%     N_crit = 1 + floor(log(temp) / (log(1 + p) - log(p))) ; 
%     N_crit_set(k) = N_crit ; 
% end
% figure(1) ; clf ; 
% plot(lambdaset, N_crit_set, 'k-')


%% Plot

Nset = (2:21)' ;

figure(1) ; clf ; 
tiledlayout(1,3)

%--------------------------------------------------------------------------
% Plot Fc

nexttile


lambda = 0.2 ; 
Fcset = f ./ (f + ((lambda +p)/(1 + p)).^(Nset-1)) ;
plot(Nset, Fcset, '-d', 'Color', azure, 'MarkerFaceColor', azure, 'MarkerSize', ms, 'DisplayName', '$\lambda=0.2$') ; hold on ;

lambda = 0.4 ; 
Fcset = f ./ (f + ((lambda +p)/(1 + p)).^(Nset-1)) ;
plot(Nset, Fcset, '-s', 'Color', coral, 'MarkerFaceColor', coral, 'MarkerSize', ms, 'DisplayName', '$\lambda=0.4$') ; hold on ;

lambda = 0.6 ; 
Fcset = f ./ (f + ((lambda +p)/(1 + p)).^(Nset-1)) ;
plot(Nset, Fcset, '-o', 'Color', jade, 'MarkerFaceColor', jade, 'MarkerSize', ms, 'DisplayName', '$\lambda=0.6$') ; hold on ;




leg = legend ; 
set(leg, 'interpreter', 'Latex', 'Box', 'off', 'Position', [0.1971    0.2646    0.0956    0.2006])
set(gcf, 'defaultTextInterpreter', 'Latex') 
set(gca, 'FontSize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
xlabel('$N$') ; ylabel('$F_{\rm c}$') ; 
grid on ;
xlim([0 20.5]) ; ylim([-0.1, 1.1])
yticks([0, 0.25, 0.5, 0.75, 1])
% title('(a) $F_\mathrm{c}$', 'Units', 'normalized', 'Position', [0.15 1.01])


%--------------------------------------------------------------------------
% Plot P_bind_c

nexttile

lambda = 0.2 ;
P_bind_c_set = f*k_01*(p./(lambda + p)).^(Nset-1) ./ (mu_0 + k_01*(p./(1 + p)).^(Nset-1) + f*k_01*(p./(lambda + p)).^(Nset-1) ) ;
plot(Nset, P_bind_c_set, '-d', 'Color', azure, 'MarkerFaceColor', azure, 'MarkerSize', ms) ; hold on ;

lambda = 0.4 ; 
P_bind_c_set = f*k_01*(p./(lambda + p)).^(Nset-1) ./ (mu_0 + k_01*(p./(1 + p)).^(Nset-1) + f*k_01*(p./(lambda + p)).^(Nset-1) ) ;
plot(Nset, P_bind_c_set, '-s', 'Color', coral, 'MarkerFaceColor', coral, 'MarkerSize', ms) ; hold on ;

lambda = 0.6 ;
P_bind_c_set = f*k_01*(p./(lambda + p)).^(Nset-1) ./ (mu_0 + k_01*(p./(1 + p)).^(Nset-1) + f*k_01*(p./(lambda + p)).^(Nset-1) ) ;
plot(Nset, P_bind_c_set, '-o', 'Color', jade, 'MarkerFaceColor', jade, 'MarkerSize', ms) ; hold on ;


set(gcf, 'defaultTextInterpreter', 'Latex') 
set(gca, 'FontSize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
xlabel('$N$') ; ylabel('$P_{*, \rm{c}}$') ; 
grid on ;
xlim([0, 20.5]) ; ylim([-0.005 0.105])
% title('(b) $P_{*, \rm{c}}$', 'Units', 'normalized', 'Position', [0.2 1.01])


%--------------------------------------------------------------------------
% Plot tau_bind_c

nexttile

lambda = 0.2 ;
num = 1 + k_01*( 1 - (p/(1+p)).^(Nset-1).*(1 + (Nset-1)./(1+p)) ) + ...
      f*k_01*( lambda - (p./(1./lambda+p)).^(Nset-1) .* (lambda + (Nset-1)./(1./lambda+p)) ) ;
denom = mu_0 + k_01*(p/(1+p)).^(Nset-1) + f*k_01*(p./(1./lambda+p)).^(Nset-1) ;
tau_bind_c_set = (Nset - 1)./(1/lambda + p) + num./denom ;
plot(Nset, tau_bind_c_set, '-d', 'Color', azure, 'MarkerFaceColor', azure, 'MarkerSize', ms) ; hold on ;


lambda = 0.4 ;
num = 1 + k_01*( 1 - (p/(1+p)).^(Nset-1).*(1 + (Nset-1)./(1+p)) ) + ...
      f*k_01*( lambda - (p./(1./lambda+p)).^(Nset-1) .* (lambda + (Nset-1)./(1./lambda+p)) ) ;
denom = mu_0 + k_01*(p/(1+p)).^(Nset-1) + f*k_01*(p./(1./lambda+p)).^(Nset-1) ;
tau_bind_c_set = (Nset - 1)./(1/lambda + p) + num./denom ;
plot(Nset, tau_bind_c_set, '-s', 'Color', coral, 'MarkerFaceColor', coral, 'MarkerSize', ms) ; hold on ;


lambda = 0.6 ;
num = 1 + k_01*( 1 - (p/(1+p)).^(Nset-1).*(1 + (Nset-1)./(1+p)) ) + ...
      f*k_01*( lambda - (p./(1./lambda+p)).^(Nset-1) .* (lambda + (Nset-1)./(1./lambda+p)) ) ;
denom = mu_0 + k_01*(p/(1+p)).^(Nset-1) + f*k_01*(p./(1./lambda+p)).^(Nset-1) ;
tau_bind_c_set = (Nset - 1)./(1/lambda + p) + num./denom ;
plot(Nset, tau_bind_c_set, '-o', 'Color', jade, 'MarkerFaceColor', jade, 'MarkerSize', ms) ; hold on ;


set(gcf, 'defaultTextInterpreter', 'Latex') 
set(gca, 'FontSize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
xlabel('$N$') ; ylabel('$\tau_{*, \rm{c}}$') ; 
grid on ;
xlim([0, 20.5]) ; ylim([-30, 530])
% title('(c) $\tau_{*, \rm{c}}$', 'Units', 'normalized', 'Position', [0.2 1.01])


%--------------------------------------------------------------------------

set(gcf, 'Position', [190         197        1219         348])
% annotation('rectangle',[0.02 0.03 0.97 0.97], 'Color','w');


% Create textbox
annotation(gcf,'textbox',...
    [0.08777686628384,0.775862068965517,0.029532403609516,0.090954022988506],...
    'String',{'(a)'},...
    'Interpreter','latex',...
    'FontSize',20,...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(gcf,'textbox',...
    [0.388843314191964,0.790229885057471,0.029532403609516,0.090954022988506],...
    'String','(b)',...
    'Interpreter','latex',...
    'FontSize',20,...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(gcf,'textbox',...
    [0.689909762100088,0.787356321839081,0.029532403609515,0.090954022988506],...
    'String','(c)',...
    'Interpreter','latex',...
    'FontSize',20,...
    'FitBoxToText','off',...
    'EdgeColor','none');


% exportgraphics(gcf, 'neu_N.pdf')
% print('neu_N', '-dsvg')


