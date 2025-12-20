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

    function testRegexLiteralsCase1() public pure {
        string memory target = "dummy";
        string memory pattern = "/abcdefghijklmnopqrstuvwxyz/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase2() public pure {
        string memory target = "dummy";
        string memory pattern = "/ABCDEFGHIJKLMNOPQRSTUVWXYZ/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase3() public pure {
        string memory target = "dummy";
        string memory pattern = "/0123456789/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase4() public pure {
        string memory target = "dummy";
        string memory pattern = "/\\a\\b\\c\\d\\e\\f\\g\\h\\i\\j\\k\\l\\m\\n\\o\\p\\q\\r\\s\\t\\u\\v\\w\\x\\y\\z/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase5() public pure {
        string memory target = "dummy";
        string memory pattern = "/\\A\\B\\C\\D\\E\\F\\G\\H\\I\\J\\K\\L\\M\\N\\O\\P\\Q\\R\\S\\T\\U\\V\\W\\X\\Y\\Z/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase6() public pure {
        string memory target = "dummy";
        string memory pattern = "/\\0\\1\\2\\3\\4\\5\\6\\7\\8\\9/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase7() public pure {
        string memory target = "dummy";
        string memory pattern = "/ !\"#%&',:;<=>@_~/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase8() public pure {
        string memory target = "dummy";
        string memory pattern = "/\\ \\!\\\"\\#\\%\\&\\'\\,\\:\\;\\<\\=\\>\\@\\_\\~/";
        target.regex(pattern);
    }

    function testRegexLiteralsCase9() public pure {
        string memory target = "dummy";
        string memory pattern = "/${/";
        target.regex(pattern);
    }

    function testRegexMetaCharsAndEscapeSequencesCase0() public pure {
        string memory target = "dummy";
        string memory pattern = "/d{1}?/";
        target.regex(pattern);
    }

    function testRegexMetaCharsAndEscapeSequencesCase1() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase1();
    }

    function testRegexMetaCharsAndEscapeSequencesCase2() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase2();
    }

    function testRegexMetaCharsAndEscapeSequencesCase3() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase3();
    }
}

contract DummyContract {
    using Stringray for string;

    function regexMetaCharsAndEscapeSequencesCase1() public pure {
        string memory target = "dummy";
        string memory pattern = "/{1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase2() public pure {
        string memory target = "dummy";
        string memory pattern = "/{1,}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase3() public pure {
        string memory target = "dummy";
        string memory pattern = "/{1,1}/";
        target.regex(pattern);
    }
}
