---
title: Roman & Arabic Numerals Kata
documentclass: scrartcl
papersize: letter
---
# Description

Roman numerals use letters of the latin alphabet to represent numbers:

| Symbol |  I  |   V  |  X  |   L   |      C      |       D      |       M      |
|:------:|:---:|:----:|:---:|:-----:|:-----------:|:------------:|:------------:|
|  Value | one | five | ten | fifty | one hundred | five hundred | one thousand |

It is conventional to use _additive_ and _subtractive_ combinations such as:

| Symbol | two | four | six | one thousand six hundred and ninety-seven |
|:-------|:---:|:----:|:---:|:-----------------------------------------:|
|  Value | II  |  IV  | VI  |            MDCXCVII                       |

Arabic numerals use ten digits:

| Symbol |  0   |  1  |  2  |   3   |   4  |   5  |  6  |   7   |   8  |   9  |
|:------:|:----:|:---:|:---:|:-----:|:----:|:----:|:---:|:-----:|:----:|:----:|
| Value  | zero | one | two | three | four | five | six | seven | eight| nine |

# Requirements

Write a program that converts integers between the two numeral systems.

# Examples

```
1222 → MCCXXII   3108 → MMMCVIII   1664  → MDCLXIV
LXX  → 70        XLIX → 49         CMXXI → 921
```
