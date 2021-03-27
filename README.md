# `least_squares_fit`

Fits a linear, polynomial, power, exponential, or logarithmic model to a set of data using the method of least squares.


## Syntax

`[c0,c1] = least_squares_fit(x,y)}`\
`[c0,c1] = least_squares_fit(x,y,'linear')}`\
`c = least_squares_fit(x,y,'poly',n)}`\
`[a,b] = least_squares_fit(x,y,'power')}`\
`[a,b] = least_squares_fit(x,y,'exp')}`\
`[a,b] = least_squares_fit(x,y,'log')}`


## Description

`[c0,c1] = least\_squares\_fit(x,y)} returns the coefficients \texttt{c0} and \texttt{c1} for the linear least squares fit $y=c_{0}+c_{1}x$ to a set of data defined by the vectors \texttt{x} (independent variable) and \texttt{y} (dependent variable).
            
`[c0,c1] = least\_squares\_fit(x,y,'linear')` returns the coefficients \texttt{c0} and \texttt{c1} for the linear least squares fit $y=c_{0}+c_{1}x$ to a set of data defined by the vectors \texttt{x} (independent variable) and \texttt{y} (dependent variable).
 
`c = least\_squares\_fit(x,y,'poly',n)` returns the coefficient vector $\vec{c}=(c_{0},...,c_{n})^T$ for the $n$\Th\ degree polynomial least squares fit $y=c_{0}+c_{1}x+\dots+c_{n}x^{n}$ to a set of data defined by the vectors \texttt{x} (independent variable) and \texttt{y} (dependent variable).

`[a,b] = least\_squares\_fit(x,y,'power')` returns the coefficients \texttt{a} and \texttt{b} for the power least squares fit $y=ax^{b}$ to a set of data defined by the vectors \texttt{x} (independent variable) and \texttt{y} (dependent variable).

`[a,b] = least\_squares\_fit(x,y,'exp')` returns the coefficients \texttt{a} and \texttt{b} for the exponential least squares fit $y=ae^{bx}$ to a set of data  defined by the vectors \texttt{x} (independent variable) and \texttt{y} (dependent variable).

`[a,b] = least\_squares\_fit(x,y,'log')` returns the coefficients \texttt{a} and \texttt{b} for the logarithmic least squares fit $y=a+b\ln{x}$ to a set of data defined by the vectors \texttt{x} (independent variable) and \texttt{y} (dependent variable).
            

`root = secant_method(f,x0)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the root. The default tolerance and maximum number of iterations are `TOL = 1e-12` and `imax = 1e6`, respectively.

`root = secant_method(f,x0,TOL)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the root and `TOL` is the tolerance. The default maximum number of iterations is `imax = 1e6`.

`root = secant_method(f,x0,[],imax)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the root and `imax` is the maximum number of iterations. The default tolerance is `TOL = 1e-12`.

`root = secant_method(f,x0,TOL,imax)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the root, `TOL` is the tolerance, and `imax` is the maximum number of iterations.

`root = secant_method(__,'all')` returns a vector, where the first element of this vector is the initial guess, all intermediate elements are the intermediate estimates of the root, and the last element is the converged root. This identifier 'all' may be appended to any of the syntaxes used above.


## Additional Documentation and Examples

See "DOCUMENTATION.pdf" for additional documentation and examples.
