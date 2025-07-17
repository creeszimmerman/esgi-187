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
xlabel('Channel height (m)', 'FontWeight', 'bold')


%% 
sedimentation_velocity = 1e-4; %metres?

Sed_num_is_0p1 = sedimentation_velocity*channel_length./(0.1*channel_width);

Sed_num_is_10p0 = sedimentation_velocity*channel_length./(10.0*channel_width);


hold on
plot(channel_width,Sed_num_is_0p1,'-')

plot(channel_width,Sed_num_is_10p0,'-')

ylabel('Flow Velocity (m/s)','FontWeight', 'bold')

plot(H,u, '-.') % CRZ
plot(0.0508,0.4,'rx')

text(5e-2, 1e-2, {'Advection', '& Diffusion', '& Sedimentation'})

text(5e-2, 3e0, {'Advection', '& Diffusion'})


text(5, 3e0, {'Advection'})

text(5, 1e-4, {'Advection', '& Sedimentation'})

text(3e-4, 1, {'Diffusion', '& Sedimentation'})

text(8e-4, 40, {'Diffusion'})

annotation('textbox', [0.4, 0.9, 0.1, 0.1], ...
    'String', '\epsilon^2 Pe=0.1', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center','FontSize',12);

annotation('textbox', [0.65, 0.9, 0.1, 0.1], ...
    'String', '\epsilon^2 Pe=10.0', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center','FontSize',12);


annotation('textbox', [0.9, 0.25, 0.1, 0.1], ...
    'String', ' S=0.1', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center','FontSize',12);

annotation('textbox', [0.9, 0.05, 0.1, 0.1], ...
    'String', 'S=10.0', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center','FontSize',12);


box on
exportgraphics(gcf, 'myplot.jpg', 'BackgroundColor', 'none', 'Resolution', 600)