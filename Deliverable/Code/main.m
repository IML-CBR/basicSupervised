%% LOAD DATASET AND INITIALIZE VARIABLES
clear all;
close all;
tmp = matlab.desktop.editor.getActive;
cd(fileparts(tmp.Filename));

data = load('..\Data\reg_data_set_1');


original_x = data.x;
y = data.y;


% order the data in ascendent x ascendent order
[original_x, order] = sort(original_x, 'ascend'); %# sort cols low to high
y = y(order);

num_instances = size(original_x,1);

x = [ones(1, num_instances); original_x'];


%% QUESTION BLOCK 1
scatter(original_x,y)
title('Relation between x and y')
xlabel('x')
ylabel('y')


%% QUESTION BLOCK 2
w_linear = analyticLinearRegression(x,y);
figure;
plot(original_x,x'*w_linear);
title('Analytical solution')
xlabel('x')
ylabel('y')
hold on
scatter(original_x,y)

%% QUESTION BLOCK 3

[w_logistic_regression, best_combination] = questionBlock_3(original_x,y);


%% QUESTION BLOCK 4
[w_logistic_regression_v2, best_combination_v2] = questionBlock_4(original_x,y);


%% Comparison between the 3 methods
figure;
plot(original_x,x'*w_linear,original_x,x'*w_logistic_regression,original_x,x'*w_logistic_regression_v2);
title('Comparision of three methods')
xlabel('x')
ylabel('y')
legend('Analytical solution','First gradient descent', 'Second gradient descent')
hold on
scatter(original_x,y)

%% QUESTION BLOCK 5
z = [ones(num_instances,1) original_x original_x.^2 original_x.^3];
z = z';
figure;
w_linear_v2 = analyticLinearRegression(z,y);
plot(original_x,z'*w_linear_v2);
title('Analytical solution')
xlabel('x')
ylabel('y')
hold on
scatter(original_x,y)

%% QUESTION BLOCK 7
questionBlock_7(original_x,y);

%% FINAL RESULTS
fprintf('The weights obtained by the analytical method are:\n')
w_linear

fprintf('\n\nThe weights obtained by the gradient descent method are:\n')
w_logistic_regression
fprintf('The best parameters of the analytical method are:\n')
best_combination

fprintf('\n\nThe weights obtained by the updated gradient descent method are:\n')
w_logistic_regression_v2
fprintf('The best parameters of the updated gradient descent method are:\n')
best_combination_v2

fprintf('The weights obtained by the analytical method with 4 parameters are:\n')
w_linear_v2