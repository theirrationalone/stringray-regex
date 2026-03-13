import test from "node:test";
import assert from "node:assert";

const testMain = () => {
    test("Regex-Literals: Case1", () => {
        let regex = /a/;
        assert.strictEqual(regex.test("a"), true);
        regex = /b/;
        assert.strictEqual(regex.test("b"), true);
        regex = /1/;
        assert.strictEqual(regex.test("1"), true);
        regex = /_/;
        assert.strictEqual(regex.test("_"), true);
        regex = /€/;
        assert.strictEqual(regex.test("€"), true);
        regex = /क/;
        assert.strictEqual(regex.test("क"), true);
        regex = /あ/;
        assert.strictEqual(regex.test("あ"), true);
        regex = /😀/;
        assert.strictEqual(regex.test("😀"), true);

        // ...
        // ...U+10FFFF
        // Js supports upto U+10FFFF(1114111) characters.
    });

    test("Regex-Literals: Case2", () => {
        let regex = /abc/;
        assert.strictEqual(regex.test("abc"), true);

        regex = /hello/;
        assert.strictEqual(regex.test("hello"), true);

        regex = /123/;
        assert.strictEqual(regex.test("123"), true);

        regex = /anil/;
        assert.strictEqual(regex.test("anil"), true);

        regex = /😀🚀🔥/;
        assert.strictEqual(regex.test("😀🚀🔥"), true);

        regex = /hello/;
        assert.strictEqual(regex.test("hello"), true);

        regex = /abc123/;
        assert.strictEqual(regex.test("abc123"), true);

        regex = /कखग/;
        assert.strictEqual(regex.test("कखग"), true);
    });

    test("Regex-Literals: Case3", () => {
        let regex = /\^/;
        assert.strictEqual(regex.test("^"), true);

        regex = /\$/;
        assert.strictEqual(regex.test("$"), true);

        regex = /\./;
        assert.strictEqual(regex.test("."), true);

        regex = /\*/;
        assert.strictEqual(regex.test("*"), true);

        regex = /\+/;
        assert.strictEqual(regex.test("+"), true);

        regex = /\?/;
        assert.strictEqual(regex.test("?"), true);

        regex = /\(/;
        assert.strictEqual(regex.test("("), true);

        regex = /\)/;
        assert.strictEqual(regex.test(")"), true);

        regex = /\[/;
        assert.strictEqual(regex.test("["), true);

        regex = /\]/;
        assert.strictEqual(regex.test("]"), true);

        regex = /\{/;
        assert.strictEqual(regex.test("{"), true);

        regex = /\}/;
        assert.strictEqual(regex.test("}"), true);

        regex = /\|/;
        assert.strictEqual(regex.test("|"), true);

        regex = /\\/;
        assert.strictEqual(regex.test("\\"), true);
    });

    test("Regex-Literals: Case4", () => {
        let regex = /\x41/;
        assert.strictEqual(regex.test("A"), true);
    });

    test("Regex-Literals: Case5", () => {
        let regex = /\u0061/;
        assert.strictEqual(regex.test("a"), true);
    });

    test("Regex-Literals: Case6", () => {
        let regex = /\u{1F600}/u;
        assert.strictEqual(regex.test("😀"), true);
    });

    test("Regex-Literals: Case7", () => {
        let regex = /\n/;
        assert.strictEqual(regex.test("\n"), true);

        regex = /\r/;
        assert.strictEqual(regex.test("\r"), true);
        regex = /\t/;
        assert.strictEqual(regex.test("\t"), true);
        regex = /\v/;
        assert.strictEqual(regex.test("\v"), true);
        regex = /\f/;
        assert.strictEqual(regex.test("\f"), true);
        regex = /\0/;
        assert.strictEqual(regex.test("\0"), true);
    });

    test("Regex-Literals: Case8", () => {
        let regex = /\//;
        assert.strictEqual(regex.test("/"), true);
    });

    test("Regex-Literals: Case9", () => {
        // let regex = /a/b/;
        // assert.strictEqual(regex.test("a/b"), true);
    });

    test("Regex-Literals: Case10", () => {
        // let regex = /ab/\;
        // assert.strictEqual(regex.test("a/b"), true);
    });

    test("Regex-Literals: Case11", () => {
        // let regex = /\u{110000}/;
        // assert.strictEqual(regex.test("\u{110000}"), true);
    });

    // test("Regex-Literals: Case12", () => {
    //     let regex = /\c1/;
    //     assert.strictEqual(regex.test(""), true);
    // });

    test("Regex-Literals: Case13", () => {
        let regex = /\ugg/;
        assert.strictEqual(regex.test("ugg"), true);
    });

    test("Regex-Literals: Case14", () => {
        let regex = /./;
        const target = "anil";
        console.log("dot: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case15", () => {
        let regex = /\./;
        const target = ".anil";
        console.log("dot: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case16", () => {
        let regex = /\r./;
        const target = "\r.anil";
        console.log("dot: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case17", () => {
        // let regex = /{/u;
        let regex = /{/;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case18", () => {
        // let regex = /}/u;
        let regex = /}/;
        const target = ",}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case19", () => {
        // let regex = /1/u;
        let regex = /1/u;
        const target = "1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case20", () => {
        // let regex = /,/u;
        let regex = /,/u;
        const target = ",";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case21", () => {
        // let regex = /1,/u;
        let regex = /1,/u;
        const target = "1,";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case22", () => {
        // let regex = /1,2/;
        let regex = /1,2/;
        const target = "1,2";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case23", () => {
        // let regex = /2,1/;
        let regex = /2,1/;
        const target = "2,1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case24", () => {
        // let regex = /(/;
        let regex = /()/;
        const target = "(";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case25", () => {
        // let regex = /)/;
        let regex = /()/;
        const target = ")";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case26", () => {
        // let regex = /[acw/;
        let regex = /[]/u;
        const target = "[]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Regex-Literals: Case27", () => {
        // @BUG: throws bad error msg: SyntaxError: Invalid regular expression: /]/u: Lone quantifier brackets
        // should throw: SyntaxError: Invalid regular expression: /]/u: Unmatched ']'
        // or throw: SyntaxError: Invalid regular expression: /]/u: Lone Character class brackets
        // let regex = /]/u;
        let regex = /]/;
        const target = "]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case27a", () => {
        // @BUG: should throw error i.e., SyntaxError: Invalid regular expression: []: Empty Character class
        // let regex = /[]/u;
        let regex = /[]/;
        const target = "";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    // test("Regex-Literals: Case28", () => {
    //     // let regex = /[]/u;
    //     let regex = /?/;
    //     const target = "?";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals: Case29", () => {
        // let regex = /[]/u;
        let regex = /\?/;
        const target = "?";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals: Case30", () => {
    //     // let regex = /[]/u;
    //     let regex = /+/;
    //     const target = "+";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals: Case31", () => {
        // let regex = /[]/u;
        let regex = /\+/;
        const target = "+";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals: Case32", () => {
    //     // let regex = /[]/u;
    //     let regex = /\\+*/;
    //     const target = "\\\\*";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals: Case33", () => {
        // let regex = /[]/u;
        let regex = /\*/;
        const target = "*";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals: Case34", () => {
    //     // let regex = /[]/u;
    //     let regex = /a???/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals: Case35", () => {
        // let regex = /[]/u;
        let regex = /a??/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals: Case36", () => {
    //     // let regex = /[]/u;
    //     let regex = /a+??/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals: Case37", () => {
        // let regex = /[]/u;
        let regex = /a+?/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals: Case38", () => {
    //     // let regex = /[]/u;
    //     let regex = /a*??/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals: Case39", () => {
        // let regex = /[]/u;
        let regex = /a*?/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals: Case40", () => {
        // let regex = /a^sian/;
        let regex = /asian/;
        const target = "asian";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case001", () => {
        let regex = /\08/;
        const target = "\x008";
        console.log("outputDigit: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case002", () => {
        // let regex = /\07/;
        // const target = "\u0007";
        let regex = /\107/;
        const target = "\u0047";
        // let regex = /(a)(a)(a)(a)(a)(a)(a)(a)(a)(z)(x)(c)\13/u;
        // const target = "aaaaaaaaazxc\x0b";
        // let regex = /[(\828)]/u;
        // const target = "\x01";
        // let regex = /\01/u;
        // const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case003", () => {
        // let regex = /\07/;
        // const target = "\u0007";
        let regex = /\377/;
        const target = "\u00FF";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case004", () => {
        let regex = /\400/;
        const target = "\u00200";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case005", () => {
        let regex = /\777/;
        const target = "\u003F7";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case006", () => {
        let regex = /\378/;
        const target = "\u001F8";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case007", () => {
        let regex = /\397/;
        const target = "\u000397";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case008", () => {
        // let regex = /a^sian/;
        let regex = /\a/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case009", () => {
        // let regex = /a^sian/;
        let regex = /\0/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case010", () => {
        // let regex = /a^sian/;
        let regex = /\00/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case011", () => {
        // let regex = /a^sian/;
        let regex = /\000/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case012", () => {
        // let regex = /a^sian/;
        let regex = /\08/;
        const target = "\x008";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case013", () => {
        // let regex = /a^sian/;
        let regex = /\008/;
        const target = "\x008";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case014", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\000/u;
    //     const target = "abba";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Regex-Literals-escape_seqs: Case015", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\118/u;
    //     const target = "abba";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Regex-Literals-escape_seqs: Case016", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\988/u;
    //     const target = "abba";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Regex-Literals-escape_seqs: Case017", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\0988/u;
    //     const target = "abba";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case018", () => {
        // let regex = /a^sian/;
        let regex = /\\a/;
        const target = "\\a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case019", () => {
        // let regex = /a^sian/;
        let regex = /\_/;
        const target = "_";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case020", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\_/u;
    //     const target = "_";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case021", () => {
        // let regex = /a^sian/;
        let regex = /\!/;
        const target = "!";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case022", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\!/u;
    //     const target = "!";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case023", () => {
        // let regex = /a^sian/;
        let regex = /\u{1F600}/;
        const target = "\\u{1F600}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case024", () => {
        // let regex = /a^sian/;
        let regex = /\u{1F600}/u;
        const target = "\u{1F600}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case025", () => {
        // let regex = /a^sian/;
        let regex = /\u/;
        const target = "u";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case026", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\u/u;
    //     const target = "u";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case027", () => {
        // let regex = /a^sian/;
        let regex = /\c/;
        const target = "c";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    // test("Regex-Literals-escape_seqs: Case028", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\c/u;
    //     const target = "c";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), false);
    // });

    test("Regex-Literals-escape_seqs: Case029", () => {
        // let regex = /a^sian/;
        let regex = /\cA/;
        const target = "\x01";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case030", () => {
        // let regex = /a^sian/;
        let regex = /\cA/u;
        const target = "\x01";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case031", () => {
        // let regex = /a^sian/;
        let regex = /\ca/;
        const target = "\x01";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case032", () => {
        // let regex = /a^sian/;
        let regex = /\ca/u;
        const target = "\x01";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case033", () => {
        // let regex = /a^sian/;
        let regex = /\c1/;
        const target = "c1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    // test("Regex-Literals-escape_seqs: Case034", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\c1/u;
    //     const target = "\x011";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Regex-Literals-escape_seqs: Case035", () => {
    //     let regex = /\u{23,20}/;
    //     const target = "uuuuu";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case036", () => {
        // let regex = /a^sian/;
        let regex = /\u{230,240}/;
        const target = "uuuuuuuuuu";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Regex-Literals-escape_seqs: Case037", () => {
        // let regex = /a^sian/;
        let regex = /\u{2}/;
        const target = "uuuuuuuuuu";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case038", () => {
        // let regex = /a^sian/;
        let regex = /\u{2,}/;
        const target = "uuuuuuuuuu";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case039", () => {
        // let regex = /a^sian/;
        let regex = /\u{,23335}/;
        const target = "u{,23335}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case040", () => {
        // let regex = /a^sian/;
        let regex = /\u{,}/;
        const target = "u{,}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case041", () => {
        // let regex = /a^sian/;
        let regex = /\u{}/;
        const target = "uuuuuuuuuu";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Regex-Literals-escape_seqs: Case042", () => {
        // let regex = /a^sian/;
        let regex = /\u{1}/;
        const target = "u";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case043", () => {
    //     // let regex = /a^sian/;
    //     let regex = /{1}/;
    //     const target = "uuuuuuuuuu";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case044", () => {
        // let regex = /a^sian/;
        let regex = /\u{1:1}/;
        const target = "u{1:1}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case045", () => {
        // let regex = /a^sian/;
        let regex = /\u1234/;
        const target = "\u1234";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case046", () => {
        // let regex = /a^sian/;
        let regex = /\u123/;
        const target = "u123";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case047", () => {
        // let regex = /a^sian/;
        let regex = /\u1234/u;
        const target = "\u1234";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case048", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\u123/u;
    //     const target = "u123";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case049", () => {
        // let regex = /a^sian/;
        let regex = /\u12345/;
        const target = "\u12345";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case050", () => {
        // let regex = /a^sian/;
        let regex = /\u1/;
        const target = "u1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case051", () => {
        // let regex = /a^sian/;
        let regex = /\u12/;
        const target = "u12";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case052", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\u1/u;
    //     const target = "u1";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Regex-Literals-escape_seqs: Case053", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\u12/u;
    //     const target = "u12";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Regex-Literals-escape_seqs: Case054", () => {
    //     // let regex = /a^sian/;
    //     let regex = /[abc/;
    //     const target = "[abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Regex-Literals-escape_seqs: Case055", () => {
    //     // let regex = /a^sian/;
    //     let regex = /(abc/;
    //     const target = "(abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Regex-Literals-escape_seqs: Case056", () => {
    //     // let regex = /a^sian/;
    //     let regex = /(?<1>a)/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Regex-Literals-escape_seqs: Case057", () => {
    //     // let regex = /a^sian/;
    //     let regex = /(?<a-b>a)/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case058", () => {
        // let regex = /a^sian/;
        let regex = /\k<a>/;
        const target = "k<a>";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case059", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\k<a>/u;
    //     const target = "k<a>";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case060", () => {
        // let regex = /a^sian/;
        let regex = /\p{L}/;
        const target = "p{L}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case061", () => {
        // let regex = /a^sian/;
        let regex = /\p{XYZ}/;
        const target = "p{XYZ}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case062", () => {
        // let regex = /a^sian/;
        let regex = /\p{L}/u;
        const target = "p{L}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case063", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\p{XYZ}/u;
    //     const target = "p{XYZ}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Regex-Literals-escape_seqs: Case064", () => {
    //     // let regex = /a^sian/;
    //     let regex = /{122222}/;
    //     const target = "{122222}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case065", () => {
        // let regex = /a^sian/;
        let regex = /{}/;
        const target = "{}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case066", () => {
    //     // let regex = /a^sian/;
    //     let regex = /{}/u;
    //     const target = "{}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case067", () => {
        // let regex = /a^sian/;
        let regex = /{/;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case068", () => {
    //     // let regex = /a^sian/;
    //     let regex = /{/u;
    //     const target = "{";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case069", () => {
        // let regex = /a^sian/;
        let regex = /{,11}/;
        const target = "{,11}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case070", () => {
    //     // let regex = /a^sian/;
    //     let regex = /{,11}/u;
    //     const target = "{,11}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case071", () => {
        // let regex = /a^sian/;
        let regex = /}/;
        const target = "}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case072", () => {
    //     // let regex = /a^sian/;
    //     let regex = /}/u;
    //     const target = "}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case073", () => {
        // let regex = /a^sian/;
        let regex = /1/;
        const target = "1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case074", () => {
        // let regex = /a^sian/;
        let regex = /1/u;
        const target = "1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case075", () => {
        // let regex = /a^sian/;
        let regex = /143242/;
        const target = "143242";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case076", () => {
        // let regex = /a^sian/;
        let regex = /143242/u;
        const target = "143242";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case077", () => {
        // let regex = /a^sian/;
        let regex = /1}/;
        const target = "1}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case078", () => {
    //     // let regex = /a^sian/;
    //     let regex = /1}/u;
    //     const target = "1}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case079", () => {
        // let regex = /a^sian/;
        let regex = /123424}/;
        const target = "123424}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case080", () => {
    //     // let regex = /a^sian/;
    //     let regex = /123424}/u;
    //     const target = "123424}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case081", () => {
        // let regex = /a^sian/;
        let regex = /1234,24/;
        const target = "1234,24";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case082", () => {
        // let regex = /a^sian/;
        let regex = /1234,24/u;
        const target = "1234,24";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case083", () => {
        // let regex = /a^sian/;
        let regex = /1234,24}/;
        const target = "1234,24}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case084", () => {
    //     // let regex = /a^sian/;
    //     let regex = /1234,24}/u;
    //     const target = "1234,24}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case085", () => {
        // let regex = /a^sian/;
        let regex = /\p{}/;
        const target = "p{}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case086", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\p{}/u;
    //     const target = "p{}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case087", () => {
        // let regex = /a^sian/;
        let regex = /\p{=LETTER}/;
        const target = "p{=LETTER}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case088", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\p{=LETTER}/u;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case089", () => {
        // let regex = /a^sian/;
        let regex = /\p{g=LETTER}/;
        const target = "p{g=LETTER}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Regex-Literals-escape_seqs: Case090", () => {
    //     // let regex = /a^sian/;
    //     let regex = /\p{g=LETTER}/u;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Regex-Literals-escape_seqs: Case091", () => {
        // let regex = /a^sian/;
        let regex = /\p{gc=Letter}/;
        const target = "p{gc=Letter}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case092", () => {
        // let regex = /a^sian/;
        let regex = /\p{gc=Letter}/u;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case0001", () => {
    //     let regex = /[]/;
    //     const target = "\x00";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case0002", () => {
    //     let regex = /[]/u;
    //     const target = "\x00";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case0003", () => {
        let regex = /[.]/;
        const target = ".";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case0004", () => {
        let regex = /[.]/u;
        const target = ".";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case0005", () => {
        let regex = /[abc123_,:;!@#%&()$^{}?+*/|"'<>=`~ ]/;
        const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case0006", () => {
        let regex = /[abc123_,:;!@#%&(){}?*+$^/|"'<>=`~ ]/u;
        const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case0006", () => {
    //     let regex = /raa/]df/;
    //     const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case0007", () => {
    //     let regex = /[abc/;
    //     const target = "[abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case0008", () => {
    //     let regex = /[abc/u;
    //     const target = "[abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case0009", () => {
        let regex = /[^]/;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00010", () => {
        let regex = /[^]/u;
        const target = "z";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00011", () => {
        let regex = /[a-z]/;
        const target = "q";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00012", () => {
        let regex = /[a-z]/u;
        const target = "q";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00013", () => {
    //     let regex = /[z-a]/;
    //     const target = "q";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00014", () => {
    //     let regex = /[z-a]/u;
    //     const target = "q";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00015", () => {
        let regex = /[a-\d]/;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00015", () => {
    //     let regex = /[\s-b]/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00016", () => {
    //     let regex = /[z-\d]/u;
    //     const target = "-";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00017", () => {
        let regex = /[\d-a]/;
        const target = "[\d-a]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00018", () => {
    //     let regex = /[\d-a]/u;
    //     const target = "[\d-a]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00019", () => {
        let regex = /[a-\w]/;
        const target = "[a-\w]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00020", () => {
    //     let regex = /[z-\w]/u;
    //     const target = "[a-\w]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00021", () => {
        let regex = /[\w-a]/;
        const target = "[\w-a]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00022", () => {
    //     let regex = /[\w-a]/u;
    //     const target = "[\w-a]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00023", () => {
        let regex = /[\w-\d]/;
        const target = "[\w-\d]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00024", () => {
    //     let regex = /[\w-\d]/u;
    //     const target = "[\w-\d]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00025", () => {
        let regex = /[\d-\w]/;
        const target = "[\d-\w]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00026", () => {
    //     let regex = /[\d-\w]/u;
    //     const target = "[\d-\w]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00027", () => {
        let regex = /[\d-\d]/;
        const target = "[\d-\d]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00028", () => {
    //     let regex = /[\d-\d]/u;
    //     const target = "[\d-\d]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00029", () => {
        let regex = /[\w-\w]/;
        const target = "[\w-\w]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00030", () => {
    //     let regex = /[\w-\w]/u;
    //     const target = "[\w-\w]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00031", () => {
        let regex = /[a-c-h]/;
        // const target = "a"; // true
        // const target = "b"; // true
        // const target = "c"; // true
        // const target = "-"; // true
        // const target = "h"; // true
        // const target = "d"; // false
        // const target = "e"; // false
        // const target = "f"; // false
        // const target = "g"; // false
        // const target = "i"; // false
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00032", () => {
        let regex = /[a-c-h]/u;
        // const target = "a"; // true
        // const target = "b"; // true
        // const target = "c"; // true
        // const target = "-"; // true
        // const target = "h"; // true
        // const target = "d"; // false
        // const target = "e"; // false
        // const target = "f"; // false
        // const target = "g"; // false
        // const target = "i"; // false
        const target = "b";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00033", () => {
        let regex = /[-a]/;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00034", () => {
        let regex = /[-a]/u;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00035", () => {
        let regex = /[a-]/;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00036", () => {
        let regex = /[a-]/u;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00037", () => {
    //     // @Note: - is smaller than a
    //     let regex = /[a--z]/;
    //     const target = "-";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00038", () => {
    //     // @Note: - is smaller than a
    //     let regex = /[a--z]/u;
    //     const target = "-";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00039", () => {
        // @Note: - is smaller than a
        let regex = /[--a]/;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00040", () => {
        // @Note: - is smaller than a
        let regex = /[--b]/u;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00041", () => {
        let regex = /[\8]/;
        const target = "8";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00042", () => {
    //     let regex = /[\8]/u;
    //     const target = "8";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00043", () => {
        let regex = /[\u123]/;
        // const target = "u"; // true
        // const target = "1"; // true
        // const target = "2"; // true
        // const target = "4"; // false
        const target = "3";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00044", () => {
    //     let regex = /[\u123]/u;
    //     const target = "3";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00045", () => {
        let regex = /[\u0123]/;
        const target = "\u0123";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00046", () => {
        let regex = /[\u0123]/u;
        const target = "\u0123";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00047", () => {
    //     let regex = /[\]/;
    //     const target = "\\";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00048", () => {
    //     let regex = /[\]/u;
    //     const target = "\\";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00049", () => {
        let regex = /[\0]/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00050", () => {
        let regex = /[\0]/u;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00051", () => {
        let regex = /[\00]/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00052", () => {
    //     let regex = /[\00]/u;
    //     const target = "\x00";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00053", () => {
        let regex = /[\000]/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00054", () => {
    //     let regex = /[\000]/u;
    //     const target = "\x00";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00055", () => {
        let regex = /[\377]/;
        const target = "\u00ff";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00056", () => {
    //     let regex = /[\377]/u;
    //     const target = "\u00ff";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00057", () => {
        let regex = /[\1]/;
        const target = "\u0001";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00058", () => {
    //     let regex = /[\1]/u;
    //     const target = "1";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00059", () => {
        let regex = /(a)[\1]/;
        const target = "a\x01";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00060", () => {
    //     let regex = /(a)[\1]/u;
    //     const target = "a\x01";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00061", () => {
        let regex = /[(a)\1]/;
        const target = ")";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00062", () => {
    //     let regex = /[(a)\1]/u;
    //     const target = ")";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00063", () => {
        let regex = /[\p{Letter}]/;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00064", () => {
        let regex = /[\p{Letter}]/u;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00065", () => {
        let regex = /[\p{}]/;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00066", () => {
    //     let regex = /[\p{}]/u;
    //     const target = "T";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00067", () => {
        let regex = /[\p{LETTER}]/;
        const target = "T";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00068", () => {
    //     let regex = /[\p{LETTER}]/u;
    //     const target = "T";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00069", () => {
        let regex = /[\x001]/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00070", () => {
        let regex = /[\x001]/u;
        const target = "1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00071", () => {
        let regex = /[\xg1]/;
        const target = "x";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00072", () => {
    //     let regex = /[\xg1]/u;
    //     const target = "g";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00073", () => {
        let regex = /[\k]/;
        const target = "k";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00074", () => {
    //     let regex = /[\k]/u;
    //     const target = "g";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00075", () => {
        let regex = /[(?<a>a)\k<a>]/;
        const target = "<";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00076", () => {
    //     let regex = /[(?<a>a)\k<a>]/u;
    //     const target = ")";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00077", () => {
    //     let regex = /(?<a>a)[\k<a>]/;
    //     const target = "aa";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00078", () => {
    //     let regex = /(?<a>a)[\k<a>]/u;
    //     const target = ")";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00079", () => {
        let regex = /[\k<a>]/;
        const target = "aa";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00080", () => {
    //     let regex = /[\k<a>]/u;
    //     const target = "aa";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00081", () => {
    //     let regex = /(?<b>a)\k<a>/;
    //     const target = "aa";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00082", () => {
    //     let regex = /(?<b>a)\k<a>/u;
    //     const target = "aa";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00083", () => {
        let regex = /[✅-🧪]/;
        const target = "🧪";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00084", () => {
        let regex = /[✅-🧪]/u;
        const target = "🧪";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00085", () => {
    //     let regex = /[🧪-✅]/;
    //     const target = "✅";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00086", () => {
    //     let regex = /[🧪-✅]/u;
    //     const target = "✅";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00087", () => {
    //     let regex = /[€-क]/;
    //     const target = "क";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00088", () => {
    //     let regex = /[€-क]/u;
    //     const target = "क";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00089", () => {
        let regex = /[क-€]/;
        const target = "€";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00090", () => {
        let regex = /[क-€]/u;
        const target = "€";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00091", () => {
        let regex = /[\uc290-\uc295]/;
        const target = "\uc293";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00092", () => {
        let regex = /[\uc290-\uc295]/u;
        const target = "\uc293";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00093", () => {
    //     let regex = /[\uc295-\uc290]/;
    //     const target = "\uc293";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00094", () => {
    //     let regex = /[\uc295-\uc290]/u;
    //     const target = "\uc293";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00095", () => {
    //     let regex = /[\^-\$]/;
    //     const target = "\uc293";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case00096", () => {
    //     let regex = /[\^-\$]/u;
    //     const target = "\uc293";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case00097", () => {
        let regex = /[\$-\^]/;
        const target = "\$";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case00098", () => {
        let regex = /[\$-\^]/u;
        const target = "\^";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case00099", () => {
    //     let regex = /[\c-b]/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000100", () => {
    //     let regex = /[\c-b]/u;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000101", () => {
    //     let regex = /[b-\c]/;
    //     const target = "c";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000102", () => {
    //     let regex = /[b-\c]/u;
    //     const target = "c_";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000103", () => {
    //     let regex = /\c_/;
    //     const target = "c_";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000104", () => {
    //     let regex = /\c_/u;
    //     const target = "c_";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000105", () => {
        let regex = /[a\c_z]/;
        const target = "z";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000106", () => {
    //     let regex = /[a\c_z]/u;
    //     const target = "c_";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000107", () => {
    //     let regex = /[_-,]/;
    //     const target = ",";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000108", () => {
    //     let regex = /[_-,]/u;
    //     const target = "_";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000109", () => {
        let regex = /[,-_]/;
        const target = ",";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000110", () => {
        let regex = /[,-_]/u;
        const target = "_";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000111", () => {
        let regex = /[:-;]/;
        const target = ";";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000112", () => {
        let regex = /[:-;]/u;
        const target = ":";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000113", () => {
    //     let regex = /[;-:]/;
    //     const target = ";";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000114", () => {
    //     let regex = /[;-:]/u;
    //     const target = ":";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000115", () => {
        let regex = /[!-@]/;
        const target = "@";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000116", () => {
        let regex = /[!-@]/u;
        const target = "!";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000117", () => {
    //     let regex = /[@-!]/;
    //     const target = "@";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000118", () => {
    //     let regex = /[@-!]/u;
    //     const target = "!";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000119", () => {
        let regex = /[#-%]/;
        const target = "%";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000120", () => {
        let regex = /[#-%]/u;
        const target = "#";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000121", () => {
    //     let regex = /[%-#]/;
    //     const target = "%";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000122", () => {
    //     let regex = /[%-#]/u;
    //     const target = "#";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000123", () => {
        let regex = /[&-(]/;
        const target = "&";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000124", () => {
        let regex = /[&-(]/u;
        const target = "(";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000125", () => {
    //     let regex = /[(-&]/;
    //     const target = "&";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000126", () => {
    //     let regex = /[(-&]/u;
    //     const target = "(";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000127", () => {
    //     let regex = /[)-$]/;
    //     const target = "&";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000128", () => {
    //     let regex = /[)-$]/u;
    //     const target = "(";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000129", () => {
        let regex = /[$-)]/;
        const target = "&";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000130", () => {
        let regex = /[$-)]/u;
        const target = "(";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000131", () => {
        let regex = /[^-{]/;
        const target = "}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000132", () => {
        let regex = /[^-{]/u;
        const target = "_";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000133", () => {
    //     let regex = /[{-^]/;
    //     const target = "^";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000134", () => {
    //     let regex = /[{-^]/u;
    //     const target = "{";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000135", () => {
        let regex = /[\^-{]/;
        const target = "^";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000136", () => {
        let regex = /[\^-{]/u;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000137", () => {
    //     let regex = /[{-\^]/;
    //     const target = "^";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000138", () => {
    //     let regex = /[{-\^]/u;
    //     const target = "{";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000139", () => {
    //     let regex = /[}-?]/;
    //     const target = "?";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000140", () => {
    //     let regex = /[}-?]/u;
    //     const target = "}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000141", () => {
        let regex = /[?-}]/;
        const target = "?";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000142", () => {
        let regex = /[?-}]/u;
        const target = "}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000143", () => {
    //     let regex = /[+-*]/;
    //     const target = "+";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000144", () => {
    //     let regex = /[+-*]/u;
    //     const target = "*";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000145", () => {
        let regex = /[*-+]/;
        const target = "+";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000146", () => {
        let regex = /[*-+]/u;
        const target = "*";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000147", () => {
        let regex = /[/-|]/;
        const target = "/";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000148", () => {
        let regex = /[/-|]/u;
        const target = "|";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000149", () => {
    //     let regex = /[|-/]/;
    //     const target = "+";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000150", () => {
    //     let regex = /[|-/]/u;
    //     const target = "*";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000151", () => {
        let regex = /["-']/;
        const target = '"';
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000152", () => {
        let regex = /["-']/u;
        const target = "'";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000153", () => {
    //     let regex = /['-"]/;
    //     const target = "\"";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000154", () => {
    //     let regex = /['-"]/u;
    //     const target = "'";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000155", () => {
        let regex = /[<->]/;
        const target = "<";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000156", () => {
        let regex = /[<->]/u;
        const target = ">";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000157", () => {
    //     let regex = /[>-<]/;
    //     const target = "<";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000158", () => {
    //     let regex = /[>-<]/u;
    //     const target = ">";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000159", () => {
        let regex = /[=-`]/;
        const target = "=";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000160", () => {
        let regex = /[=-`]/u;
        const target = "`";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000161", () => {
    //     let regex = /[`-=]/;
    //     const target = "=";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000162", () => {
    //     let regex = /[`-=]/u;
    //     const target = "`";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000163", () => {
        let regex = /[`-~]/;
        const target = "~";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000164", () => {
        let regex = /[`-~]/u;
        const target = "`";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000165", () => {
    //     let regex = /[~-`]/;
    //     const target = "~";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000166", () => {
    //     let regex = /[~-`]/u;
    //     const target = "`";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000167", () => {
        let regex = /[[]/;
        const target = "[";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000168", () => {
        let regex = /[[]/u;
        const target = "[";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000169", () => {
        let regex = /[[-b]/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Character Classes[]: Case000170", () => {
        let regex = /[[-b]/u;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000171", () => {
    //     let regex = /[b-[]/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Character Classes[]: Case000172", () => {
    //     let regex = /[b-[]/u;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Character Classes[]: Case000173", () => {
        let regex = /[ab]a]/;
        const target = "ba]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000174", () => {
    //     // @JS-BUG: Throwing error: SyntaxError: Invalid regular expression: /[ab]a]/u: Lone quantifier brackets
    //     // @RESOLUTION: SyntaxError: Invalid regular expression: /[ab]a]/u: Lone Character class brackets

    //     let regex = /[ab]a]/u;
    //     const target = "ba]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case00001", () => {
        let regex = /(a)/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case00002", () => {
        let regex = /(a)/u;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case00003", () => {
        let regex = /(abcdefjklmnostuvwxyz)/;
        const target = "abcdefjklmnostuvwxyz";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case00004", () => {
        let regex = /(abcdefjklmnostuvwxyz)/u;
        const target = "abcdefjklmnostuvwxyz";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case00005", () => {
        let regex = /(abcd-ghij)/;
        const target = "abcd-ghij";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case00006", () => {
        let regex = /(abcd-ghij)/u;
        const target = "abcd-ghij";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case00007", () => {
    //     let regex = /(abcd/ghij)/;
    //     const target = "abcd/ghij";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case00008", () => {
    //     let regex = /(abcd/ghij)/u;
    //     const target = "abcd/ghij";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case00009", () => {
        let regex = /(abcd!@#%=';:><.,~`"&ghij)/;
        const target = "abcd!@#%=';:><.,~`\"&ghij";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000010", () => {
        let regex = /(abcd!@#%=';:><.,~`"&ghij)/u;
        const target = "abcd!@#%=';:><.,~`\"&ghij";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000011", () => {
        let regex = /(\a)/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case000012", () => {
    //     let regex = /(\a)/u;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case000013", () => {
        let regex = /(\a\e\j\k\l\m\o\y\z)/;
        const target = "aejklmoyz";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case000014", () => {
    //     let regex = /(\a\e\j\k\l\m\o\y\z)/u;
    //     const target = "aejklmoyz";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case000015", () => {
        let regex = /(\a\-\g\h\i\j)/;
        const target = "a-ghij";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case000016", () => {
    //     let regex = /(\a\-\g\h\i\j)/u;
    //     const target = "a-ghij";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case000017", () => {
        let regex = /(\a\/\g\h\i\j)/;
        const target = "a/ghij";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case000018", () => {
    //     let regex = /(\a\/\g\h\i\j)/u;
    //     const target = "a/ghij";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case000019", () => {
        let regex = /(\a\!\@\#\%\=\'\;\:\>\<\.\,\~\`\"\&\g\h\i\j)/;
        const target = "a!@#%=';:><.,~`\"&ghij";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case000020", () => {
    //     let regex = /(\a\!\@\#\%\=\'\;\:\>\<\.\,\~\`\"\&\g\h\i\j)/u;
    //     const target = "a!@#%=';:><.,~`\"&ghij"";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case000021", () => {
        let regex = /(\n)/;
        const target = "\n";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000022", () => {
        let regex = /(\n)/u;
        const target = "\n";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000023", () => {
        let regex = /(\b)/;
        const target = "-a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000024", () => {
        let regex = /(\b)/u;
        const target = "a-b";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000025", () => {
        let regex = /(\f)/;
        const target = "\f";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000026", () => {
        let regex = /(\f)/u;
        const target = "\f";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000027", () => {
        let regex = /(\d)/;
        const target = "1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000028", () => {
        let regex = /(\d)/u;
        const target = "4";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000029", () => {
        let regex = /(\r)/;
        const target = "\r";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000030", () => {
        let regex = /(\r)/u;
        const target = "\r";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000031", () => {
        let regex = /(\s)/;
        const target = " ";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000032", () => {
        let regex = /(\s)/u;
        const target = " ";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000033", () => {
        let regex = /(\t)/;
        const target = "\t";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000034", () => {
        let regex = /(\t)/u;
        const target = "\t";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000035", () => {
        let regex = /(\v)/;
        const target = "\v";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000036", () => {
        let regex = /(\v)/u;
        const target = "\v";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000037", () => {
        let regex = /(\w\w)/;
        const target = "a1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000038", () => {
        let regex = /(\w\w)/u;
        const target = "1a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000039", () => {
        let regex = /(\B)/;
        const target = "a1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000040", () => {
        let regex = /(\B)/u;
        const target = "a1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000041", () => {
        let regex = /(\D)/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000042", () => {
        let regex = /(\D)/u;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000043", () => {
        let regex = /(\S)/;
        const target = "@";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000044", () => {
        let regex = /(\S)/u;
        const target = "@";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000045", () => {
        let regex = /(\W)/;
        const target = ",";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000046", () => {
        let regex = /(\W)/u;
        const target = ",";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000047", () => {
        let regex = /(\^)/;
        const target = "^";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000048", () => {
        let regex = /(\^)/u;
        const target = "^";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000049", () => {
        let regex = /(\$)/;
        const target = "$";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000050", () => {
        let regex = /(\$)/u;
        const target = "$";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000051", () => {
        let regex = /(\\)/;
        const target = "\\";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000052", () => {
        let regex = /(\\)/u;
        const target = "\\";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000053", () => {
        let regex = /(\.)/;
        const target = ".";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000054", () => {
        let regex = /(\.)/u;
        const target = ".";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000055", () => {
        let regex = /(\*)/;
        const target = "*";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000056", () => {
        let regex = /(\*)/u;
        const target = "*";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000057", () => {
        let regex = /(\+)/;
        const target = "+";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000058", () => {
        let regex = /(\+)/u;
        const target = "+";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000059", () => {
        let regex = /(\?)/;
        const target = "?";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000060", () => {
        let regex = /(\?)/u;
        const target = "?";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000061", () => {
        let regex = /(\[)/;
        const target = "[";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000062", () => {
        let regex = /(\[)/u;
        const target = "[";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000063", () => {
        let regex = /(\])/;
        const target = "]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000064", () => {
        let regex = /(\])/u;
        const target = "]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000065", () => {
        let regex = /(\()/;
        const target = "(";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000066", () => {
        let regex = /(\()/u;
        const target = "(";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000067", () => {
        let regex = /(\))/;
        const target = ")";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000068", () => {
        let regex = /(\))/u;
        const target = ")";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000069", () => {
        let regex = /(\{)/;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000070", () => {
        let regex = /(\})/u;
        const target = "}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000071", () => {
        let regex = /(\|)/;
        const target = "|";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000072", () => {
        let regex = /(\|)/u;
        const target = "|";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000073", () => {
        let regex = /(\/)/;
        const target = "/";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000074", () => {
        let regex = /(\/)/u;
        const target = "/";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000075", () => {
        let regex = /(a)/;
        assert.strictEqual(regex.test("a"), true);
        regex = /(b)/;
        assert.strictEqual(regex.test("b"), true);
        regex = /(1)/;
        assert.strictEqual(regex.test("1"), true);
        regex = /(_)/;
        assert.strictEqual(regex.test("_"), true);
        regex = /(€)/;
        assert.strictEqual(regex.test("€"), true);
        regex = /(क)/;
        assert.strictEqual(regex.test("क"), true);
        regex = /(あ)/;
        assert.strictEqual(regex.test("あ"), true);
        regex = /(😀)/;
        assert.strictEqual(regex.test("😀"), true);

        // ...
        // ...U+10FFFF
        // Js supports upto U+10FFFF(1114111) characters.
    });

    test("Groups(): Case000076", () => {
        let regex = /(abc)/;
        assert.strictEqual(regex.test("abc"), true);

        regex = /(hello)/;
        assert.strictEqual(regex.test("hello"), true);

        regex = /(123)/;
        assert.strictEqual(regex.test("123"), true);

        regex = /(anil)/;
        assert.strictEqual(regex.test("anil"), true);

        regex = /(😀🚀🔥)/;
        assert.strictEqual(regex.test("😀🚀🔥"), true);

        regex = /(hello)/;
        assert.strictEqual(regex.test("hello"), true);

        regex = /(abc123)/;
        assert.strictEqual(regex.test("abc123"), true);

        regex = /(कखग)/;
        assert.strictEqual(regex.test("कखग"), true);
    });

    test("Groups(): Case000077", () => {
        let regex = /(\^)/;
        assert.strictEqual(regex.test("^"), true);

        regex = /(\$)/;
        assert.strictEqual(regex.test("$"), true);

        regex = /(\.)/;
        assert.strictEqual(regex.test("."), true);

        regex = /(\*)/;
        assert.strictEqual(regex.test("*"), true);

        regex = /(\+)/;
        assert.strictEqual(regex.test("+"), true);

        regex = /(\?)/;
        assert.strictEqual(regex.test("?"), true);

        regex = /(\()/;
        assert.strictEqual(regex.test("("), true);

        regex = /(\))/;
        assert.strictEqual(regex.test(")"), true);

        regex = /(\[)/;
        assert.strictEqual(regex.test("["), true);

        regex = /(\])/;
        assert.strictEqual(regex.test("]"), true);

        regex = /(\{)/;
        assert.strictEqual(regex.test("{"), true);

        regex = /(\})/;
        assert.strictEqual(regex.test("}"), true);

        regex = /(\|)/;
        assert.strictEqual(regex.test("|"), true);

        regex = /(\\)/;
        assert.strictEqual(regex.test("\\"), true);
    });

    test("Groups(): Case000078", () => {
        let regex = /(\x41)/;
        assert.strictEqual(regex.test("A"), true);
    });

    test("Groups(): Case000079", () => {
        let regex = /(\u0061)/;
        assert.strictEqual(regex.test("a"), true);
    });

    test("Groups(): Case000080", () => {
        let regex = /(\u{1F600})/u;
        assert.strictEqual(regex.test("😀"), true);
    });

    test("Groups(): Case000081", () => {
        let regex = /(\n)/;
        assert.strictEqual(regex.test("\n"), true);

        regex = /(\r)/;
        assert.strictEqual(regex.test("\r"), true);
        regex = /(\t)/;
        assert.strictEqual(regex.test("\t"), true);
        regex = /(\v)/;
        assert.strictEqual(regex.test("\v"), true);
        regex = /(\f)/;
        assert.strictEqual(regex.test("\f"), true);
        regex = /(\0)/;
        assert.strictEqual(regex.test("\0"), true);
    });

    test("Groups(): Case000082", () => {
        let regex = /(\/)/;
        assert.strictEqual(regex.test("/"), true);
    });

    // test("Groups(): Case000083", () => {
    //     let regex = /(a/b)/;
    //     assert.strictEqual(regex.test("a/b"), true);
    // });

    // test("Groups(): Case000084", () => {
    //     let regex = /(ab)/\;
    //     assert.strictEqual(regex.test("a/b"), true);
    // });

    // test("Groups(): Case000085", () => {
    // let regex = /(\u{110000})/u;
    // assert.strictEqual(regex.test("\u{110000}"), true);
    // });

    test("Groups(): Case000086", () => {
        let regex = /(\c1)/;
        assert.strictEqual(regex.test(""), false);
    });

    test("Groups(): Case000087", () => {
        let regex = /(\ugg)/;
        assert.strictEqual(regex.test("ugg"), true);
    });

    test("Groups(): Case000088", () => {
        let regex = /(.)/;
        const target = "anil";
        console.log("dot: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000089", () => {
        let regex = /(\.)/;
        const target = ".anil";
        console.log("dot: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000090", () => {
        let regex = /(\r.)/;
        const target = "\r.anil";
        console.log("dot: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000091", () => {
        // let regex =(( /{)/u;
        let regex = /({)/;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000092", () => {
        // let regex =(( /})/u;
        let regex = /(})/;
        const target = ",}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000093", () => {
        // let regex =( /1)/u;
        let regex = /(1)/u;
        const target = "1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000094", () => {
        // let regex =( /,)/u;
        let regex = /(,)/u;
        const target = ",";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000095", () => {
        // let regex =( /1,)/u;
        let regex = /(1,)/u;
        const target = "1,";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000096", () => {
        // let regex =( /1,2)/;
        let regex = /(1,2)/;
        const target = "1,2";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000097", () => {
        // let regex =( /2,1)/;
        let regex = /(2,1)/;
        const target = "2,1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case000098", () => {
    //     // let regex =( /()/;
    //     let regex = /(()/;
    //     const target = "(";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case000099", () => {
    //     // let regex =( /))/;
    //     let regex = /())/;
    //     const target = ")";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000100", () => {
        // let regex =( /[acw)/;
        let regex = /([])/u;
        const target = "[]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Groups(): Case0000101", () => {
        // let regex =(( /])/u;
        let regex = /(])/;
        const target = "]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000102", () => {
        // let regex =(( /[])/u;
        let regex = /([])/;
        const target = "";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    // test("Groups(): Case0000103", () => {
    //     // let regex = /([])/u;
    //     let regex = /(?)/;
    //     const target = "?";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000104", () => {
        // let regex =(( /[])/u;
        let regex = /(\?)/;
        const target = "?";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000105", () => {
    //     // let r(egex = /[])/u;
    //     let regex =/(+)/;
    //     const target = "+";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000106", () => {
        // let regex =(( /[])/u;
        let regex = /(\+)/;
        const target = "+";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000107", () => {
    //     // let r(egex = /[])/u;
    //     let regex = /(\\+*)/;
    //     const target = "\\\\*";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000108", () => {
        // let regex =(( /[])/u;
        let regex = /(\*)/;
        const target = "*";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000109", () => {
    //     // let r(egex = /[])/u;
    //     let regex =/(a???)/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000110", () => {
        // let regex =( /[])/u;
        let regex = /(a??)/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000111", () => {
    //     // let r(egex = /[])/u;
    //     let regex = /(a+??)/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000112", () => {
        // let regex =( /[])/u;
        let regex = /(a+?)/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case000113", () => {
    //     // let r(egex = /[])/u;
    //     let regex =/(a*??)/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000114", () => {
        // let regex =( /[])/u;
        let regex = /(a*?)/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000115", () => {
        // let regex =( /a^sian)/;
        let regex = /(asian)/;
        const target = "asian";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000116", () => {
        let regex = /(\08)/;
        const target = "\x008";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000117", () => {
        // let regex =( /\07)/;
        // const target = "\u0007";
        let regex = /(\107)/;
        const target = "\u0047";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000118", () => {
        // let regex =( /\07)/;
        // const target = "\u0007";
        let regex = /(\377)/;
        const target = "\u00FF";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000119", () => {
        let regex = /(\400)/;
        const target = "\u00200";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000120", () => {
        let regex = /(\777)/;
        const target = "\u003F7";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000121", () => {
        let regex = /(a^|$sian)/;
        const target = "a^|$sian";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Groups(): Case0000122", () => {
        let regex = /(\378)/;
        const target = "\u001F8";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000123", () => {
        let regex = /(\397)/;
        const target = "\u000397";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000124", () => {
        // let regex =( /a^sian)/;
        let regex = /(\a)/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000125", () => {
        // let regex =( /a^sian)/;
        let regex = /(\0)/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000126", () => {
        // let regex =( /a^sian)/;
        let regex = /(\00)/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000127", () => {
        // let regex =( /a^sian)/;
        let regex = /(\000)/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000128", () => {
        // let regex =( /a^sian)/;
        let regex = /(\08)/;
        const target = "\x008";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000129", () => {
        // let regex =( /a^sian)/;
        let regex = /(\008)/;
        const target = "\x008";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000130", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex =/(\000)/u;
    //     const target = "abba";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000131", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(\118)/u;
    //     const target = "abba";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000132", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(\988)/u;
    //     const target = "abba";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000133", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(\0988)/u;
    //     const target = "abba";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000134", () => {
        // let regex =( /a^sian)/;
        let regex = /(\\a)/;
        const target = "\\a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000135", () => {
        // let regex =( /a^sian)/;
        let regex = /(\_)/;
        const target = "_";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000136", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex =( /\_)/u;
    //     const target = "_";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000137", () => {
        // let regex =( /a^sian)/;
        let regex = /(\!)/;
        const target = "!";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000138", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex =( /\!)/u;
    //     const target = "!";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000139", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u{1F600})/;
        const target = "\\u{1F600}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000140", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u{1F600})/u;
        const target = "\u{1F600}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000141", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u)/;
        const target = "u";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000142", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex =( /\u)/u;
    //     const target = "u";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000143", () => {
        // let regex =( /a^sian)/;
        let regex = /(\c)/;
        const target = "c";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    // test("Groups(): Case0000144", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(\c)/u;
    //     const target = "c";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), false);
    // });

    test("Groups(): Case0000145", () => {
        // let regex =( /a^sian)/;
        let regex = /(\cA)/;
        const target = "\x01";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000146", () => {
        // let regex =( /a^sian)/;
        let regex = /(\cA)/u;
        const target = "\x01";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000147", () => {
        // let regex =( /a^sian)/;
        let regex = /(\ca)/;
        const target = "\x01";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000148", () => {
        // let regex =( /a^sian)/;
        let regex = /(\ca)/u;
        const target = "\x01";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000149", () => {
        // let regex =( /a^sian)/;
        let regex = /(\c1)/;
        const target = "c1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    // test("Groups(): Case0000150", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex =/(\c1)/u;
    //     const target = "\x011";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000151", () => {
    //     let regex =/(\u{23,20})/;
    //     const target = "uuuuu";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000152", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u{230,240})/;
        const target = "uuuuuuuuuu";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Groups(): Case0000153", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u{23335})/;
        // regex will match iff 23335 u's are there in target string i.e., uuuuuuuuuuuuuuuuuuuu...+u <- 23335th
        const target = "u{,23335}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Groups(): Case0000154", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u{23335,})/;
        // regex will match iff 23335 or more u's are there in target string i.e., uuuuuuuuuuuuuuuuuuuu...+u <- 23335th or more
        const target = "u{,23335}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Groups(): Case0000155", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u{,23335})/;
        const target = "u{,23335}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000156", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u{,})/;
        const target = "u{,}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000157", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u{})/;
        const target = "u{}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000158", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u{1})/;
        const target = "u";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000159", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /({1})/;
    //     const target = "uuuuuuuuuu";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000160", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u{1:1})/;
        const target = "u{1:1}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000161", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u1234)/;
        const target = "\u1234";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000162", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u123)/;
        const target = "u123";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000163", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u1234)/u;
        const target = "\u1234";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000164", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(\u123)/u;
    //     const target = "u123";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000165", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u12345)/;
        const target = "\u12345";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000166", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u1)/;
        const target = "u1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000167", () => {
        // let regex =( /a^sian)/;
        let regex = /(\u12)/;
        const target = "u12";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000168", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(\u1)/u;
    //     const target = "u1";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000169", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(\u12)/u;
    //     const target = "u12";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000170", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /([abc)/;
    //     const target = "[abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000171", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /((abc)/;
    //     const target = "(abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000172", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /((?<1>a))/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000173", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /((?<a-b>a))/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000174", () => {
    //     // let regex =( /a^sian)/;
    //     let regex = /(\k<a>)/;
    //     const target = "k<a>";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000175", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(\k<a>)/u;
    //     const target = "k<a>";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000176", () => {
        // let regex =( /a^sian)/;
        let regex = /(\p{L})/;
        const target = "p{L}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000177", () => {
        // let regex =( /a^sian)/;
        let regex = /(\p{XYZ})/;
        const target = "p{XYZ}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000178", () => {
        // let regex =( /a^sian)/;
        let regex = /(\p{L})/u;
        const target = "p{L}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000179", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(\p{XYZ})/u;
    //     const target = "p{XYZ}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000180", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /({122222})/;
    //     const target = "{122222}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000181", () => {
        // let regex =( /a^sian)/;
        let regex = /({})/;
        const target = "{}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000182", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /({})/u;
    //     const target = "{}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000183", () => {
        // let regex =( /a^sian)/;
        let regex = /({)/;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000184", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /({)/u;
    //     const target = "{";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000185", () => {
        // let regex =( /a^sian)/;
        let regex = /({,11})/;
        const target = "{,11}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000186", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /({,11})/u;
    //     const target = "{,11}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000187", () => {
        // let regex =( /a^sian)/;
        let regex = /(})/;
        const target = "}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000188", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(})/u;
    //     const target = "}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000189", () => {
        // let regex =( /a^sian)/;
        let regex = /(1)/;
        const target = "1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000190", () => {
        // let regex =( /a^sian)/;
        let regex = /(1)/u;
        const target = "1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000191", () => {
        // let regex =( /a^sian)/;
        let regex = /(143242)/;
        const target = "143242";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000192", () => {
        // let regex =( /a^sian)/;
        let regex = /(143242)/u;
        const target = "143242";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000193", () => {
        // let regex =( /a^sian)/;
        let regex = /(1})/;
        const target = "1}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000194", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(1})/u;
    //     const target = "1}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000195", () => {
        // let regex =( /a^sian)/;
        let regex = /(123424})/;
        const target = "123424}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000196", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(123424})/u;
    //     const target = "123424}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000197", () => {
        // let regex =( /a^sian)/;
        let regex = /(1234,24)/;
        const target = "1234,24";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000198", () => {
        // let regex =( /a^sian)/;
        let regex = /(1234,24)/u;
        const target = "1234,24";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000199", () => {
        // let regex =( /a^sian)/;
        let regex = /(1234,24})/;
        const target = "1234,24}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000200", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(1234,24})/u;
    //     const target = "1234,24}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000201", () => {
        // let regex =( /a^sian)/;
        let regex = /(\p{})/;
        const target = "p{}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000202", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(\p{})/u;
    //     const target = "p{}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000203", () => {
        // let regex =( /a^sian)/;
        let regex = /(\p{=LETTER})/;
        const target = "p{=LETTER}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000204", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(\p{=LETTER})/u;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000205", () => {
        // let regex =( /a^sian)/;
        let regex = /(\p{g=LETTER})/;
        const target = "p{g=LETTER}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000206", () => {
    //     // let r(egex = /a^sian)/;
    //     let regex = /(\p{g=LETTER})/u;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000207", () => {
        // let regex =( /a^sian)/;
        let regex = /(\p{gc=Letter})/;
        const target = "p{gc=Letter}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000208", () => {
        // let regex =( /a^sian)/;
        let regex = /(\p{gc=Letter})/u;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000209", () => {
        let regex = /([])/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Groups(): Case0000210", () => {
        let regex = /([])/u;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Groups()(: Case0000211", () => {
        let regex = /([.])/;
        const target = ".";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000212", () => {
        let regex = /([.])/u;
        const target = ".";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000213", () => {
        let regex = /([abc123_,:;!@#%&()$^{}?+*/|"'<>=`~ ])/;
        const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000214", () => {
        let regex = /([abc123_,:;!@#%&(){}?*+$^/|"'<>=`~ ])/u;
        const target = "abc123_,:;!@#%&()$^{}?+*/|\"'<>=`~ ";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000215", () => {
    //     let regex = /([abc)/;
    //     const target = "[abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000216", () => {
    //     let regex = /([abc)/u;
    //     const target = "[abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups()(: Case0000217", () => {
        let regex = /([^])/;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000218", () => {
        let regex = /([^])/u;
        const target = "z";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000219", () => {
        let regex = /([a-z])/;
        const target = "q";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000220", () => {
        let regex = /([a-z])/u;
        const target = "q";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000221", () => {
    //     let regex = /([z-a])/;
    //     const target = "q";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000222", () => {
    //     let regex = /([z-a])/u;
    //     const target = "q";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000223", () => {
        let regex = /([a-\d])/;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000224", () => {
    //     let regex = /([a-\d])/u;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000225", () => {
        let regex = /([\d-a])/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000226", () => {
    //     let regex = /([\d-a])/u;
    //     const target = "-";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000227", () => {
        let regex = /([a-\w])/;
        const target = "[\w-a]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000228", () => {
    //     let regex = /([a-\w])/u;
    //     const target = "[a-\w]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000229", () => {
        let regex = /([\w-a])/;
        const target = "[\w-a]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000230", () => {
    //     let regex = /([\w-a])/u;
    //     const target = "[\w-a]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000231", () => {
        let regex = /([\w-\d])/;
        const target = "[\w-\d]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000232", () => {
    //     let regex = /([\w-\d])/u;
    //     const target = "[\w-\d]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000233", () => {
        let regex = /([\d-\w])/;
        const target = "[\d-\w]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000234", () => {
    //     let regex = /([\d-\w])/u;
    //     const target = "[\d-\w]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000235", () => {
        let regex = /([\d-\d])/;
        const target = "[\d-\d]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000236", () => {
    //     let regex = /([\d-\d])/u;
    //     const target = "[\d-\d]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000237", () => {
        let regex = /([\w-\w])/;
        const target = "[\w-\w]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000238", () => {
    //     let regex = /([\w-\w])/u;
    //     const target = "[\w-\w]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000239", () => {
        let regex = /([a-c-h])/;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000240", () => {
        let regex = /([a-c-h])/u;
        const target = "b";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000241", () => {
        let regex = /([-a])/;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000242", () => {
        let regex = /([-a])/u;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000243", () => {
        let regex = /([a-])/;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000244", () => {
        let regex = /([a-])/u;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000245", () => {
    //     let regex = /([a--z])/;
    //     const target = "-";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000246", () => {
    //     // @Note: - is smaller than a
    //     let regex = /([a--z])/u;
    //     const target = "-";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000247", () => {
        // @Note: - is smaller than a
        let regex = /([--a])/;
        const target = "-";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000248", () => {
        // @Note: - is smaller than a
        let regex = /([--b])/u;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000249", () => {
        let regex = /([\8])/;
        const target = "8";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000250", () => {
    //     let regex = /([\8])/u;
    //     const target = "8";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000251", () => {
        let regex = /([\u123])/;
        // const target = "u"; // true
        // const target = "1"; // true
        // const target = "2"; // true
        // const target = "4"; // false
        const target = "3";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000252", () => {
    //     let regex = /([\u123])/u;
    //     const target = "3";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000253", () => {
        let regex = /([\u0123])/;
        const target = "\u0123";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000254", () => {
        let regex = /([\u0123])/u;
        const target = "\u0123";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000255", () => {
    //     let regex = /([\])/;
    //     const target = "\\";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000256", () => {
    //     let regex = /([\])/u;
    //     const target = "\\";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000257", () => {
        let regex = /([\0])/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000258", () => {
        let regex = /([\0])/u;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000259", () => {
        let regex = /([\00])/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000260", () => {
    //     let regex = /([\00])/u;
    //     const target = "\x00";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000261", () => {
        let regex = /([\000])/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000262", () => {
    //     let regex = /([\000])/u;
    //     const target = "\x00";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000263", () => {
        let regex = /([\377])/;
        const target = "\u00ff";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000264", () => {
    //     let regex = /([\377])/u;
    //     const target = "\u00ff";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000265", () => {
        let regex = /([\1])/;
        const target = "\u0001";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000266", () => {
    //     let regex = /([\1])/u;
    //     const target = "1";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000267", () => {
        let regex = /((a)[\1])/;
        const target = "a\x01";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000268", () => {
    //     let regex = /((a)[\1])/u;
    //     // let regex = /[\1]/u;
    //     const target = "a\x01";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // @Last: 08 March 2026, Sun 10:05 IST, Tested last above

    test("Groups(): Case0000269", () => {
        let regex = /([(a)\1])/;
        const target = ")";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000270", () => {
    //     let regex = /([(a)\1])/u;
    //     const target = ")";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000271", () => {
        let regex = /([\p{Letter}])/;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000272", () => {
        let regex = /([\p{Letter}])/u;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000273", () => {
        let regex = /([\p{}])/;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000274", () => {
    //     let regex = /([\p{}])/u;
    //     const target = "T";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000275", () => {
        let regex = /([\p{LETTER}])/;
        const target = "T";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000276", () => {
    //     let regex = /([\p{LETTER}])/u;
    //     const target = "T";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000277", () => {
        let regex = /([\x001])/;
        const target = "\x00";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000278", () => {
        let regex = /([\x001])/u;
        const target = "1";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000279", () => {
        let regex = /([\xg1])/;
        const target = "x";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000280", () => {
    //     let regex = /([\xg1])/u;
    //     const target = "g";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000281", () => {
        let regex = /([\k])/;
        const target = "k";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000282", () => {
    //     let regex = /([\k])/u;
    //     const target = "g";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000283", () => {
        let regex = /([(?<a>a)\k<a>])/;
        const target = "<";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000284", () => {
    //     let regex = /([(?<a>a)\k<a>])/u;
    //     const target = ")";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000285", () => {
    //     let regex = /((?<a>a)[\k<a>])/;
    //     const target = "aa";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000286", () => {
    //     let regex = /((?<a>a)[\k<a>])/u;
    //     const target = ")";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000287", () => {
        let regex = /([\k<a>])/;
        const target = "aa";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000288", () => {
    //     let regex = /([\k<a>])/u;
    //     const target = "aa";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000289", () => {
    //     let regex = /((?<b>a)\k<a>)/;
    //     const target = "aa";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000290", () => {
    //     let regex = /((?<b>a)\k<a>)/u;
    //     const target = "aa";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000291", () => {
        let regex = /([✅-🧪])/;
        const target = "🧪";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000292", () => {
        let regex = /([✅-🧪])/u;
        const target = "🧪";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000293", () => {
    //     let regex = /([🧪-✅])/;
    //     const target = "✅";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000294", () => {
    //     let regex = /([🧪-✅])/u;
    //     const target = "✅";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000295", () => {
    //     let regex = /([€-क])/;
    //     const target = "क";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000296", () => {
    //     let regex = /([€-क])/u;
    //     const target = "क";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000297", () => {
        let regex = /([क-€])/;
        const target = "€";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000298", () => {
        let regex = /([क-€])/u;
        const target = "€";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000299", () => {
        let regex = /([\uc290-\uc295])/;
        const target = "\uc293";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000300", () => {
        let regex = /([\uc290-\uc295])/u;
        const target = "\uc293";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000301", () => {
    //     let regex = /([\uc295-\uc290])/;
    //     const target = "\uc293";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000302", () => {
    //     let regex = /([\uc295-\uc290])/u;
    //     const target = "\uc293";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000303", () => {
    //     let regex = /([\^-\$])/;
    //     const target = "\uc293";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000304", () => {
    //     let regex = /([\^-\$])/u;
    //     const target = "\uc293";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups()(: Case0000305", () => {
        let regex = /([\$-\^])/;
        const target = "\$";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000306", () => {
        let regex = /([\$-\^])/u;
        const target = "\^";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000307", () => {
    //     let regex = /([\c-b])/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000308", () => {
    //     let regex = /([\c-b])/u;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000309", () => {
    //     let regex = /([b-\c])/;
    //     const target = "c";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000310", () => {
    //     let regex = /([b-\c])/u;
    //     const target = "c_";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000311", () => {
        let regex = /(a\c_b)/;
        const target = "a\x00b";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    // test("Groups(): Case0000312", () => {
    //     let regex =/(\c_)/u;
    //     const target = "c_";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000313", () => {
        let regex = /([a\c_z])/;
        const target = "z";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000314", () => {
    //     let regex = /([a\c_z])/u;
    //     const target = "c_";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000315", () => {
    //     let regex = /([_-,])/;
    //     const target = ",";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000316", () => {
    //     let regex = /([_-,])/u;
    //     const target = "_";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000317", () => {
        let regex = /([,-_])/;
        const target = ",";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000318", () => {
        let regex = /([,-_])/u;
        const target = "_";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups()(: Case0000319", () => {
        let regex = /([:-;])/;
        const target = ";";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000320", () => {
        let regex = /([:-;])/u;
        const target = ":";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000321", () => {
    //     let regex = /([;-:])/;
    //     const target = ";";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000322", () => {
    //     let regex = /([;-:])/u;
    //     const target = ":";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000323", () => {
        let regex = /([!-@])/;
        const target = "@";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000324", () => {
        let regex = /([!-@])/u;
        const target = "!";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000325", () => {
    //     let regex = /([@-!])/;
    //     const target = "@";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000326", () => {
    //     let regex = /([@-!])/u;
    //     const target = "!";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000327", () => {
        let regex = /([#-%])/;
        const target = "%";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000328", () => {
        let regex = /([#-%])/u;
        const target = "#";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000329", () => {
    //     let regex = /([%-#])/;
    //     const target = "%";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000330", () => {
    //     let regex = /([%-#])/u;
    //     const target = "#";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000331", () => {
        let regex = /([&-(])/;
        const target = "&";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000332", () => {
        let regex = /([&-(])/u;
        const target = "(";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000333", () => {
    //     let regex = /([(-&])/;
    //     const target = "&";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000334", () => {
    //     let regex = /([(-&])/u;
    //     const target = "(";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000335", () => {
    //     let regex = /([)-$])/;
    //     const target = "&";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000336", () => {
    //     let regex = /([)-$])/u;
    //     const target = "(";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000337", () => {
        let regex = /([$-)])/;
        const target = "&";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000338", () => {
        let regex = /([$-)])/u;
        const target = "(";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups()(: Case0000339", () => {
        let regex = /([^-{])/;
        const target = "}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000340", () => {
        let regex = /([^-{])/u;
        const target = "_";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000341", () => {
    //     let regex = /([{-^])/;
    //     const target = "^";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000342", () => {
    //     let regex = /([{-^])/u;
    //     const target = "{";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups()(: Case0000343", () => {
        let regex = /([\^-{])/;
        const target = "^";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000344", () => {
        let regex = /([\^-{])/u;
        const target = "{";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000345", () => {
    //     let regex = /([{-\^])/;
    //     const target = "^";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000346", () => {
    //     let regex = /([{-\^])/u;
    //     const target = "{";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000347", () => {
    //     let regex = /([}-?])/;
    //     const target = "?";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000348", () => {
    //     let regex = /([}-?])/u;
    //     const target = "}";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000349", () => {
        let regex = /([?-}])/;
        const target = "?";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000350", () => {
        let regex = /([?-}])/u;
        const target = "}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000351", () => {
    //     let regex = /([+-*])/;
    //     const target = "+";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000352", () => {
    //     let regex = /([+-*])/u;
    //     const target = "*";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups()(: Case0000353", () => {
        let regex = /([*-+])/;
        const target = "+";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000354", () => {
        let regex = /([*-+])/u;
        const target = "*";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups()(: Case0000355", () => {
        let regex = /([/-|])/;
        const target = "/";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000356", () => {
        let regex = /([/-|])/u;
        const target = "|";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000357", () => {
    //     let regex = /([|-/])/;
    //     const target = "+";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000358", () => {
    //     let regex = /([|-/])/u;
    //     const target = "*";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000359", () => {
        let regex = /(["-'])/;
        const target = '"';
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000360", () => {
        let regex = /(["-'])/u;
        const target = "'";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000361", () => {
    //     let regex = /(['-"])/;
    //     const target = "\"";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000362", () => {
    //     let regex = /(['-"])/u;
    //     const target = "'";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000363", () => {
        let regex = /([<->])/;
        const target = "<";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000364", () => {
        let regex = /([<->])/u;
        const target = ">";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000365", () => {
    //     let regex = /([>-<])/;
    //     const target = "<";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000366", () => {
    //     let regex = /([>-<])/u;
    //     const target = ">";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000367", () => {
        let regex = /([=-`])/;
        const target = "=";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000368", () => {
        let regex = /([=-`])/u;
        const target = "`";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000369", () => {
    //     let regex = /([`-=])/;
    //     const target = "=";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000370", () => {
    //     let regex = /([`-=])/u;
    //     const target = "`";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000371", () => {
        let regex = /([`-~])/;
        const target = "~";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000372", () => {
        let regex = /([`-~])/u;
        const target = "`";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000373", () => {
    //     let regex = /([~-`])/;
    //     const target = "~";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000374", () => {
    //     let regex = /([~-`])/u;
    //     const target = "`";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000375", () => {
        let regex = /([[])/;
        const target = "[";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000376", () => {
        let regex = /([[])/u;
        const target = "[";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000377", () => {
        let regex = /([[-b])/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case000078", () => {
        let regex = /([[-b])/u;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000379", () => {
    //     let regex = /([b-[])/;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000380", () => {
    //     let regex = /([b-[])/u;
    //     const target = "a";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000381", () => {
        let regex = /([ab]a])/;
        const target = "ba]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000382", () => {
    //     let regex = /([ab]a])/u;
    //     const target = "ba]";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000383", () => {
        let regex = /(a(b(c)d(e)f)g(hi)j)klm/;
        const target = "abcdefghijklm";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000384", () => {
        let regex = /(a(b(c)d(e)f)g(hi)j)klm/u;
        const target = "abcdefghijklm";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000385", () => {
        let regex = /(?:abc)/;
        const target = "abc";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000386", () => {
        let regex = /(?:abc)/u;
        const target = "abc";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000387", () => {
    //     let regex = /(?>abc)/;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000388", () => {
    //     let regex = /(?>abc)/u;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000389", () => {
        let regex = /(abc+)/;
        const target = "abc";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000390", () => {
        let regex = /(abc+)/u;
        const target = "abc";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000391", () => {
    //     let regex = /(abc++)/;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000392", () => {
    //     let regex = /(abc++)/u;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000393", () => {
        let regex = /(abc*?)/;
        const target = "abc";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000394", () => {
        let regex = /(abc*?)/u;
        const target = "abc";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000395", () => {
    //     let regex = /(abc*??)/;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000396", () => {
    //     let regex = /(abc*??)/u;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000397", () => {
    //     let regex = /(?<=ab)+/;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000398", () => {
    //     let regex = /(?<=ab)+/u;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000399", () => {
    //     let regex = /(?<=ab)*/;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000400", () => {
    //     let regex = /(?<=ab)*/u;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000401", () => {
    //     let regex = /(?<=ab)?/;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000402", () => {
    //     let regex = /(?<=ab)?/u;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000403", () => {
    //     let regex = /(?<=ab){1,}/;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000404", () => {
    //     let regex = /(?<=ab){1,}/u;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000405", () => {
    //     let regex = /(?<=ab){1,1}/;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000406", () => {
    //     let regex = /(?<=ab){1,1}/u;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000407", () => {
    //     let regex = /(?<=ab){1,3}/;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000408", () => {
    //     let regex = /(?<=ab){1,3}/u;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000409", () => {
    //     let regex = /(?<=ab){3,1}/;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000410", () => {
    //     let regex = /(?<=ab){3,1}/u;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000411", () => {
    //     let regex = /(ab(?<=ab)+)+/;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000412", () => {
    //     let regex = /(ab(?<=ab)+)+/u;
    //     const target = "abc";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000413", () => {
        let regex = /(ab(?=ab)+)+/;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000414", () => {
    //     let regex = /(ab(?=ab)+)+/u;
    //     const target = "abab";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000415", () => {
        let regex = /(?=ab)+/;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000416", () => {
    //     let regex = /(?=ab)+/u;
    //     const target = "abab";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000417", () => {
        let regex = /(?!ab)*/;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000418", () => {
    //     let regex = /(?!ab)*/u;
    //     const target = "abab";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000419", () => {
    //     let regex = /(?<=ab)+/;
    //     const target = "abab";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000420", () => {
    //     let regex = /(?<=ab)+/u;
    //     const target = "abab";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000421", () => {
    //     let regex = /(?<!ab)?/;
    //     const target = "abab";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000422", () => {
    //     let regex = /(?<!ab)?/u;
    //     const target = "abab";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000423", () => {
        let regex = /(?<=a+)b/;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000424", () => {
        let regex = /(?<=a+)b/u;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000425", () => {
        let regex = /(?<=a*)b/;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000426", () => {
        let regex = /(?<=a*)b/u;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000427", () => {
        let regex = /(?<=a{1,3})b/;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000428", () => {
        let regex = /(?<=a{1,3})b/u;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000429", () => {
        let regex = /(?<=\w+)b/;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000430", () => {
        let regex = /(?<=\w+)b/u;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000431", () => {
        let regex = /(?<=ab|abc)b/;
        const target = "abcb";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000432", () => {
        let regex = /(?<=ab|abc)b/u;
        const target = "abb";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000433", () => {
        let regex = /(?<=abc)b/;
        const target = "abcb";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000434", () => {
        let regex = /(?<=abc)b/u;
        const target = "abcb";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000435", () => {
        let regex = /(?<=\d{3})x/;
        const target = "123x";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000436", () => {
        let regex = /(?<=\d{3})x/u;
        const target = "123x";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000437", () => {
        let regex = /(?<=ab|cd)x/;
        const target = "cdx";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000438", () => {
        let regex = /(?<=ab|cd)x/u;
        const target = "abx";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000439", () => {
        let regex = /(?:(?=ab))+/;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000440", () => {
        let regex = /(?:(?=ab))+/u;
        const target = "abab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000441", () => {
        let regex = /(?<=a|bc|def)g/;
        const target = "defg";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000442", () => {
        let regex = /(?<=a|bc|def)g/u;
        const target = "bcg";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000443", () => {
        let regex = /(?<=ab|cd)g/;
        const target = "cdg";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000444", () => {
        let regex = /(?<=ab|cd)g/u;
        const target = "abg";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000445", () => {
        let regex = /(?<=a{2,4})b/;
        const target = "aab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000446", () => {
        let regex = /(?<=a{2,4})b/u;
        const target = "aab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000447", () => {
        let regex = /(?<=\d+)b/;
        const target = "1b";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000448", () => {
        let regex = /(?<=\d+)b/u;
        const target = "1b";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000449", () => {
        let regex = /(?<=a*)b/;
        const target = "b";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000450", () => {
        let regex = /(?<=a*)b/u;
        const target = "ab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000451", () => {
        let regex = /(?<=a{3})b/;
        const target = "aaab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000452", () => {
        let regex = /(?<=a{3})b/u;
        const target = "aaab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000453", () => {
        let regex = /(?<=(a+))b/;
        const target = "aaab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000454", () => {
        let regex = /(?<=(a+))b/u;
        const target = "aaab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000455", () => {
        let regex = /(?<=(abc))d/;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000456", () => {
        let regex = /(?<=(abc))d/u;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // 6. /(?<=a(?<=b+))c/
    test("Groups(): Case0000457", () => {
        let regex = /(?<=a(?<=b+))c/;
        const target = "a(bb)c";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Groups(): Case0000458", () => {
        let regex = /(?<=a(?<=b+))c/u;
        const target = "abc";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    // 9. /(?=(\1))/
    test("Groups(): Case0000459", () => {
        let regex = /(?=(\1))/;
        // @info: matches with anything
        const target = "any35}{[thin%g";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000460", () => {
        let regex = /(?=(\1))\1/u;
        // @info: matches with anything
        const target = "any35}{[thin%g";
        console.log("output46000: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // // 10. /(?=(?<x>a)\k<y>)/
    // test("Groups(): Case0000461", () => {
    //     let regex = /(?=(?<x>a)\k<y>)/;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000462", () => {
    //     let regex = /(?=(?<x>a)\k<y>)/u;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // 11. /(?=(?<x>a))(?=(?<x>b))/
    // test("Groups(): Case00004563", () => {
    //     let regex = /(?=(?<x>a))(?=(?<x>b))/;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    test("Groups(): Case0000464", () => {
        let regex = /(?=(?<x>a))(?=(?<x>b))/u;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // 12. /(?=\xZ)/
    test("Groups(): Case0000465", () => {
        let regex = /(?=\xZ)/;
        const target = "xZ";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000466", () => {
    //     let regex = /(?=\xZ)/u;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // 12. /(?<=\u123)/
    test("Groups(): Case0000467", () => {
        let regex = /(?<=\u123)/;
        const target = "u123";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000468", () => {
    //     let regex = /(?<=\u123)/u;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // 13. /(?<=\p{Letter}+)x/u
    test("Groups(): Case0000469", () => {
        let regex = /(?<=\p{Letter}+)x/;
        const target = "p{Letter}}x";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000470", () => {
        let regex = /(?<=\p{Letter}+)x/u;
        const target = "abx";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // 14. /[ (?=a) ]/
    test("Groups(): Case0000471", () => {
        let regex = /[ (?=a) ]/;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000472", () => {
        let regex = /[ (?=a) ]/u;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // 15. /(?=a)+*/
    // test("Groups(): Case0000473", () => {
    //     let regex = /(?=a)+*/;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000474", () => {
    //     let regex = /(?=a)+*/u;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // 16. /(?=[z-a])/
    // test("Groups(): Case0000475", () => {
    //     let regex = /(?=[z-a])/;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000476", () => {
    //     let regex = /(?=[z-a])/u;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // 17. /(?=abc
    // test("Groups(): Case0000477", () => {
    //     let regex = /(?=abc;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000478", () => {
    //     let regex = /(?=abcu;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // 18. /(?<=\1(a))b/
    test("Groups(): Case0000479", () => {
        let regex = /(?<=\1(a))b/;
        const target = "1(a)b";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Groups(): Case0000480", () => {
        let regex = /(?<=\1(a))b/u;
        const target = "ab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    // 19. /(?<=>a)b/
    test("Groups(): Case0000481", () => {
        let regex = /(?<=>a)b/;
        const target = ">ab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000482", () => {
        let regex = /(?<=>a)b/u;
        const target = ">ab";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // 20. /(?<=a{1,3})b/u
    test("Groups(): Case0000483", () => {
        let regex = /(?<=a{1,3})b/;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000484", () => {
        let regex = /(?<=a{1,3})b/u;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // 21. /(?=a)+/u
    test("Groups(): Case0000485", () => {
        let regex = /(?=a)+/;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000486", () => {
    //     let regex = /(?=a)+/u;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // 22. /(?=(a)\2)/
    test("Groups(): Case0000487", () => {
        let regex = /(?=(a)\2)/;
        const target = "a\x02";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000488", () => {
    //     let regex = /(?=(a)\2)/u;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // 23. /(?<=\1)(a)/
    test("Groups(): Case0000489", () => {
        let regex = /(?<=\1)(a)/;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000490", () => {
        let regex = /(?<=\1)(a)/u;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // 27. /(?<1>a)/
    // test("Groups(): Case0000491", () => {
    //     let regex = /(?<1>a)/;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // test("Groups(): Case0000492", () => {
    //     let regex = /(?<1>a)/u;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });

    // 28. /(?=\p{FakeProperty})/u
    test("Groups(): Case0000493", () => {
        let regex = /(?=\p{FakeProperty})/;
        const target = "p{FakeProperty}";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000494", () => {
    //     let regex = /(?=\p{FakeProperty})/u;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });
    
    // 7. /(?<=)a/
    test("Groups(): Case0000495", () => {
        let regex = /(?<=)a/;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000496", () => {
        let regex = /(?<=)a/u;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });
    
    // 8. /(?<=a)b/
    test("Groups(): Case0000497", () => {
        let regex = /(?<=a)b/;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000498", () => {
        let regex = /(?<=a)b/u;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });
    
    // 21. /(?=a)+/
    test("Groups(): Case0000499", () => {
        let regex = /(?=a)+/;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000500", () => {
    //     let regex = /(?=a)+/u;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });
    
    // 24. /(?=(?=a))/
    test("Groups(): Case0000501", () => {
        let regex = /(?=(?=a))/;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000502", () => {
        let regex = /(?=(?=a))/u;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });
    
    // 25. /(?=(?=(?=a)))*/
    test("Groups(): Case0000503", () => {
        let regex = /(?=(?=(?=a)))*/;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Groups(): Case0000504", () => {
    //     let regex = /(?=(?=(?=a)))*/u;
    //     const target = "abcd";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });
    
    // 26. /(?: (?<=a)b )+/
    test("Groups(): Case0000505", () => {
        let regex = /(?: (?<=a)b )+/;
        const target = " ab ";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Groups(): Case0000506", () => {
        let regex = /(?: (?<=a)b )+/u;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });
    
    // 29. /(?<=^a)b/
    test("Groups(): Case0000507", () => {
        let regex = /(?<=^a)b/;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Groups(): Case0000508", () => {
        let regex = /(?<=^a)b/u;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });
    
    // 30. /(?=a)(?!a)/
    test("Groups(): Case0000509", () => {
        let regex = /(?=a)(?!a)/;
        const target = "aa";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });

    test("Groups(): Case0000510", () => {
        let regex = /(?=a)(?!a)/u;
        const target = "abcd";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), false);
    });
}

testMain();

// GPTs errors

// Below all do not throw any error, however you said all below are invalid and so.
//    // /(?=ab)+/ <- throws in u mode only
//    // /(?!ab)*/ <- throws in u mode only
//    // /(?<=a+)b/ <- doesn't throw in any mode
//    // /(?<=a*)b/ <- doesn't throw in any mode
//    // /(?<=a{1,3})b/ <- doesn't throw in any mode
//    // /(?<=\w+)b/ <- doesn't throw in any mode
//    // /(?<=ab|abc)b/ <- doesn't throw in any mode
//    // /(?<=a|bc|def)g/ <- doesn't throw in any mode

//    // /(?<=a{2,4})b/ <- doesn't throw in any mode
//    // /(?<=\d+)b/ <- doesn't throw in any mode
//    // /(?<=a*)b/ <- doesn't throw in any mode
//    // /(?<=(a+))b/ <- doesn't throw in any mode

// 6. /(?<=a(?<=b+))c/ <- doesn't throw in any mode
// 9. /(?=(\1))/ <- doesn't throw in any mode
// 12. /(?=\xZ)/ <- doesn't throw in legacy mode
// 12. /(?<=\u123)/ <- doesn't throw in legacy mode
// 13. /(?<=\p{Letter}+)x/u <- doesn't throw in any mode
// 14. /[ (?=a) ]/ <- doesn't throw in any mode
// 18. /(?<=\1(a))b/ <- doesn't throw in any mode
// 19. /(?<=>a)b/ <- doesn't throw in any mode
// 20. /(?<=a{1,3})b/u  <- doesn't throw in any mode
// 21. /(?=a)+/u <- doesn't throw in legacy mode
// 22. /(?=(a)\2)/ <- doesn't throw in legacy mode
// 23. /(?<=\1)(a)/ <- doesn't throw in any mode
// 28. /(?=\p{FakeProperty})/u  <- doesn't throw in legacy mode

// GPT says valid

// 7. /(?<=)a/ <- doesn't throw in any mode
// 8. /(?<=a)b/ <- doesn't throw in any mode
// 20. /(?<=a)b/u  <- doesn't throw in any mode
// 21. /(?=a)+/ <- doesn't throw in in legacy mode but throws in restrict mode (with u flag)
// 24. /(?=(?=a))/ <- doesn't throw in any mode
// 25. /(?=(?=(?=a)))*/ <- doesn't throw in legacy mode but throws in restrict mode (with u flag)
// 26. /(?: (?<=a)b )+/ <- doesn't throw in any mode
// 29. /(?<=^a)b/  <- doesn't throw in any mode
// 30. /(?=a)(?!a)/ <- doesn't throw in any mode
