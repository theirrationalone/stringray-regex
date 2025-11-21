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

    function testRegexDotMetacharacter() public {
        string memory target = "abc";
        string memory pattern = "/.";
        Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);

        uint256 lastPatternStartingSpecialSeqIdx = patternMatchedData.lastPatternStartingSpecialSeqIdx;
        uint256 lastPatternEndingSpecialSeqIdx = patternMatchedData.lastPatternEndingSpecialSeqIdx;
        bytes memory mainString = patternMatchedData.mainString;
        bytes memory remainingString = patternMatchedData.remainingString;
        bytes memory patternString = patternMatchedData.patternString;
        bytes memory patternMatchedString = patternMatchedData.patternMatchedString;
        bytes memory remainingPatternString = patternMatchedData.remainingPatternString;
        bytes memory lastPatternAtom = patternMatchedData.lastPatternAtom;
        bytes1 patternMatchedChar = patternMatchedData.patternMatchedChar;
        int256 stringLastMatchedCharIndex = patternMatchedData.stringLastMatchedCharIndex;

        console2.log("lastPatternStartingSpecialSeqIdx: ", lastPatternStartingSpecialSeqIdx);
        console2.log("lastPatternEndingSpecialSeqIdx  : ", lastPatternEndingSpecialSeqIdx);
        console2.log("mainString                      : ", string(mainString));
        console2.logBytes(mainString);
        console2.log("remainingString                 : ", string(remainingString));
        console2.logBytes(remainingString);
        console2.log("patternMatchedChar              : ", string(abi.encodePacked(patternMatchedChar)));
        console2.logBytes1(patternMatchedChar);
        console2.log("patternString                   : ", string(patternString));
        console2.logBytes(patternString);
        console2.log("patternMatchedString            : ", string(patternMatchedString));
        console2.logBytes(patternMatchedString);
        console2.log("remainingPatternString          : ", string(remainingPatternString));
        console2.logBytes(lastPatternAtom);
        console2.log("lastPatternAtom                 : ", string(lastPatternAtom));
        console2.logBytes(patternMatchedString);
        console2.log("stringLastMatchedCharIndex      : ", stringLastMatchedCharIndex);
    }

    function testRegex() public {
        string memory target = "abc";
        string memory pattern = "/a(.)c/";
        Stringray.PatternMatchedData memory patternMatchedData = target.regex(pattern);

        uint256 lastPatternStartingSpecialSeqIdx = patternMatchedData.lastPatternStartingSpecialSeqIdx;
        uint256 lastPatternEndingSpecialSeqIdx = patternMatchedData.lastPatternEndingSpecialSeqIdx;
        bytes memory mainString = patternMatchedData.mainString;
        bytes memory remainingString = patternMatchedData.remainingString;
        bytes memory patternString = patternMatchedData.patternString;
        bytes memory patternMatchedString = patternMatchedData.patternMatchedString;
        bytes memory remainingPatternString = patternMatchedData.remainingPatternString;
        bytes memory lastPatternAtom = patternMatchedData.lastPatternAtom;
        bytes1 patternMatchedChar = patternMatchedData.patternMatchedChar;
        int256 stringLastMatchedCharIndex = patternMatchedData.stringLastMatchedCharIndex;

        console2.log("lastPatternStartingSpecialSeqIdx: ", lastPatternStartingSpecialSeqIdx);
        console2.log("lastPatternEndingSpecialSeqIdx  : ", lastPatternEndingSpecialSeqIdx);
        console2.log("mainString                      : ", string(mainString));
        console2.logBytes(mainString);
        console2.log("remainingString                 : ", string(remainingString));
        console2.logBytes(remainingString);
        console2.log("patternMatchedChar              : ", string(abi.encodePacked(patternMatchedChar)));
        console2.logBytes1(patternMatchedChar);
        console2.log("patternString                   : ", string(patternString));
        console2.logBytes(patternString);
        console2.log("patternMatchedString            : ", string(patternMatchedString));
        console2.logBytes(patternMatchedString);
        console2.log("remainingPatternString          : ", string(remainingPatternString));
        console2.logBytes(lastPatternAtom);
        console2.log("lastPatternAtom                 : ", string(lastPatternAtom));
        console2.logBytes(patternMatchedString);
        console2.log("stringLastMatchedCharIndex      : ", stringLastMatchedCharIndex);
    }
}
