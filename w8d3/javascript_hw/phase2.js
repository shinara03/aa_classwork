function fizzBuzz(arr) {
  let fizzBuzzArr = []
  for (let i=0; i < arr.length; i++) {
    if (arr[i]%3 === 0 ^ arr[i]%5 === 0) {
      fizzBuzzArr.push(arr[i]);
    }   
  }
  return fizzBuzzArr;
}

// console.log(fizzBuzz([1,2,3,4,5,15]));

function isPrime(number) {
  if (number < 2) {return false;}
  for (let i=2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

// console.log(isPrime(2))
// console.log(isPrime(10))
// console.log(isPrime(15485863))

function sumOfNPrimes(n) {
  let sum = 0;
  let count = 0; 
  let num = 1;
  while (count < n) {
    if (isPrime(num)) {
      sum += num ;
      count += 1;
    }
    num++;
  }
  
  return sum;
}

// console.log(sumOfNPrimes(0))
// console.log(sumOfNPrimes(1))
// console.log(sumOfNPrimes(4))