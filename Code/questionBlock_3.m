function [w_logistic_regression, best_combination] = questionBlock_3(original_x,y)
    num_instances = size(original_x,1);
    x = [ones(1, num_instances); original_x'];
    
    learning_rate = [0.1 0.01 0.001];
    max_iterations = [100 1000 10000];
    tolerance = [0.001 0.0001 0.00001];

    [w_logistic_regression, w_total, js_total, best_combination] = ...
            tryCombinations(x, y, learning_rate, max_iterations, tolerance);

    learn_size = length(learning_rate);
    max_it_size = length(max_iterations);
    toler_size = length(tolerance);

    max_combinations = max([learn_size max_it_size toler_size]);
    num_iter = 1;
    for i = 1:learn_size
        figure('name',['Convergence curve -> Learning rate: ' num2str(learning_rate(i))]);
        for j = 1:max_it_size
            for k = 1:toler_size
                js = js_total{num_iter};
                subplot(3,max_combinations,(j-1)*toler_size+k);
                plot((1:size(js,1))',js);
                title(['Max iterations: ' num2str(max_iterations(j)) ' Tolerance: ' num2str(tolerance(k))])
                xlim([0 size(js,1)]);
                ylim([0 10]);
                xlabel('Iterations')
                ylabel('Cost function')
                num_iter = num_iter + 1;
            end
        end
    end

    num_iter = 1;
    for i = 1:learn_size
        figure('name', ['Fitting on the data -> Learning rate: ' num2str(learning_rate(i))]);
        for j = 1:max_it_size
            for k = 1:toler_size
                subplot(3,max_combinations,(j-1)*toler_size+k);
                title(['Max iterations: ' num2str(max_iterations(j)) ' Tolerance: ' num2str(tolerance(k))])
                xlabel('x')
                ylabel('y')
                hold on
                plot(original_x,x'*w_total{num_iter})
                scatter(original_x,y)
                num_iter = num_iter + 1;
            end
        end
    end
end