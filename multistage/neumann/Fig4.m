
clear ; close all ; %clc ; 

azure = [0, 128, 255]/255 ; 
jade = [0, 168, 107]/255 ;
coral = [255, 127, 80]/255 ; 

clset = {azure, coral, jade} ;
styleset = {':o', ':s', ':d'} ;



%% Fix p and q, vary N and plot ffpt over m

p = 1 ; 
q = 1 ; 
Nset = [2, 4, 6] ;

figure(1) ; clf ; 
for k = 1:length(Nset)
    N = Nset(k) ;
    load(['extreme/p=', num2str(p), '_q=', num2str(q), '_N=', num2str(N), '.mat']) ;
    plot(mset, meanset, styleset{k}, 'LineWidth', 2, 'MarkerSize', 8, 'color', clset{k}, ...
        'MarkerFaceColor', clset{k}, 'DisplayName', ['$N=',num2str(N),'$']) ; hold on ; 
end

set(gcf, 'defaultTextInterpreter', 'Latex')
set(gca, 'FontSize', 20)
leg = legend ; 
set(leg, 'interpreter', 'Latex', 'Box', 'off', ...
    'Position', [0.526175697746628,0.677226369345366,0.1659170098261,0.208358208101187])
set(gca, 'TickLabelInterpreter', 'Latex')
grid on ; 
xlabel('$m$') ; ylabel('$\tau_{\rm min}$', 'Interpreter', 'Latex')
% title('(a) Conditional mean of $T_{\rm min}$')
set(gcf, 'Position', [239   172   545   335])
xlim([0, 21]) ; ylim([-100 1600])

annotation(gcf,'textbox',...
    [0.804270307290531,0.786575741979756,0.029532403609516,0.090954022988506],...
    'String',{'(a)'},...
    'Interpreter','latex',...
    'FontSize',20,...
    'FitBoxToText','off',...
    'EdgeColor','none');

exportgraphics(gcf, 'efpt_mean.pdf')




figure(2) ; clf ;  
for k = 1:length(Nset)
    N = Nset(k) ;
    load(['extreme/p=', num2str(p), '_q=', num2str(q), '_N=', num2str(N), '.mat']) ;
    plot(mset, sqrt(varset), styleset{k}, 'LineWidth', 2, 'MarkerSize', 8, 'color', clset{k}, ...
        'MarkerFaceColor', clset{k}, 'DisplayName', ['$N=',num2str(N),'$']) ; hold on ; 
end

set(gcf, 'defaultTextInterpreter', 'Latex')
set(gca, 'FontSize', 20)
% leg = legend ; 
% set(leg, 'interpreter', 'Latex', 'Box', 'off', 'Location', 'Best')
set(gca, 'TickLabelInterpreter', 'Latex')
grid on ; 
xlabel('$m$') ; ylabel('$\sigma_{\rm min}$', 'Interpreter', 'Latex')
% title('(b) Standard derivation of $T_{\rm min}$')
set(gcf, 'Position', [785   172   545   335])
xlim([0, 21]) ; ylim([-100 1600])

annotation(gcf,'textbox',...
    [0.813444619217136,0.795530965860353,0.029532403609516,0.090954022988506],...
    'String',{'(b)'},...
    'Interpreter','latex',...
    'FontSize',20,...
    'FitBoxToText','off',...
    'EdgeColor','none');


exportgraphics(gcf, 'efpt_sd.pdf')




%% Fix N and p=1, vary q and plot ffpt over m 

% N = 6 ; 
% p = 1 ; 
% qset = [1, 5, 10] ;
% clset = {azure, coral, jade} ;
% styleset = {':o', ':s', ':d'} ;
% 
% figure(1) ; clf ; hold on ; 
% for k = 1:length(qset)
%     q = qset(k) ;
%     load(['extreme/N=', num2str(N), '_q=', num2str(q), '.mat']) ;
%     plot(mset, ffpt_set, styleset{k}, 'LineWidth', 2, 'MarkerSize', 10, 'color', clset{k}, ...
%         'MarkerFaceColor', clset{k}, 'DisplayName', ['$q=',num2str(q),'$']) ;
% end
% 
% set(gcf, 'defaultTextInterpreter', 'Latex')
% set(gca, 'FontSize', 20)
% leg = legend ; 
% set(leg, 'interpreter', 'Latex', 'Box', 'off', 'Location', 'Best')
% set(gca, 'TickLabelInterpreter', 'Latex')
% grid on ; 
% xlabel('$m$') ; 
% 
% title(['$N=', num2str(N), ', \enspace p=', num2str(p), '$'], 'Interpreter', 'Latex', 'Units', 'normalized', 'Position', [0.5 0.9])
% 
% exportgraphics(gcf, 'FigB.pdf')


%% Fix q and N, vary p and plot ffpt over m

% N = 6 ;
% q = 1 ;
% pset = [1, 5, 10] ;
% 
% figure(1) ; clf ; 
% for k = 1:length(pset)
%     p = pset(k) ;
%     load(['extreme/N=', num2str(N), '_p=', num2str(p), '.mat']) ;
%     semilogy(mset, ffpt_set, styleset{k}, 'LineWidth', 2, 'MarkerSize', 10, 'color', clset{k}, ...
%         'MarkerFaceColor', clset{k}, 'DisplayName', ['$p=',num2str(p),'$']) ; hold on ; 
% end
% 
% set(gcf, 'defaultTextInterpreter', 'Latex')
% set(gca, 'FontSize', 20)
% leg = legend ; 
% set(leg, 'interpreter', 'Latex', 'Box', 'off', 'Location', 'Best')
% set(gca, 'TickLabelInterpreter', 'Latex')
% grid on ; 
% xlabel('$m$') ; 
% 
% title(['$N=', num2str(N), ', \enspace q=', num2str(q), '$'], 'Interpreter', 'Latex', 'Units', 'normalized', 'Position', [0.5 0.9])
% 
% exportgraphics(gcf, 'FigC.pdf')