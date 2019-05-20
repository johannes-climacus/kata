const range = (i, j) => [...Array(j).keys()].filter(x => x >= i);

const fizzbuzzer = (i) => {
  const dividesp = (x, y) => (x % y) === 0;
  if (dividesp(i, 15)) { return "FizzBuzz" }
  else if (dividesp(i, 5)) { return "Buzz"}
  else if (dividesp(i, 3)) { return "Fizz"}
  else { return i };
};

range(1, 101).map(fizzbuzzer).forEach(x => console.log(x));;
