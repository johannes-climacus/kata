#!/bin/sh

fizzbuzz() {
  dividesp() {
    [ "$(($1 % $2))" -eq 0 ]
  }
  if dividesp "$1" 15
  then echo "FizzBuzz"
  elif dividesp "$1" 5
  then echo "Buzz"
  elif dividesp "$1" 3
  then echo "Fizz"
  else echo "$1"
  fi
}

min=1
max=101

while [ "$min" -lt "$max" ]
do
  fizzbuzz "$min"
  true $(( min += 1 ))
done

