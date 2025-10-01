


clear ; clc ; close all

azure = [0, 128, 255]/255 ;
jade = [0, 168, 107]/255 ;
coral = [255, 127, 80]/255 ; 




%%

Dset = [1.8e-4; 1.8e-3; 1.8e-2] ;
qset = [1; 4; 10] ;
Nset = [2, 4, 6] ; 
alphaset = linspace(0.65, 1, length(Nset)).^2 ;

figure(1) ; clf ; 
tiledlayout(3,3)



%%


for k = 1:length(Dset)
    D = Dset(k) ;
    if D == 1.8e-4
        cl = azure ;
    elseif D == 1.8e-3
        cl = jade ;
    elseif D == 1.8e-2
        cl = coral ;
    end

    for i = 1:length(qset)
        q = qset(i) ;
        nexttile
        for j = 1:length(Nset)
            N = Nset(j) ;
            filename = ['D=', num2str(D), '/N=', num2str(N), '/q=', num2str(q), '_kappa=1.mat'] ; load(filename) ;
            p = plot(pset, P_bind_set, '-', 'LineWidth', 5, 'Color', cl, 'DisplayName', sprintf('$N=%i$', N)) ; hold on ; 
            p.Color(4) = alphaset(j) ;
            filename = ['../dirichlet/D=', num2str(D), '/N=', num2str(N), '/q=', num2str(q), '.mat'] ; load(filename) ;
            p = plot(pset, P_bind_set, ':', 'LineWidth', 5, 'Color', cl, 'DisplayName', sprintf('$N=%i$', N)) ; hold on ; 
            p.Color(4) = alphaset(j) ;
    
        end
        set(gca, 'FontSize', 20) ; 
        set(gca, 'TickLabelInterpreter', 'latex') ;
        set(gcf, 'defaultTextInterpreter', 'Latex') ; 
        grid on ;
        xlim([0.1 9.9]) ; 
        xticks(1:9) ;
        xticklabels({'1', '', '3', '', '5', '', '7', '', '9'})
        ax = gca ;
        if q == 1
            ylabel('$P_\mathrm{bind}$')
            yticks(0:0.1:0.5)
            % ax.YLabel.Position(1) = ax.YLabel.Position(1) - 0.4 ; % Adjust as needed
            % ax.Position(1) = ax.Position(1) + 0.08 ; % Move the entire plot right
        elseif q == 4
            yticks(0:0.1:0.5)
            % yticklabels({'', '', '', '', ''})
        elseif q == 10
            yticks(0:0.1:0.5)
            % yticklabels({'', '', '', '', ''})
        end
    
        if D == 1.8e-4        
            ylim([-0.05, 0.55])
            if q == 1
                title('(a) \enspace $D=1.8\times 10^{-4}, \enspace q=1$', 'Interpreter', 'Latex')
                leg = legend ;
                set(leg, 'Interpreter', 'Latex', 'Box', 'off', 'FontSize', 20, ...
                    'NumColumns', 2, 'Orientation', 'horizontal', 'Location', 'Best')
            elseif q == 4
                title('(b) \enspace $D=1.8\times 10^{-4}, \enspace q=4$', 'Interpreter', 'Latex')
            elseif q == 10
                title('(c) \enspace $D=1.8\times 10^{-4}, \enspace q=10$', 'Interpreter', 'Latex')
            end
    
        elseif D == 1.8e-3
            ylim([-0.05, 0.45]) 
            if q == 1
                title('(d) \enspace $D=1.8\times 10^{-3}, \enspace q=1$', 'Interpreter', 'Latex')
                leg = legend ;
                set(leg, 'Interpreter', 'Latex', 'Box', 'off', 'FontSize', 20, ...
                    'NumColumns', 2, 'Orientation', 'horizontal', 'Location', 'Best')
            elseif q == 4
                title('(e) \enspace $D=1.8\times 10^{-3}, \enspace q=4$', 'Interpreter', 'Latex')
            elseif q == 10
                title('(f) \enspace $D=1.8\times 10^{-3}, \enspace q=10$', 'Interpreter', 'Latex')
            end
            yticks(0:0.1:0.4)
    
        elseif D == 1.8e-2
            ylim([-0.01, 0.11]) 
            if q == 1
                title('(g) \enspace $D=1.8\times 10^{-2}, \enspace q=1$', 'Interpreter', 'Latex')
                leg = legend ;
                set(leg, 'Interpreter', 'Latex', 'Box', 'off', 'FontSize', 20, ...
                    'NumColumns', 2, 'Orientation', 'horizontal', 'Position',[0.156439461172742 0.197161486850394 0.152006992636316 0.0902696365767878])
            elseif q == 4
                title('(h) \enspace $D=1.8\times 10^{-2}, \enspace q=4$', 'Interpreter', 'Latex')
            elseif q == 10
                title('(i) \enspace $D=1.8\times 10^{-2}, \enspace q=10$', 'Interpreter', 'Latex')
            end
            yticks(0:0.02:0.1)
            xlabel('$p$') ; 
        end
    
  
    end
end

set(gcf, 'Position', [102           1        1262         853])
% print('robin_P_vs_N_combined', '-dsvg') ;
