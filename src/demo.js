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
const newString = "d{1,1}ummy";

// \d not working in solidity
// console.log(/\d/.exec(newString));

// . not working in solidity
console.log("string: ", newString);
console.log(/d\{1\,1\}/.exec(newString));
