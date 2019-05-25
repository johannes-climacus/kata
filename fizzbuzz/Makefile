.DEFAULT_GOAL := all

racket:
	racket fizzbuzz.rkt  | diff fizzbuzz.txt -
fsharp:
	fsharpi fizzbuzz.fsx | diff fizzbuzz.txt -
awk:
	./fizzbuzz.awk       | diff fizzbuzz.txt -
posix:
	./fizzbuzz.sh        | diff fizzbuzz.txt -
ocaml:
	ocaml fizzbuzz.ml    | diff fizzbuzz.txt -
javascript:
	node fizzbuzz.js     | diff fizzbuzz.txt -
all: racket fsharp awk posix ocaml javascript
