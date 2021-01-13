Array.prototype.myEach = function(cb) {
    for(let i = 0; i < this.length; i++) {
        let el = this[i];
        cb(this[i]);
    }
};

function doubler(n) {
    console.log(2 * n);
}

// console.log([1, 2, 3, 4, 5].myEach(doubler));
