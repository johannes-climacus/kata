const range = (i, j) => [...Array(j + 1).keys()].filter(x => x >= i);

const fizzbuzz = (i) => {
  const filter = (j) => {
    const dividesp = y => (j % y) === 0;
    if (dividesp(15)) { return 'FizzBuzz'; }
    if (dividesp(5)) { return 'Buzz'; }
    if (dividesp(3)) { return 'Fizz'; }
    return j;
  };

  range(1, i).forEach(x => console.log(filter(x)));
};

fizzbuzz(100);

