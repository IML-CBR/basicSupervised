function [w, js] = descentLinearRegression_v2(x,y,...
                                    learning_rate, max_num_iterations,tolerance)
    num_parameters = size(x,1);
    w = zeros(num_parameters,1);
    j = costFunction(x,y,w);
    j_previous = -1;
    
    js = j;
    
    error_threshold = 1;
    num_iterations = 1;
    while j > error_threshold && num_iterations < max_num_iterations && ...
                abs(j_previous-j) > tolerance
        j_previous = j;
        num_iterations = num_iterations + 1;
        step = gradient_v2(x,w,y);
        w = w + learning_rate*step;
        j = costFunction(x,y,w);
        
        
        js = [js; j];
%       plot(num_iterations, j,'.');
%       pause(0.01);
    end
end