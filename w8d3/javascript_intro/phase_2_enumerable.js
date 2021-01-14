Array.prototype.myEach = function(cb) {
    for(let i = 0; i < this.length; i++) {
        cb(this[i]);
    }
};

function doubler(n) {
    console.log(2 * n);
}

// console.log([1, 2, 3, 4, 5].myEach(doubler));

Array.prototype.myMap = function(cb) {
    let mapped = [];
    this.myEach((ele) => {
        mapped.push(cb(ele));
    })

    // this.myEach(el => { mapped.push(cb(el))})
    // // for(let i = 0; i < this.length; i++) {
    // //     let el = this[i];
    // //     mapped.push(cb(this[i]));
    // // }

    return mapped;
};

function doubler(n) {
    return 2 * n;
}

console.log([1, 2, 3, 4, 5].myMap(doubler))

