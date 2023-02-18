function y = mixed_generator(a, m, u, N)
    persistent seed;
    if isempty(seed)
        seed = 2^15;
    end
    x = zeros(1,N);
    y = zeros(1,N);
    x(1) = seed;
    for i=2:N
        x(i) = mod(a * x(i-1) + u, m)  ;
        y(i) = x(i) / m;
        if ~isfinite(y(i)) 
            then
            y(i) = y(i-1);
        end
    end
    seed = x(N);
end
