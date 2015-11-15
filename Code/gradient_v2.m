function step = gradient_v2(x,w,y)
    N = size(x,2);
    Ax = x*(x'*w-y)/N;
    step = - Ax / norm(Ax);
end