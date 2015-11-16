function questionBlock_7(original_x,y)
    num_instances = size(original_x,1);
    train_x = (original_x(1:(num_instances/2),1))';
    test_x = (original_x((num_instances/2+1):num_instances,1))';
    train_y = y(1:(num_instances/2),1);
    test_y = y((num_instances/2+1):num_instances,1);

    figure
    hold on
    subplot(2,2,1:2);
    scatter(train_x',train_y)
    title('Comparing different degrees')
    xlabel('x')
    ylabel('y')
    
    subplot(2,2,3);
    title('RMS evolution')
    xlabel('p')
    ylabel('rms')
    
    subplot(2,2,4);
    title('RMS evolution - Wider y axis')
    xlabel('p')
    ylabel('rms')
    
    colors = {'green' 'red' 'black' 'magenta' 'yellow' 'cyan'};
    labels_legend = {'P=1','P=2','P=3','P=4','P=5','P=6'};
    for p=1:6
        train_z = ones(p+1,num_instances/2);
        test_z = ones(p+1,num_instances/2);
        for i=1:p
            train_z(i+1,:) = train_x.^i;
            test_z(i+1,:) = test_x.^i;
        end

        w_current = analyticLinearRegression(train_z,train_y);

        subplot(2,2,1:2);
        axis([0 0.5 -Inf Inf])
        hold on;
        b(p)=plot(train_x,train_z'*w_current,'Color',colors{p});
        legend(b(1:p),labels_legend(1:p))

        subplot(2,2,3);
        axis([0 8 0 100])
        legend('Train RMS','Test RMS')
        hold on;
        rms_train = RMS(train_z,train_y,w_current);
        rms_test = RMS(test_z,test_y,w_current);
        scatter(p,rms_train,'MarkerEdgeColor',[0 .5 0]);
        scatter(p,rms_test,'MarkerEdgeColor',[0 0 .5]);
        
        subplot(2,2,4);
        axis([0 8 0 1000])
        legend('Train RMS','Test RMS')
        hold on;
        rms_train = RMS(train_z,train_y,w_current);
        rms_test = RMS(test_z,test_y,w_current);
        scatter(p,rms_train,'MarkerEdgeColor',[0 .5 0]);
        scatter(p,rms_test,'MarkerEdgeColor',[0 0 .5]);
    end
end