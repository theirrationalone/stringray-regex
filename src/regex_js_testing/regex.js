let regex = /\08/;
const target = "\x008";
const target2 = "8";
console.log("output: ", target.match(regex));
console.log("output2: ", target2.match(regex));