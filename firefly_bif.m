% code to create a bifurcation diagram for the original firefly model

%% analytical
muspan = linspace(-1,1,1000);
stable = asin(muspan);
unstable = pi - asin(muspan);
figure
hold on
plot(muspan, stable, '-b')
plot(muspan, unstable, '--b')
xline(0)
yline(0)
%yline(pi)
%yline(pi/2)
ylim([-pi/2, 3*pi/2])
xlabel('\mu')
ylabel('\phi^*')

%% numerical - don't run this; incomplete and I don't rlly know if it will work

% N = 10;   % number of "equilibria" to save per 'a' value
% M = 100; % number of different 'a'-values to try (resolution in diagram)
% 
% % initialize bifurcation diagram plotting data
% range = linspace(0,1,M);  % x-axis, values of 'a' to choose from
% equila = zeros(N,M);       % y-axis, long term behavior per 'a' value
% equill = zeros(N,M);
% equilp = zeros(N,M);
% % parameters (choose 'a' as the bifurcation parameter, do not define 'a')
% cel = 0.012;
% cea = 0.009;
% cpa = 0.004;
% mul = 0.267;
% mup = 0;
% mua = 0.0036; %0.97; %1; %0.95; %0.7; %0.6; %0; %0.0036;
% b = 7.48;
% 
% for i = 1:M      % iterate over all the different values of 'a'
%     a = range(i);        % pick value of 'a' for this iteration
% 
%     y = zeros(3, 10000);  % re-initialize population matrix
%     y(1, 1) = 250;        % moth initial condition
%     y(2, 1) = 5;         % ragwort plant biomass initial condition
%     y(3, 1) = 100;
% 
%     ode45(fireflyodes, )
