function [w_best, w_total, js_total, best_combination] = tryCombinations(x, y, learning_rate, max_iterations, tolerance);
    learn_size = length(learning_rate);
    max_it_size = length(max_iterations);
    toler_size = length(tolerance);

    js_total = cell(learn_size*max_it_size*toler_size,1);
    w_total = cell(learn_size*max_it_size*toler_size,1);

    best_js = Inf;
    w_best = [0; 0];
    num_iter = 1;
    for i = 1:learn_size
        for j = 1:max_it_size
            for k = 1:toler_size
                [w_total{num_iter},js_total{num_iter}] = ...
                    descentLinearRegression(x,y,learning_rate(i),...
                            max_iterations(j),tolerance(k));
                if js_total{num_iter}(length(js_total{num_iter})) < best_js
                    w_best = w_total{num_iter};
                    best_js = js_total{num_iter};
                    best_combination = struct('learning_rate',learning_rate(i),...
                                            'max_iterations',max_iterations(j),...
                                            'tolerance',tolerance(k));
                end
                num_iter = num_iter+1;
            end
        end
    end
end