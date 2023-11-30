function dxdt = llama_model(x,t,w,A)
    % each column is a different firefly
    dxdt = [w(1) + (A/3 * (sin(x(2)-x(1))+sin(x(3)-x(1))));
            w(2) + (A/3 * (sin(x(3)-x(2))+sin(x(1)-x(2))));
            w(3) + (A/3 * (sin(x(2)-x(3))+sin(x(1)-x(3))))];