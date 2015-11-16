function j = costFunction(x,y,w)
    N = size(x,2);
    j = (x'*w-y)'*(x'*w-y)/(2*N);
end