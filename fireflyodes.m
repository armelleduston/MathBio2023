function dxdt = fireflyodes(x,t,u,w,A)
    % the first column of x is the stimulus and the second column of x is
    % the affected firefly
    %dxdt = zeros(1,size(x,2));
    dxdt = [u;
           (w + (A/size(w,1)).*sin(x(1) - x(2)))];