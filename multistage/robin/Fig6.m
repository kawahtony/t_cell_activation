
clear ; clc ; close all

azure = [0, 128, 255]/255 ;
jade = [0, 168, 107]/255 ;
coral = [255, 127, 80]/255 ; 



%% Choose diffusion constant D (three choices)


% D = 1.8e-2 ;
% D = 1.8e-3 ;
D = 1.8e-4 ;

if D == 1.8e-4
    cl = azure ;
elseif D == 1.8e-3
    cl = jade ;
elseif D == 1.8e-2
    cl = coral ;
end

qset = [1, 4, 10] ;
Nset = [2, 4, 6] ; 
alphaset = linspace(0.65, 1, length(Nset)).^2 ;


%%


for i = 1:length(qset)
    q = qset(i) ;
    figure(i) ; clf ;
    for j = 1:length(Nset)
        N = Nset(j) ;
        filename = ['D=', num2str(D), '/N=', num2str(N), '/q=', num2str(q), '_kappa=1.mat'] ; load(filename) ;
        if q == 10
            p = plot(pset, tau_bind_set, '-', 'LineWidth', 5, 'Color', cl, 'DisplayName', sprintf('$N=%i$', N)) ; hold on ; 
        else
            p = semilogy(pset, tau_bind_set, '-', 'LineWidth', 5, 'Color', cl, 'DisplayName', sprintf('$N=%i$', N)) ; hold on ; 
        end
        p.Color(4) = alphaset(j) ;
    
        filename = ['../dirichlet/D=', num2str(D), '/N=', num2str(N), '/q=', num2str(q), '.mat'] ; load(filename) ;
        if q == 10
            p = plot(pset, tau_bind_set, ':', 'LineWidth', 5, 'Color', cl, 'DisplayName', sprintf('$N=%i$', N)) ; hold on ;  
        else
            p = semilogy(pset, tau_bind_set, ':', 'LineWidth', 5, 'Color', cl, 'DisplayName', sprintf('$N=%i$', N)) ; hold on ; 
        end
        p.Color(4) = alphaset(j) ;            
    end
    set(gca, 'FontSize', 25) ; 
    set(gca, 'TickLabelInterpreter', 'latex') ;
    set(gca, 'yMinorGrid', 'off')
    set(gcf, 'defaultTextInterpreter', 'Latex') ; 
    grid on ;
    xlim([0.1 9.9]) ; 
    xticks(1:9) ;
    xticklabels({'1', '', '3', '', '5', '', '7', '', '9'})
    xlabel('$p$') ;
    if D == 1.8e-4
        if q == 1 
            set(figure(1), 'Position', [91   235   459   401])        
            ylabel('$\tau_\mathrm{bind}$')
            % ylim([9e1, 9e7])
            ylim()
            yticks([1e3 1e5 1e7])
            title('(a) \enspace $D=1.8\times 10^{-4}, \enspace q=1$', 'Interpreter', 'Latex')
            leg = legend ;
            set(leg, 'Interpreter', 'Latex', 'Box', 'off', 'FontSize', 18, ...
                'NumColumns', 2, 'Orientation', 'horizontal', 'Position', [0.210062755301288,0.697921862016224,0.39400771396612,0.174064837191765])
        elseif q == 4
            set(figure(2), 'Position', [551   236   459   400])
            ylim([5e1 3e4])
            title('(b) \enspace $D=1.8\times 10^{-4}, \enspace q=4$', 'Interpreter', 'Latex')

        elseif q == 10
            set(figure(3), 'Position', [1011 236 459 400])
            ylim([130 1070])
            title('(c) \enspace $D=1.8\times 10^{-4}, \enspace q=10$', 'Interpreter', 'Latex')
        end
    elseif D == 1.8e-3
        if q == 1 
            set(figure(1), 'Position', [91   235   459   401])        
            ylabel('$\tau_\mathrm{bind}$')
            ylim([1e1, 6e7])
            yticks([1e2, 1e4, 1e6])
            title('(d) \enspace $D=1.8\times 10^{-3}, \enspace q=1$', 'Interpreter', 'Latex')
            leg = legend ;
            set(leg, 'Interpreter', 'Latex', 'Box', 'off', 'FontSize', 18, ...
                'NumColumns', 2, 'Orientation', 'horizontal', 'Position', [0.187874829355327,0.708229426433915,0.39400771396612,0.173895703891756])
        elseif q == 4
            set(figure(2), 'Position', [551   236   459   400])
            ylim([5e1 2e4])
            title('(e) \enspace $D=1.8\times 10^{-3}, \enspace q=4$', 'Interpreter', 'Latex')
        elseif q == 10
            set(figure(3), 'Position', [1011 236 459 400])
            ylim([50, 650]) ;
            title('(f) \enspace $D=1.8\times 10^{-3}, \enspace q=10$', 'Interpreter', 'Latex')
        end

    elseif D == 1.8e-2
        if q == 1
                set(figure(1), 'Position', [91   235   459   401])        
                ylabel('$\tau_\mathrm{bind}$')
                ylim([1 5e6])
                yticks([1 1e2 1e4 1e6])
                title('(g) \enspace $D=1.8\times 10^{-2}, \enspace q=1$', 'Interpreter', 'Latex')
                leg = legend ;
                set(leg, 'Interpreter', 'Latex', 'Box', 'off', 'FontSize', 18, ...
                    'NumColumns', 2, 'Orientation', 'horizontal', 'Position', [0.182059203932583,0.722179177414093,0.39400771396612,0.174064837191765])
            elseif q == 4
                set(figure(2), 'Position', [551   236   459   400])
                ylim([3 5e3])
                yticks([1e1 1e2 1e3])
                title('(h) \enspace $D=1.8\times 10^{-2}, \enspace q=4$', 'Interpreter', 'Latex')
            elseif q == 10
                set(figure(3), 'Position', [1011 236 459 400])
                ylim([-10 160])
                title('(i) \enspace $D=1.8\times 10^{-2}, \enspace q=10$', 'Interpreter', 'Latex')
        end    

    end
    annotation('rectangle',[0 0 1 1], 'Color','w');
    exportgraphics(gcf, ['robin_D=', num2str(D), '_q=', num2str(q), '_tau_vs_N.pdf'])

end

% 
% xlim([pset(1) pset(end)])
% yticks(20:40:140)
% xlabel('$p$') ; ylabel('$\tau_\mathrm{bind}$')
% grid on ; axis tight ;

