import test from "node:test";
import assert from "node:assert";

const testMain = () => {
  // test("Regex-Literals: Case1", () => {
  //   let regex = /a/;
  //   assert.strictEqual(regex.test("a"), true);
  //   regex = /b/;
  //   assert.strictEqual(regex.test("b"), true);
  //   regex = /1/;
  //   assert.strictEqual(regex.test("1"), true);
  //   regex = /_/;
  //   assert.strictEqual(regex.test("_"), true);
  //   regex = /€/;
  //   assert.strictEqual(regex.test("€"), true);
  //   regex = /क/;
  //   assert.strictEqual(regex.test("क"), true);
  //   regex = /あ/;
  //   assert.strictEqual(regex.test("あ"), true);
  //   regex = /😀/;
  //   assert.strictEqual(regex.test("😀"), true);

  //   // ...
  //   // ...U+10FFFF
  //   // Js supports upto U+10FFFF(1114111) characters.
  // });

  // test("Regex-Literals: Case2", () => {
  //   let regex = /abc/;
  //   assert.strictEqual(regex.test("abc"), true);

  //   regex = /hello/;
  //   assert.strictEqual(regex.test("hello"), true);

  //   regex = /123/;
  //   assert.strictEqual(regex.test("123"), true);

  //   regex = /anil/;
  //   assert.strictEqual(regex.test("anil"), true);

  //   regex = /😀🚀🔥/;
  //   assert.strictEqual(regex.test("😀🚀🔥"), true);

  //   regex = /hello/;
  //   assert.strictEqual(regex.test("hello"), true);

  //   regex = /abc123/;
  //   assert.strictEqual(regex.test("abc123"), true);

  //   regex = /कखग/;
  //   assert.strictEqual(regex.test("कखग"), true);
  // });

  // test("Regex-Literals: Case3", () => {
  //   let regex = /\^/;
  //   assert.strictEqual(regex.test("^"), true);

  //   regex = /\$/;
  //   assert.strictEqual(regex.test("$"), true);

  //   regex = /\./;
  //   assert.strictEqual(regex.test("."), true);

  //   regex = /\*/;
  //   assert.strictEqual(regex.test("*"), true);

  //   regex = /\+/;
  //   assert.strictEqual(regex.test("+"), true);

  //   regex = /\?/;
  //   assert.strictEqual(regex.test("?"), true);

  //   regex = /\(/;
  //   assert.strictEqual(regex.test("("), true);

  //   regex = /\)/;
  //   assert.strictEqual(regex.test(")"), true);

  //   regex = /\[/;
  //   assert.strictEqual(regex.test("["), true);

  //   regex = /\]/;
  //   assert.strictEqual(regex.test("]"), true);

  //   regex = /\{/;
  //   assert.strictEqual(regex.test("{"), true);

  //   regex = /\}/;
  //   assert.strictEqual(regex.test("}"), true);

  //   regex = /\|/;
  //   assert.strictEqual(regex.test("|"), true);

  //   regex = /\\/;
  //   assert.strictEqual(regex.test("\\"), true);
  // });

  // test("Regex-Literals: Case4", () => {
  //   let regex = /\x41/;
  //   assert.strictEqual(regex.test("A"), true);
  // });

  // test("Regex-Literals: Case5", () => {
  //   let regex = /\u0061/;
  //   assert.strictEqual(regex.test("a"), true);
  // });

  // test("Regex-Literals: Case6", () => {
  //   let regex = /\u{1F600}/u;
  //   assert.strictEqual(regex.test("😀"), true);
  // });

  // test("Regex-Literals: Case7", () => {
  //   let regex = /\n/;
  //   assert.strictEqual(regex.test("\n"), true);

  //   regex = /\r/;
  //   assert.strictEqual(regex.test("\r"), true);
  //   regex = /\t/;
  //   assert.strictEqual(regex.test("\t"), true);
  //   regex = /\v/;
  //   assert.strictEqual(regex.test("\v"), true);
  //   regex = /\f/;
  //   assert.strictEqual(regex.test("\f"), true);
  //   regex = /\0/;
  //   assert.strictEqual(regex.test("\0"), true);
  // });

  // test("Regex-Literals: Case8", () => {
  //   let regex = /\//;
  //   assert.strictEqual(regex.test("/"), true);
  // });

  // test("Regex-Literals: Case9", () => {
  //   // let regex = /a/b/;
  //   // assert.strictEqual(regex.test("a/b"), true);
  // });

  // test("Regex-Literals: Case10", () => {
  //   // let regex = /ab/\;
  //   // assert.strictEqual(regex.test("a/b"), true);
  // });

  // test("Regex-Literals: Case11", () => {
  //   let regex = /\u{110000}/;
  //   const target = "u{110000}";
  //   console.log("targettttttttttttttttttttttttttttt: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Regex-Literals: Case12", () => {
  // //     let regex = /\c1/;
  // //     assert.strictEqual(regex.test(""), true);
  // // });

  // test("Regex-Literals: Case13", () => {
  //   let regex = /\ugg/;
  //   assert.strictEqual(regex.test("ugg"), true);
  // });

  // test("Regex-Literals: Case14", () => {
  //   let regex = /./;
  //   const target = "anil";
  //   console.log("dot: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals: Case15", () => {
  //   let regex = /\./;
  //   const target = ".anil";
  //   console.log("dot: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals: Case16", () => {
  //   let regex = /\r./;
  //   const target = "\r.anil";
  //   console.log("dot: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals: Case17", () => {
  //   // let regex = /{/u;
  //   let regex = /{/;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals: Case18", () => {
  //   // let regex = /}/u;
  //   let regex = /}/;
  //   const target = ",}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals: Case19", () => {
  //   // let regex = /1/u;
  //   let regex = /1/u;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals: Case20", () => {
  //   // let regex = /,/u;
  //   let regex = /,/u;
  //   const target = ",";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals: Case21", () => {
  //   // let regex = /1,/u;
  //   let regex = /1,/u;
  //   const target = "1,";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals: Case22", () => {
  //   // let regex = /1,2/;
  //   let regex = /1,2/;
  //   const target = "1,2";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals: Case23", () => {
  //   // let regex = /2,1/;
  //   let regex = /2,1/;
  //   const target = "2,1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals: Case24", () => {
  // //     // let regex = /(/;
  // //     let regex = /(/;
  // //     const target = "(";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals: Case25", () => {
  // //     // let regex = /)/;
  // //     let regex = /)/;
  // //     const target = ")";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals: Case26", () => {
  //   // let regex = /[acw/;
  //   let regex = /[]/u;
  //   const target = "[]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Regex-Literals: Case27", () => {
  //   // @BUG: throws bad error msg: SyntaxError: Invalid regular expression: /]/u: Lone quantifier brackets
  //   // should throw: SyntaxError: Invalid regular expression: /]/u: Unmatched ']'
  //   // or throw: SyntaxError: Invalid regular expression: /]/u: Lone Character class brackets
  //   // let regex = /]/u;
  //   let regex = /]/;
  //   const target = "]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals: Case27a", () => {
  //   // @BUG: should throw error i.e., SyntaxError: Invalid regular expression: []: Empty Character class
  //   // let regex = /[]/u;
  //   let regex = /[]/;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Regex-Literals: Case28", () => {
  // //     // let regex = /[]/u;
  // //     let regex = /?/;
  // //     const target = "?";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals: Case29", () => {
  //   // let regex = /[]/u;
  //   let regex = /\?/;
  //   const target = "?";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals: Case30", () => {
  // //     // let regex = /[]/u;
  // //     let regex = /+/;
  // //     const target = "+";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals: Case31", () => {
  //   // let regex = /[]/u;
  //   let regex = /\+/;
  //   const target = "+";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals: Case32", () => {
  // //     // let regex = /[]/u;
  // //     let regex = /\\+*/;
  // //     const target = "\\\\*";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals: Case33", () => {
  //   // let regex = /[]/u;
  //   let regex = /\*/;
  //   const target = "*";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals: Case34", () => {
  // //     // let regex = /[]/u;
  // //     let regex = /a???/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals: Case35", () => {
  //   // let regex = /[]/u;
  //   let regex = /a??/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals: Case36", () => {
  // //     // let regex = /[]/u;
  // //     let regex = /a+??/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals: Case37", () => {
  //   // let regex = /[]/u;
  //   let regex = /a+?/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals: Case38", () => {
  // //     // let regex = /[]/u;
  // //     let regex = /a*??/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals: Case39", () => {
  //   // let regex = /[]/u;
  //   let regex = /a*?/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals: Case40", () => {
  //   // let regex = /a^sian/;
  //   let regex = /asian/;
  //   const target = "asian";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case001", () => {
  //   let regex = /\08/;
  //   const target = "\x008";
  //   console.log("outputDigit: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case002", () => {
  //   // let regex = /\07/;
  //   // const target = "\u0007";
  //   let regex = /\107/;
  //   const target = "\u0047";
  //   // let regex = /(a)(a)(a)(a)(a)(a)(a)(a)(a)(z)(x)(c)\13/u;
  //   // const target = "aaaaaaaaazxc\x0b";
  //   // let regex = /[(\828)]/u;
  //   // const target = "\x01";
  //   // let regex = /\01/u;
  //   // const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case003", () => {
  //   // let regex = /\07/;
  //   // const target = "\u0007";
  //   let regex = /\377/;
  //   const target = "\u00FF";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case004", () => {
  //   let regex = /\400/;
  //   const target = "\u00200";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case005", () => {
  //   let regex = /\777/;
  //   const target = "\u003F7";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case006", () => {
  //   let regex = /\378/;
  //   const target = "\u001F8";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case007", () => {
  //   let regex = /\397/;
  //   const target = "\u000397";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case008", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\a/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case009", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\0/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case010", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\00/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case011", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\000/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case012", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\08/;
  //   const target = "\x008";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case013", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\008/;
  //   const target = "\x008";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case014", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\000/u;
  // //     const target = "abba";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs: Case015", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\118/u;
  // //     const target = "abba";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs: Case016", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\988/u;
  // //     const target = "abba";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs: Case017", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\0988/u;
  // //     const target = "abba";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case018", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\\a/;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case019", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\_/;
  //   const target = "_";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case020", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\_/u;
  // //     const target = "_";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case021", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\!/;
  //   const target = "!";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case022", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\!/u;
  // //     const target = "!";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case023", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u{1F600}/;
  //   const target = "\\u{1F600}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case024", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u{1F600}/u;
  //   const target = "\u{1F600}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case025", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u/;
  //   const target = "u";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case026", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\u/u;
  // //     const target = "u";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case027", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\c/;
  //   const target = "c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Regex-Literals-escape_seqs: Case028", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\c/u;
  // //     const target = "c";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), false);
  // // });

  // test("Regex-Literals-escape_seqs: Case029", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\cA/;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case030", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\cA/u;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case031", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\ca/;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case032", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\ca/u;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case033", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\c1/;
  //   const target = "c1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Regex-Literals-escape_seqs: Case034", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\c1/u;
  // //     const target = "\x011";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs: Case035", () => {
  // //     let regex = /\u{23,20}/;
  // //     const target = "uuuuu";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case036", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u{230,240}/;
  //   const target = "uuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Regex-Literals-escape_seqs: Case037", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u{2}/;
  //   const target = "uuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case038", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u{2,}/;
  //   const target = "uuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case039", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u{,23335}/;
  //   const target = "u{,23335}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case040", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u{,}/;
  //   const target = "u{,}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case041", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u{}/;
  //   const target = "uuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Regex-Literals-escape_seqs: Case042", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u{1}/;
  //   const target = "u";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case043", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /{1}/;
  // //     const target = "uuuuuuuuuu";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case044", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u{1:1}/;
  //   const target = "u{1:1}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case045", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u1234/;
  //   const target = "\u1234";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case046", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u123/;
  //   const target = "u123";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case047", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u1234/u;
  //   const target = "\u1234";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case048", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\u123/u;
  // //     const target = "u123";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case049", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u12345/;
  //   const target = "\u12345";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case050", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u1/;
  //   const target = "u1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case051", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\u12/;
  //   const target = "u12";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case052", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\u1/u;
  // //     const target = "u1";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs: Case053", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\u12/u;
  // //     const target = "u12";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs: Case054", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /[abc/;
  // //     const target = "[abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs: Case055", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /(abc/;
  // //     const target = "(abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs: Case056", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /(?<1>a)/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs: Case057", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /(?<a-b>a)/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case058", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\k<a>/;
  //   const target = "k<a>";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case059", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\k<a>/u;
  // //     const target = "k<a>";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case060", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\p{L}/;
  //   const target = "p{L}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case061", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\p{XYZ}/;
  //   const target = "p{XYZ}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case062", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\p{L}/u;
  //   const target = "p{L}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case063", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\p{XYZ}/u;
  // //     const target = "p{XYZ}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs: Case064", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /{122222}/;
  // //     const target = "{122222}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case065", () => {
  //   // let regex = /a^sian/;
  //   let regex = /{}/;
  //   const target = "{}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case066", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /{}/u;
  // //     const target = "{}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case067", () => {
  //   // let regex = /a^sian/;
  //   let regex = /{/;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case068", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /{/u;
  // //     const target = "{";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case069", () => {
  //   // let regex = /a^sian/;
  //   let regex = /{,11}/;
  //   const target = "{,11}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case070", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /{,11}/u;
  // //     const target = "{,11}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case071", () => {
  //   // let regex = /a^sian/;
  //   let regex = /}/;
  //   const target = "}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case072", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /}/u;
  // //     const target = "}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case073", () => {
  //   // let regex = /a^sian/;
  //   let regex = /1/;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case074", () => {
  //   // let regex = /a^sian/;
  //   let regex = /1/u;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case075", () => {
  //   // let regex = /a^sian/;
  //   let regex = /143242/;
  //   const target = "143242";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case076", () => {
  //   // let regex = /a^sian/;
  //   let regex = /143242/u;
  //   const target = "143242";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case077", () => {
  //   // let regex = /a^sian/;
  //   let regex = /1}/;
  //   const target = "1}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case078", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /1}/u;
  // //     const target = "1}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case079", () => {
  //   // let regex = /a^sian/;
  //   let regex = /123424}/;
  //   const target = "123424}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case080", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /123424}/u;
  // //     const target = "123424}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case081", () => {
  //   // let regex = /a^sian/;
  //   let regex = /1234,24/;
  //   const target = "1234,24";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case082", () => {
  //   // let regex = /a^sian/;
  //   let regex = /1234,24/u;
  //   const target = "1234,24";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case083", () => {
  //   // let regex = /a^sian/;
  //   let regex = /1234,24}/;
  //   const target = "1234,24}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case084", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /1234,24}/u;
  // //     const target = "1234,24}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case085", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\p{}/;
  //   const target = "p{}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case086", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\p{}/u;
  // //     const target = "p{}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case087", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\p{=LETTER}/;
  //   const target = "p{=LETTER}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case088", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\p{=LETTER}/u;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case089", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\p{g=LETTER}/;
  //   const target = "p{g=LETTER}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs: Case090", () => {
  // //     // let regex = /a^sian/;
  // //     let regex = /\p{g=LETTER}/u;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs: Case091", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\p{gc=Letter}/;
  //   const target = "p{gc=Letter}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs: Case092", () => {
  //   // let regex = /a^sian/;
  //   let regex = /\p{gc=Letter}/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case0001", () => {
  // //     let regex = /[]/;
  // //     const target = "\x00";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case0002", () => {
  // //     let regex = /[]/u;
  // //     const target = "\x00";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case0003", () => {
  //   let regex = /[.]/;
  //   const target = ".";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case0004", () => {
  //   let regex = /[.]/u;
  //   const target = ".";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case0005", () => {
  //   let regex = /[abc123_,:;!@#%&()$^{}?+*/|"'<>=`~ ]/;
  //   const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case0006", () => {
  //   let regex = /[abc123_,:;!@#%&(){}?*+$^/|"'<>=`~ ]/u;
  //   const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case0007", () => {
  // //     let regex = /[abc/;
  // //     const target = "[abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case0008", () => {
  // //     let regex = /[abc/u;
  // //     const target = "[abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case0009", () => {
  //   let regex = /[^]/;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00010", () => {
  //   let regex = /[^]/u;
  //   const target = "z";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00011", () => {
  //   let regex = /[a-z]/;
  //   const target = "q";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00012", () => {
  //   let regex = /[a-z]/u;
  //   const target = "q";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00013", () => {
  // //     let regex = /[z-a]/;
  // //     const target = "q";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00014", () => {
  // //     let regex = /[z-a]/u;
  // //     const target = "q";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00015", () => {
  //   let regex = /[a-\d]/;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00015", () => {
  // //     let regex = /[\s-b]/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00016", () => {
  // //     let regex = /[z-\d]/u;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00017", () => {
  //   let regex = /[\d-a]/;
  //   const target = "[\d-a]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00018", () => {
  // //     let regex = /[\d-a]/u;
  // //     const target = "[\d-a]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00019", () => {
  //   let regex = /[a-\w]/;
  //   const target = "[a-\w]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00020", () => {
  // //     let regex = /[z-\w]/u;
  // //     const target = "[a-\w]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00021", () => {
  //   let regex = /[\w-a]/;
  //   const target = "[\w-a]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00022", () => {
  // //     let regex = /[\w-a]/u;
  // //     const target = "[\w-a]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00023", () => {
  //   let regex = /[\w-\d]/;
  //   const target = "[\w-\d]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00024", () => {
  // //     let regex = /[\w-\d]/u;
  // //     const target = "[\w-\d]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00025", () => {
  //   let regex = /[\d-\w]/;
  //   const target = "[\d-\w]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00026", () => {
  // //     let regex = /[\d-\w]/u;
  // //     const target = "[\d-\w]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00027", () => {
  //   let regex = /[\d-\d]/;
  //   const target = "[\d-\d]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00028", () => {
  // //     let regex = /[\d-\d]/u;
  // //     const target = "[\d-\d]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00029", () => {
  //   let regex = /[\w-\w]/;
  //   const target = "[\w-\w]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00030", () => {
  // //     let regex = /[\w-\w]/u;
  // //     const target = "[\w-\w]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00031", () => {
  //   let regex = /[a-c-h]/;
  //   // const target = "a"; // true
  //   // const target = "b"; // true
  //   // const target = "c"; // true
  //   // const target = "-"; // true
  //   // const target = "h"; // true
  //   // const target = "d"; // false
  //   // const target = "e"; // false
  //   // const target = "f"; // false
  //   // const target = "g"; // false
  //   // const target = "i"; // false
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00032", () => {
  //   let regex = /[a-c-h]/u;
  //   // const target = "a"; // true
  //   // const target = "b"; // true
  //   // const target = "c"; // true
  //   // const target = "-"; // true
  //   // const target = "h"; // true
  //   // const target = "d"; // false
  //   // const target = "e"; // false
  //   // const target = "f"; // false
  //   // const target = "g"; // false
  //   // const target = "i"; // false
  //   const target = "b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00033", () => {
  //   let regex = /[-a]/;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00034", () => {
  //   let regex = /[-a]/u;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00035", () => {
  //   let regex = /[a-]/;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00036", () => {
  //   let regex = /[a-]/u;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00037", () => {
  // //     // @Note: - is smaller than a
  // //     let regex = /[a--z]/;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00038", () => {
  // //     // @Note: - is smaller than a
  // //     let regex = /[a--z]/u;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00039", () => {
  //   // @Note: - is smaller than a
  //   let regex = /[--a]/;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00040", () => {
  //   // @Note: - is smaller than a
  //   let regex = /[--b]/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00041", () => {
  //   let regex = /[\8]/;
  //   const target = "8";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00042", () => {
  // //     let regex = /[\8]/u;
  // //     const target = "8";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00043", () => {
  //   let regex = /[\u123]/;
  //   // const target = "u"; // true
  //   // const target = "1"; // true
  //   // const target = "2"; // true
  //   // const target = "4"; // false
  //   const target = "3";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00044", () => {
  // //     let regex = /[\u123]/u;
  // //     const target = "3";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00045", () => {
  //   let regex = /[\u0123]/;
  //   const target = "\u0123";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00046", () => {
  //   let regex = /[\u0123]/u;
  //   const target = "\u0123";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00047", () => {
  // //     let regex = /[\]/;
  // //     const target = "\\";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00048", () => {
  // //     let regex = /[\]/u;
  // //     const target = "\\";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00049", () => {
  //   let regex = /[\0]/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00050", () => {
  //   let regex = /[\0]/u;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00051", () => {
  //   let regex = /[\00]/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00052", () => {
  // //     let regex = /[\00]/u;
  // //     const target = "\x00";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00053", () => {
  //   let regex = /[\000]/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00054", () => {
  // //     let regex = /[\000]/u;
  // //     const target = "\x00";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00055", () => {
  //   let regex = /[\377]/;
  //   const target = "\u00ff";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00056", () => {
  // //     let regex = /[\377]/u;
  // //     const target = "\u00ff";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00057", () => {
  //   let regex = /[\1]/;
  //   const target = "\u0001";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00058", () => {
  // //     let regex = /[\1]/u;
  // //     const target = "1";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00059", () => {
  //   let regex = /(a)[\1]/;
  //   const target = "a\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00060", () => {
  // //     let regex = /(a)[\1]/u;
  // //     const target = "a\x01";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00061", () => {
  //   let regex = /[(a)\1]/;
  //   const target = ")";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00062", () => {
  // //     let regex = /[(a)\1]/u;
  // //     const target = ")";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00063", () => {
  //   let regex = /[\p{Letter}]/;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00064", () => {
  //   let regex = /[\p{Letter}]/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00065", () => {
  //   let regex = /[\p{}]/;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00066", () => {
  // //     let regex = /[\p{}]/u;
  // //     const target = "T";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00067", () => {
  //   let regex = /[\p{LETTER}]/;
  //   const target = "T";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00068", () => {
  // //     let regex = /[\p{LETTER}]/u;
  // //     const target = "T";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00069", () => {
  //   let regex = /[\x001]/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00070", () => {
  //   let regex = /[\x001]/u;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00071", () => {
  //   let regex = /[\xg1]/;
  //   const target = "x";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00072", () => {
  // //     let regex = /[\xg1]/u;
  // //     const target = "g";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00073", () => {
  //   let regex = /[\k]/;
  //   const target = "k";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00074", () => {
  // //     let regex = /[\k]/u;
  // //     const target = "g";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00075", () => {
  //   let regex = /[(?<a>a)\k<a>]/;
  //   const target = "<";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00076", () => {
  // //     let regex = /[(?<a>a)\k<a>]/u;
  // //     const target = ")";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00077", () => {
  // //     let regex = /(?<a>a)[\k<a>]/;
  // //     const target = "aa";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00078", () => {
  // //     let regex = /(?<a>a)[\k<a>]/u;
  // //     const target = ")";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00079", () => {
  //   let regex = /[\k<a>]/;
  //   const target = "aa";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00080", () => {
  // //     let regex = /[\k<a>]/u;
  // //     const target = "aa";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00081", () => {
  // //     let regex = /(?<b>a)\k<a>/;
  // //     const target = "aa";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00082", () => {
  // //     let regex = /(?<b>a)\k<a>/u;
  // //     const target = "aa";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00083", () => {
  //   let regex = /[✅-🧪]/;
  //   const target = "🧪";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00084", () => {
  //   let regex = /[✅-🧪]/u;
  //   const target = "🧪";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00085", () => {
  // //     let regex = /[🧪-✅]/;
  // //     const target = "✅";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00086", () => {
  // //     let regex = /[🧪-✅]/u;
  // //     const target = "✅";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00087", () => {
  // //     let regex = /[€-क]/;
  // //     const target = "क";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00088", () => {
  // //     let regex = /[€-क]/u;
  // //     const target = "क";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00089", () => {
  //   let regex = /[क-€]/;
  //   const target = "€";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00090", () => {
  //   let regex = /[क-€]/u;
  //   const target = "€";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00091", () => {
  //   let regex = /[\uc290-\uc295]/;
  //   const target = "\uc293";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00092", () => {
  //   let regex = /[\uc290-\uc295]/u;
  //   const target = "\uc293";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00093", () => {
  // //     let regex = /[\uc295-\uc290]/;
  // //     const target = "\uc293";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00094", () => {
  // //     let regex = /[\uc295-\uc290]/u;
  // //     const target = "\uc293";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00095", () => {
  // //     let regex = /[\^-\$]/;
  // //     const target = "\uc293";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case00096", () => {
  // //     let regex = /[\^-\$]/u;
  // //     const target = "\uc293";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case00097", () => {
  //   let regex = /[\$-\^]/;
  //   const target = "\$";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case00098", () => {
  //   let regex = /[\$-\^]/u;
  //   const target = "\^";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case00099", () => {
  // //     let regex = /[\c-b]/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000100", () => {
  // //     let regex = /[\c-b]/u;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000101", () => {
  // //     let regex = /[b-\c]/;
  // //     const target = "c";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000102", () => {
  // //     let regex = /[b-\c]/u;
  // //     const target = "c_";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000103", () => {
  //   let regex = /\c_/;
  //   const target = "c_";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Character Classes[]: Case000104", () => {
  // //     let regex = /\c_/u;
  // //     const target = "c_";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000105", () => {
  //   let regex = /[a\c_z]/;
  //   const target = "z";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000106", () => {
  // //     let regex = /[a\c_z]/u;
  // //     const target = "c_";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000107", () => {
  // //     let regex = /[_-,]/;
  // //     const target = ",";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000108", () => {
  // //     let regex = /[_-,]/u;
  // //     const target = "_";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000109", () => {
  //   let regex = /[,-_]/;
  //   const target = ",";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000110", () => {
  //   let regex = /[,-_]/u;
  //   const target = "_";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000111", () => {
  //   let regex = /[:-;]/;
  //   const target = ";";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000112", () => {
  //   let regex = /[:-;]/u;
  //   const target = ":";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000113", () => {
  // //     let regex = /[;-:]/;
  // //     const target = ";";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000114", () => {
  // //     let regex = /[;-:]/u;
  // //     const target = ":";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000115", () => {
  //   let regex = /[!-@]/;
  //   const target = "@";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000116", () => {
  //   let regex = /[!-@]/u;
  //   const target = "!";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000117", () => {
  // //     let regex = /[@-!]/;
  // //     const target = "@";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000118", () => {
  // //     let regex = /[@-!]/u;
  // //     const target = "!";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000119", () => {
  //   let regex = /[#-%]/;
  //   const target = "%";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000120", () => {
  //   let regex = /[#-%]/u;
  //   const target = "#";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000121", () => {
  // //     let regex = /[%-#]/;
  // //     const target = "%";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000122", () => {
  // //     let regex = /[%-#]/u;
  // //     const target = "#";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000123", () => {
  //   let regex = /[&-(]/;
  //   const target = "&";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000124", () => {
  //   let regex = /[&-(]/u;
  //   const target = "(";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000125", () => {
  // //     let regex = /[(-&]/;
  // //     const target = "&";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000126", () => {
  // //     let regex = /[(-&]/u;
  // //     const target = "(";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000127", () => {
  // //     let regex = /[)-$]/;
  // //     const target = "&";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000128", () => {
  // //     let regex = /[)-$]/u;
  // //     const target = "(";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000129", () => {
  //   let regex = /[$-)]/;
  //   const target = "&";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000130", () => {
  //   let regex = /[$-)]/u;
  //   const target = "(";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000131", () => {
  //   let regex = /[^-{]/;
  //   const target = "}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000132", () => {
  //   let regex = /[^-{]/u;
  //   const target = "_";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000133", () => {
  // //     let regex = /[{-^]/;
  // //     const target = "^";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000134", () => {
  // //     let regex = /[{-^]/u;
  // //     const target = "{";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000135", () => {
  //   let regex = /[\^-{]/;
  //   const target = "^";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000136", () => {
  //   let regex = /[\^-{]/u;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000137", () => {
  // //     let regex = /[{-\^]/;
  // //     const target = "^";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000138", () => {
  // //     let regex = /[{-\^]/u;
  // //     const target = "{";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000139", () => {
  // //     let regex = /[}-?]/;
  // //     const target = "?";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000140", () => {
  // //     let regex = /[}-?]/u;
  // //     const target = "}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000141", () => {
  //   let regex = /[?-}]/;
  //   const target = "?";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000142", () => {
  //   let regex = /[?-}]/u;
  //   const target = "}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000143", () => {
  // //     let regex = /[+-*]/;
  // //     const target = "+";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000144", () => {
  // //     let regex = /[+-*]/u;
  // //     const target = "*";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000145", () => {
  //   let regex = /[*-+]/;
  //   const target = "+";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000146", () => {
  //   let regex = /[*-+]/u;
  //   const target = "*";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000147", () => {
  //   let regex = /[/-|]/;
  //   const target = "/";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000148", () => {
  //   let regex = /[/-|]/u;
  //   const target = "|";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000149", () => {
  // //     let regex = /[|-/]/;
  // //     const target = "+";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000150", () => {
  // //     let regex = /[|-/]/u;
  // //     const target = "*";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000151", () => {
  //   let regex = /["-']/;
  //   const target = '"';
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000152", () => {
  //   let regex = /["-']/u;
  //   const target = "'";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000153", () => {
  // //     let regex = /['-"]/;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000154", () => {
  // //     let regex = /['-"]/u;
  // //     const target = "'";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000155", () => {
  //   let regex = /[<->]/;
  //   const target = "<";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000156", () => {
  //   let regex = /[<->]/u;
  //   const target = ">";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000157", () => {
  // //     let regex = /[>-<]/;
  // //     const target = "<";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000158", () => {
  // //     let regex = /[>-<]/u;
  // //     const target = ">";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000159", () => {
  //   let regex = /[=-`]/;
  //   const target = "=";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000160", () => {
  //   let regex = /[=-`]/u;
  //   const target = "`";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000161", () => {
  // //     let regex = /[`-=]/;
  // //     const target = "=";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000162", () => {
  // //     let regex = /[`-=]/u;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000163", () => {
  //   let regex = /[`-~]/;
  //   const target = "~";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000164", () => {
  //   let regex = /[`-~]/u;
  //   const target = "`";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000165", () => {
  // //     let regex = /[~-`]/;
  // //     const target = "~";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000166", () => {
  // //     let regex = /[~-`]/u;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000167", () => {
  //   let regex = /[[]/;
  //   const target = "[";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000168", () => {
  //   let regex = /[[]/u;
  //   const target = "[";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000169", () => {
  //   let regex = /[[-b]/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[]: Case000170", () => {
  //   let regex = /[[-b]/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000171", () => {
  // //     let regex = /[b-[]/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[]: Case000172", () => {
  // //     let regex = /[b-[]/u;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[]: Case000173", () => {
  //   let regex = /[ab]a]/;
  //   const target = "ba]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[]: Case000174", () => {
  // //     // @JS-BUG: Throwing error: SyntaxError: Invalid regular expression: /[ab]a]/u: Lone quantifier brackets
  // //     // @RESOLUTION: SyntaxError: Invalid regular expression: /[ab]a]/u: Lone Character class brackets

  // //     let regex = /[ab]a]/u;
  // //     const target = "ba]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case00001", () => {
  //   let regex = /(a)/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case00002", () => {
  //   let regex = /(a)/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case00003", () => {
  //   let regex = /(abcdefjklmnostuvwxyz)/;
  //   const target = "abcdefjklmnostuvwxyz";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case00004", () => {
  //   let regex = /(abcdefjklmnostuvwxyz)/u;
  //   const target = "abcdefjklmnostuvwxyz";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case00005", () => {
  //   let regex = /(abcd-ghij)/;
  //   const target = "abcd-ghij";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case00006", () => {
  //   let regex = /(abcd-ghij)/u;
  //   const target = "abcd-ghij";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case00007", () => {
  // //     let regex = /(abcd/ghij)/;
  // //     const target = "abcd/ghij";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case00008", () => {
  // //     let regex = /(abcd/ghij)/u;
  // //     const target = "abcd/ghij";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case00009", () => {
  //   let regex = /(abcd!@#%=';:><.,~`"&ghij)/;
  //   const target = "abcd!@#%=';:><.,~`\"&ghij";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000010", () => {
  //   let regex = /(abcd!@#%=';:><.,~`"&ghij)/u;
  //   const target = "abcd!@#%=';:><.,~`\"&ghij";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000011", () => {
  //   let regex = /(\a)/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case000012", () => {
  // //     let regex = /(\a)/u;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case000013", () => {
  //   let regex = /(\a\e\j\k\l\m\o\y\z)/;
  //   const target = "aejklmoyz";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case000014", () => {
  // //     let regex = /(\a\e\j\k\l\m\o\y\z)/u;
  // //     const target = "aejklmoyz";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case000015", () => {
  //   let regex = /(\a\-\g\h\i\j)/;
  //   const target = "a-ghij";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case000016", () => {
  // //     let regex = /(\a\-\g\h\i\j)/u;
  // //     const target = "a-ghij";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case000017", () => {
  //   let regex = /(\a\/\g\h\i\j)/;
  //   const target = "a/ghij";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case000018", () => {
  // //     let regex = /(\a\/\g\h\i\j)/u;
  // //     const target = "a/ghij";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case000019", () => {
  //   let regex = /(\a\!\@\#\%\=\'\;\:\>\<\.\,\~\`\"\&\g\h\i\j)/;
  //   const target = "a!@#%=';:><.,~`\"&ghij";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case000020", () => {
  // //     let regex = /(\a\!\@\#\%\=\'\;\:\>\<\.\,\~\`\"\&\g\h\i\j)/u;
  // //     const target = "a!@#%=';:><.,~`\"&ghij"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case000021", () => {
  //   let regex = /(\n)/;
  //   const target = "\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000022", () => {
  //   let regex = /(\n)/u;
  //   const target = "\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000023", () => {
  //   let regex = /(\b)/;
  //   const target = "-a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000024", () => {
  //   let regex = /(\b)/u;
  //   const target = "a-b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000025", () => {
  //   let regex = /(\f)/;
  //   const target = "\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000026", () => {
  //   let regex = /(\f)/u;
  //   const target = "\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000027", () => {
  //   let regex = /(\d)/;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000028", () => {
  //   let regex = /(\d)/u;
  //   const target = "4";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000029", () => {
  //   let regex = /(\r)/;
  //   const target = "\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000030", () => {
  //   let regex = /(\r)/u;
  //   const target = "\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000031", () => {
  //   let regex = /(\s)/;
  //   const target = " ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000032", () => {
  //   let regex = /(\s)/u;
  //   const target = " ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000033", () => {
  //   let regex = /(\t)/;
  //   const target = "\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000034", () => {
  //   let regex = /(\t)/u;
  //   const target = "\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000035", () => {
  //   let regex = /(\v)/;
  //   const target = "\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000036", () => {
  //   let regex = /(\v)/u;
  //   const target = "\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000037", () => {
  //   let regex = /(\w\w)/;
  //   const target = "a1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000038", () => {
  //   let regex = /(\w\w)/u;
  //   const target = "1a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000039", () => {
  //   let regex = /(\B)/;
  //   const target = "a1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000040", () => {
  //   let regex = /(\B)/u;
  //   const target = "a1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000041", () => {
  //   let regex = /(\D)/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000042", () => {
  //   let regex = /(\D)/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000043", () => {
  //   let regex = /(\S)/;
  //   const target = "@";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000044", () => {
  //   let regex = /(\S)/u;
  //   const target = "@";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000045", () => {
  //   let regex = /(\W)/;
  //   const target = ",";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000046", () => {
  //   let regex = /(\W)/u;
  //   const target = ",";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000047", () => {
  //   let regex = /(\^)/;
  //   const target = "^";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000048", () => {
  //   let regex = /(\^)/u;
  //   const target = "^";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000049", () => {
  //   let regex = /(\$)/;
  //   const target = "$";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000050", () => {
  //   let regex = /(\$)/u;
  //   const target = "$";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000051", () => {
  //   let regex = /(\\)/;
  //   const target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000052", () => {
  //   let regex = /(\\)/u;
  //   const target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000053", () => {
  //   let regex = /(\.)/;
  //   const target = ".";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000054", () => {
  //   let regex = /(\.)/u;
  //   const target = ".";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000055", () => {
  //   let regex = /(\*)/;
  //   const target = "*";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000056", () => {
  //   let regex = /(\*)/u;
  //   const target = "*";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000057", () => {
  //   let regex = /(\+)/;
  //   const target = "+";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000058", () => {
  //   let regex = /(\+)/u;
  //   const target = "+";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000059", () => {
  //   let regex = /(\?)/;
  //   const target = "?";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000060", () => {
  //   let regex = /(\?)/u;
  //   const target = "?";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000061", () => {
  //   let regex = /(\[)/;
  //   const target = "[";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000062", () => {
  //   let regex = /(\[)/u;
  //   const target = "[";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000063", () => {
  //   let regex = /(\])/;
  //   const target = "]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000064", () => {
  //   let regex = /(\])/u;
  //   const target = "]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000065", () => {
  //   let regex = /(\()/;
  //   const target = "(";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000066", () => {
  //   let regex = /(\()/u;
  //   const target = "(";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000067", () => {
  //   let regex = /(\))/;
  //   const target = ")";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000068", () => {
  //   let regex = /(\))/u;
  //   const target = ")";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000069", () => {
  //   let regex = /(\{)/;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000070", () => {
  //   let regex = /(\})/u;
  //   const target = "}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000071", () => {
  //   let regex = /(\|)/;
  //   const target = "|";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000072", () => {
  //   let regex = /(\|)/u;
  //   const target = "|";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000073", () => {
  //   let regex = /(\/)/;
  //   const target = "/";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000074", () => {
  //   let regex = /(\/)/u;
  //   const target = "/";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000075", () => {
  //   let regex = /(a)/;
  //   assert.strictEqual(regex.test("a"), true);
  //   regex = /(b)/;
  //   assert.strictEqual(regex.test("b"), true);
  //   regex = /(1)/;
  //   assert.strictEqual(regex.test("1"), true);
  //   regex = /(_)/;
  //   assert.strictEqual(regex.test("_"), true);
  //   regex = /(€)/;
  //   assert.strictEqual(regex.test("€"), true);
  //   regex = /(क)/;
  //   assert.strictEqual(regex.test("क"), true);
  //   regex = /(あ)/;
  //   assert.strictEqual(regex.test("あ"), true);
  //   regex = /(😀)/;
  //   assert.strictEqual(regex.test("😀"), true);

  //   // ...
  //   // ...U+10FFFF
  //   // Js supports upto U+10FFFF(1114111) characters.
  // });

  // test("Groups(): Case000076", () => {
  //   let regex = /(abc)/;
  //   assert.strictEqual(regex.test("abc"), true);

  //   regex = /(hello)/;
  //   assert.strictEqual(regex.test("hello"), true);

  //   regex = /(123)/;
  //   assert.strictEqual(regex.test("123"), true);

  //   regex = /(anil)/;
  //   assert.strictEqual(regex.test("anil"), true);

  //   regex = /(😀🚀🔥)/;
  //   assert.strictEqual(regex.test("😀🚀🔥"), true);

  //   regex = /(hello)/;
  //   assert.strictEqual(regex.test("hello"), true);

  //   regex = /(abc123)/;
  //   assert.strictEqual(regex.test("abc123"), true);

  //   regex = /(कखग)/;
  //   assert.strictEqual(regex.test("कखग"), true);
  // });

  // test("Groups(): Case000077", () => {
  //   let regex = /(\^)/;
  //   assert.strictEqual(regex.test("^"), true);

  //   regex = /(\$)/;
  //   assert.strictEqual(regex.test("$"), true);

  //   regex = /(\.)/;
  //   assert.strictEqual(regex.test("."), true);

  //   regex = /(\*)/;
  //   assert.strictEqual(regex.test("*"), true);

  //   regex = /(\+)/;
  //   assert.strictEqual(regex.test("+"), true);

  //   regex = /(\?)/;
  //   assert.strictEqual(regex.test("?"), true);

  //   regex = /(\()/;
  //   assert.strictEqual(regex.test("("), true);

  //   regex = /(\))/;
  //   assert.strictEqual(regex.test(")"), true);

  //   regex = /(\[)/;
  //   assert.strictEqual(regex.test("["), true);

  //   regex = /(\])/;
  //   assert.strictEqual(regex.test("]"), true);

  //   regex = /(\{)/;
  //   assert.strictEqual(regex.test("{"), true);

  //   regex = /(\})/;
  //   assert.strictEqual(regex.test("}"), true);

  //   regex = /(\|)/;
  //   assert.strictEqual(regex.test("|"), true);

  //   regex = /(\\)/;
  //   assert.strictEqual(regex.test("\\"), true);
  // });

  // test("Groups(): Case000078", () => {
  //   let regex = /(\x41)/;
  //   assert.strictEqual(regex.test("A"), true);
  // });

  // test("Groups(): Case000079", () => {
  //   let regex = /(\u0061)/;
  //   assert.strictEqual(regex.test("a"), true);
  // });

  // test("Groups(): Case000080", () => {
  //   let regex = /(\u{1F600})/u;
  //   assert.strictEqual(regex.test("😀"), true);
  // });

  // test("Groups(): Case000081", () => {
  //   let regex = /(\n)/;
  //   assert.strictEqual(regex.test("\n"), true);

  //   regex = /(\r)/;
  //   assert.strictEqual(regex.test("\r"), true);
  //   regex = /(\t)/;
  //   assert.strictEqual(regex.test("\t"), true);
  //   regex = /(\v)/;
  //   assert.strictEqual(regex.test("\v"), true);
  //   regex = /(\f)/;
  //   assert.strictEqual(regex.test("\f"), true);
  //   regex = /(\0)/;
  //   assert.strictEqual(regex.test("\0"), true);
  // });

  // test("Groups(): Case000082", () => {
  //   let regex = /(\/)/;
  //   assert.strictEqual(regex.test("/"), true);
  // });

  // // test("Groups(): Case000083", () => {
  // //     let regex = /(a/b)/;
  // //     assert.strictEqual(regex.test("a/b"), true);
  // // });

  // // test("Groups(): Case000084", () => {
  // //     let regex = /(ab)/\;
  // //     assert.strictEqual(regex.test("a/b"), true);
  // // });

  // // test("Groups(): Case000085", () => {
  // // let regex = /(\u{110000})/u;
  // // assert.strictEqual(regex.test("\u{110000}"), true);
  // // });

  // test("Groups(): Case000086", () => {
  //   let regex = /(\c1)/;
  //   assert.strictEqual(regex.test(""), false);
  // });

  // test("Groups(): Case000087", () => {
  //   let regex = /(\ugg)/;
  //   assert.strictEqual(regex.test("ugg"), true);
  // });

  // test("Groups(): Case000088", () => {
  //   let regex = /(.)/;
  //   const target = "anil";
  //   console.log("dot: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000089", () => {
  //   let regex = /(\.)/;
  //   const target = ".anil";
  //   console.log("dot: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000090", () => {
  //   let regex = /(\r.)/;
  //   const target = "\r.anil";
  //   console.log("dot: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000091", () => {
  //   // let regex =(( /{)/u;
  //   let regex = /({)/;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000092", () => {
  //   // let regex =(( /})/u;
  //   let regex = /(})/;
  //   const target = ",}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000093", () => {
  //   // let regex =( /1)/u;
  //   let regex = /(1)/u;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000094", () => {
  //   // let regex =( /,)/u;
  //   let regex = /(,)/u;
  //   const target = ",";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000095", () => {
  //   // let regex =( /1,)/u;
  //   let regex = /(1,)/u;
  //   const target = "1,";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000096", () => {
  //   // let regex =( /1,2)/;
  //   let regex = /(1,2)/;
  //   const target = "1,2";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000097", () => {
  //   // let regex =( /2,1)/;
  //   let regex = /(2,1)/;
  //   const target = "2,1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case000098", () => {
  // //     // let regex =( /()/;
  // //     let regex = /(()/;
  // //     const target = "(";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case000099", () => {
  // //     // let regex =( /))/;
  // //     let regex = /())/;
  // //     const target = ")";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000100", () => {
  //   // let regex =( /[acw)/;
  //   let regex = /([])/u;
  //   const target = "[]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups(): Case0000101", () => {
  //   // let regex =(( /])/u;
  //   let regex = /(])/;
  //   const target = "]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000102", () => {
  //   // let regex =(( /[])/u;
  //   let regex = /([])/;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Groups(): Case0000103", () => {
  // //     // let regex = /([])/u;
  // //     let regex = /(?)/;
  // //     const target = "?";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000104", () => {
  //   // let regex =(( /[])/u;
  //   let regex = /(\?)/;
  //   const target = "?";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000105", () => {
  // //     // let r(egex = /[])/u;
  // //     let regex =/(+)/;
  // //     const target = "+";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000106", () => {
  //   // let regex =(( /[])/u;
  //   let regex = /(\+)/;
  //   const target = "+";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000107", () => {
  // //     // let r(egex = /[])/u;
  // //     let regex = /(\\+*)/;
  // //     const target = "\\\\*";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000108", () => {
  //   // let regex =(( /[])/u;
  //   let regex = /(\*)/;
  //   const target = "*";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000109", () => {
  // //     // let r(egex = /[])/u;
  // //     let regex =/(a???)/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000110", () => {
  //   // let regex =( /[])/u;
  //   let regex = /(a??)/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000111", () => {
  // //     // let r(egex = /[])/u;
  // //     let regex = /(a+??)/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000112", () => {
  //   // let regex =( /[])/u;
  //   let regex = /(a+?)/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case000113", () => {
  // //     // let r(egex = /[])/u;
  // //     let regex =/(a*??)/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000114", () => {
  //   // let regex =( /[])/u;
  //   let regex = /(a*?)/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000115", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(asian)/;
  //   const target = "asian";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000116", () => {
  //   let regex = /(\08)/;
  //   const target = "\x008";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000117", () => {
  //   // let regex =( /\07)/;
  //   // const target = "\u0007";
  //   let regex = /(\107)/;
  //   const target = "\u0047";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000118", () => {
  //   // let regex =( /\07)/;
  //   // const target = "\u0007";
  //   let regex = /(\377)/;
  //   const target = "\u00FF";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000119", () => {
  //   let regex = /(\400)/;
  //   const target = "\u00200";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000120", () => {
  //   let regex = /(\777)/;
  //   const target = "\u003F7";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000121", () => {
  //   let regex = /(a^|$sian)/;
  //   const target = "a^|$sian";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups(): Case0000122", () => {
  //   let regex = /(\378)/;
  //   const target = "\u001F8";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000123", () => {
  //   let regex = /(\397)/;
  //   const target = "\u000397";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000124", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\a)/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000125", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\0)/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000126", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\00)/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000127", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\000)/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000128", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\08)/;
  //   const target = "\x008";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000129", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\008)/;
  //   const target = "\x008";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000130", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex =/(\000)/u;
  // //     const target = "abba";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000131", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(\118)/u;
  // //     const target = "abba";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000132", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(\988)/u;
  // //     const target = "abba";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000133", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(\0988)/u;
  // //     const target = "abba";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000134", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\\a)/;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000135", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\_)/;
  //   const target = "_";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000136", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex =( /\_)/u;
  // //     const target = "_";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000137", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\!)/;
  //   const target = "!";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000138", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex =( /\!)/u;
  // //     const target = "!";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000139", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u{1F600})/;
  //   const target = "\\u{1F600}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000140", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u{1F600})/u;
  //   const target = "\u{1F600}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000141", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u)/;
  //   const target = "u";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000142", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex =( /\u)/u;
  // //     const target = "u";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000143", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\c)/;
  //   const target = "c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Groups(): Case0000144", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(\c)/u;
  // //     const target = "c";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), false);
  // // });

  // test("Groups(): Case0000145", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\cA)/;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000146", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\cA)/u;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000147", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\ca)/;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000148", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\ca)/u;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000149", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\c1)/;
  //   const target = "c1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Groups(): Case0000150", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex =/(\c1)/u;
  // //     const target = "\x011";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000151", () => {
  // //     let regex =/(\u{23,20})/;
  // //     const target = "uuuuu";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000152", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u{230,240})/;
  //   const target = "uuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups(): Case0000153", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u{23335})/;
  //   // regex will match iff 23335 u's are there in target string i.e., uuuuuuuuuuuuuuuuuuuu...+u <- 23335th
  //   const target = "u{,23335}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups(): Case0000154", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u{23335,})/;
  //   // regex will match iff 23335 or more u's are there in target string i.e., uuuuuuuuuuuuuuuuuuuu...+u <- 23335th or more
  //   const target = "u{,23335}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups(): Case0000155", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u{,23335})/;
  //   const target = "u{,23335}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000156", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u{,})/;
  //   const target = "u{,}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000157", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u{})/;
  //   const target = "u{}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000158", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u{1})/;
  //   const target = "u";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000159", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /({1})/;
  // //     const target = "uuuuuuuuuu";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000160", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u{1:1})/;
  //   const target = "u{1:1}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000161", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u1234)/;
  //   const target = "\u1234";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000162", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u123)/;
  //   const target = "u123";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000163", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u1234)/u;
  //   const target = "\u1234";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000164", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(\u123)/u;
  // //     const target = "u123";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000165", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u12345)/;
  //   const target = "\u12345";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000166", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u1)/;
  //   const target = "u1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000167", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u12)/;
  //   const target = "u12";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000168", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(\u1)/u;
  // //     const target = "u1";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000169", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(\u12)/u;
  // //     const target = "u12";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000170", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /([abc)/;
  // //     const target = "[abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000171", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /((abc)/;
  // //     const target = "(abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000172", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /((?<1>a))/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000173", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /((?<a-b>a))/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000174", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\k<a>)/;
  //   const target = "k<a>";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000175", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(\k<a>)/u;
  // //     const target = "k<a>";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000176", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\p{L})/;
  //   const target = "p{L}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000177", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\p{XYZ})/;
  //   const target = "p{XYZ}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000178", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\p{L})/u;
  //   const target = "p{L}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000179", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(\p{XYZ})/u;
  // //     const target = "p{XYZ}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000180", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /({122222})/;
  // //     const target = "{122222}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000181", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /({})/;
  //   const target = "{}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000182", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /({})/u;
  // //     const target = "{}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000183", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /({)/;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000184", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /({)/u;
  // //     const target = "{";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000185", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /({,11})/;
  //   const target = "{,11}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000186", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /({,11})/u;
  // //     const target = "{,11}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000187", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(})/;
  //   const target = "}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000188", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(})/u;
  // //     const target = "}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000189", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(1)/;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000190", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(1)/u;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000191", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(143242)/;
  //   const target = "143242";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000192", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(143242)/u;
  //   const target = "143242";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000193", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(1})/;
  //   const target = "1}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000194", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(1})/u;
  // //     const target = "1}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000195", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(123424})/;
  //   const target = "123424}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000196", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(123424})/u;
  // //     const target = "123424}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000197", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(1234,24)/;
  //   const target = "1234,24";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000198", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(1234,24)/u;
  //   const target = "1234,24";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000199", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(1234,24})/;
  //   const target = "1234,24}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000200", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(1234,24})/u;
  // //     const target = "1234,24}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000201", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\p{})/;
  //   const target = "p{}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000202", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(\p{})/u;
  // //     const target = "p{}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000203", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\p{=LETTER})/;
  //   const target = "p{=LETTER}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000204", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(\p{=LETTER})/u;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000205", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\p{g=LETTER})/;
  //   const target = "p{g=LETTER}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000206", () => {
  // //     // let r(egex = /a^sian)/;
  // //     let regex = /(\p{g=LETTER})/u;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000207", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\p{gc=Letter})/;
  //   const target = "p{gc=Letter}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000208", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\p{gc=Letter})/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000209", () => {
  //   let regex = /([])/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups(): Case0000210", () => {
  //   let regex = /([])/u;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups()(: Case0000211", () => {
  //   let regex = /([.])/;
  //   const target = ".";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000212", () => {
  //   let regex = /([.])/u;
  //   const target = ".";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000213", () => {
  //   let regex = /([abc123_,:;!@#%&()$^{}?+*/|"'<>=`~ ])/;
  //   const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000214", () => {
  //   let regex = /([abc123_,:;!@#%&(){}?*+$^/|"'<>=`~ ])/u;
  //   const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000215", () => {
  // //     let regex = /([abc)/;
  // //     const target = "[abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000216", () => {
  // //     let regex = /([abc)/u;
  // //     const target = "[abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups()(: Case0000217", () => {
  //   let regex = /([^])/;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000218", () => {
  //   let regex = /([^])/u;
  //   const target = "z";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000219", () => {
  //   let regex = /([a-z])/;
  //   const target = "q";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000220", () => {
  //   let regex = /([a-z])/u;
  //   const target = "q";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000221", () => {
  // //     let regex = /([z-a])/;
  // //     const target = "q";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000222", () => {
  // //     let regex = /([z-a])/u;
  // //     const target = "q";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000223", () => {
  //   let regex = /([a-\d])/;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000224", () => {
  // //     let regex = /([a-\d])/u;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000225", () => {
  //   let regex = /([\d-a])/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000226", () => {
  // //     let regex = /([\d-a])/u;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000227", () => {
  //   let regex = /([a-\w])/;
  //   const target = "[\w-a]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000228", () => {
  // //     let regex = /([a-\w])/u;
  // //     const target = "[a-\w]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000229", () => {
  //   let regex = /([\w-a])/;
  //   const target = "[\w-a]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000230", () => {
  // //     let regex = /([\w-a])/u;
  // //     const target = "[\w-a]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000231", () => {
  //   let regex = /([\w-\d])/;
  //   const target = "[\w-\d]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000232", () => {
  // //     let regex = /([\w-\d])/u;
  // //     const target = "[\w-\d]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000233", () => {
  //   let regex = /([\d-\w])/;
  //   const target = "[\d-\w]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000234", () => {
  // //     let regex = /([\d-\w])/u;
  // //     const target = "[\d-\w]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000235", () => {
  //   let regex = /([\d-\d])/;
  //   const target = "[\d-\d]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000236", () => {
  // //     let regex = /([\d-\d])/u;
  // //     const target = "[\d-\d]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000237", () => {
  //   let regex = /([\w-\w])/;
  //   const target = "[\w-\w]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000238", () => {
  // //     let regex = /([\w-\w])/u;
  // //     const target = "[\w-\w]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000239", () => {
  //   let regex = /([a-c-h])/;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000240", () => {
  //   let regex = /([a-c-h])/u;
  //   const target = "b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000241", () => {
  //   let regex = /([-a])/;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000242", () => {
  //   let regex = /([-a])/u;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000243", () => {
  //   let regex = /([a-])/;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000244", () => {
  //   let regex = /([a-])/u;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000245", () => {
  // //     let regex = /([a--z])/;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000246", () => {
  // //     // @Note: - is smaller than a
  // //     let regex = /([a--z])/u;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000247", () => {
  //   // @Note: - is smaller than a
  //   let regex = /([--a])/;
  //   const target = "-";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000248", () => {
  //   // @Note: - is smaller than a
  //   let regex = /([--b])/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000249", () => {
  //   let regex = /([\8])/;
  //   const target = "8";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000250", () => {
  // //     let regex = /([\8])/u;
  // //     const target = "8";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000251", () => {
  //   let regex = /([\u123])/;
  //   // const target = "u"; // true
  //   // const target = "1"; // true
  //   // const target = "2"; // true
  //   // const target = "4"; // false
  //   const target = "3";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000252", () => {
  // //     let regex = /([\u123])/u;
  // //     const target = "3";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000253", () => {
  //   let regex = /([\u0123])/;
  //   const target = "\u0123";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000254", () => {
  //   let regex = /([\u0123])/u;
  //   const target = "\u0123";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000255", () => {
  // //     let regex = /([\])/;
  // //     const target = "\\";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000256", () => {
  // //     let regex = /([\])/u;
  // //     const target = "\\";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000257", () => {
  //   let regex = /([\0])/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000258", () => {
  //   let regex = /([\0])/u;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000259", () => {
  //   let regex = /([\00])/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000260", () => {
  // //     let regex = /([\00])/u;
  // //     const target = "\x00";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000261", () => {
  //   let regex = /([\000])/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000262", () => {
  // //     let regex = /([\000])/u;
  // //     const target = "\x00";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000263", () => {
  //   let regex = /([\377])/;
  //   const target = "\u00ff";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000264", () => {
  // //     let regex = /([\377])/u;
  // //     const target = "\u00ff";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000265", () => {
  //   let regex = /([\1])/;
  //   const target = "\u0001";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000266", () => {
  // //     let regex = /([\1])/u;
  // //     const target = "1";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000267", () => {
  //   let regex = /((a)[\1])/;
  //   const target = "a\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000268", () => {
  // //     let regex = /((a)[\1])/u;
  // //     // let regex = /[\1]/u;
  // //     const target = "a\x01";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000269", () => {
  //   let regex = /([(a)\1])/;
  //   const target = ")";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000270", () => {
  // //     let regex = /([(a)\1])/u;
  // //     const target = ")";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000271", () => {
  //   let regex = /([\p{Letter}])/;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000272", () => {
  //   let regex = /([\p{Letter}])/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000273", () => {
  //   let regex = /([\p{}])/;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000274", () => {
  // //     let regex = /([\p{}])/u;
  // //     const target = "T";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000275", () => {
  //   let regex = /([\p{LETTER}])/;
  //   const target = "T";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000276", () => {
  // //     let regex = /([\p{LETTER}])/u;
  // //     const target = "T";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000277", () => {
  //   let regex = /([\x001])/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000278", () => {
  //   let regex = /([\x001])/u;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000279", () => {
  //   let regex = /([\xg1])/;
  //   const target = "x";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000280", () => {
  // //     let regex = /([\xg1])/u;
  // //     const target = "g";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000281", () => {
  //   let regex = /([\k])/;
  //   const target = "k";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000282", () => {
  // //     let regex = /([\k])/u;
  // //     const target = "g";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000283", () => {
  //   let regex = /([(?<a>a)\k<a>])/;
  //   const target = "<";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000284", () => {
  // //     let regex = /([(?<a>a)\k<a>])/u;
  // //     const target = ")";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000285", () => {
  // //     let regex = /((?<a>a)[\k<a>])/;
  // //     const target = "aa";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000286", () => {
  // //     let regex = /((?<a>a)[\k<a>])/u;
  // //     const target = ")";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000287", () => {
  //   let regex = /([\k<a>])/;
  //   const target = "aa";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000288", () => {
  // //     let regex = /([\k<a>])/u;
  // //     const target = "aa";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000289", () => {
  // //     let regex = /((?<b>a)\k<a>)/;
  // //     const target = "aa";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000290", () => {
  // //     let regex = /((?<b>a)\k<a>)/u;
  // //     const target = "aa";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000291", () => {
  //   let regex = /([✅-🧪])/;
  //   const target = "🧪";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000292", () => {
  //   let regex = /([✅-🧪])/u;
  //   const target = "🧪";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000293", () => {
  // //     let regex = /([🧪-✅])/;
  // //     const target = "✅";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000294", () => {
  // //     let regex = /([🧪-✅])/u;
  // //     const target = "✅";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000295", () => {
  // //     let regex = /([€-क])/;
  // //     const target = "क";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000296", () => {
  // //     let regex = /([€-क])/u;
  // //     const target = "क";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000297", () => {
  //   let regex = /([क-€])/;
  //   const target = "€";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000298", () => {
  //   let regex = /([क-€])/u;
  //   const target = "€";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000299", () => {
  //   let regex = /([\uc290-\uc295])/;
  //   const target = "\uc293";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000300", () => {
  //   let regex = /([\uc290-\uc295])/u;
  //   const target = "\uc293";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000301", () => {
  // //     let regex = /([\uc295-\uc290])/;
  // //     const target = "\uc293";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000302", () => {
  // //     let regex = /([\uc295-\uc290])/u;
  // //     const target = "\uc293";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000303", () => {
  // //     let regex = /([\^-\$])/;
  // //     const target = "\uc293";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000304", () => {
  // //     let regex = /([\^-\$])/u;
  // //     const target = "\uc293";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups()(: Case0000305", () => {
  //   let regex = /([\$-\^])/;
  //   const target = "\$";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000306", () => {
  //   let regex = /([\$-\^])/u;
  //   const target = "\^";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000307", () => {
  // //     let regex = /([\c-b])/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000308", () => {
  // //     let regex = /([\c-b])/u;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000309", () => {
  // //     let regex = /([b-\c])/;
  // //     const target = "c";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000310", () => {
  // //     let regex = /([b-\c])/u;
  // //     const target = "c_";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000311", () => {
  //   let regex = /(a\c_b)/;
  //   const target = "a\x00b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Groups(): Case0000312", () => {
  // //     let regex =/(\c_)/u;
  // //     const target = "c_";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000313", () => {
  //   let regex = /([a\c_z])/;
  //   const target = "z";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000314", () => {
  // //     let regex = /([a\c_z])/u;
  // //     const target = "c_";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000315", () => {
  // //     let regex = /([_-,])/;
  // //     const target = ",";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000316", () => {
  // //     let regex = /([_-,])/u;
  // //     const target = "_";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000317", () => {
  //   let regex = /([,-_])/;
  //   const target = ",";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000318", () => {
  //   let regex = /([,-_])/u;
  //   const target = "_";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups()(: Case0000319", () => {
  //   let regex = /([:-;])/;
  //   const target = ";";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000320", () => {
  //   let regex = /([:-;])/u;
  //   const target = ":";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000321", () => {
  // //     let regex = /([;-:])/;
  // //     const target = ";";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000322", () => {
  // //     let regex = /([;-:])/u;
  // //     const target = ":";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000323", () => {
  //   let regex = /([!-@])/;
  //   const target = "@";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000324", () => {
  //   let regex = /([!-@])/u;
  //   const target = "!";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000325", () => {
  // //     let regex = /([@-!])/;
  // //     const target = "@";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000326", () => {
  // //     let regex = /([@-!])/u;
  // //     const target = "!";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000327", () => {
  //   let regex = /([#-%])/;
  //   const target = "%";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000328", () => {
  //   let regex = /([#-%])/u;
  //   const target = "#";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000329", () => {
  // //     let regex = /([%-#])/;
  // //     const target = "%";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000330", () => {
  // //     let regex = /([%-#])/u;
  // //     const target = "#";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000331", () => {
  //   let regex = /([&-(])/;
  //   const target = "&";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000332", () => {
  //   let regex = /([&-(])/u;
  //   const target = "(";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000333", () => {
  // //     let regex = /([(-&])/;
  // //     const target = "&";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000334", () => {
  // //     let regex = /([(-&])/u;
  // //     const target = "(";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000335", () => {
  // //     let regex = /([)-$])/;
  // //     const target = "&";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000336", () => {
  // //     let regex = /([)-$])/u;
  // //     const target = "(";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000337", () => {
  //   let regex = /([$-)])/;
  //   const target = "&";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000338", () => {
  //   let regex = /([$-)])/u;
  //   const target = "(";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups()(: Case0000339", () => {
  //   let regex = /([^-{])/;
  //   const target = "}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000340", () => {
  //   let regex = /([^-{])/u;
  //   const target = "_";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000341", () => {
  // //     let regex = /([{-^])/;
  // //     const target = "^";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000342", () => {
  // //     let regex = /([{-^])/u;
  // //     const target = "{";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups()(: Case0000343", () => {
  //   let regex = /([\^-{])/;
  //   const target = "^";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000344", () => {
  //   let regex = /([\^-{])/u;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000345", () => {
  // //     let regex = /([{-\^])/;
  // //     const target = "^";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000346", () => {
  // //     let regex = /([{-\^])/u;
  // //     const target = "{";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000347", () => {
  // //     let regex = /([}-?])/;
  // //     const target = "?";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000348", () => {
  // //     let regex = /([}-?])/u;
  // //     const target = "}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000349", () => {
  //   let regex = /([?-}])/;
  //   const target = "?";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000350", () => {
  //   let regex = /([?-}])/u;
  //   const target = "}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000351", () => {
  // //     let regex = /([+-*])/;
  // //     const target = "+";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000352", () => {
  // //     let regex = /([+-*])/u;
  // //     const target = "*";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups()(: Case0000353", () => {
  //   let regex = /([*-+])/;
  //   const target = "+";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000354", () => {
  //   let regex = /([*-+])/u;
  //   const target = "*";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups()(: Case0000355", () => {
  //   let regex = /([/-|])/;
  //   const target = "/";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000356", () => {
  //   let regex = /([/-|])/u;
  //   const target = "|";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000357", () => {
  // //     let regex = /([|-/])/;
  // //     const target = "+";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000358", () => {
  // //     let regex = /([|-/])/u;
  // //     const target = "*";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000359", () => {
  //   let regex = /(["-'])/;
  //   const target = '"';
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000360", () => {
  //   let regex = /(["-'])/u;
  //   const target = "'";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000361", () => {
  // //     let regex = /(['-"])/;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000362", () => {
  // //     let regex = /(['-"])/u;
  // //     const target = "'";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000363", () => {
  //   let regex = /([<->])/;
  //   const target = "<";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000364", () => {
  //   let regex = /([<->])/u;
  //   const target = ">";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000365", () => {
  // //     let regex = /([>-<])/;
  // //     const target = "<";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000366", () => {
  // //     let regex = /([>-<])/u;
  // //     const target = ">";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000367", () => {
  //   let regex = /([=-`])/;
  //   const target = "=";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000368", () => {
  //   let regex = /([=-`])/u;
  //   const target = "`";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000369", () => {
  // //     let regex = /([`-=])/;
  // //     const target = "=";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000370", () => {
  // //     let regex = /([`-=])/u;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000371", () => {
  //   let regex = /([`-~])/;
  //   const target = "~";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000372", () => {
  //   let regex = /([`-~])/u;
  //   const target = "`";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000373", () => {
  // //     let regex = /([~-`])/;
  // //     const target = "~";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000374", () => {
  // //     let regex = /([~-`])/u;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000375", () => {
  //   let regex = /([[])/;
  //   const target = "[";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000376", () => {
  //   let regex = /([[])/u;
  //   const target = "[";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000377", () => {
  //   let regex = /([[-b])/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case000078", () => {
  //   let regex = /([[-b])/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000379", () => {
  // //     let regex = /([b-[])/;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000380", () => {
  // //     let regex = /([b-[])/u;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000381", () => {
  //   let regex = /([ab]a])/;
  //   const target = "ba]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000382", () => {
  // //     let regex = /([ab]a])/u;
  // //     const target = "ba]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000383", () => {
  //   let regex = /(a(b(c)d(e)f)g(hi)j)klm/;
  //   const target = "abcdefghijklm";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000384", () => {
  //   let regex = /(a(b(c)d(e)f)g(hi)j)klm/u;
  //   const target = "abcdefghijklm";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000385", () => {
  //   let regex = /(?:abc)/;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000386", () => {
  //   let regex = /(?:abc)/u;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000387", () => {
  // //     let regex = /(?>abc)/;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000388", () => {
  // //     let regex = /(?>abc)/u;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000389", () => {
  //   let regex = /(abc+)/;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000390", () => {
  //   let regex = /(abc+)/u;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000391", () => {
  // //     let regex = /(abc++)/;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000392", () => {
  // //     let regex = /(abc++)/u;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000393", () => {
  //   let regex = /(abc*?)/;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000394", () => {
  //   let regex = /(abc*?)/u;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000395", () => {
  // //     let regex = /(abc*??)/;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000396", () => {
  // //     let regex = /(abc*??)/u;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000397", () => {
  // //     let regex = /(?<=ab)+/;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000398", () => {
  // //     let regex = /(?<=ab)+/u;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000399", () => {
  // //     let regex = /(?<=ab)*/;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000400", () => {
  // //     let regex = /(?<=ab)*/u;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000401", () => {
  // //     let regex = /(?<=ab)?/;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000402", () => {
  // //     let regex = /(?<=ab)?/u;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000403", () => {
  // //     let regex = /(?<=ab){1,}/;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000404", () => {
  // //     let regex = /(?<=ab){1,}/u;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000405", () => {
  // //     let regex = /(?<=ab){1,1}/;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000406", () => {
  // //     let regex = /(?<=ab){1,1}/u;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000407", () => {
  // //     let regex = /(?<=ab){1,3}/;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000408", () => {
  // //     let regex = /(?<=ab){1,3}/u;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000409", () => {
  // //     let regex = /(?<=ab){3,1}/;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000410", () => {
  // //     let regex = /(?<=ab){3,1}/u;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000411", () => {
  // //     let regex = /(ab(?<=ab)+)+/;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000412", () => {
  // //     let regex = /(ab(?<=ab)+)+/u;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000413", () => {
  //   let regex = /(ab(?=ab)+)+/;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000414", () => {
  // //     let regex = /(ab(?=ab)+)+/u;
  // //     const target = "abab";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000415", () => {
  //   let regex = /(?=ab)+/;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000416", () => {
  // //     let regex = /(?=ab)+/u;
  // //     const target = "abab";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000417", () => {
  //   let regex = /(?!ab)*/;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000418", () => {
  // //     let regex = /(?!ab)*/u;
  // //     const target = "abab";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000419", () => {
  // //     let regex = /(?<=ab)+/;
  // //     const target = "abab";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000420", () => {
  // //     let regex = /(?<=ab)+/u;
  // //     const target = "abab";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000421", () => {
  // //     let regex = /(?<!ab)?/;
  // //     const target = "abab";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000422", () => {
  // //     let regex = /(?<!ab)?/u;
  // //     const target = "abab";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups(): Case0000423", () => {
  //   let regex = /(?<=a+)b/;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000424", () => {
  //   let regex = /(?<=a+)b/u;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000425", () => {
  //   let regex = /(?<=a*)b/;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000426", () => {
  //   let regex = /(?<=a*)b/u;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000427", () => {
  //   let regex = /(?<=a{1,3})b/;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000428", () => {
  //   let regex = /(?<=a{1,3})b/u;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000429", () => {
  //   let regex = /(?<=\w+)b/;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000430", () => {
  //   let regex = /(?<=\w+)b/u;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000431", () => {
  //   let regex = /(?<=ab|abc)b/;
  //   const target = "abcb";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000432", () => {
  //   let regex = /(?<=ab|abc)b/u;
  //   const target = "abb";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000433", () => {
  //   let regex = /(?<=abc)b/;
  //   const target = "abcb";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000434", () => {
  //   let regex = /(?<=abc)b/u;
  //   const target = "abcb";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000435", () => {
  //   let regex = /(?<=\d{3})x/;
  //   const target = "123x";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000436", () => {
  //   let regex = /(?<=\d{3})x/u;
  //   const target = "123x";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000437", () => {
  //   let regex = /(?<=ab|cd)x/;
  //   const target = "cdx";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000438", () => {
  //   let regex = /(?<=ab|cd)x/u;
  //   const target = "abx";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000439", () => {
  //   let regex = /(?:(?=ab))+/;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000440", () => {
  //   let regex = /(?:(?=ab))+/u;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000441", () => {
  //   let regex = /(?<=a|bc|def)g/;
  //   const target = "defg";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000442", () => {
  //   let regex = /(?<=a|bc|def)g/u;
  //   const target = "bcg";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000443", () => {
  //   let regex = /(?<=ab|cd)g/;
  //   const target = "cdg";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000444", () => {
  //   let regex = /(?<=ab|cd)g/u;
  //   const target = "abg";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000445", () => {
  //   let regex = /(?<=a{2,4})b/;
  //   const target = "aab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000446", () => {
  //   let regex = /(?<=a{2,4})b/u;
  //   const target = "aab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000447", () => {
  //   let regex = /(?<=\d+)b/;
  //   const target = "1b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000448", () => {
  //   let regex = /(?<=\d+)b/u;
  //   const target = "1b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000449", () => {
  //   let regex = /(?<=a*)b/;
  //   const target = "b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000450", () => {
  //   let regex = /(?<=a*)b/u;
  //   const target = "ab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000451", () => {
  //   let regex = /(?<=a{3})b/;
  //   const target = "aaab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000452", () => {
  //   let regex = /(?<=a{3})b/u;
  //   const target = "aaab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000453", () => {
  //   let regex = /(?<=(a+))b/;
  //   const target = "aaab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000454", () => {
  //   let regex = /(?<=(a+))b/u;
  //   const target = "aaab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000455", () => {
  //   let regex = /(?<=(abc))d/;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000456", () => {
  //   let regex = /(?<=(abc))d/u;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // 6. /(?<=a(?<=b+))c/
  // test("Groups(): Case0000457", () => {
  //   let regex = /(?<=a(?<=b+))c/;
  //   const target = "a(bb)c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups(): Case0000458", () => {
  //   let regex = /(?<=a(?<=b+))c/u;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // 9. /(?=(\1))/
  // test("Groups(): Case0000459", () => {
  //   let regex = /(?=(\1))/;
  //   // @info: matches with anything
  //   const target = "any35}{[thin%g";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000460", () => {
  //   let regex = /(?=(\1))\1/u;
  //   // @info: matches with anything
  //   const target = "any35}{[thin%g";
  //   console.log("output46000: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // // 10. /(?=(?<x>a)\k<y>)/
  // // test("Groups(): Case0000461", () => {
  // //     let regex = /(?=(?<x>a)\k<y>)/;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000462", () => {
  // //     let regex = /(?=(?<x>a)\k<y>)/u;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 11. /(?=(?<x>a))(?=(?<x>b))/
  // // test("Groups(): Case00004563", () => {
  // //     let regex = /(?=(?<x>a))(?=(?<x>b))/;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000464", () => {
  // //     let regex = /(?=(?<x>a))(?=(?<x>b))/u;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 12. /(?=\xZ)/
  // test("Groups(): Case0000465", () => {
  //   let regex = /(?=\xZ)/;
  //   const target = "xZ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000466", () => {
  // //     let regex = /(?=\xZ)/u;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 12. /(?<=\u123)/
  // test("Groups(): Case0000467", () => {
  //   let regex = /(?<=\u123)/;
  //   const target = "u123";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000468", () => {
  // //     let regex = /(?<=\u123)/u;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 13. /(?<=\p{Letter}+)x/u
  // test("Groups(): Case0000469", () => {
  //   let regex = /(?<=\p{Letter}+)x/;
  //   const target = "p{Letter}}x";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000470", () => {
  //   let regex = /(?<=\p{Letter}+)x/u;
  //   const target = "abx";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // 14. /[ (?=a) ]/
  // test("Groups(): Case0000471", () => {
  //   let regex = /[ (?=a) ]/;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000472", () => {
  //   let regex = /[ (?=a) ]/u;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // 15. /(?=a)+*/
  // // test("Groups(): Case0000473", () => {
  // //     let regex = /(?=a)+*/;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000474", () => {
  // //     let regex = /(?=a)+*/u;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 16. /(?=[z-a])/
  // // test("Groups(): Case0000475", () => {
  // //     let regex = /(?=[z-a])/;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000476", () => {
  // //     let regex = /(?=[z-a])/u;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 17. /(?=abc
  // // test("Groups(): Case0000477", () => {
  // //     let regex = /(?=abc;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000478", () => {
  // //     let regex = /(?=abcu;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 18. /(?<=\1(a))b/
  // test("Groups(): Case0000479", () => {
  //   let regex = /(?<=\1(a))b/;
  //   const target = "1(a)b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups(): Case0000480", () => {
  //   let regex = /(?<=\1(a))b/u;
  //   const target = "ab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // 19. /(?<=>a)b/
  // test("Groups(): Case0000481", () => {
  //   let regex = /(?<=>a)b/;
  //   const target = ">ab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000482", () => {
  //   let regex = /(?<=>a)b/u;
  //   const target = ">ab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // 20. /(?<=a{1,3})b/u
  // test("Groups(): Case0000483", () => {
  //   let regex = /(?<=a{1,3})b/;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000484", () => {
  //   let regex = /(?<=a{1,3})b/u;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // 21. /(?=a)+/u
  // test("Groups(): Case0000485", () => {
  //   let regex = /(?=a)+/;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000486", () => {
  // //     let regex = /(?=a)+/u;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 22. /(?=(a)\2)/
  // test("Groups(): Case0000487", () => {
  //   let regex = /(?=(a)\2)/;
  //   const target = "a\x02";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000488", () => {
  // //     let regex = /(?=(a)\2)/u;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 23. /(?<=\1)(a)/
  // test("Groups(): Case0000489", () => {
  //   let regex = /(?<=\1)(a)/;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000490", () => {
  //   let regex = /(?<=\1)(a)/u;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // 27. /(?<1>a)/
  // // test("Groups(): Case0000491", () => {
  // //     let regex = /(?<1>a)/;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups(): Case0000492", () => {
  // //     let regex = /(?<1>a)/u;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 28. /(?=\p{FakeProperty})/u
  // test("Groups(): Case0000493", () => {
  //   let regex = /(?=\p{FakeProperty})/;
  //   const target = "p{FakeProperty}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000494", () => {
  // //     let regex = /(?=\p{FakeProperty})/u;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 7. /(?<=)a/
  // test("Groups(): Case0000495", () => {
  //   let regex = /(?<=)a/;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000496", () => {
  //   let regex = /(?<=)a/u;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // 8. /(?<=a)b/
  // test("Groups(): Case0000497", () => {
  //   let regex = /(?<=a)b/;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000498", () => {
  //   let regex = /(?<=a)b/u;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // 21. /(?=a)+/
  // test("Groups(): Case0000499", () => {
  //   let regex = /(?=a)+/;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000500", () => {
  // //     let regex = /(?=a)+/u;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 24. /(?=(?=a))/
  // test("Groups(): Case0000501", () => {
  //   let regex = /(?=(?=a))/;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000502", () => {
  //   let regex = /(?=(?=a))/u;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // 25. /(?=(?=(?=a)))*/
  // test("Groups(): Case0000503", () => {
  //   let regex = /(?=(?=(?=a)))*/;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups(): Case0000504", () => {
  // //     let regex = /(?=(?=(?=a)))*/u;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // 26. /(?: (?<=a)b )+/
  // test("Groups(): Case0000505", () => {
  //   let regex = /(?: (?<=a)b )+/;
  //   const target = " ab ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups(): Case0000506", () => {
  //   let regex = /(?: (?<=a)b )+/u;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // 29. /(?<=^a)b/
  // test("Groups(): Case0000507", () => {
  //   let regex = /(?<=^a)b/;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups(): Case0000508", () => {
  //   let regex = /(?<=^a)b/u;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // 30. /(?=a)(?!a)/
  // test("Groups(): Case0000509", () => {
  //   let regex = /(?=a)(?!a)/;
  //   const target = "aa";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups(): Case0000510", () => {
  //   let regex = /(?=a)(?!a)/u;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Digit backreference: Case000001", () => {
  //   let regex = /\0/;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case000002", () => {
  //   let regex = /\0/u;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case000003", () => {
  //   let regex = /\1/;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case000004", () => {
  // //     let regex = /\1/u;
  // //     const target = "\x01";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case000005", () => {
  //   let regex = /\2/;
  //   const target = "\x02";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case00006", () => {
  // //     let regex = /\2/u;
  // //     const target = "\x02";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case000007", () => {
  //   let regex = /\3/;
  //   const target = "\x03";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case000008", () => {
  // //     let regex = /\3/u;
  // //     const target = "\x03";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case000009", () => {
  //   let regex = /\4/;
  //   const target = "\x04";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000010", () => {
  // //     let regex = /\4/u;
  // //     const target = "\x04";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000011", () => {
  //   let regex = /\5/;
  //   const target = "\x05";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000012", () => {
  // //     let regex = /\5/u;
  // //     const target = "\x05";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000013", () => {
  //   let regex = /\6/;
  //   const target = "\x06";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000014", () => {
  // //     let regex = /\6/u;
  // //     const target = "\x06";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000015", () => {
  //   let regex = /\7/;
  //   const target = "\x07";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000016", () => {
  // //     let regex = /\7/u;
  // //     const target = "\x07";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000017", () => {
  //   let regex = /\8/;
  //   const target = "8";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000018", () => {
  // //     let regex = /\8/u;
  // //     const target = "\x08";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000019", () => {
  //   let regex = /\9/;
  //   const target = "9";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000020", () => {
  // //     let regex = /\9/u;
  // //     const target = "\x09";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000021", () => {
  //   let regex = /(anil)\0/;
  //   const target = "anil\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000022", () => {
  //   let regex = /(anil)\0/u;
  //   const target = "anil\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000023", () => {
  //   let regex = /(anil)\1/;
  //   const target = "anilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000024", () => {
  //   let regex = /(anil)\1/u;
  //   const target = "anilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000025", () => {
  //   let regex = /(anil)\2/;
  //   const target = "anil\x02";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case000026", () => {
  // //     let regex = /(anil)\2/u;
  // //     const target = "anil\x02";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000027", () => {
  //   let regex = /(anil)\3/;
  //   const target = "anil\x03";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000028", () => {
  // //     let regex = /(anil)\3/u;
  // //     const target = "anil\x03";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000029", () => {
  //   let regex = /(anil)\4/;
  //   const target = "anil\x04";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000030", () => {
  // //     let regex = /(anil)\4/u;
  // //     const target = "anil\x04";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000031", () => {
  //   let regex = /(anil)\5/;
  //   const target = "anil\x05";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000032", () => {
  // //     let regex = /(anil)\5/u;
  // //     const target = "anil\x05";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000033", () => {
  //   let regex = /(anil)\6/;
  //   const target = "anil\x06";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000034", () => {
  // //     let regex = /(anil)\6/u;
  // //     const target = "anil\x06";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000035", () => {
  //   let regex = /(anil)\7/;
  //   const target = "anil\x07";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000036", () => {
  // //     let regex = /(anil)\7/u;
  // //     const target = "anil\x07";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000037", () => {
  //   let regex = /(anil)\8/;
  //   const target = "anil8";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000038", () => {
  // //     let regex = /(anil)\8/u;
  // //     const target = "anil\x08";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000039", () => {
  //   let regex = /(anil)\9/;
  //   const target = "anil9";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000040", () => {
  // //     let regex = /(anil)\9/u;
  // //     const target = "anil\x09";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000041", () => {
  //   let regex = /(anil)(anil)\2/;
  //   const target = "anilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case000042", () => {
  //   let regex = /(anil)(anil)\2/u;
  //   const target = "anilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000043", () => {
  //   let regex = /(anil)(anil)(anil)\3/;
  //   const target = "anilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000044", () => {
  //   let regex = /(anil)(anil)(anil)\3/u;
  //   const target = "anilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000045", () => {
  //   let regex = /(anil)(anil)(anil)(anil)\4/;
  //   const target = "anilanilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000046", () => {
  //   let regex = /(anil)(anil)(anil)(anil)\4/u;
  //   const target = "anilanilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000047", () => {
  //   let regex = /(anil)(anil)(anil)(anil)(anil)\5/;
  //   const target = "anilanilanilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000048", () => {
  //   let regex = /(anil)(anil)(anil)(anil)(anil)\5/u;
  //   const target = "anilanilanilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000049", () => {
  //   let regex = /(anil)(anil)(anil)(anil)(anil)(anil)\6/;
  //   const target = "anilanilanilanilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000050", () => {
  //   let regex = /(anil)(anil)(anil)(anil)(anil)(anil)\6/u;
  //   const target = "anilanilanilanilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000051", () => {
  //   let regex = /(anil)(anil)(anil)(anil)(anil)(anil)(anil)\7/;
  //   const target = "anilanilanilanilanilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000052", () => {
  //   let regex = /(anil)(anil)(anil)(anil)(anil)(anil)(anil)\7/u;
  //   const target = "anilanilanilanilanilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000053", () => {
  //   let regex = /(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\8/;
  //   const target = "anilanilanilanilanilanilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000054", () => {
  //   let regex = /(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\8/u;
  //   const target = "anilanilanilanilanilanilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000055", () => {
  //   let regex = /(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\9/;
  //   const target = "anilanilanilanilanilanilanilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000056", () => {
  //   let regex = /(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\9/u;
  //   const target = "anilanilanilanilanilanilanilanilanilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000057", () => {
  //   let regex = /(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\10/;
  //   const target = "anilanilanilanilanilanilanilanilanil\x08";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000058", () => {
  // //     let regex = /(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\10/u;
  // //     const target = "anilanilanilanilanilanilanilanilanilanil";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000059", () => {
  //   let regex = /(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\11/;
  //   const target = "anilanilanilanilanilanilanilanilanilanil\x09";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000060", () => {
  // //     let regex = /(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\11/u;
  // //     const target = "anilanilanilanilanilanilanilanilanilanil";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000061", () => {
  //   let regex = /(?<x>anil)\k<x>/;
  //   const target = "anilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000062", () => {
  //   let regex = /(?<x>anil)\k<x>/u;
  //   const target = "anilanil";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000063", () => {
  //   let regex = /(?<outer>nehal(?<inner>lahen))\k<outer>\k<inner>/;
  //   const target = "nehallahennehallahenlahen";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000064", () => {
  //   let regex = /(?<outer>nehal(?<inner>lahen))\k<outer>\k<inner>/u;
  //   const target = "nehallahennehallahenlahen";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000065", () => {
  //   let regex = /(?=(?<x>aman))\k<x>/;
  //   const target = "amanaman";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000066", () => {
  //   let regex = /(?=(?<x>aman))\k<x>/u;
  //   const target = "amanaman";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000067", () => {
  //   let regex = /(?<=(?<x>aman))isnehal'suncle\k<x>/;
  //   const target = "amanisnehal'suncleaman";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000068", () => {
  //   let regex = /(?<=(?<x>aman))isnehal'suncle\k<x>/u;
  //   const target = "amanisnehal'suncleaman";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000069", () => {
  //   let regex = /(?:gutkha)\k<x>/;
  //   const target = "gutkha\k<x>";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000070", () => {
  // //     let regex = /(?:gutkha)\k<x>/u;
  // //     const target = "gutkha";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000071", () => {
  //   let regex = /(?:<x>gutkha)\k<x>/;
  //   const target = "<x>gutkha\k<x>";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000072", () => {
  // //     let regex = /(?:<x>gutkha)\k<x>/u;
  // //     const target = "gutkha";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000073", () => {
  //   let regex = /(?:<x>gutkha)/;
  //   const target = "<x>gutkha";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000074", () => {
  //   let regex = /(?:<x>gutkha)/u;
  //   const target = "<x>gutkha";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000075", () => {
  //   let regex = /(?<x>a)?\k<x>/;
  //   const target = "golu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000076", () => {
  //   let regex = /(?<x>a)?\k<x>/u;
  //   const target = "golu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000077", () => {
  //   let regex = /(?<x>b)?\k<x>/;
  //   const target = "alkaDidi";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000078", () => {
  //   let regex = /(?<x>b)?\k<x>/u;
  //   const target = "alkaDidi";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000079", () => {
  //   let regex = /(?<x>alka)|(?<x>didi)\k<x>/;
  //   const target = "didididi";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000080", () => {
  //   let regex = /(?<x>alka)|(?<x>didi)\k<x>/u;
  //   const target = "didididi";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000081", () => {
  //   let regex = /(?<x>kamal)+\k<x>/;
  //   const target = "kamalkamal";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000082", () => {
  //   let regex = /(?<x>kamal)+\k<x>/u;
  //   const target = "kamalkamal";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000083", () => {
  //   let regex = /(?<x>kamal)|tinku\k<x>/;
  //   const target = "tinku";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000084", () => {
  //   let regex = /(?<x>kamal)|tinku\k<x>/u;
  //   const target = "kamal";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000085", () => {
  // //     let regex = /(?<x>alka)(?<x>didi)|(?<x>nehal)\k<x>/;
  // //     const target = "nehalnehal";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Digit backreference: Case0000086", () => {
  // //     let regex = /(?<x>alka)(?<x>didi)|(?<x>nehal)\k<x>/u;
  // //     const target = "nehalnehal";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Digit backreference: Case0000087", () => {
  //   let regex = /(?<x>alka)(?<y>didi)\k<x>/;
  //   const target = "alkadidialka";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Digit backreference: Case0000088", () => {
  //   let regex = /(?<x>alka)(?<y>didi)\k<x>/u;
  //   const target = "alkadidialka";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Digit backreference: Case0000089", () => {
  // //     let regex = /(?<x>alka)(?<x>didi)\k<x>/;
  // //     const target = "alkadidialka";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Digit backreference: Case0000090", () => {
  // //     let regex = /(?<x>alka)(?<x>didi)\k<x>/u;
  // //     const target = "alkadidialka";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case0000001", () => {
  //   let regex = /abc/g;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case0000002", () => {
  //   let regex = /abc/i;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case0000003", () => {
  //   let regex = /abc/m;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case0000004", () => {
  //   let regex = /abc/s;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case0000005", () => {
  //   let regex = /abc/u;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case0000006", () => {
  //   let regex = /abc/y;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // test("flags: Case0000007", () => {
  //   let regex = /abc/d;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case0000008", () => {
  //   let regex = /abc/v;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case0000009", () => {
  // //     let regex = /abc/l;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case00000010", () => {
  // //     let regex = /abc/gg;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case00000011", () => {
  //   let regex = /abc/gi;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000012", () => {
  //   let regex = /abc/gm;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000013", () => {
  //   let regex = /abc/gs;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000014", () => {
  //   let regex = /abc/gu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000015", () => {
  //   let regex = /abc/gy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000016", () => {
  //   let regex = /abc/dg;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000017", () => {
  //   let regex = /abc/gv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000018", () => {
  //   let regex = /abc/gi;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case00000019", () => {
  // //     let regex = /abc/ii;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case00000020", () => {
  //   let regex = /abc/im;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000021", () => {
  //   let regex = /abc/is;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000022", () => {
  //   let regex = /abc/iu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000023", () => {
  //   let regex = /abc/iy;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   console.log("output: ", matchData);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // test("flags: Case00000024", () => {
  //   let regex = /abc/di;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000025", () => {
  //   let regex = /abc/iv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000026", () => {
  //   let regex = /abc/gm;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000027", () => {
  //   let regex = /abc/im;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case00000028", () => {
  // //     let regex = /abc/mm;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case00000029", () => {
  //   let regex = /abc/ms;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000030", () => {
  //   let regex = /abc/mu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000031", () => {
  //   let regex = /abc/my;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   console.log("output: ", matchData);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // test("flags: Case00000032", () => {
  //   let regex = /abc/dm;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000033", () => {
  //   let regex = /abc/mv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000034", () => {
  //   let regex = /abc/gs;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000035", () => {
  //   let regex = /abc/is;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000036", () => {
  //   let regex = /abc/ms;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case00000037", () => {
  // //     let regex = /abc/ss;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case00000038", () => {
  //   let regex = /abc/su;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000039", () => {
  //   let regex = /abc/sy;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   console.log("output: ", matchData);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // test("flags: Case00000040", () => {
  //   let regex = /abc/ds;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000041", () => {
  //   let regex = /abc/sv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000042", () => {
  //   let regex = /abc/gu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000043", () => {
  //   let regex = /abc/iu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000044", () => {
  //   let regex = /abc/mu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000045", () => {
  //   let regex = /abc/su;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case00000046", () => {
  // //     let regex = /abc/uu;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case00000047", () => {
  //   let regex = /abc/uy;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   console.log("output: ", matchData);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // test("flags: Case00000048", () => {
  //   let regex = /abc/du;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case00000049", () => {
  // //     let regex = /abc/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case00000050", () => {
  //   let regex = /abc/gy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000051", () => {
  //   let regex = /abc/iy;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   console.log("output: ", matchData);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // test("flags: Case00000052", () => {
  //   let regex = /abc/my;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   console.log("output: ", matchData);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // test("flags: Case00000053", () => {
  //   let regex = /abc/sy;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   console.log("output: ", matchData);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // test("flags: Case00000054", () => {
  //   let regex = /abc/uy;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   console.log("output: ", matchData);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // // test("flags: Case00000055", () => {
  // //     let regex = /abc/yy;
  // //     const target = "abc";
  // //     const matchData = target.match(regex);
  // //     console.log("output: ", matchData);
  // //     assert.strictEqual(matchData.index, 0);
  // // });

  // test("flags: Case00000056", () => {
  //   let regex = /abc/dy;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   console.log("output: ", matchData);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // test("flags: Case00000057", () => {
  //   let regex = /abc/vy;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   console.log("output: ", matchData);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // test("flags: Case00000058", () => {
  //   let regex = /abc/dg;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000059", () => {
  //   let regex = /abc/di;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000060", () => {
  //   let regex = /abc/dm;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000061", () => {
  //   let regex = /abc/ds;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000062", () => {
  //   let regex = /abc/du;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000063", () => {
  //   let regex = /abc/dy;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   console.log("output: ", matchData);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // // test("flags: Case00000064", () => {
  // //     let regex = /abc/dd;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case00000065", () => {
  //   let regex = /abc/dv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000066", () => {
  //   let regex = /abc/gv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000067", () => {
  //   let regex = /abc/iv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000068", () => {
  //   let regex = /abc/mv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000069", () => {
  //   let regex = /abc/sv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case00000070", () => {
  // //     let regex = /abc/vu;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case00000071", () => {
  //   let regex = /abc/vy;
  //   const target = "abc";
  //   const matchData = target.match(regex);
  //   console.log("output: ", matchData);
  //   assert.strictEqual(matchData.index, 0);
  // });

  // test("flags: Case00000072", () => {
  //   let regex = /abc/dv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case00000073", () => {
  // //     let regex = /abc/vv;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case00000074", () => {
  // //     let regex = /abc/ggg;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case00000075", () => {
  // //     let regex = /abc/ggi;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case00000076", () => {
  // //     let regex = /abc/ggm;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case00000077", () => {
  // //     let regex = /abc/ggs;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case00000078", () => {
  // //     let regex = /abc/ggu;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case00000079", () => {
  // //     let regex = /abc/ggy;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case00000080", () => {
  // //     let regex = /abc/ggd;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case00000081", () => {
  // //     let regex = /abc/ggv;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case00000082", () => {
  // //     let regex = /abc/gig;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case00000083", () => {
  // //     let regex = /abc/gii;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case00000084", () => {
  //   let regex = /abc/gim;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000085", () => {
  //   let regex = /abc/gis;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000086", () => {
  //   let regex = /abc/giu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000087", () => {
  //   let regex = /abc/giy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000088", () => {
  //   let regex = /abc/dgi;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000089", () => {
  //   let regex = /abc/giv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case00000090", () => {
  // //     let regex = /abc/gmg;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case00000091", () => {
  //   let regex = /abc/gim;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case00000092", () => {
  // //     let regex = /abc/gmm;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case00000093", () => {
  //   let regex = /abc/gms;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000094", () => {
  //   let regex = /abc/gmu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000095", () => {
  //   let regex = /abc/gmy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000096", () => {
  //   let regex = /abc/dgm;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case00000097", () => {
  //   let regex = /abc/gmv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case00000098", () => {
  // //     let regex = /abc/gsg;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case00000099", () => {
  //   let regex = /abc/gis;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000100", () => {
  //   let regex = /abc/gms;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case000000101", () => {
  // //     let regex = /abc/gss;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case000000102", () => {
  //   let regex = /abc/gsu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000103", () => {
  //   let regex = /abc/gsy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case0000000104", () => {
  //   let regex = /abc/dgs;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000105", () => {
  //   let regex = /abc/gsv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case000000106", () => {
  // //     let regex = /abc/gug;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case000000107", () => {
  //   let regex = /abc/giu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000108", () => {
  //   let regex = /abc/gmu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000109", () => {
  //   let regex = /abc/gsu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case000000110", () => {
  // //     let regex = /abc/guu;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case000000111", () => {
  //   let regex = /abc/guy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case0000000112", () => {
  //   let regex = /abc/dgu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case000000113", () => {
  // //     let regex = /abc/guv;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case000000114", () => {
  // //     let regex = /abc/gyg;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case000000115", () => {
  //   let regex = /abc/giy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000116", () => {
  //   let regex = /abc/gmy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000117", () => {
  //   let regex = /abc/gsy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000118", () => {
  //   let regex = /abc/guy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case000000119", () => {
  // //     let regex = /abc/gyy;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case0000000120", () => {
  //   let regex = /abc/dgy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000121", () => {
  //   let regex = /abc/gvy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case000000122", () => {
  // //     let regex = /abc/gdg;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case000000123", () => {
  //   let regex = /abc/dgi;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000124", () => {
  //   let regex = /abc/dgm;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000125", () => {
  //   let regex = /abc/dgs;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000126", () => {
  //   let regex = /abc/dgu;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000127", () => {
  //   let regex = /abc/dgy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case0000000128", () => {
  // //     let regex = /abc/gdd;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case000000129", () => {
  //   let regex = /abc/dgv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case000000130", () => {
  // //     let regex = /abc/gvg;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case000000131", () => {
  //   let regex = /abc/giv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000132", () => {
  //   let regex = /abc/gmv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case000000133", () => {
  //   let regex = /abc/gsv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case000000134", () => {
  // //     let regex = /abc/gvu;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("flags: Case000000135", () => {
  //   let regex = /abc/gvy;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("flags: Case0000000136", () => {
  //   let regex = /abc/dgv;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("flags: Case000000137", () => {
  // //     let regex = /abc/gvv;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("flags: Case000000138", () => {
  // //     let regex = /abc/gimsuydv;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case00000001", () => {
  //   let regex = /a&&b/v;
  //   const target = "a&&b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case00000002", () => {
  //   let regex = /[a&&b]/v;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   // @info: matches false
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Character classes in v mode: Case00000003", () => {
  // //     let regex = /[a&&]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case00000004", () => {
  // //     let regex = /[&&b]/v;
  // //     const target = "b";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case00000005", () => {
  // //     let regex = /[a--]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case00000006", () => {
  // //     let regex = /[--b]/v;
  // //     const target = "b";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case00000007", () => {
  // //     let regex = /[a&&b--c]/v;
  // //     const target = "";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case00000008", () => {
  //   let regex = /[abc]&&[bcdef]/v;
  //   const target = "a&&c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case00000009", () => {
  //   let regex = /[[abc]&&[bcdef]]/v;
  //   const target = "c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case000000010", () => {
  // //     let regex = /[a[b]/v;
  // //     const target = "b";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000011", () => {
  // //     let regex = /[a[b]]]/v;
  // //     const target = "b";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000012", () => {
  // //     let regex = /[\p{UnknownProperty}]/v;
  // //     const target = "b";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000013", () => {
  // //     let regex = /[\p{}]/v;
  // //     const target = "{";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000014", () => {
  //   let regex = /["abc]/v;
  //   const target = '"';
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case000000015", () => {
  // //     let regex = /[\q]/v;
  // //     const target = "q";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000016", () => {
  //   let regex = /[a&&c]&&c/v;
  //   const target = "b&&c";
  //   console.log("output: ", target.match(regex));
  //   // @info: matches false
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Character classes in v mode: Case000000017", () => {
  // //     let regex = /[&&]/v;
  // //     const target = "&";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000018", () => {
  //   let regex = /[]/v;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   // @info: matches false
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Character classes in v mode: Case000000019", () => {
  //   let regex = /["ab"c]/v;
  //   const target = '"';
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000020", () => {
  //   let regex = /["ab"c]/v;
  //   const target = '"';
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000021", () => {
  //   let regex = /[a&&a]/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000022", () => {
  //   let regex = /['&&']/v;
  //   const target = "'";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000023", () => {
  //   let regex = /["&&"]/v;
  //   const target = '"';
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000024", () => {
  //   let regex = /[`&&`]/v;
  //   const target = "`";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case000000025", () => {
  // //     let regex = /[a'&&'a]/v;
  // //     const target = "'";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000026", () => {
  // //     let regex = /[a"&&"a]/v;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000027", () => {
  // //     let regex = /[a`&&`a]/v;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000028", () => {
  // //     let regex = /[a'&&a']/v;
  // //     const target = "'";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000029", () => {
  // //     let regex = /[a"&&a"]/v;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000030", () => {
  // //     let regex = /[a`&&a`]/v;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000031", () => {
  // //     let regex = /['a&&'a]/v;
  // //     const target = "'";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000032", () => {
  // //     let regex = /["a&&"a]/v;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000033", () => {
  // //     let regex = /[`a&&`a]/v;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000034", () => {
  // //     let regex = /['a&&a']/v;
  // //     const target = "'";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000035", () => {
  // //     let regex = /["a&&a"]/v;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000036", () => {
  // //     let regex = /[`a&&a`]/v;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000037", () => {
  // //     let regex = /['a'&&'a']/v;
  // //     const target = "\'";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000038", () => {
  // //     let regex = /["a"&&"a"]/v;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000039", () => {
  // //     let regex = /[`a`&&`a`]/v;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000040", () => {
  // //     let regex = /['[a]'&&'[a]']/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000041", () => {
  // //     let regex = /["[a]"&&"[a]"]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000042", () => {
  // //     let regex = /[`[a]`&&`[a]`]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000043", () => {
  //   let regex = /[[a']&&[a']]/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000044", () => {
  //   let regex = /[[a"]&&[a"]]/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000045", () => {
  //   let regex = /[[a`]&&[a`]]/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case000000046", () => {
  // //     let regex = /[a[a`]&&[a`]]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000047", () => {
  // //     let regex = /[[a`]&&[a`]a]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000048", () => {
  // //     let regex = /[[a][a`]&&[a`][a]]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000049", () => {
  // //     let regex = /[(a)&&(a)]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000050", () => {
  // //     let regex = /[(a)(a)&&(a)(a)]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000051", () => {
  // //     let regex = /[(&&(]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000052", () => {
  // //     let regex = /[)&&)]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000053", () => {
  // //     let regex = /[a+&&a+]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000054", () => {
  // //     let regex = /[a*&&a*]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000055", () => {
  //   let regex = /["anil""dev"]/v;
  //   const target = '"';
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case000000056", () => {
  // //     let regex = /["anil"&&"anildeveloper"]/v;
  // //     const target = "anil";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000057", () => {
  //   let regex = /['anil']/v;
  //   const target = "'";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000058", () => {
  //   let regex = /[anil]/v;
  //   const target = "n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000059", () => {
  //   let regex = /[abc]&&[ebf]/v;
  //   const target = "b&&b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000060", () => {
  //   let regex = /abc&&[bcd]/v;
  //   const target = "abc&&c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case000000061", () => {
  // //     let regex = /)&&)/v;
  // //     const target = "abc&&c";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000062", () => {
  // //     let regex = /(&&(/v;
  // //     const target = "abc&&c";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000063", () => {
  //   // @info: precedence over range
  //   let regex = /[a--z]/v;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Character classes in v mode: Case000000064", () => {
  //   let regex = /[[a&&b][c--d]]/v;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Character classes in v mode: Case000000065", () => {
  //   let regex = /[a["bc"]]/v;
  //   // @info: could match with either: a, ", b, c, "
  //   const target = '"';
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000066", () => {
  //   let regex = /[a "bc" d]/v;
  //   const target = "c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000067", () => {
  //   let regex = /(abc)/v;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case000000068", () => {
  // //     let regex = /[(abc)]/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000069", () => {
  //   let regex = /(abc)[abc]/v;
  //   const target = "abcc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000070", () => {
  //   let regex = /(abc)[abc[[a-h]&&[d-g]]yz]/v;
  //   const target = "abcf";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case000000071", () => {
  // //     let regex = /(abc)[abc[s[a-h]&&[d-g]]yz]/v;
  // //     const target = "abcf";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000072", () => {
  // //     let regex = /(abc)[abc[[1-9][a-h]&&[d-g][A-F]]yz]/v;
  // //     const target = "abcf";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000073", () => {
  //   let regex = /[[[a-z]&&[f-h]]&&[[hack]&&[b-k]]]/v;
  //   const target = "h"; // [a-z && fgh] => fgh && [hack && bcdefghijk] => hck ==> fgh && hck => h
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case000000074", () => {
  // //     let regex = /[[[a-z]]&&[f-h]]&&[[hack]&&[b-k]]]/v;
  // //     const target = "h";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000075", () => {
  // //     let regex = /[[a&&b][c-\-d]]/v;
  // //     const target = "";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000076", () => {
  //   let regex = /[abc]--[ebf]/v;
  //   const target = "b--f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000077", () => {
  //   let regex = /abc--[bcd]/v;
  //   const target = "abc--c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case000000078", () => {
  // //     let regex = /[[[a-z]]--[f-h]]--[[hack]--[b-k]]]/v;
  // //     const target = "h";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000079", () => {
  // //     let regex = /[[a--b][c-\-d]]/v;
  // //     const target = "";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000080", () => {
  //   let regex = /(abc)[abc[[a-h]--[d-g]]yz]/v;
  //   const target = "abch";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case000000081", () => {
  // //     let regex = /(abc)[abc[s[a-h]--[d-g]]yz]/v;
  // //     const target = "abcf";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000082", () => {
  // //     let regex = /(abc)[abc[[1-9][a-h]--[d-g][A-F]]yz]/v;
  // //     const target = "abcf";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000083", () => {
  //   let regex = /[[[a-z]--[f-h]]--[[hack]--[b-k]]]/v;
  //   // [a-z -- fgh] => abcdeijk...z -- [hack -- bcdefghijk] => a ==> abcdeijk...z -- hck => abdeijl...z
  //   const target = "e";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000084", () => {
  //   let regex = /[abc]--[ebf]/v;
  //   const target = "b--b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case000000085", () => {
  //   let regex = /abc--[bcd]/v;
  //   const target = "abc--c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case000000086", () => {
  // //     let regex = /)--)/v;
  // //     const target = ")--)";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000087", () => {
  // //     let regex = /(--(/v;
  // //     const target = "(--(";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000088", () => {
  // //     let regex = /["anil"--"anildeveloper"]/v;
  // //     const target = "anil";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case000000089", () => {
  //   let regex = /[a--a]/v;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Character classes in v mode: Case000000090", () => {
  //   let regex = /['--']/v;
  //   const target = "'";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Character classes in v mode: Case000000091", () => {
  //   let regex = /["--"]/v;
  //   const target = '"';
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Character classes in v mode: Case000000092", () => {
  //   let regex = /[`--`]/v;
  //   const target = "`";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Character classes in v mode: Case000000093", () => {
  // //     let regex = /[a'--'a]/v;
  // //     const target = "'";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000094", () => {
  // //     let regex = /[a"--"a]/v;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000095", () => {
  // //     let regex = /[a`--`a]/v;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000096", () => {
  // //     let regex = /[a'--a']/v;
  // //     const target = "'";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000097", () => {
  // //     let regex = /[a"--a"]/v;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000098", () => {
  // //     let regex = /[a`--a`]/v;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case000000099", () => {
  // //     let regex = /['a--'a]/v;
  // //     const target = "'";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000100", () => {
  // //     let regex = /["a--"a]/v;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000101", () => {
  // //     let regex = /[`a--`a]/v;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000102", () => {
  // //     let regex = /['a--a']/v;
  // //     const target = "'";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000103", () => {
  // //     let regex = /["a--a"]/v;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000104", () => {
  // //     let regex = /[`a--a`]/v;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000105", () => {
  // //     let regex = /['a'--'a']/v;
  // //     const target = "\'";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000106", () => {
  // //     let regex = /["a"--"a"]/v;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000107", () => {
  // //     let regex = /[`a`--`a`]/v;
  // //     const target = "`";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000108", () => {
  // //     let regex = /['[a]'--'[a]']/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000109", () => {
  // //     let regex = /["[a]"--"[a]"]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000110", () => {
  // //     let regex = /[`[a]`--`[a]`]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case0000000111", () => {
  //   let regex = /[[a']--[a']]/v;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Character classes in v mode: Case0000000112", () => {
  //   let regex = /[[a"]--[a"]]/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Character classes in v mode: Case0000000113", () => {
  //   let regex = /[[a`]--[a`]]/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Character classes in v mode: Case0000000114", () => {
  // //     let regex = /[a[a`]--[a`]]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000115", () => {
  // //     let regex = /[[a`]--[a`]a]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000116", () => {
  // //     let regex = /[[a][a`]--[a`][a]]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000117", () => {
  // //     let regex = /[(a)--(a)]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000118", () => {
  // //     let regex = /[(a)(a)--(a)(a)]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000119", () => {
  // //     let regex = /[(--(]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000120", () => {
  // //     let regex = /[)--)]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000121", () => {
  // //     let regex = /[a+--a+]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000122", () => {
  // //     let regex = /[a*--a*]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case0000000123", () => {
  //   let regex = /[a--c]--c/v;
  //   const target = "b--c";
  //   console.log("output: ", target.match(regex));
  //   // @info: matches false
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Character classes in v mode: Case0000000124", () => {
  // //     let regex = /[-aaa]/v;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000125", () => {
  // //     let regex = /[aaa-]/v;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000126", () => {
  // //     let regex = /[--]/v;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000127", () => {
  // //     let regex = /[abc[--]bc]/v;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000128", () => {
  // //     let regex = /[abc[--]bc-]/v;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000129", () => {
  // //     let regex = /[abc[bf]bbc-]/v;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000130", () => {
  // //     let regex = /[abc[bf]-]/v;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000131", () => {
  // //     let regex = /[abc[bf-]]/v;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000132", () => {
  // //     let regex = /[abc[bf[a-z]-]]/v;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character classes in v mode: Case0000000133", () => {
  // //     let regex = /[a--b&&c]/v;
  // //     const target = "";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case0000000134", () => {
  //   let regex = /[abcdef]--[bcd]/v;
  //   const target = "f--c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case0000000135", () => {
  //   let regex = /[[abcdefghi]--[bcdef]]/v;
  //   const target = "g";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character classes in v mode: Case0000000136", () => {
  //   let regex = /a--b/v;
  //   const target = "a--b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character classes in v mode: Case0000000137", () => {
  // //     let regex = /[^-aa]/v;
  // //     const target = "a--b";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character classes in v mode: Case0000000137", () => {
  //   let regex = /[\^-aa]/v;
  //   const target = "_"; // a or any char between ^ and a, for example _
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals in v mode: Case000000001", () => {
  //   let regex = /a/v;
  //   assert.strictEqual(regex.test("a"), true);
  //   regex = /b/v;
  //   assert.strictEqual(regex.test("b"), true);
  //   regex = /1/v;
  //   assert.strictEqual(regex.test("1"), true);
  //   regex = /_/v;
  //   assert.strictEqual(regex.test("_"), true);
  //   regex = /€/v;
  //   assert.strictEqual(regex.test("€"), true);
  //   regex = /क/v;
  //   assert.strictEqual(regex.test("क"), true);
  //   regex = /あ/v;
  //   assert.strictEqual(regex.test("あ"), true);
  //   regex = /😀/v;
  //   assert.strictEqual(regex.test("😀"), true);

  //   // ...
  //   // ...U+10FFFF
  //   // Js supports upto U+10FFFF(1114111) characters.
  // });

  // test("Regex-Literals in v mode: Case000000002", () => {
  //   let regex = /abc/v;
  //   assert.strictEqual(regex.test("abc"), true);

  //   regex = /hello/v;
  //   assert.strictEqual(regex.test("hello"), true);

  //   regex = /123/v;
  //   assert.strictEqual(regex.test("123"), true);

  //   regex = /anil/v;
  //   assert.strictEqual(regex.test("anil"), true);

  //   regex = /😀🚀🔥/v;
  //   assert.strictEqual(regex.test("😀🚀🔥"), true);

  //   regex = /hello/v;
  //   assert.strictEqual(regex.test("hello"), true);

  //   regex = /abc123/v;
  //   assert.strictEqual(regex.test("abc123"), true);

  //   regex = /कखग/v;
  //   assert.strictEqual(regex.test("कखग"), true);
  // });

  // test("Regex-Literals in v mode: Case000000003", () => {
  //   let regex = /\^/v;
  //   assert.strictEqual(regex.test("^"), true);

  //   regex = /\$/v;
  //   assert.strictEqual(regex.test("$"), true);

  //   regex = /\./v;
  //   assert.strictEqual(regex.test("."), true);

  //   regex = /\*/v;
  //   assert.strictEqual(regex.test("*"), true);

  //   regex = /\+/v;
  //   assert.strictEqual(regex.test("+"), true);

  //   regex = /\?/v;
  //   assert.strictEqual(regex.test("?"), true);

  //   regex = /\(/v;
  //   assert.strictEqual(regex.test("("), true);

  //   regex = /\)/v;
  //   assert.strictEqual(regex.test(")"), true);

  //   regex = /\[/v;
  //   assert.strictEqual(regex.test("["), true);

  //   regex = /\]/v;
  //   assert.strictEqual(regex.test("]"), true);

  //   regex = /\{/v;
  //   assert.strictEqual(regex.test("{"), true);

  //   regex = /\}/v;
  //   assert.strictEqual(regex.test("}"), true);

  //   regex = /\|/v;
  //   assert.strictEqual(regex.test("|"), true);

  //   regex = /\\/v;
  //   assert.strictEqual(regex.test("\\"), true);
  // });

  // test("Regex-Literals in v mode: Case000000004", () => {
  //   let regex = /\x41/v;
  //   assert.strictEqual(regex.test("A"), true);
  // });

  // test("Regex-Literals in v mode: Case000000005", () => {
  //   let regex = /\u0061/v;
  //   assert.strictEqual(regex.test("a"), true);
  // });

  // test("Regex-Literals in v mode: Case000000006", () => {
  //   let regex = /\u{1F600}/v;
  //   assert.strictEqual(regex.test("😀"), true);
  // });

  // test("Regex-Literals in v mode: Case000000007", () => {
  //   let regex = /\n/v;
  //   assert.strictEqual(regex.test("\n"), true);

  //   regex = /\r/v;
  //   assert.strictEqual(regex.test("\r"), true);
  //   regex = /\t/v;
  //   assert.strictEqual(regex.test("\t"), true);
  //   regex = /\v/v;
  //   assert.strictEqual(regex.test("\v"), true);
  //   regex = /\f/v;
  //   assert.strictEqual(regex.test("\f"), true);
  //   regex = /\0/v;
  //   assert.strictEqual(regex.test("\0"), true);
  // });

  // test("Regex-Literals in v mode: Case000000008", () => {
  //   let regex = /\//v;
  //   assert.strictEqual(regex.test("/"), true);
  // });

  // test("Regex-Literals in v mode: Case000000009", () => {
  //   // let regex = /a/b/v;
  //   // assert.strictEqual(regex.test("a/b"), true);
  // });

  // test("Regex-Literals in v mode: Case0000000010", () => {
  //   // let regex = /ab/\v;
  //   // assert.strictEqual(regex.test("a/b"), true);
  // });

  // // test("Regex-Literals in v mode: Case0000000011", () => {
  // //     let regex = /\u{110000}/v;
  // //     const target = "u{110000}";
  // //     console.log("targettttttttttttttttttttttttttttt: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), false);
  // // });

  // // test("Regex-Literals in v mode: Case0000000012", () => {
  // //     let regex = /\c1/v;
  // //     assert.strictEqual(regex.test(""), true);
  // // });

  // // test("Regex-Literals in v mode: Case0000000013", () => {
  // //     let regex = /\ugg/v;
  // //     assert.strictEqual(regex.test("ugg"), true);
  // // });

  // test("Regex-Literals in v mode: Case0000000014", () => {
  //   let regex = /./v;
  //   const target = "anil";
  //   console.log("dot: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals in v mode: Case0000000015", () => {
  //   let regex = /\./v;
  //   const target = ".anil";
  //   console.log("dot: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals in v mode: Case0000000016", () => {
  //   let regex = /\r./v;
  //   const target = "\r.anil";
  //   console.log("dot: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals in v mode: Case0000000017", () => {
  // //     let regex = /{/v;
  // //     const target = "{";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals in v mode: Case0000000018", () => {
  // //     let regex = /}/v;
  // //     const target = ",}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals in v mode: Case0000000019", () => {
  //   let regex = /1/v;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals in v mode: Case0000000020", () => {
  //   let regex = /,/v;
  //   const target = ",";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals in v mode: Case0000000021", () => {
  //   let regex = /1,/v;
  //   const target = "1,";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals in v mode: Case0000000022", () => {
  //   let regex = /1,2/v;
  //   const target = "1,2";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals in v mode: Case0000000023", () => {
  //   let regex = /2,1/v;
  //   const target = "2,1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals in v mode: Case0000000024", () => {
  // //     let regex = /(/v;
  // //     const target = "(";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals in v mode: Case0000000025", () => {
  // //     let regex = /)/v;
  // //     const target = ")";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals in v mode: Case0000000026", () => {
  //   let regex = /[]/v;
  //   const target = "[]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Regex-Literals in v mode: Case0000000027", () => {
  // //     let regex = /]/v;
  // //     const target = "]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals in v mode: Case0000000028", () => {
  //   let regex = /[]/v;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Regex-Literals in v mode: Case0000000029", () => {
  // //     let regex = /?/v;
  // //     const target = "?";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals in v mode: Case0000000030", () => {
  //   let regex = /\?/v;
  //   const target = "?";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals in v mode: Case0000000031", () => {
  // //     let regex = /+/v;
  // //     const target = "+";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals in v mode: Case0000000032", () => {
  //   let regex = /\+/v;
  //   const target = "+";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals in v mode: Case0000000033", () => {
  // //     let regex = /\\+*/v;
  // //     const target = "\\\\*";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals in v mode: Case0000000034", () => {
  //   let regex = /\*/v;
  //   const target = "*";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals in v mode: Case0000000035", () => {
  // //     let regex = /a???/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals in v mode: Case0000000036", () => {
  //   let regex = /a??/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals in v mode: Case0000000037", () => {
  // //     let regex = /a+??/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals in v mode: Case0000000038", () => {
  //   let regex = /a+?/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals in v mode: Case0000000039", () => {
  // //     let regex = /a*??/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals in v mode: Case0000000040", () => {
  //   let regex = /a*?/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals in v mode: Case0000000041", () => {
  //   let regex = /asian/v;
  //   const target = "asian";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case0000000001", () => {
  // //   let regex = /\08/v;
  // //   const target = "\x008";
  // //   console.log("outputDigit: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case0000000002", () => {
  // //   let regex = /\107/v;
  // //   const target = "\u0047";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case0000000003", () => {
  // //   let regex = /\377/v;
  // //   const target = "\u00FF";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case0000000004", () => {
  // //   let regex = /\400/v;
  // //   const target = "\u00200";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case0000000005", () => {
  // //   let regex = /\777/v;
  // //   const target = "\u003F7";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case0000000006", () => {
  // //   let regex = /\378/v;
  // //   const target = "\u001F8";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case0000000007", () => {
  // //   let regex = /\397/v;
  // //   const target = "\u000397";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case0000000008", () => {
  // //   let regex = /\a/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case0000000009", () => {
  //   let regex = /\0/v;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000010", () => {
  // //   let regex = /\00/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000011", () => {
  // //   let regex = /\000/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000012", () => {
  // //   let regex = /\08/v;
  // //   const target = "\x008";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000013", () => {
  // //   let regex = /\008/v;
  // //   const target = "\x008";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000014", () => {
  // //   let regex = /\000/v;
  // //   const target = "abba";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000015", () => {
  // //   let regex = /\118/v;
  // //   const target = "abba";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000016", () => {
  // //   let regex = /\988/v;
  // //   const target = "abba";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000017", () => {
  // //   let regex = /\0988/v;
  // //   const target = "abba";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000018", () => {
  //   let regex = /\\a/v;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000019", () => {
  // //   let regex = /\_/v;
  // //   const target = "_";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000020", () => {
  // //   let regex = /\_/v;
  // //   const target = "_";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000021", () => {
  // //   let regex = /\!/v;
  // //   const target = "!";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000022", () => {
  // //   let regex = /\!/v;
  // //   const target = "!";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000023", () => {
  //   let regex = /\u{1F600}/v;
  //   const target = "\u{1F600}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000024", () => {
  //   let regex = /\u{1F600}/v;
  //   const target = "\u{1F600}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000025", () => {
  // //   let regex = /\u/v;
  // //   const target = "u";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000026", () => {
  // //   let regex = /\u/v;
  // //   const target = "u";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000027", () => {
  // //   let regex = /\c/v;
  // //   const target = "c";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000028", () => {
  // //   let regex = /\c/v;
  // //   const target = "c";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000029", () => {
  //   let regex = /\cA/v;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000030", () => {
  //   let regex = /\cA/v;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000031", () => {
  //   let regex = /\ca/v;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000032", () => {
  //   let regex = /\ca/v;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000033", () => {
  // //   let regex = /\c1/v;
  // //   const target = "c1";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000034", () => {
  // //   let regex = /\c1/v;
  // //   const target = "\x011";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000035", () => {
  // //   let regex = /\u{23,20}/v;
  // //   const target = "uuuuu";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000036", () => {
  // //   let regex = /\u{230,240}/v;
  // //   const target = "uuuuuuuuuu";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000037", () => {
  //   let regex = /\u{2}/v;
  //   const target = "\u{2}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000038", () => {
  // //   let regex = /\u{2,}/v;
  // //   const target = "uuuuuuuuuu";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000039", () => {
  // //   let regex = /\u{,23335}/v;
  // //   const target = "u{,23335}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000040", () => {
  // //   let regex = /\u{,}/v;
  // //   const target = "u{,}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000041", () => {
  // //   let regex = /\u{}/v;
  // //   const target = "uuuuuuuuuu";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000042", () => {
  //   let regex = /\u{1}/v;
  //   const target = "\u{1}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000043", () => {
  // //   let regex = /{1}/v;
  // //   const target = "uuuuuuuuuu";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000044", () => {
  // //   let regex = /\u{1:1}/v;
  // //   const target = "u{1:1}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000045", () => {
  //   let regex = /\u1234/v;
  //   const target = "\u1234";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000046", () => {
  // //   let regex = /\u123/v;
  // //   const target = "u123";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000047", () => {
  //   let regex = /\u1234/v;
  //   const target = "\u1234";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000048", () => {
  // //   let regex = /\u123/v;
  // //   const target = "u123";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000049", () => {
  //   let regex = /\u12345/v;
  //   const target = "\u12345";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000050", () => {
  // //   let regex = /\u1/v;
  // //   const target = "u1";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000051", () => {
  // //   let regex = /\u12/v;
  // //   const target = "u12";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000052", () => {
  // //   let regex = /\u1/v;
  // //   const target = "u1";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000053", () => {
  // //   let regex = /\u12/v;
  // //   const target = "u12";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000054", () => {
  // //     let regex = /[abc/v;
  // //     const target = "[abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000055", () => {
  // //     let regex = /(abc/v;
  // //     const target = "(abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000056", () => {
  // //   let regex = /(?<1>a)/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000057", () => {
  // //   let regex = /(?<a-b>a)/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000058", () => {
  // //   let regex = /\k<a>/v;
  // //   const target = "k<a>";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000059", () => {
  // //   let regex = /\k<a>/v;
  // //   const target = "k<a>";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000060", () => {
  //   let regex = /\p{L}/v;
  //   const target = "p{L}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000061", () => {
  // //   let regex = /\p{XYZ}/v;
  // //   const target = "p{XYZ}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000062", () => {
  //   let regex = /\p{L}/v;
  //   const target = "p{L}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000063", () => {
  // //   let regex = /\p{XYZ}/v;
  // //   const target = "p{XYZ}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000064", () => {
  // //   let regex = /{122222}/v;
  // //   const target = "{122222}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000065", () => {
  // //   let regex = /{}/v;
  // //   const target = "{}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000066", () => {
  // //   let regex = /{}/v;
  // //   const target = "{}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000067", () => {
  // //   let regex = /{/v;
  // //   const target = "{";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000068", () => {
  // //   let regex = /{/v;
  // //   const target = "{";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000069", () => {
  // //   let regex = /{,11}/v;
  // //   const target = "{,11}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000070", () => {
  // //   let regex = /{,11}/v;
  // //   const target = "{,11}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000071", () => {
  // //   let regex = /}/v;
  // //   const target = "}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000072", () => {
  // //   let regex = /}/v;
  // //   const target = "}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000073", () => {
  //   let regex = /1/v;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000074", () => {
  //   let regex = /1/v;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000075", () => {
  //   let regex = /143242/v;
  //   const target = "143242";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000076", () => {
  //   let regex = /143242/v;
  //   const target = "143242";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000077", () => {
  // //   let regex = /1}/v;
  // //   const target = "1}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000078", () => {
  // //   let regex = /1}/v;
  // //   const target = "1}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000079", () => {
  // //   let regex = /123424}/v;
  // //   const target = "123424}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000080", () => {
  // //   let regex = /123424}/v;
  // //   const target = "123424}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000081", () => {
  //   let regex = /1234,24/v;
  //   const target = "1234,24";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000082", () => {
  //   let regex = /1234,24/v;
  //   const target = "1234,24";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000083", () => {
  // //   let regex = /1234,24}/v;
  // //   const target = "1234,24}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000084", () => {
  // //   let regex = /1234,24}/v;
  // //   const target = "1234,24}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000085", () => {
  // //   let regex = /\p{}/v;
  // //   const target = "p{}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000086", () => {
  // //   let regex = /\p{}/v;
  // //   const target = "p{}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000087", () => {
  // //   let regex = /\p{=LETTER}/v;
  // //   const target = "p{=LETTER}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000088", () => {
  // //   let regex = /\p{=LETTER}/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000089", () => {
  // //   let regex = /\p{g=LETTER}/v;
  // //   const target = "p{g=LETTER}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Regex-Literals-escape_seqs in v mode : Case00000000090", () => {
  // //   let regex = /\p{g=LETTER}/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000091", () => {
  //   let regex = /\p{gc=Letter}/v;
  //   const target = "p{gc=Letter}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Regex-Literals-escape_seqs in v mode : Case00000000092", () => {
  //   let regex = /\p{gc=Letter}/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case00000000001", () => {
  //   let regex = /[]/v;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Character Classes[] in v mode: Case00000000002", () => {
  //   let regex = /[]/v;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Character Classes[] in v mode: Case00000000003", () => {
  //   let regex = /[.]/v;
  //   const target = ".";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case00000000004", () => {
  //   let regex = /[.]/v;
  //   const target = ".";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case00000000005", () => {
  // //   let regex = /[abc123_,:;!@#%&()$^{}?+*/|"'<>=`~ ]/v;
  // //   const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case00000000006", () => {
  // //   let regex = /[abc123_,:;!@#%&(){}?*+$^/|"'<>=`~ ]/v;
  // //   const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case00000000007", () => {
  // //     let regex = /[abc/v;
  // //     const target = "[abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case00000000008", () => {
  // //     let regex = /[abc/v;
  // //     const target = "[abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case00000000009", () => {
  //   let regex = /[^]/v;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case000000000010", () => {
  //   let regex = /[^]/v;
  //   const target = "z";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case000000000011", () => {
  //   let regex = /[a-z]/v;
  //   const target = "q";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case000000000012", () => {
  //   let regex = /[a-z]/v;
  //   const target = "q";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case000000000013", () => {
  // //     let regex = /[z-a]/v;
  // //     const target = "q";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000014", () => {
  // //     let regex = /[z-a]/v;
  // //     const target = "q";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000015", () => {
  // //   let regex = /[a-\d]/v;
  // //   const target = "-";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000015", () => {
  // //     let regex = /[\s-b]/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000016", () => {
  // //     let regex = /[z-\d]/v;
  // //     const target = "-";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000017", () => {
  // //   let regex = /[\d-a]/v;
  // //   const target = "[\d-a]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000018", () => {
  // //     let regex = /[\d-a]/v;
  // //     const target = "[\d-a]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000019", () => {
  // //   let regex = /[a-\w]/v;
  // //   const target = "[a-\w]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000020", () => {
  // //     let regex = /[z-\w]/v;
  // //     const target = "[a-\w]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000021", () => {
  // //   let regex = /[\w-a]/v;
  // //   const target = "[\w-a]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000022", () => {
  // //     let regex = /[\w-a]/v;
  // //     const target = "[\w-a]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000023", () => {
  // //   let regex = /[\w-\d]/v;
  // //   const target = "[\w-\d]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000024", () => {
  // //     let regex = /[\w-\d]/v;
  // //     const target = "[\w-\d]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000025", () => {
  // //   let regex = /[\d-\w]/v;
  // //   const target = "[\d-\w]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000026", () => {
  // //     let regex = /[\d-\w]/v;
  // //     const target = "[\d-\w]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000027", () => {
  // //   let regex = /[\d-\d]/v;
  // //   const target = "[\d-\d]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000028", () => {
  // //     let regex = /[\d-\d]/v;
  // //     const target = "[\d-\d]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000029", () => {
  // //   let regex = /[\w-\w]/v;
  // //   const target = "[\w-\w]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000030", () => {
  // //     let regex = /[\w-\w]/v;
  // //     const target = "[\w-\w]";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000031", () => {
  // //   let regex = /[a-c-h]/v;
  // //   // const target = "a"; // true
  // //   // const target = "b"; // true
  // //   // const target = "c"; // true
  // //   // const target = "-"; // true
  // //   // const target = "h"; // true
  // //   // const target = "d"; // false
  // //   // const target = "e"; // false
  // //   // const target = "f"; // false
  // //   // const target = "g"; // false
  // //   // const target = "i"; // false
  // //   const target = "-";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000032", () => {
  // //   let regex = /[a-c-h]/v;
  // //   // const target = "a"; // true
  // //   // const target = "b"; // true
  // //   // const target = "c"; // true
  // //   // const target = "-"; // true
  // //   // const target = "h"; // true
  // //   // const target = "d"; // false
  // //   // const target = "e"; // false
  // //   // const target = "f"; // false
  // //   // const target = "g"; // false
  // //   // const target = "i"; // false
  // //   const target = "b";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000033", () => {
  // //   let regex = /[-a]/v;
  // //   const target = "-";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000034", () => {
  // //   let regex = /[-a]/v;
  // //   const target = "-";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000035", () => {
  // //   let regex = /[a-]/v;
  // //   const target = "-";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000036", () => {
  // //   let regex = /[a-]/v;
  // //   const target = "-";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case000000000037", () => {
  //   // @Note: - is smaller than a
  //   let regex = /[a--z]/v;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Character Classes[] in v mode: Case000000000038", () => {
  //   // @Note: - is smaller than a
  //   let regex = /[a--z]/v;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Character Classes[] in v mode: Case000000000039", () => {
  // //   // @Note: - is smaller than a
  // //   let regex = /[--a]/v;
  // //   const target = "-";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000040", () => {
  // //   // @Note: - is smaller than a
  // //   let regex = /[--b]/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000041", () => {
  // //   let regex = /[\8]/v;
  // //   const target = "8";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000042", () => {
  // //     let regex = /[\8]/v;
  // //     const target = "8";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000043", () => {
  // //   let regex = /[\u123]/v;
  // //   // const target = "u"; // true
  // //   // const target = "1"; // true
  // //   // const target = "2"; // true
  // //   // const target = "4"; // false
  // //   const target = "3";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000044", () => {
  // //     let regex = /[\u123]/v;
  // //     const target = "3";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case000000000045", () => {
  //   let regex = /[\u0123]/v;
  //   const target = "\u0123";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case000000000046", () => {
  //   let regex = /[\u0123]/v;
  //   const target = "\u0123";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case000000000047", () => {
  // //     let regex = /[\]/v;
  // //     const target = "\\";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000048", () => {
  // //     let regex = /[\]/v;
  // //     const target = "\\";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case000000000049", () => {
  //   let regex = /[\0]/v;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case000000000050", () => {
  //   let regex = /[\0]/v;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case000000000051", () => {
  // //   let regex = /[\00]/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000052", () => {
  // //   let regex = /[\00]/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000053", () => {
  // //   let regex = /[\000]/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000054", () => {
  // //   let regex = /[\000]/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000055", () => {
  // //   let regex = /[\377]/v;
  // //   const target = "\u00ff";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000056", () => {
  // //   let regex = /[\377]/v;
  // //   const target = "\u00ff";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000057", () => {
  // //   let regex = /[\1]/v;
  // //   const target = "\u0001";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000058", () => {
  // //   let regex = /[\1]/v;
  // //   const target = "1";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000059", () => {
  // //   let regex = /(a)[\1]/v;
  // //   const target = "a\x01";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000060", () => {
  // //   let regex = /(a)[\1]/v;
  // //   const target = "a\x01";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000061", () => {
  // //   let regex = /[(a)\1]/v;
  // //   const target = ")";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000062", () => {
  // //   let regex = /[(a)\1]/v;
  // //   const target = ")";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case000000000063", () => {
  //   let regex = /[\p{Letter}]/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case000000000064", () => {
  //   let regex = /[\p{Letter}]/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case000000000065", () => {
  // //   let regex = /[\p{}]/v;
  // //   const target = "{";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000066", () => {
  // //   let regex = /[\p{}]/v;
  // //   const target = "T";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000067", () => {
  // //   let regex = /[\p{LETTER}]/v;
  // //   const target = "T";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000068", () => {
  // //   let regex = /[\p{LETTER}]/v;
  // //   const target = "T";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case000000000069", () => {
  //   let regex = /[\x001]/v;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case000000000070", () => {
  //   let regex = /[\x001]/v;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case000000000071", () => {
  // //   let regex = /[\xg1]/v;
  // //   const target = "x";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000072", () => {
  // //   let regex = /[\xg1]/v;
  // //   const target = "g";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000073", () => {
  // //   let regex = /[\k]/v;
  // //   const target = "k";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000074", () => {
  // //   let regex = /[\k]/v;
  // //   const target = "g";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000075", () => {
  // //   let regex = /[(?<a>a)\k<a>]/v;
  // //   const target = "<";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000076", () => {
  // //   let regex = /[(?<a>a)\k<a>]/v;
  // //   const target = ")";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000077", () => {
  // //   let regex = /(?<a>a)[\k<a>]/v;
  // //   const target = "aa";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000078", () => {
  // //   let regex = /(?<a>a)[\k<a>]/v;
  // //   const target = ")";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000079", () => {
  // //   let regex = /[\k<a>]/v;
  // //   const target = "aa";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000080", () => {
  // //   let regex = /[\k<a>]/v;
  // //   const target = "aa";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000081", () => {
  // //   let regex = /(?<b>a)\k<a>/v;
  // //   const target = "aa";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000082", () => {
  // //   let regex = /(?<b>a)\k<a>/v;
  // //   const target = "aa";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case000000000083", () => {
  //   let regex = /[✅-🧪]/v;
  //   const target = "🧪";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case000000000084", () => {
  //   let regex = /[✅-🧪]/v;
  //   const target = "🧪";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case000000000085", () => {
  // //   let regex = /[🧪-✅]/v;
  // //   const target = "✅";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000086", () => {
  // //   let regex = /[🧪-✅]/v;
  // //   const target = "✅";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000087", () => {
  // //   let regex = /[€-क]/v;
  // //   const target = "क";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000088", () => {
  // //   let regex = /[€-क]/v;
  // //   const target = "क";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case000000000089", () => {
  //   let regex = /[क-€]/v;
  //   const target = "€";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case000000000090", () => {
  //   let regex = /[क-€]/v;
  //   const target = "€";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case000000000091", () => {
  //   let regex = /[\uc290-\uc295]/v;
  //   const target = "\uc293";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case000000000092", () => {
  //   let regex = /[\uc290-\uc295]/v;
  //   const target = "\uc293";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case000000000093", () => {
  // //   let regex = /[\uc295-\uc290]/v;
  // //   const target = "\uc293";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000094", () => {
  // //   let regex = /[\uc295-\uc290]/v;
  // //   const target = "\uc293";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000095", () => {
  // //   let regex = /[\^-\$]/v;
  // //   const target = "\uc293";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case000000000096", () => {
  // //   let regex = /[\^-\$]/v;
  // //   const target = "\uc293";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case000000000097", () => {
  //   let regex = /[\$-\^]/v;
  //   const target = "\$";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case000000000098", () => {
  //   let regex = /[\$-\^]/v;
  //   const target = "\^";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case000000000099", () => {
  // //   let regex = /[\c-b]/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000100", () => {
  // //   let regex = /[\c-b]/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000101", () => {
  // //   let regex = /[b-\c]/v;
  // //   const target = "c";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000102", () => {
  // //   let regex = /[b-\c]/v;
  // //   const target = "c_";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000103", () => {
  // //   let regex = /\c_/v;
  // //   const target = "c_";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000104", () => {
  // //   let regex = /\c_/v;
  // //   const target = "c_";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000105", () => {
  // //   let regex = /[a\c_z]/v;
  // //   const target = "z";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000106", () => {
  // //   let regex = /[a\c_z]/v;
  // //   const target = "c_";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000107", () => {
  // //   let regex = /[_-,]/v;
  // //   const target = ",";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000108", () => {
  // //   let regex = /[_-,]/v;
  // //   const target = "_";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case0000000000109", () => {
  //   let regex = /[,-_]/v;
  //   const target = ",";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case0000000000110", () => {
  //   let regex = /[,-_]/v;
  //   const target = "_";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case0000000000111", () => {
  //   let regex = /[:-;]/v;
  //   const target = ";";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case0000000000112", () => {
  //   let regex = /[:-;]/v;
  //   const target = ":";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case0000000000113", () => {
  // //   let regex = /[;-:]/v;
  // //   const target = ";";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000114", () => {
  // //   let regex = /[;-:]/v;
  // //   const target = ":";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case0000000000115", () => {
  //   let regex = /[!-@]/v;
  //   const target = "@";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case0000000000116", () => {
  //   let regex = /[!-@]/v;
  //   const target = "!";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case0000000000117", () => {
  // //   let regex = /[@-!]/v;
  // //   const target = "@";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000118", () => {
  // //   let regex = /[@-!]/v;
  // //   const target = "!";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case0000000000119", () => {
  //   let regex = /[#-%]/v;
  //   const target = "%";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case0000000000120", () => {
  //   let regex = /[#-%]/v;
  //   const target = "#";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case0000000000121", () => {
  // //   let regex = /[%-#]/v;
  // //   const target = "%";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000122", () => {
  // //   let regex = /[%-#]/v;
  // //   const target = "#";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000123", () => {
  // //   let regex = /[&-(]/v;
  // //   const target = "&";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000124", () => {
  // //   let regex = /[&-(]/v;
  // //   const target = "(";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000125", () => {
  // //   let regex = /[(-&]/v;
  // //   const target = "&";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000126", () => {
  // //   let regex = /[(-&]/v;
  // //   const target = "(";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000127", () => {
  // //   let regex = /[)-$]/v;
  // //   const target = "&";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000128", () => {
  // //   let regex = /[)-$]/v;
  // //   const target = "(";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000129", () => {
  // //   let regex = /[$-)]/v;
  // //   const target = "&";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000130", () => {
  // //   let regex = /[$-)]/v;
  // //   const target = "(";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000131", () => {
  // //   let regex = /[^-{]/v;
  // //   const target = "}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000132", () => {
  // //   let regex = /[^-{]/v;
  // //   const target = "_";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000133", () => {
  // //   let regex = /[{-^]/v;
  // //   const target = "^";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000134", () => {
  // //   let regex = /[{-^]/v;
  // //   const target = "{";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000135", () => {
  // //   let regex = /[\^-{]/v;
  // //   const target = "^";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000136", () => {
  // //   let regex = /[\^-{]/v;
  // //   const target = "{";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000137", () => {
  // //   let regex = /[{-\^]/v;
  // //   const target = "^";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000138", () => {
  // //   let regex = /[{-\^]/v;
  // //   const target = "{";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000139", () => {
  // //   let regex = /[}-?]/v;
  // //   const target = "?";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000140", () => {
  // //   let regex = /[}-?]/v;
  // //   const target = "}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000141", () => {
  // //   let regex = /[?-}]/v;
  // //   const target = "?";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000142", () => {
  // //   let regex = /[?-}]/v;
  // //   const target = "}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000143", () => {
  // //   let regex = /[+-*]/v;
  // //   const target = "+";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000144", () => {
  // //   let regex = /[+-*]/v;
  // //   const target = "*";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case0000000000145", () => {
  //   let regex = /[*-+]/v;
  //   const target = "+";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case0000000000146", () => {
  //   let regex = /[*-+]/v;
  //   const target = "*";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case0000000000147", () => {
  // //   let regex = /[/-|]/v;
  // //   const target = "/";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000148", () => {
  // //   let regex = /[/-|]/v;
  // //   const target = "|";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000149", () => {
  // //   let regex = /[|-/]/v;
  // //   const target = "+";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000150", () => {
  // //   let regex = /[|-/]/v;
  // //   const target = "*";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case0000000000151", () => {
  //   let regex = /["-']/v;
  //   const target = '"';
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case0000000000152", () => {
  //   let regex = /["-']/v;
  //   const target = "'";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case0000000000153", () => {
  // //   let regex = /['-"]/v;
  // //   const target = '"';
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000154", () => {
  // //   let regex = /['-"]/v;
  // //   const target = "'";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case0000000000155", () => {
  //   let regex = /[<->]/v;
  //   const target = "<";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case0000000000156", () => {
  //   let regex = /[<->]/v;
  //   const target = ">";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case0000000000157", () => {
  // //   let regex = /[>-<]/v;
  // //   const target = "<";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000158", () => {
  // //   let regex = /[>-<]/v;
  // //   const target = ">";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case0000000000159", () => {
  //   let regex = /[=-`]/v;
  //   const target = "=";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case0000000000160", () => {
  //   let regex = /[=-`]/v;
  //   const target = "`";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case0000000000161", () => {
  // //   let regex = /[`-=]/v;
  // //   const target = "=";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000162", () => {
  // //   let regex = /[`-=]/v;
  // //   const target = "`";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Character Classes[] in v mode: Case0000000000163", () => {
  //   let regex = /[`-~]/v;
  //   const target = "~";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Character Classes[] in v mode: Case0000000000164", () => {
  //   let regex = /[`-~]/v;
  //   const target = "`";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Character Classes[] in v mode: Case0000000000165", () => {
  // //   let regex = /[~-`]/v;
  // //   const target = "~";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000166", () => {
  // //   let regex = /[~-`]/v;
  // //   const target = "`";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000167", () => {
  // //   let regex = /[[]/v;
  // //   const target = "[";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000168", () => {
  // //   let regex = /[[]/v;
  // //   const target = "[";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000169", () => {
  // //   let regex = /[[-b]/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000170", () => {
  // //   let regex = /[[-b]/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000171", () => {
  // //   let regex = /[b-[]/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000172", () => {
  // //   let regex = /[b-[]/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000173", () => {
  // //   let regex = /[ab]a]/v;
  // //   const target = "ba]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Character Classes[] in v mode: Case0000000000174", () => {
  // //   let regex = /[ab]a]/v;
  // //   const target = "ba]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case000000000001", () => {
  //   let regex = /(a)/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case000000000002", () => {
  //   let regex = /(abcdefjklmnostuvwxyz)/v;
  //   const target = "abcdefjklmnostuvwxyz";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case000000000003", () => {
  //   let regex = /(abcd-ghij)/v;
  //   const target = "abcd-ghij";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case000000000004", () => {
  // //     let regex = /(abcd/ghij)/v;
  // //     const target = "abcd/ghij";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case000000000005", () => {
  //   let regex = /(abcd!@#%=';:><.,~`"&ghij)/v;
  //   const target = "abcd!@#%=';:><.,~`\"&ghij";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // last-seq:
  // // test("Groups() in v mode: Case000000000006", () => {
  // //   let regex = /(\a)/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case000000000007", () => {
  // //   let regex = /(\a\e\j\l\m\o\y\z)/v;
  // //   const target = "aejklmoyz";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case000000000008", () => {
  // //   let regex = /(\k)/v;
  // //   const target = "aejklmoyz";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case000000000009", () => {
  // //   let regex = /(\a\-\g\h\i\j)/v;
  // //   const target = "a-ghij";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000010", () => {
  // //   let regex = /(\a\g\h\i\j)/v;
  // //   const target = "a/ghij";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000011", () => {
  // //   let regex = /(\a\!\@\#\%\=\'\;\:\>\<\,\~\`\"\&\g\h\i\j)/v;
  // //   const target = "a!@#%=';:><.,~`\"&ghij";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000000000012", () => {
  //   let regex = /(\n)/v;
  //   const target = "\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000013", () => {
  //   let regex = /(\b)/v;
  //   const target = "-a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000014", () => {
  //   let regex = /(\f)/v;
  //   const target = "\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000015", () => {
  //   let regex = /(\d)/v;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000016", () => {
  //   let regex = /(\r)/v;
  //   const target = "\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000017", () => {
  //   let regex = /(\s)/v;
  //   const target = " ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000018", () => {
  //   let regex = /(\t)/v;
  //   const target = "\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000019", () => {
  //   let regex = /(\v)/v;
  //   const target = "\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000020", () => {
  //   let regex = /(\w\w)/v;
  //   const target = "a1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000021", () => {
  //   let regex = /(\B)/v;
  //   const target = "a1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000022", () => {
  //   let regex = /(\D)/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000023", () => {
  //   let regex = /(\S)/v;
  //   const target = "@";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000024", () => {
  //   let regex = /(\W)/v;
  //   const target = ",";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000025", () => {
  //   let regex = /(\^)/v;
  //   const target = "^";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000026", () => {
  //   let regex = /(\$)/v;
  //   const target = "$";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000027", () => {
  //   let regex = /(\\)/v;
  //   const target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000028", () => {
  //   let regex = /(\.)/v;
  //   const target = ".";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000029", () => {
  //   let regex = /(\*)/v;
  //   const target = "*";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000030", () => {
  //   let regex = /(\+)/v;
  //   const target = "+";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000031", () => {
  //   let regex = /(\?)/v;
  //   const target = "?";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000032", () => {
  //   let regex = /(\[)/v;
  //   const target = "[";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000033", () => {
  //   let regex = /(\])/v;
  //   const target = "]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000034", () => {
  //   let regex = /(\()/v;
  //   const target = "(";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000035", () => {
  //   let regex = /(\))/v;
  //   const target = ")";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000036", () => {
  //   let regex = /(\{)/v;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000037", () => {
  //   let regex = /(\|)/v;
  //   const target = "|";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000038", () => {
  //   let regex = /(\/)/v;
  //   const target = "/";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000039", () => {
  //   let regex = /(a)/v;
  //   assert.strictEqual(regex.test("a"), true);
  //   regex = /(b)/;
  //   assert.strictEqual(regex.test("b"), true);
  //   regex = /(1)/;
  //   assert.strictEqual(regex.test("1"), true);
  //   regex = /(_)/;
  //   assert.strictEqual(regex.test("_"), true);
  //   regex = /(€)/;
  //   assert.strictEqual(regex.test("€"), true);
  //   regex = /(क)/;
  //   assert.strictEqual(regex.test("क"), true);
  //   regex = /(あ)/;
  //   assert.strictEqual(regex.test("あ"), true);
  //   regex = /(😀)/;
  //   assert.strictEqual(regex.test("😀"), true);

  //   // ...
  //   // ...U+10FFFF
  //   // Js supports upto U+10FFFF(1114111) characters.
  // });

  // test("Groups() in v mode: Case0000000000040", () => {
  //   let regex = /(abc)/v;
  //   assert.strictEqual(regex.test("abc"), true);

  //   regex = /(hello)/;
  //   assert.strictEqual(regex.test("hello"), true);

  //   regex = /(123)/;
  //   assert.strictEqual(regex.test("123"), true);

  //   regex = /(anil)/;
  //   assert.strictEqual(regex.test("anil"), true);

  //   regex = /(😀🚀🔥)/;
  //   assert.strictEqual(regex.test("😀🚀🔥"), true);

  //   regex = /(hello)/;
  //   assert.strictEqual(regex.test("hello"), true);

  //   regex = /(abc123)/;
  //   assert.strictEqual(regex.test("abc123"), true);

  //   regex = /(कखग)/;
  //   assert.strictEqual(regex.test("कखग"), true);
  // });

  // test("Groups() in v mode: Case0000000000041", () => {
  //   let regex = /(\^)/v;
  //   assert.strictEqual(regex.test("^"), true);

  //   regex = /(\$)/;
  //   assert.strictEqual(regex.test("$"), true);

  //   regex = /(\.)/;
  //   assert.strictEqual(regex.test("."), true);

  //   regex = /(\*)/;
  //   assert.strictEqual(regex.test("*"), true);

  //   regex = /(\+)/;
  //   assert.strictEqual(regex.test("+"), true);

  //   regex = /(\?)/;
  //   assert.strictEqual(regex.test("?"), true);

  //   regex = /(\()/;
  //   assert.strictEqual(regex.test("("), true);

  //   regex = /(\))/;
  //   assert.strictEqual(regex.test(")"), true);

  //   regex = /(\[)/;
  //   assert.strictEqual(regex.test("["), true);

  //   regex = /(\])/;
  //   assert.strictEqual(regex.test("]"), true);

  //   regex = /(\{)/;
  //   assert.strictEqual(regex.test("{"), true);

  //   regex = /(\})/;
  //   assert.strictEqual(regex.test("}"), true);

  //   regex = /(\|)/;
  //   assert.strictEqual(regex.test("|"), true);

  //   regex = /(\\)/;
  //   assert.strictEqual(regex.test("\\"), true);
  // });

  // test("Groups() in v mode: Case0000000000042", () => {
  //   let regex = /(\x41)/v;
  //   assert.strictEqual(regex.test("A"), true);
  // });

  // test("Groups() in v mode: Case0000000000043", () => {
  //   let regex = /(\u0061)/v;
  //   assert.strictEqual(regex.test("a"), true);
  // });

  // test("Groups() in v mode: Case0000000000044", () => {
  //   let regex = /(\n)/v;
  //   assert.strictEqual(regex.test("\n"), true);

  //   regex = /(\r)/;
  //   assert.strictEqual(regex.test("\r"), true);
  //   regex = /(\t)/;
  //   assert.strictEqual(regex.test("\t"), true);
  //   regex = /(\v)/;
  //   assert.strictEqual(regex.test("\v"), true);
  //   regex = /(\f)/;
  //   assert.strictEqual(regex.test("\f"), true);
  //   regex = /(\0)/;
  //   assert.strictEqual(regex.test("\0"), true);
  // });

  // test("Groups() in v mode: Case0000000000045", () => {
  //   let regex = /(\/)/v;
  //   assert.strictEqual(regex.test("/"), true);
  // });

  // // test("Groups() in v mode: Case0000000000046", () => {
  // //     let regex = /(a/b)/v;
  // //     assert.strictEqual(regex.test("a/b"), true);
  // // });

  // // test("Groups() in v mode: Case0000000000047", () => {
  // //     let regex = /(ab)/\v;
  // //     assert.strictEqual(regex.test("a/b"), true);
  // // });

  // // test("Groups() in v mode: Case0000000000048", () => {
  // //   let regex = /(\u{110000})/v;
  // //   assert.strictEqual(regex.test("a/b"), true);
  // // });

  // // test("Groups() in v mode: Case00000000049", () => {
  // //   let regex = /(\c1)/v;
  // //   assert.strictEqual(regex.test(""), false);
  // // });

  // // test("Groups() in v mode: Case0000000000050", () => {
  // //   let regex = /(\ugg)/v;
  // //   assert.strictEqual(regex.test("ugg"), true);
  // // });

  // test("Groups() in v mode: Case0000000000051", () => {
  //   let regex = /(.)/v;
  //   const target = "anil";
  //   console.log("dot: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000052", () => {
  //   let regex = /(\.)/v;
  //   const target = ".anil";
  //   console.log("dot: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000053", () => {
  //   let regex = /(\r.)/v;
  //   const target = "\r.anil";
  //   console.log("dot: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case0000000000054", () => {
  // //   let regex = /({)/v;
  // //   const target = "{";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000055", () => {
  // //   let regex = /(})/v;
  // //   const target = ",}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000000000056", () => {
  //   let regex = /(1,2)/v;
  //   const target = "1,2";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000057", () => {
  //   let regex = /(2,1)/v;
  //   const target = "2,1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case0000000000058", () => {
  // //     let regex = /(()/v;
  // //     const target = "(";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000059", () => {
  // //     let regex = /())/v;
  // //     const target = ")";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000060", () => {
  // //   let regex = /(])/v;
  // //   const target = "]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000000000061", () => {
  //   let regex = /([])/v;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Groups() in v mode: Case0000000000062", () => {
  // //   let regex = /(?)/v;
  // //   const target = "";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // test("Groups() in v mode: Case0000000000063", () => {
  //   let regex = /(\?)/v;
  //   const target = "?";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case0000000000064", () => {
  // //     let regex =/(+)/v;
  // //     const target = "+";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000000000065", () => {
  //   let regex = /(\+)/v;
  //   const target = "+";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case0000000000066", () => {
  // //     let regex = /(\\+*)/v;
  // //     const target = "\\\\*";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000000000067", () => {
  //   let regex = /(\*)/v;
  //   const target = "*";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case0000000000068", () => {
  // //   let regex = /(a???)/;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000000000069", () => {
  //   let regex = /(a??)/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case0000000000070", () => {
  // //     let regex = /(a+??)/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000000000071", () => {
  //   let regex = /(a+?)/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case000000000072", () => {
  // //     let regex =/(a*??)/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000000000073", () => {
  //   let regex = /(a*?)/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000074", () => {
  //   let regex = /(asian)/v;
  //   const target = "asian";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case0000000000075", () => {
  // //   let regex = /(\08)/v;
  // //   const target = "\x008";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000076", () => {
  // //   let regex = /(\107)/v;
  // //   const target = "\u0047";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000077", () => {
  // //   let regex = /(\377)/v;
  // //   const target = "\u00FF";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000078", () => {
  // //   let regex = /(\400)/v;
  // //   const target = "\u00200";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000079", () => {
  // //   let regex = /(\777)/v;
  // //   const target = "\u003F7";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000000000080", () => {
  //   let regex = /(a^|$sian)/v;
  //   const target = "a^|$sian";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Groups() in v mode: Case0000000000081", () => {
  // //   let regex = /(\378)/v;
  // //   const target = "\u001F8";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000082", () => {
  // //   let regex = /(\397)/v;
  // //   const target = "\u000397";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000083", () => {
  // //   let regex = /(\a)/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000000000084", () => {
  //   let regex = /(\0)/v;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case0000000000085", () => {
  // //   let regex = /(\00)/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000086", () => {
  // //   let regex = /(\000)/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000087", () => {
  // //   let regex = /(\08)/v;
  // //   const target = "\x008";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000088", () => {
  // //   let regex = /(\008)/v;
  // //   const target = "\x008";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000089", () => {
  // //     let regex =/(\000)/u;
  // //     const target = "abba";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000000000090", () => {
  //   let regex = /(\\a)/v;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case0000000000091", () => {
  // //   let regex = /(\_)/v;
  // //   const target = "_";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000092", () => {
  // //   let regex = /(\!)/v;
  // //   const target = "!";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000000000093", () => {
  //   let regex = /(\u{1F600})/v;
  //   const target = "\u{1F600}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case0000000000094", () => {
  // //   let regex = /(\u)/v;
  // //   const target = "u";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case0000000000095", () => {
  // //   let regex = /(\c)/v;
  // //   const target = "c";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // test("Groups() in v mode: Case0000000000096", () => {
  //   let regex = /(\cA)/v;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case0000000000097", () => {
  //   let regex = /(\ca)/v;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case0000000000098", () => {
  // //   let regex = /(\c1)/v;
  // //   const target = "c1";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // // test("Groups() in v mode: Case0000000000099", () => {
  // //     let regex =/(\u{23,20})/v;
  // //     const target = "uuuuu";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000100", () => {
  // //   let regex = /(\u{230,240})/v;
  // //   const target = "uuuuuuuuuu";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // test("Groups() in v mode: Case00000000000101", () => {
  //   // let regex =( /a^sian)/;
  //   let regex = /(\u{23335})/v;
  //   // regex will match iff 23335 u's are there in target string i.e., uuuuuuuuuuuuuuuuuuuu...+u <- 23335th
  //   const target = "u{,23335}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Groups() in v mode: Case00000000000102", () => {
  // //   // let regex =( /a^sian)/;
  // //   let regex = /(\u{23335,})/v;
  // //   // regex will match iff 23335 or more u's are there in target string i.e., uuuuuuuuuuuuuuuuuuuu...+u <- 23335th or more
  // //   const target = "u{,23335}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // // test("Groups() in v mode: Case00000000000103", () => {
  // //   let regex = /(\u{,23335})/v;
  // //   const target = "u{,23335}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000104", () => {
  // //   let regex = /(\u{,})/v;
  // //   const target = "u{,}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000105", () => {
  // //   let regex = /(\u{})/v;
  // //   const target = "u{}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000106", () => {
  //   let regex = /(\u{1})/v;
  //   const target = "\u{1}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000107", () => {
  // //     let regex = /({1})/v;
  // //     const target = "uuuuuuuuuu";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000108", () => {
  // //   let regex = /(\u{1:1})/v;
  // //   const target = "u{1:1}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000109", () => {
  //   let regex = /(\u1234)/v;
  //   const target = "\u1234";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000110", () => {
  // //   let regex = /(\u123)/v;
  // //   const target = "u123";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000111", () => {
  //   let regex = /(\u12345)/v;
  //   const target = "\u12345";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000112", () => {
  // //   let regex = /(\u1)/v;
  // //   const target = "u1";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000113", () => {
  // //   let regex = /(\u12)/v;
  // //   const target = "u12";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000114", () => {
  // //     let regex = /([abc)/v;
  // //     const target = "[abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000115", () => {
  // //     let regex = /((abc)/v;
  // //     const target = "(abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000116", () => {
  // //     let regex = /((?<1>a))/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000117", () => {
  // //     let regex = /((?<a-b>a))/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000118", () => {
  // //   let regex = /(\k<a>)/v;
  // //   const target = "k<a>";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000119", () => {
  //   let regex = /(\p{L})/v;
  //   const target = "p{L}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000120", () => {
  // //   let regex = /(\p{XYZ})/v;
  // //   const target = "p{XYZ}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000121", () => {
  // //     let regex = /({122222})/v;
  // //     const target = "{122222}";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000122", () => {
  // //   let regex = /({})/v;
  // //   const target = "{}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000123", () => {
  // //   let regex = /({)/v;
  // //   const target = "{";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000124", () => {
  // //   let regex = /({,11})/v;
  // //   const target = "{,11}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000125", () => {
  // //   let regex = /(})/v;
  // //   const target = "}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000126", () => {
  //   let regex = /(1)/v;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000127", () => {
  //   let regex = /(143242)/v;
  //   const target = "143242";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000128", () => {
  // //   let regex = /(1})/v;
  // //   const target = "1}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000129", () => {
  // //   let regex = /(123424})/v;
  // //   const target = "123424}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000130", () => {
  //   let regex = /(1234,24)/v;
  //   const target = "1234,24";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000131", () => {
  // //   let regex = /(1234,24})/v;
  // //   const target = "1234,24}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000132", () => {
  // //   let regex = /(\p{})/v;
  // //   const target = "p{}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000133", () => {
  // //   let regex = /(\p{=LETTER})/v;
  // //   const target = "p{=LETTER}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000134", () => {
  // //   let regex = /(\p{g=LETTER})/v;
  // //   const target = "p{g=LETTER}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000135", () => {
  //   let regex = /(\p{gc=Letter})/v;
  //   const target = "p{gc=Letter}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000136", () => {
  //   let regex = /([])/v;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups() in v mode: Case0000137", () => {
  //   let regex = /([.])/v;
  //   const target = ".";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000138", () => {
  // //   let regex = /([abc123_,:;!@#%&()$^{}?+*/|"'<>=`~ ])/v;
  // //   const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000139", () => {
  // //     let regex = /([abc)/v;
  // //     const target = "[abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case0000140", () => {
  //   let regex = /([^])/v;
  //   const target = "{";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000141", () => {
  //   let regex = /([a-z])/v;
  //   const target = "q";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000142", () => {
  // //     let regex = /([z-a])/v;
  // //     const target = "q";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000143", () => {
  // //   let regex = /([a-\d])/v;
  // //   const target = "-";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000144", () => {
  // //   let regex = /([\d-a])/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000145", () => {
  // //   let regex = /([a-\w])/v;
  // //   const target = "[\w-a]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000146", () => {
  // //   let regex = /([\w-a])/v;
  // //   const target = "[\w-a]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000147", () => {
  // //   let regex = /([\w-\d])/v;
  // //   const target = "[\w-\d]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000148", () => {
  // //   let regex = /([\d-\w])/v;
  // //   const target = "[\d-\w]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000149", () => {
  // //   let regex = /([\d-\d])/v;
  // //   const target = "[\d-\d]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000150", () => {
  // //   let regex = /([\w-\w])/v;
  // //   const target = "[\w-\w]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000151", () => {
  // //   let regex = /([a-c-h])/v;
  // //   const target = "-";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000152", () => {
  // //   let regex = /([-a])/v;
  // //   const target = "-";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000153", () => {
  // //   let regex = /([a-])/v;
  // //   const target = "-";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000154", () => {
  //   let regex = /([a--z])/v;
  //   const target = "";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Groups() in v mode: Case00000000000155", () => {
  // //   // @Note: - is smaller than a
  // //   let regex = /([--a])/v;
  // //   const target = "-";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000156", () => {
  // //   let regex = /([\8])/v;
  // //   const target = "8";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000157", () => {
  // //   let regex = /([\u123])/v;
  // //   // const target = "u"; // true
  // //   // const target = "1"; // true
  // //   // const target = "2"; // true
  // //   // const target = "4"; // false
  // //   const target = "3";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000158", () => {
  //   let regex = /([\u0123])/v;
  //   const target = "\u0123";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000159", () => {
  // //     let regex = /([\])/v;
  // //     const target = "\\";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000160", () => {
  //   let regex = /([\0])/v;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000161", () => {
  // //   let regex = /([\00])/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000162", () => {
  // //   let regex = /([\000])/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000163", () => {
  // //   let regex = /([\377])/v;
  // //   const target = "\u00ff";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000164", () => {
  // //   let regex = /([\1])/v;
  // //   const target = "\u0001";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000165", () => {
  // //   let regex = /((a)[\1])/v;
  // //   const target = "a\x01";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000166", () => {
  // //   let regex = /([(a)\1])/v;
  // //   const target = ")";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000167", () => {
  //   let regex = /([\p{Letter}])/v;
  //   const target = "l";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000168", () => {
  // //   let regex = /([\p{}])/v;
  // //   const target = "{";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000169", () => {
  // //   let regex = /([\p{LETTER}])/v;
  // //   const target = "T";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000170", () => {
  //   let regex = /([\x001])/v;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000171", () => {
  // //   let regex = /([\xg1])/v;
  // //   const target = "x";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000172", () => {
  // //   let regex = /([\k])/v;
  // //   const target = "k";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000173", () => {
  // //   let regex = /([(?<a>a)\k<a>])/v;
  // //   const target = "<";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000174", () => {
  // //   let regex = /((?<a>a)[\k<a>])/v;
  // //   const target = "aa";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000175", () => {
  // //   let regex = /([\k<a>])/v;
  // //   const target = "aa";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000176", () => {
  // //     let regex = /((?<b>a)\k<a>)/v;
  // //     const target = "aa";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000177", () => {
  //   let regex = /([✅-🧪])/v;
  //   const target = "🧪";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000178", () => {
  // //     let regex = /([🧪-✅])/v;
  // //     const target = "✅";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000179", () => {
  // //     let regex = /([€-क])/v;
  // //     const target = "क";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000180", () => {
  //   let regex = /([क-€])/v;
  //   const target = "€";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000181", () => {
  //   let regex = /([\uc290-\uc295])/v;
  //   const target = "\uc293";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000182", () => {
  // //     let regex = /([\uc295-\uc290])/v;
  // //     const target = "\uc293";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000183", () => {
  // //     let regex = /([\^-\$])/v;
  // //     const target = "\uc293";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000184", () => {
  //   let regex = /([\$-\^])/v;
  //   const target = "\$";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000185", () => {
  // //     let regex = /([\c-b])/v;
  // //     const target = "a";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000186", () => {
  // //     let regex = /([b-\c])/v;
  // //     const target = "c";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000187", () => {
  // //   let regex = /(a\c_b)/v;
  // //   const target = "a\x00b";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // // test("Groups() in v mode: Case00000000000188", () => {
  // //   let regex = /([a\c_z])/v;
  // //   const target = "z";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000189", () => {
  // //     let regex = /([_-,])/v;
  // //     const target = ",";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000190", () => {
  //   let regex = /([,-_])/v;
  //   const target = ",";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000191", () => {
  //   let regex = /([:-;])/v;
  //   const target = ";";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000192", () => {
  // //     let regex = /([;-:])/v;
  // //     const target = ";";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000193", () => {
  //   let regex = /([!-@])/v;
  //   const target = "@";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000194", () => {
  // //     let regex = /([@-!])/v;
  // //     const target = "@";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000195", () => {
  //   let regex = /([#-%])/v;
  //   const target = "%";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000196", () => {
  // //     let regex = /([%-#])/v;
  // //     const target = "%";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000197", () => {
  // //   let regex = /([&-(])/v;
  // //   const target = "&";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000198", () => {
  // //     let regex = /([(-&])/v;
  // //     const target = "&";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000199", () => {
  // //     let regex = /([)-$])/v;
  // //     const target = "&";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000200", () => {
  // //   let regex = /([$-)])/v;
  // //   const target = "&";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000201", () => {
  // //   let regex = /([^-{])/v;
  // //   const target = "}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000202", () => {
  // //     let regex = /([{-^])/v;
  // //     const target = "^";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000203", () => {
  // //   let regex = /([\^-{])/v;
  // //   const target = "^";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000204", () => {
  // //     let regex = /([{-\^])/v;
  // //     const target = "^";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000205", () => {
  // //     let regex = /([}-?])/v;
  // //     const target = "?";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000206", () => {
  // //   let regex = /([?-}])/v;
  // //   const target = "?";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000207", () => {
  // //     let regex = /([+-*])/v;
  // //     const target = "+";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000208", () => {
  //   let regex = /([*-+])/v;
  //   const target = "+";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000209", () => {
  // //   let regex = /([/-|])/v;
  // //   const target = "/";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000210", () => {
  // //     let regex = /([|-/])/v;
  // //     const target = "+";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000211", () => {
  //   let regex = /(["-'])/v;
  //   const target = '"';
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000212", () => {
  // //     let regex = /(['-"])/v;
  // //     const target = "\"";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000213", () => {
  //   let regex = /([<->])/v;
  //   const target = "<";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000214", () => {
  // //     let regex = /([>-<])/v;
  // //     const target = "<";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000215", () => {
  //   let regex = /([=-`])/v;
  //   const target = "=";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000216", () => {
  // //     let regex = /([`-=])/v;
  // //     const target = "=";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000217", () => {
  //   let regex = /([`-~])/v;
  //   const target = "~";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000218", () => {
  // //     let regex = /([~-`])/v;
  // //     const target = "~";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000219", () => {
  // //   let regex = /([[])/v;
  // //   const target = "[";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000220", () => {
  // //   let regex = /([[-b])/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000221", () => {
  // //   let regex = /([b-[])/v;
  // //   const target = "a";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000222", () => {
  // //   let regex = /([ab]a])/v;
  // //   const target = "ba]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000223", () => {
  //   let regex = /(a(b(c)d(e)f)g(hi)j)klm/v;
  //   const target = "abcdefghijklm";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000224", () => {
  //   let regex = /(?:abc)/v;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000225", () => {
  // //     let regex = /(?>abc)/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000226", () => {
  //   let regex = /(abc+)/v;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000227", () => {
  // //     let regex = /(abc++)/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000228", () => {
  //   let regex = /(abc*?)/v;
  //   const target = "abc";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000229", () => {
  // //     let regex = /(abc*??)/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000230", () => {
  // //     let regex = /(?<=ab)+/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000231", () => {
  // //     let regex = /(?<=ab)*/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000232", () => {
  // //     let regex = /(?<=ab)?/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000233", () => {
  // //     let regex = /(?<=ab){1,}/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000234", () => {
  // //     let regex = /(?<=ab){1,1}/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000235", () => {
  // //     let regex = /(?<=ab){1,3}/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000236", () => {
  // //     let regex = /(?<=ab){3,1}/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000237", () => {
  // //     let regex = /(ab(?<=ab)+)+/v;
  // //     const target = "abc";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000238", () => {
  // //   let regex = /(ab(?=ab)+)+/v;
  // //   const target = "abab";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000239", () => {
  // //   let regex = /(?=ab)+/v;
  // //   const target = "abab";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000240", () => {
  // //   let regex = /(?!ab)*/v;
  // //   const target = "abab";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000241", () => {
  // //     let regex = /(?<=ab)+/v;
  // //     const target = "abab";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000242", () => {
  // //     let regex = /(?<!ab)?/v;
  // //     const target = "abab";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000243", () => {
  //   let regex = /(?<=a+)b/v;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000244", () => {
  //   let regex = /(?<=a*)b/v;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000245", () => {
  //   let regex = /(?<=a{1,3})b/v;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000246", () => {
  //   let regex = /(?<=\w+)b/v;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000247", () => {
  //   let regex = /(?<=ab|abc)b/v;
  //   const target = "abcb";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000248", () => {
  //   let regex = /(?<=abc)b/v;
  //   const target = "abcb";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000249", () => {
  //   let regex = /(?<=\d{3})x/v;
  //   const target = "123x";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000250", () => {
  //   let regex = /(?<=ab|cd)x/v;
  //   const target = "cdx";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000251", () => {
  //   let regex = /(?:(?=ab))+/v;
  //   const target = "abab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000252", () => {
  //   let regex = /(?<=a|bc|def)g/v;
  //   const target = "defg";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000253", () => {
  //   let regex = /(?<=ab|cd)g/v;
  //   const target = "cdg";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000254", () => {
  //   let regex = /(?<=a{2,4})b/v;
  //   const target = "aab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000255", () => {
  //   let regex = /(?<=\d+)b/v;
  //   const target = "1b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000256", () => {
  //   let regex = /(?<=a*)b/v;
  //   const target = "b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000257", () => {
  //   let regex = /(?<=a{3})b/v;
  //   const target = "aaab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000258", () => {
  //   let regex = /(?<=(a+))b/v;
  //   const target = "aaab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000259", () => {
  //   let regex = /(?<=(abc))d/v;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000260", () => {
  //   let regex = /(?<=a(?<=b+))c/v;
  //   const target = "a(bb)c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups() in v mode: Case00000000000261", () => {
  //   let regex = /(?=(\1))/v;
  //   // @info: matches with anything
  //   const target = "any35}{[thin%g";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000262", () => {
  // //     let regex = /(?=(?<x>a)\k<y>)/v;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000263", () => {
  // //     let regex = /(?=(?<x>a))(?=(?<x>b))/v;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000264", () => {
  // //   let regex = /(?=\xZ)/v;
  // //   const target = "xZ";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000265", () => {
  // //   let regex = /(?<=\u123)/v;
  // //   const target = "u123";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000266", () => {
  //   let regex = /(?<=\p{Letter}+)x/v;
  //   const target = "rx";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000267", () => {
  // //   let regex = /[ (?=a) ]/v;
  // //   const target = "abcd";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000268", () => {
  // //   let regex = /(?=a)+*/v;
  // //   const target = "abcd";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000269", () => {
  // //     let regex = /(?=[z-a])/v;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000270", () => {
  // //     let regex = /(?=abcv;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000271", () => {
  // //     let regex = /(?=abcuv;
  // //     const target = "abcd";
  // //     console.log("output: ", target.match(regex));
  // //     assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000272", () => {
  //   let regex = /(?<=\1(a))b/v;
  //   const target = "1(a)b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups() in v mode: Case00000000000273", () => {
  //   let regex = /(?<=>a)b/v;
  //   const target = ">ab";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000274", () => {
  //   let regex = /(?<=a{1,3})b/v;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000275", () => {
  // //   let regex = /(?=a)+/v;
  // //   const target = "abcd";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000276", () => {
  // //   let regex = /(?=(a)\2)/v;
  // //   const target = "a\x02";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000277", () => {
  //   let regex = /(?<=\1)(a)/v;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000278", () => {
  // //   let regex = /(?<1>a)/v;
  // //   const target = "abcd";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("Groups() in v mode: Case00000000000279", () => {
  // //   let regex = /(?=\p{FakeProperty})/v;
  // //   const target = "p{FakeProperty}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000280", () => {
  //   let regex = /(?<=)a/v;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000281", () => {
  //   let regex = /(?<=a)b/v;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000282", () => {
  // //   let regex = /(?=a)+/v;
  // //   const target = "abcd";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000283", () => {
  //   let regex = /(?=(?=a))/v;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Groups() in v mode: Case00000000000284", () => {
  // //   let regex = /(?=(?=(?=a)))*/v;
  // //   const target = "abcd";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Groups() in v mode: Case00000000000285", () => {
  //   let regex = /(?: (?<=a)b )+/v;
  //   const target = " ab ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Groups() in v mode: Case00000000000286", () => {
  //   let regex = /(?<=^a)b/v;
  //   const target = "abcd";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Groups() in v mode: Case00000000000287", () => {
  //   let regex = /(?=a)(?!a)/v;
  //   const target = "aa";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("backslash or escape hell: Case0000000000001", () => {
  // //   let regex = /\/;
  // //   const target = "aa";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // // test("backslash or escape hell: Case0000000000002", () => {
  // //   let regex = /\/u;
  // //   const target = "aa";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // // test("backslash or escape hell: Case0000000000003", () => {
  // //   let regex = /\/v;
  // //   const target = "aa";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), false);
  // // });

  // test("backslash or escape hell: Case0000000000004", () => {
  //   let regex = /\\/;
  //   const target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case0000000000005", () => {
  //   let regex = /\\/u;
  //   const target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case0000000000006", () => {
  //   let regex = /\\/v;
  //   const target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case0000000000007", () => {
  // //   let regex = /\\\/;
  // //   const target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case0000000000008", () => {
  // //   let regex = /\\\/u;
  // //   const target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case0000000000009", () => {
  // //   let regex = /\\\/v;
  // //   const target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case00000000000010", () => {
  //   let regex = /\\\\/;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000011", () => {
  //   let regex = /\\\\/u;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000012", () => {
  //   let regex = /\\\\/v;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case00000000000013", () => {
  // //   let regex = /\\\\\/;
  // //   const target = "\\\\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000014", () => {
  // //   let regex = /\\\\\/u;
  // //   const target = "\\\\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000015", () => {
  // //   let regex = /\\\\\/v;
  // //   const target = "\\\\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case00000000000016", () => {
  //   let regex = /\x01/;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000017", () => {
  //   let regex = /\x01/u;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000018", () => {
  //   let regex = /\x01/v;
  //   const target = "\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000019", () => {
  //   let regex = /\\x01/;
  //   const target = "\\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000020", () => {
  //   let regex = /\\x01/u;
  //   const target = "\\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000021", () => {
  //   let regex = /\\x01/v;
  //   const target = "\\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000022", () => {
  //   let regex = /\\\x01/;
  //   const target = "\\\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000023", () => {
  //   let regex = /\\\x01/u;
  //   const target = "\\\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000024", () => {
  //   let regex = /\\\x01/v;
  //   const target = "\\\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000025", () => {
  //   let regex = /\\\\x01/;
  //   const target = "\\\\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000026", () => {
  //   let regex = /\\\\x01/u;
  //   const target = "\\\\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000027", () => {
  //   let regex = /\\\\x01/v;
  //   const target = "\\\\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000028", () => {
  //   let regex = /\\\\\x01/;
  //   const target = "\\\\\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000029", () => {
  //   let regex = /\\\\\x01/u;
  //   const target = "\\\\\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000030", () => {
  //   let regex = /\\\\\x01/v;
  //   const target = "\\\\\x01";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000031", () => {
  //   let regex = /\u12/;
  //   const target = "\\u12";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case00000000000032", () => {
  // //   let regex = /\u12/u;
  // //   const target = "\\u12";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000033", () => {
  // //   let regex = /\u12/v;
  // //   const target = "\\u12";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case00000000000034", () => {
  //   let regex = /\\u12/;
  //   const target = "\\u12";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000035", () => {
  //   let regex = /\\u12/u;
  //   const target = "\\u12";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000036", () => {
  //   let regex = /\\u12/v;
  //   const target = "\\u12";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000037", () => {
  //   let regex = /\\\u12/;
  //   const target = "\\\\u12";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case00000000000038", () => {
  // //   let regex = /\\\u12/u;
  // //   const target = "\\\\u12";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000039", () => {
  // //   let regex = /\\\u12/v;
  // //   const target = "\\\\u12";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case00000000000040", () => {
  //   let regex = /\\\\u12/;
  //   const target = "\\\\u12";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000041", () => {
  //   let regex = /\\\\u12/u;
  //   const target = "\\\\u12";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000042", () => {
  //   let regex = /\\\\u12/v;
  //   const target = "\\\\u12";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000043", () => {
  //   let regex = /\\\\\u12/;
  //   const target = "\\\\\\u12";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case00000000000044", () => {
  // //   let regex = /\\\\\u12/u;
  // //   const target = "\\\\\\u12";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000045", () => {
  // //   let regex = /\\\\\u12/v;
  // //   const target = "\\\\\\u12";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case00000000000046", () => {
  //   let regex = /\u{12}/;
  //   const target = "uuuuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000047", () => {
  //   let regex = /\u{12}/u;
  //   const target = "\u{12}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000048", () => {
  //   let regex = /\u{12}/v;
  //   const target = "\u{12}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000049", () => {
  //   let regex = /\\u{12}/;
  //   const target = "\\uuuuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000050", () => {
  //   let regex = /\\u{12}/u;
  //   const target = "\\uuuuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000051", () => {
  //   let regex = /\\u{12}/v;
  //   const target = "\\uuuuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000052", () => {
  //   let regex = /\\\u{12}/;
  //   const target = "\\uuuuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000053", () => {
  //   let regex = /\\\u{12}/u;
  //   const target = "\\\u{12}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000054", () => {
  //   let regex = /\\\u{12}/v;
  //   const target = "\\\u{12}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000055", () => {
  //   let regex = /\\\\u{12}/;
  //   const target = "\\\\uuuuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000056", () => {
  //   let regex = /\\\\u{12}/u;
  //   const target = "\\\\uuuuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000057", () => {
  //   let regex = /\\\\u{12}/v;
  //   const target = "\\\\uuuuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000058", () => {
  //   let regex = /\\\\\u{12}/;
  //   const target = "\\\\uuuuuuuuuuuu";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000059", () => {
  //   let regex = /\\\\\u{12}/u;
  //   const target = "\\\\\u{12}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000060", () => {
  //   let regex = /\\\\\u{12}/v;
  //   const target = "\\\\\u{12}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000061", () => {
  //   let regex = /\k/;
  //   const target = "k";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case00000000000062", () => {
  // //   let regex = /\k/u;
  // //   const target = "\k";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000063", () => {
  // //   let regex = /\k/v;
  // //   const target = "\k";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case00000000000064", () => {
  //   let regex = /\\k/;
  //   const target = "\\k";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000065", () => {
  //   let regex = /\\k/u;
  //   const target = "\\k";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000066", () => {
  //   let regex = /\\k/v;
  //   const target = "\\k";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000067", () => {
  //   let regex = /\\\k/;
  //   const target = "\\k";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case00000000000068", () => {
  // //   let regex = /\\\k/u;
  // //   const target = "\\\k";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000069", () => {
  // //   let regex = /\\\k/v;
  // //   const target = "\\\k";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case00000000000070", () => {
  //   let regex = /\\\\k/;
  //   const target = "\\\\k";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000071", () => {
  //   let regex = /\\\\k/u;
  //   const target = "\\\\k";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000072", () => {
  //   let regex = /\\\\k/v;
  //   const target = "\\\\k";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000073", () => {
  //   let regex = /\\\\\k/;
  //   const target = "\\\\k";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case00000000000074", () => {
  // //   let regex = /\\\\\k/u;
  // //   const target = "\\\\\k";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000075", () => {
  // //   let regex = /\\\\\k/v;
  // //   const target = "\\\\\k";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case00000000000076", () => {
  //   let regex = /\p/;
  //   const target = "p";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case00000000000077", () => {
  // //   let regex = /\p/u;
  // //   const target = "\p";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000078", () => {
  // //   let regex = /\p/v;
  // //   const target = "\p";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case00000000000079", () => {
  //   let regex = /\\p/;
  //   const target = "\\p";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000080", () => {
  //   let regex = /\\p/u;
  //   const target = "\\p";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000081", () => {
  //   let regex = /\\p/v;
  //   const target = "\\p";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000082", () => {
  //   let regex = /\\\p/;
  //   const target = "\\p";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case00000000000083", () => {
  // //   let regex = /\\\p/u;
  // //   const target = "\\\p";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000084", () => {
  // //   let regex = /\\\p/v;
  // //   const target = "\\\p";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case00000000000085", () => {
  //   let regex = /\\\\p/;
  //   const target = "\\\\p";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000086", () => {
  //   let regex = /\\\\p/u;
  //   const target = "\\\\p";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000087", () => {
  //   let regex = /\\\\p/v;
  //   const target = "\\\\p";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000088", () => {
  //   let regex = /\\\\\p/;
  //   const target = "\\\\p";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case00000000000089", () => {
  // //   let regex = /\\\\\p/u;
  // //   const target = "\\\\\p";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000090", () => {
  // //   let regex = /\\\\\p/v;
  // //   const target = "\\\\\p";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case00000000000091", () => {
  //   let regex = /\P/;
  //   const target = "P";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case00000000000092", () => {
  // //   let regex = /\P/u;
  // //   const target = "\P";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000093", () => {
  // //   let regex = /\P/v;
  // //   const target = "\P";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case00000000000094", () => {
  //   let regex = /\\P/;
  //   const target = "\\P";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000095", () => {
  //   let regex = /\\P/u;
  //   const target = "\\P";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000096", () => {
  //   let regex = /\\P/v;
  //   const target = "\\P";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case00000000000097", () => {
  //   let regex = /\\\P/;
  //   const target = "\\P";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case00000000000098", () => {
  // //   let regex = /\\\P/u;
  // //   const target = "\\\P";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case00000000000099", () => {
  // //   let regex = /\\\P/v;
  // //   const target = "\\\P";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case000000000000100", () => {
  //   let regex = /\\\\P/;
  //   const target = "\\\\P";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000101", () => {
  //   let regex = /\\\\P/u;
  //   const target = "\\\\P";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000102", () => {
  //   let regex = /\\\\P/v;
  //   const target = "\\\\P";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000103", () => {
  //   let regex = /\\\\\P/;
  //   const target = "\\\\P";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell: Case000000000000104", () => {
  // //   let regex = /\\\\\P/u;
  // //   const target = "\\\\\P";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case000000000000105", () => {
  // //   let regex = /\\\\\P/v;
  // //   const target = "\\\\\P";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case000000000000106", () => {
  //   let regex = /\c/;
  //   const target = "c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("backslash or escape hell: Case000000000000107", () => {
  // //   let regex = /\c/u;
  // //   const target = "\c";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case000000000000108", () => {
  // //   let regex = /\c/v;
  // //   const target = "\c";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case000000000000109", () => {
  //   let regex = /\\c/;
  //   const target = "\\c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000110", () => {
  //   let regex = /\\c/u;
  //   const target = "\\c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000111", () => {
  //   let regex = /\\c/v;
  //   const target = "\\c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000112", () => {
  //   let regex = /\\\c/;
  //   const target = "\\c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("backslash or escape hell: Case000000000000113", () => {
  // //   let regex = /\\\c/u;
  // //   const target = "\\\c";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case000000000000114", () => {
  // //   let regex = /\\\c/v;
  // //   const target = "\\\c";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case000000000000115", () => {
  //   let regex = /\\\\c/;
  //   const target = "\\\\c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000116", () => {
  //   let regex = /\\\\c/u;
  //   const target = "\\\\c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000117", () => {
  //   let regex = /\\\\c/v;
  //   const target = "\\\\c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000118", () => {
  //   let regex = /\\\\\c/;
  //   const target = "\\\\c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("backslash or escape hell: Case000000000000119", () => {
  // //   let regex = /\\\\\c/u;
  // //   const target = "\\\\\c";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell: Case000000000000120", () => {
  // //   let regex = /\\\\\c/v;
  // //   const target = "\\\\\c";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell: Case000000000000121", () => {
  //   let regex = /\b/;
  //   const target = "c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000122", () => {
  //   let regex = /\b/u;
  //   const target = "'a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000123", () => {
  //   let regex = /\b/v;
  //   const target = "}b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000124", () => {
  //   let regex = /\\b/;
  //   const target = "\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000125", () => {
  //   let regex = /\\b/u;
  //   const target = "\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000126", () => {
  //   let regex = /\\b/v;
  //   const target = "\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000127", () => {
  //   let regex = /\\\b/;
  //   const target = "\\/b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("backslash or escape hell: Case000000000000128", () => {
  //   let regex = /\\\b/u;
  //   const target = "\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000129", () => {
  //   let regex = /\\\b/v;
  //   const target = "\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000130", () => {
  //   let regex = /\\\\b/;
  //   const target = "\\\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000131", () => {
  //   let regex = /\\\\b/u;
  //   const target = "\\\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000132", () => {
  //   let regex = /\\\\b/v;
  //   const target = "\\\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000133", () => {
  //   let regex = /\\\\\b/;
  //   const target = "\\\\/b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("backslash or escape hell: Case000000000000134", () => {
  //   let regex = /\\\\\b/u;
  //   const target = "\\\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000135", () => {
  //   let regex = /\\\\\b/v;
  //   const target = "\\\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000136", () => {
  //   let regex = /\d/;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000137", () => {
  //   let regex = /\d/u;
  //   const target = "'1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000138", () => {
  //   let regex = /\d/v;
  //   const target = "1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000139", () => {
  //   let regex = /\\d/;
  //   const target = "\\d";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000140", () => {
  //   let regex = /\\d/u;
  //   const target = "\\d";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000141", () => {
  //   let regex = /\\d/v;
  //   const target = "\\d";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000142", () => {
  //   let regex = /\\\d/;
  //   const target = "\\d";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("backslash or escape hell: Case000000000000143", () => {
  //   let regex = /\\\d/u;
  //   const target = "\\1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000144", () => {
  //   let regex = /\\\d/v;
  //   const target = "\\1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000145", () => {
  //   let regex = /\\\\d/;
  //   const target = "\\\\d";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000146", () => {
  //   let regex = /\\\\d/u;
  //   const target = "\\\\d";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000147", () => {
  //   let regex = /\\\\d/v;
  //   const target = "\\\\d";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000148", () => {
  //   let regex = /\\\\\d/;
  //   const target = "\\\\d";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("backslash or escape hell: Case000000000000149", () => {
  //   let regex = /\\\\\d/u;
  //   const target = "\\\\1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000150", () => {
  //   let regex = /\\\\\d/v;
  //   const target = "\\\\1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000151", () => {
  //   let regex = /\f/;
  //   const target = "\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000152", () => {
  //   let regex = /\f/u;
  //   const target = "\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000153", () => {
  //   let regex = /\f/v;
  //   const target = "\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000154", () => {
  //   let regex = /\\f/;
  //   const target = "\\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000155", () => {
  //   let regex = /\\f/u;
  //   const target = "\\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000156", () => {
  //   let regex = /\\f/v;
  //   const target = "\\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000157", () => {
  //   let regex = /\\\f/;
  //   const target = "\\\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000158", () => {
  //   let regex = /\\\f/u;
  //   const target = "\\\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000159", () => {
  //   let regex = /\\\f/v;
  //   const target = "\\\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000160", () => {
  //   let regex = /\\\\f/;
  //   const target = "\\\\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000161", () => {
  //   let regex = /\\\\f/u;
  //   const target = "\\\\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000162", () => {
  //   let regex = /\\\\f/v;
  //   const target = "\\\\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000163", () => {
  //   let regex = /\\\\\f/;
  //   const target = "\\\\\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000164", () => {
  //   let regex = /\\\\\f/u;
  //   const target = "\\\\\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000165", () => {
  //   let regex = /\\\\\f/v;
  //   const target = "\\\\\f";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000166", () => {
  //   let regex = /\n/;
  //   const target = "\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000167", () => {
  //   let regex = /\n/u;
  //   const target = "\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000168", () => {
  //   let regex = /\n/v;
  //   const target = "\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000169", () => {
  //   let regex = /\\n/;
  //   const target = "\\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000170", () => {
  //   let regex = /\\n/u;
  //   const target = "\\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000171", () => {
  //   let regex = /\\n/v;
  //   const target = "\\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000172", () => {
  //   let regex = /\\\n/;
  //   const target = "\\\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000173", () => {
  //   let regex = /\\\n/u;
  //   const target = "\\\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000174", () => {
  //   let regex = /\\\n/v;
  //   const target = "\\\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000175", () => {
  //   let regex = /\\\\n/;
  //   const target = "\\\\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000176", () => {
  //   let regex = /\\\\n/u;
  //   const target = "\\\\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000177", () => {
  //   let regex = /\\\\n/v;
  //   const target = "\\\\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000178", () => {
  //   let regex = /\\\\\n/;
  //   const target = "\\\\\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000179", () => {
  //   let regex = /\\\\\n/u;
  //   const target = "\\\\\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000180", () => {
  //   let regex = /\\\\\n/v;
  //   const target = "\\\\\n";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000181", () => {
  //   let regex = /\r/;
  //   const target = "\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000182", () => {
  //   let regex = /\r/u;
  //   const target = "\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000183", () => {
  //   let regex = /\r/v;
  //   const target = "\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000184", () => {
  //   let regex = /\\r/;
  //   const target = "\\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000185", () => {
  //   let regex = /\\r/u;
  //   const target = "\\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000186", () => {
  //   let regex = /\\r/v;
  //   const target = "\\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000187", () => {
  //   let regex = /\\\r/;
  //   const target = "\\\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000188", () => {
  //   let regex = /\\\r/u;
  //   const target = "\\\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000189", () => {
  //   let regex = /\\\r/v;
  //   const target = "\\\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000190", () => {
  //   let regex = /\\\\r/;
  //   const target = "\\\\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000191", () => {
  //   let regex = /\\\\r/u;
  //   const target = "\\\\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000192", () => {
  //   let regex = /\\\\r/v;
  //   const target = "\\\\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000193", () => {
  //   let regex = /\\\\\r/;
  //   const target = "\\\\\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000194", () => {
  //   let regex = /\\\\\r/u;
  //   const target = "\\\\\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000195", () => {
  //   let regex = /\\\\\r/v;
  //   const target = "\\\\\r";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000196", () => {
  //   let regex = /\s/;
  //   const target = " ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000197", () => {
  //   let regex = /\s/u;
  //   const target = " ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000198", () => {
  //   let regex = /\s/v;
  //   const target = " ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000199", () => {
  //   let regex = /\\s/;
  //   const target = "\\s";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000200", () => {
  //   let regex = /\\s/u;
  //   const target = "\\s";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000201", () => {
  //   let regex = /\\s/v;
  //   const target = "\\s";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000202", () => {
  //   let regex = /\\\s/;
  //   const target = "\\ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000203", () => {
  //   let regex = /\\\s/u;
  //   const target = "\\ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000204", () => {
  //   let regex = /\\\s/v;
  //   const target = "\\ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000205", () => {
  //   let regex = /\\\\s/;
  //   const target = "\\\\s";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000206", () => {
  //   let regex = /\\\\s/u;
  //   const target = "\\\\s";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000207", () => {
  //   let regex = /\\\\s/v;
  //   const target = "\\\\s";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000208", () => {
  //   let regex = /\\\\\s/;
  //   const target = "\\\\ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000209", () => {
  //   let regex = /\\\\\s/u;
  //   const target = "\\\\ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000210", () => {
  //   let regex = /\\\\\s/v;
  //   const target = "\\\\ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000211", () => {
  //   let regex = /\t/;
  //   const target = "\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000212", () => {
  //   let regex = /\t/u;
  //   const target = "\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000213", () => {
  //   let regex = /\t/v;
  //   const target = "\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000214", () => {
  //   let regex = /\\t/;
  //   const target = "\\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000215", () => {
  //   let regex = /\\t/u;
  //   const target = "\\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000216", () => {
  //   let regex = /\\t/v;
  //   const target = "\\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000217", () => {
  //   let regex = /\\\t/;
  //   const target = "\\\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000218", () => {
  //   let regex = /\\\t/u;
  //   const target = "\\\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000219", () => {
  //   let regex = /\\\t/v;
  //   const target = "\\\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000220", () => {
  //   let regex = /\\\\t/;
  //   const target = "\\\\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000221", () => {
  //   let regex = /\\\\t/u;
  //   const target = "\\\\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000222", () => {
  //   let regex = /\\\\t/v;
  //   const target = "\\\\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000223", () => {
  //   let regex = /\\\\\t/;
  //   const target = "\\\\\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000224", () => {
  //   let regex = /\\\\\t/u;
  //   const target = "\\\\\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000225", () => {
  //   let regex = /\\\\\t/v;
  //   const target = "\\\\\t";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000226", () => {
  //   let regex = /\v/;
  //   const target = "\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000227", () => {
  //   let regex = /\v/u;
  //   const target = "\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000228", () => {
  //   let regex = /\v/v;
  //   const target = "\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000229", () => {
  //   let regex = /\\v/;
  //   const target = "\\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000230", () => {
  //   let regex = /\\v/u;
  //   const target = "\\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000231", () => {
  //   let regex = /\\v/v;
  //   const target = "\\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000232", () => {
  //   let regex = /\\\v/;
  //   const target = "\\\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000233", () => {
  //   let regex = /\\\v/u;
  //   const target = "\\\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000234", () => {
  //   let regex = /\\\v/v;
  //   const target = "\\\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000235", () => {
  //   let regex = /\\\\v/;
  //   const target = "\\\\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000236", () => {
  //   let regex = /\\\\v/u;
  //   const target = "\\\\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000237", () => {
  //   let regex = /\\\\v/v;
  //   const target = "\\\\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000238", () => {
  //   let regex = /\\\\\v/;
  //   const target = "\\\\\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000239", () => {
  //   let regex = /\\\\\v/u;
  //   const target = "\\\\\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000240", () => {
  //   let regex = /\\\\\v/v;
  //   const target = "\\\\\v";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000241", () => {
  //   let regex = /\w/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000242", () => {
  //   let regex = /\w/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000243", () => {
  //   let regex = /\w/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000244", () => {
  //   let regex = /\\w/;
  //   const target = "\\w";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000245", () => {
  //   let regex = /\\w/u;
  //   const target = "\\w";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000246", () => {
  //   let regex = /\\w/v;
  //   const target = "\\w";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000247", () => {
  //   let regex = /\\\w/;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000248", () => {
  //   let regex = /\\\w/u;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000249", () => {
  //   let regex = /\\\w/v;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000250", () => {
  //   let regex = /\\\\w/;
  //   const target = "\\\\w";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000251", () => {
  //   let regex = /\\\\w/u;
  //   const target = "\\\\w";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000252", () => {
  //   let regex = /\\\\w/v;
  //   const target = "\\\\w";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000253", () => {
  //   let regex = /\\\\\w/;
  //   const target = "\\\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000254", () => {
  //   let regex = /\\\\\w/u;
  //   const target = "\\\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000255", () => {
  //   let regex = /\\\\\w/v;
  //   const target = "\\\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000256", () => {
  //   let regex = /\D/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000257", () => {
  //   let regex = /\D/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000258", () => {
  //   let regex = /\D/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000259", () => {
  //   let regex = /\\D/;
  //   const target = "\\D";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000260", () => {
  //   let regex = /\\D/u;
  //   const target = "\\D";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000261", () => {
  //   let regex = /\\D/v;
  //   const target = "\\D";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000262", () => {
  //   let regex = /\\\D/;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000263", () => {
  //   let regex = /\\\D/u;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000264", () => {
  //   let regex = /\\\D/v;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000265", () => {
  //   let regex = /\\\\D/;
  //   const target = "\\\\D";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000266", () => {
  //   let regex = /\\\\D/u;
  //   const target = "\\\\D";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000267", () => {
  //   let regex = /\\\\D/v;
  //   const target = "\\\\D";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000268", () => {
  //   let regex = /\\\\\D/;
  //   const target = "\\\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000269", () => {
  //   let regex = /\\\\\D/u;
  //   const target = "\\\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000270", () => {
  //   let regex = /\\\\\D/v;
  //   const target = "\\\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000271", () => {
  //   let regex = /\S/;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000272", () => {
  //   let regex = /\S/u;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000273", () => {
  //   let regex = /\S/v;
  //   const target = "a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000274", () => {
  //   let regex = /\\S/;
  //   const target = "\\S";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000275", () => {
  //   let regex = /\\S/u;
  //   const target = "\\S";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000276", () => {
  //   let regex = /\\S/v;
  //   const target = "\\S";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000277", () => {
  //   let regex = /\\\S/;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000278", () => {
  //   let regex = /\\\S/u;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000279", () => {
  //   let regex = /\\\S/v;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000280", () => {
  //   let regex = /\\\\S/;
  //   const target = "\\\\S";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000281", () => {
  //   let regex = /\\\\S/u;
  //   const target = "\\\\S";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000282", () => {
  //   let regex = /\\\\S/v;
  //   const target = "\\\\S";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000283", () => {
  //   let regex = /\\\\\S/;
  //   const target = "\\\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000284", () => {
  //   let regex = /\\\\\S/u;
  //   const target = "\\\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000285", () => {
  //   let regex = /\\\\\S/v;
  //   const target = "\\\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000286", () => {
  //   let regex = /\W/;
  //   const target = " ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000287", () => {
  //   let regex = /\W/u;
  //   const target = " ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000288", () => {
  //   let regex = /\W/v;
  //   const target = " ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000289", () => {
  //   let regex = /\\W/;
  //   const target = "\\W";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000290", () => {
  //   let regex = /\\W/u;
  //   const target = "\\W";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000291", () => {
  //   let regex = /\\W/v;
  //   const target = "\\W";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000292", () => {
  //   let regex = /\\\W/;
  //   const target = "\\ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000293", () => {
  //   let regex = /\\\W/u;
  //   const target = "\\ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000294", () => {
  //   let regex = /\\\W/v;
  //   const target = "\\ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000295", () => {
  //   let regex = /\\\\W/;
  //   const target = "\\\\W";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000296", () => {
  //   let regex = /\\\\W/u;
  //   const target = "\\\\W";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000297", () => {
  //   let regex = /\\\\W/v;
  //   const target = "\\\\W";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000298", () => {
  //   let regex = /\\\\\W/;
  //   const target = "\\\\ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000299", () => {
  //   let regex = /\\\\\W/u;
  //   const target = "\\\\ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell: Case000000000000300", () => {
  //   let regex = /\\\\\W/v;
  //   const target = "\\\\ ";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case00000000000001", () => {
  //   let regex = /\\08/;
  //   const target = "\\08";
  //   console.log("outputDigit: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case00000000000002", () => {
  //   let regex = /\\08/u;
  //   const target = "\\08";
  //   console.log("outputDigit: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case00000000000003", () => {
  //   let regex = /\\08/v;
  //   const target = "\\08";
  //   console.log("outputDigit: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case00000000000004", () => {
  //   let regex = /\\107/;
  //   const target = "\\107";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case00000000000005", () => {
  //   let regex = /\\107/u;
  //   const target = "\\107";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case00000000000006", () => {
  //   let regex = /\\107/v;
  //   const target = "\\107";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case00000000000007", () => {
  //   let regex = /\\377/;
  //   const target = "\\377";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case00000000000008", () => {
  //   let regex = /\\377/u;
  //   const target = "\\377";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case00000000000009", () => {
  //   let regex = /\\400/v;
  //   const target = "\\400";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000010", () => {
  //   let regex = /\\777/;
  //   const target = "\\777";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000011", () => {
  //   let regex = /\\777/u;
  //   const target = "\\777";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000012", () => {
  //   let regex = /\\777/v;
  //   const target = "\\777";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000013", () => {
  //   let regex = /\\378/;
  //   const target = "\\378";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000014", () => {
  //   let regex = /\\378/u;
  //   const target = "\\378";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000015", () => {
  //   let regex = /\\378/v;
  //   const target = "\\378";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000016", () => {
  //   let regex = /\\397/;
  //   const target = "\\397";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000017", () => {
  //   let regex = /\\397/u;
  //   const target = "\\397";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000018", () => {
  //   let regex = /\\397/v;
  //   const target = "\\397";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000019", () => {
  //   let regex = /\\a/;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000020", () => {
  //   let regex = /\\a/u;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000021", () => {
  //   let regex = /\\a/v;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000022", () => {
  //   let regex = /\\0/;
  //   const target = "\\0";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000023", () => {
  //   let regex = /\\0/u;
  //   const target = "\\0";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000024", () => {
  //   let regex = /\\0/v;
  //   const target = "\\0";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000025", () => {
  //   let regex = /\\00/;
  //   const target = "\\00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000026", () => {
  //   let regex = /\\00/u;
  //   const target = "\\00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000027", () => {
  //   let regex = /\\00/v;
  //   const target = "\\00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000028", () => {
  //   let regex = /\\000/;
  //   const target = "\\000";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000029", () => {
  //   let regex = /\\000/u;
  //   const target = "\\000";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000030", () => {
  //   let regex = /\\000/v;
  //   const target = "\\000";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000031", () => {
  //   let regex = /\\u{1F600}/;
  //   const target = "\\u{1F600}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part2: Case000000000000032", () => {
  // //   let regex = /\\u{1F600}/u;
  // //   const target = "\\u{1F600}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part2: Case000000000000033", () => {
  // //   let regex = /\\u{1F600}/v;
  // //   const target = "\\u{1F600}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part2: Case000000000000034", () => {
  //   let regex = /\\k<a>/;
  //   const target = "\\k<a>";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000035", () => {
  //   let regex = /\\k<a>/u;
  //   const target = "\\k<a>";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000036", () => {
  //   let regex = /\\k<a>/v;
  //   const target = "\\k<a>";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part2: Case000000000000037", () => {
  //   let regex = /\\p{L}/;
  //   const target = "\\p{L}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part2: Case000000000000038", () => {
  // //   let regex = /\\p{L}/u;
  // //   const target = "\\p{L}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part2: Case000000000000039", () => {
  // //   let regex = /\\p{L}/v;
  // //   const target = "\\p{L}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part2: Case000000000000040", () => {
  //   let regex = /\\p{XYZ}/;
  //   const target = "\\p{XYZ}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part2: Case000000000000041", () => {
  // //   let regex = /\\p{XYZ}/u;
  // //   const target = "\\p{XYZ}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part2: Case000000000000042", () => {
  // //   let regex = /\\p{XYZ}/v;
  // //   const target = "\\p{XYZ}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part2: Case000000000000043", () => {
  //   let regex = /\\p{}/;
  //   const target = "\\p{}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part2: Case000000000000044", () => {
  // //   let regex = /\\p{}/u;
  // //   const target = "\\p{}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part2: Case000000000000045", () => {
  // //   let regex = /\\p{}/v;
  // //   const target = "\\p{}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part2: Case000000000000046", () => {
  //   let regex = /\\p{=LETTER}/;
  //   const target = "\\p{=LETTER}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part2: Case000000000000047", () => {
  // //   let regex = /\\p{=LETTER}/u;
  // //   const target = "\\p{=LETTER}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part2: Case000000000000048", () => {
  // //   let regex = /\\p{=LETTER}/v;
  // //   const target = "\\p{=LETTER}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part2: Case000000000000049", () => {
  //   let regex = /\\p{g=LETTER}/;
  //   const target = "\\p{g=LETTER}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part2: Case000000000000050", () => {
  // //   let regex = /\\p{g=LETTER}/u;
  // //   const target = "\\p{g=LETTER}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part2: Case000000000000051", () => {
  // //   let regex = /\\p{g=LETTER}/v;
  // //   const target = "\\p{g=LETTER}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part2: Case000000000000052", () => {
  //   let regex = /\\p{gc=Letter}/;
  //   const target = "\\p{gc=Letter}";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part2: Case000000000000053", () => {
  // //   let regex = /\\p{gc=Letter}/u;
  // //   const target = "\\p{gc=Letter}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part2: Case000000000000054", () => {
  // //   let regex = /\\p{gc=Letter}/v;
  // //   const target = "\\p{gc=Letter}";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case00000000000001", () => {
  //   let regex = /\[]/;
  //   const target = "[]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // Lone quantifier bracket
  // // test("backslash or escape hell part3: Case00000000000002", () => {
  // //   let regex = /\[]/u;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // Lone quantifier bracket
  // // test("backslash or escape hell part3: Case00000000000003", () => {
  // //   let regex = /\[]/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case00000000000004", () => {
  //   let regex = /\\[]/;
  //   const target = "\\[]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("backslash or escape hell part3: Case00000000000005", () => {
  //   let regex = /\\[]/u;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("backslash or escape hell part3: Case00000000000006", () => {
  //   let regex = /\\[]/v;
  //   const target = "\x00";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("backslash or escape hell part3: Case00000000000007", () => {
  //   let regex = /\\\[]/;
  //   const target = "\\[]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // Lone quantifier brackets
  // // test("backslash or escape hell part3: Case00000000000008", () => {
  // //   let regex = /\\\[]/u;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // Lone quantifier brackets
  // // test("backslash or escape hell part3: Case00000000000009", () => {
  // //   let regex = /\\\[]/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000010", () => {
  //   let regex = /\\\\[]/;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("backslash or escape hell part3: Case000000000000011", () => {
  //   let regex = /\\\\[]/u;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("backslash or escape hell part3: Case000000000000012", () => {
  //   let regex = /\\\\[]/v;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("backslash or escape hell part3: Case000000000000013", () => {
  //   let regex = /\\\\\[]/;
  //   const target = "\\\\\[]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // Lone quantifier brackets
  // // test("backslash or escape hell part3: Case000000000000014", () => {
  // //   let regex = /\\\\\[]/u;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // Lone quantifier brackets
  // // test("backslash or escape hell part3: Case000000000000015", () => {
  // //   let regex = /\\\\\[]/v;
  // //   const target = "\x00";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000016", () => {
  //   let regex = /\[\]/;
  //   const target = "[]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000017", () => {
  //   let regex = /\[\]/u;
  //   const target = "[]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000018", () => {
  //   let regex = /\[\]/v;
  //   const target = "[]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000019", () => {
  //   let regex = /\\[\\]/;
  //   const target = "\\[\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("backslash or escape hell part3: Case000000000000020", () => {
  //   let regex = /\\[\\]/u;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000021", () => {
  //   let regex = /\\[\\]/v;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000022", () => {
  //   let regex = /\\\[\\\]/;
  //   const target = "\\[\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000023", () => {
  //   let regex = /\\\[\\\]/u;
  //   const target = "\\[\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000024", () => {
  //   let regex = /\\\[\\\]/v;
  //   const target = "\\[\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000025", () => {
  //   let regex = /\\\\[\\\\]/;
  //   const target = "\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000026", () => {
  //   let regex = /\\\\[\\\\]/u;
  //   const target = "\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000027", () => {
  //   let regex = /\\\\[\\\\]/v;
  //   const target = "\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000028", () => {
  //   let regex = /\\\\\[\\\\\]/;
  //   const target = "\\\\[\\\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000029", () => {
  //   let regex = /\\\\\[\\\\\]/u;
  //   const target = "\\\\[\\\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000030", () => {
  //   let regex = /\\\\\[\\\\\]/v;
  //   const target = "\\\\[\\\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000031", () => {
  //   let regex = /\[\.\]/;
  //   const target = "[.]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000032", () => {
  //   let regex = /\[\.\]/u;
  //   const target = "[.]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000033", () => {
  //   let regex = /\[\.\]/v;
  //   const target = "[.]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000034", () => {
  //   let regex = /\\[\\.\\]/;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000035", () => {
  //   let regex = /\\[\\.\\]/u;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000036", () => {
  //   let regex = /\\[\\.\\]/v;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000037", () => {
  //   let regex = /\\\[\\\.\\\]/;
  //   const target = "\\[\\.\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000038", () => {
  //   let regex = /\\\[\\\.\\\]/u;
  //   const target = "\\[\\.\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000039", () => {
  //   let regex = /\\\[\\\.\\\]/v;
  //   const target = "\\[\\.\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000040", () => {
  //   let regex = /\\\\[\\\\.\\\\]/;
  //   const target = "\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000041", () => {
  //   let regex = /\\\\[\\\\.\\\\]/u;
  //   const target = "\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000042", () => {
  //   let regex = /\\\\[\\\\.\\\\]/v;
  //   const target = "\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000043", () => {
  //   let regex = /\\\\\[\\\\\.\\\\\]/;
  //   const target = "\\\\[\\\\.\\\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000044", () => {
  //   let regex = /\\\\\[\\\\\.\\\\\]/u;
  //   const target = "\\\\[\\\\.\\\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000045", () => {
  //   let regex = /\\\\\[\\\\\.\\\\\]/v;
  //   const target = "\\\\[\\\\.\\\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000046", () => {
  //   let regex = /\[\a\b\c\1\2\3\_\,\:\;\!\@\#\%\&\$\^\?\+\*\"\'\<\>\=\`\~\ \]/;
  //   const target = "[a;c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("backslash or escape hell part3: Case000000000000047", () => {
  // //   let regex = /\[\a\b\c\1\2\3\_\,\:\;\!\@\#\%\&\$\^\?\+\*\"\'\<\>\=\`\~\ \]/u;
  // //   const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part3: Case000000000000048", () => {
  // //   let regex = /\[\a\b\c\1\2\3\_\,\:\;\!\@\#\%\&\$\^\?\+\*\"\'\<\>\=\`\~\ \]/v;
  // //   const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000049", () => {
  //   let regex =
  //     /\\[\\a\\b\\c\\1\\2\\3\\_\\,\\:\\;\\!\\@\\#\\%\\&\\$\\^\\?\\+\\*\\"\\'\\<\\>\\=\\`\\~\\ \\]/;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000050", () => {
  //   let regex =
  //     /\\[\\a\\b\\c\\1\\2\\3\\_\\,\\:\\;\\!\\@\\#\\%\\&\\$\\^\\?\\+\\*\\"\\'\\<\\>\\=\\`\\~\\ \\]/u;
  //   const target = "\\1";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000051", () => {
  //   let regex =
  //     /\\[\\a\\b\\c\\1\\2\\3\\_\\,\\:\\;\\!\\@\\#\\%\\&\\$\\^\\?\\+\\*\\"\\'\\<\\>\\=\\`\\~\\ \\]/v;
  //   const target = "\\@";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000052", () => {
  //   let regex =
  //     /\\\[\\\a\\\b\\\c\\\1\\\2\\\3\\\_\\\,\\\:\\\;\\\!\\\@\\\#\\\%\\\&\\\$\\\^\\\?\\\+\\\*\\\"\\\'\\\<\\\>\\\=\\\`\\\~\\\ \\\]/;
  //   const target =
  //     "\\[\\a\\b\\c\\1\\2\\3\\_\\,\\:\\;\\!\\@\\#\\%\\&\\$\\^\\?\\+\\*\\\"\\'\\<\\>\\=\\`\\~\\ \\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("backslash or escape hell part3: Case000000000000053", () => {
  // //   let regex =
  // //     /\\\[\\\a\\\b\\\c\\\1\\\2\\\3\\\_\\\,\\\:\\\;\\\!\\\@\\\#\\\%\\\&\\\$\\\^\\\?\\\+\\\*\\\"\\\'\\\<\\\>\\\=\\\`\\\~\\\ \\\]/u;
  // //   const target =
  // //     "\\[\\a\\b\\c\\1\\2\\3\\_\\,\\:\\;\\!\\@\\#\\%\\&\\$\\^\\?\\+\\*\\\"\\'\\<\\>\\=\\`\\~\\ \\]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part3: Case000000000000054", () => {
  // //   let regex =
  // //     /\\\[\\\a\\\b\\\c\\\1\\\2\\\3\\\_\\\,\\\:\\\;\\\!\\\@\\\#\\\%\\\&\\\$\\\^\\\?\\\+\\\*\\\"\\\'\\\<\\\>\\\=\\\`\\\~\\\ \\\]/v;
  // //   const target =
  // //     "\\[\\a\\b\\c\\1\\2\\3\\_\\,\\:\\;\\!\\@\\#\\%\\&\\$\\^\\?\\+\\*\\\"\\'\\<\\>\\=\\`\\~\\ \\]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000055", () => {
  //   let regex =
  //     /\\\\[\\\\a\\\\b\\\\c\\\\1\\\\2\\\\3\\\\_\\\\,\\\\:\\\\;\\\\!\\\\@\\\\#\\\\%\\\\&\\\\$\\\\^\\\\?\\\\+\\\\*\\\\"\\\\'\\\\<\\\\>\\\\=\\\\`\\\\~\\\\ \\\\]/;
  //   const target = "[a;c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("backslash or escape hell part3: Case000000000000056", () => {
  //   let regex =
  //     /\\\\[\\\\a\\\\b\\\\c\\\\1\\\\2\\\\3\\\\_\\\\,\\\\:\\\\;\\\\!\\\\@\\\\#\\\\%\\\\&\\\\$\\\\^\\\\?\\\\+\\\\*\\\\"\\\\'\\\\<\\\\>\\\\=\\\\`\\\\~\\\\ \\\\]/u;
  //   const target = "\\\\$";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000057", () => {
  //   let regex =
  //     /\\\\[\\\\a\\\\b\\\\c\\\\1\\\\2\\\\3\\\\_\\\\,\\\\:\\\\;\\\\!\\\\@\\\\#\\\\%\\\\&\\\\$\\\\^\\\\?\\\\+\\\\*\\\\"\\\\'\\\\<\\\\>\\\\=\\\\`\\\\~\\\\ \\\\]/v;
  //   const target = "\\\\^";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000058", () => {
  //   let regex =
  //     /\\\\\[\\\\\a\\\\\b\\\\\c\\\\\1\\\\\2\\\\\3\\\\\_\\\\\,\\\\\:\\\\\;\\\\\!\\\\\@\\\\\#\\\\\%\\\\\&\\\\\$\\\\\^\\\\\?\\\\\+\\\\\*\\\\\"\\\\\'\\\\\<\\\\\>\\\\\=\\\\\`\\\\\~\\\\\ \\\\\]/;
  //   const target = "[a;c";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("backslash or escape hell part3: Case000000000000059", () => {
  // //   let regex =
  // //     /\\\\\[\\\\\a\\\\\b\\\\\c\\\\\1\\\\\2\\\\\3\\\\\_\\\\\,\\\\\:\\\\\;\\\\\!\\\\\@\\\\\#\\\\\%\\\\\&\\\\\$\\\\\^\\\\\?\\\\\+\\\\\*\\\\\"\\\\\'\\\\\<\\\\\>\\\\\=\\\\\`\\\\\~\\\\\ \\\\\]/u;
  // //   const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part3: Case000000000000060", () => {
  // //   let regex =
  // //     /\\\\\[\\\\\a\\\\\b\\\\\c\\\\\1\\\\\2\\\\\3\\\\\_\\\\\,\\\\\:\\\\\;\\\\\!\\\\\@\\\\\#\\\\\%\\\\\&\\\\\$\\\\\^\\\\\?\\\\\+\\\\\*\\\\\"\\\\\'\\\\\<\\\\\>\\\\\=\\\\\`\\\\\~\\\\\ \\\\\]/v;
  // //   const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000061", () => {
  //   let regex = /\[\a\-\z\]/;
  //   const target = "[a-z]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part3: Case000000000000062", () => {
  // //   let regex = /\[\a\-\z\]/u;
  // //   const target = "[a-z]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part3: Case000000000000063", () => {
  // //   let regex = /\[\a\-\z\]/v;
  // //   const target = "[a-z]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000064", () => {
  //   let regex = /\\[\\a\\-\\z\\]/;
  //   const target = "\\z";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000065", () => {
  //   let regex = /\\[\\a\\-\\z\\]/u;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000066", () => {
  //   let regex = /\\[\\a\\-\\z\\]/v;
  //   const target = "\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000067", () => {
  //   let regex = /\\\[\\\a\\\-\\\z\\\]/;
  //   const target = "\\[\\a\\-\\z\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part3: Case000000000000068", () => {
  // //   let regex = /\\\[\\\a\\\-\\\z\\\]/u;
  // //   const target = "[a-z]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part3: Case000000000000069", () => {
  // //   let regex = /\\\[\\\a\\\-\\\z\\\]/v;
  // //   const target = "[a-z]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000070", () => {
  //   let regex = /\\\\[\\\\a\\\\-\\\\z\\\\]/;
  //   const target = "\\\\z";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000071", () => {
  //   let regex = /\\\\[\\\\a\\\\-\\\\z\\\\]/u;
  //   const target = "\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000072", () => {
  //   let regex = /\\\\[\\\\a\\\\-\\\\z\\\\]/v;
  //   const target = "\\\\a";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000073", () => {
  //   let regex = /\\\\\[\\\\\a\\\\\-\\\\\z\\\\\]/;
  //   const target = "\\\\[\\\\a\\\\-\\\\z\\\\]";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part3: Case000000000000074", () => {
  // //   let regex = /\\\\\[\\\\\a\\\\\-\\\\\z\\\\\]/u;
  // //   const target = "[a-z]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part3: Case000000000000075", () => {
  // //   let regex = /\\\\\[\\\\\a\\\\\-\\\\\z\\\\\]/v;
  // //   const target = "[a-z]";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000076", () => {
  //   let regex = /\\/;
  //   const target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000077", () => {
  //   let regex = /\\/u;
  //   const target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000078", () => {
  //   let regex = /\\/v;
  //   const target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000079", () => {
  //   let regex = /\\\\/;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000080", () => {
  //   let regex = /\\\\/u;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000081", () => {
  //   let regex = /\\\\/v;
  //   const target = "\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000082", () => {
  //   let regex = /\\\\\\/;
  //   const target = "\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000083", () => {
  //   let regex = /\\\\\\/u;
  //   const target = "\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000084", () => {
  //   let regex = /\\\\\\/v;
  //   const target = "\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000085", () => {
  //   let regex = /\\\\\\\\/;
  //   const target = "\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000086", () => {
  //   let regex = /\\\\\\\\/u;
  //   const target = "\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000087", () => {
  //   let regex = /\\\\\\\\/v;
  //   const target = "\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000088", () => {
  //   let regex = /\\\\\\\\\\/;
  //   const target = "\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000089", () => {
  //   let regex = /\\\\\\\\\\/u;
  //   const target = "\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000090", () => {
  //   let regex = /\\\\\\\\\\/v;
  //   const target = "\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000091", () => {
  //   let regex = /\\\\\\\\\\\\/;
  //   const target = "\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000092", () => {
  //   let regex = /\\\\\\\\\\\\/u;
  //   const target = "\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000093", () => {
  //   let regex = /\\\\\\\\\\\\/v;
  //   const target = "\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000094", () => {
  //   let regex = /\\\\\\\\\\\\\\/;
  //   const target = "\\\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000095", () => {
  //   let regex = /\\\\\\\\\\\\\\/u;
  //   const target = "\\\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000096", () => {
  //   let regex = /\\\\\\\\\\\\\\/v;
  //   const target = "\\\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000097", () => {
  //   let regex = /\\\\\\\\\\\\\\\\/;
  //   const target = "\\\\\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000098", () => {
  //   let regex = /\\\\\\\\\\\\\\\\/u;
  //   const target = "\\\\\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000099", () => {
  //   let regex = /\\\\\\\\\\\\\\\\/v;
  //   const target = "\\\\\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case0000000000000100", () => {
  //   let regex = /\\\\\\\\\\\\\\\\\\/;
  //   const target = "\\\\\\\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case0000000000000101", () => {
  //   let regex = /\\\\\\\\\\\\\\\\\\/u;
  //   const target = "\\\\\\\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case0000000000000102", () => {
  //   let regex = /\\\\\\\\\\\\\\\\\\/v;
  //   const target = "\\\\\\\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case0000000000000103", () => {
  //   let regex = /\\\\\\\\\\\\\\\\\\\\/;
  //   const target = "\\\\\\\\\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case0000000000000104", () => {
  //   let regex = /\\\\\\\\\\\\\\\\\\\\/u;
  //   const target = "\\\\\\\\\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case0000000000000105", () => {
  //   let regex = /\\\\\\\\\\\\\\\\\\\\/v;
  //   const target = "\\\\\\\\\\\\\\\\\\\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000106", () => {
  //   let regex = /([\"-'])/;
  //   let target = '"';
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part3: Case000000000000107", () => {
  // //   let regex = /([\"-'])/u;
  // //   let target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part3: Case000000000000108", () => {
  // //   let regex = /([\"-'])/v;
  // //   let target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000109", () => {
  //   let regex = /([\\"-'])/;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000110", () => {
  //   let regex = /([\\"-'])/u;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000111", () => {
  //   let regex = /([\\"-'])/v;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000112", () => {
  //   let regex = /([\\\"-'])/;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part3: Case000000000000113", () => {
  // //   let regex = /([\\\"-'])/u;
  // //   let target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part3: Case000000000000114", () => {
  // //   let regex = /([\\\"-'])/v;
  // //   let target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000115", () => {
  //   let regex = /([\\\\"-'])/;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000116", () => {
  //   let regex = /([\\\\"-'])/u;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000117", () => {
  //   let regex = /([\\\\"-'])/v;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000118", () => {
  //   let regex = /([\\\\\"-'])/;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part3: Case000000000000119", () => {
  // //   let regex = /([\\\\\"-'])/u;
  // //   let target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part3: Case000000000000120", () => {
  // //   let regex = /([\\\\\"-'])/v;
  // //   let target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000121", () => {
  //   let regex = /([\\\\\\"-'])/;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000122", () => {
  //   let regex = /([\\\\\\"-'])/u;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000123", () => {
  //   let regex = /([\\\\\\"-'])/v;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000124", () => {
  //   let regex = /([\\\\\\\"-'])/;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part3: Case000000000000125", () => {
  // //   let regex = /([\\\\\\\"-'])/u;
  // //   let target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part3: Case000000000000126", () => {
  // //   let regex = /([\\\\\\\"-'])/v;
  // //   let target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000127", () => {
  //   let regex = /([\\\\\\\\"-'])/;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000128", () => {
  //   let regex = /([\\\\\\\\"-'])/u;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000129", () => {
  //   let regex = /([\\\\\\\\"-'])/v;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000130", () => {
  //   let regex = /([\\\\\\\\\"-'])/;
  //   let target = "\\";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("backslash or escape hell part3: Case000000000000131", () => {
  // //   let regex = /([\\\\\\\\\"-'])/u;
  // //   let target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // // test("backslash or escape hell part3: Case000000000000132", () => {
  // //   let regex = /([\\\\\\\\\"-'])/v;
  // //   let target = "\\";
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("backslash or escape hell part3: Case000000000000133", () => {
  //   let regex = /(?<x>b)?\\\\\\\\\k<x>/;
  //   const target = "b\\\\\\\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000134", () => {
  //   let regex = /(?<x>b)?\\\\\\\\\k<x>/u;
  //   const target = "b\\\\\\\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("backslash or escape hell part3: Case000000000000135", () => {
  //   let regex = /(?<x>b)?\\\\\\\\\k<x>/v;
  //   const target = "b\\\\\\\\b";
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  //////////////////////////////////////////////////////////////////
  //////////////////////PATTERN MATCH CASES/////////////////////////
  //////////////////////////////////////////////////////////////////

  // test("Pattern match cases: Case000000000000000000000001", () => {
  //   const target = "thithing";
  //   let regex = /thin/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case000000000000000000000002", () => {
  //   const target = "thithin";
  //   let regex = /thin/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case000000000000000000000003", () => {
  //   const target = "anythiaa";
  //   let regex = /thin/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case000000000000000000000004", () => {
  //   const target = "anything";
  //   let regex = /thin/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case000000000000000000000005", () => {
  //   const target = "matchTheF😆cesOfEmojis";
  //   let regex = /F😆ces/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case000000000000000000000006", () => {
  //   const target = "anilmatchTheF😆cesOfEmojis";
  //   let regex = /m\atc\h/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case000000000000000000000007", () => {
  //   const target = "anilma\tchTheF😆cesOfEmojis";
  //   let regex = /m\a\tc\h/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case000000000000000000000008", () => {
  //   const target = "anilma\tchTheF😆cesOfEmojis";
  //   let regex = /\m\a\tc\h/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case000000000000000000000009", () => {
  //   const target = "letstestabcdefghijklmnopqrstuvwxyzendshere";
  //   let regex = /\abcd\ef\g\h\i\j\k\l\mn\o\p\qrst\uv\w\x\y\z/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000010", () => {
  //   const target = "dev@anil!ak";
  //   let regex = /\banil\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000011", () => {
  //   const target = "dev@anil!ak";
  //   let regex = /\banil\bak/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000012", () => {
  //   const target = "dev@anil!ak";
  //   let regex = /\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000013", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000014", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\b\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000015", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\b\banil/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000016", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\b\banil\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000017", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\b\banil\bak/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000018", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\b\banil\b\bak/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000019", () => {
  //   const target = "##a@anil!ak";
  //   let regex = /\bn\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000020", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\b\banil\b!ak/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000021", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\banil/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000022", () => {
  //   const target = "dev@anil!ak";
  //   let regex = /\Banil\B/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000023", () => {
  //   const target = "dev@anil!ak";
  //   let regex = /\Banil\Bak/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000024", () => {
  //   const target = "dev@anil!ak";
  //   let regex = /\B/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000025", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\B/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000026", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\B\B/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000027", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\B\Banil/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000028", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\B\Banil\B/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000029", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\B\Banil\Bak/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000030", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\B\Banil\B\Bak/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000031", () => {
  //   const target = "##a@anil!ak";
  //   let regex = /\Bn\B/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000032", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\B\Banil\B!ak/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000033", () => {
  //   const target = "##@anil!ak";
  //   let regex = /\Banil/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000034", () => {
  //   // BUG: returning null instead of world
  //   const target = "hello world";
  //   let regex = /\bworld\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000035", () => {
  //   const target = "hello";
  //   let regex = /\Bell/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000036", () => {
  //   const target = "hello";
  //   let regex = /\bhello/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000037", () => {
  //   const target = "_hello";
  //   let regex = /\bhello/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000038", () => {
  //   const target = "123abc";
  //   let regex = /\babc/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000039", () => {
  //   const target = "नमस्ते";
  //   let regex = /\bनम/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000040", () => {
  //   const target = "नमस्ते";
  //   let regex = /\bनम/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000041", () => {
  //   const target = "hello-world";
  //   let regex = /\bworld\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000042", () => {
  //   // BUG: infinite loop
  //   const target = "café";
  //   let regex = /\bcafé\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000043", () => {
  //   const target = "_admin";
  //   let regex = /\badmin\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000044", () => {
  //   const target = "foo_bar";
  //   let regex = /\bbar\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000045", () => {
  //   const target = "hello123world";
  //   let regex = /\b123\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000046", () => {
  //   const target = "नमस्ते दुनिया";
  //   let regex = /\Bनम\B/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000047", () => {
  //   const target = "नमस्ते दुनिया";
  //   let regex = /\b /;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000048", () => {
  //   const target = "नमस्ते दुनिया";
  //   let regex = /\B /;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000049", () => {
  //   const target = "admin123";
  //   let regex = /\badmin\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000050", () => {
  //   // BUG: infinite loop
  //   const target = "नमस्ते दुनिया";
  //   let regex = /\bनमस्ते\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000051", () => {
  //   // BUG: infinite loop
  //   const target = "!!!";
  //   let regex = /\b!\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000052", () => {
  //   const target = "education";
  //   let regex = /\Bcat\B/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000053", () => {
  //   const target = "cat";
  //   let regex = /\Bcat/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000054", () => {
  //   const target = "!!hello!!";
  //   let regex = /\Bhello\B/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000055", () => {
  //   const target = "foo.bar";
  //   let regex = /\bbar\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000056", () => {
  //   const target = "🔥fire🔥";
  //   let regex = /\bfire\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000057", () => {
  //   const target = "abcनमस्तेxyz";
  //   let regex = /\bनमस्ते\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000058", () => {
  //   const target = "hi‍there";
  //   let regex = /\bthere\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000059", () => {
  //   const target = "foo_bar-baz123🔥test";
  //   let regex = /\btest\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000060", () => {
  //   const target = "123abc456";
  //   let regex = /\Babc\B/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000061", () => {
  //   // BUG: infinite loop
  //   const target = " café ";
  //   let regex = /\bcafé\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000062", () => {
  //   const target = " café ";
  //   let regex = /\Bcafé\B/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case0000000000000000000000063", () => {
  //   const target = " café ";
  //   let regex = /\bcafé\B/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000064", () => {
  //   const target = "anil\x01kush";
  //   let regex = /\ca/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000065", () => {
  //   const target = "anil\nkushwaha";
  //   let regex = /\cj/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000066", () => {
  //   const target = "anil\nkush\twaha";
  //   let regex = /\ci/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000067", () => {
  //   const target = "anil\nkush\twa\vha";
  //   let regex = /\ck/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000068", () => {
  //   const target = "anil\nkush\twa\vh\ra";
  //   let regex = /\cm/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000069", () => {
  //   const target = "anil\nkush\twa\vh\ra";
  //   let regex = /anil\cjkush\ciwa\ckh\cma/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000070", () => {
  //   const target = "anil\x01kush";
  //   let regex = /\cA/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000071", () => {
  //   const target = "anil\nkushwaha";
  //   let regex = /\cJ/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000072", () => {
  //   const target = "anil\nkush\twaha";
  //   let regex = /\cI/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000073", () => {
  //   const target = "anil\nkush\twa\vha";
  //   let regex = /\cK/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000074", () => {
  //   const target = "anil\nkush\twa\vh\ra";
  //   let regex = /\cM/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000075", () => {
  //   const target = "anil\nkush\twa\vh\ra";
  //   let regex = /anil\cJkush\cIwa\cKh\cMa/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000076", () => {
  //   const target = "1";
  //   let regex = /\d/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000077", () => {
  //   const target = "anilkushwaha289@gmail.com";
  //   let regex = /\d\d\d@/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000078", () => {
  //   const target = "anilkushwaha289@gmail.com";
  //   let regex = /\d89@/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000079", () => {
  //   const target = "anilkushwaha289@gmail.com";
  //   let regex = /2\d9@/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000080", () => {
  //   const target = "anilkushwaha289@gmail.com";
  //   let regex = /28\d@/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000081", () => {
  //   const target = "129J11";
  //   let regex = /\D/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000082", () => {
  //   const target = "z12911";
  //   let regex = /\D/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000083", () => {
  //   const target = "12911q";
  //   let regex = /\D/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000084", () => {
  //   const target = "1!2911";
  //   let regex = /\D/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000085", () => {
  //   const target = "anilkushwaha289@gmail.com";
  //   let regex = /\D289\D/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000086", () => {
  //   const target = "anilkushwaha289@gmail.com";
  //   let regex = /\D\D\d89\Dgmail/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000087", () => {
  //   const target = "anilkushwaha289@gmail.com";
  //   let regex = /9\Dgmail\Dcom/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000088", () => {
  //   const target = "anilkush waha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000089", () => {
  //   const target = "anilkush waha289@gmail.com";
  //   let regex = /kush\swaha/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000090", () => {
  //   const target = "    anilkushwaha289@gmail.com";
  //   let regex = /\S/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000091", () => {
  //   const target = "anil\tkushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000092", () => {
  //   const target = "anil\nkushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000093", () => {
  //   const target = "anil\vkushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000094", () => {
  //   const target = "anil\fkushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000095", () => {
  //   const target = "anil\rkushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000096", () => {
  //   const target = "anil\u00a0kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000097", () => {
  //   // e280a8: 2028
  //   const target = "anil\u2028kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000098", () => {
  //   // e280a9: 2029
  //   const target = "anil\u2029kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case0000000000000000000000099", () => {
  //   // e280af: 202f
  //   const target = "anil\u202fkushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000100", () => {
  //   // e28080: 2000
  //   const target = "anil\u2000kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000101", () => {
  //   // e28081: 2001
  //   const target = "anil\u2001kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000102", () => {
  //   // e28082: 2002
  //   const target = "anil\u2002kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000103", () => {
  //   // e28083: 2003
  //   const target = "anil\u2003kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000104", () => {
  //   // e28084: 2004
  //   const target = "anil\u2004kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000105", () => {
  //   // e28085: 2005
  //   const target = "anil\u2005kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000106", () => {
  //   // e28086: 2006
  //   const target = "anil\u2006kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000107", () => {
  //   // e28087: 2007
  //   const target = "anil\u2007kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000108", () => {
  //   // e28088: 2008
  //   const target = "anil\u2008kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000109", () => {
  //   // e28089: 2009
  //   const target = "anil\u2009kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000110", () => {
  //   // e2808a: 200a
  //   const target = "anil\u200akushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000111", () => {
  //   // e2819f: 205f
  //   const target = "anil\u205fkushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000112", () => {
  //   // e19a80: 1680
  //   const target = "anil\u1680kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000113", () => {
  //   // e38080: 3000
  //   const target = "anil\u3000kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000114", () => {
  //   // efbbbf: feff
  //   const target = "anil\ufeffkushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000115", () => {
  //   // c285: 0085
  //   const target = "anil\u0085kushwaha289@gmail.com";
  //   let regex = /\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case00000000000000000000000116", () => {
  //   const target = "anil\tkushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000117", () => {
  //   const target = "anil\nkushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000118", () => {
  //   const target = "anil\vkushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000119", () => {
  //   const target = "anil\fkushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000120", () => {
  //   const target = "anil\rkushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000121", () => {
  //   const target = "anil\u00a0kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000122", () => {
  //   // e280a8: 2028
  //   const target = "anil\u2028kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000123", () => {
  //   // e280a9: 2029
  //   const target = "anil\u2029kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000124", () => {
  //   // e280af: 202f
  //   const target = "anil\u202fkushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000125", () => {
  //   // e28080: 2000
  //   const target = "anil\u2000kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000126", () => {
  //   // e28081: 2001
  //   const target = "anil\u2001kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000127", () => {
  //   // e28082: 2002
  //   const target = "anil\u2002kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000128", () => {
  //   // e28083: 2003
  //   const target = "anil\u2003kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000129", () => {
  //   // e28084: 2004
  //   const target = "anil\u2004kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000130", () => {
  //   // e28085: 2005
  //   const target = "anil\u2005kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000131", () => {
  //   // e28086: 2006
  //   const target = "anil\u2006kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000132", () => {
  //   // e28087: 2007
  //   const target = "anil\u2007kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000133", () => {
  //   // e28088: 2008
  //   const target = "anil\u2008kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000134", () => {
  //   // e28089: 2009
  //   const target = "anil\u2009kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000135", () => {
  //   // e2808a: 200a
  //   const target = "anil\u200akushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000136", () => {
  //   // e2819f: 205f
  //   const target = "anil\u205fkushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000137", () => {
  //   // e19a80: 1680
  //   const target = "anil\u1680kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000138", () => {
  //   // e38080: 3000
  //   const target = "anil\u3000kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000139", () => {
  //   // efbbbf: feff
  //   const target = "anil\ufeffkushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000140", () => {
  //   // c285: 0085
  //   const target = "anil\u0085kushwaha289@gmail.com";
  //   let regex = /ani\S\s/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case00000000000000000000000141", () => {
  //   const target = "anil\u0085kushwaha289@gmail.com";
  //   let regex = /\S/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000142", () => {
  //   const target = "anil\x09kushwaha";
  //   let regex = /anil\tkush/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000143", () => {
  //   const target = "anil\x0akushwaha";
  //   let regex = /anil\nkush/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000144", () => {
  //   const target = "anil\nkushwaha";
  //   let regex = /anil\nkush/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000145", () => {
  //   const target = "anil\x0bkushwaha";
  //   let regex = /anil\vkush/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000146", () => {
  //   const target = "anil\x0ckushwaha";
  //   let regex = /anil\fkush/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000147", () => {
  //   const target = "anil\x0dkushwaha";
  //   let regex = /anil\rkush/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000148", () => {
  //   const target = "anil\tkushwaha";
  //   let regex = /anil\tkush/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000149", () => {
  //   const target = "anil\nkushwaha";
  //   let regex = /anil\nkush/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000150", () => {
  //   const target = "anil\vkushwaha";
  //   let regex = /anil\vkush/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000151", () => {
  //   const target = "anil\fkushwaha";
  //   let regex = /anil\fkush/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000152", () => {
  //   const target = "anil\rkushwaha";
  //   let regex = /anil\rkush/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000153", () => {
  //   const target = "!@#$_%dev'69;";
  //   let regex = /\w%\we\w'\w9/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000154", () => {
  //   const target = "!@#$_%dev'69;";
  //   let regex = /\w/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000155", () => {
  //   const target = "n";
  //   let regex = /\w/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000156", () => {
  //   const target = "!@#$%0";
  //   let regex = /\w/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000157", () => {
  //   const target = "!@#$%;";
  //   let regex = /\w/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match cases: Case00000000000000000000000158", () => {
  //   const target = "!";
  //   let regex = /\W/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000159", () => {
  //   const target = "anil!";
  //   let regex = /\W/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000160", () => {
  //   const target = "secRes@Cyfrin";
  //   let regex = /\WCyfrin/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000161", () => {
  //   const target = "secRes@Cyfrin";
  //   let regex = /Re\w\WC/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000162", () => {
  //   const target = "secRes3@Cyfr!n";
  //   let regex = /sec\wes\w\WCyfr\W\w/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000163", () => {
  //   const target = "secRes3@Cyfr!n";
  //   let regex = /\w@\wyfr\Wn/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000164", () => {
  //   const target = "secRes3@ACyfr!n";
  //   let regex = /\x41/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000165", () => {
  //   const target = "secRes3@ACyfr!n";
  //   let regex = /\x41\x43/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000166", () => {
  //   const target = "secResearch3@ACyfr!n";
  //   let regex = /Rese\x61rch3/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000167", () => {
  //   const target = "secResearch0@ACyfr!n";
  //   let regex = /arch\x30@/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000168", () => {
  //   const target = "sec Research0@ACyfr!n";
  //   let regex = /sec\x20Research\x30@/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000169", () => {
  //   const target = "sec Research0@ACyfr!n";
  //   let regex = /\x20Researc\x68\x30@/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000170", () => {
  //   const target = "sec Research0@Cyfrin";
  //   let regex = /\x68\x30@Cyfr\x69n/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000171", () => {
  //   const target = "@cyfrin says Hello to sec pros";
  //   let regex = /\x48\x65\x6C\x6C\x6F/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000172", () => {
  //   const target = "secRes3@ACyfr!n";
  //   let regex = /\u0041/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000173", () => {
  //   const target = "secRes3@ACyfr!n";
  //   let regex = /\u0041\u0043/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000174", () => {
  //   const target = "secResearch3@ACyfr!n";
  //   let regex = /Rese\u0061rch3/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000175", () => {
  //   const target = "secResearch0@ACyfr!n";
  //   let regex = /arch\u0030@/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000176", () => {
  //   const target = "sec Research0@ACyfr!n";
  //   let regex = /sec\u0020Research\u0030@/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000177", () => {
  //   const target = "sec Research0@ACyfr!n";
  //   let regex = /\u0020Researc\u0068\u0030@/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000178", () => {
  //   const target = "sec Research0@Cyfrin";
  //   let regex = /\u0068\u0030@Cyfr\u0069n/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000179", () => {
  //   const target = "@cyfrin says Hello to sec pros";
  //   let regex = /\u0048\u0065\u006C\u006C\u006F/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000180", () => {
  //   const target = "secRes3@ACyfr!n";
  //   let regex = /\u{0041}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000181", () => {
  //   const target = "secRes3@ACyfr!n";
  //   let regex = /\u{0041}\u{0043}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000182", () => {
  //   const target = "secResearch3@ACyfr!n";
  //   let regex = /Rese\u{0061}rch3/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000183", () => {
  //   const target = "secResearch0@ACyfr!n";
  //   let regex = /arch\u{0030}@/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000184", () => {
  //   const target = "sec Research0@ACyfr!n";
  //   let regex = /sec\u{0020}Research\u{0030}@/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000185", () => {
  //   const target = "sec Research0@ACyfr!n";
  //   let regex = /\u{0020}Researc\u{0068}\u{0030}@/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000186", () => {
  //   const target = "sec Research0@Cyfrin";
  //   let regex = /\u{0068}\u{0030}@Cyfr\u{0069}n/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000187", () => {
  //   const target = "@cyfrin says Hello to sec pros";
  //   let regex = /\u{0048}\u{0065}\u{006C}\u{006C}\u{006F}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000188", () => {
  //   const target = "secRes3@ACyfr!n";
  //   let regex = /\u{41}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000189", () => {
  //   const target = "secRes3@ACyfr!n";
  //   let regex = /\u{41}\u{43}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000190", () => {
  //   const target = "secResearch3@ACyfr!n";
  //   let regex = /Rese\u{61}rch3/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000191", () => {
  //   const target = "secResearch0@ACyfr!n";
  //   let regex = /arch\u{30}@/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000192", () => {
  //   const target = "sec Research0@ACyfr!n";
  //   let regex = /sec\u{20}Research\u{30}@/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000193", () => {
  //   const target = "sec Research0@ACyfr!n";
  //   let regex = /\u{20}Researc\u{68}\u{30}@/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000194", () => {
  //   const target = "sec Research0@Cyfrin";
  //   let regex = /\u{68}\u{30}@Cyfr\u{69}n/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000195", () => {
  //   const target = "@cyfrin says Hello to sec pros";
  //   let regex = /\u{48}\u{65}\u{6C}\u{6C}\u{6F}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000196", () => {
  //   const target = "secResearch\x000@Cyfrin";
  //   let regex = /\u{00}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000197", () => {
  //   const target = "secResearch\x010@Cyfrin";
  //   let regex = /\u{01}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000198", () => {
  //   const target = "secResearch\x020@Cyfrin";
  //   let regex = /\u{02}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000199", () => {
  //   const target = "secResearch\x030@Cyfrin";
  //   let regex = /\u{03}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000200", () => {
  //   const target = "secResearch\x040@Cyfrin";
  //   let regex = /\u{04}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000201", () => {
  //   const target = "secResearch\x050@Cyfrin";
  //   let regex = /\u{05}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000202", () => {
  //   const target = "secResearch\x060@Cyfrin";
  //   let regex = /\u{06}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000203", () => {
  //   const target = "secResearch\x070@Cyfrin";
  //   let regex = /\u{07}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000204", () => {
  //   const target = "secResearch\x080@Cyfrin";
  //   let regex = /\u{08}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000205", () => {
  //   const target = "secResearch\x090@Cyfrin";
  //   let regex = /\u{09}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000206", () => {
  //   const target = "secResearch\x000@Cyfrin";
  //   let regex = /\u{0}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000207", () => {
  //   const target = "secResearch\x010@Cyfrin";
  //   let regex = /\u{1}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000208", () => {
  //   const target = "secResearch\x020@Cyfrin";
  //   let regex = /\u{2}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000209", () => {
  //   const target = "secResearch\x030@Cyfrin";
  //   let regex = /\u{3}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000210", () => {
  //   const target = "secResearch\x040@Cyfrin";
  //   let regex = /\u{4}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000211", () => {
  //   const target = "secResearch\x050@Cyfrin";
  //   let regex = /\u{5}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000212", () => {
  //   const target = "secResearch\x060@Cyfrin";
  //   let regex = /\u{6}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000213", () => {
  //   const target = "secResearch\x070@Cyfrin";
  //   let regex = /\u{7}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000214", () => {
  //   const target = "secResearch\x080@Cyfrin";
  //   let regex = /\u{8}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000215", () => {
  //   const target = "secResearch\x090@Cyfrin";
  //   let regex = /\u{9}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000216", () => {
  //   const target = "secResearch\u{123}0@Cyfrin";
  //   let regex = /\u{123}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000217", () => {
  //   const target = "secResearch\u{141}0@Cyfrin";
  //   let regex = /\u{141}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000218", () => {
  //   const target = "secResearch\u{17E}0@Cyfrin";
  //   let regex = /\u{17E}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000219", () => {
  //   const target = "secResearch\u{2C7}0@Cyfrin";
  //   let regex = /\u{2C7}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000220", () => {
  //   const target = "secResearch\u{3A9}0@Cyfrin";
  //   let regex = /\u{3A9}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000221", () => {
  //   const target = "secResearch\u{451}0@Cyfrin";
  //   let regex = /\u{451}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000222", () => {
  //   const target = "secResearch\u{5D0}0@Cyfrin";
  //   let regex = /\u{5D0}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000223", () => {
  //   const target = "secResearch\u{621}0@Cyfrin";
  //   let regex = /\u{621}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000224", () => {
  //   const target = "secResearch\u{400}0@Cyfrin";
  //   let regex = /\u{400}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000225", () => {
  //   const target = "secResearch\u{4FF}0@Cyfrin";
  //   let regex = /\u{4FF}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000226", () => {
  //   const target = "secResearch\u{123}0@Cyfrin";
  //   let regex = /\u{0123}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000227", () => {
  //   const target = "secResearch\u{141}0@Cyfrin";
  //   let regex = /\u{0141}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000228", () => {
  //   const target = "secResearch\u{17E}0@Cyfrin";
  //   let regex = /\u{017E}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000229", () => {
  //   const target = "secResearch\u{2C7}0@Cyfrin";
  //   let regex = /\u{02C7}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000230", () => {
  //   const target = "secResearch\u{3A9}0@Cyfrin";
  //   let regex = /\u{03A9}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000231", () => {
  //   const target = "secResearch\u{451}0@Cyfrin";
  //   let regex = /\u{0451}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000232", () => {
  //   const target = "secResearch\u{5D0}0@Cyfrin";
  //   let regex = /\u{05D0}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000233", () => {
  //   const target = "secResearch\u{621}0@Cyfrin";
  //   let regex = /\u{0621}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000234", () => {
  //   const target = "secResearch\u{400}0@Cyfrin";
  //   let regex = /\u{0400}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000235", () => {
  //   const target = "secResearch\u{4FF}0@Cyfrin";
  //   let regex = /\u{04FF}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000236", () => {
  //   const target = "secResearch\u{1000}0@Cyfrin";
  //   let regex = /\u{1000}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000237", () => {
  //   const target = "secResearch\u{10A0}0@Cyfrin";
  //   let regex = /\u{10A0}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000238", () => {
  //   const target = "secResearch\u{1234}0@Cyfrin";
  //   let regex = /\u{1234}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000239", () => {
  //   const target = "secResearch\u{20AC}0@Cyfrin";
  //   let regex = /\u{20AC}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000240", () => {
  //   const target = "secResearch\u{2192}0@Cyfrin";
  //   let regex = /\u{2192}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000241", () => {
  //   const target = "secResearch\u{2603}0@Cyfrin";
  //   let regex = /\u{2603}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000242", () => {
  //   const target = "secResearch\u{2764}0@Cyfrin";
  //   let regex = /\u{2764}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000243", () => {
  //   const target = "secResearch\u{2B50}0@Cyfrin";
  //   let regex = /\u{2B50}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000244", () => {
  //   const target = "secResearch\u{4E2D}0@Cyfrin";
  //   let regex = /\u{4E2D}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000245", () => {
  //   const target = "secResearch\u{2600}0@Cyfrin";
  //   let regex = /\u{2600}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000246", () => {
  //   const target = "secResearch\u{26FF}0@Cyfrin";
  //   let regex = /\u{26FF}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000247", () => {
  //   const target = "secResearch\u{1000}0@Cyfrin";
  //   let regex = /\u{01000}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000248", () => {
  //   const target = "secResearch\u{10A0}0@Cyfrin";
  //   let regex = /\u{010A0}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000249", () => {
  //   const target = "secResearch\u{1234}0@Cyfrin";
  //   let regex = /\u{01234}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000250", () => {
  //   const target = "secResearch\u{20AC}0@Cyfrin";
  //   let regex = /\u{020AC}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000251", () => {
  //   const target = "secResearch\u{2192}0@Cyfrin";
  //   let regex = /\u{02192}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000252", () => {
  //   const target = "secResearch\u{2603}0@Cyfrin";
  //   let regex = /\u{02603}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000253", () => {
  //   const target = "secResearch\u{2764}0@Cyfrin";
  //   let regex = /\u{02764}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000254", () => {
  //   const target = "secResearch\u{2B50}0@Cyfrin";
  //   let regex = /\u{02B50}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000255", () => {
  //   const target = "secResearch\u{4E2D}0@Cyfrin";
  //   let regex = /\u{04E2D}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000256", () => {
  //   const target = "secResearch\u{2600}0@Cyfrin";
  //   let regex = /\u{02600}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000257", () => {
  //   const target = "secResearch\u{26FF}0@Cyfrin";
  //   let regex = /\u{026FF}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000258", () => {
  //   const target = "secResearch\u{126FF}0@Cyfrin";
  //   let regex = /\u{126FF}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000259", () => {
  //   const target = "secResearch\u{10000}0@Cyfrin";
  //   let regex = /\u{10000}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000260", () => {
  //   const target = "secResearch\u{10142}0@Cyfrin";
  //   let regex = /\u{10142}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000261", () => {
  //   const target = "secResearch\u{10348}0@Cyfrin";
  //   let regex = /\u{10348}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000262", () => {
  //   const target = "secResearch\u{10437}0@Cyfrin";
  //   let regex = /\u{10437}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000263", () => {
  //   const target = "secResearch\u{10597}0@Cyfrin";
  //   let regex = /\u{10597}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000264", () => {
  //   const target = "secResearch\u{106A0}0@Cyfrin";
  //   let regex = /\u{106A0}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000265", () => {
  //   const target = "secResearch\u{10A10}0@Cyfrin";
  //   let regex = /\u{10A10}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000266", () => {
  //   const target = "secResearch\u{10B80}0@Cyfrin";
  //   let regex = /\u{10B80}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000267", () => {
  //   const target = "secResearch\u{10C00}0@Cyfrin";
  //   let regex = /\u{10C00}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000268", () => {
  //   const target = "secResearch\u{10000}0@Cyfrin";
  //   let regex = /\u{010000}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000269", () => {
  //   const target = "secResearch\u{10142}0@Cyfrin";
  //   let regex = /\u{010142}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000270", () => {
  //   const target = "secResearch\u{10348}0@Cyfrin";
  //   let regex = /\u{010348}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000271", () => {
  //   const target = "secResearch\u{10437}0@Cyfrin";
  //   let regex = /\u{010437}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000272", () => {
  //   const target = "secResearch\u{10597}0@Cyfrin";
  //   let regex = /\u{010597}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000273", () => {
  //   const target = "secResearch\u{106A0}0@Cyfrin";
  //   let regex = /\u{0106A0}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000274", () => {
  //   const target = "secResearch\u{10A10}0@Cyfrin";
  //   let regex = /\u{010A10}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000275", () => {
  //   const target = "secResearch\u{10B80}0@Cyfrin";
  //   let regex = /\u{010B80}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000276", () => {
  //   const target = "secResearch\u{10C00}0@Cyfrin";
  //   let regex = /\u{010C00}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000277", () => {
  //   const target = "secResearch\u{0000A9}0@Cyfrin";
  //   let regex = /\u{0000A9}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000278", () => {
  //   const target = "secResearch\u{01F680}0@Cyfrin";
  //   let regex = /\u{01F680}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match cases: Case00000000000000000000000279", () => {
  //   const target = "secResearch\u{10FFFF}0@Cyfrin";
  //   let regex = /\u{10FFFF}/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case0000000000000000000000001", () => {
  //   const target = "nehal";
  //   let regex = /ne[jklshmnp]al/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case0000000000000000000000002", () => {
  //   const target = "nehal";
  //   let regex = /ne[jklshmnp]al/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case0000000000000000000000003", () => {
  //   const target = "nehal";
  //   let regex = /[jklshmnp]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case0000000000000000000000004", () => {
  //   const target = "nehal";
  //   let regex = /[jklshmnp]/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case0000000000000000000000005", () => {
  //   const target = "neuhal";
  //   let regex = /ne[\x0f-\u{00000f}]hal/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case0000000000000000000000006", () => {
  //   const target = "ne{hal";
  //   let regex = /ne[\x0f-\u{00000f}]hal/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case0000000000000000000000007", () => {
  //   const target = "ne0hal";
  //   let regex = /ne[\x0f-\u{00000f}]hal/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case0000000000000000000000008", () => {
  //   const target = "nefhal";
  //   let regex = /ne[\x0f-\u{00000f}]hal/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case0000000000000000000000009", () => {
  //   const target = "ne}hal";
  //   let regex = /ne[\x0f-\u{00000f}]hal/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000010", () => {
  //   const target = "ne\x0fhal";
  //   let regex = /ne[\x0f-\u{00000f}]hal/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000011", () => {
  //   const target = "ne\x0fhal";
  //   let regex = /[\x0f-\u{00006c}]/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000012", () => {
  //   const target = "ne\x0fhal";
  //   let regex = /\x0f[\x0f-\u{00006c}]al/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000013", () => {
  //   const target = "nehal";
  //   let regex = /[abc]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000014", () => {
  //   const target = "nehal";
  //   let regex = /[xyz]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000015", () => {
  //   const target = "neha1";
  //   let regex = /[0123456789]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000016", () => {
  //   const target = "nehal";
  //   let regex = /[aeiou]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000017", () => {
  //   const target = "NehAl";
  //   let regex = /[AEIOU]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000018", () => {
  //   const target = "NehAl";
  //   let regex = /[a-z]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000019", () => {
  //   const target = "NehAl";
  //   let regex = /[A-Z]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000020", () => {
  //   const target = "111NehAl";
  //   let regex = /N[a-zA-Z]hAl/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000021", () => {
  //   const target = "111NehAl";
  //   let regex = /[0-9a-f]N/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000022", () => {
  //   const target = "ne\u{1F600}hal";
  //   let regex = /[\u{1F600}]/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000023", () => {
  //   const target = "ne\u{1F64F}hal";
  //   let regex = /[\u{1F600}-\u{1F64F}]/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000024", () => {
  //   const target = "ne😀hal";
  //   let regex = /[😀ab]/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000025", () => {
  //   const target = "ne\u0061hal";
  //   let regex = /[\u0061\u{62}]/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000026", () => {
  //   const target = "\u{1F600}hal";
  //   let regex = /[a-\u{1F601}]/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000027", () => {
  //   const target = "neßhal";
  //   let regex = /[ß]/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000028", () => {
  //   const target = "néhal";
  //   let regex = /[é]/u;

  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000029", () => {
  //   const target = "ne\u{69}hal";
  //   let regex = /[\u{61}-\u{7A}]/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000030", () => {
  //   const target = "ne😍hal";
  //   let regex = /[😀-🙏]/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Pattern match character classes cases: Case00000000000000000000000031", () => {
  // //   const target = "nehal";
  // //   let regex = /[a-z&&[aeiou]]/v;
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Pattern match character classes cases: Case00000000000000000000000032", () => {
  //   const target = "nehal";
  //   let regex = /[[a-z]&&[aeiou]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000033", () => {
  //   const target = "nehal";
  //   let regex = /[[a&&b]&&[aeiou]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000034", () => {
  //   const target = "nehal";
  //   let regex = /[[bcdefghijkup]&&[aeiou]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000035", () => {
  //   const target = "nehal";
  //   let regex = /[[[anil]&&[nehal]]&&[aeiou]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000036", () => {
  //   const target = "nehal";
  //   let regex = /[[a-z]--[aeiou]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000037", () => {
  //   const target = "nehal";
  //   let regex = /[[adsadasdz]&&[dasdasdz]&&[masdasdz]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000038", () => {
  //   const target = "nehal";
  //   let regex = /[[a-z]&&[d-z]&&[m-z]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000039", () => {
  //   const target = "nehal";
  //   let regex = /[[[a-z]&&[a-m]]--[d-f]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000040", () => {
  //   const target = "nehal";
  //   let regex = /[[[a-z]&&[b-m]]--[d-f]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000041", () => {
  //   const target = "nehal";
  //   let regex = /[[a-z]&&[x-z]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000042", () => {
  //   const target = "nehal";
  //   let regex = /[[a-z]&&[[a-m]--[h-k]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000043", () => {
  //   const target = "nehal";
  //   let regex = /[[a-z]--[m-z]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000044", () => {
  //   const target = "nehal";
  //   let regex = /[[a-z]--[d-m]--[x-z]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Pattern match character classes cases: Case00000000000000000000000045", () => {
  // //   const target = "nehal";
  // //   let regex = /[[a-z]&&[a-m]--[g-k]]/v;
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Pattern match character classes cases: Case00000000000000000000000046", () => {
  //   const target = "nehal";
  //   let regex = /[[[a-z]&&[a-m]]&&[f-z]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000047", () => {
  //   const target = "nehal";
  //   let regex = /[[a-z]--[[d-z]&&[m-z]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000048", () => {
  //   const target = "nehal";
  //   let regex = /[[[[a-f]&&[c-z]]--[d]]&&[b-e]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000049", () => {
  //   const target = "ne\nhal";
  //   let regex = /[[\cJ]&&[\n-\r]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000050", () => {
  //   const target = "ne\x01hal";
  //   let regex = /[[\cA]&&[\cB]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000051", () => {
  //   const target = "nehAl";
  //   let regex = /[[\x41]&&[A-Z]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000052", () => {
  //   const target = "nehAl";
  //   let regex = /[[\u0041]&&[\x41]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000053", () => {
  //   const target = "neh\u{1F606}al";
  //   let regex = /[[\u{1F600}-\u{1F607}]&&[\u{1F604}-\u{1F60A}]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000054", () => {
  //   const target = "neh\x03al";
  //   let regex = /[[\cA\cB\cC]--[\cB]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000055", () => {
  //   const target = "laheNehal";
  //   let regex = /[[\x41-\x5A]&&[\u004D-\u005A]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000056", () => {
  //   const target = "neh\u{1234}al";
  //   let regex = /[[\u{1230}-\u{123A}]--[\u{1233}]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match character classes cases: Case00000000000000000000000057", () => {
  //   const target = "neh\x03al";
  //   let regex = /[[\ca\cb\cc]--[\cb]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case00000000000000000000000001", () => {
  //   const target = "zabz";
  //   let regex = /(ab)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case00000000000000000000000002", () => {
  //   const target = "nehal";
  //   let regex = /ne(ha)l/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case00000000000000000000000003", () => {
  //   const target = "ms_nehalA";
  //   let regex = /ms_(n((e(h))a)l)A/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case00000000000000000000000004", () => {
  //   const target = "zabz";
  //   let regex = /(ab)/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case00000000000000000000000005", () => {
  //   const target = "nehal";
  //   let regex = /ne(ha)l/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case00000000000000000000000006", () => {
  //   const target = "ms_nehalA";
  //   let regex = /ms_(n((e(h))a)l)A/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case00000000000000000000000007", () => {
  //   const target = "zabz";
  //   let regex = /(ab)/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case00000000000000000000000008", () => {
  //   const target = "nehal";
  //   let regex = /ne(ha)l/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case00000000000000000000000009", () => {
  //   const target = "ms_nehalA";
  //   let regex = /ms_(n((e(h))a)l)A/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000010", () => {
  //   const target = "nehal";
  //   let regex = /(ne[jklshmnp]al)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000011", () => {
  //   const target = "nehal";
  //   let regex = /(ne[jklshmnp]al)/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000012", () => {
  //   const target = "nehal";
  //   let regex = /([jklshmnp])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000013", () => {
  //   const target = "nehal";
  //   let regex = /([jklshmnp])/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000014", () => {
  //   const target = "neuhal";
  //   let regex = /(ne[\x0f-\u{00000f}]hal)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000015", () => {
  //   const target = "ne{hal";
  //   let regex = /(ne[\x0f-\u{00000f}]hal)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000016", () => {
  //   const target = "ne0hal";
  //   let regex = /(ne[\x0f-\u{00000f}]hal)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000017", () => {
  //   const target = "nefhal";
  //   let regex = /(ne[\x0f-\u{00000f}]hal)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000018", () => {
  //   const target = "ne}hal";
  //   let regex = /(ne[\x0f-\u{00000f}]hal)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000019", () => {
  //   const target = "ne\x0fhal";
  //   let regex = /(ne[\x0f-\u{00000f}]hal)/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000020", () => {
  //   const target = "ne\x0fhal";
  //   let regex = /([\x0f-\u{00006c}])/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000021", () => {
  //   const target = "ne\x0fhal";
  //   let regex = /(\x0f[\x0f-\u{00006c}]al)/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000022", () => {
  //   const target = "nehal";
  //   let regex = /([abc])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000023", () => {
  //   const target = "nehal";
  //   let regex = /([xyz])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000024", () => {
  //   const target = "neha1";
  //   let regex = /([0123456789])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000025", () => {
  //   const target = "nehal";
  //   let regex = /([aeiou])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000026", () => {
  //   const target = "NehAl";
  //   let regex = /([AEIOU])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000027", () => {
  //   const target = "NehAl";
  //   let regex = /([a-z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000028", () => {
  //   const target = "111NehAl";
  //   let regex = /(N[a-zA-Z]hAl)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000029", () => {
  //   const target = "111NehAl";
  //   let regex = /(N[a-zA-Z]hAl)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000030", () => {
  //   const target = "111NehAl";
  //   let regex = /([0-9a-f]N)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000031", () => {
  //   const target = "ne\u{1F600}hal";
  //   let regex = /([\u{1F600}])/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000032", () => {
  //   const target = "ne\u{1F64F}hal";
  //   let regex = /([\u{1F600}-\u{1F64F}])/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000033", () => {
  //   const target = "ne😀hal";
  //   let regex = /([😀ab])/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000034", () => {
  //   const target = "ne\u0061hal";
  //   let regex = /([\u0061\u{62}])/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000035", () => {
  //   const target = "\u{1F600}hal";
  //   let regex = /([a-\u{1F601}])/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000036", () => {
  //   const target = "neßhal";
  //   let regex = /([ß])/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000037", () => {
  //   const target = "néhal";
  //   let regex = /([é])/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000038", () => {
  //   const target = "ne\u{69}hal";
  //   let regex = /([\u{61}-\u{7A}])/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000039", () => {
  //   const target = "ne😍hal";
  //   let regex = /([😀-🙏])/u;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Pattern match Groups cases: Case000000000000000000000000040", () => {
  // //   const target = "nehal";
  // //   let regex = /([a-z&&[aeiou]])/v;
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Pattern match Groups cases: Case000000000000000000000000041", () => {
  //   const target = "nehal";
  //   let regex = /([[a-z]&&[aeiou]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000042", () => {
  //   const target = "nehal";
  //   let regex = /([[a&&b]&&[aeiou]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000043", () => {
  //   const target = "nehal";
  //   let regex = /([[bcdefghijkup]&&[aeiou]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000044", () => {
  //   const target = "nehal";
  //   let regex = /([[[anil]&&[nehal]]&&[aeiou]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000045", () => {
  //   const target = "nehal";
  //   let regex = /([[a-z]--[aeiou]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000046", () => {
  //   const target = "nehal";
  //   let regex = /([[adsadasdz]&&[dasdasdz]&&[masdasdz]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000047", () => {
  //   const target = "nehal";
  //   let regex = /([[a-z]&&[d-z]&&[m-z]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000048", () => {
  //   const target = "nehal";
  //   let regex = /([[[a-z]&&[a-m]]--[d-f]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000049", () => {
  //   const target = "nehal";
  //   let regex = /([[[a-z]&&[b-m]]--[d-f]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000050", () => {
  //   const target = "nehal";
  //   let regex = /([[a-z]&&[x-z]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000051", () => {
  //   const target = "nehal";
  //   let regex = /([[a-z]&&[[a-m]--[h-k]]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000052", () => {
  //   const target = "nehal";
  //   let regex = /([[a-z]--[m-z]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000053", () => {
  //   const target = "nehal";
  //   let regex = /([[a-z]--[d-m]--[x-z]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Pattern match Groups cases: Case000000000000000000000000054", () => {
  // //   const target = "nehal";
  // //   let regex = /([[a-z]&&[a-m]--[g-k]])/v;
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Pattern match Groups cases: Case000000000000000000000000055", () => {
  //   const target = "nehal";
  //   let regex = /([[[a-z]&&[a-m]]&&[f-z]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000056", () => {
  //   const target = "nehal";
  //   let regex = /([[a-z]--[[d-z]&&[m-z]]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000057", () => {
  //   const target = "nehal";
  //   let regex = /([[[[a-f]&&[c-z]]--[d]]&&[b-e]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000058", () => {
  //   const target = "ne\nhal";
  //   let regex = /([[\cJ]&&[\n-\r]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000059", () => {
  //   const target = "ne\x01hal";
  //   let regex = /([[\cA]&&[\cB]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000060", () => {
  //   const target = "nehAl";
  //   let regex = /([[\x41]&&[A-Z]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000061", () => {
  //   const target = "nehAl";
  //   let regex = /([[\u0041]&&[\x41]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000062", () => {
  //   const target = "neh\u{1F606}al";
  //   let regex = /([[\u{1F600}-\u{1F607}]&&[\u{1F604}-\u{1F60A}]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000063", () => {
  //   const target = "neh\x03al";
  //   let regex = /([[\cA\cB\cC]--[\cB]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000064", () => {
  //   const target = "laheNehal";
  //   let regex = /([[\x41-\x5A]&&[\u004D-\u005A]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000065", () => {
  //   const target = "neh\u{1234}al";
  //   let regex = /([[\u{1230}-\u{123A}]--[\u{1233}]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000066", () => {
  //   const target = "neh\x03al";
  //   let regex = /([[\ca\cb\cc]--[\cb]])/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000067", () => {
  //   const target = "abba";
  //   let regex = /(a)(b)\2/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000068", () => {
  //   const target = "ms_nehalAh";
  //   let regex = /ms_(n((e(h))a)l)A\4/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000069", () => {
  //   const target = "ms_nehalAeha";
  //   let regex = /ms_(n((e(h))a)l)A\2/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000070", () => {
  //   const target = "aaha";
  //   let regex = /(a)\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000071", () => {
  //   const target = "abbah";
  //   let regex = /(a)(b)\2\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000072", () => {
  //   const target = "abbah";
  //   let regex = /(\w)\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000073", () => {
  //   const target = "abbcaccch";
  //   let regex = /(\w)\1\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000074", () => {
  //   const target = "abbcacccababbh";
  //   let regex = /(a(b))\1\2/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000075", () => {
  //   const target = "abbcacccababbhabccbcabc";
  //   let regex = /(a(b(c)))\3\2\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000076", () => {
  //   const target = "abbcacccababcabcbbhabccbcabc";
  //   let regex = /((ab)c)\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000077", () => {
  //   const target = "abbcacabbaccababcabcbbhabccbcabc";
  //   let regex = /((a)(b))\3\2/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000078", () => {
  //   const target = "abbcacabbaccahahababcabcbbhahahabccbcabc";
  //   let regex = /(ha)\1\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000079", () => {
  //   const target = "aa";
  //   let regex = /(?<x>a)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000080", () => {
  //   const target = "hello";
  //   let regex = /(?<word>\w)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000081", () => {
  //   const target = "aa";
  //   let regex = /(?<x>a)\k<x>/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000082", () => {
  //   const target = "John Doe";
  //   let regex = /(?<first>\w)\s(?<second>\w)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000083", () => {
  //   const target = "abcabbabxyz";
  //   let regex = /(?<a>a)(?<b>b)\k<b>\k<a>/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000084", () => {
  //   const target = "abcababxababbyz";
  //   let regex = /(?<outer>a(?<inner>b))\k<outer>\k<inner>/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000085", () => {
  //   const target = "abcabapsfabcxarabccbcabcbxababbyz";
  //   let regex = /(?<g1>a(?<g2>b(?<g3>c)))\k<g3>\k<g2>\k<g1>/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000086", () => {
  //   const target = "bccbcabcabbabxaba";
  //   let regex = /(?<x>a)(b)\2\k<x>/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000087", () => {
  //   const target = "bccbcabcabbabxaba";
  //   // @NOTE: works differently as compared to solidity
  //   let regex = /\k<x>(?<x>a)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Pattern match Groups cases: Case000000000000000000000000088", () => {
  // //   const target = "foobarfoo\x01foo";
  // //   let regex = /foo(?=bar)\1/v;
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Pattern match Groups cases: Case000000000000000000000000089", () => {
  //   const target = "foobar";
  //   let regex = /foo(?=bar)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000090", () => {
  //   const target = "foobaz";
  //   let regex = /foo(?=bar)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // // test("Pattern match Groups cases: Case000000000000000000000000091", () => {
  // //   const target = "foobaz";
  // //   let regex = /foo(?!bar)\1/u;
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Pattern match Groups cases: Case000000000000000000000000092", () => {
  //   const target = "foobaz";
  //   let regex = /foo(?!bar)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000093", () => {
  //   const target = "foobazfoobar";
  //   let regex = /foo(?!baz)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // // test("Pattern match Groups cases: Case000000000000000000000000094", () => {
  // //   const target = "now let's pay $dollars, total is $9.";
  // //   let regex = /(?<=\$)\1/u;
  // //   console.log("output: ", target.match(regex));
  // //   assert.strictEqual(regex.test(target), true);
  // // });

  // test("Pattern match Groups cases: Case000000000000000000000000095", () => {
  //   const target = "now let's pay $dollars, total is $9.";
  //   let regex = /(?<=\$)\d/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000096", () => {
  //   const target = "now let's pay $dollars, total is $9. or 8";
  //   let regex = /(?<!\$)\d/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000097", () => {
  //   const target = "now let's pay $dollars, totabl is $9. or 8";
  //   let regex = /a(?=b)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000098", () => {
  //   const target = "now let's pay xz $dollars, xy totabl is $9. or 8";
  //   let regex = /x(?=y)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case000000000000000000000000099", () => {
  //   const target = "now let's totabl xz $dollars, xy pay is $9. or 8";
  //   let regex = /a(?!b)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000100", () => {
  //   const target = "now let's totabl xz $dollars, xy pay is $9. or 8";
  //   let regex = /x(?!y)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000101", () => {
  //   const target = "now let's totabl xz $dollarbs, xy pay is $9. or 8";
  //   let regex = /(?<=a)b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000102", () => {
  //   const target = "now let's totabl xz $dollarbs, xy pay is $9. or 8";
  //   let regex = /(?<=x)y/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000103", () => {
  //   const target = "now let's totabl xz $dollarbs, xy pay is $9. or 8";
  //   let regex = /(?<!a)b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000104", () => {
  //   const target = "now let's totabl xz $dollarbs, xy pay is $9. or 8";
  //   let regex = /(?<!x)y/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000105", () => {
  //   const target = "now let's totabl xz $dollabcrbs, xy pay is $9. or 8";
  //   let regex = /(?<=a)b(?=c)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000106", () => {
  //   const target = "now let's totabl xz $dollabcrbs, xy pay is $9. or 8";
  //   let regex = /a(?=b)b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000107", () => {
  //   const target = "now let's totabl xz $dollabcrbs, xy pay is $9. or 8";
  //   let regex = /a(?=b)c/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000108", () => {
  //   const target = "now let's totabl xz $dollabcrbs, xy pacy is $9. or 8";
  //   let regex = /a(?!b)c/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000109", () => {
  //   const target = "now let's totabcl xz $dollab crbs, xy pacy is $9. or 8";
  //   let regex = /(?<=a)b c/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000110", () => {
  //   const target = "now let's totabcl xz $dollab crbs, xy pacy is $9. or 8";
  //   let regex = /(?<=a)b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000111", () => {
  //   const target = "now let's totabl xz $dollab crbabcs, xy pacy is $9. or 8";
  //   let regex = /a(?=b)(?=bc)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000112", () => {
  //   const target = "now let's totabl xz $dollab crbabcs, xy pacy is $9. or 8";
  //   // @info: Literally, only possible in quantum world|computing
  //   let regex = /a(?=b)(?=c)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000113", () => {
  //   const target = "now let's totabl xz $dollab crbabcs, xy pacy is $9. or 8";
  //   let regex = /(?<=a)b(?=c)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000114", () => {
  //   const target = "now let's totabl xz $dollab crbabcs, xy pacy is $9. or 8";
  //   let regex = /a(?=(b(?=c)))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000115", () => {
  //   const target = "she is n3hal aka drishti";
  //   let regex = /\d(?=[a-z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000116", () => {
  //   const target = "she is n3hal aka drishti";
  //   let regex = /[a-z](?=\d)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000117", () => {
  //   const target = "she is n3hal aka 3@drishti";
  //   let regex = /\d(?![a-z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000118", () => {
  //   const target = "s1h1e i@s n3hal aka 3@drishti";
  //   let regex = /[a-z](?!\d)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000119", () => {
  //   const target = "s1h1e i@s n3hal aka 3@drishti";
  //   let regex = /(?<=\d)[a-z]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000120", () => {
  //   const target = "she i@1s n3hal aka 3@drishti";
  //   let regex = /(?<=[a-z])\d/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000121", () => {
  //   const target = "she i@1s n3hal aka 3@drishti";
  //   let regex = /(?<!\d)[a-z]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000122", () => {
  //   const target = "she i@1s n3hal aka 3@drishti";
  //   let regex = /(?<![a-z])\d/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000123", () => {
  //   const target = "she i@1s n3hal aka 3@drishti_";
  //   let regex = /_(?=\d)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000124", () => {
  //   const target = "she i@1s n3hal aka 3@drishti_";
  //   let regex = /_(?!\d)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000125", () => {
  //   const target = "she i@1s n3hal aka 3@drishti_";
  //   let regex = /(\d)(?=[a-z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000126", () => {
  //   const target = "she i@1 n3hal aka 3@drishti_";
  //   let regex = /(\d)(?=[a-z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000127", () => {
  //   const target = "she i@1 n3hal aka 3@drishti_";
  //   let regex = /([a-z])(?=\d)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000128", () => {
  //   const target = "she i@1a n3hal aka 3@drishti_";
  //   let regex = /(\d)(?![a-z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000129", () => {
  //   const target = "s1h1e1 i@1a n3hal aka 3@drishti_";
  //   let regex = /([a-z])(?!\d)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000130", () => {
  //   const target = "s1ha1e1 i@1a n3habl aka 3@drishti_";
  //   let regex = /a(?=(b))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000131", () => {
  //   const target = "s1ha1eb1 i@1ba n3habl aka 3@drishti_";
  //   let regex = /(?<=(a))b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000132", () => {
  //   const target = "shaeb1 i12@1ba n3habl aka 3@drishti_";
  //   let regex = /(\d)(?=(\w))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000133", () => {
  //   const target = "shaeb$1 @1@1ba n3habl aka 3@drishti_";
  //   let regex = /(?<=(\w))(\d)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000134", () => {
  //   const target = "shaeb$1 @1@1ba n3habl a9nOv 3@drishti_";
  //   let regex = /\d(?=[a-z])(?=[a-z][A-Z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000135", () => {
  //   const target = "shaeb$1 @1@1ba n3habl z9NOv 3@drishti_";
  //   let regex = /[a-z](?=\d)(?=\d[A-Z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000136", () => {
  //   const target = "shaeb$1 @1@1ba n3habl z9NOv 3@drishti_";
  //   let regex = /(\w)(?=(\d))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000137", () => {
  //   const target = "shaeb$1 @1@1ba n3habl z9N2o08v 3@drishti_";
  //   let regex = /(?<=(\d))(\w)(?=(\d))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000138", () => {
  //   const target = "shaeb$1 @1@1ba n3habl z9NOv 3@drishti_";
  //   let regex = /(?<=(\w))(\d)(?=(\w))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000139", () => {
  //   const target = "shaeb$ @1A@1ba n3#habl z9NOv 3@drishti_";
  //   let regex = /\d(?![a-z])(?![A-Z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000140", () => {
  //   const target = "shaeb$ @1A@1ba n3#1hAbl z9NOv 3@drishti_";
  //   let regex = /(?<=\d)[a-z](?=[A-Z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000141", () => {
  //   const target = "shaeb$ @1A@1ba n3#1hAbl z9NOv 3@drishti_";
  //   let regex = /(?<=[a-z])\d(?=[A-Z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000142", () => {
  //   const target = "shaeb$ @1A@1ba n3#1hAbl z9NOv 3@drishti_";
  //   let regex = /(?<!\d)[a-z](?![A-Z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000143", () => {
  //   const target = "shaeb$ @1A@1ba n3#1hAbl z9NOv 3@drishti_";
  //   let regex = /(?<![a-z])\d(?![A-Z])/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Groups cases: Case0000000000000000000000000144", () => {
  //   const target = "shaeb$ @1A@1ba 3@drishti_nehal_2008";
  //   let regex = /(?<=_)nehal(?=_)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case000000000000000000000000001", () => {
  //   const target =
  //     "nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   let regex = /^nehal/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case000000000000000000000000002", () => {
  //   const target = "A girl named nehal";
  //   let regex = /nehal$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case000000000000000000000000003", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal";
  //   let regex = /^nehal$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case000000000000000000000000004", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "A girl named nehal";
  //   let regex = /^nehal$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case000000000000000000000000005", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "A girl named nehal";
  //   let regex = /^$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case000000000000000000000000006", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "";
  //   let regex = /^$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case000000000000000000000000007", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "n";
  //   let regex = /n^$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case000000000000000000000000008", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "n";
  //   let regex = /^$n/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case000000000000000000000000009", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal";
  //   let regex = /neh^$al/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000010", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "n\n";
  //   let regex = /n^$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000011", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "n\n";
  //   let regex = /^$n/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000012", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "neh\nal";
  //   let regex = /neh^$al/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000013", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal\n$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000014", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal\n^$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000015", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal^$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000016", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal\n^$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000017", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal\n$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000018", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal\n^/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000019", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal\n$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000020", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000021", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal\n^/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000022", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal\n$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000023", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000024", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal\n^/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000025", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal$\n/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000026", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal$\n$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000027", () => {
  //   // const target =
  //   //   "A girl named nehal, born on 09 Nov 2008, A straight forward fierce girl.";
  //   const target = "nehal\n";
  //   let regex = /nehal$\n^$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000028", () => {
  //   console.log(
  //     "----------------------------------------------hi----------------------------------------------",
  //   );
  //   const target = "cat dog";
  //   let regex = /^cat/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000029", () => {
  //   const target = "cat dog";
  //   let regex = /^dog/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000030", () => {
  //   const target = "cat dog";
  //   let regex = /dog$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000031", () => {
  //   const target = "cat dog";
  //   let regex = /cat$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000032", () => {
  //   const target = "hello";
  //   let regex = /^hello$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000033", () => {
  //   const target = "hello world";
  //   let regex = /^hello$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000034", () => {
  //   const target = "";
  //   let regex = /^$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000035", () => {
  //   const target = " ";
  //   let regex = /^$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000036", () => {
  //   const target = "abc";
  //   let regex = /^/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000037", () => {
  //   const target = "abc";
  //   let regex = /$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000038", () => {
  //   const target = "cat\ndog";
  //   let regex = /^dog/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000039", () => {
  //   const target = "cat\ndog";
  //   let regex = /^cat/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000040", () => {
  //   const target = "cat\ndog";
  //   let regex = /^bird/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000041", () => {
  //   const target = "cat\ndog";
  //   let regex = /^dog/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000042", () => {
  //   const target = "cat\ndog";
  //   let regex = /cat$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000043", () => {
  //   const target = "cat\ndog";
  //   let regex = /dog$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000044", () => {
  //   const target = "cat\ndog";
  //   let regex = /bird$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000045", () => {
  //   const target = "cat\ndog";
  //   let regex = /cat$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000046", () => {
  //   const target = "cat\ndog\nbird";
  //   let regex = /^dog$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000047", () => {
  //   const target = "cat\ndog\nbird";
  //   let regex = /^cat$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000048", () => {
  //   const target = "cat\ndog\nbird";
  //   let regex = /^bird$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000049", () => {
  //   const target = "cat\ndog\nbird";
  //   let regex = /^cow$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000050", () => {
  //   const target = "abc\n";
  //   let regex = /abc$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000051", () => {
  //   const target = "abc\rdef";
  //   let regex = /^def/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000052", () => {
  //   const target = "abc\tdef";
  //   let regex = /^def/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000053", () => {
  //   const target = "\n";
  //   let regex = /^$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000054", () => {
  //   const target = "\n\n";
  //   let regex = /^$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000055", () => {
  //   const target = "no\nyes\nmaybe";
  //   let regex = /^yes$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000056", () => {
  //   const target = "no\nyes\nmaybe";
  //   let regex = /^yes$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Anchors cases: Case0000000000000000000000000057", () => {
  //   const target = "a\nb\nc";
  //   let regex = /^a$/m;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case0000000000000000000000000001", () => {
  //   const target = "axcbedilr!nedr9iunihcollb";
  //   let regex = /[^axcbedilr!n\do]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case0000000000000000000000000002", () => {
  //   const target = "abcabcdabc";
  //   let regex = /[^abc]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case0000000000000000000000000003", () => {
  //   const target = "aaa";
  //   let regex = /[^a]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case0000000000000000000000000004", () => {
  //   const target = "abc";
  //   let regex = /[^a]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case0000000000000000000000000005", () => {
  //   const target = "abc";
  //   let regex = /[^abc]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case0000000000000000000000000006", () => {
  //   const target = "abcd";
  //   let regex = /[^abc]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case0000000000000000000000000007", () => {
  //   const target = "A";
  //   let regex = /[^a-z]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case0000000000000000000000000008", () => {
  //   const target = "m";
  //   let regex = /[^a-z]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case0000000000000000000000000009", () => {
  //   const target = "5";
  //   let regex = /[^0-9]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000010", () => {
  //   const target = "5a";
  //   let regex = /[^0-9]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000011", () => {
  //   const target = "c";
  //   let regex = /^[^\n]$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000012", () => {
  //   const target = "\n";
  //   let regex = /^[^\n]$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000013", () => {
  //   const target = "abc";
  //   let regex = /^[^\n]$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000014", () => {
  //   const target = "abc";
  //   let regex = /[^]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000015", () => {
  //   const target = "";
  //   let regex = /[^]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000016", () => {
  //   const target = " ";
  //   let regex = /[^ ]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000017", () => {
  //   const target = "abc";
  //   let regex = /a[^ ]c/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000018", () => {
  //   const target = "\t";
  //   let regex = /[^ ]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000019", () => {
  //   const target = "^";
  //   let regex = /[^^]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000020", () => {
  //   const target = "a";
  //   let regex = /[^^]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000021", () => {
  //   const target = "d";
  //   let regex = /^[^abc]$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000022", () => {
  //   const target = "de";
  //   let regex = /^[^abc]$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000023", () => {
  //   const target = "c";
  //   let regex = /^[^ab]$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000024", () => {
  //   const target = "é";
  //   let regex = /[^a-z]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000025", () => {
  //   const target = "cab";
  //   let regex = /[^abc]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000026", () => {
  //   const target = "cabd";
  //   let regex = /[^abc]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000027", () => {
  //   const target = "-";
  //   let regex = /[^-]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000028", () => {
  //   const target = "_";
  //   let regex = /[^-]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000029", () => {
  //   const target = "^_";
  //   let regex = /[-^]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000030", () => {
  //   const target = "$";
  //   let regex = /[-^]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000031", () => {
  //   const target = "7";
  //   let regex = /[^\d]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000032", () => {
  //   const target = "x";
  //   let regex = /[^\d]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000033", () => {
  //   const target = "7x";
  //   let regex = /[^\d]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000034", () => {
  //   const target = "_";
  //   let regex = /[^\w]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000035", () => {
  //   const target = "-";
  //   let regex = /[^\w]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000036", () => {
  //   const target = " ";
  //   let regex = /[^\w]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000037", () => {
  //   const target = "\n";
  //   let regex = /[^\s]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000038", () => {
  //   const target = "\t";
  //   let regex = /[^\s]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000039", () => {
  //   const target = "A";
  //   let regex = /[^\s]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000040", () => {
  //   const target = "\n";
  //   let regex = /[^\n]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000041", () => {
  //   const target = "\r";
  //   let regex = /[^\n]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000042", () => {
  //   const target = " ";
  //   let regex = /[^\t]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000043", () => {
  //   const target = "\n";
  //   let regex = /[^\r]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000044", () => {
  //   const target = "A";
  //   let regex = /[^\b]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000045", () => {
  //   const target = "\b";
  //   let regex = /[^\b]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000046", () => {
  //   const target = "]";
  //   let regex = /[^\]]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000047", () => {
  //   const target = "B";
  //   let regex = /[^\B]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000048", () => {
  //   const target = "c";
  //   let regex = /[^\B]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000049", () => {
  //   const target = "schwarz";
  //   let regex = /[[[a-z]--[aeiou]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000050", () => {
  //   const target = "schwarz";
  //   let regex = /[^[[a-z]--[aeiou]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000051", () => {
  //   const target = "def";
  //   let regex = /[^[[a-z]&&[def]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000052", () => {
  //   const target = "aef";
  //   let regex = /[^[[a-z]&&[def]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000053", () => {
  //   const target = "dof";
  //   let regex = /[^[[a-z]&&[def]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000054", () => {
  //   const target = "del";
  //   let regex = /[^[[a-z]&&[def]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000055", () => {
  //   const target = "ERC20v";
  //   let regex = /[^[[^a-z]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000056", () => {
  //   const target = "ercV";
  //   let regex = /[^[[a-z]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000057", () => {
  //   const target = "NEH2L";
  //   let regex = /[^[[^a-z]--[0-9]--[A-Z]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000058", () => {
  //   const target = "_$,";
  //   let regex = /[^[[^a-z]--[0-9]--[A-Z]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000059", () => {
  //   const target = "_$a,";
  //   let regex = /[^[[^a-z]--[0-9]--[A-Z]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000060", () => {
  //   const target = "_$A,";
  //   let regex = /[^[[^a-z]--[0-9]--[A-Z]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000061", () => {
  //   const target = "_$4,";
  //   let regex = /[^[[^a-z]--[0-9]--[A-Z]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000062", () => {
  //   const target = "THEIRRATIONAL1";
  //   let regex = /[^[[^a-z]--[0-9]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000063", () => {
  //   const target = "tTHEIRRATIONALONE";
  //   let regex = /[^[[^a-z]--[0-9]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000064", () => {
  //   const target = "THEiRRATIONAL1";
  //   let regex = /[^[[^a-z]--[0-9]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000065", () => {
  //   const target = "THEIRRATIONALONe";
  //   let regex = /[^[[^a-z]--[0-9]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000066", () => {
  //   const target = "THEIRRATIONAL_oN|";
  //   let regex = /[^[[^a-z]--[0-9]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000067", () => {
  //   const target = "THEIRRATIONAL_oN|";
  //   let regex = /[^]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000068", () => {
  //   const target = "abcxyz";
  //   let regex = /[^[[abc][xyz]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000069", () => {
  //   const target = "abcuxyz";
  //   let regex = /[^[[abc][xyz]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000070", () => {
  //   const target = "abcxyz_";
  //   let regex = /[^[[abc][xyz]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000071", () => {
  //   const target = "a\nbcxyz";
  //   let regex = /[^[[abc][xyz]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000072", () => {
  //   const target = "aBcxyz";
  //   let regex = /[^[[abc][xyz]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000073", () => {
  //   const target = "aerecx234yZ";
  //   let regex = /[[^a-z]&&[^0-9]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000074", () => {
  //   const target = "aerec-x234yz";
  //   let regex = /[[^a-z]&&[^0-9]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000075", () => {
  //   const target = "@aerecx234yz";
  //   let regex = /[[^a-z]&&[^0-9]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000076", () => {
  //   const target = "aerecx234yz";
  //   let regex = /[[^a-z]&&[^0-9]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000077", () => {
  //   const target = "nehal_as_known_as_DRISHTI";
  //   let regex = /[[^a-z]&&[A-Z]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000078", () => {
  //   const target = "nehal_as_known_as_DRISHTI";
  //   let regex = /[[^a-z]&&[a-z]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000079", () => {
  //   const target = "abcxyz";
  //   let regex = /[[^abc]--[xyz]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000080", () => {
  //   const target = "abc-xyz";
  //   let regex = /[[^abc]--[xyz]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000081", () => {
  //   const target = "ABc-xyz";
  //   let regex = /[^[[^abc]--[xyz]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000082", () => {
  //   const target = "ABC-XYz";
  //   let regex = /[^[[^abc]--[xyz]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000083", () => {
  //   const target = "129589";
  //   let regex = /[^[[0-9]--[5]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000084", () => {
  //   const target = "12346789";
  //   let regex = /[^[[0-9]--[5]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000085", () => {
  //   const target = "1234_6789";
  //   let regex = /[^[[0-9]--[5]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000086", () => {
  //   const target = "nopar";
  //   let regex = /[^[[a-z]&&[m-z]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000087", () => {
  //   const target = "spdxLicense";
  //   let regex = /[^[[a-z]&&[^aeiou]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000088", () => {
  //   const target = "spd*license";
  //   let regex = /[^[[a-z]&&[^aeiou]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000089", () => {
  //   const target = "SPDX_LICENSE";
  //   let regex = /[^[[^a-z]&&[^0-9]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000090", () => {
  //   const target = "PRAGMA SOLIDITY ^0.8.20";
  //   let regex = /[^[[^a-z]&&[^0-9]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000091", () => {
  //   const target = "PRAGMA SOLIDITY =dEaD";
  //   let regex = /[^[[^a-z]&&[^0-9]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Character class negation: Case00000000000000000000000000092", () => {
  //   const target = "PRAGMASOLIDITYDEAD";
  //   let regex = /[^[[^a-z]&&[A-Z]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Character class negation: Case00000000000000000000000000093", () => {
  //   const target = "PRAGMASOLIDITY=dEaD";
  //   let regex = /[^[[^a-z]&&[A-Z]]]/v;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // @NOTE: Js regex targets pattern to match with current index char
  // if no match found then resets back to current index and tries to match with alternation pattern.
  // Solidity, on the other hand, targets string with current pattern and if no match found then moves to next alternation pattern

  // test("Pattern match Alternation anchor: Case00000000000000000000000000001", () => {
  //   const target = "cadocardogrind";
  //   let regex = /cat|dog/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case00000000000000000000000000002", () => {
  //   const target = "grey";
  //   let regex = /gr(a|e)y/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case00000000000000000000000000003", () => {
  //   const target = "caterpillar";
  //   let regex = /cat|caterpillar/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case00000000000000000000000000004", () => {
  //   const target = "caterpillar";
  //   let regex = /caterpillar|cat/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case00000000000000000000000000005", () => {
  //   const target = "anything";
  //   let regex = /cat|/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case00000000000000000000000000006", () => {
  //   const target = "anycolorButgreenandred";
  //   let regex = /red|green|blue/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case00000000000000000000000000007", () => {
  //   const target = "anycolorButyellow,blue,greenandpurple";
  //   let regex = /red|green|blue/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case00000000000000000000000000008", () => {
  //   const target = "anycolorButyellow,blueandpurple";
  //   let regex = /red|green|blue/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case00000000000000000000000000009", () => {
  //   const target = "anycolorButbluegreenandredish";
  //   let regex = /red|green|blue/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000010", () => {
  //   const target = "catsarebetterthandogs";
  //   let regex = /^cat|dog$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000011", () => {
  //   const target = "catsarebetterthanrats";
  //   let regex = /^cat|dog$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000012", () => {
  //   const target = "wolfsarebetterthandog";
  //   let regex = /^cat|dog$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000013", () => {
  //   const target = "humansarebetterthandogsandcat";
  //   let regex = /^cat|dog$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000014", () => {
  //   const target = "yes123";
  //   let regex = /^yes|no$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000015", () => {
  //   const target = "123no";
  //   let regex = /^yes|no$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000016", () => {
  //   const target = "yesno";
  //   let regex = /^yes|no$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000017", () => {
  //   const target = "abcno";
  //   let regex = /^yes|no$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000018", () => {
  //   const target = "yesabc";
  //   let regex = /^yes|no$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000019", () => {
  //   const target = "abd";
  //   let regex = /a(b|c)d/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000020", () => {
  //   const target = "acd";
  //   let regex = /a(b|c)d/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000021", () => {
  //   const target = "ab";
  //   let regex = /(ab|a)b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000022", () => {
  //   const target = "b";
  //   let regex = /(a)|(b)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000023", () => {
  //   const target = "xy";
  //   let regex = /(x(y))|(a(b(c)))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000024", () => {
  //   const target = "green";
  //   let regex = /(?<r>red)|(?<g>green)|(?<b>blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000025", () => {
  //   const target = "pacmen";
  //   let regex = /(?<x>a)|(?<x>b)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000026", () => {
  //   const target = "ba";
  //   let regex = /(a)|(b)\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000027", () => {
  //   const target = "ccdbccbbd";
  //   let regex = /(a)|(b)\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000028", () => {
  //   const target = "bird_cat-dog";
  //   let regex = /(^cat)|(dog$)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000029", () => {
  //   const target = "aac";
  //   let regex = /(a|b)c/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000030", () => {
  //   const target = "abzbcc";
  //   let regex = /(a|b)c/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000031", () => {
  //   const target = "abzbqb";
  //   let regex = /(a|b)c/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000032", () => {
  //   const target = "abzxybqb";
  //   let regex = /x(y|z)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000033", () => {
  //   const target = "abzbqbxz";
  //   let regex = /x(y|z)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000034", () => {
  //   const target = "abzbqbxy";
  //   let regex = /x(y|z)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000035", () => {
  //   const target = "abzxzbqb";
  //   let regex = /x(y|z)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000036", () => {
  //   const target = "xzabzbqb";
  //   let regex = /x(y|z)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000037", () => {
  //   const target = "xxabzbqby";
  //   let regex = /x(y|z)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000038", () => {
  //   const target = "xxabzbqbz";
  //   let regex = /x(y|z)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000039", () => {
  //   const target = "yxabzbqbz";
  //   let regex = /x(y|z)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000040", () => {
  //   const target = "prefixed";
  //   let regex = /(pre|post)fix/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000041", () => {
  //   const target = "postfixed";
  //   let regex = /(pre|post)fix/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000042", () => {
  //   const target = "plusfixed";
  //   let regex = /(pre|post)fix/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000043", () => {
  //   const target = "superprefix";
  //   let regex = /(pre|post)fix/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000044", () => {
  //   const target = "superpostfix";
  //   let regex = /(pre|post)fix/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000045", () => {
  //   const target = "superposterprefix";
  //   let regex = /(pre|post)fix/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000046", () => {
  //   const target = "goonsaredogs";
  //   let regex = /|dog/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000047", () => {
  //   const target = "dogsaregoons";
  //   let regex = /|dog/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000048", () => {
  //   const target = "";
  //   let regex = /|dog/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000049", () => {
  //   const target = "cats_are_cutest";
  //   let regex = /|dog/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000050", () => {
  //   const target = "dogs_are_loyal";
  //   let regex = /cat||dog/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000051", () => {
  //   const target = "dogs_are_loyal";
  //   let regex = /cat||dog/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000052", () => {
  //   const target = "monkeys_are_crazy";
  //   let regex = /cat||dog/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000053", () => {
  //   const target = "monkeys_are_craxy_beings";
  //   let regex = /(a|b)|(x|y)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000054", () => {
  //   const target = "monkeys_or_birds_r_crxy_beings";
  //   let regex = /(a|b)|(x|y)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000055", () => {
  //   const target = "monkeys_do_flex";
  //   let regex = /(a|b)|(x|y)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000056", () => {
  //   const target = "monkeys_r_fuzzing";
  //   let regex = /(a|b)|(x|y)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000057", () => {
  //   const target = "monkees_r_fuzzing";
  //   let regex = /(a|b)|(x|y)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000058", () => {
  //   const target = "monkeys_and_cats_are_fighting";
  //   let regex = /((cat|dog)|bird)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000059", () => {
  //   const target = "monkeys_and_dogs_are_fighting";
  //   let regex = /((cat|dog)|bird)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000060", () => {
  //   const target = "why_birds_are_chirping";
  //   let regex = /((cat|dog)|bird)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000061", () => {
  //   const target = "t-rex_is_dangerous";
  //   let regex = /((cat|dog)|bird)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000062", () => {
  //   const target = "t-red_is_dangerous";
  //   let regex = /(red)|(blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000063", () => {
  //   const target = "color-blue_is_dangerous";
  //   let regex = /(red)|(blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000064", () => {
  //   const target = "colors-blue_and_red_are_decent_ones";
  //   let regex = /(red)|(blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000065", () => {
  //   const target = "color-black_is_phenomenal_one";
  //   let regex = /(red)|(blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000066", () => {
  //   const target = "color-black_is_phenomenal_one";
  //   let regex = /(a(b|c))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000067", () => {
  //   const target = "color-blake_is_absolute_phenomenal_one";
  //   let regex = /(a(b|c))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000068", () => {
  //   const target = "color-black_is_the_sexzy_one";
  //   let regex = /((x|y)z)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000069", () => {
  //   const target = "the_boyz_webseries_is_crazyyy";
  //   let regex = /((x|y)z)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000070", () => {
  //   const target = "color-black_is_the_sexy_one";
  //   let regex = /((x|y)z)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000071", () => {
  //   const target = "color-red_is_the_happiest_one";
  //   let regex = /(?<color>red|blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000072", () => {
  //   const target = "color-blue_is_the_enigmatic";
  //   let regex = /(?<color>red|blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000073", () => {
  //   const target = "color-blue_is_the_enigmatic_than_red";
  //   let regex = /(?<color>red|blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000074", () => {
  //   const target = "color-black_is_shows_seriousness";
  //   let regex = /(?<color>red|blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000075", () => {
  //   const target = "color-black_is_shows_seriousness";
  //   let regex = /(?<x>a)|(?<y>b)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000076", () => {
  //   const target = "color-blck_is_shows_seriousness";
  //   let regex = /(?<x>a)|(?<y>b)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000077", () => {
  //   const target = "color-lck_is_shows_seriousness";
  //   let regex = /(?<x>a)|(?<y>b)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000078", () => {
  //   const target = "color-caty_black_shows_seriousness";
  //   let regex = /(cat)|(dog)\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000079", () => {
  //   const target = "color-catcaty_black_shows_seriousness";
  //   let regex = /(cat)|(dog)\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000080", () => {
  //   const target = "color-dogy_black_shows_seriousness";
  //   let regex = /(cat)|(dog)\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000081", () => {
  //   const target = "color-dogdogy_black_shows_seriousness";
  //   let regex = /(cat)|(dog)\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000082", () => {
  //   const target = "color-birdish_blue_shows_seriousness";
  //   let regex = /(cat)|(dog)\1/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000083", () => {
  //   const target = "color-catish_blue_shows_seriousness";
  //   let regex = /(?=cat|dog)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000084", () => {
  //   const target = "color-carish_blue_shows_dogseriousness";
  //   let regex = /(?=cat|dog)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });

  // test("Pattern match Alternation anchor: Case000000000000000000000000000085", () => {
  //   const target = "color-carish_blue_shows_seriousness";
  //   let regex = /(?=cat|dog)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000086", () => {
  //   const target = "yescolor-carish_blue_shows_seriousness";
  //   let regex = /(?!yes)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000087", () => {
  //   const target = "yescolor-carMrish_blue_shows_seriousness";
  //   let regex = /(?<=Mr|Dr)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000088", () => {
  //   const target = "yescolor-carMrish_blue_shows_seriousness";
  //   let regex = /(?<!cat|dog)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000089", () => {
  //   const target = "catcolor-carMrish_blue_shows_seriousness";
  //   let regex = /(?<!cat|dog)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000090", () => {
  //   const target = "AMAN IS NEHAL'S UNCLE";
  //   let regex = /[a-z]|[0-9]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000091", () => {
  //   const target = "AMAN IS NEHAL'$ UNCLE";
  //   let regex = /[a-z]|[0-9]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000092", () => {
  //   const target = "AMAN IS NEHaL'S UNCLE";
  //   let regex = /[a-z]|[0-9]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000093", () => {
  //   const target = "AMAN IS NEHAL'S UNCLE AND NEHAL HAS 2 TOTAL UNCLES";
  //   let regex = /[a-z]|[0-9]/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000094", () => {
  //   const target = "aman is nehal's uncle";
  //   let regex = /[A-Z]|_/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000095", () => {
  //   const target = "aman is Nehal's uncle";
  //   let regex = /[A-Z]|_/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000096", () => {
  //   const target = "aman is nehal's_uncle";
  //   let regex = /[A-Z]|_/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000097", () => {
  //   const target = "aman is nehal's_uncle";
  //   let regex = /猫|犬/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000098", () => {
  //   const target = "aman is 猫 nehal's_uncle";
  //   let regex = /猫|犬/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case000000000000000000000000000099", () => {
  //   const target = "aman is 犬 nehal's_uncle";
  //   let regex = /猫|犬/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000100", () => {
  //   const target = "aman is nehal's_uncle";
  //   let regex = /α|β/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000101", () => {
  //   const target = "aman is α nehal's_uncle";
  //   let regex = /α|β/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000102", () => {
  //   const target = "aman is β nehal's_uncle";
  //   let regex = /α|β/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000103", () => {
  //   const target = "aman is nehal's_uncle";
  //   let regex = /😀|🔥/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000104", () => {
  //   const target = "aman is 😀 nehal's_uncle";
  //   let regex = /😀|🔥/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000105", () => {
  //   const target = "aman is 🔥 nehal's_uncle";
  //   let regex = /😀|🔥/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000106", () => {
  //   const target = "aman is nehal's_uncle";
  //   let regex = /🚀|🌙/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000107", () => {
  //   const target = "aman is 🚀 nehal's_uncle";
  //   let regex = /🚀|🌙/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000108", () => {
  //   const target = "aman is 🌙 nehal's_uncle";
  //   let regex = /🚀|🌙/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000109", () => {
  //   const target = "aman is nehal's_uncle";
  //   let regex = /\n|\t/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000110", () => {
  //   const target = "aman is \n nehal's_uncle";
  //   let regex = /\n|\t/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000111", () => {
  //   const target = "aman is \t nehal's_uncle";
  //   let regex = /\n|\t/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000112", () => {
  //   const target = "aman is nehal's_uncle";
  //   let regex = /\.|,/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000113", () => {
  //   const target = "aman is . nehal's_uncle";
  //   let regex = /\.|,/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000114", () => {
  //   const target = "aman is , nehal's_uncle";
  //   let regex = /\.|,/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000115", () => {
  //   const target = "nehal is like a _cat_ most of the time she seems excited & passioinated";
  //   let regex = /\bcat\b|\bdog\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000116", () => {
  //   const target = "nehal is like a cat and aman is like a dog haha";
  //   let regex = /\bcat\b|\bdog\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000117", () => {
  //   const target = "nehal is like a cat most of the time she seems excited & passioinated";
  //   let regex = /\bcat\b|\bdog\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000118", () => {
  //   const target = "aman is like a _dog_ he always finds ways to drink and walk around the hood";
  //   let regex = /\bcat\b|\bdog\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000119", () => {
  //   const target = "aman is like a dog he always finds ways to drink and walk around the hood";
  //   let regex = /\bcat\b|\bdog\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000120", () => {
  //   const target = "Neh@l is @ Cute Girl";
  //   let regex = /(a|(b|c))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000121", () => {
  //   const target = "Nehal is a Cute Girl";
  //   let regex = /(a|(b|c))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000122", () => {
  //   const target = "Nehal is a cute Girl but she lacks a bit of attitude";
  //   let regex = /(a|(b|c))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000123", () => {
  //   const target = "Neh@l is @ Cute Girl but she l@cks @ bit of Attitude";
  //   let regex = /(a|(b|c))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000124", () => {
  //   const target = "Neh@l is @ cute Girl But she l@cks @ Bit of @ttitude";
  //   let regex = /(a|(b|c))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000125", () => {
  //   const target = "Neh@l is @CuteGirl,BuDDy";
  //   let regex = /(a|(b|(c|d)))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000126", () => {
  //   const target = "Nehal is a cute Girl and she is beautiful too";
  //   let regex = /(a|(b|(c|d)))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000127", () => {
  //   const target = "Neh@l is @b Cute Girl @nD";
  //   let regex = /(a|(b|(c|d)))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000128", () => {
  //   const target = "Neh@l is @ cute Girl @nD she is Be@utiful too";
  //   let regex = /(a|(b|(c|d)))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000129", () => {
  //   const target = "Neh@l is @ Cute Girl @nd she is Be@utiful too";
  //   let regex = /(a|(b|(c|d)))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000130", () => {
  //   const target = "CatsDogsBirdsFishes";
  //   let regex = /(?=(cat|dog)|(bird|fish))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000131", () => {
  //   const target = "cats are cute, Dogs are loyal, Birds are innocent and Fishes are tasty.";
  //   let regex = /(?=(cat|dog)|(bird|fish))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000132", () => {
  //   const target = "Cats are cute, dogs are loyal, Birds are innocent and Fishes are tasty.";
  //   let regex = /(?=(cat|dog)|(bird|fish))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000133", () => {
  //   const target = "CatsDogsbirds";
  //   let regex = /(?=(cat|dog)|(bird|fish))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000134", () => {
  //   const target = "CatsDogsBirdsfishes";
  //   let regex = /(?=(cat|dog)|(bird|fish))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000135", () => {
  //   const target = "catsdogsbirdsfishes";
  //   let regex = /(a|)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000136", () => {
  //   const target = "c@tsdogsbirdsfishes";
  //   let regex = /(a|)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000137", () => {
  //   const target = "catsdogsbirdsfishes";
  //   let regex = /(|b)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000138", () => {
  //   const target = "catsdogsBirdsfishes";
  //   let regex = /(|b)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000139", () => {
  //   const target = "ab";
  //   let regex = /\b(a|b)\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000140", () => {
  //   const target = "a b";
  //   let regex = /\b(a|b)\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000141", () => {
  //   const target = "_b_";
  //   let regex = /\b(a|b)\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000142", () => {
  //   const target = "b a";
  //   let regex = /\b(a|b)\b/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000143", () => {
  //   const target = "parrotwolf";
  //   let regex = /(?:cat|dog)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000144", () => {
  //   const target = "parcatrot";
  //   let regex = /(?:cat|dog)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000145", () => {
  //   const target = "pardogrot";
  //   let regex = /(?:cat|dog)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000146", () => {
  //   const target = "i'llsaynothing";
  //   let regex = /(?:yes|no)maybe/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000147", () => {
  //   const target = "i'llsayyesmaybethatisright";
  //   let regex = /(?:yes|no)maybe/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000148", () => {
  //   const target = "i'llsaynomaybethatisright";
  //   let regex = /(?:yes|no)maybe/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000149", () => {
  //   const target = "start";
  //   let regex = /start(cat|dog)end/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000150", () => {
  //   const target = "startcatend";
  //   let regex = /start(cat|dog)end/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000151", () => {
  //   const target = "startdogend";
  //   let regex = /start(cat|dog)end/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000152", () => {
  //   const target = "xzy";
  //   let regex = /x(a|b)y/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000153", () => {
  //   const target = "xay";
  //   let regex = /x(a|b)y/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000154", () => {
  //   const target = "xby";
  //   let regex = /x(a|b)y/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000155", () => {
  //   const target = "zzz";
  //   let regex = /(a|b)(x|y)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000156", () => {
  //   const target = "abaxa";
  //   let regex = /(a|b)(x|y)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000157", () => {
  //   const target = "abaya";
  //   let regex = /(a|b)(x|y)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000158", () => {
  //   const target = "abxya";
  //   let regex = /(a|b)(x|y)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000159", () => {
  //   const target = "abya";
  //   let regex = /(a|b)(x|y)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000160", () => {
  //   const target = "CatRedDogBlue";
  //   let regex = /(cat|dog)(red|blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000161", () => {
  //   const target = "catredDogBlue";
  //   let regex = /(cat|dog)(red|blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000162", () => {
  //   const target = "catblueDogRed";
  //   let regex = /(cat|dog)(red|blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000163", () => {
  //   const target = "CatBluedogred";
  //   let regex = /(cat|dog)(red|blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000164", () => {
  //   const target = "CatBluedogblue";
  //   let regex = /(cat|dog)(red|blue)/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000165", () => {
  //   const target = "StartTheEnd";
  //   let regex = /^start|end$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000166", () => {
  //   const target = "startTheEnd";
  //   let regex = /^start|end$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000167", () => {
  //   const target = "StartTheend";
  //   let regex = /^start|end$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000168", () => {
  //   const target = "starttheend";
  //   let regex = /^start|end$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000169", () => {
  //   const target = "start";
  //   let regex = /^start|end$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000170", () => {
  //   const target = "end";
  //   let regex = /^start|end$/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000171", () => {
  //   const target = "cd";
  //   let regex = /(a)|(b)\\2/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000172", () => {
  //   const target = "cda";
  //   let regex = /(a)|(b)\\2/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000173", () => {
  //   const target = "cdb";
  //   let regex = /(a)|(b)\\2/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000174", () => {
  //   const target = "CatDogBirdFish";
  //   let regex = /((cat|dog)|(bird|fish))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), false);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000175", () => {
  //   const target = "catdogbirdfish";
  //   let regex = /((cat|dog)|(bird|fish))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000176", () => {
  //   const target = "Catdogbirdfish";
  //   let regex = /((cat|dog)|(bird|fish))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000177", () => {
  //   const target = "CatDogbirdfish";
  //   let regex = /((cat|dog)|(bird|fish))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000178", () => {
  //   const target = "CatDogBirdfish";
  //   let regex = /((cat|dog)|(bird|fish))/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  // test("Pattern match Alternation anchor: Case0000000000000000000000000000179", () => {
  //   const target = "catX";
  //   let regex = /(?<!dog|bird)X/;
  //   console.log("output: ", target.match(regex));
  //   assert.strictEqual(regex.test(target), true);
  // });
  
  test("Pattern match quantifiers: Case000000000000000000000000000001", () => {
    const target = "nehaaaaaaaaaaal";
    let regex = /a+/;
    console.log("output: ", target.match(regex));
    assert.strictEqual(regex.test(target), true);
  });
  
  test("Pattern match quantifiers: Case000000000000000000000000000002", () => {
    const target = "nehaaaaaaaaaaal";
    let regex = /a+?/;
    console.log("output: ", target.match(regex));
    assert.strictEqual(regex.test(target), true);
  });
  
  test("Pattern match quantifiers: Case000000000000000000000000000003", () => {
    const target = "nehaaaaaaaaaaal";
    let regex = /a*/;
    console.log("output: ", target.match(regex));
    assert.strictEqual(regex.test(target), true);
  });
  
  test("Pattern match quantifiers: Case000000000000000000000000000004", () => {
    const target = "nehaaaaaaaaaaal";
    let regex = /a*?/;
    console.log("output: ", target.match(regex));
    assert.strictEqual(regex.test(target), true);
  });
  
  test("Pattern match quantifiers: Case000000000000000000000000000005", () => {
    const target = "nehaaaaaaaaaaal";
    let regex = /a?/;
    console.log("output: ", target.match(regex));
    assert.strictEqual(regex.test(target), true);
  });
  
  test("Pattern match quantifiers: Case000000000000000000000000000006", () => {
    const target = "nehaaaaaaaaaaal";
    let regex = /a??/;
    console.log("output: ", target.match(regex));
    assert.strictEqual(regex.test(target), true);
  });
  
  test("Pattern match quantifiers: Case000000000000000000000000000007", () => {
    const target = "nehaaaaaaaaaaal";
    let regex = /a{2}/;
    console.log("output: ", target.match(regex));
    assert.strictEqual(regex.test(target), true);
  });
  
  test("Pattern match quantifiers: Case000000000000000000000000000008", () => {
    const target = "nehaaaaaaaaaaal";
    let regex = /a{2}?/;
    console.log("output: ", target.match(regex));
    assert.strictEqual(regex.test(target), true);
  });
  
  test("Pattern match quantifiers: Case000000000000000000000000000009", () => {
    const target = "nehaaaaaaaaaaal";
    let regex = /a{2,}/;
    console.log("output: ", target.match(regex));
    assert.strictEqual(regex.test(target), true);
  });
  
  test("Pattern match quantifiers: Case0000000000000000000000000000010", () => {
    const target = "nehaaaaaaaaaaal";
    let regex = /a{2,}?/;
    console.log("output: ", target.match(regex));
    assert.strictEqual(regex.test(target), true);
  });
  
  test("Pattern match quantifiers: Case0000000000000000000000000000011", () => {
    const target = "nehaaaaaaaaaaal";
    let regex = /a{2,3}/;
    console.log("output: ", target.match(regex));
    assert.strictEqual(regex.test(target), true);
  });
  
  test("Pattern match quantifiers: Case0000000000000000000000000000012", () => {
    const target = "nehaaaaaaaaaaal";
    let regex = /a{2,3}?/;
    console.log("output: ", target.match(regex));
    assert.strictEqual(regex.test(target), true);
  });
};
testMain();
