Presentation of Roulette
========================================================
author: Marc van Leeuwen
date:february 19, 2017
autosize: true

Roulette
========================================================

A simple simulation of a roulette wheel.

- This Shiny program let you practice betting strategies on a roulette table
- You can choose to bet on a number, Odd, Even, Black and Red.
- The program shows you the Odd, Even, Black and Red statistics
- And shows you a barplot with the preceding numbers

In this slideshow a simulation of 100 roulette turns have been made.


- The link to the shiny app:http://markie1mb.shinyapps.io/ddp_course_project_roulette/
- The link to the Programfiles: http://github.com/markie1mb/DDP



The Number history and Statistics
========================================================

- In the Shiny application there are 2 datasets containing the data.





```r
NumberHist
```

```
 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 
 1  2  1  5  1  0  1  2  3  1  0  6  1  4  0  1  2  7  6  2  1  4  3  4  2 
25 26 27 28 29 30 31 32 33 34 35 36 
 4  3  6  5  3  3  1  4  3  2  1  5 
```

```r
StatsHist
```

```
    red black   odd  even
1 53.00 46.00 56.00 43.00
2  0.53  0.46  0.56  0.43
```

The Barplot
========================================================

The barplot shows you the preceding numbers.



```r
barplot(NumberHist)
```

![plot of chunk unnamed-chunk-3](Roulette_presentation-figure/unnamed-chunk-3-1.png)

Betting
========================================================

It is possible to bet.

1. You start with 500 $
2. You decide the amount you want to play with
3. You choose Number, Odd, Even, Black, Red
4. After pressing the [Bet] Button, You can see how much you win or loose...



The serverfile containing the calculatin was to big to fit in the presentation

I can only reference to server.R in https://github.com/markie1mb/DDP

