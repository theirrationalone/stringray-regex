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
newString = "7hexd{1,1}ummy";
console.log(/\7/.exec(newString)); // also true for 1 - 6 and 0 too

newString = "Aaexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\A/.exec(newString));

newString = "aaexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\a/.exec(newString)); // works same in both cases a or A

newString = "Caexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\C/.exec(newString));

newString = "caexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\c/.exec(newString)); // works different for c and C

newString = "Eaexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\E/.exec(newString));

newString = "eaexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\e/.exec(newString)); // works same for both e and E

newString = "Gaexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\G/.exec(newString));

newString = "gaexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\g/.exec(newString)); // works same for both g and G

newString = "Haexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\H/.exec(newString));

newString = "haexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\h/.exec(newString)); // works same for both h and H

newString = "Iaexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\I/.exec(newString));

newString = "iaexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\i/.exec(newString)); // works same for both i and I

newString = "Raexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\R/.exec(newString));

newString = "raexd{1,1}ummy";
console.log("string: ", newString);
console.log(/\r/.exec(newString)); // works different for r and R

/* ---OUTPUT---
[ '8', index: 0, input: '8hexd{1,1}ummy', groups: undefined ]
[ '9', index: 0, input: '9hexd{1,1}ummy', groups: undefined ]
null
string:  Aaexd{1,1}ummy
[ 'A', index: 0, input: 'Aaexd{1,1}ummy', groups: undefined ]
string:  aaexd{1,1}ummy
[ 'a', index: 0, input: 'aaexd{1,1}ummy', groups: undefined ]
string:  Caexd{1,1}ummy
[ 'C', index: 0, input: 'Caexd{1,1}ummy', groups: undefined ]
string:  caexd{1,1}ummy
null
string:  Eaexd{1,1}ummy
[ 'E', index: 0, input: 'Eaexd{1,1}ummy', groups: undefined ]
string:  eaexd{1,1}ummy
[ 'e', index: 0, input: 'eaexd{1,1}ummy', groups: undefined ]
string:  Gaexd{1,1}ummy
[ 'G', index: 0, input: 'Gaexd{1,1}ummy', groups: undefined ]
string:  gaexd{1,1}ummy
[ 'g', index: 0, input: 'gaexd{1,1}ummy', groups: undefined ]
string:  Haexd{1,1}ummy
[ 'H', index: 0, input: 'Haexd{1,1}ummy', groups: undefined ]
string:  haexd{1,1}ummy
[ 'h', index: 0, input: 'haexd{1,1}ummy', groups: undefined ]
string:  Iaexd{1,1}ummy
[ 'I', index: 0, input: 'Iaexd{1,1}ummy', groups: undefined ]
string:  iaexd{1,1}ummy
[ 'i', index: 0, input: 'iaexd{1,1}ummy', groups: undefined ]
string:  Naexd{1,1}ummy
[ 'N', index: 0, input: 'Naexd{1,1}ummy', groups: undefined ]
string:  naexd{1,1}ummy
null
*/

// newString = "aa\baexd{1,1}ummy";
// console.log("string: ", newString);
// console.log(/\b/.exec(newString));

// // why index is 0???
// /* ---output---
// string:  aaexd{1,1}ummy
// [ '', index: 0, input: 'aa\baexd{1,1}ummy', groups: undefined ]
// */

// newString = "aa\Baexd{1,1}ummy";
// console.log("string: ", newString);
// console.log(/\b/.exec(newString));

// // the actual input was "aa\Baexd{1,1}ummy" why it truncated \ ? and why still index is 0 ?
// /* ---output---
// string:  aaBaexd{1,1}ummy
// [ '', index: 0, input: 'aaBaexd{1,1}ummy', groups: undefined ]
//  */

// newString = "aa\Baexd{1,1}ummy";
// console.log("string: ", newString);
// console.log(/\B/.exec(newString));

// // again, the actual input was "aa\Baexd{1,1}ummy" why it truncated \ ? and why this time index comes out to be 1 ?
// /* ---output---
// string:  aaBaexd{1,1}ummy
// [ '', index: 1, input: 'aaBaexd{1,1}ummy', groups: undefined ]
// */

// newString = "aa\baexd{1,1}ummy";
// console.log("string: ", newString);
// console.log(/\B/.exec(newString));

// // why also this time index comes out to be 1 ?
// /* ---output---
// string:  aaexd{1,1}ummy
// [ '', index: 1, input: 'aa\baexd{1,1}ummy', groups: undefined ]
// */

newString = "a-aRa ";
console.log("string: ", newString);
console.log(/\B/.exec(newString)); // expected index position: 3

/*
js reads from left to right so...
 a - a R a 
0 1 2 3 4 5
*/

newString = "a-aRaf-_anil_-JS ";
console.log("string: ", newString);
console.log(/\banil_/.exec(newString)); // expected index position: null because word boundry starts from index 7

/*
---prominent underscore _ case
js reads from left to right so...
 a - a R a f - _ a n i l _ - J S  
0 1 2 3 4 5 6 7 8 9 1011121314151617
*/

newString = "a-aRaf-_anil_-JS ";
console.log("string: ", newString);
console.log(/\b_anil_/.exec(newString)); // expected start index position: 7, end index position: 13

newString = "Ra-aRaf-_anil_-JS ";
console.log("string: ", newString);
console.log(/\R/.exec(newString));

newString = " !\"#%&',:;<=>@_~";
console.log("string: ", newString);
console.log(/\ \!\"\#\%\&\'\,\:\;\<\=\>\@\_\~/.exec(newString));

newString = " !\"#%&',:;<=>@_~";
console.log("string: ", newString);
console.log(/ !"#%&',:;<=>@_~/.exec(newString));

// newString = "[";
// console.log("string: ", newString);
// console.log(/[/.exec(newString));

newString = "]";
console.log("string: ", newString);
console.log(/]/.exec(newString));

newString = "[]";
console.log("string: ", newString);
console.log(/[[]]/.exec(newString));

newString = "{,1}";
console.log("string: ", newString);
console.log(/{,1}/.exec(newString));

// invalid case
// newString = "{,1}";
// console.log("string: ", newString);
// console.log(/d{1}?{1}/.exec(newString));

newString = "zA{a,Z 1}";
console.log("string: ", newString);
console.log(/\Z/.exec(newString));

newString = "csdfdAAsfdf";
console.log("string: ", newString);
console.log("----------");
console.log(/\x41+/.exec(newString));
console.log("----------");

// newString = "c1";
// console.log("string: ", newString);
// console.log(/[\c1]/u.exec(newString));

newString = "c1";
console.log("string: ", newString);
console.log(/(?<first_question>ABC)\k<first_question>/.exec(newString));

newString = "paPaya";
console.log("string: ", newString);
console.log(/\p{Uppercase_Letter}/u.exec(newString));

newString = "xzabbzxabcdefghijj";
console.log("string: ", newString);
console.log(/(a(b(c(d(e(f(g(h(i(j))))))))))\10/.exec(newString));
