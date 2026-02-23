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

    function testRegexLiteralsCase15() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\./";
        target.regex(pattern);
    }

    function testRegexLiteralsCase15a() public pure {
        string memory target = "anything";

        // @Note: Keep it in mind: one pair of \\ is considered as one backslash \ because we can't place
        // a single backspace \ directly, solidity inferred that as an invalid escape sequence.
        // Moreover, for the sake of escape, we have to use one pair of backspaces \\ i.e., to escape a .
        // we would use \\., to escape a backspace: \\\\ -> here first pair of \\ inferred as a single backspace
        // and single backspace escapes nothing so if we leave a pair of backspace \\ into the regex /\\/ then that will
        // throw an error, that way second pair of backspace \\ followed by the first pair \\ \\ will make sense as
        // a legit valid escape for a backspace \.

        string memory pattern = unicode"/\\\\./";
        target.regex(pattern);
    }

    // function testRegexLiteralsCase16() public pure {
    //     string memory target = "anything";

    //     string memory pattern = unicode"/.
    //     /";
    //     target.regex(pattern);
    // }

    function testRegexLiteralsCase17() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/{/u";
        target.regex(pattern);
    }

    function testRegexLiteralsCase18() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/0,1}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsCase19() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/1/u";
        target.regex(pattern);
    }

    function testRegexLiteralsCase20() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/,/u";
        target.regex(pattern);
    }

    function testRegexLiteralsCase21() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/1,/u";
        target.regex(pattern);
    }

    function testRegexLiteralsCase22() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/1,2/u";
        target.regex(pattern);
    }

    function testRegexLiteralsCase23() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/2,1/u";
        target.regex(pattern);
    }

    function testRegexLiteralsCase24() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase25() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/)/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase26() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[aa/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase27() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/]/u";
        target.regex(pattern);
    }

    function testRegexLiteralsCase28() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/?/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase29() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\?/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase30() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/+/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase31() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\+/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase32() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/*/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase33() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\*/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase34() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/a???/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase35() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/a??/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase36() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/a+??/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase37() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/a+?/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase38() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/a*??/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase39() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/a*?/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase40() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/a^|$sian/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase1() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\08/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase2() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\107/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase3() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\377/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase4() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\400/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase5() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\777/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase6() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\378/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase7() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\397/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase8() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\a/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase9() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\0/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase10() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\00/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase11() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\000/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase12() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\08/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase13() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\008/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase14() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\000/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase15() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\118/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase16() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\988/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase17() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\0988/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase18() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\\\a/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase19() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\_/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase20() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\_/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase21() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\!/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase22() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\!/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase23() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{1F600}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase24() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{1F600}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase25() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase26() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u/u";
        target.regex(pattern);
    }
}
