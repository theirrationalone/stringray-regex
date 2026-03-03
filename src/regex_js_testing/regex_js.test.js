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
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case002", () => {
        // let regex = /\07/;
        // const target = "\u0007";
        let regex = /\107/;
        const target = "\u0047";
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
        let regex = /[--a]/u;
        const target = "-";
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
        let regex = /[\c_]/;
        const target = "c_";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    // test("Character Classes[]: Case000106", () => {
    //     let regex = /[\c_]/u;
    //     const target = "c_";
    //     console.log("output: ", target.match(regex));
    //     assert.strictEqual(regex.test(target), true);
    // });
}

testMain();