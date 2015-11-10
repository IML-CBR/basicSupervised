tmp = matlab.desktop.editor.getActive;
cd(fileparts(tmp.Filename));

data = load('reg_data_set_1');


original_x = data.x;
num_instances = size(original_x,1);

x = [ones(num_instances,1) original_x];
y = data.y;

% QUESTION BLOCK 1
scatter(original_x,y)
title('Relation between x and y')
xlabel('x')
ylabel('y')


% QUESTION BLOCK 2  JULIÀ
w = inv(x'*x)*x'*y;
plot(original_x,x*w)
hold on
scatter(original_x,y)

% QUESTION BLOCK 3  XAVI

% QUESTION BLOCK 4  XAVI

% QUESTION BLOCK 5  JULIÀ
z = [ones(num_instances,1) original_x original_x.^2 original_x.^3];

% QUESTION BLOCK 7  XAVI
z_v = [ones(num_instances,1) original_x original_x.^2 original_x.^3];

