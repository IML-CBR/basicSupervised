function step = gradient(x,w,y)
    N = size(x,2);
    step = -x*(x'*w-y)/N;
end