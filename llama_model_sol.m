% omega and A values
w1 = 0.1;
w2 = 0.4;
w3 = 0.7;
A = 0.7;

%system of ODE's
f = @(t,y) [w1 + (A/3 * (sin(y(2)-y(1))+sin(y(3)-y(1))));
    w2 + (A/3 * (sin(y(3)-y(2))+sin(y(1)-y(2))));
    w3 + (A/3 * (sin(y(2)-y(3))+sin(y(1)-y(3))))];

% initial values for system
IV = [w1, w2, w3];

% time steps
tfinal = 100;

% solve ODE
[t,y] = ode45(f, [0, tfinal], IV);
ymod2pi = mod(y, 2*pi);

figure
plot(t, ymod2pi, '-o')
xlabel("Time")
ylabel("Firefly Phases")
legend('Firefly 1', 'Firefly 2', 'Firefly 3')
set(gca, 'FontSize', 16)


figure
plot3(ymod2pi(:,1), ymod2pi(:, 2), ymod2pi(:, 3))
hold on
xlabel("Firefly 1's Phase")
ylabel("Firefly 2's Phase")
zlabel("Firefly 3's Phase")
set(gca, 'FontSize', 16)
hold off



