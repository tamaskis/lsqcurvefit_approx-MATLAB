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

`[c0,c1] = least_squares_fit(x,y)` returns the coefficients `c0` and `c1` for the linear least squares fit <img src="https://latex.codecogs.com/svg.latex?y=c_{0}&plus;c_{1}x" title="y=c_{0}+c_{1}x" /> to a set of data defined by the vectors `x` (independent variable) and `y` (dependent variable).
            
`[c0,c1] = least\_squares\_fit(x,y,'linear')` returns the coefficients `c0` and `c1` for the linear least squares fit <img src="https://latex.codecogs.com/svg.latex?y=c_{0}&plus;c_{1}x" title="y=c_{0}+c_{1}x" /> to a set of data defined by the vectors `x` (independent variable) and `y` (dependent variable).
 
`c = least\_squares\_fit(x,y,'poly',n)` returns the coefficient vector $\vec{c}=(c_{0},...,c_{n})^T$ for the $n$\Th\ degree polynomial least squares fit $y=c_{0}+c_{1}x+\dots+c_{n}x^{n}$ to a set of data defined by the vectors `x` (independent variable) and `y` (dependent variable).

`[a,b] = least\_squares\_fit(x,y,'power')` returns the coefficients `a` and `b` for the power least squares fit <img src="https://latex.codecogs.com/svg.latex?y=ax^{b}" title="y=ax^{b}" /> to a set of data defined by the vectors `x` (independent variable) and `y` (dependent variable).

`[a,b] = least\_squares\_fit(x,y,'exp')` returns the coefficients `a` and `b` for the exponential least squares fit <img src="https://latex.codecogs.com/svg.latex?y=ae^{bx}" title="y=ae^{bx}" /> to a set of data  defined by the vectors `x` (independent variable) and `y` (dependent variable).

`[a,b] = least\_squares\_fit(x,y,'log')` returns the coefficients `a` and `b` for the logarithmic least squares fit <img src="https://latex.codecogs.com/svg.latex?y=a&plus;b\ln{x}" title="y=a+b\ln{x}" /> to a set of data defined by the vectors `x` (independent variable) and `y` (dependent variable).


## Additional Documentation and Examples

See "DOCUMENTATION.pdf" for additional documentation and examples.
