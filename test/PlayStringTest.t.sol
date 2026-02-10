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

    function testRegexMetaCharsAndEscapeSequencesCase3a() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase3a();
    }

    function testRegexMetaCharsAndEscapeSequencesCase4() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase4();
    }

    function testRegexMetaCharsAndEscapeSequencesCase5() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase5();
    }

    function testRegexMetaCharsAndEscapeSequencesCase6() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase6();
    }

    function testRegexMetaCharsAndEscapeSequencesCase7() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase7();
    }

    function testRegexMetaCharsAndEscapeSequencesCase8() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase8();
    }

    function testRegexMetaCharsAndEscapeSequencesCase9() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase9();
    }

    function testRegexMetaCharsAndEscapeSequencesCase10() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase10();
    }

    function testRegexMetaCharsAndEscapeSequencesCase11() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase11();
    }

    function testRegexMetaCharsAndEscapeSequencesCase12() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase12();
    }

    function testRegexMetaCharsAndEscapeSequencesCase13() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase13();
    }

    function testRegexMetaCharsAndEscapeSequencesCase14() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase14();
    }

    function testRegexMetaCharsAndEscapeSequencesCase15() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase15();
    }

    function testRegexMetaCharsAndEscapeSequencesCase16() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase16();
    }

    function testRegexMetaCharsAndEscapeSequencesCase17() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase17();
    }

    function testRegexMetaCharsAndEscapeSequencesCase18() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase18();
    }

    function testRegexMetaCharsAndEscapeSequencesCase19() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase19();
    }

    function testRegexMetaCharsAndEscapeSequencesCase20() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase20();
    }

    function testRegexMetaCharsAndEscapeSequencesCase21() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase21();
    }

    function testRegexMetaCharsAndEscapeSequencesCase22() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase22();
    }

    function testRegexMetaCharsAndEscapeSequencesCase23() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase23();
    }

    function testRegexMetaCharsAndEscapeSequencesCase24() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase24();
    }

    function testRegexMetaCharsAndEscapeSequencesCase25() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase25();
    }

    function testRegexMetaCharsAndEscapeSequencesCase26() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase26();
    }

    function testRegexMetaCharsAndEscapeSequencesCase27() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase27();
    }

    function testRegexMetaCharsAndEscapeSequencesCase28() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase28();
    }

    function testRegexMetaCharsAndEscapeSequencesCase29() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase29();
    }

    function testRegexMetaCharsAndEscapeSequencesCase30() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase30();
    }

    function testRegexMetaCharsAndEscapeSequencesCase31() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase31();
    }

    function testRegexMetaCharsAndEscapeSequencesCase32() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase32();
    }

    function testRegexMetaCharsAndEscapeSequencesCase33() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase33();
    }

    function testRegexMetaCharsAndEscapeSequencesCase34() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase34();
    }

    function testRegexMetaCharsAndEscapeSequencesCase35() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase35();
    }

    function testRegexMetaCharsAndEscapeSequencesCase36() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase36();
    }

    function testRegexMetaCharsAndEscapeSequencesCase37() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase37();
    }

    function testRegexMetaCharsAndEscapeSequencesCase38() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase38();
    }

    function testRegexMetaCharsAndEscapeSequencesCase39() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase39();
    }

    function testRegexMetaCharsAndEscapeSequencesCase40() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase40();
    }

    function testRegexMetaCharsAndEscapeSequencesCase41() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase41();
    }

    function testRegexMetaCharsAndEscapeSequencesCase42() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase42();
    }

    function testRegexMetaCharsAndEscapeSequencesCase43() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase43();
    }

    function testRegexMetaCharsAndEscapeSequencesCase44() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase44();
    }

    function testRegexMetaCharsAndEscapeSequencesCase45() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase45();
    }

    function testRegexMetaCharsAndEscapeSequencesCase46() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase46();
    }

    function testRegexMetaCharsAndEscapeSequencesCase47() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase47();
    }

    function testRegexMetaCharsAndEscapeSequencesCase48() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase48();
    }

    function testRegexMetaCharsAndEscapeSequencesCase49() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase49();
    }

    function testRegexMetaCharsAndEscapeSequencesCase50() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase50();
    }

    function testRegexMetaCharsAndEscapeSequencesCase51() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase51();
    }

    function testRegexMetaCharsAndEscapeSequencesCase52() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase52();
    }

    function testRegexMetaCharsAndEscapeSequencesCase53() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase53();
    }

    function testRegexMetaCharsAndEscapeSequencesCase54() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase54();
    }

    function testRegexMetaCharsAndEscapeSequencesCase55() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase55();
    }

    function testRegexMetaCharsAndEscapeSequencesCase56() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase56();
    }

    function testRegexMetaCharsAndEscapeSequencesCase57() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase57();
    }

    function testRegexMetaCharsAndEscapeSequencesCase58() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase58();
    }

    function testRegexMetaCharsAndEscapeSequencesCase59() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase59();
    }

    function testRegexMetaCharsAndEscapeSequencesCase60() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase60();
    }

    function testRegexMetaCharsAndEscapeSequencesCase61() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase61();
    }

    function testRegexMetaCharsAndEscapeSequencesCase62() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase62();
    }

    function testRegexMetaCharsAndEscapeSequencesCase63() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase63();
    }

    function testRegexMetaCharsAndEscapeSequencesCase64() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase64();
    }

    function testRegexMetaCharsAndEscapeSequencesCase65() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase65();
    }

    function testRegexMetaCharsAndEscapeSequencesCase66() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase66();
    }

    function testRegexMetaCharsAndEscapeSequencesCase67() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase67();
    }

    function testRegexMetaCharsAndEscapeSequencesCase68() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase68();
    }

    function testRegexMetaCharsAndEscapeSequencesCase69() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase69();
    }

    function testRegexMetaCharsAndEscapeSequencesCase70() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase70();
    }

    function testRegexMetaCharsAndEscapeSequencesCase71() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase71();
    }

    function testRegexMetaCharsAndEscapeSequencesCase72() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase72();
    }

    function testRegexMetaCharsAndEscapeSequencesCase73() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase73();
    }

    function testRegexMetaCharsAndEscapeSequencesCase74() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase74();
    }

    function testRegexMetaCharsAndEscapeSequencesCase75() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase75();
    }

    function testRegexMetaCharsAndEscapeSequencesCase76() public {
        DummyContract dummyCt = new DummyContract();
        vm.expectRevert();
        dummyCt.regexMetaCharsAndEscapeSequencesCase76();
    }

    function testRegexMetaCharsAndEscapeSequencesCase77() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase77();
    }

    function testRegexMetaCharsAndEscapeSequencesCase78() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase78();
    }

    function testRegexMetaCharsAndEscapeSequencesCase79() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase79();
    }

    function testRegexMetaCharsAndEscapeSequencesCase80() public {
        DummyContract dummyCt = new DummyContract();
        dummyCt.regexMetaCharsAndEscapeSequencesCase80();
    }

    function testRegexHexEscapeCase1() public pure {
        string memory target = "anything";
        string memory pattern = "/\\xFF/";
        target.regex(pattern);
    }

    function testRegexHexEscapeCase2() public pure {
        string memory target = "anything";
        string memory pattern = "/\\x00/";
        target.regex(pattern);
    }

    function testRegexHexEscapeCase3() public pure {
        string memory target = "anything";
        string memory pattern = "/\\x0G/";
        target.regex(pattern);
    }

    function testRegexUnicodeEscapeCase1() public pure {
        string memory target = "anything";
        string memory pattern = "/\\u000/";
        target.regex(pattern);
    }

    function testRegexUnicodeEscapeCase2() public pure {
        string memory target = "anything";
        string memory pattern = "/\\u0000/";
        target.regex(pattern);
    }

    function testRegexUnicodeEscapeCase3() public pure {
        string memory target = "anything";
        string memory pattern = "/\\uffff/";
        target.regex(pattern);
    }

    function testRegexUnicodeEscapeCase4() public pure {
        string memory target = "anything";
        string memory pattern = "/\\uFFFF/";
        target.regex(pattern);
    }

    function testRegexUnicodeEscapeCase5() public pure {
        string memory target = "anything";
        string memory pattern = "/\\ufffg/";
        target.regex(pattern);
    }

    function testRegexUnicodeEscapeCase6() public pure {
        string memory target = "anything";
        string memory pattern = "/\\uFFFGg/";
        target.regex(pattern);
    }

    function testRegexUnicodeEscapeCase7() public pure {
        string memory target = "anything";
        string memory pattern = "/\\uFFF1Gg/";
        target.regex(pattern);
    }

    function testRegexUnicodeEscapeCase8() public pure {
        string memory target = "anything";
        string memory pattern = "/\\uFFF01bGg/";
        target.regex(pattern);
    }

    function testRegexUnicodeEscapeCase9() public pure {
        string memory target = "anything";
        // BUG: found with extended unicode codepoint detection
        // @status: resolved
        string memory pattern = "/\\u{FA10b9}/";
        target.regex(pattern);
    }

    function testRegexUnicodeEscapeCase10() public pure {
        string memory target = "anything";
        string memory pattern = "/\\u{10FFFF}/";
        target.regex(pattern);
    }

    function testRegexUnicodeEscapeCase11() public pure {
        string memory target = "anything";
        string memory pattern = "/\\u{110000}/";
        target.regex(pattern);
    }

    function testRegexControlEscapeCase1() public pure {
        string memory target = "anything";
        string memory pattern = "/\\cab/";
        target.regex(pattern);
    }

    function testRegexControlEscapeCase2() public pure {
        string memory target = "anything";
        string memory pattern = "/\\cZa/";
        target.regex(pattern);
    }

    function testRegexControlEscapeCase3() public pure {
        string memory target = "anything";
        string memory pattern = "/\\c1/";
        target.regex(pattern);
    }

    function testRegexControlEscapeCase4() public pure {
        string memory target = "anything";
        string memory pattern = "/\\CI/";
        target.regex(pattern);
    }

    function testRegexControlEscapeCase5() public pure {
        string memory target = "anything";
        string memory pattern = "/\\C0/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase1() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<_>/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase2() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<1a>/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase3() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<anil>/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase4() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<_anil$>/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase5() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<$anil_>/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase6() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<a$ni_l>/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase7() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<1a$ni_l>/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase8() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<%a$ni_l>/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase9() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<an1l>/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase10() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<anil10>/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase11() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<$an_i1l10>/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase12() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<$an_i#1l10>/";
        target.regex(pattern);
    }

    function testRegexGroupNamedBackreferenceEscapeCase13() public pure {
        string memory target = "anything";
        string memory pattern = "/\\k<_$theLongestGroup_named$backReference_idNo12911>/";
        target.regex(pattern);
    }

    function testRegexPropertyEscapeCase1() public pure {
        string memory target = "anything";
        string memory pattern = "/\\p{}/";
        target.regex(pattern);
    }

    function testRegexPropertyEscapeCase2() public pure {
        string memory target = "anything";
        string memory pattern = "/\\p{lasun}/";
        target.regex(pattern);
    }

    function testRegexPropertyEscapeCase3() public pure {
        string memory target = "anything";
        string memory pattern = "/\\p{lasun}a/";
        target.regex(pattern);
    }

    function testRegexPropertyEscapeCase4() public pure {
        string memory target = "anything";
        string memory pattern = "/\\P{}/";
        target.regex(pattern);
    }

    function testRegexPropertyEscapeCase5() public pure {
        string memory target = "anything";
        string memory pattern = "/\\P{lasun}/";
        target.regex(pattern);
    }

    function testRegexPropertyEscapeCase6() public pure {
        string memory target = "anything";
        string memory pattern = "/\\P{lasun}a/";
        target.regex(pattern);
    }

    function testRegexDigitBackreferenceEscapeCase1() public pure {
        string memory target = "anything";
        string memory pattern = "/\\9/";
        target.regex(pattern);
    }

    function testRegexDigitBackreferenceEscapeCase2() public pure {
        string memory target = "anything";
        string memory pattern = "/\\99/";
        target.regex(pattern);
    }

    function testRegexDigitBackreferenceEscapeCase3() public pure {
        string memory target = "anything";
        string memory pattern = "/\\999/";
        target.regex(pattern);
    }

    function testRegexDigitBackreferenceEscapeCase4() public pure {
        string memory target = "anything";
        string memory pattern = "/\\9999/";
        target.regex(pattern);
    }

    function testRegexDigitBackreferenceEscapeCase5() public pure {
        string memory target = "anything";
        string memory pattern = "/\\99999/";
        target.regex(pattern);
    }

    function testRegexDigitBackreferenceEscapeCase6() public pure {
        string memory target = "anything";
        string memory pattern = "/\\999999/";
        target.regex(pattern);
    }

    function testRegexDigitBackreferenceEscapeCase7() public pure {
        string memory target = "anything";
        string memory pattern = "/\\9999999/";
        target.regex(pattern);
    }

    function testRegexDigitBackreferenceEscapeCase8() public pure {
        string memory target = "anything";
        string memory pattern = "/\\99999999/";
        target.regex(pattern);
    }

    function testRegexDigitBackreferenceEscapeCase9() public pure {
        string memory target = "anything";
        string memory pattern = "/\\999999999/";
        target.regex(pattern);
    }

    function testRegexDigitBackreferenceEscapeCase10() public pure {
        string memory target = "anything";
        string memory pattern = "/\\9999999999/";
        target.regex(pattern);
    }

    function testRegexDigitBackreferenceEscapeCase11() public pure {
        string memory target = "anything";
        string memory pattern = "/\\111111111a/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase1() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/😂/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase2() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/bug🦟/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase3() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/⌨️keyboard/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase4() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/test🧪tube/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase5() public pure {
        string memory target = "anything";
        // string memory pattern = unicode"/(❁´◡`❁)/";
        string memory pattern = unicode"/❁/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase6() public pure {
        string memory target = "anything";
        // string memory pattern = unicode"/(❁´◡`❁)/";
        string memory pattern = unicode"/´/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase7() public pure {
        string memory target = "anything";
        // string memory pattern = unicode"/(❁´◡`❁)/";
        string memory pattern = unicode"/◡/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase8() public pure {
        string memory target = "anything";
        // string memory pattern = unicode"/(❁´◡`❁)/";
        string memory pattern = unicode"/`/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase9() public pure {
        string memory target = "anything";
        // string memory pattern = unicode"/(❁´◡`❁)/";
        string memory pattern = unicode"/~/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase10() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/¼/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase11() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/þ/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase12() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/·/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase13() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/é/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase14() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/α/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase15() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/߿/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase16() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/ࠀ/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase17() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/ह/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase18() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/က/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase19() public pure {
        string memory target = "anything";
        // @info: wrong hex by chat gpt: 0xE284A2 ❌ -> 0xE282A2 ✅
        string memory pattern = unicode"/₢/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase20() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/Ⰲ/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase21() public pure {
        string memory target = "anything";
        // @info: wrong hex by chat gpt: 0xE3A081 ❌ -> 0xE38181 ✅
        string memory pattern = unicode"/ぁ/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase22() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/𐀀/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase23() public pure {
        string memory target = "anything";
        // @info: wrong hex by chat gpt: 0xF1808080 ❌ -> 0xF0A08080 ✅
        string memory pattern = unicode"/𠀀/";
        target.regex(pattern);
    }

    function testRegexUnicodeCodepointsInPatternCase24() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/™/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase1() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[abc]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase2() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[0-9]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase3() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[9-0]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase4() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[a-z]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase5() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[z-a]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase6() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[z\\-A]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase7() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[z\\\\-A]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase8() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[zA-\\]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase9() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[zA-\\\\]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase10() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[za-\\\\]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase11() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase12() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[\\p]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase13() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[\\p{}]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase14() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[\\p{]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase15() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[\\p}]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase16() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[\\p{subliminal}}]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase17() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[a-z0-9]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase18() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[a-z-9]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase19() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[a-z9-0]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase20() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[a-z-0-9]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase21() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[a-z-9-0]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase22() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[-a-z-0-9-]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase23() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[-a-z-9-0-]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase24() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[--9]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase25() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[9--]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase26() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[--[9]/";
        target.regex(pattern);
    }

    function testRegexCharacterClassDetectionCase27() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/[[--9]/";
        target.regex(pattern);
    }

    function testRegexGroupCase1() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/()/";
        target.regex(pattern);
    }

    function testRegexGroupCase2() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(/";
        target.regex(pattern);
    }

    function testRegexGroupCase3() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/)/";
        target.regex(pattern);
    }

    function testRegexGroupCase4() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/a(/";
        target.regex(pattern);
    }

    function testRegexGroupCase5() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/\\(/";
        target.regex(pattern);
    }

    function testRegexGroupCase6() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/a\\(/";
        target.regex(pattern);
    }

    function testRegexGroupCase7() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/ca(/";
        target.regex(pattern);
    }

    function testRegexGroupCase8() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/ca\\(/";
        target.regex(pattern);
    }

    function testRegexGroupCase9() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/ca\\\\(/";
        target.regex(pattern);
    }

    function testRegexGroupCase10() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc/";
        target.regex(pattern);
    }

    function testRegexGroupCase11() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc)/";
        target.regex(pattern);
    }

    function testRegexGroupCase12() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?:abc)/";
        target.regex(pattern);
    }

    function testRegexGroupCase13() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?>abc)/";
        target.regex(pattern);
    }

    function testRegexGroupCase14() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc+)/";
        target.regex(pattern);
    }

    function testRegexGroupCase15() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc++)/";
        target.regex(pattern);
    }

    function testRegexGroupCase16() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc*?)/";
        target.regex(pattern);
    }

    function testRegexGroupCase17() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(abc*??)/";
        target.regex(pattern);
    }

    function testRegexGroupCase18() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)+/";
        target.regex(pattern);
    }

    function testRegexGroupCase19() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)*/";
        target.regex(pattern);
    }

    function testRegexGroupCase20() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab)?/";
        target.regex(pattern);
    }

    function testRegexGroupCase21() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,}/";
        target.regex(pattern);
    }

    function testRegexGroupCase22() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,1}/";
        target.regex(pattern);
    }

    function testRegexGroupCase23() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){1,3}/";
        target.regex(pattern);
    }

    function testRegexGroupCase24() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(?<=ab){3,1}/";
        target.regex(pattern);
    }

    function testRegexGroupCase25() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(ab(?<=ab)+)+/";
        target.regex(pattern);
    }

    function testRegexGroupCase26() public pure {
        string memory target = "anything";
        string memory pattern = unicode"/(ab(?=ab)+)+/";
        target.regex(pattern);
    }

    function testExperiment() public pure {
        console2.log("ascii of [ is: ", uint8(abi.encodePacked("[")[0]));
        console2.log("ascii of - is: ", uint8(abi.encodePacked("-")[0]));
        // string memory expStr = "\u0031";
        // string memory expStr = "\u2764";
        // string memory expStr = "\u1F680000";
        // console2.log("expStr code: ", uint8(abi.encodePacked("\x61")[0]));
        // string memory expStr = "\x70";
        // string memory expStr = hex"F09FA684";
        string memory expStr = "\n";
        bytes memory bytesVer = abi.encodePacked(expStr);
        uint8 decForm = uint8(bytesVer[0]);

        console2.log("expStr: ", expStr);
        console2.log("bytes version: ");
        console2.logBytes(bytesVer);
        console2.log("Decimal version: ", decForm);
        console2.log("string length: ", bytesVer.length);

        string memory newExpStr = "\\n\n";
        bytes memory newBytesVer = abi.encodePacked(newExpStr);

        console2.log("newExpStr: ", newExpStr);
        console2.log("new bytes version: ");
        console2.logBytes(newBytesVer);
        console2.log("string length: ", newBytesVer.length);
        expStr = "\\xA0";
        bytesVer = abi.encodePacked(expStr);
        decForm = uint8(bytesVer[0]);
        console2.logBytes("160");

        console2.log("expStr: ", expStr);
        console2.log("bytes version: ");
        console2.logBytes(bytesVer);
        console2.log("Decimal version: ", decForm);
        console2.log("string length: ", bytesVer.length);

        string memory aString = unicode"✅";

        console2.log("astring: ", aString);
        console2.logBytes(abi.encodePacked("160"));
        bytes memory byteStr = "\xa000";
        console2.log("-------------------");
        console2.logBytes(byteStr);
        string memory str = string(byteStr);
        console2.logBytes1(abi.encodePacked(str)[0]);
        console2.log("str: ", str);
        console2.log("-------------------");
        console2.log("---------nbsp----------");
        string memory nbsp = unicode"anil�";
        console2.log("nbsp: ", nbsp);
        console2.logBytes(abi.encodePacked(nbsp));
        console2.log(abi.encodePacked(nbsp).length);
        console2.log("-------------------");
        console2.log("---------A0----------");
        string memory a0 = unicode"\xc2\xa0";
        console2.log("a0: ", a0);
        console2.logBytes(abi.encodePacked(a0));
        console2.log(abi.encodePacked(a0).length);
        string memory anotherForm = unicode"\u00a0";
        console2.log("anotherForm: ", anotherForm);
        console2.logBytes(abi.encodePacked(anotherForm));
        console2.log(abi.encodePacked(anotherForm).length);
        console2.log("-------------------");
        console2.log("---------line separator----------");
        string memory lineSeparator = unicode"\u2028";
        console2.log("lineSeparator: ", lineSeparator);
        console2.logBytes(abi.encodePacked(lineSeparator));
        console2.log("length: ", abi.encodePacked(lineSeparator).length);
        console2.log("-------------------");
        console2.log("---------paragraph separator----------");
        string memory paragraphSeparator = unicode"\u2029";
        console2.log("paragraphSeparator: ", paragraphSeparator);
        console2.logBytes(abi.encodePacked(paragraphSeparator));
        console2.log("length: ", abi.encodePacked(paragraphSeparator).length);
        console2.log("-------------------");
        console2.log("---------OGHAM Space Mark----------");
        string memory oghamSpaceMark = unicode"\u1680";
        console2.log("oghamSpaceMark: ", oghamSpaceMark);
        console2.logBytes(abi.encodePacked(oghamSpaceMark));
        console2.log("length: ", abi.encodePacked(oghamSpaceMark).length);
        console2.log("-------------------");
        console2.log("---------Narrow No-Break Space----------");
        string memory narrowNoBreakSpace = unicode"\u202F";
        console2.log("narrowNoBreakSpace: ", narrowNoBreakSpace);
        console2.logBytes(abi.encodePacked(narrowNoBreakSpace));
        console2.log("length: ", abi.encodePacked(narrowNoBreakSpace).length);
        console2.log("-------------------");
        console2.log("---------Medium Mathematical Space----------");
        string memory mmSpace = unicode"\u205F";
        console2.log("mmSpace: ", mmSpace);
        console2.logBytes(abi.encodePacked(mmSpace));
        console2.log("length: ", abi.encodePacked(mmSpace).length);
        console2.log("-------------------");
        console2.log("---------Ideographic Space----------");
        string memory ideographicSpace = unicode"\u3000";
        console2.log("ideographicSpace: ", ideographicSpace);
        console2.logBytes(abi.encodePacked(ideographicSpace));
        console2.log("length: ", abi.encodePacked(ideographicSpace).length);
        console2.log("-------------------");
        console2.log("---------EN Quad..Hair Space----------");
        string memory enQuadHairSpace = unicode"\u2000";
        console2.log("enQuadHairSpace: ", enQuadHairSpace);
        console2.logBytes(abi.encodePacked(enQuadHairSpace));
        console2.log("length: ", abi.encodePacked(enQuadHairSpace).length);
        string memory enQuadHairSpaceA = unicode"\u200A";
        console2.log("enQuadHairSpaceA: ", enQuadHairSpaceA);
        console2.logBytes(abi.encodePacked(enQuadHairSpaceA));
        console2.log("length: ", abi.encodePacked(enQuadHairSpaceA).length);
        console2.log("-------------------");
        console2.log("---------Zero width no-break space----------");
        string memory nextLine = unicode"\u0085";
        console2.log("nextLine: ", nextLine);
        console2.logBytes(abi.encodePacked(nextLine));
        console2.log("-------------------");
        console2.log("---------Zero width no-break space----------");
        string memory zeroWidthNoBreakSpace = unicode"\uFEFF";
        console2.log("zeroWidthNoBreakSpace: ", zeroWidthNoBreakSpace);
        console2.logBytes(abi.encodePacked(zeroWidthNoBreakSpace));
        console2.log("-------------------");
        console2.log("---------byte order mark----------");
        // string memory byteOrderMark = unicode"\u00F7";
        string memory byteOrderMark = unicode"\ufeff";
        console2.log("byteOrderMark: ", byteOrderMark);
        console2.logBytes(abi.encodePacked(byteOrderMark));
        bytes memory randomByte = hex"c3b7";
        string memory randomString = unicode"/c3÷/";
        console2.log(string(randomByte));
        console2.logBytes(randomByte);
        console2.log("random string: ");
        console2.logBytes(abi.encodePacked(randomString));
        console2.logBytes1(abi.encodePacked(randomString)[0]);
        console2.log(abi.encodePacked(randomString).length);
        console2.log("length: ", abi.encodePacked(byteOrderMark).length);
        console2.logBytes1(0xc2);
        console2.logBytes1(0xa0);
        console2.logBytes2(0xc2a0);
        console2.log(uint8(0x80));
        console2.log(uint8(0xa0));
        console2.log(uint8(0x9f));
        console2.log(uint8(0x90));
        console2.log(uint8(0x8f));
        console2.log(uint8(0xbf));
        console2.log(uint256(0xE284A2));
        console2.log(uint256(0x10ffff));
        console2.log("-------------------");
        console2.log("----------hex-conversion-verification----------");
        console2.log("0x80: ", uint8(0x80));
        console2.log("0xbf: ", uint8(0xbf));
        console2.log("0xc2: ", uint8(0xc2));
        // 0xf4 = 244 = 11110100
        // 244 = 244/2 = 122(0) = 122/2 = 61(0) = 61/2 = 30(1) = 30/2 = 15(0) = 15/2 = 7(1) = 7/2 = 3(1) = 3/2 = 1(1) = 11110100
        console2.log("0xf4: ", uint8(0xf4));
        console2.log("0xff: ", uint8(0xff));

        console2.log("----------------------------");
        // 195/2 => 97 rem = 1
        // 97/2 => 48 rem = 1
        // 48/2 => 24 rem = 0
        // 24/2 = 12 rem = 0
        // 12/2 => 6 rem = 0
        // 6/2 => 3 rem = 0
        // 3/2 => 1 rem = 1
        // 11000011
        string memory binary;
        uint8 decimal = 213;
        uint8 decimalCpy = decimal;
        while (decimal != 0) {
            binary = decimal % 2 == 0 ? string(abi.encodePacked("0", binary)) : string(abi.encodePacked("1", binary));
            decimal = decimal >> 1;
        }

        console2.log("binary of ", decimalCpy, " is: ", binary);

        string memory strippedBinary;
        uint8 usableBits = 6;
        for (uint8 i = 0; i < usableBits; i++) {
            strippedBinary = decimalCpy % 2 == 0
                ? string(abi.encodePacked("0", strippedBinary))
                : string(abi.encodePacked("1", strippedBinary));
            decimalCpy = decimalCpy >> 1;
        }

        console2.log("strippedBinary: ", strippedBinary);
        console2.log("strippedBinary bytes form: ");
        console2.logBytes(bytes(strippedBinary));
        console2.log("strippedBinary length: ", bytes(strippedBinary).length);
        string memory n = "10";
        bytes memory temp = abi.encodePacked(n);
        console2.logBytes(abi.encodePacked(temp[temp.length - 1]));
        console2.log("temp length: ", temp.length);
        console2.logBytes2(bytes2(temp));
        console2.log(string(abi.encodePacked("111", temp)));
        bytes memory someHex = abi.encodePacked(hex"010EAD");
        console2.logBytes(someHex);
        uint256 dec = Stringray.hexToDec(someHex, 8, false);
        console2.log("decimal: ", dec);

        if (0x88 >= 0x80 && 0x88 <= 0x8a) {
            console2.log("yes logical operators work with bytes1 type");
        }
    }

    function testPropertyExperiment() public pure {
        console2.log("--------------------hex-conversion-verification--------------------");
        string memory bidiCtrl1 = unicode"\u061C";
        string memory bidiCtrl2 = unicode"\u200E";
        string memory bidiCtrl3 = unicode"\u200F";
        string memory bidiCtrl4 = unicode"\u202A";
        string memory bidiCtrl5 = unicode"\u202E";
        string memory bidiCtrl6 = unicode"\u2066";
        string memory bidiCtrl7 = unicode"\u2069";
        console2.log("0x061C: ", bidiCtrl1);
        console2.logBytes(abi.encodePacked(bidiCtrl1));
        console2.log("0x200E: ", bidiCtrl2);
        console2.logBytes(abi.encodePacked(bidiCtrl2));
        console2.log("0x200F: ", bidiCtrl3);
        console2.logBytes(abi.encodePacked(bidiCtrl3));
        console2.log("0x202A: ", bidiCtrl4);
        console2.logBytes(abi.encodePacked(bidiCtrl4));
        console2.log("0x202E: ", bidiCtrl5);
        console2.logBytes(abi.encodePacked(bidiCtrl5));
        console2.log("0x2066: ", bidiCtrl6);
        console2.logBytes(abi.encodePacked(bidiCtrl6));
        console2.log("0x2069: ", bidiCtrl7);
        console2.logBytes(abi.encodePacked(bidiCtrl7));
        string memory joinControl = unicode"\u200C";
        console2.log("200C: ", joinControl);
        console2.logBytes(abi.encodePacked(joinControl));
        string memory dash = unicode"\u002D";
        console2.log("002D: ", dash);
        console2.logBytes(abi.encodePacked(dash));
        string memory dash2 = unicode"\u058A";
        console2.log("058A: ", dash2);
        console2.logBytes(abi.encodePacked(dash2));
        string memory dash3 = unicode"\u05BE";
        console2.log("05BE: ", dash3);
        console2.logBytes(abi.encodePacked(dash3));
        string memory dash4 = unicode"\u1400";
        console2.log("1400: ", dash4);
        console2.logBytes(abi.encodePacked(dash4));
        string memory dash5 = unicode"\u1806";
        console2.log("1806: ", dash5);
        console2.logBytes(abi.encodePacked(dash5));
        string memory dash6 = unicode"\u2010";
        console2.log("2010: ", dash6);
        console2.logBytes(abi.encodePacked(dash6));
        string memory dash7 = unicode"\u2015";
        console2.log("2015: ", dash7);
        console2.logBytes(abi.encodePacked(dash7));
        string memory dash8 = unicode"\u2053";
        console2.log("2053: ", dash8);
        console2.logBytes(abi.encodePacked(dash8));
        string memory dash9 = unicode"\u207B";
        console2.log("207B: ", dash9);
        console2.logBytes(abi.encodePacked(dash9));
        string memory dash10 = unicode"\u208B";
        console2.log("208B: ", dash10);
        console2.logBytes(abi.encodePacked(dash10));
        string memory dash11 = unicode"\u2212";
        console2.log("2212: ", dash11);
        console2.logBytes(abi.encodePacked(dash11));
        string memory dash12 = unicode"\u2E17";
        console2.log("2E17: ", dash12);
        console2.logBytes(abi.encodePacked(dash12));
        string memory dash13 = unicode"\u2E1A";
        console2.log("2E1A: ", dash13);
        console2.logBytes(abi.encodePacked(dash13));
        string memory dash14 = unicode"\u2E3A";
        console2.log("2E3A: ", dash14);
        console2.logBytes(abi.encodePacked(dash14));
        string memory dash15 = unicode"\u2E3B";
        console2.log("2E3B: ", dash15);
        console2.logBytes(abi.encodePacked(dash15));
        string memory dash16 = unicode"\u2E40";
        console2.log("2E40: ", dash16);
        console2.logBytes(abi.encodePacked(dash16));
        string memory dash17 = unicode"\u2E5D";
        console2.log("2E5D: ", dash17);
        console2.logBytes(abi.encodePacked(dash17));
        string memory dash18 = unicode"\u301C";
        console2.log("301C: ", dash18);
        console2.logBytes(abi.encodePacked(dash18));
        string memory dash19 = unicode"\u3030";
        console2.log("3030: ", dash19);
        console2.logBytes(abi.encodePacked(dash19));
        string memory dash20 = unicode"\u30A0";
        console2.log("30A0: ", dash20);
        console2.logBytes(abi.encodePacked(dash20));
        string memory dash21 = unicode"\uFE31";
        console2.log("FE31: ", dash21);
        console2.logBytes(abi.encodePacked(dash21));
        string memory dash22 = unicode"\uFE32";
        console2.log("FE32: ", dash22);
        console2.logBytes(abi.encodePacked(dash22));
        string memory dash23 = unicode"\uFE58";
        console2.log("FE58: ", dash23);
        console2.logBytes(abi.encodePacked(dash23));
        string memory dash24 = unicode"\uFE63";
        console2.log("FE63: ", dash24);
        console2.logBytes(abi.encodePacked(dash24));
        string memory dash25 = unicode"\uFF0D";
        console2.log("FF0D: ", dash25);
        console2.logBytes(abi.encodePacked(dash25));
        string memory dash26 = string(abi.encodePacked(bytes4(0xF090B5AE)));
        console2.log("10D6E literal: ", unicode"𐵮");
        console2.log("10D6E: ", dash26);
        console2.logBytes(abi.encodePacked(dash26));
        string memory dash27 = unicode"𐺭";
        console2.log("10EAD: ", dash27);
        console2.logBytes(abi.encodePacked(dash27));
        console2.log(string(abi.encodePacked(dash27)));
        console2.log(
            "----------------------------------------------------hyphen----------------------------------------------------"
        );
        string memory hyphen = unicode"\u00AD";
        console2.log("00AD: ", hyphen);
        console2.logBytes(abi.encodePacked(hyphen));
        string memory hyphen2 = unicode"\u058A";
        console2.log("058A: ", hyphen2);
        console2.logBytes(abi.encodePacked(hyphen2));
        string memory hyphen3 = unicode"\u1806";
        console2.log("1806: ", hyphen3);
        console2.logBytes(abi.encodePacked(hyphen3));
        string memory hyphen4 = unicode"\u2010";
        console2.log("2010: ", hyphen4);
        console2.logBytes(abi.encodePacked(hyphen4));
        string memory hyphen5 = unicode"\u2E17";
        console2.log("2E17: ", hyphen5);
        console2.logBytes(abi.encodePacked(hyphen5));
        string memory hyphen6 = unicode"\u30FB";
        console2.log("30FB: ", hyphen6);
        console2.logBytes(abi.encodePacked(hyphen6));
        string memory hyphen7 = unicode"\uFE63";
        console2.log("FE63: ", hyphen7);
        console2.logBytes(abi.encodePacked(hyphen7));
        string memory hyphen8 = unicode"\uFF0D";
        console2.log("FF0D: ", hyphen8);
        console2.logBytes(abi.encodePacked(hyphen8));
        string memory hyphen9 = unicode"\uFF65";
        console2.log("FF65: ", hyphen9);
        console2.logBytes(abi.encodePacked(hyphen9));
        console2.log(
            "----------------------------------------------------Quotation_Mark----------------------------------------------------"
        );
        string memory quotationMark = unicode"\u0022";
        console2.log("0022: ", quotationMark);
        console2.logBytes(abi.encodePacked(quotationMark));
        string memory quotationMark2 = unicode"\u0027";
        console2.log("0027: ", quotationMark2);
        console2.logBytes(abi.encodePacked(quotationMark2));
        string memory quotationMark3 = unicode"\u00AB";
        console2.log("00AB: ", quotationMark3);
        console2.logBytes(abi.encodePacked(quotationMark3));
        string memory quotationMark4 = unicode"\u00BB";
        console2.log("00BB: ", quotationMark4);
        console2.logBytes(abi.encodePacked(quotationMark4));
        string memory quotationMark5 = unicode"\u2018";
        console2.log("2018: ", quotationMark5);
        console2.logBytes(abi.encodePacked(quotationMark5));
        string memory quotationMark6 = unicode"\u2019";
        console2.log("2019: ", quotationMark6);
        console2.logBytes(abi.encodePacked(quotationMark6));
        string memory quotationMark7 = unicode"\u201A";
        console2.log("201A: ", quotationMark7);
        console2.logBytes(abi.encodePacked(quotationMark7));
        string memory quotationMark8 = unicode"\u201B";
        console2.log("201B: ", quotationMark8);
        console2.logBytes(abi.encodePacked(quotationMark8));
        string memory quotationMark9 = unicode"\u201C";
        console2.log("201C: ", quotationMark9);
        console2.logBytes(abi.encodePacked(quotationMark9));
        string memory quotationMark10 = unicode"\u201D";
        console2.log("201D: ", quotationMark10);
        console2.logBytes(abi.encodePacked(quotationMark10));
        string memory quotationMark11 = unicode"\u201E";
        console2.log("201E: ", quotationMark11);
        console2.logBytes(abi.encodePacked(quotationMark11));
        string memory quotationMark12 = unicode"\u201F";
        console2.log("201F: ", quotationMark12);
        console2.logBytes(abi.encodePacked(quotationMark12));
        string memory quotationMark13 = unicode"\u2039";
        console2.log("2039: ", quotationMark13);
        console2.logBytes(abi.encodePacked(quotationMark13));
        string memory quotationMark14 = unicode"\u203A";
        console2.log("203A: ", quotationMark14);
        console2.logBytes(abi.encodePacked(quotationMark14));
        string memory quotationMark15 = unicode"\u2E42";
        console2.log("2E42: ", quotationMark15);
        console2.logBytes(abi.encodePacked(quotationMark15));
        string memory quotationMark16 = unicode"\u300C";
        console2.log("300C: ", quotationMark16);
        console2.logBytes(abi.encodePacked(quotationMark16));
        string memory quotationMark17 = unicode"\u300D";
        console2.log("300D: ", quotationMark17);
        console2.logBytes(abi.encodePacked(quotationMark17));
        string memory quotationMark18 = unicode"\u300E";
        console2.log("300E: ", quotationMark18);
        console2.logBytes(abi.encodePacked(quotationMark18));
        string memory quotationMark19 = unicode"\u300F";
        console2.log("300F: ", quotationMark19);
        console2.logBytes(abi.encodePacked(quotationMark19));
        string memory quotationMark20 = unicode"\u301D";
        console2.log("301D: ", quotationMark20);
        console2.logBytes(abi.encodePacked(quotationMark20));
        string memory quotationMark21 = unicode"\u301E";
        console2.log("301E: ", quotationMark21);
        console2.logBytes(abi.encodePacked(quotationMark21));
        string memory quotationMark22 = unicode"\u301F";
        console2.log("301F: ", quotationMark22);
        console2.logBytes(abi.encodePacked(quotationMark22));
        string memory quotationMark23 = unicode"\uFE41";
        console2.log("FE41: ", quotationMark23);
        console2.logBytes(abi.encodePacked(quotationMark23));
        string memory quotationMark24 = unicode"\uFE42";
        console2.log("FE42: ", quotationMark24);
        console2.logBytes(abi.encodePacked(quotationMark24));
        string memory quotationMark25 = unicode"\uFE43";
        console2.log("FE43: ", quotationMark25);
        console2.logBytes(abi.encodePacked(quotationMark25));
        string memory quotationMark26 = unicode"\uFE44";
        console2.log("FE44: ", quotationMark26);
        console2.logBytes(abi.encodePacked(quotationMark26));
        string memory quotationMark27 = unicode"\uFF02";
        console2.log("FF02: ", quotationMark27);
        console2.logBytes(abi.encodePacked(quotationMark27));
        string memory quotationMark28 = unicode"\uFF07";
        console2.log("FF07: ", quotationMark28);
        console2.logBytes(abi.encodePacked(quotationMark28));
        string memory quotationMark29 = unicode"\uFF62";
        console2.log("FF62: ", quotationMark29);
        console2.logBytes(abi.encodePacked(quotationMark29));
        string memory quotationMark30 = unicode"\uFF63";
        console2.log("FF63: ", quotationMark30);
        console2.logBytes(abi.encodePacked(quotationMark30));
        console2.log(
            "----------------------------------------------------Terminal_Punctuation----------------------------------------------------"
        );
        string memory terminalPunctuation = unicode"\u0021";
        console2.log("0021: ", terminalPunctuation);
        console2.logBytes(abi.encodePacked(terminalPunctuation));
        string memory terminalPunctuation2 = unicode"\u002C";
        console2.log("002C: ", terminalPunctuation2);
        console2.logBytes(abi.encodePacked(terminalPunctuation2));
        string memory terminalPunctuation3 = unicode"\u002E";
        console2.log("002E: ", terminalPunctuation3);
        console2.logBytes(abi.encodePacked(terminalPunctuation3));
        // loop 1: start
        string memory terminalPunctuation4 = unicode"\u003A";
        console2.log("003A: ", terminalPunctuation4);
        console2.logBytes(abi.encodePacked(terminalPunctuation4));
        // loop 1: end
        string memory terminalPunctuation5 = unicode"\u003B";
        console2.log("003B: ", terminalPunctuation5);
        console2.logBytes(abi.encodePacked(terminalPunctuation5));
        string memory terminalPunctuation6 = unicode"\u003F";
        console2.log("003F: ", terminalPunctuation6);
        console2.logBytes(abi.encodePacked(terminalPunctuation6));
        string memory terminalPunctuation7 = unicode"\u037E";
        console2.log("037E: ", terminalPunctuation7);
        console2.logBytes(abi.encodePacked(terminalPunctuation7));
        string memory terminalPunctuation8 = unicode"\u0387";
        console2.log("0387: ", terminalPunctuation8);
        console2.logBytes(abi.encodePacked(terminalPunctuation8));
        string memory terminalPunctuation9 = unicode"\u0589";
        console2.log("0589: ", terminalPunctuation9);
        console2.logBytes(abi.encodePacked(terminalPunctuation9));
        string memory terminalPunctuation10 = unicode"\u05C3";
        console2.log("05C3: ", terminalPunctuation10);
        console2.logBytes(abi.encodePacked(terminalPunctuation10));
        string memory terminalPunctuation11 = unicode"\u060C";
        console2.log("060C: ", terminalPunctuation11);
        console2.logBytes(abi.encodePacked(terminalPunctuation11));
        string memory terminalPunctuation12 = unicode"\u061B";
        console2.log("061B: ", terminalPunctuation12);
        console2.logBytes(abi.encodePacked(terminalPunctuation12));
        // loop 2: start
        string memory terminalPunctuation13 = unicode"\u061D";
        console2.log("061D: ", terminalPunctuation13);
        console2.logBytes(abi.encodePacked(terminalPunctuation13));
        // loop 2: end
        string memory terminalPunctuation14 = unicode"\u061F";
        console2.log("061F: ", terminalPunctuation14);
        console2.logBytes(abi.encodePacked(terminalPunctuation14));
        string memory terminalPunctuation15 = unicode"\u06D4";
        console2.log("06D4: ", terminalPunctuation15);
        console2.logBytes(abi.encodePacked(terminalPunctuation15));
        // loop 3: start
        string memory terminalPunctuation16 = unicode"\u0700";
        console2.log("0700: ", terminalPunctuation16);
        console2.logBytes(abi.encodePacked(terminalPunctuation16));
        // loop 3: end
        string memory terminalPunctuation17 = unicode"\u070A";
        console2.log("070A: ", terminalPunctuation17);
        console2.logBytes(abi.encodePacked(terminalPunctuation17));
        string memory terminalPunctuation18 = unicode"\u070C";
        console2.log("070C: ", terminalPunctuation18);
        console2.logBytes(abi.encodePacked(terminalPunctuation18));
        // loop 4: start
        string memory terminalPunctuation19 = unicode"\u07F8";
        console2.log("07F8: ", terminalPunctuation19);
        console2.logBytes(abi.encodePacked(terminalPunctuation19));
        // loop 4: end
        string memory terminalPunctuation20 = unicode"\u07F9";
        console2.log("07F9: ", terminalPunctuation20);
        console2.logBytes(abi.encodePacked(terminalPunctuation20));
        // loop 5: start
        string memory terminalPunctuation21 = unicode"\u0830";
        console2.log("0830: ", terminalPunctuation21);
        console2.logBytes(abi.encodePacked(terminalPunctuation21));
        // loop 5: end
        string memory terminalPunctuation22 = unicode"\u0835";
        console2.log("0835: ", terminalPunctuation22);
        console2.logBytes(abi.encodePacked(terminalPunctuation22));
        // loop 6: start
        string memory terminalPunctuation23 = unicode"\u0837";
        console2.log("0837: ", terminalPunctuation23);
        console2.logBytes(abi.encodePacked(terminalPunctuation23));
        // loop 6: end
        string memory terminalPunctuation24 = unicode"\u083E";
        console2.log("083E: ", terminalPunctuation24);
        console2.logBytes(abi.encodePacked(terminalPunctuation24));
        // loop 7: start
        string memory terminalPunctuation25 = unicode"\u0964";
        console2.log("0964: ", terminalPunctuation25);
        console2.logBytes(abi.encodePacked(terminalPunctuation25));
        // loop 7: end
        string memory terminalPunctuation26 = unicode"\u0965";
        console2.log("0965: ", terminalPunctuation26);
        console2.logBytes(abi.encodePacked(terminalPunctuation26));
        // loop 8: start
        string memory terminalPunctuation27 = unicode"\u0E5A";
        console2.log("0E5A: ", terminalPunctuation27);
        console2.logBytes(abi.encodePacked(terminalPunctuation27));
        // loop 8: end
        string memory terminalPunctuation28 = unicode"\u0E5B";
        console2.log("0E5B: ", terminalPunctuation28);
        console2.logBytes(abi.encodePacked(terminalPunctuation28));
        string memory terminalPunctuation29 = unicode"\u0F08";
        console2.log("0F08: ", terminalPunctuation29);
        console2.logBytes(abi.encodePacked(terminalPunctuation29));
        // loop 9: start
        string memory terminalPunctuation30 = unicode"\u0F0D";
        console2.log("0F0D: ", terminalPunctuation30);
        console2.logBytes(abi.encodePacked(terminalPunctuation30));
        // loop 9: end
        string memory terminalPunctuation31 = unicode"\u0F12";
        console2.log("0F12: ", terminalPunctuation31);
        console2.logBytes(abi.encodePacked(terminalPunctuation31));
        // loop 10: start
        string memory terminalPunctuation32 = unicode"\u104A";
        console2.log("104A: ", terminalPunctuation32);
        console2.logBytes(abi.encodePacked(terminalPunctuation32));
        // loop 10: end
        string memory terminalPunctuation33 = unicode"\u104B";
        console2.log("104B: ", terminalPunctuation33);
        console2.logBytes(abi.encodePacked(terminalPunctuation33));
        // loop 11: start
        string memory terminalPunctuation34 = unicode"\u1361";
        console2.log("1361: ", terminalPunctuation34);
        console2.logBytes(abi.encodePacked(terminalPunctuation34));
        // loop 11: end
        string memory terminalPunctuation35 = unicode"\u1368";
        console2.log("1368: ", terminalPunctuation35);
        console2.logBytes(abi.encodePacked(terminalPunctuation35));
        string memory terminalPunctuation36 = unicode"\u166E";
        console2.log("166E: ", terminalPunctuation36);
        console2.logBytes(abi.encodePacked(terminalPunctuation36));
        // loop 12: start
        string memory terminalPunctuation37 = unicode"\u16EB";
        console2.log("16EB: ", terminalPunctuation37);
        console2.logBytes(abi.encodePacked(terminalPunctuation37));
        // loop 12: end
        string memory terminalPunctuation38 = unicode"\u16ED";
        console2.log("16ED: ", terminalPunctuation38);
        console2.logBytes(abi.encodePacked(terminalPunctuation38));
        // loop 13: start
        string memory terminalPunctuation39 = unicode"\u1735";
        console2.log("1735: ", terminalPunctuation39);
        console2.logBytes(abi.encodePacked(terminalPunctuation39));
        // loop 13: end
        string memory terminalPunctuation40 = unicode"\u1736";
        console2.log("1736: ", terminalPunctuation40);
        console2.logBytes(abi.encodePacked(terminalPunctuation40));
        // loop 14: start
        string memory terminalPunctuation41 = unicode"\u17D4";
        console2.log("17D4: ", terminalPunctuation41);
        console2.logBytes(abi.encodePacked(terminalPunctuation41));
        // loop 14: end
        string memory terminalPunctuation42 = unicode"\u17D6";
        console2.log("17D6: ", terminalPunctuation42);
        console2.logBytes(abi.encodePacked(terminalPunctuation42));
        // loop 15: start
        string memory terminalPunctuation43 = unicode"\u1802";
        console2.log("1802: ", terminalPunctuation43);
        console2.logBytes(abi.encodePacked(terminalPunctuation43));
        // loop 15: end
        string memory terminalPunctuation44 = unicode"\u1805";
        console2.log("1805: ", terminalPunctuation44);
        console2.logBytes(abi.encodePacked(terminalPunctuation44));
        // loop 16: start
        string memory terminalPunctuation45 = unicode"\u1808";
        console2.log("1808: ", terminalPunctuation45);
        console2.logBytes(abi.encodePacked(terminalPunctuation45));
        // loop 16: end
        string memory terminalPunctuation46 = unicode"\u1809";
        console2.log("1809: ", terminalPunctuation46);
        console2.logBytes(abi.encodePacked(terminalPunctuation46));
        // loop 17: start
        string memory terminalPunctuation47 = unicode"\u1944";
        console2.log("1944: ", terminalPunctuation47);
        console2.logBytes(abi.encodePacked(terminalPunctuation47));
        // loop 17: end
        string memory terminalPunctuation48 = unicode"\u1945";
        console2.log("1945: ", terminalPunctuation48);
        console2.logBytes(abi.encodePacked(terminalPunctuation48));
        // loop 18: start
        string memory terminalPunctuation49 = unicode"\u1AA8";
        console2.log("1AA8: ", terminalPunctuation49);
        console2.logBytes(abi.encodePacked(terminalPunctuation49));
        // loop 18: end
        string memory terminalPunctuation450 = unicode"\u1AAB";
        console2.log("1AAB: ", terminalPunctuation450);
        console2.logBytes(abi.encodePacked(terminalPunctuation450));
        // loop 19: start
        string memory terminalPunctuation51 = unicode"\u1B4E";
        console2.log("1B4E: ", terminalPunctuation51);
        console2.logBytes(abi.encodePacked(terminalPunctuation51));
        // loop 19: end
        string memory terminalPunctuation52 = unicode"\u1B4F";
        console2.log("1B4F: ", terminalPunctuation52);
        console2.logBytes(abi.encodePacked(terminalPunctuation52));
        // loop 20: start
        string memory terminalPunctuation53 = unicode"\u1B5A";
        console2.log("1B5A: ", terminalPunctuation53);
        console2.logBytes(abi.encodePacked(terminalPunctuation53));
        // loop 20: end
        string memory terminalPunctuation54 = unicode"\u1B5B";
        console2.log("1B5B: ", terminalPunctuation54);
        console2.logBytes(abi.encodePacked(terminalPunctuation54));
        // loop 21: start
        string memory terminalPunctuation55 = unicode"\u1B5D";
        console2.log("1B5D: ", terminalPunctuation55);
        console2.logBytes(abi.encodePacked(terminalPunctuation55));
        // loop 21: end
        string memory terminalPunctuation56 = unicode"\u1B5F";
        console2.log("1B5F: ", terminalPunctuation56);
        console2.logBytes(abi.encodePacked(terminalPunctuation56));
        // loop 22: start
        string memory terminalPunctuation57 = unicode"\u1B7D";
        console2.log("1B7D: ", terminalPunctuation57);
        console2.logBytes(abi.encodePacked(terminalPunctuation57));
        // loop 22: end
        string memory terminalPunctuation58 = unicode"\u1B7F";
        console2.log("1B7F: ", terminalPunctuation58);
        console2.logBytes(abi.encodePacked(terminalPunctuation58));
        // loop 23: start
        string memory terminalPunctuation59 = unicode"\u1C3B";
        console2.log("1C3B: ", terminalPunctuation59);
        console2.logBytes(abi.encodePacked(terminalPunctuation59));
        // loop 24: end
        string memory terminalPunctuation60 = unicode"\u1C3F";
        console2.log("1C3F: ", terminalPunctuation60);
        console2.logBytes(abi.encodePacked(terminalPunctuation60));
        // loop 25: start
        string memory terminalPunctuation61 = unicode"\u1C7E";
        console2.log("1C7E: ", terminalPunctuation61);
        console2.logBytes(abi.encodePacked(terminalPunctuation61));
        // loop 25: end
        string memory terminalPunctuation62 = unicode"\u1C7F";
        console2.log("1C7F: ", terminalPunctuation62);
        console2.logBytes(abi.encodePacked(terminalPunctuation62));
        // loop 26: start
        string memory terminalPunctuation63 = unicode"\u203C";
        console2.log("203C: ", terminalPunctuation63);
        console2.logBytes(abi.encodePacked(terminalPunctuation63));
        // loop 26: end
        string memory terminalPunctuation64 = unicode"\u203D";
        console2.log("203D: ", terminalPunctuation64);
        console2.logBytes(abi.encodePacked(terminalPunctuation64));
        // loop 27: start
        string memory terminalPunctuation65 = unicode"\u2047";
        console2.log("2047: ", terminalPunctuation65);
        console2.logBytes(abi.encodePacked(terminalPunctuation65));
        // loop 27: end
        string memory terminalPunctuation66 = unicode"\u2049";
        console2.log("2049: ", terminalPunctuation66);
        console2.logBytes(abi.encodePacked(terminalPunctuation66));
        // loop 28: start
        string memory terminalPunctuation67 = unicode"\u2CF9";
        console2.log("2CF9: ", terminalPunctuation67);
        console2.logBytes(abi.encodePacked(terminalPunctuation67));
        // loop 29: end
        string memory terminalPunctuation68 = unicode"\u2CFB";
        console2.log("2CFB: ", terminalPunctuation68);
        console2.logBytes(abi.encodePacked(terminalPunctuation68));
        string memory terminalPunctuation69 = unicode"\u2E2E";
        console2.log("2E2E: ", terminalPunctuation69);
        console2.logBytes(abi.encodePacked(terminalPunctuation69));
        string memory terminalPunctuation70 = unicode"\u2E3C";
        console2.log("2E3C: ", terminalPunctuation70);
        console2.logBytes(abi.encodePacked(terminalPunctuation70));
        string memory terminalPunctuation71 = unicode"\u2E41";
        console2.log("2E41: ", terminalPunctuation71);
        console2.logBytes(abi.encodePacked(terminalPunctuation71));
        string memory terminalPunctuation72 = unicode"\u2E4C";
        console2.log("2E4C: ", terminalPunctuation72);
        console2.logBytes(abi.encodePacked(terminalPunctuation72));
        // loop 30: start
        string memory terminalPunctuation73 = unicode"\u2E4E";
        console2.log("2E4E: ", terminalPunctuation73);
        console2.logBytes(abi.encodePacked(terminalPunctuation73));
        // loop 30: end
        string memory terminalPunctuation74 = unicode"\u2E4F";
        console2.log("2E4F: ", terminalPunctuation74);
        console2.logBytes(abi.encodePacked(terminalPunctuation74));
        // loop 31: start
        string memory terminalPunctuation75 = unicode"\u2E53";
        console2.log("2E53: ", terminalPunctuation75);
        console2.logBytes(abi.encodePacked(terminalPunctuation75));
        // loop 31: end
        string memory terminalPunctuation76 = unicode"\u2E54";
        console2.log("2E54: ", terminalPunctuation76);
        console2.logBytes(abi.encodePacked(terminalPunctuation76));
        // loop 32: start
        string memory terminalPunctuation77 = unicode"\u3001";
        console2.log("3001: ", terminalPunctuation77);
        console2.logBytes(abi.encodePacked(terminalPunctuation77));
        // loop 32: end
        string memory terminalPunctuation78 = unicode"\u3002";
        console2.log("3002: ", terminalPunctuation78);
        console2.logBytes(abi.encodePacked(terminalPunctuation78));
        // loop 33: start
        string memory terminalPunctuation79 = unicode"\uA4FE";
        console2.log("A4FE: ", terminalPunctuation79);
        console2.logBytes(abi.encodePacked(terminalPunctuation79));
        // loop 33: end
        string memory terminalPunctuation80 = unicode"\uA4FF";
        console2.log("A4FF: ", terminalPunctuation80);
        console2.logBytes(abi.encodePacked(terminalPunctuation80));
        // loop 34: start
        string memory terminalPunctuation81 = unicode"\uA60D";
        console2.log("A60D: ", terminalPunctuation81);
        console2.logBytes(abi.encodePacked(terminalPunctuation81));
        // loop 34: end
        string memory terminalPunctuation82 = unicode"\uA60F";
        console2.log("A60F: ", terminalPunctuation82);
        console2.logBytes(abi.encodePacked(terminalPunctuation82));
        // loop 35: start
        string memory terminalPunctuation83 = unicode"\uA6F3";
        console2.log("A6F3: ", terminalPunctuation83);
        console2.logBytes(abi.encodePacked(terminalPunctuation83));
        // loop 35: end
        string memory terminalPunctuation84 = unicode"\uA6F7";
        console2.log("A6F7: ", terminalPunctuation84);
        console2.logBytes(abi.encodePacked(terminalPunctuation84));
        // loop 36: start
        string memory terminalPunctuation85 = unicode"\uA876";
        console2.log("A876: ", terminalPunctuation85);
        console2.logBytes(abi.encodePacked(terminalPunctuation85));
        // loop 36: end
        string memory terminalPunctuation86 = unicode"\uA877";
        console2.log("A877: ", terminalPunctuation86);
        console2.logBytes(abi.encodePacked(terminalPunctuation86));
        // loop 37: start
        string memory terminalPunctuation87 = unicode"\uA8CE";
        console2.log("A8CE: ", terminalPunctuation87);
        console2.logBytes(abi.encodePacked(terminalPunctuation87));
        // loop 37: end
        string memory terminalPunctuation88 = unicode"\uA8CF";
        console2.log("A8CF: ", terminalPunctuation88);
        console2.logBytes(abi.encodePacked(terminalPunctuation88));
        string memory terminalPunctuation89 = unicode"\uA92F";
        console2.log("A92F: ", terminalPunctuation89);
        console2.logBytes(abi.encodePacked(terminalPunctuation89));
        // loop 38: start
        string memory terminalPunctuation90 = unicode"\uA9C7";
        console2.log("A9C7: ", terminalPunctuation90);
        console2.logBytes(abi.encodePacked(terminalPunctuation90));
        // loop 38: end
        string memory terminalPunctuation91 = unicode"\uA9C9";
        console2.log("A9C9: ", terminalPunctuation91);
        console2.logBytes(abi.encodePacked(terminalPunctuation91));
        // loop 39: start
        string memory terminalPunctuation92 = unicode"\uAA5D";
        console2.log("AA5D: ", terminalPunctuation92);
        console2.logBytes(abi.encodePacked(terminalPunctuation92));
        // loop 39: end
        string memory terminalPunctuation93 = unicode"\uAA5F";
        console2.log("AA5F: ", terminalPunctuation93);
        console2.logBytes(abi.encodePacked(terminalPunctuation93));
        string memory terminalPunctuation94 = unicode"\uAADF";
        console2.log("AADF: ", terminalPunctuation94);
        console2.logBytes(abi.encodePacked(terminalPunctuation94));
        // loop 40: start
        string memory terminalPunctuation95 = unicode"\uAAF0";
        console2.log("AAF0: ", terminalPunctuation95);
        console2.logBytes(abi.encodePacked(terminalPunctuation95));
        // loop 40: end
        string memory terminalPunctuation96 = unicode"\uAAF1";
        console2.log("AAF1: ", terminalPunctuation96);
        console2.logBytes(abi.encodePacked(terminalPunctuation96));
        string memory terminalPunctuation97 = unicode"\uABEB";
        console2.log("ABEB: ", terminalPunctuation97);
        console2.logBytes(abi.encodePacked(terminalPunctuation97));
        string memory terminalPunctuation98 = unicode"\uFE12";
        console2.log("FE12: ", terminalPunctuation98);
        console2.logBytes(abi.encodePacked(terminalPunctuation98));
        // loop 41: start
        string memory terminalPunctuation99 = unicode"\uFE15";
        console2.log("FE15: ", terminalPunctuation99);
        console2.logBytes(abi.encodePacked(terminalPunctuation99));
        // loop 41: end
        string memory terminalPunctuation100 = unicode"\uFE16";
        console2.log("FE16: ", terminalPunctuation100);
        console2.logBytes(abi.encodePacked(terminalPunctuation100));
        // loop 42: start
        string memory terminalPunctuation101 = unicode"\uFE50";
        console2.log("FE50: ", terminalPunctuation101);
        console2.logBytes(abi.encodePacked(terminalPunctuation101));
        // loop 42: end
        string memory terminalPunctuation102 = unicode"\uFE52";
        console2.log("FE52: ", terminalPunctuation102);
        console2.logBytes(abi.encodePacked(terminalPunctuation102));
        // loop 43: start
        string memory terminalPunctuation103 = unicode"\uFE54";
        console2.log("FE54: ", terminalPunctuation103);
        console2.logBytes(abi.encodePacked(terminalPunctuation103));
        // loop 43: end
        string memory terminalPunctuation104 = unicode"\uFE57";
        console2.log("FE57: ", terminalPunctuation104);
        console2.logBytes(abi.encodePacked(terminalPunctuation104));
        string memory terminalPunctuation105 = unicode"\uFF01";
        console2.log("FF01: ", terminalPunctuation105);
        console2.logBytes(abi.encodePacked(terminalPunctuation105));
        string memory terminalPunctuation106 = unicode"\uFF0C";
        console2.log("FF0C: ", terminalPunctuation106);
        console2.logBytes(abi.encodePacked(terminalPunctuation106));
        string memory terminalPunctuation107 = unicode"\uFF0E";
        console2.log("FF0E: ", terminalPunctuation107);
        console2.logBytes(abi.encodePacked(terminalPunctuation107));
        // loop 44: start
        string memory terminalPunctuation108 = unicode"\uFF1A";
        console2.log("FF1A: ", terminalPunctuation108);
        console2.logBytes(abi.encodePacked(terminalPunctuation108));
        // loop 45: end
        string memory terminalPunctuation109 = unicode"\uFF1B";
        console2.log("FF1B: ", terminalPunctuation109);
        console2.logBytes(abi.encodePacked(terminalPunctuation109));
        string memory terminalPunctuation110 = unicode"\uFF1F";
        console2.log("FF1F: ", terminalPunctuation110);
        console2.logBytes(abi.encodePacked(terminalPunctuation110));
        string memory terminalPunctuation111 = unicode"\uFF61";
        console2.log("FF61: ", terminalPunctuation111);
        console2.logBytes(abi.encodePacked(terminalPunctuation111));
        string memory terminalPunctuation112 = unicode"\uFF64";
        console2.log("FF64: ", terminalPunctuation112);
        console2.logBytes(abi.encodePacked(terminalPunctuation112));

        string memory terminalPunctuation113 = "\\u{1039F}";
        bytes memory utf8TerminalPunctuation113 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation113));
        console2.log("1039F: ", string(utf8TerminalPunctuation113));
        console2.logBytes(utf8TerminalPunctuation113);

        string memory terminalPunctuation114 = "\\u{103D0}";
        bytes memory utf8TerminalPunctuation114 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation114));
        console2.log("103D0: ", string(utf8TerminalPunctuation114));
        console2.logBytes(utf8TerminalPunctuation114);

        string memory terminalPunctuation115 = "\\u{10857}";
        bytes memory utf8TerminalPunctuation115 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation115));
        console2.log("10857: ", string(utf8TerminalPunctuation115));
        console2.logBytes(utf8TerminalPunctuation115);

        string memory terminalPunctuation116 = "\\u{1091F}";
        bytes memory utf8TerminalPunctuation116 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation116));
        console2.log("1091F: ", string(utf8TerminalPunctuation116));
        console2.logBytes(utf8TerminalPunctuation116);

        // loop 46: start
        string memory terminalPunctuation117 = "\\u{10A56}";
        bytes memory utf8TerminalPunctuation117 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation117));
        console2.log("10A56: ", string(utf8TerminalPunctuation117));
        console2.logBytes(utf8TerminalPunctuation117);

        // loop 46: end
        string memory terminalPunctuation118 = "\\u{10A57}";
        bytes memory utf8TerminalPunctuation118 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation118));
        console2.log("10A57: ", string(utf8TerminalPunctuation118));
        console2.logBytes(utf8TerminalPunctuation118);

        // loop 47: start
        string memory terminalPunctuation119 = "\\u{10AF0}";
        bytes memory utf8TerminalPunctuation119 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation119));
        console2.log("10AF0: ", string(utf8TerminalPunctuation119));
        console2.logBytes(utf8TerminalPunctuation119);

        // loop 47: end
        string memory terminalPunctuation120 = "\\u{10AF5}";
        bytes memory utf8TerminalPunctuation120 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation120));
        console2.log("10AF5: ", string(utf8TerminalPunctuation120));
        console2.logBytes(utf8TerminalPunctuation120);

        // loop 48: start
        string memory terminalPunctuation121 = "\\u{10B3A}";
        bytes memory utf8TerminalPunctuation121 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation121));
        console2.log("10B3A: ", string(utf8TerminalPunctuation121));
        console2.logBytes(utf8TerminalPunctuation121);

        // loop 48: end
        string memory terminalPunctuation122 = "\\u{10B3F}";
        bytes memory utf8TerminalPunctuation122 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation122));
        console2.log("10B3F: ", string(utf8TerminalPunctuation122));
        console2.logBytes(utf8TerminalPunctuation122);

        // loop 49: start
        string memory terminalPunctuation123 = "\\u{10B99}";
        bytes memory utf8TerminalPunctuation123 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation123));
        console2.log("10B99: ", string(utf8TerminalPunctuation123));
        console2.logBytes(utf8TerminalPunctuation123);

        // loop 49: end
        string memory terminalPunctuation124 = "\\u{10B9C}";
        bytes memory utf8TerminalPunctuation124 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation124));
        console2.log("10B9C: ", string(utf8TerminalPunctuation124));
        console2.logBytes(utf8TerminalPunctuation124);

        // loop 50: start
        string memory terminalPunctuation125 = "\\u{10F55}";
        bytes memory utf8TerminalPunctuation125 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation125));
        console2.log("10F55: ", string(utf8TerminalPunctuation125));
        console2.logBytes(utf8TerminalPunctuation125);

        // loop 50: end
        string memory terminalPunctuation126 = "\\u{10F59}";
        bytes memory utf8TerminalPunctuation126 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation126));
        console2.log("10F59: ", string(utf8TerminalPunctuation126));
        console2.logBytes(utf8TerminalPunctuation126);

        // loop 51: start
        string memory terminalPunctuation127 = "\\u{10F86}";
        bytes memory utf8TerminalPunctuation127 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation127));
        console2.log("10F86: ", string(utf8TerminalPunctuation127));
        console2.logBytes(utf8TerminalPunctuation127);

        // loop 51: end
        string memory terminalPunctuation128 = "\\u{10F89}";
        bytes memory utf8TerminalPunctuation128 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation128));
        console2.log("10F89: ", string(utf8TerminalPunctuation128));
        console2.logBytes(utf8TerminalPunctuation128);

        // loop 52: start
        string memory terminalPunctuation129 = "\\u{11047}";
        bytes memory utf8TerminalPunctuation129 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation129));
        console2.log("11047: ", string(utf8TerminalPunctuation129));
        console2.logBytes(utf8TerminalPunctuation129);

        // loop 53: end
        string memory terminalPunctuation130 = "\\u{1104D}";
        bytes memory utf8TerminalPunctuation130 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation130));
        console2.log("1104D: ", string(utf8TerminalPunctuation130));
        console2.logBytes(utf8TerminalPunctuation130);

        // loop 54: start
        string memory terminalPunctuation131 = "\\u{110BE}";
        bytes memory utf8TerminalPunctuation131 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation131));
        console2.log("110BE: ", string(utf8TerminalPunctuation131));
        console2.logBytes(utf8TerminalPunctuation131);

        // loop 54: end
        string memory terminalPunctuation132 = "\\u{110C1}";
        bytes memory utf8TerminalPunctuation132 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation132));
        console2.log("110C1: ", string(utf8TerminalPunctuation132));
        console2.logBytes(utf8TerminalPunctuation132);

        // loop 55: start
        string memory terminalPunctuation133 = "\\u{11141}";
        bytes memory utf8TerminalPunctuation133 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation133));
        console2.log("11141: ", string(utf8TerminalPunctuation133));
        console2.logBytes(utf8TerminalPunctuation133);

        // loop 56: end
        string memory terminalPunctuation134 = "\\u{11143}";
        bytes memory utf8TerminalPunctuation134 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation134));
        console2.log("11143: ", string(utf8TerminalPunctuation134));
        console2.logBytes(utf8TerminalPunctuation134);

        // loop 57: start
        string memory terminalPunctuation135 = "\\u{111C5}";
        bytes memory utf8TerminalPunctuation135 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation135));
        console2.log("111C5: ", string(utf8TerminalPunctuation135));
        console2.logBytes(utf8TerminalPunctuation135);

        // loop 57: end
        string memory terminalPunctuation136 = "\\u{111C6}";
        bytes memory utf8TerminalPunctuation136 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation136));
        console2.log("111C6: ", string(utf8TerminalPunctuation136));
        console2.logBytes(utf8TerminalPunctuation136);

        // loop 58: start
        string memory terminalPunctuation137 = "\\u{111DE}";
        bytes memory utf8TerminalPunctuation137 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation137));
        console2.log("111DE: ", string(utf8TerminalPunctuation137));
        console2.logBytes(utf8TerminalPunctuation137);

        // loop 58: end
        string memory terminalPunctuation138 = "\\u{111DF}";
        bytes memory utf8TerminalPunctuation138 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation138));
        console2.log("111DF: ", string(utf8TerminalPunctuation138));
        console2.logBytes(utf8TerminalPunctuation138);

        // loop 59: start
        string memory terminalPunctuation139 = "\\u{11238}";
        bytes memory utf8TerminalPunctuation139 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation139));
        console2.log("11238: ", string(utf8TerminalPunctuation139));
        console2.logBytes(utf8TerminalPunctuation139);

        // loop 59: end
        string memory terminalPunctuation140 = "\\u{1123C}";
        bytes memory utf8TerminalPunctuation140 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation140));
        console2.log("1123C: ", string(utf8TerminalPunctuation140));
        console2.logBytes(utf8TerminalPunctuation140);

        string memory terminalPunctuation141 = "\\u{112A9}";
        bytes memory utf8TerminalPunctuation141 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation141));
        console2.log("112A9: ", string(utf8TerminalPunctuation141));
        console2.logBytes(utf8TerminalPunctuation141);

        // loop 60: start
        string memory terminalPunctuation142 = "\\u{113D4}";
        bytes memory utf8TerminalPunctuation142 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation142));
        console2.log("113D4: ", string(utf8TerminalPunctuation142));
        console2.logBytes(utf8TerminalPunctuation142);

        // loop 61: end
        string memory terminalPunctuation143 = "\\u{113D5}";
        bytes memory utf8TerminalPunctuation143 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation143));
        console2.log("113D5: ", string(utf8TerminalPunctuation143));
        console2.logBytes(utf8TerminalPunctuation143);

        // loop 62: start
        string memory terminalPunctuation144 = "\\u{1144B}";
        bytes memory utf8TerminalPunctuation144 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation144));
        console2.log("1144B: ", string(utf8TerminalPunctuation144));
        console2.logBytes(utf8TerminalPunctuation144);

        // loop 62: end
        string memory terminalPunctuation145 = "\\u{1144D}";
        bytes memory utf8TerminalPunctuation145 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation145));
        console2.log("1144D: ", string(utf8TerminalPunctuation145));
        console2.logBytes(utf8TerminalPunctuation145);

        // loop 63: start
        string memory terminalPunctuation146 = "\\u{1145A}";
        bytes memory utf8TerminalPunctuation146 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation146));
        console2.log("1145A: ", string(utf8TerminalPunctuation146));
        console2.logBytes(utf8TerminalPunctuation146);

        // loop 63: end
        string memory terminalPunctuation147 = "\\u{1145B}";
        bytes memory utf8TerminalPunctuation147 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation147));
        console2.log("1145B: ", string(utf8TerminalPunctuation147));
        console2.logBytes(utf8TerminalPunctuation147);

        // loop 64: start
        string memory terminalPunctuation148 = "\\u{115C2}";
        bytes memory utf8TerminalPunctuation148 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation148));
        console2.log("115C2: ", string(utf8TerminalPunctuation148));
        console2.logBytes(utf8TerminalPunctuation148);

        // loop 64: end
        string memory terminalPunctuation149 = "\\u{115C5}";
        bytes memory utf8TerminalPunctuation149 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation149));
        console2.log("115C5: ", string(utf8TerminalPunctuation149));
        console2.logBytes(utf8TerminalPunctuation149);

        // loop 65: start
        string memory terminalPunctuation150 = "\\u{115C9}";
        bytes memory utf8TerminalPunctuation150 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation150));
        console2.log("115C9: ", string(utf8TerminalPunctuation150));
        console2.logBytes(utf8TerminalPunctuation150);

        // loop 66: end
        string memory terminalPunctuation151 = "\\u{115D7}";
        bytes memory utf8TerminalPunctuation151 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation151));
        console2.log("115D7: ", string(utf8TerminalPunctuation151));
        console2.logBytes(utf8TerminalPunctuation151);

        // loop 67: start
        string memory terminalPunctuation152 = "\\u{11641}";
        bytes memory utf8TerminalPunctuation152 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation152));
        console2.log("11641: ", string(utf8TerminalPunctuation152));
        console2.logBytes(utf8TerminalPunctuation152);

        // loop 67: end
        string memory terminalPunctuation153 = "\\u{11642}";
        bytes memory utf8TerminalPunctuation153 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation153));
        console2.log("11642: ", string(utf8TerminalPunctuation153));
        console2.logBytes(utf8TerminalPunctuation153);

        // loop 68: start
        string memory terminalPunctuation154 = "\\u{1173C}";
        bytes memory utf8TerminalPunctuation154 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation154));
        console2.log("1173C: ", string(utf8TerminalPunctuation154));
        console2.logBytes(utf8TerminalPunctuation154);

        // loop 68: end
        string memory terminalPunctuation155 = "\\u{1173E}";
        bytes memory utf8TerminalPunctuation155 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation155));
        console2.log("1173E: ", string(utf8TerminalPunctuation155));
        console2.logBytes(utf8TerminalPunctuation155);

        string memory terminalPunctuation156 = "\\u{11946}";
        bytes memory utf8TerminalPunctuation156 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation156));
        console2.log("11946: ", string(utf8TerminalPunctuation156));
        console2.logBytes(utf8TerminalPunctuation156);

        // loop 69: start
        string memory terminalPunctuation157 = "\\u{11A42}";
        bytes memory utf8TerminalPunctuation157 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation157));
        console2.log("11A42: ", string(utf8TerminalPunctuation157));
        console2.logBytes(utf8TerminalPunctuation157);

        // loop 69: end
        string memory terminalPunctuation158 = "\\u{11A43}";
        bytes memory utf8TerminalPunctuation158 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation158));
        console2.log("11A43: ", string(utf8TerminalPunctuation158));
        console2.logBytes(utf8TerminalPunctuation158);

        // loop 70: start
        string memory terminalPunctuation159 = "\\u{11A9B}";
        bytes memory utf8TerminalPunctuation159 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation159));
        console2.log("11A9B: ", string(utf8TerminalPunctuation159));
        console2.logBytes(utf8TerminalPunctuation159);

        // loop 70: end
        string memory terminalPunctuation160 = "\\u{11A9C}";
        bytes memory utf8TerminalPunctuation160 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation160));
        console2.log("11A9C: ", string(utf8TerminalPunctuation160));
        console2.logBytes(utf8TerminalPunctuation160);

        // loop 71: start
        string memory terminalPunctuation161 = "\\u{11AA1}";
        bytes memory utf8TerminalPunctuation161 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation161));
        console2.log("11AA1: ", string(utf8TerminalPunctuation161));
        console2.logBytes(utf8TerminalPunctuation161);

        // loop 71: end
        string memory terminalPunctuation162 = "\\u{11AA2}";
        bytes memory utf8TerminalPunctuation162 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation162));
        console2.log("11AA2: ", string(utf8TerminalPunctuation162));
        console2.logBytes(utf8TerminalPunctuation162);

        // loop 72: start
        string memory terminalPunctuation163 = "\\u{11C41}";
        bytes memory utf8TerminalPunctuation163 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation163));
        console2.log("11C41: ", string(utf8TerminalPunctuation163));
        console2.logBytes(utf8TerminalPunctuation163);

        // loop 72: end
        string memory terminalPunctuation164 = "\\u{11C43}";
        bytes memory utf8TerminalPunctuation164 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation164));
        console2.log("11C43: ", string(utf8TerminalPunctuation164));
        console2.logBytes(utf8TerminalPunctuation164);

        string memory terminalPunctuation165 = "\\u{11C71}";
        bytes memory utf8TerminalPunctuation165 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation165));
        console2.log("11C71: ", string(utf8TerminalPunctuation165));
        console2.logBytes(utf8TerminalPunctuation165);

        // loop 73: start
        string memory terminalPunctuation166 = "\\u{11EF7}";
        bytes memory utf8TerminalPunctuation166 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation166));
        console2.log("11EF7: ", string(utf8TerminalPunctuation166));
        console2.logBytes(utf8TerminalPunctuation166);

        // loop 73: end
        string memory terminalPunctuation167 = "\\u{11EF8}";
        bytes memory utf8TerminalPunctuation167 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation167));
        console2.log("11EF8: ", string(utf8TerminalPunctuation167));
        console2.logBytes(utf8TerminalPunctuation167);

        // loop 74: start
        string memory terminalPunctuation168 = "\\u{11F43}";
        bytes memory utf8TerminalPunctuation168 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation168));
        console2.log("11F43: ", string(utf8TerminalPunctuation168));
        console2.logBytes(utf8TerminalPunctuation168);

        // loop 74: end
        string memory terminalPunctuation169 = "\\u{11F44}";
        bytes memory utf8TerminalPunctuation169 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation169));
        console2.log("11F44: ", string(utf8TerminalPunctuation169));
        console2.logBytes(utf8TerminalPunctuation169);

        // loop 75: start
        string memory terminalPunctuation170 = "\\u{12470}";
        bytes memory utf8TerminalPunctuation170 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation170));
        console2.log("12470: ", string(utf8TerminalPunctuation170));
        console2.logBytes(utf8TerminalPunctuation170);

        // loop 75: end
        string memory terminalPunctuation171 = "\\u{12474}";
        bytes memory utf8TerminalPunctuation171 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation171));
        console2.log("12474: ", string(utf8TerminalPunctuation171));
        console2.logBytes(utf8TerminalPunctuation171);

        // loop 76: start
        string memory terminalPunctuation172 = "\\u{16A6E}";
        bytes memory utf8TerminalPunctuation172 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation172));
        console2.log("16A6E: ", string(utf8TerminalPunctuation172));
        console2.logBytes(utf8TerminalPunctuation172);

        // loop 76: end
        string memory terminalPunctuation173 = "\\u{16A6F}";
        bytes memory utf8TerminalPunctuation173 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation173));
        console2.log("16A6F: ", string(utf8TerminalPunctuation173));
        console2.logBytes(utf8TerminalPunctuation173);

        string memory terminalPunctuation174 = "\\u{16AF5}";
        bytes memory utf8TerminalPunctuation174 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation174));
        console2.log("16AF5: ", string(utf8TerminalPunctuation174));
        console2.logBytes(utf8TerminalPunctuation174);

        // loop 77: start
        string memory terminalPunctuation175 = "\\u{16B37}";
        bytes memory utf8TerminalPunctuation175 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation175));
        console2.log("16B37: ", string(utf8TerminalPunctuation175));
        console2.logBytes(utf8TerminalPunctuation175);

        // loop 77: end
        string memory terminalPunctuation176 = "\\u{16B39}";
        bytes memory utf8TerminalPunctuation176 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation176));
        console2.log("16B39: ", string(utf8TerminalPunctuation176));
        console2.logBytes(utf8TerminalPunctuation176);

        string memory terminalPunctuation177 = "\\u{16B44}";
        bytes memory utf8TerminalPunctuation177 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation177));
        console2.log("16B44: ", string(utf8TerminalPunctuation177));
        console2.logBytes(utf8TerminalPunctuation177);

        // loop 78: start
        string memory terminalPunctuation178 = "\\u{16D6E}";
        bytes memory utf8TerminalPunctuation178 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation178));
        console2.log("16D6E: ", string(utf8TerminalPunctuation178));
        console2.logBytes(utf8TerminalPunctuation178);

        // loop 78: end
        string memory terminalPunctuation179 = "\\u{16D6F}";
        bytes memory utf8TerminalPunctuation179 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation179));
        console2.log("16D6F: ", string(utf8TerminalPunctuation179));
        console2.logBytes(utf8TerminalPunctuation179);

        // loop 79: start
        string memory terminalPunctuation180 = "\\u{16E97}";
        bytes memory utf8TerminalPunctuation180 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation180));
        console2.log("16E97: ", string(utf8TerminalPunctuation180));
        console2.logBytes(utf8TerminalPunctuation180);

        // loop 79: end
        string memory terminalPunctuation181 = "\\u{16E98}";
        bytes memory utf8TerminalPunctuation181 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation181));
        console2.log("16E98: ", string(utf8TerminalPunctuation181));
        console2.logBytes(utf8TerminalPunctuation181);

        string memory terminalPunctuation182 = "\\u{1BC9F}";
        bytes memory utf8TerminalPunctuation182 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation182));
        console2.log("1BC9F: ", string(utf8TerminalPunctuation182));
        console2.logBytes(utf8TerminalPunctuation182);

        // loop 80: start
        string memory terminalPunctuation183 = "\\u{1DA87}";
        bytes memory utf8TerminalPunctuation183 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation183));
        console2.log("1DA87: ", string(utf8TerminalPunctuation183));
        console2.logBytes(utf8TerminalPunctuation183);

        // loop 80: end
        string memory terminalPunctuation184 = "\\u{1DA8A}";
        bytes memory utf8TerminalPunctuation184 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation184));
        console2.log("1DA8A: ", string(utf8TerminalPunctuation184));
        console2.logBytes(utf8TerminalPunctuation184);

        string memory terminalPunctuation185 = unicode"\u2024";
        console2.log("2024: ", terminalPunctuation185);
        console2.logBytes(abi.encodePacked(terminalPunctuation185));

        string memory terminalPunctuation186 = "\\u{111CD}";
        bytes memory utf8TerminalPunctuation186 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation186));
        console2.log("111CD: ", string(utf8TerminalPunctuation186));
        console2.logBytes(utf8TerminalPunctuation186);

        string memory terminalPunctuation187 = "\\u{11944}";
        bytes memory utf8TerminalPunctuation187 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(terminalPunctuation187));
        console2.log("11944: ", string(utf8TerminalPunctuation187));
        console2.logBytes(utf8TerminalPunctuation187);

        string memory terminalPunctuation188 = unicode"\u085E";
        console2.log("085E: ", terminalPunctuation188);
        console2.logBytes(abi.encodePacked(terminalPunctuation188));

        string memory terminalPunctuation189 = unicode"\u17DA";
        console2.log("17DA: ", terminalPunctuation189);
        console2.logBytes(abi.encodePacked(terminalPunctuation189));

        console2.log("------------unicodeHexToUtf8Hex------------");
        // string memory unicodeCodepoint = "\\u{20AC}";
        string memory unicodeCodepoint = "\\u{010EAD}";
        bytes memory utf8Hex = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unicodeCodepoint));
        console2.log("utf8Hex: ", string(utf8Hex));
        console2.logBytes(utf8Hex);
        console2.log("-----------------------");
        console2.log("------------hexToDec------------");
        bytes memory someHex = abi.encodePacked(hex"010EAD");
        console2.logBytes(someHex);
        uint256 dec = Stringray.hexToDec(someHex, 8, false);
        console2.log("decimal: ", dec);
        console2.log("-----------------------");
        console2.log("----------------------------------------");
    }

    function testRegexPropertyOtherMath() public pure {
        string memory otherMath = "\\u{005e}";
        bytes memory utf8OtherMath = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath));
        console2.log("005e: ", string(utf8OtherMath));
        console2.logBytes(utf8OtherMath);

        string memory otherMath2 = "\\u{03d0}";
        bytes memory utf8OtherMath2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath2));
        console2.log("03d0: ", string(utf8OtherMath2));
        console2.logBytes(utf8OtherMath2);

        string memory otherMath3 = "\\u{03d2}";
        bytes memory utf8OtherMath3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath3));
        console2.log("03d2: ", string(utf8OtherMath3));
        console2.logBytes(utf8OtherMath3);

        string memory otherMath4 = "\\u{03d5}";
        bytes memory utf8OtherMath4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath4));
        console2.log("03d5: ", string(utf8OtherMath4));
        console2.logBytes(utf8OtherMath4);

        string memory otherMath5 = "\\u{03F0}";
        bytes memory utf8OtherMath5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath5));
        console2.log("03F0: ", string(utf8OtherMath5));
        console2.logBytes(utf8OtherMath5);

        string memory otherMath6 = "\\u{03F1}";
        bytes memory utf8OtherMath6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath6));
        console2.log("03F1: ", string(utf8OtherMath6));
        console2.logBytes(utf8OtherMath6);

        string memory otherMath7 = "\\u{03F4}";
        bytes memory utf8OtherMath7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath7));
        console2.log("03F4: ", string(utf8OtherMath7));
        console2.logBytes(utf8OtherMath7);

        string memory otherMath7a = "\\u{03F5}";
        bytes memory utf8OtherMath7a = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath7a));
        console2.log("03F5: ", string(utf8OtherMath7a));
        console2.logBytes(utf8OtherMath7a);

        string memory otherMath7b = "\\u{2016}";
        bytes memory utf8OtherMath7b = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath7b));
        console2.log("2016: ", string(utf8OtherMath7b));
        console2.logBytes(utf8OtherMath7b);

        string memory otherMath8 = "\\u{2032}";
        bytes memory utf8OtherMath8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath8));
        console2.log("2032: ", string(utf8OtherMath8));
        console2.logBytes(utf8OtherMath8);

        string memory otherMath9 = "\\u{2034}";
        bytes memory utf8OtherMath9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath9));
        console2.log("2034: ", string(utf8OtherMath9));
        console2.logBytes(utf8OtherMath9);

        string memory otherMath10 = "\\u{2040}";
        bytes memory utf8OtherMath10 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath10));
        console2.log("2040: ", string(utf8OtherMath10));
        console2.logBytes(utf8OtherMath10);

        string memory otherMath11 = "\\u{2061}";
        bytes memory utf8OtherMath11 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath11));
        console2.log("2061: ", string(utf8OtherMath11));
        console2.logBytes(utf8OtherMath11);

        string memory otherMath12 = "\\u{2064}";
        bytes memory utf8OtherMath12 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath12));
        console2.log("2064: ", string(utf8OtherMath12));
        console2.logBytes(utf8OtherMath12);

        string memory otherMath13 = "\\u{207d}";
        bytes memory utf8OtherMath13 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath13));
        console2.log("207d: ", string(utf8OtherMath13));
        console2.logBytes(utf8OtherMath13);

        string memory otherMath14 = "\\u{207e}";
        bytes memory utf8OtherMath14 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath14));
        console2.log("207e: ", string(utf8OtherMath14));
        console2.logBytes(utf8OtherMath14);

        string memory otherMath14a = "\\u{208d}";
        bytes memory utf8OtherMath14a = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath14a));
        console2.log("208d: ", string(utf8OtherMath14a));
        console2.logBytes(utf8OtherMath14a);

        string memory otherMath15 = "\\u{208e}";
        bytes memory utf8OtherMath15 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath15));
        console2.log("208e: ", string(utf8OtherMath15));
        console2.logBytes(utf8OtherMath15);

        string memory otherMath16 = "\\u{20d0}";
        bytes memory utf8OtherMath16 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath16));
        console2.log("20d0: ", string(utf8OtherMath16));
        console2.logBytes(utf8OtherMath16);

        string memory otherMath17 = "\\u{20dc}";
        bytes memory utf8OtherMath17 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath17));
        console2.log("20dc: ", string(utf8OtherMath17));
        console2.logBytes(utf8OtherMath17);

        string memory otherMath18 = "\\u{20e1}";
        bytes memory utf8OtherMath18 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath18));
        console2.log("20e1: ", string(utf8OtherMath18));
        console2.logBytes(utf8OtherMath18);

        string memory otherMath19 = "\\u{20e5}";
        bytes memory utf8OtherMath19 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath19));
        console2.log("20e5: ", string(utf8OtherMath19));
        console2.logBytes(utf8OtherMath19);

        string memory otherMath20 = "\\u{20e6}";
        bytes memory utf8OtherMath20 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath20));
        console2.log("20e6: ", string(utf8OtherMath20));
        console2.logBytes(utf8OtherMath20);

        string memory otherMath21 = "\\u{20eb}";
        bytes memory utf8OtherMath21 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath21));
        console2.log("20eb: ", string(utf8OtherMath21));
        console2.logBytes(utf8OtherMath21);

        string memory otherMath22 = "\\u{20ef}";
        bytes memory utf8OtherMath22 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath22));
        console2.log("20ef: ", string(utf8OtherMath22));
        console2.logBytes(utf8OtherMath22);

        string memory otherMath23 = "\\u{2102}";
        bytes memory utf8OtherMath23 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath23));
        console2.log("2102: ", string(utf8OtherMath23));
        console2.logBytes(utf8OtherMath23);

        string memory otherMath24 = "\\u{2107}";
        bytes memory utf8OtherMath24 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath24));
        console2.log("2107: ", string(utf8OtherMath24));
        console2.logBytes(utf8OtherMath24);

        string memory otherMath25 = "\\u{210a}";
        bytes memory utf8OtherMath25 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath25));
        console2.log("210a: ", string(utf8OtherMath25));
        console2.logBytes(utf8OtherMath25);

        string memory otherMath26 = "\\u{2113}";
        bytes memory utf8OtherMath26 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath26));
        console2.log("2113: ", string(utf8OtherMath26));
        console2.logBytes(utf8OtherMath26);

        string memory otherMath27 = "\\u{2115}";
        bytes memory utf8OtherMath27 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath27));
        console2.log("2115: ", string(utf8OtherMath27));
        console2.logBytes(utf8OtherMath27);

        string memory otherMath28 = "\\u{2119}";
        bytes memory utf8OtherMath28 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath28));
        console2.log("2119: ", string(utf8OtherMath28));
        console2.logBytes(utf8OtherMath28);

        string memory otherMath29 = "\\u{211D}";
        bytes memory utf8OtherMath29 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath29));
        console2.log("211D: ", string(utf8OtherMath29));
        console2.logBytes(utf8OtherMath29);

        string memory otherMath30 = "\\u{2124}";
        bytes memory utf8OtherMath30 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath30));
        console2.log("2124: ", string(utf8OtherMath30));
        console2.logBytes(utf8OtherMath30);

        string memory otherMath31 = "\\u{2128}";
        bytes memory utf8OtherMath31 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath31));
        console2.log("2128: ", string(utf8OtherMath31));
        console2.logBytes(utf8OtherMath31);

        string memory otherMath32 = "\\u{2129}";
        bytes memory utf8OtherMath32 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath32));
        console2.log("2129: ", string(utf8OtherMath32));
        console2.logBytes(utf8OtherMath32);

        string memory otherMath33 = "\\u{212C}";
        bytes memory utf8OtherMath33 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath33));
        console2.log("212C: ", string(utf8OtherMath33));
        console2.logBytes(utf8OtherMath33);

        string memory otherMath34 = "\\u{212D}";
        bytes memory utf8OtherMath34 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath34));
        console2.log("212D: ", string(utf8OtherMath34));
        console2.logBytes(utf8OtherMath34);

        string memory otherMath35 = "\\u{212F}";
        bytes memory utf8OtherMath35 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath35));
        console2.log("212F: ", string(utf8OtherMath35));
        console2.logBytes(utf8OtherMath35);

        string memory otherMath36 = "\\u{2131}";
        bytes memory utf8OtherMath36 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath36));
        console2.log("2131: ", string(utf8OtherMath36));
        console2.logBytes(utf8OtherMath36);

        string memory otherMath37 = "\\u{2133}";
        bytes memory utf8OtherMath37 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath37));
        console2.log("2133: ", string(utf8OtherMath37));
        console2.logBytes(utf8OtherMath37);

        string memory otherMath38 = "\\u{2134}";
        bytes memory utf8OtherMath38 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath38));
        console2.log("2134: ", string(utf8OtherMath38));
        console2.logBytes(utf8OtherMath38);

        string memory otherMath39 = "\\u{2135}";
        bytes memory utf8OtherMath39 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath39));
        console2.log("2135: ", string(utf8OtherMath39));
        console2.logBytes(utf8OtherMath39);

        string memory otherMath40 = "\\u{2138}";
        bytes memory utf8OtherMath40 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath40));
        console2.log("2138: ", string(utf8OtherMath40));
        console2.logBytes(utf8OtherMath40);

        string memory otherMath41 = "\\u{213C}";
        bytes memory utf8OtherMath41 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath41));
        console2.log("213C: ", string(utf8OtherMath41));
        console2.logBytes(utf8OtherMath41);

        string memory otherMath42 = "\\u{213F}";
        bytes memory utf8OtherMath42 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath42));
        console2.log("213F: ", string(utf8OtherMath42));
        console2.logBytes(utf8OtherMath42);

        string memory otherMath43 = "\\u{2145}";
        bytes memory utf8OtherMath43 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath43));
        console2.log("2145: ", string(utf8OtherMath43));
        console2.logBytes(utf8OtherMath43);

        string memory otherMath44 = "\\u{2149}";
        bytes memory utf8OtherMath44 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath44));
        console2.log("2149: ", string(utf8OtherMath44));
        console2.logBytes(utf8OtherMath44);

        string memory otherMath45 = "\\u{2195}";
        bytes memory utf8OtherMath45 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath45));
        console2.log("2195: ", string(utf8OtherMath45));
        console2.logBytes(utf8OtherMath45);

        string memory otherMath46 = "\\u{2199}";
        bytes memory utf8OtherMath46 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath46));
        console2.log("2199: ", string(utf8OtherMath46));
        console2.logBytes(utf8OtherMath46);

        string memory otherMath47 = "\\u{219C}";
        bytes memory utf8OtherMath47 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath47));
        console2.log("219C: ", string(utf8OtherMath47));
        console2.logBytes(utf8OtherMath47);

        string memory otherMath48 = "\\u{219F}";
        bytes memory utf8OtherMath48 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath48));
        console2.log("219F: ", string(utf8OtherMath48));
        console2.logBytes(utf8OtherMath48);

        string memory otherMath49 = "\\u{21A1}";
        bytes memory utf8OtherMath49 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath49));
        console2.log("21A1: ", string(utf8OtherMath49));
        console2.logBytes(utf8OtherMath49);

        string memory otherMath50 = "\\u{21A2}";
        bytes memory utf8OtherMath50 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath50));
        console2.log("21A2: ", string(utf8OtherMath50));
        console2.logBytes(utf8OtherMath50);

        string memory otherMath51 = "\\u{21A4}";
        bytes memory utf8OtherMath51 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath51));
        console2.log("21A4: ", string(utf8OtherMath51));
        console2.logBytes(utf8OtherMath51);

        string memory otherMath52 = "\\u{21A5}";
        bytes memory utf8OtherMath52 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath52));
        console2.log("21A5: ", string(utf8OtherMath52));
        console2.logBytes(utf8OtherMath52);

        string memory otherMath53 = "\\u{21A7}";
        bytes memory utf8OtherMath53 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath53));
        console2.log("21A7: ", string(utf8OtherMath53));
        console2.logBytes(utf8OtherMath53);

        string memory otherMath54 = "\\u{21A9}";
        bytes memory utf8OtherMath54 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath54));
        console2.log("21A9: ", string(utf8OtherMath54));
        console2.logBytes(utf8OtherMath54);

        string memory otherMath55 = "\\u{21AD}";
        bytes memory utf8OtherMath55 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath55));
        console2.log("21AD: ", string(utf8OtherMath55));
        console2.logBytes(utf8OtherMath55);

        string memory otherMath56 = "\\u{21B0}";
        bytes memory utf8OtherMath56 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath56));
        console2.log("21B0: ", string(utf8OtherMath56));
        console2.logBytes(utf8OtherMath56);

        string memory otherMath57 = "\\u{21B1}";
        bytes memory utf8OtherMath57 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath57));
        console2.log("21B1: ", string(utf8OtherMath57));
        console2.logBytes(utf8OtherMath57);

        string memory otherMath58 = "\\u{21B6}";
        bytes memory utf8OtherMath58 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath58));
        console2.log("21B6: ", string(utf8OtherMath58));
        console2.logBytes(utf8OtherMath58);

        string memory otherMath59 = "\\u{21B7}";
        bytes memory utf8OtherMath59 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath59));
        console2.log("21B7: ", string(utf8OtherMath59));
        console2.logBytes(utf8OtherMath59);

        string memory otherMath60 = "\\u{21BC}";
        bytes memory utf8OtherMath60 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath60));
        console2.log("21BC: ", string(utf8OtherMath60));
        console2.logBytes(utf8OtherMath60);

        string memory otherMath61 = "\\u{21CD}";
        bytes memory utf8OtherMath61 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath61));
        console2.log("21CD: ", string(utf8OtherMath61));
        console2.logBytes(utf8OtherMath61);

        string memory otherMath62 = "\\u{21D0}";
        bytes memory utf8OtherMath62 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath62));
        console2.log("21D0: ", string(utf8OtherMath62));
        console2.logBytes(utf8OtherMath62);

        string memory otherMath63 = "\\u{21D1}";
        bytes memory utf8OtherMath63 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath63));
        console2.log("21D1: ", string(utf8OtherMath63));
        console2.logBytes(utf8OtherMath63);

        string memory otherMath64 = "\\u{21D3}";
        bytes memory utf8OtherMath64 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath64));
        console2.log("21D3: ", string(utf8OtherMath64));
        console2.logBytes(utf8OtherMath64);

        string memory otherMath65 = "\\u{21D5}";
        bytes memory utf8OtherMath65 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath65));
        console2.log("21D5: ", string(utf8OtherMath65));
        console2.logBytes(utf8OtherMath65);

        string memory otherMath66 = "\\u{21DB}";
        bytes memory utf8OtherMath66 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath66));
        console2.log("21DB: ", string(utf8OtherMath66));
        console2.logBytes(utf8OtherMath66);

        string memory otherMath67 = "\\u{21DD}";
        bytes memory utf8OtherMath67 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath67));
        console2.log("21DD: ", string(utf8OtherMath67));
        console2.logBytes(utf8OtherMath67);

        string memory otherMath68 = "\\u{21E4}";
        bytes memory utf8OtherMath68 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath68));
        console2.log("21E4: ", string(utf8OtherMath68));
        console2.logBytes(utf8OtherMath68);

        string memory otherMath69 = "\\u{21E5}";
        bytes memory utf8OtherMath69 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath69));
        console2.log("21E5: ", string(utf8OtherMath69));
        console2.logBytes(utf8OtherMath69);

        string memory otherMath70 = "\\u{2308}";
        bytes memory utf8OtherMath70 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath70));
        console2.log("2308: ", string(utf8OtherMath70));
        console2.logBytes(utf8OtherMath70);

        string memory otherMath71 = "\\u{2309}";
        bytes memory utf8OtherMath71 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath71));
        console2.log("2309: ", string(utf8OtherMath71));
        console2.logBytes(utf8OtherMath71);

        string memory otherMath72 = "\\u{230A}";
        bytes memory utf8OtherMath72 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath72));
        console2.log("230A: ", string(utf8OtherMath72));
        console2.logBytes(utf8OtherMath72);

        string memory otherMath73 = "\\u{230B}";
        bytes memory utf8OtherMath73 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath73));
        console2.log("230B: ", string(utf8OtherMath73));
        console2.logBytes(utf8OtherMath73);

        string memory otherMath74 = "\\u{23B4}";
        bytes memory utf8OtherMath74 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath74));
        console2.log("23B4: ", string(utf8OtherMath74));
        console2.logBytes(utf8OtherMath74);

        string memory otherMath75 = "\\u{23B5}";
        bytes memory utf8OtherMath75 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath74));
        console2.log("23B5: ", string(utf8OtherMath75));
        console2.logBytes(utf8OtherMath75);

        string memory otherMath76 = "\\u{23B5}";
        bytes memory utf8OtherMath76 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath76));
        console2.log("23B5: ", string(utf8OtherMath76));
        console2.logBytes(utf8OtherMath76);

        string memory otherMath77 = "\\u{23B7}";
        bytes memory utf8OtherMath77 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath77));
        console2.log("23B7: ", string(utf8OtherMath77));
        console2.logBytes(utf8OtherMath77);

        string memory otherMath77a = "\\u{23B7}";
        bytes memory utf8OtherMath77a = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath77a));
        console2.log("23B7: ", string(utf8OtherMath77a));
        console2.logBytes(utf8OtherMath77a);

        string memory otherMath78 = "\\u{23D0}";
        bytes memory utf8OtherMath78 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath78));
        console2.log("23D0: ", string(utf8OtherMath78));
        console2.logBytes(utf8OtherMath78);

        string memory otherMath79 = "\\u{23E2}";
        bytes memory utf8OtherMath79 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath79));
        console2.log("23E2: ", string(utf8OtherMath79));
        console2.logBytes(utf8OtherMath79);

        string memory otherMath80 = "\\u{25A0}";
        bytes memory utf8OtherMath80 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath80));
        console2.log("25A0: ", string(utf8OtherMath80));
        console2.logBytes(utf8OtherMath80);

        string memory otherMath81 = "\\u{25A1}";
        bytes memory utf8OtherMath81 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath81));
        console2.log("25A1: ", string(utf8OtherMath81));
        console2.logBytes(utf8OtherMath81);

        string memory otherMath82 = "\\u{25AE}";
        bytes memory utf8OtherMath82 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath82));
        console2.log("25AE: ", string(utf8OtherMath82));
        console2.logBytes(utf8OtherMath82);

        string memory otherMath83 = "\\u{25B6}";
        bytes memory utf8OtherMath83 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath83));
        console2.log("25B6: ", string(utf8OtherMath83));
        console2.logBytes(utf8OtherMath83);

        string memory otherMath84 = "\\u{25BC}";
        bytes memory utf8OtherMath84 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath84));
        console2.log("25BC: ", string(utf8OtherMath84));
        console2.logBytes(utf8OtherMath84);

        string memory otherMath85 = "\\u{25C0}";
        bytes memory utf8OtherMath85 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath85));
        console2.log("25C0: ", string(utf8OtherMath85));
        console2.logBytes(utf8OtherMath85);

        string memory otherMath86 = "\\u{25C6}";
        bytes memory utf8OtherMath86 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath86));
        console2.log("25C6: ", string(utf8OtherMath86));
        console2.logBytes(utf8OtherMath86);

        string memory otherMath87 = "\\u{25C7}";
        bytes memory utf8OtherMath87 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath87));
        console2.log("25C7: ", string(utf8OtherMath87));
        console2.logBytes(utf8OtherMath87);

        string memory otherMath88 = "\\u{25CA}";
        bytes memory utf8OtherMath88 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath88));
        console2.log("25CA: ", string(utf8OtherMath88));
        console2.logBytes(utf8OtherMath88);

        string memory otherMath89 = "\\u{25CB}";
        bytes memory utf8OtherMath89 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath89));
        console2.log("25CB: ", string(utf8OtherMath89));
        console2.logBytes(utf8OtherMath89);

        string memory otherMath90 = "\\u{25CF}";
        bytes memory utf8OtherMath90 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath90));
        console2.log("25CF: ", string(utf8OtherMath90));
        console2.logBytes(utf8OtherMath90);

        string memory otherMath91 = "\\u{25D3}";
        bytes memory utf8OtherMath91 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath91));
        console2.log("25D3: ", string(utf8OtherMath91));
        console2.logBytes(utf8OtherMath91);

        string memory otherMath92 = "\\u{25E2}";
        bytes memory utf8OtherMath92 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath92));
        console2.log("25E2: ", string(utf8OtherMath92));
        console2.logBytes(utf8OtherMath92);

        string memory otherMath93 = "\\u{25E4}";
        bytes memory utf8OtherMath93 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath93));
        console2.log("25E4: ", string(utf8OtherMath93));
        console2.logBytes(utf8OtherMath93);

        string memory otherMath94 = "\\u{25E7}";
        bytes memory utf8OtherMath94 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath94));
        console2.log("25E7: ", string(utf8OtherMath94));
        console2.logBytes(utf8OtherMath94);

        string memory otherMath95 = "\\u{25EC}";
        bytes memory utf8OtherMath95 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath95));
        console2.log("25EC: ", string(utf8OtherMath95));
        console2.logBytes(utf8OtherMath95);

        string memory otherMath96 = "\\u{2605}";
        bytes memory utf8OtherMath96 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath96));
        console2.log("2605: ", string(utf8OtherMath96));
        console2.logBytes(utf8OtherMath96);

        string memory otherMath97 = "\\u{2606}";
        bytes memory utf8OtherMath97 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath97));
        console2.log("2606: ", string(utf8OtherMath97));
        console2.logBytes(utf8OtherMath97);

        string memory otherMath98 = "\\u{2640}";
        bytes memory utf8OtherMath98 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath98));
        console2.log("2640: ", string(utf8OtherMath98));
        console2.logBytes(utf8OtherMath98);

        string memory otherMath99 = "\\u{2642}";
        bytes memory utf8OtherMath99 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath99));
        console2.log("2642: ", string(utf8OtherMath99));
        console2.logBytes(utf8OtherMath99);

        string memory otherMath99a = "\\u{2660}";
        bytes memory utf8OtherMath99a = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath99a));
        console2.log("2660: ", string(utf8OtherMath99a));
        console2.logBytes(utf8OtherMath99a);

        string memory otherMath100 = "\\u{2663}";
        bytes memory utf8OtherMath100 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath100));
        console2.log("2663: ", string(utf8OtherMath100));
        console2.logBytes(utf8OtherMath100);

        string memory otherMath101 = "\\u{266D}";
        bytes memory utf8OtherMath101 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath101));
        console2.log("266D: ", string(utf8OtherMath101));
        console2.logBytes(utf8OtherMath101);

        string memory otherMath102 = "\\u{266E}";
        bytes memory utf8OtherMath102 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath102));
        console2.log("266E: ", string(utf8OtherMath102));
        console2.logBytes(utf8OtherMath102);

        string memory otherMath103 = "\\u{27C5}";
        bytes memory utf8OtherMath103 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath103));
        console2.log("27C5: ", string(utf8OtherMath103));
        console2.logBytes(utf8OtherMath103);

        string memory otherMath104 = "\\u{27C6}";
        bytes memory utf8OtherMath104 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath104));
        console2.log("27C6: ", string(utf8OtherMath104));
        console2.logBytes(utf8OtherMath104);

        string memory otherMath105 = "\\u{27E6}";
        bytes memory utf8OtherMath105 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath105));
        console2.log("27E6: ", string(utf8OtherMath105));
        console2.logBytes(utf8OtherMath105);

        string memory otherMath106 = "\\u{27E7}";
        bytes memory utf8OtherMath106 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath106));
        console2.log("27E7: ", string(utf8OtherMath106));
        console2.logBytes(utf8OtherMath106);

        string memory otherMath107 = "\\u{27E8}";
        bytes memory utf8OtherMath107 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath107));
        console2.log("27E8: ", string(utf8OtherMath107));
        console2.logBytes(utf8OtherMath107);

        string memory otherMath108 = "\\u{27E9}";
        bytes memory utf8OtherMath108 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath108));
        console2.log("27E9: ", string(utf8OtherMath108));
        console2.logBytes(utf8OtherMath108);

        string memory otherMath109 = "\\u{27EA}";
        bytes memory utf8OtherMath109 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath109));
        console2.log("27EA: ", string(utf8OtherMath109));
        console2.logBytes(utf8OtherMath109);

        string memory otherMath110 = "\\u{27EB}";
        bytes memory utf8OtherMath110 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath110));
        console2.log("27EB: ", string(utf8OtherMath110));
        console2.logBytes(utf8OtherMath110);

        string memory otherMath111 = "\\u{27EC}";
        bytes memory utf8OtherMath111 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath111));
        console2.log("27EC: ", string(utf8OtherMath111));
        console2.logBytes(utf8OtherMath111);

        string memory otherMath112 = "\\u{27ED}";
        bytes memory utf8OtherMath112 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath112));
        console2.log("27ED: ", string(utf8OtherMath112));
        console2.logBytes(utf8OtherMath112);

        string memory otherMath113 = "\\u{27EE}";
        bytes memory utf8OtherMath113 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath113));
        console2.log("27EE: ", string(utf8OtherMath113));
        console2.logBytes(utf8OtherMath113);

        string memory otherMath114 = "\\u{27EF}";
        bytes memory utf8OtherMath114 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath114));
        console2.log("27EF: ", string(utf8OtherMath114));
        console2.logBytes(utf8OtherMath114);

        string memory otherMath115 = "\\u{2983}";
        bytes memory utf8OtherMath115 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath115));
        console2.log("2983: ", string(utf8OtherMath115));
        console2.logBytes(utf8OtherMath115);

        string memory otherMath116 = "\\u{2984}";
        bytes memory utf8OtherMath116 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath116));
        console2.log("2984: ", string(utf8OtherMath116));
        console2.logBytes(utf8OtherMath116);

        string memory otherMath117 = "\\u{2985}";
        bytes memory utf8OtherMath117 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath117));
        console2.log("2985: ", string(utf8OtherMath117));
        console2.logBytes(utf8OtherMath117);

        string memory otherMath118 = "\\u{2986}";
        bytes memory utf8OtherMath118 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath118));
        console2.log("2986: ", string(utf8OtherMath118));
        console2.logBytes(utf8OtherMath118);

        string memory otherMath119 = "\\u{2987}";
        bytes memory utf8OtherMath119 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath119));
        console2.log("2987: ", string(utf8OtherMath119));
        console2.logBytes(utf8OtherMath119);

        string memory otherMath120 = "\\u{2988}";
        bytes memory utf8OtherMath120 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath120));
        console2.log("2988: ", string(utf8OtherMath120));
        console2.logBytes(utf8OtherMath120);

        string memory otherMath121 = "\\u{2989}";
        bytes memory utf8OtherMath121 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath121));
        console2.log("2989: ", string(utf8OtherMath121));
        console2.logBytes(utf8OtherMath121);

        string memory otherMath122 = "\\u{298A}";
        bytes memory utf8OtherMath122 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath122));
        console2.log("298A: ", string(utf8OtherMath122));
        console2.logBytes(utf8OtherMath122);

        string memory otherMath123 = "\\u{298B}";
        bytes memory utf8OtherMath123 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath123));
        console2.log("298B: ", string(utf8OtherMath123));
        console2.logBytes(utf8OtherMath123);

        string memory otherMath124 = "\\u{298C}";
        bytes memory utf8OtherMath124 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath124));
        console2.log("298C: ", string(utf8OtherMath124));
        console2.logBytes(utf8OtherMath124);

        string memory otherMath125 = "\\u{298D}";
        bytes memory utf8OtherMath125 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath125));
        console2.log("298D: ", string(utf8OtherMath125));
        console2.logBytes(utf8OtherMath125);

        string memory otherMath126 = "\\u{298E}";
        bytes memory utf8OtherMath126 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath126));
        console2.log("298E: ", string(utf8OtherMath126));
        console2.logBytes(utf8OtherMath126);

        string memory otherMath127 = "\\u{298F}";
        bytes memory utf8OtherMath127 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath127));
        console2.log("298F: ", string(utf8OtherMath127));
        console2.logBytes(utf8OtherMath127);

        string memory otherMath128 = "\\u{2990}";
        bytes memory utf8OtherMath128 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath128));
        console2.log("2990: ", string(utf8OtherMath128));
        console2.logBytes(utf8OtherMath128);

        string memory otherMath129 = "\\u{2991}";
        bytes memory utf8OtherMath129 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath129));
        console2.log("2991: ", string(utf8OtherMath129));
        console2.logBytes(utf8OtherMath129);

        string memory otherMath130 = "\\u{2992}";
        bytes memory utf8OtherMath130 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath130));
        console2.log("2992: ", string(utf8OtherMath130));
        console2.logBytes(utf8OtherMath130);

        string memory otherMath131 = "\\u{2993}";
        bytes memory utf8OtherMath131 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath131));
        console2.log("2993: ", string(utf8OtherMath131));
        console2.logBytes(utf8OtherMath131);

        string memory otherMath132 = "\\u{2994}";
        bytes memory utf8OtherMath132 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath132));
        console2.log("2994: ", string(utf8OtherMath132));
        console2.logBytes(utf8OtherMath132);

        string memory otherMath133 = "\\u{2995}";
        bytes memory utf8OtherMath133 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath133));
        console2.log("2995: ", string(utf8OtherMath133));
        console2.logBytes(utf8OtherMath133);

        string memory otherMath134 = "\\u{2996}";
        bytes memory utf8OtherMath134 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath134));
        console2.log("2996: ", string(utf8OtherMath134));
        console2.logBytes(utf8OtherMath134);

        string memory otherMath135 = "\\u{2997}";
        bytes memory utf8OtherMath135 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath135));
        console2.log("2997: ", string(utf8OtherMath135));
        console2.logBytes(utf8OtherMath135);

        string memory otherMath136 = "\\u{2998}";
        bytes memory utf8OtherMath136 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath136));
        console2.log("2998: ", string(utf8OtherMath136));
        console2.logBytes(utf8OtherMath136);

        string memory otherMath137 = "\\u{29D8}";
        bytes memory utf8OtherMath137 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath137));
        console2.log("29D8: ", string(utf8OtherMath137));
        console2.logBytes(utf8OtherMath137);

        string memory otherMath138 = "\\u{29D9}";
        bytes memory utf8OtherMath138 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath138));
        console2.log("29D9: ", string(utf8OtherMath138));
        console2.logBytes(utf8OtherMath138);

        string memory otherMath139 = "\\u{29DA}";
        bytes memory utf8OtherMath139 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath139));
        console2.log("29DA: ", string(utf8OtherMath139));
        console2.logBytes(utf8OtherMath139);

        string memory otherMath140 = "\\u{29DB}";
        bytes memory utf8OtherMath140 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath140));
        console2.log("29DB: ", string(utf8OtherMath140));
        console2.logBytes(utf8OtherMath140);

        string memory otherMath141 = "\\u{29FC}";
        bytes memory utf8OtherMath141 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath141));
        console2.log("29FC: ", string(utf8OtherMath141));
        console2.logBytes(utf8OtherMath141);

        string memory otherMath142 = "\\u{29FD}";
        bytes memory utf8OtherMath142 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath142));
        console2.log("29FD: ", string(utf8OtherMath142));
        console2.logBytes(utf8OtherMath142);

        string memory otherMath143 = "\\u{FE61}";
        bytes memory utf8OtherMath143 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath143));
        console2.log("FE61: ", string(utf8OtherMath143));
        console2.logBytes(utf8OtherMath143);

        string memory otherMath144 = "\\u{FE63}";
        bytes memory utf8OtherMath144 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath144));
        console2.log("FE63: ", string(utf8OtherMath144));
        console2.logBytes(utf8OtherMath144);

        string memory otherMath145 = "\\u{FE68}";
        bytes memory utf8OtherMath145 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath145));
        console2.log("FE68: ", string(utf8OtherMath145));
        console2.logBytes(utf8OtherMath145);

        string memory otherMath146 = "\\u{FF3C}";
        bytes memory utf8OtherMath146 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath146));
        console2.log("FF3C: ", string(utf8OtherMath146));
        console2.logBytes(utf8OtherMath146);

        string memory otherMath147 = "\\u{FF3E}";
        bytes memory utf8OtherMath147 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath147));
        console2.log("FF3E: ", string(utf8OtherMath147));
        console2.logBytes(utf8OtherMath147);

        string memory otherMath148 = "\\u{1D400}";
        bytes memory utf8OtherMath148 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath148));
        console2.log("1D400: ", string(utf8OtherMath148));
        console2.logBytes(utf8OtherMath148);

        string memory otherMath149 = "\\u{1D454}";
        bytes memory utf8OtherMath149 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath149));
        console2.log("1D454: ", string(utf8OtherMath149));
        console2.logBytes(utf8OtherMath149);

        string memory otherMath150 = "\\u{1D456}";
        bytes memory utf8OtherMath150 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath150));
        console2.log("1D456: ", string(utf8OtherMath150));
        console2.logBytes(utf8OtherMath150);

        string memory otherMath151 = "\\u{1D49C}";
        bytes memory utf8OtherMath151 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath151));
        console2.log("1D49C: ", string(utf8OtherMath151));
        console2.logBytes(utf8OtherMath151);

        string memory otherMath152 = "\\u{1D49E}";
        bytes memory utf8OtherMath152 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath152));
        console2.log("1D49E: ", string(utf8OtherMath152));
        console2.logBytes(utf8OtherMath152);

        string memory otherMath153 = "\\u{1D49F}";
        bytes memory utf8OtherMath153 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath153));
        console2.log("1D49F: ", string(utf8OtherMath153));
        console2.logBytes(utf8OtherMath153);

        string memory otherMath154 = "\\u{1D4A2}";
        bytes memory utf8OtherMath154 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath154));
        console2.log("1D4A2: ", string(utf8OtherMath154));
        console2.logBytes(utf8OtherMath154);

        string memory otherMath155 = "\\u{1D4A5}";
        bytes memory utf8OtherMath155 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath155));
        console2.log("1D4A5: ", string(utf8OtherMath155));
        console2.logBytes(utf8OtherMath155);

        string memory otherMath156 = "\\u{1D4A6}";
        bytes memory utf8OtherMath156 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath156));
        console2.log("1D4A6: ", string(utf8OtherMath156));
        console2.logBytes(utf8OtherMath156);

        string memory otherMath157 = "\\u{1D4A9}";
        bytes memory utf8OtherMath157 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath157));
        console2.log("1D4A9: ", string(utf8OtherMath157));
        console2.logBytes(utf8OtherMath157);

        string memory otherMath158 = "\\u{1D4AC}";
        bytes memory utf8OtherMath158 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath158));
        console2.log("1D4AC: ", string(utf8OtherMath158));
        console2.logBytes(utf8OtherMath158);

        string memory otherMath159 = "\\u{1D4AE}";
        bytes memory utf8OtherMath159 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath159));
        console2.log("1D4AE: ", string(utf8OtherMath159));
        console2.logBytes(utf8OtherMath159);

        string memory otherMath160 = "\\u{1D4B9}";
        bytes memory utf8OtherMath160 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath160));
        console2.log("1D4B9: ", string(utf8OtherMath160));
        console2.logBytes(utf8OtherMath160);

        string memory otherMath161 = "\\u{1D4BB}";
        bytes memory utf8OtherMath161 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath161));
        console2.log("1D4BB: ", string(utf8OtherMath161));
        console2.logBytes(utf8OtherMath161);

        string memory otherMath162 = "\\u{1D4BD}";
        bytes memory utf8OtherMath162 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath162));
        console2.log("1D4BD: ", string(utf8OtherMath162));
        console2.logBytes(utf8OtherMath162);

        string memory otherMath163 = "\\u{1D4C3}";
        bytes memory utf8OtherMath163 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath163));
        console2.log("1D4C3: ", string(utf8OtherMath163));
        console2.logBytes(utf8OtherMath163);

        string memory otherMath164 = "\\u{1D4C5}";
        bytes memory utf8OtherMath164 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath164));
        console2.log("1D4C5: ", string(utf8OtherMath164));
        console2.logBytes(utf8OtherMath164);

        string memory otherMath165 = "\\u{1D505}";
        bytes memory utf8OtherMath165 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath165));
        console2.log("1D505: ", string(utf8OtherMath165));
        console2.logBytes(utf8OtherMath165);

        string memory otherMath166 = "\\u{1D507}";
        bytes memory utf8OtherMath166 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath166));
        console2.log("1D507: ", string(utf8OtherMath166));
        console2.logBytes(utf8OtherMath166);

        string memory otherMath167 = "\\u{1D50A}";
        bytes memory utf8OtherMath167 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath167));
        console2.log("1D50A: ", string(utf8OtherMath167));
        console2.logBytes(utf8OtherMath167);

        string memory otherMath168 = "\\u{1D50D}";
        bytes memory utf8OtherMath168 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath168));
        console2.log("1D50D: ", string(utf8OtherMath168));
        console2.logBytes(utf8OtherMath168);

        string memory otherMath169 = "\\u{1D514}";
        bytes memory utf8OtherMath169 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath169));
        console2.log("1D514: ", string(utf8OtherMath169));
        console2.logBytes(utf8OtherMath169);

        string memory otherMath170 = "\\u{1D516}";
        bytes memory utf8OtherMath170 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath170));
        console2.log("1D516: ", string(utf8OtherMath170));
        console2.logBytes(utf8OtherMath170);

        string memory otherMath171 = "\\u{1D51C}";
        bytes memory utf8OtherMath171 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath171));
        console2.log("1D51C: ", string(utf8OtherMath171));
        console2.logBytes(utf8OtherMath171);

        string memory otherMath172 = "\\u{1D51E}";
        bytes memory utf8OtherMath172 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath172));
        console2.log("1D51E: ", string(utf8OtherMath172));
        console2.logBytes(utf8OtherMath172);

        string memory otherMath173 = "\\u{1D539}";
        bytes memory utf8OtherMath173 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath173));
        console2.log("1D539: ", string(utf8OtherMath173));
        console2.logBytes(utf8OtherMath173);

        string memory otherMath174 = "\\u{1D53B}";
        bytes memory utf8OtherMath174 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath174));
        console2.log("1D53B: ", string(utf8OtherMath174));
        console2.logBytes(utf8OtherMath174);

        string memory otherMath175 = "\\u{1D53E}";
        bytes memory utf8OtherMath175 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath175));
        console2.log("1D53E: ", string(utf8OtherMath175));
        console2.logBytes(utf8OtherMath175);

        string memory otherMath176 = "\\u{1D540}";
        bytes memory utf8OtherMath176 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath176));
        console2.log("1D540: ", string(utf8OtherMath176));
        console2.logBytes(utf8OtherMath176);

        string memory otherMath177 = "\\u{1D544}";
        bytes memory utf8OtherMath177 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath177));
        console2.log("1D544: ", string(utf8OtherMath177));
        console2.logBytes(utf8OtherMath177);

        string memory otherMath178 = "\\u{1D546}";
        bytes memory utf8OtherMath178 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath178));
        console2.log("1D546: ", string(utf8OtherMath178));
        console2.logBytes(utf8OtherMath178);

        string memory otherMath179 = "\\u{1D54A}";
        bytes memory utf8OtherMath179 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath179));
        console2.log("1D54A: ", string(utf8OtherMath179));
        console2.logBytes(utf8OtherMath179);

        string memory otherMath180 = "\\u{1D550}";
        bytes memory utf8OtherMath180 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath180));
        console2.log("1D550: ", string(utf8OtherMath180));
        console2.logBytes(utf8OtherMath180);

        string memory otherMath181 = "\\u{1D552}";
        bytes memory utf8OtherMath181 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath181));
        console2.log("1D552: ", string(utf8OtherMath181));
        console2.logBytes(utf8OtherMath181);

        string memory otherMath182 = "\\u{1D6A5}";
        bytes memory utf8OtherMath182 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath182));
        console2.log("1D6A5: ", string(utf8OtherMath182));
        console2.logBytes(utf8OtherMath182);

        string memory otherMath183 = "\\u{1D6A8}";
        bytes memory utf8OtherMath183 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath183));
        console2.log("1D6A8: ", string(utf8OtherMath183));
        console2.logBytes(utf8OtherMath183);

        string memory otherMath184 = "\\u{1D6C0}";
        bytes memory utf8OtherMath184 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath184));
        console2.log("1D6C0: ", string(utf8OtherMath184));
        console2.logBytes(utf8OtherMath184);

        string memory otherMath185 = "\\u{1D6C2}";
        bytes memory utf8OtherMath185 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath185));
        console2.log("1D6C2: ", string(utf8OtherMath185));
        console2.logBytes(utf8OtherMath185);

        string memory otherMath186 = "\\u{1D6DA}";
        bytes memory utf8OtherMath186 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath186));
        console2.log("1D6DA: ", string(utf8OtherMath186));
        console2.logBytes(utf8OtherMath186);

        string memory otherMath187 = "\\u{1D6DC}";
        bytes memory utf8OtherMath187 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath187));
        console2.log("1D6DC: ", string(utf8OtherMath187));
        console2.logBytes(utf8OtherMath187);

        string memory otherMath188 = "\\u{1D6FA}";
        bytes memory utf8OtherMath188 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath188));
        console2.log("1D6FA: ", string(utf8OtherMath188));
        console2.logBytes(utf8OtherMath188);

        string memory otherMath189 = "\\u{1D6FC}";
        bytes memory utf8OtherMath189 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath189));
        console2.log("1D6FC: ", string(utf8OtherMath189));
        console2.logBytes(utf8OtherMath189);

        string memory otherMath190 = "\\u{1D714}";
        bytes memory utf8OtherMath190 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath190));
        console2.log("1D714: ", string(utf8OtherMath190));
        console2.logBytes(utf8OtherMath190);

        string memory otherMath191 = "\\u{1D716}";
        bytes memory utf8OtherMath191 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath191));
        console2.log("1D716: ", string(utf8OtherMath191));
        console2.logBytes(utf8OtherMath191);

        string memory otherMath192 = "\\u{1D734}";
        bytes memory utf8OtherMath192 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath192));
        console2.log("1D734: ", string(utf8OtherMath192));
        console2.logBytes(utf8OtherMath192);

        string memory otherMath193 = "\\u{1D736}";
        bytes memory utf8OtherMath193 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath193));
        console2.log("1D736: ", string(utf8OtherMath193));
        console2.logBytes(utf8OtherMath193);

        string memory otherMath194 = "\\u{1D74E}";
        bytes memory utf8OtherMath194 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath194));
        console2.log("1D74E: ", string(utf8OtherMath194));
        console2.logBytes(utf8OtherMath194);

        string memory otherMath195 = "\\u{1D750}";
        bytes memory utf8OtherMath195 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath195));
        console2.log("1D750: ", string(utf8OtherMath195));
        console2.logBytes(utf8OtherMath195);

        string memory otherMath196 = "\\u{1D76E}";
        bytes memory utf8OtherMath196 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath196));
        console2.log("1D76E: ", string(utf8OtherMath196));
        console2.logBytes(utf8OtherMath196);

        string memory otherMath197 = "\\u{1D770}";
        bytes memory utf8OtherMath197 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath197));
        console2.log("1D770: ", string(utf8OtherMath197));
        console2.logBytes(utf8OtherMath197);

        string memory otherMath198 = "\\u{1D788}";
        bytes memory utf8OtherMath198 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath198));
        console2.log("1D788: ", string(utf8OtherMath198));
        console2.logBytes(utf8OtherMath198);

        string memory otherMath199 = "\\u{1D78A}";
        bytes memory utf8OtherMath199 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath199));
        console2.log("1D78A: ", string(utf8OtherMath199));
        console2.logBytes(utf8OtherMath199);

        string memory otherMath200 = "\\u{1D7A8}";
        bytes memory utf8OtherMath200 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath200));
        console2.log("1D7A8: ", string(utf8OtherMath200));
        console2.logBytes(utf8OtherMath200);

        string memory otherMath201 = "\\u{1D7AA}";
        bytes memory utf8OtherMath201 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath201));
        console2.log("1D7AA: ", string(utf8OtherMath201));
        console2.logBytes(utf8OtherMath201);

        string memory otherMath202 = "\\u{1D7C2}";
        bytes memory utf8OtherMath202 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath202));
        console2.log("1D7C2: ", string(utf8OtherMath202));
        console2.logBytes(utf8OtherMath202);

        string memory otherMath203 = "\\u{1D7C4}";
        bytes memory utf8OtherMath203 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath203));
        console2.log("1D7C4: ", string(utf8OtherMath203));
        console2.logBytes(utf8OtherMath203);

        string memory otherMath204 = "\\u{1D7CB}";
        bytes memory utf8OtherMath204 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath204));
        console2.log("1D7CB: ", string(utf8OtherMath204));
        console2.logBytes(utf8OtherMath204);

        string memory otherMath205 = "\\u{1D7CE}";
        bytes memory utf8OtherMath205 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath205));
        console2.log("1D7CE: ", string(utf8OtherMath205));
        console2.logBytes(utf8OtherMath205);

        string memory otherMath206 = "\\u{1D7FF}";
        bytes memory utf8OtherMath206 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath206));
        console2.log("1D7FF: ", string(utf8OtherMath206));
        console2.logBytes(utf8OtherMath206);

        string memory otherMath207 = "\\u{1EE00}";
        bytes memory utf8OtherMath207 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath207));
        console2.log("1EE00: ", string(utf8OtherMath207));
        console2.logBytes(utf8OtherMath207);

        string memory otherMath208 = "\\u{1EE03}";
        bytes memory utf8OtherMath208 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath208));
        console2.log("1EE03: ", string(utf8OtherMath208));
        console2.logBytes(utf8OtherMath208);

        string memory otherMath209 = "\\u{1EE05}";
        bytes memory utf8OtherMath209 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath209));
        console2.log("1EE05: ", string(utf8OtherMath209));
        console2.logBytes(utf8OtherMath209);

        string memory otherMath210 = "\\u{1EE1F}";
        bytes memory utf8OtherMath210 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath210));
        console2.log("1EE1F: ", string(utf8OtherMath210));
        console2.logBytes(utf8OtherMath210);

        string memory otherMath211 = "\\u{1EE21}";
        bytes memory utf8OtherMath211 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath211));
        console2.log("1EE21: ", string(utf8OtherMath211));
        console2.logBytes(utf8OtherMath211);

        string memory otherMath212 = "\\u{1EE22}";
        bytes memory utf8OtherMath212 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath212));
        console2.log("1EE22: ", string(utf8OtherMath212));
        console2.logBytes(utf8OtherMath212);

        string memory otherMath213 = "\\u{1EE24}";
        bytes memory utf8OtherMath213 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath213));
        console2.log("1EE24: ", string(utf8OtherMath213));
        console2.logBytes(utf8OtherMath213);

        string memory otherMath214 = "\\u{1EE27}";
        bytes memory utf8OtherMath214 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath214));
        console2.log("1EE27: ", string(utf8OtherMath214));
        console2.logBytes(utf8OtherMath214);

        string memory otherMath215 = "\\u{1EE29}";
        bytes memory utf8OtherMath215 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath215));
        console2.log("1EE29: ", string(utf8OtherMath215));
        console2.logBytes(utf8OtherMath215);

        string memory otherMath216 = "\\u{1EE32}";
        bytes memory utf8OtherMath216 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath216));
        console2.log("1EE32: ", string(utf8OtherMath216));
        console2.logBytes(utf8OtherMath216);

        string memory otherMath217 = "\\u{1EE34}";
        bytes memory utf8OtherMath217 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath217));
        console2.log("1EE34: ", string(utf8OtherMath217));
        console2.logBytes(utf8OtherMath217);

        string memory otherMath218 = "\\u{1EE37}";
        bytes memory utf8OtherMath218 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath218));
        console2.log("1EE37: ", string(utf8OtherMath218));
        console2.logBytes(utf8OtherMath218);

        string memory otherMath219 = "\\u{1EE39}";
        bytes memory utf8OtherMath219 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath219));
        console2.log("1EE39: ", string(utf8OtherMath219));
        console2.logBytes(utf8OtherMath219);

        string memory otherMath220 = "\\u{1EE3B}";
        bytes memory utf8OtherMath220 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath220));
        console2.log("1EE3B: ", string(utf8OtherMath220));
        console2.logBytes(utf8OtherMath220);

        string memory otherMath221 = "\\u{1EE42}";
        bytes memory utf8OtherMath221 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath221));
        console2.log("1EE42: ", string(utf8OtherMath221));
        console2.logBytes(utf8OtherMath221);

        string memory otherMath222 = "\\u{1EE47}";
        bytes memory utf8OtherMath222 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath222));
        console2.log("1EE47: ", string(utf8OtherMath222));
        console2.logBytes(utf8OtherMath222);

        string memory otherMath223 = "\\u{1EE49}";
        bytes memory utf8OtherMath223 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath223));
        console2.log("1EE49: ", string(utf8OtherMath223));
        console2.logBytes(utf8OtherMath223);

        string memory otherMath224 = "\\u{1EE4B}";
        bytes memory utf8OtherMath224 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath224));
        console2.log("1EE4B: ", string(utf8OtherMath224));
        console2.logBytes(utf8OtherMath224);

        string memory otherMath225 = "\\u{1EE4D}";
        bytes memory utf8OtherMath225 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath225));
        console2.log("1EE4D: ", string(utf8OtherMath225));
        console2.logBytes(utf8OtherMath225);

        string memory otherMath226 = "\\u{1EE4F}";
        bytes memory utf8OtherMath226 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath226));
        console2.log("1EE4F: ", string(utf8OtherMath226));
        console2.logBytes(utf8OtherMath226);

        string memory otherMath227 = "\\u{1EE51}";
        bytes memory utf8OtherMath227 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath227));
        console2.log("1EE51: ", string(utf8OtherMath227));
        console2.logBytes(utf8OtherMath227);

        string memory otherMath228 = "\\u{1EE52}";
        bytes memory utf8OtherMath228 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath228));
        console2.log("1EE52: ", string(utf8OtherMath228));
        console2.logBytes(utf8OtherMath228);

        string memory otherMath229 = "\\u{1EE54}";
        bytes memory utf8OtherMath229 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath229));
        console2.log("1EE54: ", string(utf8OtherMath229));
        console2.logBytes(utf8OtherMath229);

        string memory otherMath230 = "\\u{1EE57}";
        bytes memory utf8OtherMath230 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath230));
        console2.log("1EE57: ", string(utf8OtherMath230));
        console2.logBytes(utf8OtherMath230);

        string memory otherMath231 = "\\u{1EE59}";
        bytes memory utf8OtherMath231 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath231));
        console2.log("1EE59: ", string(utf8OtherMath231));
        console2.logBytes(utf8OtherMath231);

        string memory otherMath232 = "\\u{1EE5B}";
        bytes memory utf8OtherMath232 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath232));
        console2.log("1EE5B: ", string(utf8OtherMath232));
        console2.logBytes(utf8OtherMath232);

        string memory otherMath233 = "\\u{1EE5D}";
        bytes memory utf8OtherMath233 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath233));
        console2.log("1EE5D: ", string(utf8OtherMath233));
        console2.logBytes(utf8OtherMath233);

        string memory otherMath234 = "\\u{1EE5F}";
        bytes memory utf8OtherMath234 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath234));
        console2.log("1EE5F: ", string(utf8OtherMath234));
        console2.logBytes(utf8OtherMath234);

        string memory otherMath235 = "\\u{1EE61}";
        bytes memory utf8OtherMath235 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath235));
        console2.log("1EE61: ", string(utf8OtherMath235));
        console2.logBytes(utf8OtherMath235);

        string memory otherMath236 = "\\u{1EE62}";
        bytes memory utf8OtherMath236 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath236));
        console2.log("1EE62: ", string(utf8OtherMath236));
        console2.logBytes(utf8OtherMath236);

        string memory otherMath237 = "\\u{1EE64}";
        bytes memory utf8OtherMath237 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath237));
        console2.log("1EE64: ", string(utf8OtherMath237));
        console2.logBytes(utf8OtherMath237);

        string memory otherMath238 = "\\u{1EE67}";
        bytes memory utf8OtherMath238 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath238));
        console2.log("1EE67: ", string(utf8OtherMath238));
        console2.logBytes(utf8OtherMath238);

        string memory otherMath239 = "\\u{1EE6A}";
        bytes memory utf8OtherMath239 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath239));
        console2.log("1EE6A: ", string(utf8OtherMath239));
        console2.logBytes(utf8OtherMath239);

        string memory otherMath240 = "\\u{1EE6C}";
        bytes memory utf8OtherMath240 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath240));
        console2.log("1EE6C: ", string(utf8OtherMath240));
        console2.logBytes(utf8OtherMath240);

        string memory otherMath241 = "\\u{1EE72}";
        bytes memory utf8OtherMath241 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath241));
        console2.log("1EE72: ", string(utf8OtherMath241));
        console2.logBytes(utf8OtherMath241);

        string memory otherMath242 = "\\u{1EE74}";
        bytes memory utf8OtherMath242 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath242));
        console2.log("1EE74: ", string(utf8OtherMath242));
        console2.logBytes(utf8OtherMath242);

        string memory otherMath243 = "\\u{1EE77}";
        bytes memory utf8OtherMath243 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath243));
        console2.log("1EE77: ", string(utf8OtherMath243));
        console2.logBytes(utf8OtherMath243);

        string memory otherMath244 = "\\u{1EE79}";
        bytes memory utf8OtherMath244 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath244));
        console2.log("1EE79: ", string(utf8OtherMath244));
        console2.logBytes(utf8OtherMath244);

        string memory otherMath245 = "\\u{1EE7C}";
        bytes memory utf8OtherMath245 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath245));
        console2.log("1EE7C: ", string(utf8OtherMath245));
        console2.logBytes(utf8OtherMath245);

        string memory otherMath246 = "\\u{1EE7E}";
        bytes memory utf8OtherMath246 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath246));
        console2.log("1EE7E: ", string(utf8OtherMath246));
        console2.logBytes(utf8OtherMath246);

        string memory otherMath247 = "\\u{1EE80}";
        bytes memory utf8OtherMath247 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath247));
        console2.log("1EE80: ", string(utf8OtherMath247));
        console2.logBytes(utf8OtherMath247);

        string memory otherMath248 = "\\u{1EE89}";
        bytes memory utf8OtherMath248 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath248));
        console2.log("1EE89: ", string(utf8OtherMath248));
        console2.logBytes(utf8OtherMath248);

        string memory otherMath249 = "\\u{1EE8B}";
        bytes memory utf8OtherMath249 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath249));
        console2.log("1EE8B: ", string(utf8OtherMath249));
        console2.logBytes(utf8OtherMath249);

        string memory otherMath250 = "\\u{1EE9B}";
        bytes memory utf8OtherMath250 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath250));
        console2.log("1EE9B: ", string(utf8OtherMath250));
        console2.logBytes(utf8OtherMath250);

        string memory otherMath251 = "\\u{1EEA1}";
        bytes memory utf8OtherMath251 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath251));
        console2.log("1EEA1: ", string(utf8OtherMath251));
        console2.logBytes(utf8OtherMath251);

        string memory otherMath252 = "\\u{1EEA3}";
        bytes memory utf8OtherMath252 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath252));
        console2.log("1EEA3: ", string(utf8OtherMath252));
        console2.logBytes(utf8OtherMath252);

        string memory otherMath253 = "\\u{1EEA5}";
        bytes memory utf8OtherMath253 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath253));
        console2.log("1EEA5: ", string(utf8OtherMath253));
        console2.logBytes(utf8OtherMath253);

        string memory otherMath254 = "\\u{1EEA9}";
        bytes memory utf8OtherMath254 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath254));
        console2.log("1EEA9: ", string(utf8OtherMath254));
        console2.logBytes(utf8OtherMath254);

        string memory otherMath255 = "\\u{1EEAB}";
        bytes memory utf8OtherMath255 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath255));
        console2.log("1EEAB: ", string(utf8OtherMath255));
        console2.logBytes(utf8OtherMath255);

        string memory otherMath256 = "\\u{1EEBB}";
        bytes memory utf8OtherMath256 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath256));
        console2.log("1EEBB: ", string(utf8OtherMath256));
        console2.logBytes(utf8OtherMath256);
    }

    function testRegexutf8HexToUnicodeHexCases() public {
        DummyContract dContract = new DummyContract();
        dContract.regexUtf8HexToUnicodeHex2BytesCase1();
        dContract.regexUtf8HexToUnicodeHex2BytesCase2();
        dContract.regexUtf8HexToUnicodeHex2BytesCase3();
        dContract.regexUtf8HexToUnicodeHex2BytesCase4();
        dContract.regexUtf8HexToUnicodeHex2BytesCase5();
        dContract.regexUtf8HexToUnicodeHex3BytesCase1();
        dContract.regexUtf8HexToUnicodeHex3BytesCase2();
        dContract.regexUtf8HexToUnicodeHex3BytesCase3();
        dContract.regexUtf8HexToUnicodeHex3BytesCase4();
        dContract.regexUtf8HexToUnicodeHex3BytesCase5();
        dContract.regexUtf8HexToUnicodeHex4BytesCase1();
        dContract.regexUtf8HexToUnicodeHex4BytesCase2();
        dContract.regexUtf8HexToUnicodeHex4BytesCase3();
        dContract.regexUtf8HexToUnicodeHex4BytesCase4();
        dContract.regexUtf8HexToUnicodeHex4BytesCase5();
    }
}

contract DummyContract {
    using Stringray for string;

    function regexUtf8HexToUnicodeHex2BytesCase1() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes2(0xc2b7));
        bytes memory unicodeHex = abi.encodePacked(bytes2(0x00b7));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex2BytesCase2() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes2(0xc2a9));
        bytes memory unicodeHex = abi.encodePacked(bytes2(0x00a9));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex2BytesCase3() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes2(0xc3a9));
        bytes memory unicodeHex = abi.encodePacked(bytes2(0x00e9));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex2BytesCase4() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes2(0xc3b1));
        bytes memory unicodeHex = abi.encodePacked(bytes2(0x00f1));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex2BytesCase5() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes2(0xdfbf));
        bytes memory unicodeHex = abi.encodePacked(bytes2(0x07ff));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex3BytesCase1() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes3(0xe282a2));
        bytes memory unicodeHex = abi.encodePacked(bytes2(0x20a2));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex3BytesCase2() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes3(0xe284a2));
        bytes memory unicodeHex = abi.encodePacked(bytes2(0x2122));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex3BytesCase3() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes3(0xe282ac));
        bytes memory unicodeHex = abi.encodePacked(bytes2(0x20ac));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex3BytesCase4() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes3(0xe38181));
        bytes memory unicodeHex = abi.encodePacked(bytes2(0x3041));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex3BytesCase5() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes3(0xefbfbf));
        bytes memory unicodeHex = abi.encodePacked(bytes2(0xffff));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex4BytesCase1() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes4(0xf0908080));
        bytes memory unicodeHex = abi.encodePacked(bytes3(0x010000));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex4BytesCase2() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes4(0xf0a08080));
        bytes memory unicodeHex = abi.encodePacked(bytes3(0x020000));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex4BytesCase3() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes4(0xf09f92a9));
        bytes memory unicodeHex = abi.encodePacked(bytes3(0x01f4a9));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex4BytesCase4() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes4(0xf1808080));
        bytes memory unicodeHex = abi.encodePacked(bytes3(0x040000));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

    function regexUtf8HexToUnicodeHex4BytesCase5() public pure {
        bytes memory utf8Hex = abi.encodePacked(bytes4(0xf48fbfbf));
        bytes memory unicodeHex = abi.encodePacked(bytes3(0x10ffff));
        bytes memory unicodeHexEqv = Stringray.utf8HexToUnicodeHex(utf8Hex);
        console2.logBytes(unicodeHexEqv);
        assert(keccak256(unicodeHexEqv) == keccak256(unicodeHex));
    }

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

    function regexMetaCharsAndEscapeSequencesCase3a() public pure {
        string memory target = "dummy";
        string memory pattern = "/{2,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase4() public pure {
        string memory target = "dummy";
        string memory pattern = "/{,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase5() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase6() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}?/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase7() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}??/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase8() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}?{1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase9() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}?{1,}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase10() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}?{1,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase11() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}?{2,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase12() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}?{,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase13() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}?a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase14() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}?\\a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase15() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}?+/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase16() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}?*/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase17() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase18() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+?/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase19() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+??/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase20() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+?{1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase21() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+?{1,}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase22() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+?{1,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase23() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+?{2,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase24() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+?{,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase25() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+?a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase26() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+?\\a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase27() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+?+/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase28() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+?*/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase29() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase30() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*?/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase31() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*??/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase32() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*?{1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase33() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*?{1,}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase34() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*?{1,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase35() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*?{2,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase36() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*?{,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase37() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*?a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase38() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*?\\a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase39() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*?+/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase40() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*?*/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase41() public pure {
        string memory target = "dummy";
        string memory pattern = "/m?/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase42() public pure {
        string memory target = "dummy";
        string memory pattern = "/m??/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase43() public pure {
        string memory target = "dummy";
        string memory pattern = "/m???/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase44() public pure {
        string memory target = "dummy";
        string memory pattern = "/m??{1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase45() public pure {
        string memory target = "dummy";
        string memory pattern = "/m??{1,}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase46() public pure {
        string memory target = "dummy";
        string memory pattern = "/m??{1,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase47() public pure {
        string memory target = "dummy";
        string memory pattern = "/m??{2,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase48() public pure {
        string memory target = "dummy";
        string memory pattern = "/m??{,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase49() public pure {
        string memory target = "dummy";
        string memory pattern = "/m??a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase50() public pure {
        string memory target = "dummy";
        string memory pattern = "/m??\\a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase51() public pure {
        string memory target = "dummy";
        string memory pattern = "/m??+/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase52() public pure {
        string memory target = "dummy";
        string memory pattern = "/m??*/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase53() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}+/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase54() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}*/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase55() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}{1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase56() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}{1,}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase57() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}{1,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase58() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}{2,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase59() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}{,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase60() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase61() public pure {
        string memory target = "dummy";
        string memory pattern = "/m{1}\\a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase62() public pure {
        string memory target = "dummy";
        string memory pattern = "/m++/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase63() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+*/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase64() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+{1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase65() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+{1,}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase66() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+{1,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase67() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+{2,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase68() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+{,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase69() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase70() public pure {
        string memory target = "dummy";
        string memory pattern = "/m+\\a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase71() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*+/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase72() public pure {
        string memory target = "dummy";
        string memory pattern = "/m**/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase73() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*{1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase74() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*{1,}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase75() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*{1,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase76() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*{2,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase77() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*{,1}/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase78() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase79() public pure {
        string memory target = "dummy";
        string memory pattern = "/m*\\a/";
        target.regex(pattern);
    }

    function regexMetaCharsAndEscapeSequencesCase80() public pure {
        string memory target = "dummy";
        // string memory pattern = "/\\x61/";
        string memory pattern =
            "/\\b\\c\\d\\f\\k\\n\\p\\r\\s\\t\\u\\v\\w\\xa\\x0F\\x1A\\x0a\\x1F\\B\\D\\P\\S\\W\\0\\1\\2\\3\\4\\5\\6\\7\\8\\9a1234567890\\x7f\\x7F\\X7f\\X7F/";
        target.regex(pattern);
    }
}
