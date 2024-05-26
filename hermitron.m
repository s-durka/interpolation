function y = hermitron(t, x, F, dF1, dFn)
    % Hermite interpolation with derivatives for function F
    % x - interpolation points
    % F - function values at x
    % dF1: dF1(i) = F'(x(i))
    % dFn: dFn(i) = F^(n)(x(i)) (i-th derivative at x(n))
    % y - interpolated values at t

    n = length(x);
    if isempty(dF1) || isempty(dFn)
        k = 0;
    else
        k = length(dF1); % assuming dF1 and dFn have the same number of elements
    end
    
    % Total number of elements in the Hermite basis
    total = n + 2 * k; % Adjust based on how many derivatives are known at each end

    indexes = zeros(1, total); 
    z = zeros(1, total);
    Q = zeros(1, total);

    % set indexes for the first and last k points
    for i = 1:k
        indexes(i) = 1;
        indexes(total-i+1) = n;
    end

    % set indexes for the rest of the points
    for i = k+1:total-k
        indexes(i) = i - k;
    end

    % indexes

    for i = 1:total
        z(i) = x(indexes(i));
        Q(i) = F(indexes(i));
    end

    % Calculate divided differences with derivative conditions
    for i = 2:total
        for j = total:-1:i
            from = j-i+1;
            to = j;
            % if indexes(j) == indexes(j-i+1) % if f_{ll...lll} then use (i-1)-th derivative
            if indexes(from) == indexes(to)
                if indexes(j) == 1
                    Q(j) = dF1(i-1)/factorial(i-1);
                else
                    Q(j) = dFn(i-1)/factorial(i-1);
                end
            else
                Q(j) = (Q(j) - Q(j-1)) / (z(j) - z(j-i+1));
            end
        end
    end

    % evaluate the Hermite polynomial at each point in t
    % Horner's method
    y = zeros(size(t));
    for k = 1:length(t)
        p = Q(total);
        for i = total-1:-1:1
            p = (t(k) - z(i)) * p + Q(i);
        end
        y(k) = p;
    end
end

