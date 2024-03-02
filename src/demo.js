const string = "!!s";
// const string = "b";

// console.log(string.localeCompare("99"));
// console.log(string.localeCompare("a"));
console.log(string.match(/\w+/));
console.log(/\w*/.test(string));
console.log(string.search(/w+/));