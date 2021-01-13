Array.prototype.uniq = function() {
  let array = [];
  for(let i= 0;i < this.length; i++) {
    if (array.indexOf(this[i]) === -1) {
      array.push(this[i])
    }
  }
  return array;
};

//console.log([1, 2, 2, 3, 3, 3].uniq());

Array.prototype.twoSum = function() {
  let pairs = [];
  for(let i = 0; i < this.length; i++) {
    let pair = []
    let num1 = this[i];
    for(let j=i+1; j < this.length -1; j++) {
      let num2 = this[j];
      if (num1 + num2 === 0) {
        pairs.push([i,j])
      }
    }
  }
  return pairs;
};

// console.log([1,2,-2,-1,3,5].twoSum())
