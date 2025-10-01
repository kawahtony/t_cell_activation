clear ; clc ; close all

azure = [0, 128, 255]/255 ;
coral = [255, 127, 80]/255 ; 
jade = [0, 168, 107]/255 ;

lw = 3 ;


%%


figure(1) ; clf ;
tiledlayout(1,2)


%%

nexttile ;
lambda = 0.2 ;
load(['kappa_lambda=', num2str(lambda), '.mat']) ;
loglog(kappaset, P_bind_c_set, '-', 'Color', azure, 'LineWidth', lw, ...
    'DisplayName', '$\lambda=0.2$') ; hold on ;

lambda = 0.4 ;
load(['kappa_lambda=', num2str(lambda), '.mat']) ;
loglog(kappaset, P_bind_c_set, '--', 'Color', coral, 'LineWidth', lw, ...
    'DisplayName', '$\lambda=0.4$') ; 

lambda = 0.6 ;
load(['kappa_lambda=', num2str(lambda), '.mat']) ;
loglog(kappaset, P_bind_c_set, ':', 'Color', jade, 'LineWidth', lw, ...
    'DisplayName', '$\lambda=0.6$') ; 

leg = legend ; 
set(leg, 'Box', 'off', 'Interpreter', 'latex',  ...
    'Position', [0.3338    0.4953    0.0887    0.1501])
set(gcf, 'defaultTextInterpreter', 'Latex')
set(gca, 'Fontsize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
set(gca, 'XMinorGrid', 'off')
set(gca, 'YMinorGrid', 'off')
grid on ;
xlabel('$\kappa$') ; ylabel('$P_{*, \rm{c}}$')
xlim([5e-1, 2e2]) ; ylim([2e-5 2e-2])
xticks([1e0 1e1 1e2])

% title('(a) $P_{*, \rm{c}}$', 'Units', 'normalized', 'Position', [0.12 1.01])


%%

nexttile

lambda = 0.2 ;
load(['kappa_lambda=', num2str(lambda), '.mat']) ;
semilogx(kappaset, tau_bind_c_set, '-', 'Color', azure, 'LineWidth', lw) ; hold on ;

lambda = 0.4 ;
load(['kappa_lambda=', num2str(lambda), '.mat']) ;
semilogx(kappaset, tau_bind_c_set, '--', 'Color', coral, 'LineWidth', lw) ; 

lambda = 0.6 ;
load(['kappa_lambda=', num2str(lambda), '.mat']) ;
semilogx(kappaset, tau_bind_c_set, ':', 'Color', jade, 'LineWidth', lw) ; 

set(gcf, 'defaultTextInterpreter', 'Latex')
set(gca, 'Fontsize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
grid on ;
xlabel('$\kappa$') ; ylabel('$\tau_{*, \rm{c}}$')

xlim([5e-1, 2e2]) ; ylim([80, 370])
xticks([1e0 1e1 1e2])
% title('(b) $\tau_{*, \rm{c}}$', 'Units', 'normalized', 'Position', [0.12 1.01])


set(gcf, 'Position', [313   218   938   370])
set(gca, 'XMinorGrid', 'off')
set(gca, 'YMinorGrid', 'off')

% annotation('rectangle',[0.02 0.03 0.97 0.97], 'Color','w');

% Create textbox
annotation(gcf,'textbox',...
    [0.407686968283495,0.799750473499083,0.029532403609516,0.090954022988506],...
    'String',{'(a)'},...
    'Interpreter','latex',...
    'FontSize',20,...
    'FitBoxToText','off',...
    'EdgeColor','none');


% Create textbox
annotation(gcf,'textbox',...
    [0.857580358475391,0.794345068093681,0.029532403609516,0.090954022988506],...
    'String',{'(b)'},...
    'Interpreter','latex',...
    'FontSize',20,...
    'FitBoxToText','off',...
    'EdgeColor','none');

% exportgraphics(gcf, 'robin_lambda.pdf')
% print('robin_lambda', '-dsvg')