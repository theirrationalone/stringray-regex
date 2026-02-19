// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {Stringray} from "../src/Stringray.sol";

contract PlayStringTest is Test {
    using Stringray for string;

    function setUp() external {
        // done
    }

    function testRegexLiteralsCase1() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/a/";
        target.regex(pattern);

        pattern = unicode"/b/";
        target.regex(pattern);

        pattern = unicode"/1/";
        target.regex(pattern);

        pattern = unicode"/_/";
        target.regex(pattern);

        pattern = unicode"/€/";
        target.regex(pattern);

        pattern = unicode"/क/";
        target.regex(pattern);

        pattern = unicode"/あ/";
        target.regex(pattern);

        pattern = unicode"/😀/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase2() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/hello/";
        target.regex(pattern);

        pattern = unicode"/anil/";
        target.regex(pattern);

        pattern = unicode"/abc/";
        target.regex(pattern);

        pattern = unicode"/123/";
        target.regex(pattern);

        pattern = unicode"/😀🚀🔥/";
        target.regex(pattern);

        pattern = unicode"/abc123/";
        target.regex(pattern);

        pattern = unicode"/कखग/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase3() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\$/";
        target.regex(pattern);

        pattern = unicode"/\\./";
        target.regex(pattern);

        pattern = unicode"/\\*/";
        target.regex(pattern);

        pattern = unicode"/\\+/";
        target.regex(pattern);

        pattern = unicode"/\\?/";
        target.regex(pattern);

        pattern = unicode"/\\(/";
        target.regex(pattern);

        pattern = unicode"/\\)/";
        target.regex(pattern);

        pattern = unicode"/\\{/";
        target.regex(pattern);

        pattern = unicode"/\\}/";
        target.regex(pattern);

        pattern = unicode"/\\[/";
        target.regex(pattern);

        pattern = unicode"/\\]/";
        target.regex(pattern);

        pattern = unicode"/\\|/";
        target.regex(pattern);

        pattern = unicode"/\\\\/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase4() public pure {
        string memory target = "anything";

        // @Note: \x41 or any valid sequence with \xHH would be interpolated as a hexadecimal character
        // automatically (builtin capability of solidity)
        // So, for \xHH explicit support we do escape the backspace with preceding backslash \ followed by a backslash \
        // along with valid Hexdecimal sequences i.e., \\xHH
        // string memory pattern = unicode"/\x41/";
        string memory pattern = unicode"/\\x41/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase5() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\x4/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase6() public pure {
        string memory target = "anything";

        // @Note: \u0061 or any valid sequence with \uHHHH would be interpolated as a hexadecimal character
        // automatically (builtin capability of solidity)
        // So, for \uHHHH explicit support we do escape the backspace with preceding backslash \ followed by a backslash \
        // along with valid Hexdecimal sequences i.e., \\uHHHH
        // string memory pattern = unicode"/\u0061/";
        string memory pattern = unicode"/\\u0061/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase7() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u61/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase8() public pure {
        string memory target = "anything";

        // @Note: solidity doesn't support vanila unicode escape \u{HHHHH}
        string memory pattern = unicode"/\\u{1F600}/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase9() public pure {
        string memory target = "anything";

        // @Note: solidity has newline \n support
        // So, for explict support we do escape the backspace with preceding backslash \ followed by a backslash \
        // i.e., \\n
        string memory pattern = unicode"/\n/";
        target.regex(pattern);

        pattern = unicode"/\\n/";
        target.regex(pattern);

        // @Note: solidity has carriage return \r support
        // So, for explict support we do escape the backspace with preceding backslash \ followed by a backslash \
        // i.e., \\r
        pattern = unicode"/\r/";
        target.regex(pattern);

        pattern = unicode"/\\r/";
        target.regex(pattern);

        // @Note: solidity has tab \t support
        // So, for explict support we do escape the backspace with preceding backslash \ followed by a backslash \
        // i.e., \\t
        pattern = unicode"/\t/";
        target.regex(pattern);

        pattern = unicode"/\\t/";
        target.regex(pattern);

        // @Note: Solidity doesn't support \v escape
        // pattern = unicode"/\v/";
        // target.regex(pattern);

        pattern = unicode"/\\v/";
        target.regex(pattern);

        // @Note: Solidity doesn't support \f escape
        // pattern = unicode"/\f/";
        // target.regex(pattern);

        pattern = unicode"/\\f/";
        target.regex(pattern);

        // @Note: Solidity doesn't support \0 escape
        // pattern = unicode"/\0/";
        // target.regex(pattern);

        pattern = unicode"/\\0/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase10() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\//";
        target.regex(pattern);
    }

    function testRegexLiteralsCase11() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/a\\/b/";
        target.regex(pattern);

        // pattern = unicode"/a/b/";
        pattern = unicode"/a\\\\/b/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase12() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/ab/g";
        target.regex(pattern);

        pattern = unicode"/ab/i";
        target.regex(pattern);

        pattern = unicode"/ab/m";
        target.regex(pattern);

        pattern = unicode"/ab/s";
        target.regex(pattern);

        pattern = unicode"/ab/u";
        target.regex(pattern);

        pattern = unicode"/ab/y";
        target.regex(pattern);

        pattern = unicode"/ab/d";
        target.regex(pattern);

        pattern = unicode"/a/d";
        target.regex(pattern);

        pattern = unicode"/b/\\";
        target.regex(pattern);
    }

    function testRegexLiteralsCase13() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{110000}/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase14() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/./";
        target.regex(pattern);
    }
}
