const string = "ani@l#aas!dv";

console.log(`${string}: \/\\w\/: `, string.match(/\w/));

console.log(`${string}: \/\\w+\/: `, string.match(/\w+/));
console.log(`${string}: \/\\w+\/: `, /\w+/.test(string));

console.log(`${string}: \/\\w*\/: `, string.match(/\w*/));
console.log(`${string}: \/\\w*\/: `, /\w*/.test(string));