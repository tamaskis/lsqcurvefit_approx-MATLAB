% least_squares_fit  Fits a linear, polynomial, power, exponential, or 
% logarithmic model to a set of data using the method of least squares.
%
%   [c0,c1] = least_squares_fit(x,y) returns the coefficients "c0" and "c1"
%   for the linear least squares fit y=c0+c1*x to a set of data defined by 
%   the vectors "x" (independent variable) and "y" (dependent variable).
%
%   [c0,c1] = least_squares_fit(x,y,'linear') returns the coefficients "c0" 
%   and "c1" for the linear least squares fit y=c0+c1*x to a set of data
%   defined by the vectors "x" (independent variable) and "y" (dependent 
%   variable).
%
%   c = least_squares_fit(x,y,'poly',n) returns the coefficient vector 
%   c=(c0,...,cn)^T for the nth degree polynomial least squares fit 
%   y=c0+c1*x+...+cn*x^n to a set of data defined by the vectors "x" 
%   (independent variable) and "y" (dependent variable).
%
%   [a,b] = least_squares_fit(x,y,'power') returns the coefficients "a" and
%   "b" for the power least squares fit y=a*x^b to a set of data defined by
%   the vectors "x" (independent variable) and "y" (dependent variable).
%
%   [a,b] = least_squares_fit(x,y,'exp') returns the coefficients "a" and
%   "b" for the exponential least squares fit y=a*e^(b*x) to a set of data 
%   defined by the vectors "x" (independent variable) and "y" (dependent 
%   variable).
%
%   [a,b] = least_squares_fit(x,y,'log') returns the coefficients "a" and
%   "b" for the logarithmic least squares fit y=a+b*ln(x) to a set of data 
%   defined by the vectors "x" (independent variable) and "y" (dependent 
%   variable).
%
% GitHub: https://github.com/tamaskis/least_squares_fit-MATLAB
%
% See "DOCUMENTATION.pdf" for additional documentation and examples. 
% Examples can also be found in EXAMPLES.m. Both of these files are 
% included with the download.
%
% Copyright (c) 2021 Tamas Kis
% Last Update: 2021-03-26




%% FUNCTION

% INPUT: x - independent variable data
%        y - dependent variable data
%        model - 'linear', 'poly', 'power', 'exp', or 'log'
%        n - degree of approximating polynomial
% OUTPUT: three options, dependending on input for "model":
%           --> [c0,c1] - coefficients for linear fit
%           --> c - coefficient vector for polynomial fit
%           --> [a,b] - coefficients for power, exponential, or logarithmic
%                       fits
function varargout = least_squares_fit(x,y,model,n)
    
    % transposes data vectors to column vectors if not already
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
    
    % performs linearization if necessary and sets degree of approximating
    % polynomial needed
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
    
    % sets up A matrix
    A = zeros(m,n+1);
    for i = 1:m
        for j = 1:(n+1)
            A(i,j) = x(i)^(j-1);
        end
    end
    
    % least squares solution to the normal equations
    c = inv(A'*A)*(A')*y;
    
    % sets output variable depending on type of least squares problem
    if strcmp(model,'linear')
        varargout{1} = c(1); % c0 where c=(c0,c1)^T
        varargout{2} = c(2); % c1 where c=(c0,c1)^T
    elseif strcmp(model,'exp') || strcmp(model,'power')
        varargout{1} = exp(c(1)); % a=e^c0 where c=(c0,c1)^T
        varargout{2} = c(2); % b=c1 where c=(c0,c1)^T
    elseif strcmp(model,'log')
        varargout{1} = c(1); % a=c0 where c=(c0,c1)^T
        varargout{2} = c(2); % b=c1 where c=(c0,c1)^T
    else
        varargout{:} = c; % c=(c0,..,cn)^T for nth degree polynomial fit
    end
    
end