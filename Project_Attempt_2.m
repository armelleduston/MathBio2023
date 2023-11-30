%% define the ODE and parameters
% movie name
movie_name = 'Movie_orig_model_sync';

% define stimulus
S = 1;

% parameters for llama model
w = 0.8;
A = 0.5;
u = 1;

% parameters for llama model
%w = [0.1;0.4;0.7];
%A = 0.5;

% define initial conditions\
IV = [0,pi];
%IV = w';

% define timesteps
tfinal = 100;

% ode
%f = @(t,x) w + (A/size(w,1)).*sin(S - x);

% modulate between these two to go between original model and llama model
f = @(t,x) fireflyodes(x,t,u,w,A);
%f = @(t,x) llama_model(x,t,w,A);

%% Solve the ODE
options = odeset('RelTol', 1e-10, 'AbsTol', 1e-10);
[t,x] = ode45(f, 0:0.1:tfinal, IV, options);
xmod2pi = mod(x,2*pi);
ex = cos(xmod2pi);
why = sin(xmod2pi);

%% plot the trajectory
%plot(t,ex,t,why)
plot(t,xmod2pi)
%xlim([tfinal*(99/100), tfinal])

%% visualization
matrix = Traj2Vis(xmod2pi, 0.2*pi);
FireFlyMovie(matrix, movie_name)
%image(matrix(:,:,1))

%% see if they've reached synch
phasediff = x(:,1) - x(:,2);
figure
plot(t,phasediff, 'LineWidth', 3)
set(gca, 'FontSize', 16)
xlabel('time')
ylabel('Difference Between Phases')
%title('Synchronization Check')
