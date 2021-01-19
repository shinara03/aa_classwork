function sum() {
  let args = [...arguments];

  let sum = 0; 
  for(let i = 0; i < args.length; i++) {
    sum += args[i];
  }
  return sum; 
}

function sum2(...args) {

  let sum = 0;
  for (let i = 0; i < args.length; i++) {
    sum += args[i];
  }
  return sum;
}

// console.log(sum2(1, 2, 3, 4)) // === 10;
// console.log(sum2(1, 2, 3, 4, 5)) //=== 15;

Function.prototype.myBind = function (context) {
  let that = this;
  if (arguments.length > 1) {
    return function () {
      return that.apply(context, [...arguments].slice(1))
    }
  } else {
    return function () {
      return that.apply(context);
    }
  }
}

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true

