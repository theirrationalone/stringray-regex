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
        let regex = /{/u;
        const target = "{";
        console.log("dot: ", target.match(regex));
        assert.strictEqual(regex.test(target), true);
    });
}

testMain();