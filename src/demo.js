// const string = "_1ani9@!$!*+&l#aas!dv";

// console.log(`${string}: \/\\w\/: `, string.match(/\w/));

// console.log(`${string}: \/\\w+\/: `, string.match(/\w+/));
// console.log(`${string}: \/\\w+\/: `, /\w+/.test(string));

// console.log(`${string}: \/\\w*\/: `, string.match(/\w*/));
// console.log(`${string}: \/\\w*\/: `, /\w*/.test(string));

// console.log(`${string}: \/\\W\/: `, string.match(/\W/));
// console.log(`${string}: \/\\W\/: `, /\W/.test(string));

// console.log(`${string}: \/\\W+\/: `, string.match(/\W+/));
// console.log(`${string}: \/\\W+\/: `, /\W+/.test(string));

// console.log(`${string}: \/\\W*\/: `, string.match(/\W*/));
// console.log(`${string}: \/\\W*\/: `, /\W*/.test(string));

// const newString = "anil10924theirrationalone-KUSHA";

// \d not working in solidity
// console.log(/\d/.exec(newString));

let newString = "8hexd{1,1}ummy";
console.log(/\8/.exec(newString));
newString = "9hexd{1,1}ummy";
console.log(/\9/.exec(newString));

newString = "1hexd{1,1}ummy";
// . not working in solidity
console.log("string: ", newString);
console.log(/\1/.exec(newString));
