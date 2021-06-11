
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
#> 
#> Attaching package: 'srvyr'
#> The following object is masked from 'package:stats':
#> 
#>     filter
#> # A tibble: 7 x 4
#>     zinc out_upp out_low regionName
#>    <dbl>   <dbl>   <dbl> <chr>     
#> 1  10.9     92.5    14.0 Area4     
#> 2 109.      92.5    14.0 Area4     
#> 3  97.3     92.5    14.0 Area4     
#> 4   3.29    96.8    12.4 Area5     
#> 5   9.10    96.8    12.4 Area5     
#> 6  98.1     97.0    13.0 Area7     
#> 7 106.      97.0    13.0 Area7
#> # A tibble: 7 x 13
#>   regionName  mean mean_se    sd Q_q25 Q_q50 Q_q75 Q_q25_se Q_q50_se Q_q75_se
#>   <chr>      <dbl>   <dbl> <dbl> <dbl> <dbl> <dbl>    <dbl>    <dbl>    <dbl>
#> 1 Area1       30.7   0.676  7.35  25.3  29.8  35.2    0.891    0.841    1.27 
#> 2 Area2       56.8   0.577 14.9   45.9  57.4  67.2    0.902    1.11     1.64 
#> 3 Area3       56.8   1.16  15.4   45.9  57.4  67.7    1.40     1.35     2.08 
#> 4 Area4       54.3   1.34  15.6   43.5  55.9  63.1    2.48     1.22     0.996
#> 5 Area5       53.7   1.43  17.1   44.0  52.8  65.2    2.02     0.935    2.14 
#> 6 Area6       89.6   1.12  24.4   72.3  89.7 107.     2.02     2.02     1.28 
#> 7 Area7       55.8   0.744 14.8   44.5  54.2  65.5    0.893    2.32     0.908
#> # … with 3 more variables: IQR <dbl>, out_upp <dbl>, out_low <dbl>
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
