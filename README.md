
<!-- README.md is generated from README.Rmd. Please edit that file -->

# augassign

<!-- badges: start -->

<!-- badges: end -->

The goal of augassign is to provide [**aug**mented
**assign**ment](https://en.m.wikipedia.org/wiki/Augmented_assignment)
simular to what is seen in languages such as
[Python](https://docs.python.org/2.0/ref/augassign.html).

## Installation

You can install the package with:

``` r
# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/augassign")
```

This package will most likely never be put on CRAN.

## Example

The infix operators in this packages allows you to rewrite expressions
such as `x <- x + 1` into `x %+=% 1`. The package contains the most
common arithmatic operators.

``` r
library(augassign)

x <- 1

x %+=% 2

x
#> [1] 3

x %-=% 1

x
#> [1] 2

x %*=% 100

x
#> [1] 200

x %/=% 20

x
#> [1] 10
```

Also works in loops

``` r
y <- 0
for (i in 1:100) {
  y %+=% i
}

y
#> [1] 5050
```

is scoped correctly to work inside functions

``` r
x <- 1

f <- function(x) {
  x %+=% 10
  x
}

f(10)
#> [1] 20

x
#> [1] 1
```

Where augmented assignment shines is when you have long variable names
or if you need to modify something deeply in a list.

``` r
list_with_really_long_name <- list(h = list(x = 1),
                                   x = 1)

list_with_really_long_name
#> $h
#> $h$x
#> [1] 1
#> 
#> 
#> $x
#> [1] 1

list_with_really_long_name$x %+=% 1

list_with_really_long_name$h$x %+=% 100

list_with_really_long_name
#> $h
#> $h$x
#> [1] 101
#> 
#> 
#> $x
#> [1] 2
```

Since the package is rewriting the expressions under the hood, you are
able to work with vectors just as easy as single numbers

``` r
x <- 1:10

x %+=% x

x
#>  [1]  2  4  6  8 10 12 14 16 18 20
```

# Downsides

The mayor downside is that these operators are vastly slower then the
traditional counterparts

``` r
x <- 0
bench::mark(check = FALSE,
  {x <- x + 1},
  {x %+=% 1}
)
#> # A tibble: 2 x 6
#>   expression          min   median `itr/sec` mem_alloc `gc/sec`
#>   <bch:expr>     <bch:tm> <bch:tm>     <dbl> <bch:byt>    <dbl>
#> 1 { x <- x + 1 }    243ns    357ns  2058351.        0B      0  
#> 2 { x %+=% 1 }     28.1µs   37.2µs    25609.        0B     10.2
```

Due the orders of operations, it is not possible to chain together
multiple operators.

``` r
a <- b <- c <- 1

a %+=% b %+=% c
#> Error in a %+=% b <- a %+=% b + c(1): could not find function "%+=%<-"
```
