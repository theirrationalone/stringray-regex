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
        // let regex = /[]/u;
        const target = "[]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
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
        const target = "[]";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
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
        // let regex = /a^sian/;
        let regex = /\08/;
        const target = "\x008";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case002", () => {
        // let regex = /a^sian/;
        // let regex = /\07/;
        // const target = "\u0007";
        let regex = /\038/;
        const target = "\u00038";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case003", () => {
        // let regex = /a^sian/;
        let regex = /\a/;
        const target = "a";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });

    test("Regex-Literals-escape_seqs: Case004", () => {
        // let regex = /a^sian/;
        let regex = /\8/;
        const target = "8";
        console.log("output: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });
}

testMain();