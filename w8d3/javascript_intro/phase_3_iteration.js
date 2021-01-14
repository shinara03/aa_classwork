Array.prototype.bubble_sort = function() {
    let sorted = false;

    while (!sorted) {
        sorted = true;
        for(let i = 0; i < this.length - 1; i++) {
            let j = i + 1;
            let tmp = [];

            if (this[i] > this[j]) {
                sorted = false;
                tmp = this[i];
                this[i] = this[j];
                this[j] = tmp;
            }
        }
    }
    return this;
}

// console.log([1, 5, 3, 2, 6, 10, 0].bubble_sort())
String.prototype.substrings = function() {
    let subs = [];
    chars = this.split("");
    // h e l l o
    for(let i=0; i < chars.length; i++) {
        // if (i === chars.length - 1) {
        //     subs.push(chars.slice(i));
        // }
        for(let j = i; j < chars.length; j++) {
            // if (chars.indexOf(chars.slice(i, j + 1).join(""))=== -1) {
            // }
            subs.push(chars.slice(i, j+1).join(""))
        }
    }
    return subs;
};

console.log("hello".substrings())

