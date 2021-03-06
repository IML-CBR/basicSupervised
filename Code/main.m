%% LOAD DATASET AND INITIALIZE VARIABLES
clear all;
close all;
tmp = matlab.desktop.editor.getActive;
cd(fileparts(tmp.Filename));

data = load('reg_data_set_1');


original_x = data.x;
y = data.y;


% order the data in ascendent x ascendent order
[original_x, order] = sort(original_x, 'ascend');       %# sort cols low to high
y = y(order);

num_instances = size(original_x,1);

x = [ones(1, num_instances); original_x'];


%% QUESTION BLOCK 1
scatter(original_x,y)
title('Relation between x and y')
xlabel('x')
ylabel('y')


%% QUESTION BLOCK 2  JULI�
w_linear = analyticLinearRegression(x,y);
figure;
plot(original_x,x'*w_linear);
title('Analytical solution')
xlabel('x')
ylabel('y')
hold on
scatter(original_x,y)

%% QUESTION BLOCK 3  XAVI

[w_logistic_regression, best_combination] = questionBlock_3(original_x,y);


%% QUESTION BLOCK 4  XAVI
[w_logistic_regression_v2, best_combination_v2] = questionBlock_4(original_x,y);


%% Comparison between the 3 methods
plot(original_x,x'*w_linear,original_x,x'*w_logistic_regression,original_x,x'*w_logistic_regression_v2);
title('Comparision of three methods')
xlabel('x')
ylabel('y')
legend('Analytical solution','First gradient descent', 'Second gradient descent')
hold on
scatter(original_x,y)

%% QUESTION BLOCK 5  JULI�
z = [ones(num_instances,1) original_x original_x.^2 original_x.^3];
z = z';
figure;
w_linear = analyticLinearRegression(z,y);
plot(original_x,z'*w_linear);
title('Analytical solution')
xlabel('x')
ylabel('y')
hold on
scatter(original_x,y)

%% QUESTION BLOCK 7  XAVI
questionBlock_7(original_x,y);

