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

    function testRegexLiteralsEscapeSeqsCase27() public pure {
        string memory target = "anything";

        // @NOTE: Doesn't either Throw error or fail silently.
        // Exclusive to solidity, not in Js whatsoever, Js makes it silently fail [returns null or false accordingly]
        // In solidity, \c matches with c literal
        string memory pattern = unicode"/\\c/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase28() public pure {
        string memory target = "anything";
        // @NOTE: Common in both Solidity & Js, Throws error
        string memory pattern = unicode"/\\c/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase29() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\cA/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase30() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\cA/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase31() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\ca/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase32() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\ca/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase33() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\c1/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase34() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\c1/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase35() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{23,20}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase36() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{230,240}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase37() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{23335}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase38() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{23335,}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase39() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{,23335}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase40() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{,}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase41() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase42() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{1}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase43() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/{1}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase44() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{1:1}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase45() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u1234/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase46() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u123/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase47() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u1234/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase48() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u123/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase49() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u12345/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase50() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u1/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase51() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u12/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase52() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u1/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase53() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\u12/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase54() public pure {
        string memory target = "anything";

        // @NOTE: Throws different error msg than Js therefore (exclusive to solidity)
        string memory pattern = unicode"/[abc/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase55() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(abc/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase56() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(?<1>a)/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase57() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(?<a-b>a)/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase58() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\k<a>/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase59() public pure {
        string memory target = "anything";

        // @BUG found
        // @Status: not resolved, missing captured group functionality
        string memory pattern = unicode"/\\k<a>/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase60() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{L}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase61() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{XYZ}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase62() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{L}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase63() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{XYZ}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase64() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/{122222}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase65() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/{}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase66() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/{}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase67() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/{/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase68() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/{/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase69() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/{,11}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase70() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/{,11}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase71() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase72() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase73() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/1/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase74() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/1/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase75() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/143242/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase76() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/143242/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase77() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/1}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase78() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/1}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase79() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/123424}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase80() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/123424}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase81() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/1234,24/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase82() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/1234,24/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase83() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/1234,24}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase84() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/1234,24}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase85() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase86() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase87() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{=LETTER}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase88() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{=LETTER}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase89() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{g=LETTER}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase90() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{g=LETTER}/u";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase91() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{gc=Letter}/";
        target.regex(pattern);
    }

    function testRegexLiteralsEscapeSeqsCase92() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{gc=Letter}/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase1() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase2() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase3() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[.]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase4() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[.]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase5() public pure {
        string memory target = "anything";

        // @BUG: Throwing error due to '(' or ')' paranthesis
        // @STATUS: Fixed ✅
        string memory pattern = unicode"/[abc123_,:;!@#%&(){}?*+$^/|\"'<>=`~ ]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase6() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[abc123_,:;!@#%&(){}?*+$^/|\"'<>=`~ ]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase7() public pure {
        string memory target = "anything";

        // @NOTE: Exclusive to solidity!
        // Solidity  : SyntaxError: Invalid regular expression: /[abc/: Unterminated Character class
        // Javascript: SyntaxError: Invalid regular expression: missing /
        string memory pattern = unicode"/[abc/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase8() public pure {
        string memory target = "anything";

        // @NOTE: Exclusive to solidity!
        // Solidity  : SyntaxError: Invalid regular expression: /[abc/u: Unterminated Character class
        // Javascript: SyntaxError: Invalid regular expression: missing /

        string memory pattern = unicode"/[abc/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase9() public pure {
        string memory target = "anything";

        // @INFO: Weird behavior, Matches literally everything, each and every possible literal
        string memory pattern = unicode"/[^]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase10() public pure {
        string memory target = "anything";

        // @INFO: Weird behavior, Matches literally everything, each and every possible literal
        string memory pattern = unicode"/[^]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase11() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a-z]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase12() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a-z]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase13() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[z-a]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase14() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[z-a]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase15() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a-\\d]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase16() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a-\\d]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase17() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\d-a]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase18() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\d-a]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase19() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a-\\w]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase20() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a-\\w]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase21() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\w-a]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase22() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\w-a]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase23() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\w-\\d]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase24() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\w-\\d]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase25() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\d-\\w]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase26() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\d-\\w]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase27() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\d-\\d]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase28() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\d-\\d]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase29() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\w-\\w]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase30() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\w-\\w]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase31() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a-c-h]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase32() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a-c-h]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase33() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[-a]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase34() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[-a]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase35() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a-]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase36() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a-]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase37() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a--z]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase38() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a--z]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase39() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[--a]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase40() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[--a]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase41() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\8]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase42() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\8]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase43() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\u123]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase44() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\u123]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase45() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\u0123]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase46() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\u0123]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase47() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase48() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase49() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\0]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase50() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\0]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase51() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\00]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase52() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\00]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase53() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\000]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase54() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\000]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase55() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\377]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase56() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\377]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase57() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\1]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase58() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\1]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase59() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a)[\\1]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase60() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a)[\\1]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase61() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[(a)\\1]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase62() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[(a)\\1]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase63() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\p{Letter}]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase64() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\p{Letter}]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase65() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\p{}]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase66() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\p{}]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase67() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\p{LETTER}]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase68() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\p{LETTER}]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase69() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\x00]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase70() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\x00]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase71() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\xg1]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase72() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\xg1]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase73() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\k]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase74() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\k]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase75() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[(?<a>a)\\k<a>]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase76() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[(?<a>a)\\k<a>]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase77() public pure {
        string memory target = "anything";

        // @NOTE: it's different here...
        //  According to Js regex, if there's any group exist then \k always first tries
        // reference the group name, if no associated group reference found then
        // engine throws error: Invalid escape
        // @STATUS: missing \k complete funcitonality, yet to get implemented
        string memory pattern = unicode"/(?<a>a)[\\k<a>]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase78() public pure {
        string memory target = "anything";

        // @NOTE: Throwing error as expected.
        // @CAUTION: Working as expected doesn't mean working well and accurately
        // still missing funcitonality
        string memory pattern = unicode"/(?<a>a)[\\k<a>]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase79() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\k<a>]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase80() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\k<a>]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase81() public pure {
        string memory target = "anything";

        // @NOTE: Same case as of Case77
        string memory pattern = unicode"/(?<b>a)\\k<a>/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase82() public pure {
        string memory target = "anything";

        // @NOTE: Here we can distinguish this case with case78
        // Here, it's not throwing error unexpectedly
        // @REASON: Missing \k complete functionality
        string memory pattern = unicode"/(?<b>a)\\k<a>/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase83() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[✅-🧪]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase84() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[✅-🧪]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase85() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[🧪-✅]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase86() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[🧪-✅]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase87() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[€-क]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase88() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[€-क]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase89() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[क-€]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase90() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[क-€]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase91() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\uc290-\\uc295]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase92() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\uc290-\\uc295]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase93() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\uc295-\\uc290]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase94() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\uc295-\\uc290]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase95() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\^-\\$]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase96() public pure {
        string memory target = "anything";

        // @BUG: throwing invalid escape error...
        // @STATUS: RESOLVED!
        string memory pattern = unicode"/[\\^-\\$]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase97() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\$-\\^]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase98() public pure {
        string memory target = "anything";

        // @BUG: throwing invalid escape error...
        // @STATUS: RESOLVED!
        string memory pattern = unicode"/[\\$-\\^]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase99() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\c-b]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase100() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\c-b]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase101() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[b-\\c]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase102() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[b-\\c]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase103() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\c_/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase104() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/\\c_/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase105() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a\\c_z]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase106() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[a\\c_z]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase107() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[_-,]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase108() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[_-,]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase109() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[,-_]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase110() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[,-_]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase111() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[:-;]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase112() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[:-;]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase113() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[;-:]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase114() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[;-:]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase115() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[!-@]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase116() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[!-@]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase117() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[@-!]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase118() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[@-!]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase119() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[#-%]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase120() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[#-%]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase121() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[%-#]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase122() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[%-#]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase123() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[&-(]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase124() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[&-(]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase125() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[(-&]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase126() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[(-&]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase127() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[)-$]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase128() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[)-$]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase129() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[$-)]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase130() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[$-)]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase131() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[^-{]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase132() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[^-{]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase133() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[{-^]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase134() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[{-^]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase135() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\^-{]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase136() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\\^-{]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase137() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[{-\\^]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase138() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[{-\\^]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase139() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[}-?]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase140() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[}-?]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase141() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[?-}]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase142() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[?-}]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase143() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[+-*]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase144() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[+-*]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase145() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[*-+]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase146() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[*-+]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase147() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[/-|]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase148() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[/-|]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase149() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[|-/]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase150() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[|-/]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase151() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\"-']/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase152() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[\"-']/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase153() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/['-\"]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase154() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/['-\"]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase155() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[<->]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase156() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[<->]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase157() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[>-<]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase158() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[>-<]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase159() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[=-`]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase160() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[=-`]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase161() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[`-=]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase162() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[`-=]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase163() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[`-~]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase164() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[`-~]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase165() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[~-`]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase166() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[~-`]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase167() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[[]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase168() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[[]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase169() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[[-b]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase170() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[[-b]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase171() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[b-[]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase172() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[b-[]/u";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase173() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[ab]a]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassesCase174() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/[ab]a]/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase1() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase2() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase3() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(abcdefjklmnostuvwxyz)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase4() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(abcdefjklmnostuvwxyz)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase5() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(abcd-ghij)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase6() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(abcd-ghij)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase7() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(abcd/ghij)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase8() public pure {
        string memory target = "anything";

        // @BUG: not throwing error in u mode
        // @Status: Fixed ✅
        string memory pattern = unicode"/(abcd/ghij)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase9() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(abcd!@#%=';:><.,~`\"&ghij)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase10() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(abcd!@#%=';:><.,~`\"&ghij)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase11() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase12() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase13() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\e\\j\\k\\l\\m\\o\\y\\z)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase14() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\e\\j\\k\\l\\m\\o\\y\\z)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase15() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\-\\g\\h\\i\\j)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase16() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\-\\g\\h\\i\\j)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase17() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\/\\g\\h\\i\\j)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase18() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\/\\g\\h\\i\\j)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase19() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\!\\@\\#\\%\\=\\'\\;\\:\\>\\<\\.\\,\\~\\`\\\"\\&\\g\\h\\i\\j)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase20() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\!\\@\\#\\%\\=\\'\\;\\:\\>\\<\\.\\,\\~\\`\\\"\\&\\g\\h\\i\\j)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase21() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\n)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase22() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\n)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase23() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\b)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase24() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\b)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase25() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\f)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase26() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\f)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase27() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\d)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase28() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\d)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase29() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\r)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase30() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\r)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase31() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\s)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase32() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\s)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase33() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\t)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase34() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\t)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase35() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\v)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase36() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\v)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase37() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\w)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase38() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\w)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase39() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\B)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase40() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\B)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase41() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\D)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase42() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\D)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase43() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\S)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase44() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\S)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase45() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\W)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase46() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\W)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase47() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\^)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase48() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\^)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase49() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\$)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase50() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\$)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase51() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\\\)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase52() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\\\)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase53() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\.)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase54() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\.)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase55() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\*)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase56() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\*)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase57() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\+)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase58() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\+)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase59() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\?)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase60() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\?)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase61() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\[)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase62() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\[)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase63() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase64() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase65() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\()/";
        target.regex(pattern);
    }

    function testRegexGroupsCase66() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\()/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase67() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\))/";
        target.regex(pattern);
    }

    function testRegexGroupsCase68() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\))/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase69() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\{)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase70() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase71() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\|)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase72() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\|)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase73() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\/)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase74() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\/)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase75() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a)/";
        target.regex(pattern);

        pattern = unicode"/(b)/";
        target.regex(pattern);

        pattern = unicode"/(1)/";
        target.regex(pattern);

        pattern = unicode"/(_)/";
        target.regex(pattern);

        pattern = unicode"/(€)/";
        target.regex(pattern);

        pattern = unicode"/(क)/";
        target.regex(pattern);

        pattern = unicode"/(あ)/";
        target.regex(pattern);

        pattern = unicode"/(😀)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase76() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(hello)/";
        target.regex(pattern);

        pattern = unicode"/(anil)/";
        target.regex(pattern);

        pattern = unicode"/(abc)/";
        target.regex(pattern);

        pattern = unicode"/(123)/";
        target.regex(pattern);

        pattern = unicode"/(😀🚀🔥)/";
        target.regex(pattern);

        pattern = unicode"/(abc123)/";
        target.regex(pattern);

        pattern = unicode"/(कखग)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase77() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\^)/";
        target.regex(pattern);

        pattern = unicode"/(\\$)/";
        target.regex(pattern);

        pattern = unicode"/(\\.)/";
        target.regex(pattern);

        pattern = unicode"/(\\*)/";
        target.regex(pattern);

        pattern = unicode"/(\\+)/";
        target.regex(pattern);

        pattern = unicode"/(\\?)/";
        target.regex(pattern);

        pattern = unicode"/(\\()/";
        target.regex(pattern);

        pattern = unicode"/(\\))/";
        target.regex(pattern);

        pattern = unicode"/(\\{)/";
        target.regex(pattern);

        pattern = unicode"/(\\})/";
        target.regex(pattern);

        pattern = unicode"/(\\[)/";
        target.regex(pattern);

        pattern = unicode"/(\\])/";
        target.regex(pattern);

        pattern = unicode"/(\\|)/";
        target.regex(pattern);

        pattern = unicode"/(\\\\)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase78() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\x41)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase79() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u0061)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase80() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{1F600})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase81() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\n)/";
        target.regex(pattern);

        pattern = unicode"/(\\n)/";
        target.regex(pattern);

        pattern = unicode"/(\r)/";
        target.regex(pattern);

        pattern = unicode"/(\\r)/";
        target.regex(pattern);

        pattern = unicode"/(\t)/";
        target.regex(pattern);

        pattern = unicode"/(\\t)/";
        target.regex(pattern);

        pattern = unicode"/(\\v)/";
        target.regex(pattern);

        pattern = unicode"/(\\f)/";
        target.regex(pattern);

        pattern = unicode"/(\\0)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase82() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\/)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase83() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a/b)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase84() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(ab)/\\";
        target.regex(pattern);
    }

    function testRegexGroupsCase85() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{110000})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase86() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\c1)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase87() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\ugg)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase88() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(.)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase89() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\.)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase90() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\r.)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase91() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/({)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase92() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase93() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(1)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase94() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(,)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase95() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(1,)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase96() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(1,2)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase97() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(2,1)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase98() public pure {
        string memory target = "anything";

        // @info: inconsistent error msgs
        string memory pattern = unicode"/(()/";
        target.regex(pattern);
    }

    function testRegexGroupsCase99() public pure {
        string memory target = "anything";

        // @info: inconsistent error msgs
        string memory pattern = unicode"/())/";
        target.regex(pattern);
    }

    function testRegexGroupsCase100() public pure {
        string memory target = "anything";

        // @info: inconsistent error msgs
        string memory pattern = unicode"/([])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase101() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase102() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase103() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(?)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase104() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\?)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase105() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(+)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase106() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\+)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase107() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(*)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase108() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\*)/";
        target.regex(pattern);
    }

    // function testRegexGroupsCase109() public pure {
    //     string memory target = "anything";

    //     string memory pattern = unicode"/(*)/";
    //     target.regex(pattern);
    // }

    // function testRegexGroupsCase110() public pure {
    //     string memory target = "anything";

    //     string memory pattern = unicode"/(\\*)/";
    //     target.regex(pattern);
    // }

    function testRegexGroupsCase109() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a???)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase110() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a??)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase111() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a+??)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase112() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a+?)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase113() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a*??)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase114() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a*?)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase115() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(asian)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase116() public pure {
        string memory target = "anything";
        // @BUG: returning complete \08 as null character
        string memory pattern = unicode"/(\\08)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase117() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\107)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase118() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\377)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase119() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\400)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase120() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\777)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase121() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a^|$sian)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase122() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\378)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase123() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\397)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase124() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase125() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\0)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase126() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\00)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase127() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\000)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase128() public pure {
        string memory target = "anything";
        // @BUG: returning complete \08 as null character
        // @Status: Fixed ✅
        string memory pattern = unicode"/(\\08)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase129() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\008)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase130() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\000)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase131() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\118)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase132() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\988)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase133() public pure {
        string memory target = "anything";

        // @BUG: not throwing error: Invalid decimal escape, in both cases literal and group
        // string memory pattern = unicode"/\\0988/u";
        // @Status: Fixed ✅
        string memory pattern = unicode"/(\\0988)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase134() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\\\a)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase135() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\_)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase136() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\_)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase137() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\!)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase138() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\!)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase139() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{1F600})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase140() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{1F600})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase141() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase142() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase143() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\c)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase144() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\c)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase145() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\cA)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase146() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\cA)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase147() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\ca)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase148() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\ca)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase149() public pure {
        string memory target = "anything";
        // @INFO: not throwing any error as expected however still required behavioral verification
        string memory pattern = unicode"/(\\c1)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase150() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\c1)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase151() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{23,20})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase152() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{230,240})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase153() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{23335})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase154() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{23335,})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase155() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{,23335})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase156() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{,})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase157() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase158() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{1})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase159() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/({1})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase160() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{1:1})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase161() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u1234)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase162() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u123)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase163() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u1234)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase164() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u123)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase165() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u12345)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase166() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u1)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase167() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u12)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase168() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u1)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase169() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u12)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase170() public pure {
        string memory target = "anything";

        // @NOTE: Throws different error msg than Js therefore (exclusive to solidity)
        string memory pattern = unicode"/([abc)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase171() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/((abc)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase172() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/((?<1>a))/";
        target.regex(pattern);
    }

    function testRegexGroupsCase173() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/((?<a-b>a))/";
        target.regex(pattern);
    }

    function testRegexGroupsCase174() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\k<a>)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase175() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\k<a>)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase176() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{L})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase177() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{XYZ})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase178() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{L})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase179() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{XYZ})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase180() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/({122222})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase181() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/({})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase182() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/({})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase183() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/({)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase184() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/({)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase185() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/({,11})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase186() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/({,11})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase187() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase188() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase189() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(1)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase190() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(1)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase191() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(143242)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase192() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(143242)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase193() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(1})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase194() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(1})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase195() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(123424})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase196() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(123424})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase197() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(1234,24)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase198() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(1234,24)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase199() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(1234,24})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase200() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(1234,24})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase201() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase202() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase203() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{=LETTER})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase204() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{=LETTER})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase205() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{g=LETTER})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase206() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{g=LETTER})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase207() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{gc=Letter})/";
        target.regex(pattern);
    }

    function testRegexGroupsCase208() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{gc=Letter})/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase209() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase210() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase211() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([.])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase212() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([.])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase213() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([abc123_,:;!@#%&(){}?*+$^/|\"'<>=`~ ])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase214() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([abc123_,:;!@#%&(){}?*+$^/|\"'<>=`~ ])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase215() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([abc)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase216() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([abc)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase217() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([^])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase218() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([^])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase219() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a-z])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase220() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a-z])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase221() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([z-a])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase222() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([z-a])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase223() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a-\\d])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase224() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a-\\d])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase225() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\d-a])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase226() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\d-a])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase227() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a-\\w])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase228() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a-\\w])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase229() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\w-a])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase230() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\w-a])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase231() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\w-\\d])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase232() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\w-\\d])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase233() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\d-\\w])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase234() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\d-\\w])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase235() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\d-\\d])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase236() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\d-\\d])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase237() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\w-\\w])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase238() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\w-\\w])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase239() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a-c-h])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase240() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a-c-h])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase241() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([-a])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase242() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([-a])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase243() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a-])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase244() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a-])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase245() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a--z])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase246() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a--z])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase247() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([--a])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase248() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([--a])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase249() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\8])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase250() public pure {
        string memory target = "anything";

        // @BUG: throws: Invalid escape for literal escape \8 and Invalid decimal escape for cc [\8]
        // However, should always throw Invalid escape
        // @Status: Fixed ✅
        string memory pattern = unicode"/([\\8])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase251() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\u123])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase252() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\u123])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase253() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\u0123])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase254() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\u0123])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase255() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase256() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase257() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\0])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase258() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\0])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase259() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\00])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase260() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\00])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase261() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\000])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase262() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\000])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase263() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\377])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase264() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\377])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase265() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\1])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase266() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\1])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase267() public pure {
        string memory target = "anything";
        // @BUG: not supporting nested groups
        // @Status: Fixed ✅
        string memory pattern = unicode"/((a)[\\1])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase268() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/((a)[\\1])/u";
        target.regex(pattern);
    }

    // @Last: 08 March 2026, Sun 10:05 IST, Tested last above

    function testRegexGroupsCase269() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([(a)\\1])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase270() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([(a)\\1])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase271() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\p{Letter}])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase272() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\p{Letter}])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase273() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\p{}])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase274() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\p{}])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase275() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\p{LETTER}])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase276() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\p{LETTER}])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase277() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\x001])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase278() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\x001])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase279() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\xg1])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase280() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\xg1])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase281() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\k])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase282() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\k])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase283() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([(?<a>a)\\k<a>])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase284() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([(?<a>a)\\k<a>])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase285() public pure {
        string memory target = "anything";

        // @BUG: NOT throwing error
        // @reason: currently missing group reference validation functionality
        string memory pattern = unicode"/((?<a>a)[\\k<a>])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase286() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/((?<a>a)[\\k<a>])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase287() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\k<a>])/";
        target.regex(pattern);
    }

    // function testRegexGroupsCase288() public pure {
    //     string memory target = "anything";

    //     string memory pattern = unicode"/([\\k<a>])/u";
    //     target.regex(pattern);
    // }

    function testRegexGroupsCase289() public pure {
        string memory target = "anything";

        // @BUG: NOT throwing error
        // @reason: currently missing group reference validation functionality
        string memory pattern = unicode"/((?<b>a)\\k<a>)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase290() public pure {
        string memory target = "anything";

        // @BUG: NOT throwing error
        // @reason: currently missing group reference validation functionality
        string memory pattern = unicode"/((?<b>a)\\k<a>)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase291() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([✅-🧪])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase292() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([✅-🧪])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase293() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([🧪-✅])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase294() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([🧪-✅])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase295() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([€-क])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase296() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([€-क])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase297() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([क-€])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase298() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([क-€])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase299() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\uc290-\\uc295])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase300() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\uc290-\\uc295])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase301() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\uc295-\\uc290])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase302() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\uc295-\\uc290])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase303() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\^-\\$])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase304() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\^-\\$])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase305() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\$-\\^])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase306() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\$-\\^])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase307() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\c-b])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase308() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\c-b])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase309() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([b-\\c])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase310() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([b-\\c])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase311() public pure {
        string memory target = "anything";

        // @info: not recognizing the atom \c_ therefore marking atom as an INVALID ATOM.
        // @follow-up: Required to be verified!
        // @status: Follow up done and no issue found. It's "\c_" indeed an INVALID ATOM.
        string memory pattern = unicode"/(\\c_)/";
        target.regex(pattern);
    }

    function testRegexGroupsCase312() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(\\c_)/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase313() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a\\c_z])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase314() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([a\\c_z])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase315() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([_-,])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase316() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([_-,])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase317() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([,-_])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase318() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([,-_])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase319() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([:-;])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase320() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([:-;])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase321() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([;-:])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase322() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([;-:])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase323() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([!-@])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase324() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([!-@])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase325() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([@-!])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase326() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([@-!])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase327() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([#-%])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase328() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([#-%])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase329() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([%-#])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase330() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([%-#])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase331() public pure {
        string memory target = "anything";

        // @BUG🐍: Reading character class open-paranthesis as a syntax
        // @status: Fixed✅
        string memory pattern = unicode"/([&-(])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase332() public pure {
        string memory target = "anything";

        // @BUG🐍: Reading character class open-paranthesis as a syntax
        // @status: Fixed✅
        string memory pattern = unicode"/([&-(])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase333() public pure {
        string memory target = "anything";

        // @BUG🐍: Reading character class open-paranthesis as a syntax
        // @status: Fixed✅
        string memory pattern = unicode"/([(-&])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase334() public pure {
        string memory target = "anything";

        // @BUG🐍: Reading character class open-paranthesis as a syntax
        // @status: Fixed✅
        string memory pattern = unicode"/([(-&])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase335() public pure {
        string memory target = "anything";

        // @BUG🐍: Crashing with error array out of bounds access 0x32 code
        // @status: Fixed✅
        string memory pattern = unicode"/([)-$])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase336() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([)-$])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase337() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([$-)])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase338() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([$-)])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase339() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([^-{])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase340() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([^-{])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase341() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([{-^])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase342() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([{-^])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase343() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\^-{])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase344() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\\^-{])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase345() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([{-\\^])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase346() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([{-\\^])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase347() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([}-?])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase348() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([}-?])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase349() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([?-}])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase350() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([?-}])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase351() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([+-*])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase352() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([+-*])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase353() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([*-+])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase354() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([*-+])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase355() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([/-|])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase356() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([/-|])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase357() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([|-/])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase358() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([|-/])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase359() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\"-'])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase360() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([\"-'])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase361() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(['-\"])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase362() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(['-\"])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase363() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([<->])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase364() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([<->])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase365() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([>-<])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase366() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([>-<])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase367() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([=-`])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase368() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([=-`])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase369() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([`-=])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase370() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([`-=])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase371() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([`-~])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase372() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([`-~])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase373() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([~-`])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase374() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([~-`])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase375() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([[])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase376() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([[])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase377() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([[-b])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase378() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([[-b])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase379() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([b-[])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase380() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([b-[])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase381() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([ab]a])/";
        target.regex(pattern);
    }

    function testRegexGroupsCase382() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/([ab]a])/u";
        target.regex(pattern);
    }

    function testRegexGroupsCase383() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a(b(c)d(e)f)g(hi)j)klm/";
        target.regex(pattern);
    }

    function testRegexGroupsCase384() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/(a(b(c)d(e)f)g(hi)j)klm/u";
        target.regex(pattern);
    }

    function testRegexGroupCase385() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?:abc)/";
        target.regex(pattern);
    }

    function testRegexGroupCase386() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?:abc)/u";
        target.regex(pattern);
    }

    function testRegexGroupCase387() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?>abc)/";
        target.regex(pattern);
    }

    function testRegexGroupCase388() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?>abc)/u";
        target.regex(pattern);
    }

    function testRegexGroupCase389() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc+)/";
        target.regex(pattern);
    }

    function testRegexGroupCase390() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc+)/u";
        target.regex(pattern);
    }

    function testRegexGroupCase391() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc++)/";
        target.regex(pattern);
    }

    function testRegexGroupCase392() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc++)/u";
        target.regex(pattern);
    }

    function testRegexGroupCase393() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc*?)/";
        target.regex(pattern);
    }

    function testRegexGroupCase394() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc*?)/u";
        target.regex(pattern);
    }

    function testRegexGroupCase395() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc*??)/";
        target.regex(pattern);
    }

    function testRegexGroupCase396() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc*??)/u";
        target.regex(pattern);
    }

    function testRegexGroupCase397() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)+/";
        target.regex(pattern);
    }

    function testRegexGroupCase398() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)+/u";
        target.regex(pattern);
    }

    function testRegexGroupCase399() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)*/";
        target.regex(pattern);
    }

    function testRegexGroupCase400() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)*/u";
        target.regex(pattern);
    }

    function testRegexGroupCase401() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)?/";
        target.regex(pattern);
    }

    function testRegexGroupCase402() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)?/u";
        target.regex(pattern);
    }

    function testRegexGroupCase403() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,}/";
        target.regex(pattern);
    }

    function testRegexGroupCase404() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,}/u";
        target.regex(pattern);
    }

    function testRegexGroupCase405() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,1}/";
        target.regex(pattern);
    }

    function testRegexGroupCase406() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,1}/u";
        target.regex(pattern);
    }

    function testRegexGroupCase407() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,3}/";
        target.regex(pattern);
    }

    function testRegexGroupCase408() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,3}/u";
        target.regex(pattern);
    }

    function testRegexGroupCase409() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){3,1}/";
        target.regex(pattern);
    }

    function testRegexGroupCase410() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){3,1}/u";
        target.regex(pattern);
    }

    function testRegexGroupCase411() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(ab(?<=ab)+)+/";
        target.regex(pattern);
    }

    function testRegexGroupCase412() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(ab(?<=ab)+)+/u";
        target.regex(pattern);
    }

    function testRegexGroupCase413() public pure {
        string memory target = "anything";

        // @BUG: not throwing expected error: Invalid quantifier
        // @status: not resolved!
        string memory pattern = unicode"/(ab(?=ab)+)+/";
        target.regex(pattern);
    }

    function testRegexGroupCase414() public pure {
        string memory target = "anything";

        // @BUG: not throwing expected error: Invalid quantifier
        // @status: not resolved!
        string memory pattern = unicode"/(ab(?=ab)+)+/u";
        target.regex(pattern);
    }

    // function testRegexExxxxx() public pure {
    //     string memory target = "anything";

    //     string memory pattern = unicode"/\\!/u";
    //     target.regex(pattern);
    // }

    // function testRegexCharacterClassesExperimental() public pure {
    //     // direct unicode injection into character class testing....

    //     string memory terminalPunctuation130 = "\\u{1104D}";
    //     bytes memory utf8TerminalPunctuation130 =
    //         Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation130));
    //     console2.log("1104D: ", string(utf8TerminalPunctuation130));
    //     console2.logBytes(utf8TerminalPunctuation130);

    //     string memory terminalPunctuation131 = "\\u{1104E}";
    //     bytes memory utf8TerminalPunctuation131 =
    //         Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation131));
    //     console2.log("1104D: ", string(utf8TerminalPunctuation131));
    //     console2.logBytes(utf8TerminalPunctuation131);

    //     bytes memory utf8Hex = abi.encodePacked("[", utf8TerminalPunctuation131, "-", utf8TerminalPunctuation130, "]");
    //     console2.log("pattern: /", string(utf8Hex), "/");
    //     console2.log("------------------");
    //     console2.logBytes(utf8Hex);
    //     console2.log("------------------");
    //     (bool flag, bytes32 atomType, uint256 lastMatchedIndex) = Stringray.isCharacterClass(utf8Hex, 0, bytes1(0));

    //     console2.log("------------result------------");
    //     console2.log("flag: ", flag);
    //     console2.log("atomType: ");
    //     console2.logBytes32(atomType);
    //     console2.log(
    //         "AtomType: ", atomType == bytes32("CHARACTER_CLASS_ATOM") ? "CHARACTER_CLASS_ATOM" : "INVALID_ATOM"
    //     );
    //     console2.log("lastMatchedIndex: ", lastMatchedIndex);
    //     console2.log("------------");
    // }
}
