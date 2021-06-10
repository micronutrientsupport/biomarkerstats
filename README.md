
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
#>      groupId regionName ageInMonths isPregnant wasFasting timeOfDaySampled
#> 1        WRA      Area7         504          0          0               am
#> 2        WRA      Area4         216          0          0               am
#> 3        WRA      Area1         564          1          0               am
#> 4        WRA      Area4         396          1          0               am
#> 5        WRA      Area7         204          1          0               am
#> 6        WRA      Area1         480          1          0               am
#> 7        WRA      Area4         456          1          0               am
#> 8        WRA      Area1         372          0          0               am
#> 9        WRA      Area5         300          0          0               am
#> 10       WRA      Area6         468          0          0               am
#> 11       WRA      Area7         384          0          0               am
#> 12       WRA      Area3         408          0          0               am
#> 13       WRA      Area5         408          0          0               am
#> 14       WRA      Area7         348          0          0               am
#> 15       WRA      Area6         384          0          0               am
#> 16       WRA      Area1         420          0          0               am
#> 17       WRA      Area6         264          0          0               am
#> 18       WRA      Area5         396          0          0               am
#> 19       WRA      Area5         360          0          0               am
#> 20       WRA      Area2         504          0          0               am
#> 21       WRA      Area6         552          0          0               am
#> 22       WRA      Area1         408          0          0               am
#> 23       WRA      Area1         372          0          0               am
#> 24       WRA      Area4         396          0          0               am
#> 25       WRA      Area6         336          0          0               am
#> 26       WRA      Area5         456          0          0               am
#> 27       WRA      Area4         600          0          0               am
#> 28       WRA      Area5         480          0          0               am
#> 29       WRA      Area3         348          0          0               am
#> 30       WRA      Area2         408          0          0               am
#> 31       WRA      Area1         504          0          0               am
#> 32       WRA      Area4         504          0          0               am
#> 33       WRA      Area7         408          0          0               am
#> 34       WRA      Area7         348          0          0               am
#> 35       WRA      Area2         420          0          0               am
#> 36       WRA      Area3         564          0          0               am
#> 37       WRA      Area1         396          0          0               am
#> 38       WRA      Area6         408          0          0               am
#> 39       WRA      Area6         300          0          0               am
#> 40       WRA      Area5         444          0          0               am
#> 41       WRA      Area1         408          0          0               am
#> 42       WRA      Area5         588          0          0               am
#> 43       WRA      Area4         288          0          0               am
#> 44       WRA      Area4         432          0          0               am
#> 45       WRA      Area5         336          0          0               am
#> 46       WRA      Area7         312          0          0               am
#> 47       WRA      Area7         288          0          0               am
#> 48       WRA      Area7         540          0          0               am
#> 49       WRA      Area4         336          0          0               am
#> 50       WRA      Area4         360          0          0               am
#> 51       WRA      Area5         168          0          0               am
#> 52       WRA      Area6         660          0          0               am
#> 53       WRA      Area2         576          0          0               am
#> 54       WRA      Area5         444          0          0               am
#> 55       WRA      Area4         552          0          0               am
#> 56       WRA      Area2         276          0          0               am
#> 57       WRA      Area4         432          0          0               am
#> 58       WRA      Area3         396          0          0               am
#> 59       WRA      Area6         336          0          0               am
#> 60       WRA      Area2         396          0          0               am
#> 61       WRA      Area5         504          0          0               am
#> 62       WRA      Area7         252          0          0               am
#> 63       WRA      Area1         288          0          0               am
#> 64       WRA      Area3         564          0          0               am
#> 65       WRA      Area1         252          0          0               am
#> 66       WRA      Area7         564          0          0               am
#> 67       WRA      Area2         540          0          0               am
#> 68       WRA      Area4         336          0          0               am
#> 69       WRA      Area4         516          0          0               am
#> 70       WRA      Area7         360          0          0               am
#> 71       WRA      Area1         492          0          0               am
#> 72       WRA      Area2         336          0          0               am
#> 73       WRA      Area7         528          0          0               am
#> 74       WRA      Area4         408          0          0               am
#> 75       WRA      Area2         492          0          0               am
#> 76       WRA      Area7         468          0          0               am
#> 77       WRA      Area4         360          0          0               am
#> 78       WRA      Area5         540          0          0               am
#> 79       WRA      Area3         288          0          0               am
#> 80       WRA      Area4         528          0          0               am
#> 81       WRA      Area7         312          0          0               am
#> 82       WRA      Area6         180          0          0               am
#> 83       WRA      Area5         360          0          0               am
#> 84       WRA      Area4         684          0          0               am
#> 85       WRA      Area4         516          0          0               am
#> 86       WRA      Area2         288          0          0               am
#> 87       WRA      Area1         528          0          0               am
#> 88       WRA      Area4         432          0          0               am
#> 89       WRA      Area7         420          0          0               am
#> 90       WRA      Area7         552          0          0               am
#> 91       WRA      Area4         456          0          0               am
#> 92       WRA      Area2         564          0          0               am
#> 93       WRA      Area5         492          0          0               am
#> 94       WRA      Area2         396          0          0               am
#> 95       WRA      Area6         276          0          0               am
#> 96       WRA      Area5         528          0          0               am
#> 97       WRA      Area5         372          0          0               am
#> 98       WRA      Area3         372          0          0               am
#> 99       WRA      Area6         336          0          0               am
#> 100      WRA      Area6         516          0          0               am
#> 101      WRA      Area4         312          0          0               am
#> 102      WRA      Area3         516          0          0               am
#> 103      WRA      Area2         456          0          0               am
#> 104      WRA      Area5         600          0          0               am
#> 105      WRA      Area7         576          0          0               am
#> 106      WRA      Area5         348          0          0               am
#> 107      WRA      Area6         528          0          0               am
#> 108      WRA      Area6         324          0          0               am
#> 109      WRA      Area1         456          0          0               am
#> 110      WRA      Area3         372          0          0               am
#> 111      WRA      Area2         336          0          0               am
#> 112      WRA      Area6         240          0          0               am
#> 113      WRA      Area2         600          0          0               am
#> 114      WRA      Area5         264          0          0               am
#> 115      WRA      Area6         516          0          0               am
#> 116      WRA      Area2         588          0          0               am
#> 117      WRA      Area7         324          0          0               am
#> 118      WRA      Area5         588          0          0               am
#> 119      WRA      Area2         492          0          0               am
#> 120      WRA      Area3         444          0          0               am
#> 121      WRA      Area6         408          0          0               am
#> 122      WRA      Area7         456          0          0               am
#> 123      WRA      Area6         432          0          0               am
#> 124      WRA      Area5         480          0          0               am
#> 125      WRA      Area1         468          0          0               am
#> 126      WRA      Area2         492          0          0               am
#> 127      WRA      Area5         312          0          0               am
#> 128      WRA      Area4         384          0          0               am
#> 129      WRA      Area2         444          0          0               am
#> 130      WRA      Area7         324          0          0               am
#> 131      WRA      Area2         552          0          0               am
#> 132      WRA      Area1         300          0          0               am
#> 133      WRA      Area4         384          0          0               am
#> 134      WRA      Area6         480          0          0               am
#> 135      WRA      Area7         360          0          0               am
#> 136      WRA      Area1         408          0          0               am
#> 137      WRA      Area5         540          0          0               am
#> 138      WRA      Area3         240          0          0               am
#> 139      WRA      Area4         408          0          0               am
#> 140      WRA      Area3         528          0          0               am
#> 141      WRA      Area7         324          0          0               am
#> 142      WRA      Area4         324          0          0               am
#> 143      WRA      Area6         408          0          0               am
#> 144      WRA      Area3         300          0          0               am
#> 145      WRA      Area4         456          0          0               am
#> 146      WRA      Area1         288          0          0               am
#> 147      WRA      Area2         324          0          0               am
#> 148      WRA      Area1         408          0          0               am
#> 149      WRA      Area7         516          0          0               am
#> 150      WRA      Area5         564          0          0               am
#> 151      WRA      Area3         564          0          0               am
#> 152      WRA      Area5         588          0          0               am
#> 153      WRA      Area3         528          0          0               am
#> 154      WRA      Area6         588          0          0               am
#> 155      WRA      Area1         396          0          0               am
#> 156      WRA      Area2         144          0          0               am
#> 157      WRA      Area3         456          0          0               am
#> 158      WRA      Area3         372          0          0               am
#> 159      WRA      Area7         432          0          0               am
#> 160      WRA      Area6         504          0          0               am
#> 161      WRA      Area4         588          0          0               am
#> 162      WRA      Area3         420          0          0               am
#> 163      WRA      Area5         480          0          0               am
#> 164      WRA      Area6         408          0          0               am
#> 165      WRA      Area7         228          0          0               am
#> 166      WRA      Area6         468          0          0               am
#> 167      WRA      Area1         516          0          0               am
#> 168      WRA      Area1         384          0          0               am
#> 169      WRA      Area4         648          0          0               am
#> 170      WRA      Area1         420          0          0               am
#> 171      WRA      Area5         396          0          0               am
#> 172      WRA      Area3         432          0          0               am
#> 173      WRA      Area7          96          0          0               am
#> 174      WRA      Area3         528          0          0               am
#> 175      WRA      Area7         528          0          0               am
#> 176      WRA      Area4         408          0          0               am
#> 177      WRA      Area2         480          0          0               am
#> 178      WRA      Area5         468          0          0               am
#> 179      WRA      Area4         456          0          0               am
#> 180      WRA      Area2         624          0          0               am
#> 181      WRA      Area4         396          0          0               am
#> 182      WRA      Area4         324          0          0               am
#> 183      WRA      Area3         300          0          0               am
#> 184      WRA      Area6         480          0          0               am
#> 185      WRA      Area1         432          0          0               am
#> 186      WRA      Area1         624          0          0               am
#> 187      WRA      Area5         324          0          0               am
#> 188      WRA      Area5         420          0          0               am
#> 189      WRA      Area3         384          0          0               am
#> 190      WRA      Area1         300          0          0               am
#> 191      WRA      Area5         360          0          0               am
#> 192      WRA      Area1         468          0          0               am
#> 193      WRA      Area2         252          0          0               am
#> 194      WRA      Area6         660          0          0               am
#> 195      WRA      Area7         600          0          0               am
#> 196      WRA      Area3         588          0          0               am
#> 197      WRA      Area6         516          0          0               am
#> 198      WRA      Area6         372          0          0               am
#> 199      WRA      Area7         360          0          0               am
#> 200      WRA      Area7         444          0          0               am
#> 201      WRA      Area3         312          0          0               am
#> 202      WRA      Area3         492          0          0               am
#> 203      WRA      Area1         252          0          0               am
#> 204      WRA      Area5         192          0          0               am
#> 205      WRA      Area7         336          0          0               am
#> 206      WRA      Area4         480          0          0               am
#> 207      WRA      Area5         324          0          0               am
#> 208      WRA      Area7         360          0          0               am
#> 209      WRA      Area4         384          0          0               am
#> 210      WRA      Area5         264          0          0               am
#> 211      WRA      Area3         348          0          0               am
#> 212      WRA      Area7         324          0          0               am
#> 213      WRA      Area4          12          0          0               am
#> 214      WRA      Area5         672          0          0               am
#> 215      WRA      Area6         336          0          0               am
#> 216      WRA      Area5         228          0          0               am
#> 217      WRA      Area6         336          0          0               am
#> 218      WRA      Area7         516          0          0               am
#> 219      WRA      Area7         420          0          0               am
#> 220      WRA      Area7         420          0          0               am
#> 221      WRA      Area7         264          0          0               am
#> 222      WRA      Area2         324          0          0               am
#> 223      WRA      Area2         456          0          0               am
#> 224      WRA      Area3         444          0          0               am
#> 225      WRA      Area2         336          0          0               am
#> 226      WRA      Area4         432          0          0               am
#> 227      WRA      Area7         480          0          0               am
#> 228      WRA      Area4         540          0          0               am
#> 229      WRA      Area4         156          0          0               am
#> 230      WRA      Area5         456          0          0               am
#> 231      WRA      Area6         480          0          0               am
#> 232      WRA      Area1         336          0          0               am
#> 233      WRA      Area7         456          0          0               am
#> 234      WRA      Area6         444          0          0               am
#> 235      WRA      Area4         456          0          0               am
#> 236      WRA      Area3         564          0          0               am
#> 237      WRA      Area7         360          0          0               am
#> 238      WRA      Area1         456          0          0               am
#> 239      WRA      Area1         528          0          0               am
#> 240      WRA      Area1         300          0          0               am
#> 241      WRA      Area1         420          0          0               am
#> 242      WRA      Area4         444          0          0               am
#> 243      WRA      Area1         468          0          0               am
#> 244      WRA      Area2         372          0          0               am
#> 245      WRA      Area1         564          0          0               am
#> 246      WRA      Area6         528          0          0               am
#> 247      WRA      Area2         420          0          0               am
#> 248      WRA      Area2         480          0          0               am
#> 249      WRA      Area6         372          0          0               am
#> 250      WRA      Area1         420          0          0               am
#> 251      WRA      Area4         276          0          0               am
#> 252      WRA      Area1         372          0          0               am
#> 253      WRA      Area2         564          0          0               am
#> 254      WRA      Area5         492          0          0               am
#> 255      WRA      Area4         324          0          0               am
#> 256      WRA      Area6         228          0          0               am
#> 257      WRA      Area1         444          0          0               am
#> 258      WRA      Area4         288          0          0               am
#> 259      WRA      Area2         480          0          0               am
#> 260      WRA      Area5         348          0          0               am
#> 261      WRA      Area7         396          0          0               am
#> 262      WRA      Area3         456          0          0               am
#> 263      WRA      Area2         372          0          0               am
#> 264      WRA      Area7         516          0          0               am
#> 265      WRA      Area3         576          0          0               am
#> 266      WRA      Area6         480          0          0               am
#> 267      WRA      Area1         420          0          0               am
#> 268      WRA      Area1         456          0          0               am
#> 269      WRA      Area7         564          0          0               am
#> 270      WRA      Area5         276          0          0               am
#> 271      WRA      Area6         408          0          0               am
#> 272      WRA      Area4         408          0          0               am
#> 273      WRA      Area2         336          0          0               am
#> 274      WRA      Area6         216          0          0               am
#> 275      WRA      Area5         288          0          0               am
#> 276      WRA      Area5         480          0          0               am
#> 277      WRA      Area1         408          0          0               am
#> 278      WRA      Area6         324          0          0               am
#> 279      WRA      Area7         228          0          0               am
#> 280      WRA      Area2         384          0          0               am
#> 281      WRA      Area6         492          0          0               am
#> 282      WRA      Area1         420          0          0               am
#> 283      WRA      Area5         312          0          0               am
#> 284      WRA      Area6         612          0          0               am
#> 285      WRA      Area1         552          0          0               am
#> 286      WRA      Area1         456          0          0               am
#> 287      WRA      Area3         300          0          0               am
#> 288      WRA      Area1         396          0          0               am
#> 289      WRA      Area2         360          0          0               am
#> 290      WRA      Area4         264          0          0               am
#> 291      WRA      Area7         396          0          0               am
#> 292      WRA      Area2         504          0          0               am
#> 293      WRA      Area7         252          0          0               am
#> 294      WRA      Area2         432          0          0               am
#> 295      WRA      Area6         576          0          0               am
#> 296      WRA      Area5         396          0          0               am
#> 297      WRA      Area1         264          0          0               am
#> 298      WRA      Area7         576          0          0               am
#> 299      WRA      Area6         456          0          0               am
#> 300      WRA      Area6         480          0          0               am
#> 301      WRA      Area1         492          0          0               am
#> 302      WRA      Area4         192          0          0               am
#> 303      WRA      Area4         504          0          0               am
#> 304      WRA      Area5         372          0          0               am
#> 305      WRA      Area1         456          0          0               am
#> 306      WRA      Area5         408          0          0               am
#> 307      WRA      Area7         360          0          0               am
#> 308      WRA      Area7         456          0          0               am
#> 309      WRA      Area1         396          0          0               am
#> 310      WRA      Area5         264          0          0               am
#> 311      WRA      Area6         348          0          0               am
#> 312      WRA      Area7         516          0          0               am
#> 313      WRA      Area6         636          0          0               am
#> 314      WRA      Area4         456          0          0               am
#> 315      WRA      Area1         408          0          0               am
#> 316      WRA      Area7         492          0          0               am
#> 317      WRA      Area7         456          0          0               am
#> 318      WRA      Area1         648          0          0               am
#> 319      WRA      Area4         564          0          0               am
#> 320      WRA      Area2         324          0          0               am
#> 321      WRA      Area7         348          0          0               am
#> 322      WRA      Area1         708          0          0               am
#> 323      WRA      Area6         444          0          0               am
#> 324      WRA      Area1         408          0          0               am
#> 325      WRA      Area1         396          0          0               am
#> 326      WRA      Area1         444          0          0               am
#> 327      WRA      Area2         408          0          0               am
#> 328      WRA      Area2         348          0          0               am
#> 329      WRA      Area2         384          0          0               am
#> 330      WRA      Area2         204          0          0               am
#> 331      WRA      Area6         480          0          0               am
#> 332      WRA      Area6         396          0          0               am
#> 333      WRA      Area7         324          0          0               am
#> 334      WRA      Area4         648          0          0               am
#> 335      WRA      Area6         348          0          0               am
#> 336      WRA      Area4         396          0          0               am
#> 337      WRA      Area1         324          0          0               am
#> 338      WRA      Area7         288          0          0               am
#> 339      WRA      Area1         348          0          0               am
#> 340      WRA      Area1         468          0          0               am
#> 341      WRA      Area7         372          0          0               am
#> 342      WRA      Area3         540          0          0               am
#> 343      WRA      Area5         564          0          0               am
#> 344      WRA      Area7         624          0          0               am
#> 345      WRA      Area7         468          0          0               am
#> 346      WRA      Area5         456          0          0               am
#> 347      WRA      Area3         384          0          0               am
#> 348      WRA      Area1         324          0          0               am
#> 349      WRA      Area1         408          0          0               am
#> 350      WRA      Area7         456          0          0               am
#> 351      WRA      Area6         540          0          0               am
#> 352      WRA      Area1         516          0          0               am
#> 353      WRA      Area4         636          0          0               am
#> 354      WRA      Area6         504          0          0               am
#> 355      WRA      Area7         348          0          0               am
#> 356      WRA      Area2         456          0          0               am
#> 357      WRA      Area7         396          0          0               am
#> 358      WRA      Area6         324          0          0               am
#> 359      WRA      Area2         204          0          0               am
#> 360      WRA      Area6         276          0          0               am
#> 361      WRA      Area5         564          0          0               am
#> 362      WRA      Area6         684          0          0               am
#> 363      WRA      Area3         588          0          0               am
#> 364      WRA      Area4         276          0          0               am
#> 365      WRA      Area5         372          0          0               am
#> 366      WRA      Area5         552          0          0               am
#> 367      WRA      Area4         672          0          0               am
#> 368      WRA      Area1         276          0          0               am
#> 369      WRA      Area7         456          0          0               am
#> 370      WRA      Area6         396          0          0               am
#> 371      WRA      Area3         204          0          0               am
#> 372      WRA      Area6         576          0          0               am
#> 373      WRA      Area5         444          0          0               am
#> 374      WRA      Area1         456          0          0               am
#> 375      WRA      Area7         420          0          0               am
#> 376      WRA      Area2         300          0          0               am
#> 377      WRA      Area3         528          0          0               am
#> 378      WRA      Area4         708          0          0               am
#> 379      WRA      Area2         396          0          0               am
#> 380      WRA      Area7         456          0          0               am
#> 381      WRA      Area2         480          0          0               am
#> 382      WRA      Area6         168          0          0               am
#> 383      WRA      Area7         384          0          0               am
#> 384      WRA      Area4         444          0          0               am
#> 385      WRA      Area2         588          0          0               am
#> 386      WRA      Area4         384          0          0               am
#> 387      WRA      Area5         300          0          0               am
#> 388      WRA      Area3         504          0          0               am
#> 389      WRA      Area5         432          0          0               am
#> 390      WRA      Area5         588          0          0               am
#> 391      WRA      Area2         288          0          0               am
#> 392      WRA      Area3         552          0          0               am
#> 393      WRA      Area7         372          0          0               am
#> 394      WRA      Area6         372          0          0               am
#> 395      WRA      Area6         396          0          0               am
#> 396      WRA      Area1         348          0          0               am
#> 397      WRA      Area6         264          0          0               am
#> 398      WRA      Area3         192          0          0               am
#> 399      WRA      Area4         336          0          0               am
#> 400      WRA      Area5         300          0          0               am
#> 401      WRA      Area4         552          0          0               am
#> 402      WRA      Area3         336          0          0               am
#> 403      WRA      Area6         372          0          0               am
#> 404      WRA      Area5         432          0          0               am
#> 405      WRA      Area7         372          0          0               am
#> 406      WRA      Area6         468          0          0               am
#> 407      WRA      Area6         492          0          0               am
#> 408      WRA      Area2         300          0          0               am
#> 409      WRA      Area3         432          0          0               am
#> 410      WRA      Area3         720          0          0               am
#> 411      WRA      Area4         396          0          0               am
#> 412      WRA      Area1         480          0          0               am
#> 413      WRA      Area1         420          0          0               am
#> 414      WRA      Area1         576          0          0               am
#> 415      WRA      Area2         504          0          0               am
#> 416      WRA      Area3         240          0          0               am
#> 417      WRA      Area6         228          0          0               am
#> 418      WRA      Area3         480          0          0               am
#> 419      WRA      Area1         348          0          0               am
#> 420      WRA      Area4         384          0          0               am
#> 421      WRA      Area4         264          0          0               am
#> 422      WRA      Area2         276          0          0               am
#> 423      WRA      Area4         432          0          0               am
#> 424      WRA      Area2         420          0          0               am
#> 425      WRA      Area7         468          0          0               am
#> 426      WRA      Area5         624          0          0               am
#> 427      WRA      Area2         504          0          0               am
#> 428      WRA      Area6         336          0          0               am
#> 429      WRA      Area4         324          0          0               am
#> 430      WRA      Area3         576          0          0               am
#> 431      WRA      Area2         528          0          0               am
#> 432      WRA      Area1         396          0          0               am
#> 433      WRA      Area3         300          0          0               am
#> 434      WRA      Area5         444          0          0               am
#> 435      WRA      Area1         288          0          0               am
#> 436      WRA      Area2         432          0          0               am
#> 437      WRA      Area5         444          0          0               am
#> 438      WRA      Area7         300          0          0               am
#> 439      WRA      Area4         384          0          0               am
#> 440      WRA      Area3         360          0          0               am
#> 441      WRA      Area3         300          0          0               am
#> 442      WRA      Area6         384          0          0               am
#> 443      WRA      Area4         252          0          0               am
#> 444      WRA      Area4         480          0          0               am
#> 445      WRA      Area1         528          0          0               am
#> 446      WRA      Area4         456          0          0               am
#> 447      WRA      Area1         156          0          0               am
#> 448      WRA      Area7         444          0          0               am
#> 449      WRA      Area3         432          0          0               am
#> 450      WRA      Area5         504          0          0               am
#> 451      WRA      Area7         516          0          0               am
#> 452      WRA      Area6         588          0          0               am
#> 453      WRA      Area3         540          0          0               am
#> 454      WRA      Area6         312          0          0               am
#> 455      WRA      Area6         516          0          0               am
#> 456      WRA      Area3         732          0          0               am
#> 457      WRA      Area6         324          0          0               am
#> 458      WRA      Area1         192          0          0               am
#> 459      WRA      Area7         516          0          0               am
#> 460      WRA      Area7         468          0          0               am
#> 461      WRA      Area6         312          0          0               am
#> 462      WRA      Area4         504          0          0               am
#> 463      WRA      Area2         588          0          0               am
#> 464      WRA      Area7         624          0          0               am
#> 465      WRA      Area5         516          0          0               am
#> 466      WRA      Area7         396          0          0               am
#> 467      WRA      Area4         324          0          0               am
#> 468      WRA      Area5         612          0          0               am
#> 469      WRA      Area1         528          0          0               am
#> 470      WRA      Area7         444          0          0               am
#> 471      WRA      Area7         648          0          0               am
#> 472      WRA      Area2         372          0          0               am
#> 473      WRA      Area3         420          0          0               am
#> 474      WRA      Area5         420          0          0               am
#> 475      WRA      Area1         564          0          0               am
#> 476      WRA      Area4         288          0          0               am
#> 477      WRA      Area7         216          0          0               am
#> 478      WRA      Area4         588          0          0               am
#> 479      WRA      Area6         240          0          0               am
#> 480      WRA      Area4         540          0          0               am
#> 481      WRA      Area1         276          0          0               am
#> 482      WRA      Area1         444          0          0               am
#> 483      WRA      Area3         684          0          0               am
#> 484      WRA      Area4         444          0          0               am
#> 485      WRA      Area7         312          0          0               am
#> 486      WRA      Area3         228          0          0               am
#> 487      WRA      Area7         552          0          0               am
#> 488      WRA      Area5         372          0          0               am
#> 489      WRA      Area6         444          0          0               am
#> 490      WRA      Area5         180          0          0               am
#> 491      WRA      Area3         456          0          0               am
#> 492      WRA      Area3         444          0          0               am
#> 493      WRA      Area3         504          0          0               am
#> 494      WRA      Area1         348          0          0               am
#> 495      WRA      Area2         288          0          0               am
#> 496      WRA      Area5         492          0          0               am
#> 497      WRA      Area4         576          0          0               am
#> 498      WRA      Area5         516          0          0               am
#> 499      WRA      Area7         300          0          0               am
#> 500      WRA      Area2         360          0          0               am
#> 501      WRA      Area2         456          0          0               am
#> 502      WRA      Area2         480          0          0               am
#> 503      WRA      Area1         360          0          0               am
#> 504      WRA      Area2         600          0          0               am
#> 505      WRA      Area1         480          0          0               am
#> 506      WRA      Area2         420          0          0               am
#> 507      WRA      Area2         348          0          0               am
#> 508      WRA      Area4         432          0          0               am
#> 509      WRA      Area5         648          0          0               am
#> 510      WRA      Area4         456          0          0               am
#> 511      WRA      Area5         276          0          0               am
#> 512      WRA      Area4         504          0          0               am
#> 513      WRA      Area4         492          0          0               am
#> 514      WRA      Area6         432          0          0               am
#> 515      WRA      Area2         348          0          0               am
#> 516      WRA      Area2         372          0          0               am
#> 517      WRA      Area2         384          0          0               am
#> 518      WRA      Area6         408          0          0               am
#> 519      WRA      Area6         528          0          0               am
#> 520      WRA      Area2         480          0          0               am
#> 521      WRA      Area5         468          0          0               am
#> 522      WRA      Area3         108          0          0               am
#> 523      WRA      Area3         516          0          0               am
#> 524      WRA      Area1         288          0          0               am
#> 525      WRA      Area7         408          0          0               am
#> 526      WRA      Area2         360          0          0               am
#> 527      WRA      Area6         444          0          0               am
#> 528      WRA      Area2         456          0          0               am
#> 529      WRA      Area7         588          0          0               am
#> 530      WRA      Area5         396          0          0               am
#> 531      WRA      Area1         408          0          0               am
#> 532      WRA      Area5         504          0          0               am
#> 533      WRA      Area3         552          0          0               am
#> 534      WRA      Area4         360          0          0               am
#> 535      WRA      Area1         396          0          0               am
#> 536      WRA      Area6         240          0          0               am
#> 537      WRA      Area1         192          0          0               am
#> 538      WRA      Area5         516          0          0               am
#> 539      WRA      Area2         360          0          0               am
#> 540      WRA      Area4         516          0          0               am
#> 541      WRA      Area2         528          0          0               am
#> 542      WRA      Area1         588          0          0               am
#> 543      WRA      Area6         360          0          0               am
#> 544      WRA      Area4         420          0          0               am
#> 545      WRA      Area4         192          0          0               am
#> 546      WRA      Area7         396          0          0               am
#> 547      WRA      Area2         372          0          0               am
#> 548      WRA      Area4         216          0          0               am
#> 549      WRA      Area5         420          0          0               am
#> 550      WRA      Area5         336          0          0               am
#> 551      WRA      Area2         480          0          0               am
#> 552      WRA      Area3         312          0          0               am
#> 553      WRA      Area5         564          0          0               am
#> 554      WRA      Area5         528          0          0               am
#> 555      WRA      Area5         492          0          0               am
#> 556      WRA      Area5         456          0          0               am
#> 557      WRA      Area3         384          0          0               am
#> 558      WRA      Area4         396          0          0               am
#> 559      WRA      Area7         456          0          0               am
#> 560      WRA      Area1         600          0          0               am
#> 561      WRA      Area2         372          0          0               am
#> 562      WRA      Area3         588          0          0               am
#> 563      WRA      Area1         612          0          0               am
#> 564      WRA      Area7         360          0          0               am
#> 565      WRA      Area6         636          0          0               am
#> 566      WRA      Area5         480          0          0               am
#> 567      WRA      Area1         456          0          0               am
#> 568      WRA      Area7         444          0          0               am
#> 569      WRA      Area5         204          0          0               am
#> 570      WRA      Area7         456          0          0               am
#> 571      WRA      Area1         372          0          0               am
#> 572      WRA      Area2         432          0          0               am
#> 573      WRA      Area7         228          0          0               am
#> 574      WRA      Area6         420          0          0               am
#> 575      WRA      Area6         444          0          0               am
#> 576      WRA      Area1         432          0          0               am
#> 577      WRA      Area4         456          0          0               am
#> 578      WRA      Area2         588          0          0               am
#> 579      WRA      Area3         120          0          0               am
#> 580      WRA      Area5         312          0          0               am
#> 581      WRA      Area2         504          0          0               am
#> 582      WRA      Area3         480          0          0               am
#> 583      WRA      Area6         420          0          0               am
#> 584      WRA      Area2         324          0          0               am
#> 585      WRA      Area4         540          0          0               am
#> 586      WRA      Area3         480          0          0               am
#> 587      WRA      Area6         420          0          0               am
#> 588      WRA      Area7         600          0          0               am
#> 589      WRA      Area6         396          0          0               am
#> 590      WRA      Area3         624          0          0               am
#> 591      WRA      Area1         408          0          0               am
#> 592      WRA      Area7         420          0          0               am
#> 593      WRA      Area4         516          0          0               am
#> 594      WRA      Area1         432          0          0               am
#> 595      WRA      Area6         396          0          0               am
#> 596      WRA      Area6         264          0          0               am
#> 597      WRA      Area1         300          0          0               am
#> 598      WRA      Area1         408          0          0               am
#> 599      WRA      Area5         444          0          0               am
#> 600      WRA      Area4         240          0          0               am
#> 601      WRA      Area6         516          0          0               am
#> 602      WRA      Area7         384          0          0               am
#> 603      WRA      Area4         540          0          0               am
#> 604      WRA      Area1         264          0          0               am
#> 605      WRA      Area5         324          0          0               am
#> 606      WRA      Area5         336          0          0               am
#> 607      WRA      Area4         216          0          0               am
#> 608      WRA      Area4         396          0          0               am
#> 609      WRA      Area2         348          0          0               am
#> 610      WRA      Area5         600          0          0               am
#> 611      WRA      Area7         732          0          0               am
#> 612      WRA      Area5         324          0          0               am
#> 613      WRA      Area7         420          0          0               am
#> 614      WRA      Area2         396          0          0               am
#> 615      WRA      Area7         348          0          0               am
#> 616      WRA      Area5         516          0          0               am
#> 617      WRA      Area5         396          0          0               am
#> 618      WRA      Area1         264          0          0               am
#> 619      WRA      Area3         216          0          0               am
#> 620      WRA      Area6         432          0          0               am
#> 621      WRA      Area1         252          0          0               am
#> 622      WRA      Area7         468          0          0               am
#> 623      WRA      Area2         288          0          0               am
#> 624      WRA      Area3         348          0          0               am
#> 625      WRA      Area4         708          0          0               am
#> 626      WRA      Area6         468          0          0               am
#> 627      WRA      Area7         408          0          0               am
#> 628      WRA      Area6         240          0          0               am
#> 629      WRA      Area4         456          0          0               am
#> 630      WRA      Area6         480          0          0               am
#> 631      WRA      Area4         336          0          0               am
#> 632      WRA      Area7         444          0          0               am
#> 633      WRA      Area5         240          0          0               am
#> 634      WRA      Area1         444          0          0               am
#> 635      WRA      Area3         444          0          0               am
#> 636      WRA      Area3         456          0          0               am
#> 637      WRA      Area4         492          0          0               am
#> 638      WRA      Area7         336          0          0               am
#> 639      WRA      Area2         312          0          0               am
#> 640      WRA      Area4         444          0          0               am
#> 641      WRA      Area5         396          0          0               am
#> 642      WRA      Area4         456          0          0               am
#> 643      WRA      Area7         624          0          0               am
#> 644      WRA      Area4         516          0          0               am
#> 645      WRA      Area5         564          0          0               am
#> 646      WRA      Area7         372          0          0               am
#> 647      WRA      Area6         480          0          0               am
#> 648      WRA      Area1         468          0          0               am
#> 649      WRA      Area4         576          0          0               am
#> 650      WRA      Area3         456          0          0               am
#> 651      WRA      Area4         432          0          0               am
#> 652      WRA      Area3         564          0          0               am
#> 653      WRA      Area4         336          0          0               am
#> 654      WRA      Area2         516          0          0               am
#> 655      WRA      Area7         420          0          0               am
#> 656      WRA      Area3         264          0          0               am
#> 657      WRA      Area1         264          0          0               am
#> 658      WRA      Area1         360          0          0               am
#> 659      WRA      Area4         348          0          0               am
#> 660      WRA      Area3         384          0          0               am
#> 661      WRA      Area7         480          0          0               am
#> 662      WRA      Area1         564          0          0               am
#> 663      WRA      Area6         324          0          0               am
#> 664      WRA      Area6         492          0          0               am
#> 665      WRA      Area4         384          0          0               am
#> 666      WRA      Area5         468          0          0               am
#> 667      WRA      Area1         408          0          0               am
#> 668      WRA      Area2         432          0          0               am
#> 669      WRA      Area1         348          0          0               am
#> 670      WRA      Area7         348          0          0               am
#> 671      WRA      Area6         336          0          0               am
#> 672      WRA      Area3         324          0          0               am
#> 673      WRA      Area3         444          0          0               am
#> 674      WRA      Area7         444          0          0               am
#> 675      WRA      Area6         288          0          0               am
#> 676      WRA      Area6         456          0          0               am
#> 677      WRA      Area7         300          0          0               am
#> 678      WRA      Area7         336          0          0               am
#> 679      WRA      Area5         528          0          0               am
#> 680      WRA      Area5         360          0          0               am
#> 681      WRA      Area4         324          0          0               am
#> 682      WRA      Area1         132          0          0               am
#> 683      WRA      Area1         420          0          0               am
#> 684      WRA      Area7         384          0          0               am
#> 685      WRA      Area7         528          0          0               am
#> 686      WRA      Area2         396          0          0               am
#> 687      WRA      Area3         432          0          0               am
#> 688      WRA      Area7         288          0          0               am
#> 689      WRA      Area7         300          0          0               am
#> 690      WRA      Area7          84          0          0               am
#> 691      WRA      Area6         636          0          0               am
#> 692      WRA      Area4         336          0          0               am
#> 693      WRA      Area2         600          0          0               am
#> 694      WRA      Area5         372          0          0               am
#> 695      WRA      Area7         456          0          0               am
#> 696      WRA      Area1         264          0          0               am
#> 697      WRA      Area3         444          0          0               am
#> 698      WRA      Area7         240          0          0               am
#> 699      WRA      Area6         420          0          0               am
#> 700      WRA      Area7         600          0          0               am
#> 701      WRA      Area4         456          0          0               am
#> 702      WRA      Area1         480          0          0               am
#> 703      WRA      Area3         192          0          0               am
#> 704      WRA      Area3         540          0          0               am
#> 705      WRA      Area7         300          0          0               am
#> 706      WRA      Area3         408          0          0               am
#> 707      WRA      Area7         252          0          0               am
#> 708      WRA      Area2         324          0          0               am
#> 709      WRA      Area3         468          0          0               am
#> 710      WRA      Area4         420          0          0               am
#> 711      WRA      Area2         432          0          0               am
#> 712      WRA      Area5         432          0          0               am
#> 713      WRA      Area3         600          0          0               am
#> 714      WRA      Area7         300          0          0               am
#> 715      WRA      Area2         384          0          0               am
#> 716      WRA      Area2         444          0          0               am
#> 717      WRA      Area1         600          0          0               am
#> 718      WRA      Area3         492          0          0               am
#> 719      WRA      Area5         540          0          0               am
#> 720      WRA      Area6         492          0          0               am
#> 721      WRA      Area5         504          0          0               am
#> 722      WRA      Area7         516          0          0               am
#> 723      WRA      Area7         396          0          0               am
#> 724      WRA      Area6         444          0          0               am
#> 725      WRA      Area5         504          0          0               am
#> 726      WRA      Area2         432          0          0               am
#> 727      WRA      Area6         216          0          0               am
#> 728      WRA      Area5         432          0          0               am
#> 729      WRA      Area4         588          0          0               am
#> 730      WRA      Area3         456          0          0               am
#> 731      WRA      Area3         528          0          0               am
#> 732      WRA      Area4         504          0          0               am
#> 733      WRA      Area4         516          0          0               am
#> 734      WRA      Area6         600          0          0               am
#> 735      WRA      Area5         300          0          0               am
#> 736      WRA      Area6         336          0          0               am
#> 737      WRA      Area7         492          0          0               am
#> 738      WRA      Area3         432          0          0               am
#> 739      WRA      Area2         624          0          0               am
#> 740      WRA      Area2         480          0          0               am
#> 741      WRA      Area3         432          0          0               am
#> 742      WRA      Area4         480          0          0               am
#> 743      WRA      Area7         432          0          0               am
#> 744      WRA      Area3         396          0          0               am
#> 745      WRA      Area1         228          0          0               am
#> 746      WRA      Area3         276          0          0               am
#> 747      WRA      Area3         624          0          0               am
#> 748      WRA      Area7         336          0          0               am
#> 749      WRA      Area4         492          0          0               am
#> 750      WRA      Area7         564          0          0               am
#> 751      WRA      Area7         264          0          0               am
#> 752      WRA      Area3         348          0          0               am
#> 753      WRA      Area7         228          0          0               am
#> 754      WRA      Area2         456          0          0               am
#> 755      WRA      Area7         360          0          0               am
#> 756      WRA      Area2         432          0          0               am
#> 757      WRA      Area6         384          0          0               am
#> 758      WRA      Area7         468          0          0               am
#> 759      WRA      Area2         192          0          0               am
#> 760      WRA      Area7         588          0          0               am
#> 761      WRA      Area5         672          0          0               am
#> 762      WRA      Area6         360          0          0               am
#> 763      WRA      Area6         396          0          0               am
#> 764      WRA      Area1         384          0          0               am
#> 765      WRA      Area2         372          0          0               am
#> 766      WRA      Area5         516          0          0               am
#> 767      WRA      Area1         432          0          0               am
#> 768      WRA      Area1         432          0          0               am
#> 769      WRA      Area1         552          0          0               am
#> 770      WRA      Area4         360          0          0               am
#> 771      WRA      Area2         516          0          0               am
#> 772      WRA      Area4         588          0          0               am
#> 773      WRA      Area2         192          0          0               am
#> 774      WRA      Area7         420          0          0               am
#> 775      WRA      Area7         456          0          0               am
#> 776      WRA      Area4         456          0          0               am
#> 777      WRA      Area4         504          0          0               am
#> 778      WRA      Area1         540          0          0               am
#> 779      WRA      Area5         672          0          0               am
#> 780      WRA      Area7         588          0          0               am
#> 781      WRA      Area6         396          0          0               am
#> 782      WRA      Area2         360          0          0               am
#> 783      WRA      Area3         372          0          0               am
#> 784      WRA      Area4         324          0          0               am
#> 785      WRA      Area2         264          0          0               am
#> 786      WRA      Area1         432          0          0               am
#> 787      WRA      Area4         528          0          0               am
#> 788      WRA      Area7         276          0          0               am
#> 789      WRA      Area5         408          0          0               am
#> 790      WRA      Area6         396          0          0               am
#> 791      WRA      Area5         240          0          0               am
#> 792      WRA      Area1         564          0          0               am
#> 793      WRA      Area5         324          0          0               am
#> 794      WRA      Area2         552          0          0               am
#> 795      WRA      Area1         516          0          0               am
#> 796      WRA      Area7         168          0          0               am
#> 797      WRA      Area6         300          0          0               am
#> 798      WRA      Area5         504          0          0               am
#> 799      WRA      Area4         192          0          0               am
#> 800      WRA      Area6         444          0          0               am
#> 801      WRA      Area3         408          0          0               am
#> 802      WRA      Area1         468          0          0               am
#> 803      WRA      Area2         300          0          0               am
#> 804      WRA      Area5         540          0          0               am
#> 805      WRA      Area5         408          0          0               am
#> 806      WRA      Area3         504          0          0               am
#> 807      WRA      Area1         264          0          0               am
#> 808      WRA      Area5         396          0          0               am
#> 809      WRA      Area4         516          0          0               am
#> 810      WRA      Area4         612          0          0               am
#> 811      WRA      Area2         564          0          0               am
#> 812      WRA      Area6         288          0          0               am
#> 813      WRA      Area5         384          0          0               am
#> 814      WRA      Area5         348          0          0               am
#> 815      WRA      Area7         348          0          0               am
#> 816      WRA      Area7         324          0          0               am
#> 817      WRA      Area6         564          0          0               am
#> 818      WRA      Area5         456          0          0               am
#> 819      WRA      Area7         432          0          0               am
#> 820      WRA      Area6         456          0          0               am
#> 821      WRA      Area3         432          0          0               am
#> 822      WRA      Area3         540          0          0               am
#> 823      WRA      Area2         252          0          0               am
#> 824      WRA      Area5         288          0          0               am
#> 825      WRA      Area6         360          0          0               am
#> 826      WRA      Area5         504          0          0               am
#> 827      WRA      Area6         540          0          0               am
#> 828      WRA      Area2         588          0          0               am
#> 829      WRA      Area3         384          0          0               am
#> 830      WRA      Area4         432          0          0               am
#> 831      WRA      Area3         468          0          0               am
#> 832      WRA      Area2         504          0          0               am
#> 833      WRA      Area3         516          0          0               am
#> 834      WRA      Area7         384          0          0               am
#> 835      WRA      Area3         276          0          0               am
#> 836      WRA      Area7         468          0          0               am
#> 837      WRA      Area4         492          0          0               am
#> 838      WRA      Area2         408          0          0               am
#> 839      WRA      Area6         228          0          0               am
#> 840      WRA      Area5         492          0          0               am
#> 841      WRA      Area2         420          0          0               am
#> 842      WRA      Area3         444          0          0               am
#> 843      WRA      Area1         480          0          0               am
#> 844      WRA      Area1         600          0          0               am
#> 845      WRA      Area7         276          0          0               am
#> 846      WRA      Area6         372          0          0               am
#> 847      WRA      Area6         552          0          0               am
#> 848      WRA      Area4         360          0          0               am
#> 849      WRA      Area2         264          0          0               am
#> 850      WRA      Area2         612          0          0               am
#> 851      WRA      Area4         252          0          0               am
#> 852      WRA      Area1         420          0          0               am
#> 853      WRA      Area7         432          0          0               am
#> 854      WRA      Area5         384          0          0               am
#> 855      WRA      Area5         744          0          0               am
#> 856      WRA      Area4         360          0          0               am
#> 857      WRA      Area7         228          0          0               am
#> 858      WRA      Area1         444          0          0               am
#> 859      WRA      Area7         444          0          0               am
#> 860      WRA      Area6         432          0          0               am
#> 861      WRA      Area5         348          0          0               am
#> 862      WRA      Area3         396          0          0               am
#> 863      WRA      Area3         408          0          0               am
#> 864      WRA      Area1         264          0          0               am
#> 865      WRA      Area7         480          0          0               am
#> 866      WRA      Area5         600          0          0               am
#> 867      WRA      Area4         276          0          0               am
#> 868      WRA      Area6         336          0          0               am
#> 869      WRA      Area5         576          0          0               am
#> 870      WRA      Area5         336          0          0               am
#> 871      WRA      Area5         648          0          0               am
#> 872      WRA      Area6         492          0          0               am
#> 873      WRA      Area3         528          0          0               am
#> 874      WRA      Area2         516          0          0               am
#> 875      WRA      Area5         468          0          0               am
#> 876      WRA      Area2         300          0          0               am
#> 877      WRA      Area3         240          0          0               am
#> 878      WRA      Area5         384          0          0               am
#> 879      WRA      Area3         276          0          0               am
#> 880      WRA      Area7         504          0          0               am
#> 881      WRA      Area3         432          0          0               am
#> 882      WRA      Area2         504          0          0               am
#> 883      WRA      Area6         528          0          0               am
#> 884      WRA      Area6         408          0          0               am
#> 885      WRA      Area3         348          0          0               am
#> 886      WRA      Area1         240          0          0               am
#> 887      WRA      Area5         432          0          0               am
#> 888      WRA      Area1         384          0          0               am
#> 889      WRA      Area7         444          0          0               am
#> 890      WRA      Area5         420          0          0               am
#> 891      WRA      Area2         348          0          0               am
#> 892      WRA      Area1         444          0          0               am
#> 893      WRA      Area5         480          0          0               am
#> 894      WRA      Area1         576          0          0               am
#> 895      WRA      Area4         168          0          0               am
#> 896      WRA      Area1         348          0          0               am
#> 897      WRA      Area4         576          0          0               am
#> 898      WRA      Area4         396          0          0               am
#> 899      WRA      Area2         336          0          0               am
#> 900      WRA      Area7         504          0          0               am
#> 901      WRA      Area4         432          0          0               am
#> 902      WRA      Area6         420          0          0               am
#> 903      WRA      Area2         528          0          0               am
#> 904      WRA      Area4         348          0          0               am
#> 905      WRA      Area1         192          0          0               am
#> 906      WRA      Area5         204          0          0               am
#> 907      WRA      Area1         348          0          0               am
#> 908      WRA      Area2         696          0          0               am
#> 909      WRA      Area6         564          0          0               am
#> 910      WRA      Area2         516          0          0               am
#> 911      WRA      Area5         240          0          0               am
#> 912      WRA      Area3         420          0          0               am
#> 913      WRA      Area4         324          0          0               am
#> 914      WRA      Area3         456          0          0               am
#> 915      WRA      Area3         456          0          0               am
#> 916      WRA      Area2         444          0          0               am
#> 917      WRA      Area6         348          0          0               am
#> 918      WRA      Area7         456          0          0               am
#> 919      WRA      Area2         336          0          0               am
#> 920      WRA      Area1         312          0          0               am
#> 921      WRA      Area2         372          0          0               am
#> 922      WRA      Area2         600          0          0               am
#> 923      WRA      Area1         384          0          0               am
#> 924      WRA      Area6         396          0          0               am
#> 925      WRA      Area5         672          0          0               am
#> 926      WRA      Area5         468          0          0               am
#> 927      WRA      Area7         492          0          0               am
#> 928      WRA      Area5         468          0          0               am
#> 929      WRA      Area5         492          0          0               am
#> 930      WRA      Area7         516          0          0               am
#> 931      WRA      Area3          72          0          0               am
#> 932      WRA      Area5         216          0          0               am
#> 933      WRA      Area5         468          0          0               am
#> 934      WRA      Area1         504          0          0               am
#> 935      WRA      Area1         420          0          0               am
#> 936      WRA      Area7         396          0          0               am
#> 937      WRA      Area7         708          0          0               am
#> 938      WRA      Area5         384          0          0               am
#> 939      WRA      Area6         288          0          0               am
#> 940      WRA      Area2         552          0          0               am
#> 941      WRA      Area3         456          0          0               am
#> 942      WRA      Area1         384          0          0               am
#> 943      WRA      Area6         612          0          0               am
#> 944      WRA      Area1         312          0          0               am
#> 945      WRA      Area1         396          0          0               am
#> 946      WRA      Area6         540          0          0               am
#> 947      WRA      Area7         408          0          0               am
#> 948      WRA      Area5         396          0          0               am
#> 949      WRA      Area4         372          0          0               am
#> 950      WRA      Area3         372          0          0               am
#> 951      WRA      Area5         468          0          0               am
#> 952      WRA      Area6         564          0          0               am
#> 953      WRA      Area3         420          0          0               am
#> 954      WRA      Area2         360          0          0               am
#> 955      WRA      Area6         516          0          0               am
#> 956      WRA      Area2         576          0          0               am
#> 957      WRA      Area3         504          0          0               am
#> 958      WRA      Area4         408          0          0               am
#> 959      WRA      Area6         372          0          0               am
#> 960      WRA      Area7         432          0          0               am
#> 961      WRA      Area2         384          0          0               am
#> 962      WRA      Area7         468          0          0               am
#> 963      WRA      Area6         408          0          0               am
#> 964      WRA      Area6         468          0          0               am
#> 965      WRA      Area2         396          0          0               am
#> 966      WRA      Area3         240          0          0               am
#> 967      WRA      Area5         444          0          0               am
#> 968      WRA      Area6         504          0          0               am
#> 969      WRA      Area6         648          0          0               am
#> 970      WRA      Area5         336          0          0               am
#> 971      WRA      Area4         420          0          0               am
#> 972      WRA      Area2         144          0          0               am
#> 973      WRA      Area4         456          0          0               am
#> 974      WRA      Area5         420          0          0               am
#> 975      WRA      Area6         408          0          0               am
#> 976      WRA      Area4         504          0          0               am
#> 977      WRA      Area5         408          0          0               am
#> 978      WRA      Area3         288          0          0               am
#> 979      WRA      Area5         336          0          0               am
#> 980      WRA      Area5         420          0          0               am
#> 981      WRA      Area3         300          0          0               am
#> 982      WRA      Area6         288          0          0               am
#> 983      WRA      Area6         492          0          0               am
#> 984      WRA      Area5         336          0          0               am
#> 985      WRA      Area6         264          0          0               am
#> 986      WRA      Area6         156          0          0               am
#> 987      WRA      Area3         492          0          0               am
#> 988      WRA      Area4         276          0          0               am
#> 989      WRA      Area7         264          0          0               am
#> 990      WRA      Area6         372          0          0               am
#> 991      WRA      Area7         396          0          0               am
#> 992      WRA      Area7         492          0          0               am
#> 993      WRA      Area6         456          0          0               am
#> 994      WRA      Area3         612          0          0               am
#> 995      WRA      Area7         396          0          0               am
#> 996      WRA      Area5         288          0          0               am
#> 997      WRA      Area2         480          0          0               am
#> 998      WRA      Area6         528          0          0               am
#> 999      WRA      Area5         468          0          0               am
#> 1000     WRA      Area6         540          0          0               am
#>      surveyCluster surveyStrata surveyWeights       zinc
#> 1                1           11       1000000 500.000000
#> 2                1           11       1000000 750.000000
#> 3                1           11       1000000  30.190504
#> 4                1           11       1000000  29.413862
#> 5                1           11       1000000  66.330666
#> 6                1           11       1000000  20.155484
#> 7                1           11       1000000  55.152712
#> 8                1           11       1000000  31.834191
#> 9                1           11       1000000         NA
#> 10               1           11       1000000 124.766325
#> 11               1           11       1000000  69.822338
#> 12               1           11       1000000  72.297443
#> 13               1           11       1000000         NA
#> 14               1           11       1000000  41.040859
#> 15               1           11       1000000 137.416378
#> 16               1           11       1000000         NA
#> 17               1           11       1000000  70.801788
#> 18               1           11       1000000  55.216128
#> 19               1           11       1000000  26.129385
#> 20               1           11       1000000  58.182692
#> 21               2           11       1000000 135.473151
#> 22               2           11       1000000  38.366866
#> 23               2           11       1000000  44.765995
#> 24               2           11       1000000  34.198018
#> 25               2           11       1000000 102.583077
#> 26               2           11       1000000  26.836147
#> 27               2           11       1000000  51.371244
#> 28               2           11       1000000  78.551500
#> 29               2           11       1000000  47.672274
#> 30               2           11       1000000  55.709694
#> 31               2           11       1000000  35.524472
#> 32               2           33       1000000  64.882217
#> 33               2           33       1000000  34.682140
#> 34               2           33       1000000  79.516792
#> 35               2           33       1000000  58.803675
#> 36               2           33       1000000  75.111469
#> 37               2           33       1000000  22.656255
#> 38               2           33       1000000  72.238998
#> 39               2           33       1000000 103.250435
#> 40               2           33       1000000  38.931583
#> 41               2           33       1000000  33.208845
#> 42               2           33       1000000  57.534464
#> 43               2           33       1000000  10.908014
#> 44               2           33       1000000  51.381885
#> 45               2           33       1000000  34.938894
#> 46               2           33       1000000  61.747545
#> 47               2           33       1000000  68.644798
#> 48               2           33       1000000  70.566112
#> 49               2           33       1000000  83.447373
#> 50               2           33       1000000  57.501920
#> 51               2           33       1000000  54.253181
#> 52               2           33       1000000 114.788420
#> 53               2           33       1000000  67.986970
#> 54               2           33       1000000  46.436132
#> 55               2           33       1000000  79.014318
#> 56               2           33       1000000  68.913363
#> 57               2           33       1000000  36.833198
#> 58               2           33       1000000  51.910930
#> 59               2           33       1000000  56.687923
#> 60               2           33       1000000  57.351738
#> 61               2           33       1000000  39.437302
#> 62               3           33       1000000  98.147279
#> 63               3           33       1000000  30.748843
#> 64               3           33       1000000  75.268144
#> 65               3           33       1000000  27.425275
#> 66               3           33       1000000  34.717554
#> 67               3           33       1000000  53.806683
#> 68               3           33       1000000  55.425024
#> 69               3           33       1000000  49.924044
#> 70               3           33       1000000  38.121637
#> 71               3           33       1000000  19.354689
#> 72               3           33       1000000  43.140574
#> 73               3           33       1000000  69.656046
#> 74               3           33       1000000  71.908034
#> 75               3           33       1000000  32.262624
#> 76               3           33       1000000  47.876839
#> 77               3           33       1000000  67.085423
#> 78               3           33       1000000  28.020961
#> 79               3           33       1000000  61.659556
#> 80               3           33       1000000  53.269295
#> 81               3           33       1000000  63.882170
#> 82               3           33       1000000  81.566088
#> 83               3           33       1000000  54.496470
#> 84               3           33       1000000  56.712995
#> 85               3           33       1000000  50.893850
#> 86               3           33       1000000  69.373930
#> 87               3           33       1000000  35.443502
#> 88               3           33       1000000  63.038038
#> 89               3           33       1000000  44.128247
#> 90               3           33       1000000  66.718776
#> 91               3           33       1000000  71.218974
#> 92               3           33       1000000  79.463792
#> 93               3           33       1000000  25.056493
#> 94               3           33       1000000  23.295529
#> 95               3           33       1000000  92.879022
#> 96               3           33       1000000  60.152056
#> 97               3           33       1000000  46.853013
#> 98               3           33       1000000  51.045457
#> 99               3           33       1000000  77.908915
#> 100              3           33       1000000  72.326115
#> 101              3           33       1000000  59.884483
#> 102              3           33       1000000  64.477164
#> 103              3           33       1000000  50.925914
#> 104              3           33       1000000  51.877015
#> 105              3           33       1000000  68.249278
#> 106              3           33       1000000  59.045893
#> 107              3           33       1000000  83.988432
#> 108              3           33       1000000 107.745697
#> 109              3           33       1000000  28.467642
#> 110              3           33       1000000  45.899264
#> 111              3           33       1000000  52.510526
#> 112              3           33       1000000  91.983576
#> 113              3           33       1000000  38.802687
#> 114              3           33       1000000  39.366520
#> 115              3           33       1000000  78.206490
#> 116              3           33       1000000  84.366941
#> 117              3           33       1000000  56.077878
#> 118              3           33       1000000  68.915290
#> 119              3           33       1000000  29.645881
#> 120              3           33       1000000  71.960006
#> 121              3           33       1000000  67.377829
#> 122              3           33       1000000  50.415592
#> 123              3           33       1000000  93.367074
#> 124              3           33       1000000  83.840652
#> 125              3           33       1000000  25.646522
#> 126              3           33       1000000  33.794578
#> 127              3           33       1000000  71.512498
#> 128              3           33       1000000  69.659402
#> 129              3           33       1000000  53.636883
#> 130              3           33       1000000  49.823052
#> 131              3           33       1000000  39.515505
#> 132              3           33       1000000  25.663573
#> 133              3           33       1000000  86.180821
#> 134              3           33       1000000  53.806114
#> 135              3           33       1000000  47.030779
#> 136              3           33       1000000  26.037175
#> 137              3           33       1000000  73.151219
#> 138              3           33       1000000  68.409270
#> 139              3           33       1000000  77.847163
#> 140              3           33       1000000  45.616034
#> 141              3           33       1000000  65.195796
#> 142              3           33       1000000 108.786469
#> 143              3           33       1000000  90.008228
#> 144              3           33       1000000  58.365707
#> 145              3           33       1000000  57.773579
#> 146              3           33       1000000  29.650582
#> 147              3           33       1000000  70.264573
#> 148              3           33       1000000  29.204276
#> 149              3           33       1000000  47.695558
#> 150              3           33       1000000  76.746140
#> 151              3           33       1000000  17.825893
#> 152              3           33       1000000  48.075031
#> 153              3           33       1000000  79.562358
#> 154              3           33       1000000 100.304584
#> 155              3           33       1000000  34.261424
#> 156              3           33       1000000  43.418882
#> 157              3           33       1000000  76.721807
#> 158              3           33       1000000  38.832853
#> 159              3           33       1000000  45.864744
#> 160              3           33       1000000 128.368041
#> 161              3           33       1000000  64.095696
#> 162              3           33       1000000  45.972762
#> 163              3           33       1000000  52.756874
#> 164              3           33       1000000  69.785955
#> 165              3           33       1000000  73.915949
#> 166              3           33       1000000 115.927847
#> 167              3           33       1000000  32.679090
#> 168              3           33       1000000  32.898425
#> 169              3           33       1000000  47.477019
#> 170              3           33       1000000  29.316284
#> 171              3           33       1000000  87.942060
#> 172              3           33       1000000  57.390543
#> 173              3           33       1000000  36.953579
#> 174              3           33       1000000  69.755261
#> 175              3           33       1000000  49.145921
#> 176              3           33       1000000  62.449275
#> 177              3           33       1000000  60.953218
#> 178              3           33       1000000  44.075687
#> 179              3           33       1000000  61.086816
#> 180              3           33       1000000  31.411838
#> 181              3           33       1000000  56.779728
#> 182              3           33       1000000  25.160871
#> 183              3           33       1000000  32.975984
#> 184              3           33       1000000 122.298461
#> 185              3           33       1000000  23.199826
#> 186              3           33       1000000  33.455200
#> 187              3           33       1000000  40.375046
#> 188              3           33       1000000  55.842347
#> 189              3           33       1000000  75.299210
#> 190              3           33       1000000  20.955496
#> 191              3           33       1000000  48.960173
#> 192              3           33       1000000  29.730138
#> 193              3           33       1000000  49.349403
#> 194              3           33       1000000 135.336246
#> 195              3           33       1000000  56.038872
#> 196              3           33       1000000  52.464844
#> 197              3           33       1000000  89.524028
#> 198              3           33       1000000  32.692130
#> 199              3           33       1000000  37.739244
#> 200              3           33       1000000  42.135474
#> 201              3           33       1000000  45.345738
#> 202              3           33       1000000  50.124731
#> 203              3           33       1000000  38.564274
#> 204              3           33       1000000  44.549903
#> 205              3           33       1000000  48.231725
#> 206              3           33       1000000  35.023159
#> 207              3           33       1000000  74.250106
#> 208              3           33       1000000  70.560003
#> 209              3           33       1000000  62.913629
#> 210              3           33       1000000  48.643263
#> 211              3           33       1000000  59.291908
#> 212              3           33       1000000  34.908093
#> 213              3           33       1000000   2.433083
#> 214              3           33       1000000  23.160679
#> 215              3           33       1000000  69.598402
#> 216              3           33       1000000  71.997129
#> 217              3           33       1000000 107.579296
#> 218              3           33       1000000  86.357989
#> 219              3           33       1000000  73.158142
#> 220              3           33       1000000  39.896010
#> 221              3           33       1000000  48.893234
#> 222              3           33       1000000  53.072595
#> 223              3           33       1000000  76.445741
#> 224              3           33       1000000  62.958620
#> 225              3           33       1000000  65.936135
#> 226              3           33       1000000  56.980614
#> 227              3           33       1000000  75.605598
#> 228              3           33       1000000  40.574599
#> 229              3           33       1000000  47.549517
#> 230              3           33       1000000  45.449567
#> 231              3           33       1000000  77.913005
#> 232              3           33       1000000  26.963687
#> 233              3           33       1000000  37.229058
#> 234              3           33       1000000 152.896047
#> 235              3           33       1000000  38.755804
#> 236              3           33       1000000  56.717485
#> 237              3           33       1000000  70.784882
#> 238              3           33       1000000  29.701507
#> 239              3           33       1000000  28.294291
#> 240              3           33       1000000  22.332932
#> 241              3           33       1000000  35.484591
#> 242              3           33       1000000  63.124152
#> 243              3           33       1000000  25.477362
#> 244              3           33       1000000  63.744154
#> 245              3           33       1000000  24.560695
#> 246              3           33       1000000  81.913318
#> 247              3           33       1000000  76.672729
#> 248              3           33       1000000  51.163113
#> 249              3           33       1000000 119.560941
#> 250              3           33       1000000  49.762116
#> 251              3           33       1000000  25.149279
#> 252              3           33       1000000  20.892370
#> 253              3           33       1000000  44.226174
#> 254              3           33       1000000  60.539434
#> 255              3           33       1000000  28.644657
#> 256              3           33       1000000 103.158925
#> 257              3           33       1000000  31.699307
#> 258              3           33       1000000  60.374336
#> 259              3           33       1000000  47.534396
#> 260              3           33       1000000  57.069178
#> 261              3           33       1000000  48.001720
#> 262              3           33       1000000  63.797343
#> 263              3           33       1000000  55.088731
#> 264              3           33       1000000  39.617043
#> 265              3           33       1000000  50.553100
#> 266              3           33       1000000  68.618812
#> 267              3           33       1000000  40.826701
#> 268              3           33       1000000  28.803142
#> 269              3           33       1000000  51.971276
#> 270              3           33       1000000  40.303751
#> 271              3           33       1000000 135.006900
#> 272              3           33       1000000  56.060343
#> 273              3           33       1000000  66.997637
#> 274              3           33       1000000  38.128145
#> 275              3           33       1000000  47.421481
#> 276              3           33       1000000  81.476415
#> 277              3           33       1000000  29.446471
#> 278              3           33       1000000  74.210907
#> 279              3           33       1000000  37.324086
#> 280              3           33       1000000  42.656386
#> 281              3           33       1000000  83.883655
#> 282              3           33       1000000  28.433750
#> 283              3           33       1000000  57.030431
#> 284              3           33       1000000  84.329541
#> 285              3           33       1000000  24.861215
#> 286              3           33       1000000  21.141394
#> 287              3           33       1000000  68.750657
#> 288              3           33       1000000  36.222445
#> 289              3           33       1000000  61.681789
#> 290              3           33       1000000  48.445726
#> 291              3           33       1000000  38.227222
#> 292              3           33       1000000  73.002640
#> 293              3           33       1000000  63.831269
#> 294              3           33       1000000  80.632022
#> 295              3           33       1000000  56.276432
#> 296              3           33       1000000  51.416004
#> 297              3           33       1000000  34.597834
#> 298              3           33       1000000  52.537812
#> 299              3           33       1000000 104.769658
#> 300              3           33       1000000 101.586055
#> 301              3           33       1000000  23.831475
#> 302              3           33       1000000  33.058087
#> 303              3           33       1000000  61.915707
#> 304              3           33       1000000  43.484638
#> 305              3           33       1000000  24.362427
#> 306              3           33       1000000  48.822807
#> 307              3           33       1000000  56.708683
#> 308              3           33       1000000  56.389843
#> 309              3           33       1000000  33.770167
#> 310              3           33       1000000  54.334336
#> 311              3           33       1000000  83.496699
#> 312              3           33       1000000  61.205478
#> 313              3           33       1000000  60.813982
#> 314              3           33       1000000  64.397672
#> 315              3           33       1000000  32.528854
#> 316              3           33       1000000  46.607807
#> 317              3           33       1000000  86.211524
#> 318              3           33       1000000  21.268492
#> 319              3           33       1000000  51.203885
#> 320              3           33       1000000  53.566657
#> 321              3           33       1000000  48.577897
#> 322              3           33       1000000  29.630928
#> 323              3           33       1000000 108.575554
#> 324              3           33       1000000  36.968890
#> 325              3           33       1000000  37.552135
#> 326              3           33       1000000  31.372824
#> 327              3           33       1000000  43.751705
#> 328              3           33       1000000  60.325633
#> 329              3           33       1000000  65.256054
#> 330              3           33       1000000  58.448542
#> 331              3           33       1000000  82.688189
#> 332              3           33       1000000 121.724793
#> 333              3           33       1000000  41.854913
#> 334              3           33       1000000  19.930936
#> 335              3           33       1000000  65.337188
#> 336              3           33       1000000  55.061614
#> 337              3           33       1000000  35.512166
#> 338              3           33       1000000  44.674916
#> 339              3           33       1000000  49.891847
#> 340              3           33       1000000  21.428385
#> 341              3           33       1000000  50.389977
#> 342              3           33       1000000  24.944592
#> 343              3           33       1000000  80.438255
#> 344              3           33       1000000  44.455588
#> 345              3           33       1000000  65.785485
#> 346              3           33       1000000  73.892484
#> 347              3           33       1000000  61.252892
#> 348              3           33       1000000  31.770214
#> 349              3           33       1000000  40.966640
#> 350              3           33       1000000  49.046024
#> 351              3           33       1000000  42.735570
#> 352              3           33       1000000  29.091809
#> 353              3           33       1000000  39.644066
#> 354              3           33       1000000  84.078855
#> 355              4           33       1000000  54.203019
#> 356              4           33       1000000  67.178369
#> 357              4           33       1000000  75.588862
#> 358              4           33       1000000  60.868520
#> 359              4           33       1000000  66.731772
#> 360              4           33       1000000  96.851785
#> 361              4           33       1000000  52.930084
#> 362              4           33       1000000  76.507307
#> 363              4           33       1000000  56.583048
#> 364              4           33       1000000  42.641121
#> 365              4           33       1000000  40.441849
#> 366              4           33       1000000  51.169624
#> 367              4           33       1000000  73.806867
#> 368              4           33       1000000  20.704331
#> 369              4           33       1000000  60.268086
#> 370              4           33       1000000 108.446231
#> 371              4           33       1000000  37.134990
#> 372              4           33       1000000  55.344255
#> 373              4           33       1000000  61.161163
#> 374              4           33       1000000  25.995113
#> 375              4           33       1000000  64.253414
#> 376              4           33       1000000  56.730884
#> 377              4           33       1000000  43.440137
#> 378              4           33       1000000  52.352838
#> 379              4           33       1000000  45.877706
#> 380              4           33       1000000  35.526826
#> 381              4           33       1000000  74.129935
#> 382              4           33       1000000  69.729958
#> 383              4           33       1000000  60.284575
#> 384              4           33       1000000  97.348041
#> 385              4           33       1000000  46.477291
#> 386              4           33       1000000  33.233980
#> 387              4           33       1000000  59.087706
#> 388              4           33       1000000  59.013131
#> 389              4           33       1000000  58.360601
#> 390              4           33       1000000  58.387454
#> 391              4           33       1000000  33.951958
#> 392              4           33       1000000  81.848146
#> 393              4           33       1000000  48.662637
#> 394              4           33       1000000 101.286548
#> 395              4           33       1000000  58.539501
#> 396              4           33       1000000  34.029930
#> 397              4           33       1000000  86.660747
#> 398              4           33       1000000  37.464558
#> 399              4           33       1000000  34.632895
#> 400              4           33       1000000  44.538762
#> 401              4           33       1000000  59.063970
#> 402              4           33       1000000  57.081123
#> 403              4           33       1000000  86.649586
#> 404              4           33       1000000  60.085123
#> 405              4           33       1000000 105.698852
#> 406              4           33       1000000  91.539347
#> 407              4           33       1000000  57.993834
#> 408              4           33       1000000  51.290498
#> 409              4           33       1000000  64.508902
#> 410              4           33       1000000  39.809685
#> 411              4           33       1000000  21.037266
#> 412              4           33       1000000  40.280099
#> 413              4           33       1000000  40.058650
#> 414              4           33       1000000  27.743157
#> 415              4           33       1000000  39.033656
#> 416              4           33       1000000  65.117564
#> 417              4           33       1000000  91.543728
#> 418              4           33       1000000  47.903933
#> 419              4           33       1000000  30.335991
#> 420              4           33       1000000  35.637265
#> 421              4           33       1000000  52.177694
#> 422              4           33       1000000  74.974762
#> 423              4           33       1000000  79.078523
#> 424              4           33       1000000  79.241714
#> 425              4           33       1000000  66.970031
#> 426              4           33       1000000  82.122257
#> 427              4           33       1000000  55.748999
#> 428              4           33       1000000  46.093992
#> 429              4           33       1000000  58.325738
#> 430              4           33       1000000  53.508600
#> 431              4           33       1000000  76.202900
#> 432              4           33       1000000  37.405636
#> 433              4           33       1000000  44.634716
#> 434              4           33       1000000  46.946678
#> 435              4           33       1000000  37.006231
#> 436              4           33       1000000  53.388474
#> 437              4           33       1000000  33.292931
#> 438              4           33       1000000  38.858000
#> 439              4           33       1000000  64.088829
#> 440              4           33       1000000  79.832932
#> 441              4           33       1000000  62.175323
#> 442              4           33       1000000 128.894133
#> 443              4           33       1000000  49.829470
#> 444              4           33       1000000  56.292434
#> 445              4           33       1000000  25.157802
#> 446              4           33       1000000  43.828221
#> 447              4           33       1000000  14.448033
#> 448              4           33       1000000  56.596734
#> 449              4           33       1000000  77.794770
#> 450              4           33       1000000  47.571002
#> 451              4           33       1000000  30.069185
#> 452              4           33       1000000 120.353558
#> 453              4           33       1000000  65.577399
#> 454              4           33       1000000 109.146658
#> 455              4           33       1000000  71.277446
#> 456              4           33       1000000  53.736498
#> 457              4           33       1000000  86.979785
#> 458              4           33       1000000  27.960745
#> 459              4           33       1000000  29.779241
#> 460              4           33       1000000  74.080738
#> 461              4           33       1000000  92.285210
#> 462              4           33       1000000  57.671147
#> 463              4           33       1000000  64.507579
#> 464              4           33       1000000  75.550045
#> 465              4           33       1000000  69.863665
#> 466              4           33       1000000  76.024209
#> 467              4           33       1000000  62.479275
#> 468              4           33       1000000  53.120527
#> 469              4           33       1000000  41.110541
#> 470              4           33       1000000  64.095092
#> 471              4           33       1000000  51.352368
#> 472              4           33       1000000  49.997451
#> 473              4           33       1000000  39.735985
#> 474              4           33       1000000  19.086596
#> 475              4           33       1000000  33.049614
#> 476              4           33       1000000  57.492367
#> 477              4           33       1000000  56.725679
#> 478              4           33       1000000  68.462501
#> 479              4           33       1000000 100.938548
#> 480              4           33       1000000  60.670710
#> 481              4           33       1000000  30.466023
#> 482              4           33       1000000  45.781238
#> 483              4           33       1000000  55.862102
#> 484              4           33       1000000  70.157942
#> 485              4           33       1000000  64.047316
#> 486              4           33       1000000  68.475373
#> 487              4           33       1000000  51.523617
#> 488              4           33       1000000  77.207634
#> 489              4           33       1000000  72.473547
#> 490              4           33       1000000  35.430781
#> 491              4           33       1000000  41.197485
#> 492              4           33       1000000  78.703410
#> 493              4           33       1000000  58.605042
#> 494              4           33       1000000  22.784274
#> 495              4           33       1000000  39.938041
#> 496              4           33       1000000  76.666423
#> 497              4           33       1000000  28.650320
#> 498              4           33       1000000  49.555612
#> 499              4           33       1000000  56.643241
#> 500              4           33       1000000  48.512483
#> 501              4           33       1000000  65.115322
#> 502              4           33       1000000  35.255772
#> 503              4           33       1000000  28.614740
#> 504              4           33       1000000  75.377539
#> 505              4           33       1000000  29.257484
#> 506              4           33       1000000  25.135313
#> 507              4           33       1000000  72.800787
#> 508              4           33       1000000  47.669018
#> 509              4           33       1000000  48.918843
#> 510              4           33       1000000  39.247019
#> 511              4           33       1000000  76.790697
#> 512              4           33       1000000  70.471682
#> 513              4           33       1000000  65.064259
#> 514              4           33       1000000  97.394751
#> 515              4           33       1000000  53.823558
#> 516              4           33       1000000  61.743601
#> 517              4           33       1000000  89.042330
#> 518              4           33       1000000  85.690230
#> 519              4           33       1000000  81.149971
#> 520              4           33       1000000  70.371326
#> 521              4           33       1000000  48.481486
#> 522              4           33       1000000  65.565866
#> 523              4           33       1000000  65.702004
#> 524              4           33       1000000  21.221113
#> 525              4           33       1000000  45.228044
#> 526              4           33       1000000  54.071782
#> 527              4           33       1000000 134.642686
#> 528              4           33       1000000  61.188200
#> 529              4           33       1000000  58.453208
#> 530              4           33       1000000  49.043447
#> 531              4           33       1000000  35.895375
#> 532              4           33       1000000  71.505615
#> 533              4           33       1000000  65.081274
#> 534              4           33       1000000  39.895155
#> 535              4           33       1000000  27.142992
#> 536              4           44       1000000  78.346378
#> 537              4           44       1000000  34.272121
#> 538              4           44       1000000  80.314380
#> 539              4           44       1000000  70.267884
#> 540              4           44       1000000  62.415815
#> 541              4           44       1000000  37.448232
#> 542              4           44       1000000  20.804623
#> 543              4           44       1000000  68.634677
#> 544              4           44       1000000  36.536117
#> 545              4           44       1000000  52.641940
#> 546              4           44       1000000  69.673895
#> 547              4           44       1000000  64.388794
#> 548              4           44       1000000  62.338358
#> 549              4           44       1000000  44.505296
#> 550              4           44       1000000  80.892681
#> 551              4           44       1000000  53.446124
#> 552              4           44       1000000  60.354119
#> 553              4           44       1000000  27.330509
#> 554              4           44       1000000  55.173120
#> 555              4           44       1000000  45.537429
#> 556              4           44       1000000  69.054433
#> 557              4           44       1000000  68.468241
#> 558              4           44       1000000  36.138329
#> 559              4           44       1000000  74.561180
#> 560              4           44       1000000  35.641910
#> 561              4           44       1000000  79.401949
#> 562              4           44       1000000  16.015336
#> 563              4           44       1000000  19.135535
#> 564              4           44       1000000  66.525145
#> 565              4           44       1000000 117.272899
#> 566              4           44       1000000  67.472329
#> 567              4           44       1000000  35.423062
#> 568              4           44       1000000  39.362759
#> 569              4           44       1000000  80.712696
#> 570              4           44       1000000  90.099535
#> 571              4           44       1000000  45.067754
#> 572              4           44       1000000  70.017763
#> 573              4           44       1000000  41.237882
#> 574              4           44       1000000  94.443451
#> 575              4           44       1000000 112.985169
#> 576              4           44       1000000  22.196398
#> 577              4           44       1000000  32.633541
#> 578              4           44       1000000  55.121286
#> 579              4           44       1000000  80.880321
#> 580              4           44       1000000  42.363262
#> 581              4           44       1000000  40.648547
#> 582              4           44       1000000  55.183333
#> 583              4           44       1000000 100.792997
#> 584              4           44       1000000  34.690702
#> 585              4           44       1000000  42.103545
#> 586              4           44       1000000  28.132226
#> 587              4           44       1000000  68.961722
#> 588              4           44       1000000  42.829651
#> 589              4           44       1000000  82.306452
#> 590              4           44       1000000  36.361908
#> 591              4           44       1000000  17.494052
#> 592              4           44       1000000  52.139130
#> 593              4           44       1000000  35.838980
#> 594              4           44       1000000  31.581157
#> 595              4           44       1000000  49.674727
#> 596              4           44       1000000  56.717275
#> 597              4           44       1000000  39.765909
#> 598              4           44       1000000  31.180252
#> 599              4           44       1000000  24.931499
#> 600              4           44       1000000  55.384304
#> 601              4           44       1000000 109.408424
#> 602              4           44       1000000  37.666817
#> 603              4           44       1000000  45.130505
#> 604              4           44       1000000  29.442764
#> 605              4           44       1000000  56.295073
#> 606              4           44       1000000  70.312275
#> 607              4           44       1000000  57.463570
#> 608              4           44       1000000  56.463350
#> 609              4           44       1000000  59.730587
#> 610              4           44       1000000  64.476969
#> 611              4           44       1000000  45.615425
#> 612              4           44       1000000  64.667770
#> 613              4           44       1000000  57.992149
#> 614              4           44       1000000  64.738984
#> 615              4           44       1000000  46.922219
#> 616              4           44       1000000  46.553432
#> 617              4           44       1000000  38.395983
#> 618              4           44       1000000  29.393342
#> 619              4           44       1000000  68.454935
#> 620              4           44       1000000  75.874061
#> 621              4           44       1000000  23.183997
#> 622              4           44       1000000  61.917056
#> 623              4           44       1000000  44.944349
#> 624              4           44       1000000  19.871987
#> 625              4           44       1000000  69.808710
#> 626              4           44       1000000  79.031925
#> 627              4           44       1000000  66.223217
#> 628              4           44       1000000  61.407122
#> 629              4           44       1000000  47.661828
#> 630              4           44       1000000  62.581674
#> 631              4           44       1000000  39.693592
#> 632              4           44       1000000  70.266291
#> 633              4           44       1000000  44.000939
#> 634              4           44       1000000  25.570008
#> 635              4           44       1000000  36.191989
#> 636              4           44       1000000  67.197333
#> 637              4           44       1000000  27.935220
#> 638              4           44       1000000  51.448239
#> 639              4           44       1000000  53.188514
#> 640              4           44       1000000  63.179862
#> 641              4           44       1000000  32.879390
#> 642              4           44       1000000  23.614716
#> 643              4           44       1000000  67.715335
#> 644              4           44       1000000  54.278485
#> 645              4           44       1000000  26.340821
#> 646              4           44       1000000  65.926944
#> 647              4           44       1000000 118.472987
#> 648              4           44       1000000  29.354595
#> 649              4           44       1000000  54.478360
#> 650              4           44       1000000  68.319764
#> 651              4           44       1000000  76.576907
#> 652              4           44       1000000  64.543062
#> 653              4           44       1000000  51.954920
#> 654              4           44       1000000  59.660770
#> 655              4           44       1000000  63.528871
#> 656              4           44       1000000  43.704760
#> 657              4           44       1000000  27.577732
#> 658              4           44       1000000  27.770979
#> 659              4           44       1000000  63.555539
#> 660              4           44       1000000  79.562714
#> 661              4           44       1000000  29.044600
#> 662              4           44       1000000  33.527942
#> 663              4           44       1000000  74.723349
#> 664              4           44       1000000  84.457636
#> 665              4           44       1000000  36.163229
#> 666              4           44       1000000  15.423912
#> 667              4           44       1000000  33.007574
#> 668              4           44       1000000  58.550162
#> 669              4           44       1000000  29.859466
#> 670              4           44       1000000  36.428784
#> 671              4           44       1000000 131.740776
#> 672              4           44       1000000  32.589032
#> 673              4           44       1000000  98.589127
#> 674              4           44       1000000  54.791743
#> 675              4           44       1000000  44.087052
#> 676              4           44       1000000 115.710793
#> 677              4           44       1000000  52.785058
#> 678              4           44       1000000  52.817662
#> 679              4           44       1000000  77.326567
#> 680              4           44       1000000   3.286706
#> 681              4           44       1000000  60.515543
#> 682              4           44       1000000  18.037567
#> 683              4           44       1000000  34.888666
#> 684              4           44       1000000  49.635756
#> 685              4           44       1000000  70.844993
#> 686              4           44       1000000  73.574017
#> 687              4           44       1000000  62.926658
#> 688              4           44       1000000  43.312454
#> 689              4           44       1000000  47.574059
#> 690              4           44       1000000  49.593332
#> 691              4           44       1000000 108.735648
#> 692              4           44       1000000  49.484549
#> 693              4           44       1000000  50.632422
#> 694              4           44       1000000  44.787893
#> 695              4           44       1000000  57.226642
#> 696              4           44       1000000  18.721809
#> 697              4           44       1000000  42.528739
#> 698              4           44       1000000  65.024283
#> 699              4           44       1000000  85.902736
#> 700              4           44       1000000  37.032532
#> 701              4           44       1000000  67.606921
#> 702              4           44       1000000  47.564307
#> 703              4           44       1000000  75.781746
#> 704              4           44       1000000  38.796426
#> 705              4           44       1000000  57.550139
#> 706              4           44       1000000  45.978689
#> 707              4           28       1000000  64.843426
#> 708              4           28       1000000  80.032902
#> 709              4           28       1000000  51.126684
#> 710              4           28       1000000  61.050439
#> 711              4           28       1000000  38.718042
#> 712              4           28       1000000  37.589364
#> 713              4           28       1000000  57.739668
#> 714              4           28       1000000  51.800354
#> 715              4           28       1000000  36.716959
#> 716              4           28       1000000  40.648409
#> 717              4           28       1000000  33.852104
#> 718              4           28       1000000  44.157744
#> 719              4           28       1000000  52.817454
#> 720              4           28       1000000  90.357332
#> 721              4           28       1000000  45.143275
#> 722              4           28       1000000  52.472680
#> 723              4           28       1000000  78.960642
#> 724              4           28       1000000 132.003790
#> 725              4           28       1000000  49.052039
#> 726              4           28       1000000  46.930375
#> 727              4           28       1000000  73.779204
#> 728              4           28       1000000  65.657372
#> 729              4           28       1000000  67.997597
#> 730              4           28       1000000  33.122989
#> 731              4           28       1000000  51.925084
#> 732              4           28       1000000  54.738590
#> 733              4           28       1000000  74.758033
#> 734              4           28       1000000  51.354827
#> 735              4           28       1000000  77.709055
#> 736              4           28       1000000  75.693421
#> 737              4           28       1000000  81.714152
#> 738              4           28       1000000  60.871290
#> 739              4           28       1000000  14.679521
#> 740              4           28       1000000  81.102613
#> 741              4           28       1000000  57.425892
#> 742              4           28       1000000  49.677256
#> 743              4           28       1000000  61.256324
#> 744              4           28       1000000  32.917500
#> 745              4           28       1000000  34.894168
#> 746              4           28       1000000  53.614658
#> 747              4           28       1000000  58.987759
#> 748              4           28       1000000  80.830933
#> 749              4           28       1000000  46.010051
#> 750              4           28       1000000  47.409060
#> 751              4           28       1000000  42.907431
#> 752              4           28       1000000  70.113633
#> 753              4           28       1000000  55.597826
#> 754              4           28       1000000  71.637742
#> 755              4           28       1000000  57.938269
#> 756              4           28       1000000  67.851210
#> 757              4           28       1000000  93.426942
#> 758              4           28       1000000  41.910409
#> 759              4           28       1000000  52.552683
#> 760              4           28       1000000  73.078790
#> 761              4           28       1000000  50.047814
#> 762              4           28       1000000 111.337235
#> 763              4           28       1000000 106.835115
#> 764              4           28       1000000  25.397531
#> 765              4           28       1000000  32.599408
#> 766              4           28       1000000  62.840588
#> 767              4           28       1000000  21.311307
#> 768              4           28       1000000  34.631738
#> 769              4           28       1000000  18.846465
#> 770              4           28       1000000  52.249301
#> 771              4           28       1000000  76.369956
#> 772              4           28       1000000  56.895147
#> 773              4           28       1000000  41.822514
#> 774              4           28       1000000  35.768661
#> 775              4           28       1000000  36.261784
#> 776              4           28       1000000  35.463677
#> 777              4           28       1000000  63.243512
#> 778              4           28       1000000  27.543115
#> 779              4           28       1000000  32.907645
#> 780              4           28       1000000  55.252280
#> 781              4           28       1000000 123.464193
#> 782              4           28       1000000  75.406446
#> 783              4           28       1000000  44.621023
#> 784              4           28       1000000  40.299035
#> 785              4           28       1000000  85.178431
#> 786              4           28       1000000  19.095101
#> 787              4           28       1000000  61.530650
#> 788              4           28       1000000  46.482826
#> 789              4           28       1000000  57.908689
#> 790              4           28       1000000  56.705070
#> 791              4           28       1000000  36.915749
#> 792              4           28       1000000  32.157455
#> 793              4           28       1000000  62.913027
#> 794              4           28       1000000  67.940234
#> 795              4           28       1000000  24.876444
#> 796              4           28       1000000  62.227959
#> 797              4           28       1000000  83.994826
#> 798              4           28       1000000  59.812823
#> 799              4           28       1000000  55.669671
#> 800              4           28       1000000  85.849087
#> 801              4           28       1000000  61.503903
#> 802              4           28       1000000  19.689135
#> 803              4           28       1000000  42.133463
#> 804              4           28       1000000  63.044368
#> 805              4           28       1000000  49.409385
#> 806              4           28       1000000  57.657297
#> 807              4           28       1000000  24.447865
#> 808              4           28       1000000  60.401362
#> 809              4           28       1000000  51.199131
#> 810              4           28       1000000  53.914756
#> 811              4           28       1000000  65.955846
#> 812              4           28       1000000 126.290493
#> 813              4           28       1000000  73.845951
#> 814              4           28       1000000  44.276039
#> 815              4           28       1000000  27.577569
#> 816              4           28       1000000  59.812627
#> 817              4           28       1000000 118.222010
#> 818              4           28       1000000  52.645695
#> 819              4           28       1000000  74.979791
#> 820              4           28       1000000  33.025454
#> 821              4           28       1000000  55.349114
#> 822              4           28       1000000  56.683472
#> 823              4           28       1000000  64.583642
#> 824              4           28       1000000   9.095179
#> 825              4           28       1000000  86.343856
#> 826              4           28       1000000  70.758766
#> 827              4           28       1000000  88.859248
#> 828              4           28       1000000  46.430512
#> 829              4           28       1000000  54.885143
#> 830              4           28       1000000  61.364186
#> 831              4           28       1000000  44.248569
#> 832              4           28       1000000  82.339603
#> 833              4           28       1000000  48.798651
#> 834              4           28       1000000  61.679420
#> 835              4           28       1000000  62.036220
#> 836              4           28       1000000  40.486997
#> 837              4           28       1000000  60.782041
#> 838              4           28       1000000  16.511371
#> 839              4           28       1000000 105.418487
#> 840              4           28       1000000  51.209768
#> 841              4           28       1000000  63.706051
#> 842              4           99       1000000  73.904216
#> 843              4           99       1000000  43.254175
#> 844              4           99       1000000  26.532198
#> 845              4           99       1000000  50.977651
#> 846              4           99       1000000  97.101312
#> 847              4           99       1000000  82.637353
#> 848              4           99       1000000  64.677603
#> 849              4           99       1000000  60.421660
#> 850              4           99       1000000  57.677990
#> 851              4           99       1000000  54.698233
#> 852              4           99       1000000  20.296716
#> 853              4           99       1000000  60.115443
#> 854              4           99       1000000  47.590958
#> 855              4           99       1000000  56.499472
#> 856              4           99       1000000  72.965886
#> 857              4           99       1000000  53.701349
#> 858              4           99       1000000  46.696109
#> 859              4           99       1000000  40.384504
#> 860              4           99       1000000 108.003027
#> 861              4           99       1000000  44.802788
#> 862              4           99       1000000  59.039484
#> 863              4           99       1000000  55.217029
#> 864              4           99       1000000  35.467426
#> 865              4           99       1000000  47.924175
#> 866              4           99       1000000  52.984954
#> 867              4           99       1000000  53.246251
#> 868              4           99       1000000  67.524013
#> 869              4           99       1000000  52.763181
#> 870              4           99       1000000  42.479339
#> 871              4           99       1000000  46.306939
#> 872              4           99       1000000 100.259941
#> 873              4           99       1000000  49.919981
#> 874              4           99       1000000  39.884483
#> 875              4           99       1000000  61.418255
#> 876              4           99       1000000  30.543605
#> 877              4           99       1000000  79.699849
#> 878              4           99       1000000  52.967139
#> 879              4           99       1000000  89.608284
#> 880              4           99       1000000  52.071546
#> 881              4           99       1000000  45.976124
#> 882              4           99       1000000  47.810826
#> 883              4           99       1000000 108.691288
#> 884              4           99       1000000 112.019875
#> 885              4           99       1000000  45.149456
#> 886              4           99       1000000  16.052127
#> 887              4           99       1000000  54.271566
#> 888              4           99       1000000  30.501038
#> 889              4           99       1000000  35.718151
#> 890              4           99       1000000  68.646424
#> 891              4           99       1000000  59.145559
#> 892              4           99       1000000  41.188875
#> 893              4           99       1000000  18.432279
#> 894              4           99       1000000  32.501186
#> 895              4           99       1000000  51.689894
#> 896              4           99       1000000  40.568329
#> 897              4           99       1000000  74.686516
#> 898              4           99       1000000  55.914064
#> 899              4           99       1000000  56.714817
#> 900              4           99       1000000  39.964888
#> 901              4           99       1000000  43.107921
#> 902              4           99       1000000 117.533823
#> 903              4           99       1000000  44.168305
#> 904              4           99       1000000  52.173943
#> 905              4           99       1000000  47.234985
#> 906              4           99       1000000  54.799641
#> 907              4           99       1000000  30.553128
#> 908              4           99       1000000  48.759679
#> 909              4           99       1000000  50.743004
#> 910              4           99       1000000  60.470004
#> 911              4           99       1000000  43.113000
#> 912              4           99       1000000  50.336717
#> 913              4           99       1000000  69.765455
#> 914              4           99       1000000  61.376263
#> 915              4           99       1000000  59.629716
#> 916              4           99       1000000  72.111686
#> 917              4           99       1000000  48.841357
#> 918              4           99       1000000  77.502372
#> 919              4           99       1000000  65.924083
#> 920              4           99       1000000  33.194498
#> 921              4           99       1000000  54.836235
#> 922              4           11       1000000  53.585602
#> 923              4           11       1000000  36.492542
#> 924              4           11       1000000  98.294869
#> 925              4           11       1000000  57.183455
#> 926              4           11       1000000  80.469979
#> 927              4           11       1000000  61.477588
#> 928              5           11       1000000  51.093956
#> 929              5           11       1000000  57.248939
#> 930              5           11       1000000  52.707324
#> 931              5           11       1000000  19.944888
#> 932              5           11       1000000  66.266927
#> 933              5           11       1000000  60.638350
#> 934              5           11       1000000  24.753654
#> 935              5           11       1000000  32.137291
#> 936              5           11       1000000  44.327320
#> 937              5           11       1000000  52.440087
#> 938              5           11       1000000  55.131161
#> 939              5           11       1000000  83.417388
#> 940              5           11       1000000  62.612838
#> 941              5           11       1000000  46.932409
#> 942              5           11       1000000  29.700104
#> 943              5           11       1000000  98.529290
#> 944              5           11       1000000  21.628557
#> 945              5           11       1000000  35.158583
#> 946              5           11       1000000 100.860563
#> 947              5           11       1000000  35.319340
#> 948              5           11       1000000  34.706452
#> 949              5           11       1000000  73.928439
#> 950              5           11       1000000  82.238274
#> 951              5           11       1000000  25.965223
#> 952              5           11       1000000  98.491713
#> 953              5           11       1000000  67.895843
#> 954              5           11       1000000  60.620161
#> 955              5           11       1000000  94.209066
#> 956              5           11       1000000  47.491674
#> 957              5           11       1000000  49.963597
#> 958              5           11       1000000  24.127552
#> 959              5           11       1000000  59.916476
#> 960              5           11       1000000  63.543934
#> 961              5           11       1000000  60.860279
#> 962              5           11       1000000  61.661021
#> 963              5           11       1000000 128.326184
#> 964              5           11       1000000  63.456032
#> 965              5           11       1000000  37.386922
#> 966              5           11       1000000  77.557260
#> 967              5           11       1000000  57.449931
#> 968              5           11       1000000  92.878678
#> 969              5           11       1000000  97.279615
#> 970              5           11       1000000  62.076447
#> 971              5           11       1000000  59.693653
#> 972              5           11       1000000  59.046632
#> 973              5           11       1000000  54.108110
#> 974              5           11       1000000  37.076077
#> 975              5           11       1000000  96.175698
#> 976              5           11       1000000  44.490561
#> 977              5           11       1000000  52.566640
#> 978              5           11       1000000  69.985011
#> 979              5           11       1000000  95.048563
#> 980              5           11       1000000  42.398689
#> 981              5           11       1000000  39.109719
#> 982              5           11       1000000 112.680287
#> 983              5           11       1000000  89.676751
#> 984              5           11       1000000  67.330747
#> 985              5           11       1000000  91.554716
#> 986              5           11       1000000 113.518628
#> 987              5           11       1000000  65.597381
#> 988              5           11       1000000  56.086757
#> 989              5           11       1000000  55.893467
#> 990              5           11       1000000  64.426398
#> 991              5           11       1000000  42.790279
#> 992              5           11       1000000  69.178190
#> 993              5           11       1000000 108.804159
#> 994              5           11       1000000  33.172892
#> 995              5           11       1000000  79.216778
#> 996              5           11       1000000  86.538829
#> 997              5           11       1000000  38.992271
#> 998              5           11       1000000 105.868027
#> 999              5           11       1000000  73.264577
#> 1000             5           11       1000000 100.012671
#>       regionName statistic1 statistic2 statistic3 statistic4 statistic5
#> Area1      Area1  16.052127   25.33760   29.79480   35.22470   49.89185
#> Area2      Area2  16.511371   45.87771   57.35174   67.17837   89.04233
#> Area3      Area3  16.015336   45.91764   57.40822   67.72122   98.58913
#> Area4      Area4  10.908014   43.46807   55.91406   63.08109  108.78647
#> Area5      Area5   3.286706   44.03831   52.81745   65.16257   95.04856
#> Area6      Area6  32.692130   72.28256   89.67675  107.20721  152.89605
#> Area7      Area7  27.577569   44.50112   54.20302   65.49064  105.69885
#>   AgeCat statistic1 statistic2 statistic3 statistic4 statistic5
#> 1      1  27.960745   38.12814   55.59783   68.47537   105.4185
#> 2      2   3.286706   40.29903   55.21703   69.65940   152.8960
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
