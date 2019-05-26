: filter
   dup 15 mod 0= if ." FizzBuzz" else
   dup  5 mod 0= if ." Buzz"     else
   dup  3 mod 0= if ." Fizz"     else
   dup .
   then then then drop ;

: fizzbuzz 1 do i 1 + filter cr loop ;

100 fizzbuzz

bye

