
<!-- README.md is generated from README.Rmd. Please edit that file -->

# biomarkerstats

<!-- badges: start -->

[![R-CMD-check](https://github.com/micronutrientsupport/biomarkerstats/workflows/R-CMD-check/badge.svg)](https://github.com/micronutrientsupport/biomarkerstats/actions)
<!-- badges: end -->

The goal of biomarkerstats is to …

## Installation

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("micronutrientsupport/biomarkerstats")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(biomarkerstats)
## basic example code
SummaryStats(biomarkerstats::sampleSurvey,'zinc','WRA',null)
#> # A tibble: 7 x 14
#>   regionName  mean mean_se    sd Q_q25 Q_q50 Q_q75 Q_q25_se Q_q50_se Q_q75_se
#>   <chr>      <dbl>   <dbl> <dbl> <dbl> <dbl> <dbl>    <dbl>    <dbl>    <dbl>
#> 1 Area1       30.7   0.676  7.35  25.3  29.8  35.2    0.891    0.841     1.27
#> 2 Area2       56.8   0.577 14.9   45.9  57.4  67.2    0.902    1.11      1.64
#> 3 Area3       56.8   1.16  15.4   45.9  57.4  67.7    1.40     1.35      2.08
#> 4 Area4       59.8   6.08  63.7   43.6  56.0  63.1    2.71     1.28      1.07
#> 5 Area5       53.7   1.43  17.1   44.0  52.8  65.2    2.02     0.935     2.14
#> 6 Area6       89.6   1.12  24.4   72.3  89.7 107.     2.02     2.02      1.28
#> 7 Area7       58.8   3.42  39.5   44.6  54.5  65.8    0.886    2.34      1.10
#> # … with 4 more variables: IQR <dbl>, out_upp <dbl>, out_low <dbl>, n <dbl>
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
