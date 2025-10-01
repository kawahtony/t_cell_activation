clear ; clc ; close all

azure = [0, 128, 255]/255 ; 
coral = [255, 127, 80]/255 ;
jade = [0, 168, 107]/255 ; 


%%

N = 6 ; 
mu_0 = 1/240 ; 
p = 0.1 ; 
k_01 = 1 ; 


%% Plot

fset = 10.^linspace(-4, 1, 300)' ;

figure(1) ; clf ;
t = tiledlayout(1,3) ;

% t.TileSpacing = 'none';
% t.Padding = 'none';

% Give more right margin by shifting and shrinking width
% t.OuterPosition = [0.05 0.05 0.88 0.9];  % [left bottom width height]


%--------------------------------------------------------------------------
% Plot Fc

nexttile


lambda = 0.2 ;
Fcset = fset ./ (fset + ((lambda + p)./(1 + p)).^(N-1)) ;
semilogx(fset, Fcset, '-', 'LineWidth', 3, 'Color', azure, 'DisplayName', '$\lambda=0.2$') ; hold on ;

lambda = 0.4 ;
Fcset = fset ./ (fset + ((lambda + p)/(1 + p)).^(N-1)) ;
semilogx(fset, Fcset, '--', 'LineWidth', 3, 'Color', coral, 'DisplayName', '$\lambda=0.4$') ; hold on ;

lambda = 0.6 ;
Fcset = fset ./ (fset + ((lambda + p)/(1 + p)).^(N-1)) ;
semilogx(fset, Fcset, ':', 'LineWidth', 3, 'Color', jade, 'DisplayName', '$\lambda=0.6$') ; 


leg = legend ; 
set(leg, 'interpreter', 'Latex', 'Box', 'off', 'Position', [0.2217    0.2216    0.0808    0.2006])
set(gcf, 'defaultTextInterpreter', 'Latex') 
set(gca, 'FontSize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
set(gca, 'XMinorGrid', 'off')
set(gca, 'YMinorGrid', 'off')
xlabel('$f$') ; ylabel('$F_{\rm c}$') ; 
grid on ;
xticks([1e-3 1e-2 1e-1 1e0])
yticks([0, 0.25, 0.5, 0.75, 1])
xlim([8e-4, 1.2]) ; ylim([-0.1, 1.1])
title('(a) $F_\mathrm{c}$', 'Units', 'normalized', 'Position', [0.15 1.01])


%--------------------------------------------------------------------------
% Plot P_bind_c

nexttile

lambda = 0.2 ;
P_bind_c_set = fset*k_01*(p/(lambda + p))^(N-1) ./ (mu_0 + k_01*(p/(1 + p))^(N-1) + fset*k_01*(p/(lambda + p))^(N-1) ) ;
semilogx(fset, P_bind_c_set, '-', 'LineWidth', 3, 'Color', azure) ; hold on ; 

lambda = 0.4 ;
P_bind_c_set = fset*k_01*(p/(lambda + p))^(N-1) ./ (mu_0 + k_01*(p/(1 + p))^(N-1) + fset*k_01*(p/(lambda + p))^(N-1) ) ;
semilogx(fset, P_bind_c_set, '--', 'LineWidth', 3, 'Color', coral) ; hold on ; 

lambda = 0.6 ;
P_bind_c_set = fset*k_01*(p/(lambda + p))^(N-1) ./ (mu_0 + k_01*(p/(1 + p))^(N-1) + fset*k_01*(p/(lambda + p))^(N-1) ) ;
semilogx(fset, P_bind_c_set, ':', 'LineWidth', 3, 'Color', jade) ; 


set(gcf, 'defaultTextInterpreter', 'Latex') 
set(gca, 'FontSize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
set(gca, 'XMinorGrid', 'off')
set(gca, 'YMinorGrid', 'off')
xlabel('$f$') ; ylabel('$P_{\rm bind,c}$') ; 
grid on ;
xlim([8e-4, 1.2]) ; ylim([-0.05 0.55])
xticks([1e-3 1e-2 1e-1 1e0])
title('(b) $P_\mathrm{bind,c}$', 'Units', 'normalized', 'Position', [0.2 1.01])

%--------------------------------------------------------------------------
% Plot tau_bind_c

nexttile

lambda = 0.2 ;
num = 1 + k_01*( 1 - (p/(1+p))^(N-1)*(1 + (N-1)/(1+p)) ) + ...
      fset*k_01*( lambda - (p/(1/lambda+p))^(N-1) .* (lambda + (N-1)/(1/lambda+p)) ) ;
denom = mu_0 + k_01*(p/(1+p))^(N-1) + fset*k_01*(p/(1/lambda+p))^(N-1) ;
tau_bind_c_set = (N - 1)/(1/lambda + p) + num./denom ;
semilogx(fset, tau_bind_c_set, '-', 'LineWidth', 3, 'Color', azure) ; hold on ;

lambda = 0.4 ;
num = 1 + k_01*( 1 - (p/(1+p))^(N-1)*(1 + (N-1)/(1+p)) ) + ...
      fset*k_01*( lambda - (p/(1/lambda+p))^(N-1) .* (lambda + (N-1)/(1/lambda+p)) ) ;
denom = mu_0 + k_01*(p/(1+p))^(N-1) + fset*k_01*(p/(1/lambda+p))^(N-1) ;
tau_bind_c_set = (N - 1)/(1/lambda + p) + num./denom ;
semilogx(fset, tau_bind_c_set, '--', 'LineWidth', 3, 'Color', coral) ; hold on ;

lambda = 0.6 ;
num = 1 + k_01*( 1 - (p/(1+p))^(N-1)*(1 + (N-1)/(1+p)) ) + ...
      fset*k_01*( lambda - (p/(1/lambda+p))^(N-1) .* (lambda + (N-1)/(1/lambda+p)) ) ;
denom = mu_0 + k_01*(p/(1+p))^(N-1) + fset*k_01*(p/(1/lambda+p))^(N-1) ;
tau_bind_c_set = (N - 1)/(1/lambda + p) + num./denom ;
semilogx(fset, tau_bind_c_set, ':', 'LineWidth', 3, 'Color', jade) ;



set(gcf, 'defaultTextInterpreter', 'Latex') 
set(gca, 'FontSize', 20)
set(gca, 'TickLabelInterpreter', 'Latex')
set(gca, 'XMinorGrid', 'off')
set(gca, 'YMinorGrid', 'off')
xlabel('$f$') ; ylabel('$\tau_{\rm bind,c}$') ; 
grid on ;
xlim([8e-4, 1.2]) ; ylim([460, 660])
xticks([1e-3 1e-2 1e-1 1e0])
yticks([480 520 560 600 640])
title('(c) $\tau_\mathrm{bind,c}$', 'Units', 'normalized', 'Position', [0.2 1.01])

%--------------------------------------------------------------------------


% Optional but safe:
set(gcf, 'PaperPositionMode', 'auto');
set(gcf, 'Position', [190         197        1219         348])
annotation('rectangle',[0.02 0.03 0.97 0.97], 'Color','w');

% exportgraphics(gcf, 'neu_f.pdf', 'ContentType', 'vector')
print('neu_f', '-dsvg')