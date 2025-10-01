

close all ; clear ; clc ; 

azure = [0, 128, 255]/255 ;
coral = [255, 127, 80]/255 ; 
jade = [0, 168, 107]/255 ;


%%

qset = [1, 4, 10] ; 
Nset = 2:2:6 ; 

figure(1) ; clf ; 
tiledlayout(1,3)

cl_set = {azure, coral, jade} ;
style_set = {'-', '--', ':'} ;


%%

nexttile 

q = 1 ;

for j = 1:length(Nset)
    N = Nset(j) ;
    load(['N=', num2str(N), '.mat']) ;
    plot(pp(abs(qq-q) < 1e-5), PP(abs(qq-q) < 1e-5), style_set{j}, 'Color', cl_set{j}, ...
                 'LineWidth', 3, 'DisplayName', sprintf('$N=%i$', N)) ; hold on ;   
end

leg = legend ; 
set(leg, 'Box', 'off', 'Interpreter', 'Latex')
axis tight ; 
set(gcf, 'defaultTextInterpreter', 'Latex')
set(gca, 'FontSize', 25)
set(gca, 'TickLabelInterpreter', 'latex') ;
xlabel('$p$') ; ylabel('$P_\mathrm{bind}$')   
xlim([-0.5 10.5]) ; 
xticks(0:2:10) ;
ylim([-0.05 0.55]) ; 
yticks(0:0.1:0.5) ; 
grid on ;

leg = legend ; 
set(leg, 'Interpreter', 'Latex', 'Box', 'off', 'FontSize', 25, 'Position', [0.2182    0.3613    0.0822    0.2328])

title('(a) \enspace $q=1$', 'Interpreter', 'Latex', 'Units', 'normalized', 'Position', [0.2 1.0])
        


%%

nexttile

q = 4 ;

for j = 1:length(Nset)
    N = Nset(j) ;
    load(['N=', num2str(N), '.mat']) ;
    plot(pp(abs(qq-q) < 1e-5), PP(abs(qq-q) < 1e-5), style_set{j}, 'Color', cl_set{j}, ...
                 'LineWidth', 3, 'DisplayName', sprintf('$N=%i$', N)) ; hold on ;   
end

set(gcf, 'defaultTextInterpreter', 'Latex')
set(gca, 'FontSize', 25)
set(gca, 'TickLabelInterpreter', 'latex') ;
xlabel('$p$') ;
xlim([-0.5 10.5]) ; 
xticks(0:2:10) ;
ylim([-0.05 0.55]) ; 
yticks(0:0.1:0.5) ; 
% yticklabels({'', '', '', '', ''})
grid on ;

title('(b) \enspace $q=4$', 'Interpreter', 'Latex', 'Units', 'normalized', 'Position', [0.2 1.0])



%%

nexttile

q = 10 ; 

for j = 1:length(Nset)
    N = Nset(j) ;
    load(['N=', num2str(N), '.mat']) ;
    plot(pp(abs(qq-q) < 1e-5), PP(abs(qq-q) < 1e-5), style_set{j}, 'Color', cl_set{j}, ...
                 'LineWidth', 3, 'DisplayName', sprintf('$N=%i$', N)) ; hold on ;   
end

set(gcf, 'defaultTextInterpreter', 'Latex')
set(gca, 'FontSize', 25)
set(gca, 'TickLabelInterpreter', 'latex') ;
xlabel('$p$') ; 
xlim([-0.5 10.5]) ; 
xticks(0:2:10) ;
ylim([-0.05 0.55]) ; 
yticks(0:0.1:0.5) ; 
% yticklabels({'', '', '', '', ''})
grid on ;

title('(c) \enspace $q=10$', 'Interpreter', 'Latex', 'Units', 'normalized', 'Position', [0.2 1.0])


%%

set(gcf, 'Position', [106         299        1334         408])

annotation('rectangle',[0.02 0.03 0.97 0.97], 'Color','w');

% exportgraphics(gcf, 'P_vs_N.pdf')
% print('P_vs_N', '-dsvg')


