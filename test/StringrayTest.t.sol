// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {Stringray} from "../src/Stringray.sol";

contract PlayStringTest is Test {
    Stringray stringray;

    function setUp() external {
        stringray = new Stringray();
    }

    function testRegexLiteralsCase1() public {
        string memory target = "anything";

        string memory pattern = unicode"/a/";
        stringray.regex(target, pattern);

        pattern = unicode"/b/";
        stringray.regex(target, pattern);

        pattern = unicode"/1/";
        stringray.regex(target, pattern);

        pattern = unicode"/_/";
        stringray.regex(target, pattern);

        pattern = unicode"/€/";
        stringray.regex(target, pattern);

        pattern = unicode"/क/";
        stringray.regex(target, pattern);

        pattern = unicode"/あ/";
        stringray.regex(target, pattern);

        pattern = unicode"/😀/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase2() public {
        string memory target = "anything";

        string memory pattern = unicode"/hello/";
        stringray.regex(target, pattern);

        pattern = unicode"/anil/";
        stringray.regex(target, pattern);

        pattern = unicode"/abc/";
        stringray.regex(target, pattern);

        pattern = unicode"/123/";
        stringray.regex(target, pattern);

        pattern = unicode"/😀🚀🔥/";
        stringray.regex(target, pattern);

        pattern = unicode"/abc123/";
        stringray.regex(target, pattern);

        pattern = unicode"/कखग/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase3() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\$/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\./";
        stringray.regex(target, pattern);

        pattern = unicode"/\\*/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\+/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\?/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\(/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\)/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\{/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\}/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\[/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\]/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\|/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\\\/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase4() public {
        string memory target = "anything";

        // @Note: \x41 or any valid sequence with \xHH would be interpolated as a hexadecimal character
        // automatically (builtin capability of solidity)
        // So, for \xHH explicit support we do escape the backspace with preceding backslash \ followed by a backslash \
        // along with valid Hexdecimal sequences i.e., \\xHH
        // string memory pattern = unicode"/\x41/";
        string memory pattern = unicode"/\\x41/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase5() public {
        string memory target = "anything";

        // @Note: \u0061 or any valid sequence with \uHHHH would be interpolated as a hexadecimal character
        // automatically (builtin capability of solidity)
        // So, for \uHHHH explicit support we do escape the backspace with preceding backslash \ followed by a backslash \
        // along with valid Hexdecimal sequences i.e., \\uHHHH
        // string memory pattern = unicode"/\u0061/";
        string memory pattern = unicode"/\\u0061/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase6() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{1F600}/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase7() public {
        string memory target = "anything";

        // @Note: solidity has newline \n support
        // So, for explict support we do escape the backspace with preceding backslash \ followed by a backslash \
        // i.e., \\n
        string memory pattern = unicode"/\n/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\n/";
        stringray.regex(target, pattern);

        // @Note: solidity has carriage return \r support
        // So, for explict support we do escape the backspace with preceding backslash \ followed by a backslash \
        // i.e., \\r
        pattern = unicode"/\r/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\r/";
        stringray.regex(target, pattern);

        // @Note: solidity has tab \t support
        // So, for explict support we do escape the backspace with preceding backslash \ followed by a backslash \
        // i.e., \\t
        pattern = unicode"/\t/";
        stringray.regex(target, pattern);

        pattern = unicode"/\\t/";
        stringray.regex(target, pattern);

        // @Note: Solidity doesn't support \v escape
        // pattern = unicode"/\v/";
        // stringray.regex(target, pattern);

        pattern = unicode"/\\v/";
        stringray.regex(target, pattern);

        // @Note: Solidity doesn't support \f escape
        // pattern = unicode"/\f/";
        // stringray.regex(target, pattern);

        pattern = unicode"/\\f/";
        stringray.regex(target, pattern);

        // @Note: Solidity doesn't support \0 escape
        // pattern = unicode"/\0/";
        // stringray.regex(target, pattern);

        pattern = unicode"/\\0/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase8() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\//";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase9() public {
        string memory target = "anything";

        string memory pattern = unicode"/a\\/b/";
        stringray.regex(target, pattern);

        pattern = unicode"/a\\\\/b/";

        // @Error: SyntaxError: Invalid regular expression flags: /a\\/b/
        vm.expectRevert();
        stringray.regex(target, pattern);

        pattern = unicode"/a/b/";

        // @Error: SyntaxError: Invalid regular expression flags: /a/b/
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase10() public {
        string memory target = "anything";
        string memory pattern = unicode"/ab/\\";

        // @Error: SyntaxError: Invalid regular expression flags: /ab/\
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase11() public {
        string memory target = "anything";

        // @Note: solidity doesn't support vanila unicode escape \u{HHHHH}
        string memory pattern = unicode"/\\u{1F600}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase12() public {
        string memory target = "anything";

        string memory pattern = unicode"/ab/g";
        stringray.regex(target, pattern);

        pattern = unicode"/ab/i";
        stringray.regex(target, pattern);

        pattern = unicode"/ab/m";
        stringray.regex(target, pattern);

        pattern = unicode"/ab/s";
        stringray.regex(target, pattern);

        pattern = unicode"/ab/u";
        stringray.regex(target, pattern);

        pattern = unicode"/ab/y";
        stringray.regex(target, pattern);

        pattern = unicode"/ab/d";
        stringray.regex(target, pattern);

        pattern = unicode"/a/d";
        stringray.regex(target, pattern);

        pattern = unicode"/b/\\";

        // @Error: SyntaxError: Invalid regular expression flags: /b/\
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase13() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{110000}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase14() public {
        string memory target = "anything";

        string memory pattern = unicode"/./";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase15() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\./";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase15a() public {
        string memory target = "anything";

        // @Note: Keep it in mind: one pair of \\ is considered as one backslash \ because we can't place
        // a single backspace \ directly, solidity inferred that as an invalid escape sequence.
        // Moreover, for the sake of escape, we have to use one pair of backspaces \\ i.e., to escape a .
        // we would use \\., to escape a backspace: \\\\ -> here first pair of \\ inferred as a single backspace
        // and single backspace escapes nothing so if we leave a pair of backspace \\ into the regex /\\/ then that will
        // throw an error, that way second pair of backspace \\ followed by the first pair \\ \\ will make sense as
        // a legit valid escape for a backspace \.

        string memory pattern = unicode"/\\\\./";
        stringray.regex(target, pattern);
    }

    // function testRegexLiteralsCase16() public {
    //     string memory target = "anything";

    //     string memory pattern = unicode"/.
    //     /";
    //     stringray.regex(target, pattern);
    // }

    function testRegexLiteralsCase17() public {
        string memory target = "anything";
        string memory pattern = unicode"/{/u";

        // @Error: SyntaxError: Invalid regular expression: /{/u: Lone quantifier brackets
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase18() public {
        string memory target = "anything";
        string memory pattern = unicode"/0,1}/u";

        // @Error: SyntaxError: Invalid regular expression: /0,1}/u: Lone quantifier brackets
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase19() public {
        string memory target = "anything";

        string memory pattern = unicode"/1/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase20() public {
        string memory target = "anything";

        string memory pattern = unicode"/,/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase21() public {
        string memory target = "anything";

        string memory pattern = unicode"/1,/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase22() public {
        string memory target = "anything";

        string memory pattern = unicode"/1,2/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase23() public {
        string memory target = "anything";

        string memory pattern = unicode"/2,1/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase24() public {
        string memory target = "anything";
        string memory pattern = unicode"/(/";

        // @Error: SyntaxError: Invalid regular expression: /(/: Unterminated group
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase25() public {
        string memory target = "anything";
        string memory pattern = unicode"/)/";

        // @Error: SyntaxError: Invalid regular expression: /)/: Unmatched ')'
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase26() public {
        string memory target = "anything";
        string memory pattern = unicode"/[aa/";

        // @Error: SyntaxError: Invalid regular expression: /[aa/: Unterminated Character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase27() public {
        string memory target = "anything";
        string memory pattern = unicode"/]/u";

        // @Error: SyntaxError: Invalid regular expression: /]/u: Lone Character class brackets
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase28() public {
        string memory target = "anything";
        string memory pattern = unicode"/?/";

        // @Error: SyntaxError: Invalid regular expression: /?/: Nothing to repeat
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase29() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\?/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase30() public {
        string memory target = "anything";
        string memory pattern = unicode"/+/";

        // @Error: SyntaxError: Invalid regular expression: /+/: Nothing to repeat
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase31() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\+/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase32() public {
        string memory target = "anything";
        string memory pattern = unicode"/*/";

        // @Error: SyntaxError: Invalid regular expression: /*/: Nothing to repeat
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase33() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\*/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase34() public {
        string memory target = "anything";
        string memory pattern = unicode"/a???/";

        // @Error: SyntaxError: Invalid regular expression: /a???/: Nothing to repeat
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase35() public {
        string memory target = "anything";

        string memory pattern = unicode"/a??/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase36() public {
        string memory target = "anything";
        string memory pattern = unicode"/a+??/";

        // @Error: SyntaxError: Invalid regular expression: /a+??/: Nothing to repeat
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase37() public {
        string memory target = "anything";

        string memory pattern = unicode"/a+?/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase38() public {
        string memory target = "anything";
        string memory pattern = unicode"/a*??/";

        // @Error: SyntaxError: Invalid regular expression: /a*??/: Nothing to repeat
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase39() public {
        string memory target = "anything";

        string memory pattern = unicode"/a*?/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsCase40() public {
        string memory target = "anything";

        string memory pattern = unicode"/a^|$sian/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase1() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\08/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase2() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\107/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase3() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\377/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase4() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\400/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase5() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\777/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase6() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\378/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase7() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\397/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase8() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\a/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase9() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\0/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase10() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\00/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase11() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\000/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase12() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\08/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase13() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\008/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase14() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\000/u";

        // @Error:  SyntaxError: Invalid regular expression: /\000/u: Invalid decimal escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase15() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\118/u";

        // @Error: SyntaxError: Invalid regular expression: /\118/u: Invalid escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase16() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\988/u";

        // @Error: SyntaxError: Invalid regular expression: /\988/u: Invalid escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase17() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\0988/u";

        // @Error:  SyntaxError: Invalid regular expression: /\0988/u: Invalid decimal escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase18() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\\\a/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase19() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\_/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase20() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\_/u";

        // @Error: SyntaxError: Invalid regular expression: /\_/u: Invalid escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase21() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\!/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase22() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\!/u";

        // @Error: SyntaxError: Invalid regular expression: /\!/u: Invalid escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase23() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{1F600}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase24() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{1F600}/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase25() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase26() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\u/u";

        // @Error: SyntaxError: Invalid regular expression: /\u/u: Invalid Unicode escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase27() public {
        string memory target = "anything";

        // @NOTE: Doesn't either Throw error or fail silently.
        // Exclusive to solidity, not in Js whatsoever, Js makes it silently fail [returns null or false accordingly]
        // In solidity, \c matches with nothing and returns null on match
        string memory pattern = unicode"/\\c/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase28() public {
        string memory target = "anything";
        // @NOTE: Common in both Solidity & Js, Throws error
        string memory pattern = unicode"/\\c/u";

        // @Error: SyntaxError: Invalid regular expression: /\c/u: Invalid Unicode Escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase29() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\cA/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase30() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\cA/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase31() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\ca/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase32() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\ca/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase33() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\c1/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase34() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\c1/u";

        // @Error: SyntaxError: Invalid regular expression: /\c1/u: Invalid Unicode escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase35() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\u{23,20}/";

        // @Error: SyntaxError: Invalid regular expression: /\u{23,20}/: numbers out of order in {} quantifier
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase36() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{230,240}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase37() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{23335}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase38() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{23335,}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase39() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{,23335}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase40() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{,}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase41() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase42() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{1}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase43() public {
        string memory target = "anything";
        string memory pattern = unicode"/{1}/";

        // @Error: SyntaxError: Invalid regular expression: /{1}/: Nothing to repeat
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase44() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u{1:1}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase45() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u1234/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase46() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u123/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase47() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u1234/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase48() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\u123/u";

        // @Error: SyntaxError: Invalid regular expression: /\u123/u: Invalid Unicode escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase49() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u12345/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase50() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u1/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase51() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\u12/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase52() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\u1/u";

        // @Error: SyntaxError: Invalid regular expression: /\u1/u: Invalid Unicode escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase53() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\u12/u";

        // @Error: SyntaxError: Invalid regular expression: /\u12/u: Invalid Unicode escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase54() public {
        string memory target = "anything";
        // @NOTE: Throws different error msg than Js therefore (exclusive to solidity)
        string memory pattern = unicode"/[abc/";

        // @Error: SyntaxError: Invalid regular expression: /[abc/: Unterminated Character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase55() public {
        string memory target = "anything";
        string memory pattern = unicode"/(abc/";

        // @Error: SyntaxError: Invalid regular expression: /(abc/: Unterminated group
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase56() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<1>a)/";

        // @Error: SyntaxError: Invalid regular expression: /(?<1>a)/: Invalid capture group name
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase57() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<a-b>a)/";

        // @Error: SyntaxError: Invalid regular expression: /(?<a-b>a)/: Invalid capture group name
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase58() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\k<a>/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase59() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\k<a>/u";

        // @Error: SyntaxError: Invalid regular expression: /\k<a>/u: Invalid named capture referenced
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase60() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{L}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase61() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{XYZ}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase62() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{L}/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase63() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\p{XYZ}/u";

        // @Error: SyntaxError: Invalid regular expression: /\p{XYZ}/u Invalid property name
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase64() public {
        string memory target = "anything";
        string memory pattern = unicode"/{122222}/";

        // @Error: SyntaxError: Invalid regular expression: /{122222}/: Nothing to repeat
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase65() public {
        string memory target = "anything";

        string memory pattern = unicode"/{}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase66() public {
        string memory target = "anything";
        string memory pattern = unicode"/{}/u";

        // @Error: SyntaxError: Invalid regular expression: /{}/u: Lone quantifier brackets
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase67() public {
        string memory target = "anything";

        string memory pattern = unicode"/{/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase68() public {
        string memory target = "anything";
        string memory pattern = unicode"/{/u";

        // @Error: SyntaxError: Invalid regular expression: /{/u: Lone quantifier brackets
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase69() public {
        string memory target = "anything";

        string memory pattern = unicode"/{,11}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase70() public {
        string memory target = "anything";
        string memory pattern = unicode"/{,11}/u";

        // @Error: SyntaxError: Invalid regular expression: /{,11}/u Lone quantifier brackets
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase71() public {
        string memory target = "anything";

        string memory pattern = unicode"/}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase72() public {
        string memory target = "anything";
        string memory pattern = unicode"/}/u";

        // @Error: SyntaxError: Invalid regular expression: /}/u Lone quantifier brackets
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase73() public {
        string memory target = "anything";

        string memory pattern = unicode"/1/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase74() public {
        string memory target = "anything";

        string memory pattern = unicode"/1/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase75() public {
        string memory target = "anything";

        string memory pattern = unicode"/143242/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase76() public {
        string memory target = "anything";

        string memory pattern = unicode"/143242/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase77() public {
        string memory target = "anything";

        string memory pattern = unicode"/1}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase78() public {
        string memory target = "anything";
        string memory pattern = unicode"/1}/u";

        // @Error: SyntaxError: Invalid regular expression: /1}/u: Lone quantifier brackets
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase79() public {
        string memory target = "anything";

        string memory pattern = unicode"/123424}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase80() public {
        string memory target = "anything";
        string memory pattern = unicode"/123424}/u";

        // @Error: SyntaxError: Invalid regular expression: /123424}/u: Lone quantifier brackets
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase81() public {
        string memory target = "anything";

        string memory pattern = unicode"/1234,24/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase82() public {
        string memory target = "anything";

        string memory pattern = unicode"/1234,24/u";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase83() public {
        string memory target = "anything";

        string memory pattern = unicode"/1234,24}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase84() public {
        string memory target = "anything";
        string memory pattern = unicode"/1234,24}/u";

        // @Error: SyntaxError: Invalid regular expression: /1234,24}/u: Lone quantifier brackets
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase85() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase86() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\p{}/u";

        // @Error: SyntaxError: Invalid regular expression: /\p{}/u Invalid property name
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase87() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{=LETTER}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase88() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\p{=LETTER}/u";

        // @Error: SyntaxError: Invalid regular expression: /\p{=LETTER}/u Invalid property name
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase89() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{g=LETTER}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase90() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\p{g=LETTER}/u";

        // @Error: SyntaxError: Invalid regular expression: /\p{g=LETTER}/u Invalid property name
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase91() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{gc=Letter}/";
        stringray.regex(target, pattern);
    }

    function testRegexLiteralsEscapeSeqsCase92() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\p{gc=Letter}/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase1() public {
        string memory target = "anything";
        string memory pattern = unicode"/[]/";

        // @Error: SyntaxError: Invalid regular expression: /[]/: Empty Character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase2() public {
        string memory target = "anything";
        string memory pattern = unicode"/[]/u";

        // @Error: SyntaxError: Invalid regular expression: /[]/u: Empty Character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase3() public {
        string memory target = "anything";

        string memory pattern = unicode"/[.]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase4() public {
        string memory target = "anything";

        string memory pattern = unicode"/[.]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase5() public {
        string memory target = "anything";

        string memory pattern = unicode"/[abc123_,:;!@#%&(){}?*+$^/|\"'<>=`~ ]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase6() public {
        string memory target = "anything";

        string memory pattern = unicode"/[abc123_,:;!@#%&(){}?*+$^/|\"'<>=`~ ]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase7() public {
        string memory target = "anything";

        // @NOTE: Exclusive to solidity!
        // Solidity  : SyntaxError: Invalid regular expression: /[abc/: Unterminated Character class
        // Javascript: SyntaxError: Invalid regular expression: missing /
        string memory pattern = unicode"/[abc/";

        // @Error: SyntaxError: Invalid regular expression: /[abc/: Unterminated Character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase8() public {
        string memory target = "anything";

        // @NOTE: Exclusive to solidity!
        // Solidity  : SyntaxError: Invalid regular expression: /[abc/u: Unterminated Character class
        // Javascript: SyntaxError: Invalid regular expression: missing /

        string memory pattern = unicode"/[abc/u";

        // @Error: SyntaxError: Invalid regular expression: /[abc/u: Unterminated Character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase9() public {
        string memory target = "anything";

        // @INFO: Weird behavior, Matches literally everything, each and every possible literal
        string memory pattern = unicode"/[^]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase10() public {
        string memory target = "anything";

        // @INFO: Weird behavior, Matches literally everything, each and every possible literal
        string memory pattern = unicode"/[^]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase11() public {
        string memory target = "anything";

        string memory pattern = unicode"/[a-z]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase12() public {
        string memory target = "anything";

        string memory pattern = unicode"/[a-z]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase13() public {
        string memory target = "anything";
        string memory pattern = unicode"/[z-a]/";

        // @Error: SyntaxError: Invalid regular expression: /[z-a]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase14() public {
        string memory target = "anything";

        string memory pattern = unicode"/[z-a]/u";

        // @Error: SyntaxError: Invalid regular expression: /[z-a]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase15() public {
        string memory target = "anything";

        string memory pattern = unicode"/[a-\\d]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase16() public {
        string memory target = "anything";
        string memory pattern = unicode"/[a-\\d]/u";

        // @Error: SyntaxError: Invalid regular expression: /[a-\d]/u: Invalid character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase17() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\d-a]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase18() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\d-a]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\d-a]/u: Invalid character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase19() public {
        string memory target = "anything";

        string memory pattern = unicode"/[a-\\w]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase20() public {
        string memory target = "anything";
        string memory pattern = unicode"/[a-\\w]/u";

        // @Error: SyntaxError: Invalid regular expression: /[a-\w]/u: Invalid character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase21() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\w-a]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase22() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\w-a]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\w-a]/u: Invalid character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase23() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\w-\\d]/";

        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase24() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\w-\\d]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\w-\d]/u: Invalid character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase25() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\d-\\w]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase26() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\d-\\w]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\d-\w]/u: Invalid character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase27() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\d-\\d]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase28() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\d-\\d]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\d-\d]/u: Invalid character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase29() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\w-\\w]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase30() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\w-\\w]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\w-\w]/u: Invalid character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase31() public {
        string memory target = "anything";

        string memory pattern = unicode"/[a-c-h]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase32() public {
        string memory target = "anything";

        string memory pattern = unicode"/[a-c-h]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase33() public {
        string memory target = "anything";

        string memory pattern = unicode"/[-a]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase34() public {
        string memory target = "anything";

        string memory pattern = unicode"/[-a]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase35() public {
        string memory target = "anything";

        string memory pattern = unicode"/[a-]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase36() public {
        string memory target = "anything";

        string memory pattern = unicode"/[a-]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase37() public {
        string memory target = "anything";
        string memory pattern = unicode"/[a--z]/";

        // @Error: SyntaxError: Invalid regular expression: /[a--z]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase38() public {
        string memory target = "anything";
        string memory pattern = unicode"/[a--z]/u";

        // @Error: SyntaxError: Invalid regular expression: /[a--z]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase39() public {
        string memory target = "anything";

        string memory pattern = unicode"/[--a]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase40() public {
        string memory target = "anything";

        string memory pattern = unicode"/[--a]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase41() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\8]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase42() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\8]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\8]/u: Invalid escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase43() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\u123]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase44() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\u123]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\u123]/u: Invalid Unicode escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase45() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\u0123]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase46() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\u0123]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase47() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\]/";

        // @Error: SyntaxError: Invalid regular expression: /[\]/: Unterminated Character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase48() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\]/u: Unterminated Character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase49() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\0]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase50() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\0]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase51() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\00]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase52() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\00]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\00]/u: Invalid decimal escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase53() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\000]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase54() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\000]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\000]/u: Invalid decimal escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase55() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\377]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase56() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\377]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\377]/u: Invalid decimal escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase57() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\1]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase58() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\1]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\1]/u: Invalid decimal escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase59() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a)[\\1]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase60() public {
        string memory target = "anything";
        string memory pattern = unicode"/(a)[\\1]/u";

        // @Error: SyntaxError: Invalid regular expression: /(a)[\1]/u: Invalid decimal escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase61() public {
        string memory target = "anything";

        string memory pattern = unicode"/[(a)\\1]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase62() public {
        string memory target = "anything";
        string memory pattern = unicode"/[(a)\\1]/u";

        // @Error: SyntaxError: Invalid regular expression: /[(a)\1]/u: Invalid decimal escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase63() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\p{Letter}]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase64() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\p{Letter}]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase65() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\p{}]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase66() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\p{}]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\p{}]/u Invalid property name in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase67() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\p{LETTER}]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase68() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\p{LETTER}]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\p{LETTER}]/u Invalid property name in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase69() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\x00]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase70() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\x00]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase71() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\xg1]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase72() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\xg1]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\xg1]/u: Invalid escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase73() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\k]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase74() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\k]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\k]/u: Invalid Escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase75() public {
        string memory target = "anything";

        string memory pattern = unicode"/[(?<a>a)\\k<a>]/";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexCharacterClassesCase76() public {
        string memory target = "anything";
        string memory pattern = unicode"/[(?<a>a)\\k<a>]/u";

        // @Error: SyntaxError: Invalid regular expression: /[(?<a>a)\k<a>]/u: Invalid Escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase77() public {
        string memory target = "anything";

        string memory pattern = unicode"/(?<a>a)[\\k<a>]/";

        // @Error: SyntaxError: Invalid regular expression: /(?<a>a)[\k<a>]/: Invalid Escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase78() public {
        string memory target = "anything";

        // @NOTE: Throwing error as expected.
        // @CAUTION: Working as expected doesn't mean working well and accurately
        // still missing funcitonality
        string memory pattern = unicode"/(?<a>a)[\\k<a>]/u";

        // @Error: SyntaxError: Invalid regular expression: /(?<a>a)[\k<a>]/u: Invalid Escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase79() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\k<a>]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase80() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\k<a>]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\k<a>]/u: Invalid Escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase81() public {
        string memory target = "anything";

        // @NOTE: Same case as of Case77
        string memory pattern = unicode"/(?<b>a)\\k<a>/";

        // @Error: SyntaxError: Invalid regular expression: /(?<b>a)\k<a>/: Invalid named capture referenced
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase82() public {
        string memory target = "anything";

        // @NOTE: Here we can distinguish this case with case78
        // Here, it's not throwing error unexpectedly
        // @REASON: Missing \k complete functionality
        string memory pattern = unicode"/(?<b>a)\\k<a>/u";

        // @Error: SyntaxError: Invalid regular expression: /(?<b>a)\k<a>/u: Invalid named capture referenced
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase83() public {
        string memory target = "anything";

        string memory pattern = unicode"/[✅-🧪]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase84() public {
        string memory target = "anything";

        string memory pattern = unicode"/[✅-🧪]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase85() public {
        string memory target = "anything";
        string memory pattern = unicode"/[🧪-✅]/";

        // @Error: SyntaxError: Invalid regular expression: /[🧪-✅]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase86() public {
        string memory target = "anything";
        string memory pattern = unicode"/[🧪-✅]/u";

        // @Error: SyntaxError: Invalid regular expression: /[🧪-✅]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase87() public {
        string memory target = "anything";
        string memory pattern = unicode"/[€-क]/";

        // @Error: SyntaxError: Invalid regular expression: /[€-क]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase88() public {
        string memory target = "anything";
        string memory pattern = unicode"/[€-क]/u";

        // @Error: SyntaxError: Invalid regular expression: /[€-क]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase89() public {
        string memory target = "anything";

        string memory pattern = unicode"/[क-€]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase90() public {
        string memory target = "anything";

        string memory pattern = unicode"/[क-€]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase91() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\uc290-\\uc295]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase92() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\uc290-\\uc295]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase93() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\uc295-\\uc290]/";

        // @Error: SyntaxError: Invalid regular expression: /[\uc295-\uc290]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase94() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\uc295-\\uc290]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\uc295-\uc290]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase95() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\^-\\$]/";

        // @Error: SyntaxError: Invalid regular expression: /[\^-\$]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase96() public {
        string memory target = "anything";

        // @BUG: throwing invalid escape error...
        // @STATUS: RESOLVED!
        string memory pattern = unicode"/[\\^-\\$]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\^-\$]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase97() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\$-\\^]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase98() public {
        string memory target = "anything";

        // @BUG: throwing invalid escape error...
        // @STATUS: RESOLVED!
        string memory pattern = unicode"/[\\$-\\^]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase99() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\c-b]/";

        // @Error: SyntaxError: Invalid regular expression: /[\c-b]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase100() public {
        string memory target = "anything";
        string memory pattern = unicode"/[\\c-b]/u";

        // @Error: SyntaxError: Invalid regular expression: /[\c-b]/u: Invalid Unicode Escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase101() public {
        string memory target = "anything";
        string memory pattern = unicode"/[b-\\c]/";

        // @Error: SyntaxError: Invalid regular expression: /[b-\c]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase102() public {
        string memory target = "anything";
        string memory pattern = unicode"/[b-\\c]/u";

        // @Error: SyntaxError: Invalid regular expression: /[b-\c]/u: Invalid Unicode Escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase103() public {
        string memory target = "anything";

        string memory pattern = unicode"/\\c_/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase104() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\c_/u";

        // @Error: SyntaxError: Invalid regular expression: /\c_/u: Invalid Unicode Escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase105() public {
        string memory target = "anything";

        string memory pattern = unicode"/[a\\c_z]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase106() public {
        string memory target = "anything";
        string memory pattern = unicode"/[a\\c_z]/u";

        // @Error: SyntaxError: Invalid regular expression: /[a\c_z]/u: Invalid Unicode Escape
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase107() public {
        string memory target = "anything";

        string memory pattern = unicode"/[_-,]/";

        // @Error: SyntaxError: Invalid regular expression: /[_-,]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase108() public {
        string memory target = "anything";
        string memory pattern = unicode"/[_-,]/u";

        // @Error: SyntaxError: Invalid regular expression: /[_-,]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase109() public {
        string memory target = "anything";

        string memory pattern = unicode"/[,-_]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase110() public {
        string memory target = "anything";

        string memory pattern = unicode"/[,-_]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase111() public {
        string memory target = "anything";

        string memory pattern = unicode"/[:-;]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase112() public {
        string memory target = "anything";

        string memory pattern = unicode"/[:-;]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase113() public {
        string memory target = "anything";
        string memory pattern = unicode"/[;-:]/";

        // @Error: SyntaxError: Invalid regular expression: /[;-:]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase114() public {
        string memory target = "anything";
        string memory pattern = unicode"/[;-:]/u";

        // @Error: SyntaxError: Invalid regular expression: /[;-:]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase115() public {
        string memory target = "anything";

        string memory pattern = unicode"/[!-@]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase116() public {
        string memory target = "anything";

        string memory pattern = unicode"/[!-@]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase117() public {
        string memory target = "anything";
        string memory pattern = unicode"/[@-!]/";

        // @Error: SyntaxError: Invalid regular expression: /[@-!]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase118() public {
        string memory target = "anything";
        string memory pattern = unicode"/[@-!]/u";

        // @Error: SyntaxError: Invalid regular expression: /[@-!]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase119() public {
        string memory target = "anything";

        string memory pattern = unicode"/[#-%]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase120() public {
        string memory target = "anything";

        string memory pattern = unicode"/[#-%]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase121() public {
        string memory target = "anything";
        string memory pattern = unicode"/[%-#]/";

        // @Error: SyntaxError: Invalid regular expression: /[%-#]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase122() public {
        string memory target = "anything";
        string memory pattern = unicode"/[%-#]/u";

        // @Error: SyntaxError: Invalid regular expression: /[%-#]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase123() public {
        string memory target = "anything";

        string memory pattern = unicode"/[&-(]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase124() public {
        string memory target = "anything";

        string memory pattern = unicode"/[&-(]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase125() public {
        string memory target = "anything";
        string memory pattern = unicode"/[(-&]/";

        // @Error: SyntaxError: Invalid regular expression: /[(-&]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase126() public {
        string memory target = "anything";
        string memory pattern = unicode"/[(-&]/u";

        // @Error: SyntaxError: Invalid regular expression: /[(-&]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase127() public {
        string memory target = "anything";
        string memory pattern = unicode"/[)-$]/";

        // @Error: SyntaxError: Invalid regular expression: /[)-$]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase128() public {
        string memory target = "anything";
        string memory pattern = unicode"/[)-$]/u";

        // @Error: SyntaxError: Invalid regular expression: /[)-$]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase129() public {
        string memory target = "anything";

        string memory pattern = unicode"/[$-)]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase130() public {
        string memory target = "anything";

        string memory pattern = unicode"/[$-)]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase131() public {
        string memory target = "anything";

        string memory pattern = unicode"/[^-{]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase132() public {
        string memory target = "anything";

        string memory pattern = unicode"/[^-{]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase133() public {
        string memory target = "anything";
        string memory pattern = unicode"/[{-^]/";

        // @Error: SyntaxError: Invalid regular expression: /[{-^]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase134() public {
        string memory target = "anything";
        string memory pattern = unicode"/[{-^]/u";

        // @Error: SyntaxError: Invalid regular expression: /[{-^]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase135() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\^-{]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase136() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\\^-{]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase137() public {
        string memory target = "anything";
        string memory pattern = unicode"/[{-\\^]/";

        // @Error: SyntaxError: Invalid regular expression: /[{-\^]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase138() public {
        string memory target = "anything";
        string memory pattern = unicode"/[{-\\^]/u";

        // @Error: SyntaxError: Invalid regular expression: /[{-\^]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase139() public {
        string memory target = "anything";
        string memory pattern = unicode"/[}-?]/";

        // @Error: SyntaxError: Invalid regular expression: /[}-?]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase140() public {
        string memory target = "anything";
        string memory pattern = unicode"/[}-?]/u";

        // @Error: SyntaxError: Invalid regular expression: /[}-?]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase141() public {
        string memory target = "anything";

        string memory pattern = unicode"/[?-}]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase142() public {
        string memory target = "anything";

        string memory pattern = unicode"/[?-}]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase143() public {
        string memory target = "anything";
        string memory pattern = unicode"/[+-*]/";

        // @Error: SyntaxError: Invalid regular expression: /[+-*]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase144() public {
        string memory target = "anything";
        string memory pattern = unicode"/[+-*]/u";

        // @Error: SyntaxError: Invalid regular expression: /[+-*]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase145() public {
        string memory target = "anything";

        string memory pattern = unicode"/[*-+]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase146() public {
        string memory target = "anything";

        string memory pattern = unicode"/[*-+]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase147() public {
        string memory target = "anything";

        string memory pattern = unicode"/[/-|]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase148() public {
        string memory target = "anything";

        string memory pattern = unicode"/[/-|]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase149() public {
        string memory target = "anything";
        string memory pattern = unicode"/[|-/]/";

        // @Error: SyntaxError: Invalid regular expression: /[|-/]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase150() public {
        string memory target = "anything";
        string memory pattern = unicode"/[|-/]/u";

        // @Error: SyntaxError: Invalid regular expression: /[|-/]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase151() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\"-']/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase152() public {
        string memory target = "anything";

        string memory pattern = unicode"/[\"-']/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase153() public {
        string memory target = "anything";
        string memory pattern = unicode"/['-\"]/";

        // @Error: SyntaxError: Invalid regular expression: /['-"]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase154() public {
        string memory target = "anything";
        string memory pattern = unicode"/['-\"]/u";

        // @Error: SyntaxError: Invalid regular expression: /['-"]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase155() public {
        string memory target = "anything";

        string memory pattern = unicode"/[<->]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase156() public {
        string memory target = "anything";

        string memory pattern = unicode"/[<->]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase157() public {
        string memory target = "anything";
        string memory pattern = unicode"/[>-<]/";

        // @Error: SyntaxError: Invalid regular expression: /[>-<]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase158() public {
        string memory target = "anything";
        string memory pattern = unicode"/[>-<]/u";

        // @Error: SyntaxError: Invalid regular expression: /[>-<]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase159() public {
        string memory target = "anything";

        string memory pattern = unicode"/[=-`]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase160() public {
        string memory target = "anything";

        string memory pattern = unicode"/[=-`]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase161() public {
        string memory target = "anything";
        string memory pattern = unicode"/[`-=]/";

        // @Error: SyntaxError: Invalid regular expression: /[`-=]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase162() public {
        string memory target = "anything";
        string memory pattern = unicode"/[`-=]/u";

        // @Error: SyntaxError: Invalid regular expression: /[`-=]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase163() public {
        string memory target = "anything";

        string memory pattern = unicode"/[`-~]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase164() public {
        string memory target = "anything";

        string memory pattern = unicode"/[`-~]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase165() public {
        string memory target = "anything";
        string memory pattern = unicode"/[~-`]/";

        // @Error: SyntaxError: Invalid regular expression: /[~-`]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase166() public {
        string memory target = "anything";
        string memory pattern = unicode"/[~-`]/u";

        // @Error: SyntaxError: Invalid regular expression: /[~-`]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase167() public {
        string memory target = "anything";

        string memory pattern = unicode"/[[]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase168() public {
        string memory target = "anything";

        string memory pattern = unicode"/[[]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase169() public {
        string memory target = "anything";

        string memory pattern = unicode"/[[-b]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase170() public {
        string memory target = "anything";

        string memory pattern = unicode"/[[-b]/u";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase171() public {
        string memory target = "anything";
        string memory pattern = unicode"/[b-[]/";

        // @Error: SyntaxError: Invalid regular expression: /[b-[]/: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase172() public {
        string memory target = "anything";
        string memory pattern = unicode"/[b-[]/u";

        // @Error: SyntaxError: Invalid regular expression: /[b-[]/u: Range out of order in character class
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase173() public {
        string memory target = "anything";

        string memory pattern = unicode"/[ab]a]/";
        stringray.regex(target, pattern);
    }

    function testRegexCharacterClassesCase174() public {
        string memory target = "anything";
        string memory pattern = unicode"/[ab]a]/u";

        // @Error: SyntaxError: Invalid regular expression: /[ab]a]/u: Lone Character class brackets
        vm.expectRevert();
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase1() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase2() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase3() public {
        string memory target = "anything";

        string memory pattern = unicode"/(abcdefjklmnostuvwxyz)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase4() public {
        string memory target = "anything";

        string memory pattern = unicode"/(abcdefjklmnostuvwxyz)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase5() public {
        string memory target = "anything";

        string memory pattern = unicode"/(abcd-ghij)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase6() public {
        string memory target = "anything";

        string memory pattern = unicode"/(abcd-ghij)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase7() public {
        string memory target = "anything";

        string memory pattern = unicode"/(abcd/ghij)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase8() public {
        string memory target = "anything";

        // @BUG: not throwing error in u mode
        // @Status: Fixed ✅
        string memory pattern = unicode"/(abcd/ghij)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase9() public {
        string memory target = "anything";

        string memory pattern = unicode"/(abcd!@#%=';:><.,~`\"&ghij)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase10() public {
        string memory target = "anything";

        string memory pattern = unicode"/(abcd!@#%=';:><.,~`\"&ghij)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase11() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase12() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase13() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\e\\j\\k\\l\\m\\o\\y\\z)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase14() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\e\\j\\k\\l\\m\\o\\y\\z)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase15() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\-\\g\\h\\i\\j)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase16() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\-\\g\\h\\i\\j)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase17() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\/\\g\\h\\i\\j)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase18() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\/\\g\\h\\i\\j)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase19() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\!\\@\\#\\%\\=\\'\\;\\:\\>\\<\\.\\,\\~\\`\\\"\\&\\g\\h\\i\\j)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase20() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a\\!\\@\\#\\%\\=\\'\\;\\:\\>\\<\\.\\,\\~\\`\\\"\\&\\g\\h\\i\\j)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase21() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\n)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase22() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\n)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase23() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\b)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase24() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\b)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase25() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\f)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase26() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\f)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase27() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\d)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase28() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\d)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase29() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\r)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase30() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\r)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase31() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\s)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase32() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\s)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase33() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\t)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase34() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\t)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase35() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\v)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase36() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\v)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase37() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\w)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase38() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\w)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase39() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\B)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase40() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\B)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase41() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\D)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase42() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\D)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase43() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\S)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase44() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\S)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase45() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\W)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase46() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\W)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase47() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\^)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase48() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\^)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase49() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\$)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase50() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\$)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase51() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\\\)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase52() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\\\)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase53() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\.)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase54() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\.)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase55() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\*)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase56() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\*)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase57() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\+)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase58() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\+)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase59() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\?)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase60() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\?)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase61() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\[)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase62() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\[)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase63() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase64() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase65() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\()/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase66() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\()/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase67() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\))/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase68() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\))/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase69() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\{)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase70() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase71() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\|)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase72() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\|)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase73() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\/)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase74() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\/)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase75() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(b)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(1)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(_)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(€)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(क)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(あ)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(😀)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase76() public {
        string memory target = "anything";

        string memory pattern = unicode"/(hello)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(anil)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(abc)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(123)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(😀🚀🔥)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(abc123)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(कखग)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase77() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\^)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\$)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\.)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\*)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\+)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\?)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\()/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\))/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\{)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\})/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\[)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\])/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\|)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\\\)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase78() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\x41)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase79() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u0061)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase80() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{1F600})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase81() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\n)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\n)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\r)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\r)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\t)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\t)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\v)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\f)/";
        stringray.regex(target, pattern);

        pattern = unicode"/(\\0)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase82() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\/)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase83() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a/b)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase84() public {
        string memory target = "anything";

        string memory pattern = unicode"/(ab)/\\";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase85() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{110000})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase86() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\c1)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase87() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\ugg)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase88() public {
        string memory target = "anything";

        string memory pattern = unicode"/(.)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase89() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\.)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase90() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\r.)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase91() public {
        string memory target = "anything";

        string memory pattern = unicode"/({)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase92() public {
        string memory target = "anything";

        string memory pattern = unicode"/(})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase93() public {
        string memory target = "anything";

        string memory pattern = unicode"/(1)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase94() public {
        string memory target = "anything";

        string memory pattern = unicode"/(,)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase95() public {
        string memory target = "anything";

        string memory pattern = unicode"/(1,)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase96() public {
        string memory target = "anything";

        string memory pattern = unicode"/(1,2)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase97() public {
        string memory target = "anything";

        string memory pattern = unicode"/(2,1)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase98() public {
        string memory target = "anything";

        // @info: inconsistent error msgs
        string memory pattern = unicode"/(()/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase99() public {
        string memory target = "anything";

        // @info: inconsistent error msgs
        string memory pattern = unicode"/())/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase100() public {
        string memory target = "anything";

        // @info: inconsistent error msgs
        string memory pattern = unicode"/([])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase101() public {
        string memory target = "anything";

        string memory pattern = unicode"/(])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase102() public {
        string memory target = "anything";

        string memory pattern = unicode"/([])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase103() public {
        string memory target = "anything";

        string memory pattern = unicode"/(?)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase104() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\?)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase105() public {
        string memory target = "anything";

        string memory pattern = unicode"/(+)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase106() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\+)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase107() public {
        string memory target = "anything";

        string memory pattern = unicode"/(*)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase108() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\*)/";
        stringray.regex(target, pattern);
    }

    // function testRegexGroupsCase109() public {
    //     string memory target = "anything";

    //     string memory pattern = unicode"/(*)/";
    //     stringray.regex(target, pattern);
    // }

    // function testRegexGroupsCase110() public {
    //     string memory target = "anything";

    //     string memory pattern = unicode"/(\\*)/";
    //     stringray.regex(target, pattern);
    // }

    function testRegexGroupsCase109() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a???)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase110() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a??)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase111() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a+??)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase112() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a+?)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase113() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a*??)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase114() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a*?)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase115() public {
        string memory target = "anything";

        string memory pattern = unicode"/(asian)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase116() public {
        string memory target = "anything";
        // @BUG🐍: returning complete \08 as null character
        // @sttus: Fixed✅
        string memory pattern = unicode"/(\\08)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase117() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\107)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase118() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\377)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase119() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\400)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase120() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\777)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase121() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a^|$sian)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase122() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\378)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase123() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\397)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase124() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\a)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase125() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\0)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase126() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\00)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase127() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\000)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase128() public {
        string memory target = "anything";
        // @BUG: returning complete \08 as null character
        // @Status: Fixed ✅
        string memory pattern = unicode"/(\\08)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase129() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\008)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase130() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\000)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase131() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\118)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase132() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\988)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase133() public {
        string memory target = "anything";

        // @BUG: not throwing error: Invalid decimal escape, in both cases literal and group
        // string memory pattern = unicode"/\\0988/u";
        // @Status: Fixed ✅
        string memory pattern = unicode"/(\\0988)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase134() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\\\a)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase135() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\_)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase136() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\_)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase137() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\!)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase138() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\!)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase139() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{1F600})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase140() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{1F600})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase141() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase142() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase143() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\c)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase144() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\c)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase145() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\cA)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase146() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\cA)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase147() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\ca)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase148() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\ca)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase149() public {
        string memory target = "anything";
        // @INFO: not throwing any error as expected however still required behavioral verification
        string memory pattern = unicode"/(\\c1)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase150() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\c1)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase151() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{23,20})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase152() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{230,240})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase153() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{23335})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase154() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{23335,})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase155() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{,23335})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase156() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{,})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase157() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase158() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{1})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase159() public {
        string memory target = "anything";

        string memory pattern = unicode"/({1})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase160() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u{1:1})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase161() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u1234)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase162() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u123)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase163() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u1234)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase164() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u123)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase165() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u12345)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase166() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u1)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase167() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u12)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase168() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u1)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase169() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\u12)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase170() public {
        string memory target = "anything";

        // @NOTE: Throws different error msg than Js therefore (exclusive to solidity)
        string memory pattern = unicode"/([abc)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase171() public {
        string memory target = "anything";

        string memory pattern = unicode"/((abc)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase172() public {
        string memory target = "anything";

        string memory pattern = unicode"/((?<1>a))/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase173() public {
        string memory target = "anything";

        string memory pattern = unicode"/((?<a-b>a))/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase174() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\k<a>)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase175() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\k<a>)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase176() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{L})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase177() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{XYZ})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase178() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{L})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase179() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{XYZ})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase180() public {
        string memory target = "anything";

        string memory pattern = unicode"/({122222})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase181() public {
        string memory target = "anything";

        string memory pattern = unicode"/({})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase182() public {
        string memory target = "anything";

        string memory pattern = unicode"/({})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase183() public {
        string memory target = "anything";

        string memory pattern = unicode"/({)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase184() public {
        string memory target = "anything";

        string memory pattern = unicode"/({)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase185() public {
        string memory target = "anything";

        string memory pattern = unicode"/({,11})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase186() public {
        string memory target = "anything";

        string memory pattern = unicode"/({,11})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase187() public {
        string memory target = "anything";

        string memory pattern = unicode"/(})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase188() public {
        string memory target = "anything";

        string memory pattern = unicode"/(})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase189() public {
        string memory target = "anything";

        string memory pattern = unicode"/(1)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase190() public {
        string memory target = "anything";

        string memory pattern = unicode"/(1)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase191() public {
        string memory target = "anything";

        string memory pattern = unicode"/(143242)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase192() public {
        string memory target = "anything";

        string memory pattern = unicode"/(143242)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase193() public {
        string memory target = "anything";

        string memory pattern = unicode"/(1})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase194() public {
        string memory target = "anything";

        string memory pattern = unicode"/(1})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase195() public {
        string memory target = "anything";

        string memory pattern = unicode"/(123424})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase196() public {
        string memory target = "anything";

        string memory pattern = unicode"/(123424})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase197() public {
        string memory target = "anything";

        string memory pattern = unicode"/(1234,24)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase198() public {
        string memory target = "anything";

        string memory pattern = unicode"/(1234,24)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase199() public {
        string memory target = "anything";

        string memory pattern = unicode"/(1234,24})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase200() public {
        string memory target = "anything";

        string memory pattern = unicode"/(1234,24})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase201() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase202() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase203() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{=LETTER})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase204() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{=LETTER})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase205() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{g=LETTER})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase206() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{g=LETTER})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase207() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{gc=Letter})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase208() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\p{gc=Letter})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase209() public {
        string memory target = "anything";

        string memory pattern = unicode"/([])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase210() public {
        string memory target = "anything";

        string memory pattern = unicode"/([])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase211() public {
        string memory target = "anything";

        string memory pattern = unicode"/([.])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase212() public {
        string memory target = "anything";

        string memory pattern = unicode"/([.])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase213() public {
        string memory target = "anything";

        string memory pattern = unicode"/([abc123_,:;!@#%&(){}?*+$^/|\"'<>=`~ ])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase214() public {
        string memory target = "anything";

        string memory pattern = unicode"/([abc123_,:;!@#%&(){}?*+$^/|\"'<>=`~ ])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase215() public {
        string memory target = "anything";

        string memory pattern = unicode"/([abc)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase216() public {
        string memory target = "anything";

        string memory pattern = unicode"/([abc)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase217() public {
        string memory target = "anything";

        string memory pattern = unicode"/([^])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase218() public {
        string memory target = "anything";

        string memory pattern = unicode"/([^])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase219() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a-z])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase220() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a-z])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase221() public {
        string memory target = "anything";

        string memory pattern = unicode"/([z-a])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase222() public {
        string memory target = "anything";

        string memory pattern = unicode"/([z-a])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase223() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a-\\d])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase224() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a-\\d])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase225() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\d-a])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase226() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\d-a])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase227() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a-\\w])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase228() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a-\\w])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase229() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\w-a])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase230() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\w-a])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase231() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\w-\\d])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase232() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\w-\\d])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase233() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\d-\\w])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase234() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\d-\\w])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase235() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\d-\\d])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase236() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\d-\\d])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase237() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\w-\\w])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase238() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\w-\\w])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase239() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a-c-h])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase240() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a-c-h])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase241() public {
        string memory target = "anything";

        string memory pattern = unicode"/([-a])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase242() public {
        string memory target = "anything";

        string memory pattern = unicode"/([-a])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase243() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a-])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase244() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a-])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase245() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a--z])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase246() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a--z])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase247() public {
        string memory target = "anything";

        string memory pattern = unicode"/([--a])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase248() public {
        string memory target = "anything";

        string memory pattern = unicode"/([--a])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase249() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\8])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase250() public {
        string memory target = "anything";

        // @BUG: throws: Invalid escape for literal escape \8 and Invalid decimal escape for cc [\8]
        // However, should always throw Invalid escape
        // @Status: Fixed ✅
        string memory pattern = unicode"/([\\8])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase251() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\u123])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase252() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\u123])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase253() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\u0123])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase254() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\u0123])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase255() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase256() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase257() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\0])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase258() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\0])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase259() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\00])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase260() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\00])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase261() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\000])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase262() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\000])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase263() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\377])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase264() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\377])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase265() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\1])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase266() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\1])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase267() public {
        string memory target = "anything";
        // @BUG: not supporting nested groups
        // @Status: Fixed ✅
        string memory pattern = unicode"/((a)[\\1])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase268() public {
        string memory target = "anything";

        string memory pattern = unicode"/((a)[\\1])/u";
        stringray.regex(target, pattern);
    }

    // @Last: 08 March 2026, Sun 10:05 IST, Tested last above

    function testRegexGroupsCase269() public {
        string memory target = "anything";

        string memory pattern = unicode"/([(a)\\1])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase270() public {
        string memory target = "anything";

        string memory pattern = unicode"/([(a)\\1])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase271() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\p{Letter}])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase272() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\p{Letter}])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase273() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\p{}])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase274() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\p{}])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase275() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\p{LETTER}])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase276() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\p{LETTER}])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase277() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\x001])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase278() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\x001])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase279() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\xg1])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase280() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\xg1])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase281() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\k])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase282() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\k])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase283() public {
        string memory target = "anything";

        string memory pattern = unicode"/([(?<a>a)\\k<a>])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase284() public {
        string memory target = "anything";

        string memory pattern = unicode"/([(?<a>a)\\k<a>])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase285() public {
        string memory target = "anything";

        // @BUG: NOT throwing error
        // @reason: currently missing group reference validation functionality
        string memory pattern = unicode"/((?<a>a)[\\k<a>])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase286() public {
        string memory target = "anything";

        string memory pattern = unicode"/((?<a>a)[\\k<a>])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase287() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\k<a>])/";
        stringray.regex(target, pattern);
    }

    // function testRegexGroupsCase288() public {
    //     string memory target = "anything";

    //     string memory pattern = unicode"/([\\k<a>])/u";
    //     stringray.regex(target, pattern);
    // }

    function testRegexGroupsCase289() public {
        string memory target = "anything";

        // @BUG: NOT throwing error
        // @reason: currently missing group reference validation functionality
        string memory pattern = unicode"/((?<b>a)\\k<a>)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase290() public {
        string memory target = "anything";

        // @BUG: NOT throwing error
        // @reason: currently missing group reference validation functionality
        string memory pattern = unicode"/((?<b>a)\\k<a>)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase291() public {
        string memory target = "anything";

        string memory pattern = unicode"/([✅-🧪])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase292() public {
        string memory target = "anything";

        string memory pattern = unicode"/([✅-🧪])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase293() public {
        string memory target = "anything";

        string memory pattern = unicode"/([🧪-✅])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase294() public {
        string memory target = "anything";

        string memory pattern = unicode"/([🧪-✅])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase295() public {
        string memory target = "anything";

        string memory pattern = unicode"/([€-क])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase296() public {
        string memory target = "anything";

        string memory pattern = unicode"/([€-क])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase297() public {
        string memory target = "anything";

        string memory pattern = unicode"/([क-€])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase298() public {
        string memory target = "anything";

        string memory pattern = unicode"/([क-€])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase299() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\uc290-\\uc295])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase300() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\uc290-\\uc295])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase301() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\uc295-\\uc290])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase302() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\uc295-\\uc290])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase303() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\^-\\$])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase304() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\^-\\$])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase305() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\$-\\^])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase306() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\$-\\^])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase307() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\c-b])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase308() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\c-b])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase309() public {
        string memory target = "anything";

        string memory pattern = unicode"/([b-\\c])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase310() public {
        string memory target = "anything";

        string memory pattern = unicode"/([b-\\c])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase311() public {
        string memory target = "anything";

        // @info: not recognizing the atom \c_ therefore marking atom as an INVALID ATOM.
        // @follow-up: Required to be verified!
        // @status: Follow up done and no issue found. It's "\c_" indeed an INVALID ATOM.
        string memory pattern = unicode"/(\\c_)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase312() public {
        string memory target = "anything";

        string memory pattern = unicode"/(\\c_)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase313() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a\\c_z])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase314() public {
        string memory target = "anything";

        string memory pattern = unicode"/([a\\c_z])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase315() public {
        string memory target = "anything";

        string memory pattern = unicode"/([_-,])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase316() public {
        string memory target = "anything";

        string memory pattern = unicode"/([_-,])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase317() public {
        string memory target = "anything";

        string memory pattern = unicode"/([,-_])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase318() public {
        string memory target = "anything";

        string memory pattern = unicode"/([,-_])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase319() public {
        string memory target = "anything";

        string memory pattern = unicode"/([:-;])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase320() public {
        string memory target = "anything";

        string memory pattern = unicode"/([:-;])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase321() public {
        string memory target = "anything";

        string memory pattern = unicode"/([;-:])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase322() public {
        string memory target = "anything";

        string memory pattern = unicode"/([;-:])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase323() public {
        string memory target = "anything";

        string memory pattern = unicode"/([!-@])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase324() public {
        string memory target = "anything";

        string memory pattern = unicode"/([!-@])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase325() public {
        string memory target = "anything";

        string memory pattern = unicode"/([@-!])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase326() public {
        string memory target = "anything";

        string memory pattern = unicode"/([@-!])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase327() public {
        string memory target = "anything";

        string memory pattern = unicode"/([#-%])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase328() public {
        string memory target = "anything";

        string memory pattern = unicode"/([#-%])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase329() public {
        string memory target = "anything";

        string memory pattern = unicode"/([%-#])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase330() public {
        string memory target = "anything";

        string memory pattern = unicode"/([%-#])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase331() public {
        string memory target = "anything";

        // @BUG🐍: Reading character class open-paranthesis as a syntax
        // @status: Fixed✅
        string memory pattern = unicode"/([&-(])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase332() public {
        string memory target = "anything";

        // @BUG🐍: Reading character class open-paranthesis as a syntax
        // @status: Fixed✅
        string memory pattern = unicode"/([&-(])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase333() public {
        string memory target = "anything";

        // @BUG🐍: Reading character class open-paranthesis as a syntax
        // @status: Fixed✅
        string memory pattern = unicode"/([(-&])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase334() public {
        string memory target = "anything";

        // @BUG🐍: Reading character class open-paranthesis as a syntax
        // @status: Fixed✅
        string memory pattern = unicode"/([(-&])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase335() public {
        string memory target = "anything";

        // @BUG🐍: Crashing with error array out of bounds access 0x32 code
        // @status: Fixed✅
        string memory pattern = unicode"/([)-$])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase336() public {
        string memory target = "anything";

        string memory pattern = unicode"/([)-$])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase337() public {
        string memory target = "anything";

        string memory pattern = unicode"/([$-)])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase338() public {
        string memory target = "anything";

        string memory pattern = unicode"/([$-)])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase339() public {
        string memory target = "anything";

        string memory pattern = unicode"/([^-{])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase340() public {
        string memory target = "anything";

        string memory pattern = unicode"/([^-{])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase341() public {
        string memory target = "anything";

        string memory pattern = unicode"/([{-^])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase342() public {
        string memory target = "anything";

        string memory pattern = unicode"/([{-^])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase343() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\^-{])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase344() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\\^-{])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase345() public {
        string memory target = "anything";

        string memory pattern = unicode"/([{-\\^])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase346() public {
        string memory target = "anything";

        string memory pattern = unicode"/([{-\\^])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase347() public {
        string memory target = "anything";

        string memory pattern = unicode"/([}-?])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase348() public {
        string memory target = "anything";

        string memory pattern = unicode"/([}-?])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase349() public {
        string memory target = "anything";

        string memory pattern = unicode"/([?-}])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase350() public {
        string memory target = "anything";

        string memory pattern = unicode"/([?-}])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase351() public {
        string memory target = "anything";

        string memory pattern = unicode"/([+-*])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase352() public {
        string memory target = "anything";

        string memory pattern = unicode"/([+-*])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase353() public {
        string memory target = "anything";

        string memory pattern = unicode"/([*-+])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase354() public {
        string memory target = "anything";

        string memory pattern = unicode"/([*-+])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase355() public {
        string memory target = "anything";

        string memory pattern = unicode"/([/-|])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase356() public {
        string memory target = "anything";

        string memory pattern = unicode"/([/-|])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase357() public {
        string memory target = "anything";

        string memory pattern = unicode"/([|-/])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase358() public {
        string memory target = "anything";

        string memory pattern = unicode"/([|-/])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase359() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\"-'])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase360() public {
        string memory target = "anything";

        string memory pattern = unicode"/([\"-'])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase361() public {
        string memory target = "anything";

        string memory pattern = unicode"/(['-\"])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase362() public {
        string memory target = "anything";

        string memory pattern = unicode"/(['-\"])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase363() public {
        string memory target = "anything";

        string memory pattern = unicode"/([<->])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase364() public {
        string memory target = "anything";

        string memory pattern = unicode"/([<->])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase365() public {
        string memory target = "anything";

        string memory pattern = unicode"/([>-<])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase366() public {
        string memory target = "anything";

        string memory pattern = unicode"/([>-<])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase367() public {
        string memory target = "anything";

        string memory pattern = unicode"/([=-`])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase368() public {
        string memory target = "anything";

        string memory pattern = unicode"/([=-`])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase369() public {
        string memory target = "anything";

        string memory pattern = unicode"/([`-=])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase370() public {
        string memory target = "anything";

        string memory pattern = unicode"/([`-=])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase371() public {
        string memory target = "anything";

        string memory pattern = unicode"/([`-~])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase372() public {
        string memory target = "anything";

        string memory pattern = unicode"/([`-~])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase373() public {
        string memory target = "anything";

        string memory pattern = unicode"/([~-`])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase374() public {
        string memory target = "anything";

        string memory pattern = unicode"/([~-`])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase375() public {
        string memory target = "anything";

        string memory pattern = unicode"/([[])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase376() public {
        string memory target = "anything";

        string memory pattern = unicode"/([[])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase377() public {
        string memory target = "anything";

        string memory pattern = unicode"/([[-b])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase378() public {
        string memory target = "anything";

        string memory pattern = unicode"/([[-b])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase379() public {
        string memory target = "anything";

        string memory pattern = unicode"/([b-[])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase380() public {
        string memory target = "anything";

        string memory pattern = unicode"/([b-[])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase381() public {
        string memory target = "anything";

        string memory pattern = unicode"/([ab]a])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase382() public {
        string memory target = "anything";

        string memory pattern = unicode"/([ab]a])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase383() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a(b(c)d(e)f)g(hi)j)klm/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase384() public {
        string memory target = "anything";

        string memory pattern = unicode"/(a(b(c)d(e)f)g(hi)j)klm/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase385() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?:abc)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase386() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?:abc)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase387() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?>abc)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase388() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?>abc)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase389() public {
        string memory target = "anything";
        string memory pattern = unicode"/(abc+)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase390() public {
        string memory target = "anything";
        string memory pattern = unicode"/(abc+)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase391() public {
        string memory target = "anything";
        string memory pattern = unicode"/(abc++)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase392() public {
        string memory target = "anything";
        string memory pattern = unicode"/(abc++)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase393() public {
        string memory target = "anything";
        string memory pattern = unicode"/(abc*?)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase394() public {
        string memory target = "anything";
        string memory pattern = unicode"/(abc*?)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase395() public {
        string memory target = "anything";
        string memory pattern = unicode"/(abc*??)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase396() public {
        string memory target = "anything";
        string memory pattern = unicode"/(abc*??)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase397() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)+/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase398() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)+/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase399() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)*/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase400() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)*/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase401() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)?/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase402() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)?/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase403() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,}/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase404() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,}/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase405() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,1}/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase406() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,1}/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase407() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,3}/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase408() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,3}/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase409() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){3,1}/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase410() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){3,1}/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase411() public {
        string memory target = "anything";
        string memory pattern = unicode"/(ab(?<=ab)+)+/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase412() public {
        string memory target = "anything";
        string memory pattern = unicode"/(ab(?<=ab)+)+/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase413() public {
        string memory target = "anything";

        string memory pattern = unicode"/(ab(?=ab)+)+/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase414() public {
        string memory target = "anything";

        // @BUG🐍: not throwing expected error: Invalid quantifier
        // @status: Fixed✅
        string memory pattern = unicode"/(ab(?=ab)+)+/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase415() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=ab)+/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase416() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=ab)+/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase417() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?!ab)*/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase418() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?!ab)*/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase419() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)+/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase420() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)+/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase421() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<!ab)?/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase422() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<!ab)?/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase423() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a+)b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase424() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a+)b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase425() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a*)b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase426() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a*)b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase427() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a{1,3})b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase428() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a{1,3})b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase429() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\w+)b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase430() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\w+)b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase431() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab|abc)b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase432() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab|abc)b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase433() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=abc)b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase434() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=abc)b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase435() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\d{3})x/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase436() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\d{3})x/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase437() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab|cd)x/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase438() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab|cd)x/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase439() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?:(?=ab))+/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase440() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?:(?=ab))+/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase441() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a|bc|def)g/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase442() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a|bc|def)g/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase443() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab|cd)g/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase444() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab|cd)g/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase445() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a{2,4})b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase446() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a{2,4})b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase447() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\d+)b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase448() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\d+)b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase449() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a*)b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase450() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a*)b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase451() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a{3})b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase452() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a{3})b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase453() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=(a+))b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase454() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=(a+))b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase455() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=(abc))d/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase456() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=(abc))d/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase457() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a(?<=b+))c/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase458() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a(?<=b+))c/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase459() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(\\1))/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase460() public {
        string memory target = "anything";
        // @info: throwing error, unexpected in context of Js regex
        string memory pattern = unicode"/(?=(\\1))\\1/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase461() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(?<x>a)\\k<y>)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase462() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(?<x>a)\\k<y>)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase463() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(?<x>a))(?=(?<x>b))/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase464() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(?<x>a))(?=(?<x>b))/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase465() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=\\xZ)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase466() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=\\xZ)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase467() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\u123)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase468() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\u123)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase469() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\p{Letter}+)x/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase470() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\p{Letter}+)x/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase471() public {
        string memory target = "anything";
        string memory pattern = unicode"/[ (?=a) ]/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase472() public {
        string memory target = "anything";
        string memory pattern = unicode"/[ (?=a) ]/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase473() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=a)+*/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase474() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=a)+*/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase475() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=[z-a])/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase476() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=[z-a])/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase477() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=abc";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase478() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=abcu";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase479() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\1(a))b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase480() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\1(a))b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase481() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=>a)b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase482() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=>a)b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase483() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a{1,3})b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase484() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a{1,3})b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase485() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=a)+/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase486() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=a)+/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase487() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(a)\\2)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase488() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(a)\\2)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase489() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\1)(a)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase490() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=\\1)(a)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase491() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<1>a)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase492() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<1>a)/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase493() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=\\p{FakeProperty})/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase494() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=\\p{FakeProperty})/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase495() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=)a/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase496() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=)a/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase497() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a)b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase498() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=a)b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase499() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=a)+/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase500() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=a)+/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase501() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(?=a))/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase502() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(?=a))/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase503() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(?=(?=a)))*/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase504() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(?=(?=a)))*/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase505() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?: (?<=a)b )+/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase506() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?: (?<=a)b )+/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase507() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=^a)b/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase508() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=^a)b/u";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase509() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=a)(?!a)/";
        stringray.regex(target, pattern);
    }

    function testRegexGroupsCase510() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=a)(?!a)/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase1() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\0/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase2() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\0/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase3() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\1/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase4() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\1/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase5() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\2/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase6() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\2/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase7() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\3/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase8() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\3/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase9() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\4/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase10() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\4/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase11() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\5/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase12() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\5/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase13() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\6/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase14() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\6/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase15() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\7/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase16() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\7/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase17() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\8/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase18() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\8/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase19() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\9/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase20() public {
        string memory target = "anything";
        string memory pattern = unicode"/\\9/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase21() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\0/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase22() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\0/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase23() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\1/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase24() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\1/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase25() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\2/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase26() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\2/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase27() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\3/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase28() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\3/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase29() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\4/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase30() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\4/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase31() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\5/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase32() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\5/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase33() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\6/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase34() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\6/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase35() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\7/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase36() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\7/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase37() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\8/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase38() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\8/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase39() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\9/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase40() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)\\9/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase41() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)\\2/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase42() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)\\2/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase43() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)\\3/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase44() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)\\3/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase45() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)\\4/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase46() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)\\4/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase47() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)\\5/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase48() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)\\5/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase49() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)(anil)\\6/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase50() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)(anil)\\6/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase51() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)(anil)(anil)\\7/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase52() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)(anil)(anil)\\7/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase53() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\\8/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase54() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\\8/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase55() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\\9/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase56() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\\9/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase57() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\\10/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase58() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\\10/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase59() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\\11/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase60() public {
        string memory target = "anything";
        string memory pattern = unicode"/(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)(anil)\\11/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase61() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>anil)\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase62() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>anil)\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase63() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<outer>nehal(?<inner>anil))\\k<outer>\\k<inner>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase64() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<outer>nehal(?<inner>anil))\\k<outer>\\k<inner>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase65() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(?<x>abc))\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase66() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?=(?<x>abc))\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase67() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=(?<x>a))b\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase68() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=(?<x>a))b\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    // start
    function testRegexDigitBackreferenceCase69() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?:gutkha)\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase70() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?:gutkha)\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase71() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?:<x>gutkha)\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase72() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?:<x>gutkha)\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase73() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?:<x>gutkha)/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase74() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?:<x>gutkha)/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase75() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>a)?\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase76() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>a)?\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase77() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>b)?\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase78() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>b)?\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase79() public {
        // @BUG🐍: Js allows duplicate capture group names iff they are of different branches i.e.,
        // /(?<x>nehal)|(?<x>drishti)\k<x>/ <- allowed
        // However, current logic isn't respecting | alternation(or branch)
        // @status:  resolved✅
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>alka)|(?<x>didi)\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase80() public {
        // @BUG: Js allows duplicate capture group names iff they are of different branches i.e.,
        // /(?<x>nehal)|(?<x>drishti)\k<x>/ <- allowed
        // However, current logic isn't respecting | alternation(or branch)
        // @status: resolved✅
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>alka)|(?<x>didi)\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase81() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>kamal)+\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase82() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>kamal)+\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase83() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>kamal)|tinku\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase84() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>kamal)|tinku\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase85() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>alka)(?<x>didi)|(?<x>nehal)\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase86() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>alka)(?<x>didi)|(?<x>nehal)\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase87() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>alka)(?<y>didi)\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase88() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>alka)(?<y>didi)\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    function testRegexDigitBackreferenceCase89() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>alka)(?<x>didi)\\k<x>/";
        stringray.regex(target, pattern);
    }

    function testRegexDigitBackreferenceCase90() public {
        string memory target = "anything";
        string memory pattern = unicode"/(?<x>alka)(?<x>didi)\\k<x>/u";
        stringray.regex(target, pattern);
        stringray.seeAllAtoms();
    }

    // function testRegexExxxxx() public {
    //     string memory target = "anything";

    //     string memory pattern = unicode"/\\!/u";
    //     stringray.regex(target, pattern);
    // }

    // function testRegexCharacterClassesExperimental() public {
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
