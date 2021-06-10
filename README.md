
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
BiomarkerData(biomarkerstats::sampleSurvey,'zinc','WRA',null)
#>       regionName statistic1 statistic2 statistic3 statistic4 statistic5
#> Area1      Area1  16.052127   25.33760   29.79480   35.22470   49.89185
#> Area2      Area2  16.511371   45.87771   57.35174   67.17837   89.04233
#> Area3      Area3  16.015336   45.91764   57.40822   67.72122   98.58913
#> Area4      Area4  10.908014   43.46807   55.91406   63.08109  108.78647
#> Area5      Area5   3.286706   44.03831   52.81745   65.16257   95.04856
#> Area6      Area6  32.692130   72.28256   89.67675  107.20721  152.89605
#> Area7      Area7  27.577569   44.50112   54.20302   65.49064  105.69885
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
