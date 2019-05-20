const range = (i, j) => [...Array(j).keys()].filter(x => x >= i);

const fizzbuzz = (numbers) => {
  const dividesp = (x, y) => (x % y) === 0;
  numbers.map(i => {
    if (dividesp(i, 15)) { return "FizzBuzz" }
      else if (dividesp(i, 5)) { return "Buzz"}
      else if (dividesp(i, 3)) { return "Fizz"}
      else { return i }
  }).forEach(result => console.log(result));
};

fizzbuzz(range(1, 101));

