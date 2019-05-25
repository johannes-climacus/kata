.DEFAULT_GOAL := all

racket:
	racket fizzbuzz.rkt  | diff expected.txt -
forth :
	gforth fizzbuzz.fth  | tr -d ' ' | diff expected.txt -
fsharp:
	fsharpi fizzbuzz.fsx | diff expected.txt -
awk:
	./fizzbuzz.awk       | diff expected.txt -
posix:
	./fizzbuzz.sh        | diff expected.txt -
ocaml:
	ocaml fizzbuzz.ml    | diff expected.txt -
javascript:
	node fizzbuzz.js     | diff expected.txt -
all: racket forth fsharp awk posix ocaml javascript
