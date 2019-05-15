---
title: Greed Kata
documentclass: scrartcl
papersize: letter
---
# Description

[Greed](http://en.wikipedia.org/wiki/Greed_(dice_game)) is a dice game about pressing your luck. A player rolls five dice and wants to win as many points as possible. For our purposes, we are going to score a single round of **five** dice rolled together.

# Requirements

Write code which will calculate a round’s score based on these rules:

| Matches | Face | Score |
|---------|------|-------|
| 1       | 1    | 100   |
| 1       | 5    | 50    |
| 3       | 1    | 1000  |
| 3       | 2    | 200   |
| 3       | 3    | 300   |
| 3       | 4    | 400   |
| 3       | 5    | 500   |
| 3       | 6    | 600   |

You can write a console app or use a [repl](https://repl.it).
You may write in the non-obscurantist language of your choice (e.g. no whitespace, shakespeare, etc.).

*Note*: Once a die is counted, it cannot be counted again.

# Examples

In the first case below, the rolls are scored as a triple of 1s, a single 5, and a single 1:  
`1000 + 50 + 100 = 1150`

| Rolls         | Points |
|---------------|--------|
| 1, 1, 1, 5, 1 | 1150   |
| 2, 3, 4, 6, 2 | 0      |
| 3, 4, 5, 3, 3 | 350    |
| 1, 5, 1, 2, 4 | 250    |
| 5, 5, 5, 5, 5 | 600    |

# Extra Credit

Support these additional rules and the score changes they create:

* The player can throw up to **six** dice.
* Four-of-a-Kind doubles the Triple score (four 2s win 400 points).
* Five-of-a-Kind quadruples the Triple score (five 2s win 800 points).
* Six-of-a-Kind multiplies the Triple score by eight (six 2s win 1600 points).
* Three Pairs (ex. 2, 2, 3, 3, 4, 4,) win 800 points.
* Straight (1, 2, 3, 4, 5, 6) wins 1200 points.
