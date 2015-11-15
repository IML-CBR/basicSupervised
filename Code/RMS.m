function value = RMS( x,y,w )

    value = sqrt(sum((x'*w-y).^2));

end

