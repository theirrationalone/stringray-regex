// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {Stringray} from "../src/Stringray.sol";

contract PlayStringTest is Test {
    using Stringray for string;

    function setUp() external {
        // done
    }

    function test_charAtInFunction() public {
        string memory anyString = "theirrationalone";

        string memory char = anyString.charAt(3);

        console2.log("char: ", char);

        assertEq(char, "i");
    }

    function test_charCodeAt() public {
        string memory name = "theirrationalone";

        int256 charCode = name.charCodeAt(9);

        console2.log("charCode: ", charCode);

        // a,   b,  c,   d,  e,   f,   g,    h,   i,  j,   k,   l,   m,   n,   o,   p,   q,   r,   s,  t
        // 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116

        assertEq(charCode, 111);
    }

    function test_copyWithFunction() public {
        string memory name = "theirrationalone";

        string memory modifiedName = name.copyWithIn(6, 2, 10);

        console2.log("name        : ", name);
        console2.log("modifiedName: ", modifiedName);

        // string memory concatenatedStr = string.concat("a", "b", "c", "d");

        // console2.log("concatenatedStr: ", concatenatedStr);

        assertEq(modifiedName, "theirreirratione");
    }

    function test_endsWithFunction() public {
        string memory name = "theirrationalone is my name";
        string memory searchString = "name";

        string memory name_two = "my name is theirrationalone";
        string memory searchString_two = "is ";

        bool isEndsWith = name.endsWith(searchString);

        bool isEndsWithTwo = name_two.endsWith(searchString_two, 10);

        assertEq(isEndsWith, true);
        assertEq(isEndsWithTwo, true);
    }

    function test_includesFunction() public {
        string memory quote = "Imposters are everywhere nowadays!";
        string memory searchStr = "here nowa";

        bool isIncludes = quote.includes(searchStr);

        assertEq(isIncludes, true);
    }

    function test_indexOfFunction() public {
        string memory traceMe = "Catch me if you can. It's the world record that nobody caught me till now.";
        string memory suspect = "It's";

        int256 myIndexFirst = traceMe.indexOf(suspect);
        int256 myIndexSecond = traceMe.indexOf("world", uint256(myIndexFirst + 1));

        int256 invalidIndex = traceMe.indexOf(suspect, 74);

        console2.log("myIndexFirst", myIndexFirst);
        console2.log("myIndexSecond", myIndexSecond);
        console2.log("invalidIndex", invalidIndex);

        assertEq(myIndexFirst, 21);
        assertEq(myIndexSecond, 30);
        assertEq(invalidIndex, -1);
    }

    function test_lastIndexOfFunction() public {
        string memory traceMe = "Catch me if you can. It's the world record that nobody caught me till now.";
        string memory suspect = "me";

        int256 myLastIndexFirst = traceMe.lastIndexOf(suspect);
        int256 myLastIndexSecond = traceMe.lastIndexOf("me", uint256(myLastIndexFirst - 1));

        int256 invalidLastIndex = traceMe.lastIndexOf(suspect, 0);

        console2.log("myLastIndexFirst", myLastIndexFirst);
        console2.log("myLastIndexSecond", myLastIndexSecond);
        console2.log("invalidLastIndex", invalidLastIndex);

        string memory testStr = "annnnnnnilzzzzzilaaaa";
        int256 test = testStr.lastIndexOf("il", 21);

        console2.log("testStr: ", test);

        assertEq(myLastIndexFirst, 62);
        assertEq(myLastIndexSecond, 6);
        assertEq(invalidLastIndex, -1);
    }

    function test_lengthFunction() public {
        string memory target = "Catch me if you can. It's the world record that nobody caught me till now.";
        string memory newTarget = "";

        assertEq(target.length(), 74);
        assertEq(newTarget.length(), 0);
    }

    function test_localeCompareFunction() public {
        string memory targetEqual = "a";
        string memory newTargetEqual = "a";

        string memory targetGreaterThan = "b";
        string memory newTargetGreaterThan = "a";

        string memory targetSmallerThan = "a";
        string memory newTargetSmallerThan = "b";

        assertEq(targetEqual.localeCompare(newTargetEqual), 1);
        assertEq(targetGreaterThan.localeCompare(newTargetGreaterThan), 1);
        assertEq(targetSmallerThan.localeCompare(newTargetSmallerThan), -1);
    }

    function test_localeCompareFunctionIgnoreCase() public {
        string memory targetEqualIgnoreCase = "a";
        string memory newTargetEqualIgnoreCase = "a";

        string memory targetGreaterThanIgnoreCase = "b";
        string memory newTargetGreaterThanIgnoreCase = "a";

        string memory targetSmallerThanIgnoreCase = "a";
        string memory newTargetSmallerThanIgnoreCase = "b";

        assertEq(targetEqualIgnoreCase.localeCompare(newTargetEqualIgnoreCase, true), 0);
        assertEq(targetGreaterThanIgnoreCase.localeCompare(newTargetGreaterThanIgnoreCase, true), 1);
        assertEq(targetSmallerThanIgnoreCase.localeCompare(newTargetSmallerThanIgnoreCase, true), -1);
    }

    function test_localeCompareFunctionIgnoreCaseUpper() public {
        string memory targetEqualIgnoreCaseUpper = "A";
        string memory newTargetEqualIgnoreCaseUpper = "a";

        string memory targetGreaterThanIgnoreCaseUpper = "B";
        string memory newTargetGreaterThanIgnoreCaseUpper = "a";

        string memory targetSmallerThanIgnoreCaseUpper = "A";
        string memory newTargetSmallerThanIgnoreCaseUpper = "b";

        assertEq(targetEqualIgnoreCaseUpper.localeCompare(newTargetEqualIgnoreCaseUpper, true), 0);
        assertEq(targetGreaterThanIgnoreCaseUpper.localeCompare(newTargetGreaterThanIgnoreCaseUpper, true), 1);
        assertEq(targetSmallerThanIgnoreCaseUpper.localeCompare(newTargetSmallerThanIgnoreCaseUpper, true), -1);
    }

    // function printOutput(Stringray.PatternMatchedData memory patternMatchedData) private {
    //     uint256 lastPatternStartingSpecialSeqIdx = patternMatchedData.lastPatternStartingSpecialSeqIdx;
    //     uint256 lastPatternEndingSpecialSeqIdx = patternMatchedData.lastPatternEndingSpecialSeqIdx;
    //     bytes memory mainString = patternMatchedData.mainString;
    //     bytes memory remainingString = patternMatchedData.remainingString;
    //     bytes memory patternString = patternMatchedData.patternString;
    //     bytes memory patternMatchedString = patternMatchedData.patternMatchedString;
    //     bytes memory remainingPatternString = patternMatchedData.remainingPatternString;
    //     bytes memory lastPatternAtom = patternMatchedData.lastPatternAtom;
    //     bytes1 patternMatchedChar = patternMatchedData.patternMatchedChar;
    //     int256 stringLastMatchedCharIndex = patternMatchedData.stringLastMatchedCharIndex;

    //     console2.log("---------------------Test Result---------------------");
    //     console2.log("lastPatternStartingSpecialSeqIdx: ", lastPatternStartingSpecialSeqIdx);
    //     console2.log("lastPatternEndingSpecialSeqIdx  : ", lastPatternEndingSpecialSeqIdx);
    //     console2.log("mainString                      : ", string(mainString));
    //     console2.logBytes(mainString);
    //     console2.log("remainingString                 : ", string(remainingString));
    //     console2.logBytes(remainingString);
    //     console2.log("patternMatchedChar              : ", string(abi.encodePacked(patternMatchedChar)));
    //     console2.logBytes1(patternMatchedChar);
    //     console2.log("patternString                   : ", string(patternString));
    //     console2.logBytes(patternString);
    //     console2.log("patternMatchedString            : ", string(patternMatchedString));
    //     console2.logBytes(patternMatchedString);
    //     console2.log("remainingPatternString          : ", string(remainingPatternString));
    //     console2.log("lastPatternAtom                 : ", string(lastPatternAtom));
    //     console2.logBytes(lastPatternAtom);
    //     console2.log("stringLastMatchedCharIndex      : ", stringLastMatchedCharIndex);
    //     console2.log("---------------------Test Result End---------------------");
    //     console2.logBytes(patternMatchedString);
    // }

    // function testRegexLiteralMatchingOne() public {
    //     string memory target = "abc";
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTwo() public {
    //     string memory target = "abc\\";
    //     string memory pattern = "/abc\\/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingThree() public {
    //     string memory target = "abc\\";
    //     string memory pattern = "/abc\\\\/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingFour() public {
    //     string memory target = "abc/";
    //     string memory pattern = "/abc\\//";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingFive() public {
    //     string memory target = "abc.";
    //     string memory pattern = "/abc\\./";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingSix() public {
    //     string memory target = "abc*";
    //     string memory pattern = "/abc\\*/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingSeven() public {
    //     string memory target = "abc+";
    //     string memory pattern = "/abc\\+/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingEightz() public {
    //     string memory target = "abc?";
    //     string memory pattern = "/abc\\?/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTen() public {
    //     string memory target = "abc(";
    //     string memory pattern = "/abc\\(/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingEleven() public {
    //     string memory target = "abc)";
    //     string memory pattern = "/abc\\)/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTwelve() public {
    //     string memory target = "abc[";
    //     string memory pattern = "/abc\\[/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingThirteen() public {
    //     string memory target = "abc]";
    //     string memory pattern = "/abc\\]/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingFourteen() public {
    //     string memory target = "abc{";
    //     string memory pattern = "/abc\\{/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingFifteen() public {
    //     string memory target = "abc}";
    //     string memory pattern = "/abc\\}/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingSixteen() public {
    //     string memory target = "abc|";
    //     string memory pattern = "/abc\\|/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingSeventeen() public {
    //     string memory target = "V1.0";
    //     string memory pattern = "/V1\\.0/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingEighteen() public {
    //     string memory target = "abx";
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingNineteen() public {
    //     string memory target = "ab";
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTwenty() public {
    //     string memory target = "acb";
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTwentyOne() public {
    //     string memory target = "abc";
    //     string memory pattern = "/a b c/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTwentyTwo() public {
    //     string memory target = "a\nbcabcabc"; // at idx 6 it's c
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     assertEq(patternMatchedData.stringLastMatchedCharIndex, 6);
    //     // assertEq(string(abi.encodePacked("/", patternMatchedData.patternMatchedString, "/")), pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTwentyThree() public {
    //     string memory target = "a\tbc";
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTwentyFour() public {
    //     string memory target = "a\\tbc";
    //     string memory pattern = "/a\\tbc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTwentyFive() public {
    //     string memory target = "a\\nbc";
    //     string memory pattern = "/a\\nbc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTwentySix() public {
    //     // string memory target = "a\vbc"; // special seq \v: throws invalid escape seqence in solidity
    //     string memory target = "a\\vbc";
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTwentySeven() public {
    //     // string memory target = "a\fbc"; // special seq \f: throws invalid escape seqence in solidity
    //     string memory target = "a\\fbc";
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTwentyEight() public {
    //     string memory target = "a\rbc";
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingTwentyNine() public {
    //     string memory target = "a\rbc";
    //     string memory pattern = "/a\rbc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingThirty() public {
    //     string memory target = "a\\rbc";
    //     string memory pattern = "/a\\rbc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingThirtyOne() public {
    //     string memory target = "a\nbc";
    //     string memory pattern = "/a\nbc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingThirtyTwo() public {
    //     string memory target = "a\tbc";
    //     string memory pattern = "/a\tbc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingThirtyThree() public {
    //     // @info: Solidity is able to detect byte order mark "\uFEFF"
    //     // It simply ignores the BOM
    //     // string memory target = "\uabc"; // special seq \u: throws invalid escape seqence in solidity (without BOM)
    //     string memory target = "\uFEFFabc";
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(abi.encodePacked("/", patternMatchedData.patternMatchedString, "/")), pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingThirtyFour() public {
    //     string memory target = "\\uabc";
    //     string memory pattern = "/\\uabc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingThirtyFive() public {
    //     string memory target = "a\r\nbc";
    //     string memory pattern = "/a\rbc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingThirtySix() public {
    //     string memory target = "a\r\nbc";
    //     string memory pattern = "/a\nbc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingThirtySeven() public {
    //     string memory target = "a\r\nbc";
    //     string memory pattern = "/a\r\nbc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingThirtyEight() public {
    //     string memory target = "a\x00bc"; // NULL
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingThirtyNine() public {
    //     string memory target = "a\x07bc"; // BEL
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingFourty() public {
    //     string memory target = "a\x06bc"; // ACK
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingFourtyOne() public {
    //     string memory target = "a\x05bc"; // ENQ
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingFourtyTwo() public {
    //     string memory target = "a\x1Abc"; // SUB
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingFourtyThree() public {
    //     string memory target = "a\x1Bbc"; // ESC
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingFourtyFour() public {
    //     string memory target = "&amp;abc";
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingFourtyFive() public {
    //     string memory target = "&lt;abc&gt;";
    //     string memory pattern = "/abc/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertNotEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingFourtySix() public {
    //     string memory target = "ab\\c";
    //     string memory pattern = "/ab\\c/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(patternMatchedData.patternMatchedString), string(patternMatchedData.mainString));
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexLiteralMatchingFourtySeven() public {
    //     string memory target = "abc > file.sol";
    //     string memory pattern = "/abc > f/";
    //     Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // assertEq(string(abi.encodePacked("/", patternMatchedData.patternMatchedString, "/")), pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterOne() public {
    //     string memory target = "abc";
    //     string memory pattern = "/./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterTwo() public {
    //     // string memory target = "\n";
    //     string memory target = "\r";
    //     string memory pattern = "/./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterThree() public {
    //     // target = "\a"; // special seq \b: throws invalid escape seqence in solidity
    //     string memory target = "\\ab";
    //     string memory pattern = "/\\\\.b/";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterFour() public {
    //     string memory target = "a.";
    //     string memory pattern = "/.\\./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterFive() public {
    //     string memory target = "\n";
    //     string memory pattern = "/./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterSix() public {
    //     string memory target = "\n\r";
    //     string memory pattern = "/./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterSeven() public {
    //     string memory target = "\r\n";
    //     string memory pattern = "/./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterEight() public {
    //     string memory target = "\t";
    //     string memory pattern = "/./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterNine() public {
    //     string memory target = " ";
    //     string memory pattern = "/./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterTen() public {
    //     // target = "\b"; // special seq \b: throws invalid escape seqence in solidity
    //     string memory target = "\\b";
    //     string memory pattern = "/./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterEleven() public {
    //     // target = "\0"; // special seq \0: throws invalid escape seqence in solidity
    //     string memory target = "\\0";
    //     string memory pattern = "/.0/";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterTwelve() public {
    //     string memory target = "\u200B";
    //     string memory pattern = "/./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterThirteen() public {
    //     string memory target = "\u200D";
    //     string memory pattern = "/./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterFourteen() public {
    //     string memory target = "\u200C";
    //     string memory pattern = "/./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexDotMetacharacterFifteen() public {
    //     string memory target = "\uFEFF";
    //     string memory pattern = "/./";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegexQuestionMarkMetacharacterOne() public {
    //     string memory target = "ab";
    //     string memory pattern = "/ab?/";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    // function testRegex() public {
    //     string memory target = "abc";
    //     string memory pattern = "/a(.)c/";
    //     // Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    //     // printOutput(patternMatchedData);
    // }

    function testRegexStart() public {
        string memory target = "ababc";
        string memory pattern = "/abc/";
        Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);
    }
}
