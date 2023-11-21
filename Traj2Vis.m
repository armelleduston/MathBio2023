function matrix = Traj2Vis(x, threshold)
% x is a matrix with N rows and T columns, where N is the number of
% fireflies and T is the number of timesteps
    xT = x';
    matrix1 = reshape(x, [size(xT,2), 1, size(xT,1)]);
    matrix1 = permute(matrix1, [3,1,2]);
    matrix1 = reshape(matrix1, [size(matrix1,1), 1, size(matrix1,2)]);
    %minval = min(matrix, [], 'all');
    %maxval = max(matrix, [], 'all');
    %matrix = 256/(maxval - minval)* matrix;
    matrix1(matrix1>threshold) = 255;
    matrix1(matrix1<=threshold) = 0;
    matrix = zeros(size(matrix1));
    matrix(matrix1==0) = 255;
    
