w1 = 0.1;
w2 = 0.4;
w3 = 0.7;
A = 0.7;

x0 = [w1; w2; w3];

x0_2 = [0.2, 0.25, 0.3]

% % llama model
% F = @(x) [w1 + (A/3)*(sin(x(2)-x(1)) + sin(x(3)-x(1)));
%           w2 + (A/3)*(sin(x(1)-x(2)) + sin(x(3)-x(2)));
%           w3 + (A/3)*(sin(x(1)-x(3)) + sin(x(2)-x(3)))];


% pairwise differences
f = @(x) [(w1 + (A/3)*(sin(x(2)-x(1)) + sin(x(3)-x(1))))-(w2 + (A/3)*(sin(x(1)-x(2)) + sin(x(3)-x(2))));
          (w2 + (A/3)*(sin(x(1)-x(2)) + sin(x(3)-x(2))))-(w3 + (A/3)*(sin(x(1)-x(3)) + sin(x(2)-x(3))));
          (w3 + (A/3)*(sin(x(1)-x(3)) + sin(x(2)-x(3))))-(w1 + (A/3)*(sin(x(2)-x(1)) + sin(x(3)-x(1))))];

EP = fsolve(f, x0)

J = [-(A/3)*(cos(EP(2)-EP(1)) + cos(EP(3)-EP(1))), (A/3)*cos(EP(2)-EP(1)), (A/3)*cos(EP(3)-EP(1));
     (A/3)*cos(EP(1)-EP(2)), -(A/3)*(cos(EP(1)-EP(2)) + cos(EP(3)-EP(2))), (A/3)*cos(EP(3)-EP(2));
     (A/3)*cos(EP(1)-EP(3)), (A/3)*cos(EP(2)-EP(3)), -(A/3)*(cos(EP(1)-EP(3)) + cos(EP(2)-EP(3)))];

pair_J = [J(1,1)-J(2,1), J(1,2)-J(2,2), J(1,3)-J(2,3);
          J(2,1)-J(3,1), J(2,2)-J(3,2), J(2,3)-J(3,3);
          J(3,1)-J(1,1), J(3,2)-J(1,2), J(3,3)-J(1,3)];

[V, lambda] = eig(J);





