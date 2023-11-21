function FireFlyMovie(data_tensor, filename)

    Mtest = VideoWriter(filename, 'Uncompressed AVI');
    open(Mtest);

    [length_1, length_2, time_steps] = size(data_tensor);

    [DIM1, DIM2] = ndgrid(1:length_1, 1:length_2);

    %for i = 1:time_steps

        %slice = data_tensor(:, :, i);
        %slice(mask == 1) = NaN;
        %data_tensor(:, :, i) = slice;

    %end

    data_min = min(data_tensor(:, :, 1:end), [], 'all');
    data_max = max(data_tensor(:, :, 1:end), [], 'all');

    for i = 1:time_steps

        %contourf(DIM2, DIM1, data_tensor(:, :, i), "LineStyle", "none");
        image(DIM2,DIM1,data_tensor(:,:,i));

        %if (i == 1)            
            %clim('manual')
            %clim([data_min, data_max])
            colormap('gray')
           
            %colormap([1,1,1;0,0,0])
            %colorbar
            xlim([0.5,1.5])
            axis equal
            axis off
            set(gcf, 'ToolBar', 'none')
            hold on
        %end
        
        frame = getframe(gcf);
        writeVideo(Mtest, frame);
    end
    
    hold off
    close(Mtest)

end