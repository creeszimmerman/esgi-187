%Growth


N_width= 100;

channel_width = 10.^linspace(-4,2,N_width); %metres

channel_length = 10; %metres

epsilon  = channel_width/channel_length;


%Difffusion
kappa = 0.4;
f= 0.054;

%
Peclet = 1./(epsilon.*kappa).*sqrt(8/f);

epsilon2Peclet = epsilon.^2.*Peclet;



% at the wall - Clare
load('test.mat');
%% PLot



%% 
Height_so_that_eps2Pe_0p1 = 0.1*kappa*sqrt(f/8)*channel_length;

Height_so_that_eps2Pe_10p0 = 10*kappa*sqrt(f/8)*channel_length;

fig=  figure;
ax = axes;
ax.XScale='log';
ax.YScale='log';

set(gcf, 'Color', 'w');

fig.Position(3)=fig.Position(3)*1.2;
fig.Position(4)=fig.Position(4)*1.2;

fig.Position(2)=0;

xline(Height_so_that_eps2Pe_0p1)
xline(Height_so_that_eps2Pe_10p0)
xlabel('Channel height (m)', 'FontWeight', 'bold','FontName', 'Times')


%% 
sedimentation_velocity = 1e-4; %metres?

Sed_num_is_0p1 = sedimentation_velocity*channel_length./(0.1*channel_width);

Sed_num_is_10p0 = sedimentation_velocity*channel_length./(10.0*channel_width);


hold on
plot(channel_width,Sed_num_is_0p1,'-')

plot(channel_width,Sed_num_is_10p0,'-')

ylabel('Flow Velocity (m/s)','FontWeight', 'bold','FontName', 'Times')

plot(H,u, '-.') % CRZ
plot(0.0508,0.4,'rx')

text(5e-2, 1e-2, {'Advection', '& Diffusion', '& Sedimentation'},'FontName', 'Times')

text(5e-2, 1e1, {'Advection', '& Diffusion'},'FontName', 'Times')


text(5, 3e0, {'Advection'},'FontName', 'Times')

text(5, 1e-4, {'Advection', '& Sedimentation'},'FontName', 'Times')

text(0.15*1e-2, 0.5, {'Diffusion', '& Sedimentation'},'FontName', 'Times')

text(0.15*1e-2, 40, {'Diffusion'},'FontName', 'Times')

text(0.15*1e-2, 1e-5, {'Sedimentation'},'FontName', 'Times')
text(1e-1, 0.4*1e-5, {'Sedimentation'},'FontName', 'Times')
text(4, 0.2*1e-5, {'Sedimentation'},'FontName', 'Times')

annotation('textbox', [0.4, 0.9, 0.1, 0.1], ...
    'String', '\epsilon^2 Pe = 0.1', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center','FontSize',12,'FontName', 'Times');

annotation('textbox', [0.65, 0.9, 0.1, 0.1], ...
    'String', '\epsilon^2 Pe = 10.0', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center','FontSize',12,'FontName', 'Times');


annotation('textbox', [0.9, 0.25, 0.1, 0.1], ...
    'String', ' S = 0.1', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center','FontSize',12,'FontName', 'Times');

annotation('textbox', [0.9, 0.05, 0.1, 0.1], ...
    'String', 'S = 10.0', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center','FontSize',12,'FontName', 'Times');


box on
x_box = [0.025 0.1 0.1 0.025];
y_box = [0.1 0.1 1.2 1.2];

fill(x_box, y_box, [0.7 0.7 0.7], 'EdgeColor', 'none', ...
     'FaceAlpha', 0.3)  % RGB for grey


xlim([10^-3 10^2])
ylim([10^-6 10^2])
set(gca, 'FontName', 'Times') 
exportgraphics(gcf, 'regime_map.jpg', 'BackgroundColor', 'none', 'Resolution', 600)
