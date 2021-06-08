# `least_squares_fit`

Fits a linear, polynomial, exponential, or logarithmic model to a set of data using linear least squares.


## Syntax

`[c,r2,eqn] = least_squares_fit(x,y)`\
`[c,r2,eqn] = least_squares_fit(x,y,'linear')`\
`[c,r2,eqn] = least_squares_fit(x,y,'poly',n)`\
`[c,r2,eqn] = least_squares_fit(x,y,'power')`\
`[c,r2,eqn] = least_squares_fit(x,y,'exp')`\
`[c,r2,eqn] = least_squares_fit(x,y,'log')`
  
  
## Description

`[c,r2,eqn] = least_squares_fit(x,y)` returns the model coefficient vector `c=[m,b]` for the linear fit <img src="https://latex.codecogs.com/gif.latex?\inline&space;y=\textrm{mx}+b"/> to a data set defined by the vectors `x` (independent variable) and `y` (dependent variable).

`[c,r2,eqn] = least_squares_fit(x,y,'linear')` does the exact same thing as the syntax above. 

`[c,r2,eqn] = least_squares_fit(x,y,'poly',n)` returns the model coefficient vector `c=[a0,...,an]` for the <img src="https://latex.codecogs.com/gif.latex?\inline&space;n^{\textrm{th}}"/> degree polynomial fit <img src="https://latex.codecogs.com/gif.latex?\inline&space;y=a_0&space;+a_1&space;x+a_2&space;x^2&space;+\cdots&space;+a_n&space;x^n"/> to a data set defined by the vectors `x` (independent variable) and `y` (dependent variable).

`[c,r2,eqn] = least_squares_fit(x,y,'power')` returns the model coefficient vector `c = [a,b]` for the power fit <img src="https://latex.codecogs.com/gif.latex?\inline&space;y={\textrm{ax}}^b"/> to a data set defined by the vectors `x` (independent variable) and `y` (dependent variable).

`[c,r2,eqn] = least_squares_fit(x,y,'exp')` returns the model coefficient vector `c = [a,b]` for the exponential fit <img src="https://latex.codecogs.com/gif.latex?\inline&space;y={\textrm{ae}}^{\textrm{bx}}"/> to a data set defined by the vectors `x` (independent variable) and `y` (dependent variable).

`[c,r2,eqn] = least_squares_fit(x,y,'log')` returns the model coefficient vector `c = [a,b]` for the logarithmic fit <img src="https://latex.codecogs.com/gif.latex?\inline&space;y={\textrm{ae}}^{\textrm{bx}}"/> to a data set defined by the vectors `x` (independent variable) and `y` (dependent variable).

**NOTE:** Additionally, for all the syntaxes, the coefficient of determination (`r2`) and a string (`eqn`) storing the fitted equation (for use in figure text with LaTeX interpreter) are also returned.

  
## Examples and Additional Documentation

   -  See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples. 
   -  See "DOCUMENTATION.pdf" for additional documentation. 