%% define the ODE and parameters
% define stimulus
S = 1;

% define w and A
w = 0.5;
A = 0.1;

% define initial conditions
IV = 0;

% define timesteps
tfinal = 50;

% ode
f = @(t,x) w + (A/size(w,1)).*sin(S - x);

%% Solve the ODE
options = odeset('RelTol', 1e-10, 'AbsTol', 1e-10);
[t,x] = ode45(f, 0:0.001:tfinal, IV, options);
xmod2pi = mod(x,2*pi);
ex = cos(xmod2pi);
why = sin(xmod2pi);

%% plot the trajectory
%plot(t,ex,t,why)
plot(t,xmod2pi)
