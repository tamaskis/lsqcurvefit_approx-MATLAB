%==========================================================================
%
% least_squares_fit  Fits a linear, polynomial, power, exponential, or 
% logarithmic model to a set of data using linear least squares.
%
%   [c,r2,eqn] = least_squares_fit(x,y)
%   [c,r2,eqn] = least_squares_fit(x,y,'linear')
%   [c,r2,eqn] = least_squares_fit(x,y,'poly',n)
%   [c,r2,eqn] = least_squares_fit(x,y,'power')
%   [c,r2,eqn] = least_squares_fit(x,y,'exp')
%   [c,r2,eqn] = least_squares_fit(x,y,'log')
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-06-09
%
%--------------------------------------------------------------------------
%
% MATLAB Central File Exchange: https://www.mathworks.com/matlabcentral/fileexchange/93710-linear-least-squares-curve-fitting-least_squares_fit
% GitHub: https://github.com/tamaskis/least_squares_fit-MATLAB
%
% See EXAMPLES.mlx for examples and "DOCUMENTATION.pdf" for additional 
% documentation. Both of these files are included with the download.
%
%--------------------------------------------------------------------------
%
% -------
% INPUTS:
% -------
%   x       - (1×m or m×1) independent variable data
%   y       - (1×m or m×1) dependent variable data
%   model   - (OPTIONAL) (char) 'linear', 'poly', 'power', 'exp', or 'log'
%   n       - (OPTIONAL) (1×1) degree of approximating polynomial
%
% --------
% OUTPUTS:
% --------
%   c       - (2×1 or n×1) coefficient vector describing fit:
%               --> [m,b] - linear fit
%               --> [c0,...,cn] - polynomial fit
%               --> [a,b] - power, exponential, and logarithmic fits
%   r2      - (1×1) coefficient of determination
%   eqn     - (string) string storing fitted equation (includes "$" signs,
%             so make sure to enable the LaTeX interpreter when using "eqn"
%             in plots)
%
% -----
% NOTE:
% -----
%   --> linear fit:         y=m*x+b
%   --> polynomial fit:     y=c0+c1*x+...+cn*x^n
%   --> power fit:          y=a*x^b
%   --> exponential fit:    y=a*e^(b*x)
%   --> logarithmic fit:    y=a+b*ln(x)
%
%==========================================================================
function [c,r2,eqn] = least_squares_fit(x,y,model,n)
    
    % transposes data vectors to column vectors if needed
    if size(x,1) < length(x)
        x = x';
    end
    if size(y,1) < length(y)
        y = y';
    end
    
    % defaults to linear fit if "model" not specified
    if nargin == 2
        model = 'linear';
    end
    
    % performs linearization and sets degree of approximating polynomial
    if strcmp(model,'linear')
        n = 1;
    elseif strcmp(model,'power')
        x = log(x);
        y = log(y);
        n = 1;
    elseif strcmp(model,'exp')
        y = log(y);
        n = 1;
    elseif strcmp(model,'log')
        x = log(x);
        n = 1;
    end

    % determines number of data points
    m = length(y);
    
    % sets up X matrix
    X = zeros(m,n+1);
    for i = 1:m
        for j = 1:(n+1)
            X(i,j) = x(i)^(j-1);
        end
    end
    
    % least squares solution to the normal equations (i.e. least squares
    % coefficient vector)
    a_hat = inv(X'*X)*(X')*y;
    
    % predicted values (evaluation of polynomial or linearized fit)
    f = zeros(length(x),1);
    for i = 1:(n+1)
        f = f+a_hat(i)*x.^(i-1);
    end
    
    % mean of y-values of original data
    y_bar = mean(y);
    
    % coefficient of determination
    SS_tot = sum((y-y_bar).^2);
    SS_res = sum((y-f).^2);
    r2 = 1-(SS_res/SS_tot);
    
    % coefficients for non-polynomial models
    if strcmp(model,'linear')
        m = a_hat(2);
        b = a_hat(1);
    elseif strcmp(model,'exp') || strcmp(model,'power')
        a = exp(a_hat(1));
        b = a_hat(2);
    elseif strcmp(model,'log')
        a = a_hat(1);
        b = a_hat(2);
    end
    
    % model coefficient vector
    if strcmp(model,'linear')
        c = [m;b];
    elseif strcmp(model,'poly')
        c = a_hat;
    elseif strcmp(model,'exp') || strcmp(model,'power') || strcmp(model,...
            'log')
        c = [a;b];
    end
    
    % creates string storing equation (made to be compatible with LaTeX
    % interpreter)
    if strcmp(model,'linear')
        eqn = "$y="+m+"x"+"+"+b+"$";
    elseif strcmp(model,'poly')
        eqn = "$y="+a_hat(1);
        for i = 2:(n+1)
            if i == 2
                eqn = eqn+"+"+a_hat(i)+"x";
            else
                eqn = eqn+"+"+a_hat(i)+"x^{"+(i-1)+"}";
            end
        end
        eqn = eqn+"$";
    elseif strcmp(model,'power')
        eqn = "$y="+a+"x^{"+b+"}$";
    elseif strcmp(model,'exp')
        eqn = "$y="+a+"e^{"+b+"x}$";
	elseif strcmp(model,'log')
        eqn = "$y="+a+"+"+b+"\ln{x}$";
    end
    
end