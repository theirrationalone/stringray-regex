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
        string memory terminalPunctuation7 = unicode"\u0037E";
        console2.log("0037E: ", terminalPunctuation7);
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
        string memory terminalPunctuation113 = unicode"\u01039F";
        console2.log("01039F: ", terminalPunctuation113);
        console2.logBytes(abi.encodePacked(terminalPunctuation113));
        string memory terminalPunctuation114 = unicode"\u0103D0";
        console2.log("0103D0: ", terminalPunctuation114);
        console2.logBytes(abi.encodePacked(terminalPunctuation114));
        string memory terminalPunctuation115 = unicode"\u010857";
        console2.log("010857: ", terminalPunctuation115);
        console2.logBytes(abi.encodePacked(terminalPunctuation115));
        string memory terminalPunctuation116 = unicode"\u01091F";
        console2.log("01091F: ", terminalPunctuation116);
        console2.logBytes(abi.encodePacked(terminalPunctuation116));
        // loop 46: start
        string memory terminalPunctuation117 = unicode"\u010A56";
        console2.log("010A56: ", terminalPunctuation117);
        console2.logBytes(abi.encodePacked(terminalPunctuation117));
        // loop 46: end
        string memory terminalPunctuation118 = unicode"\u010A57";
        console2.log("010A57: ", terminalPunctuation118);
        console2.logBytes(abi.encodePacked(terminalPunctuation118));
        // loop 47: start
        string memory terminalPunctuation119 = unicode"\u010AF0";
        console2.log("010AF0: ", terminalPunctuation119);
        console2.logBytes(abi.encodePacked(terminalPunctuation119));
        // loop 47: end
        string memory terminalPunctuation120 = unicode"\u010AF5";
        console2.log("010AF5: ", terminalPunctuation120);
        console2.logBytes(abi.encodePacked(terminalPunctuation120));
        // loop 48: start
        string memory terminalPunctuation121 = unicode"\u010B3A";
        console2.log("010B3A: ", terminalPunctuation121);
        console2.logBytes(abi.encodePacked(terminalPunctuation121));
        // loop 48: end
        string memory terminalPunctuation122 = unicode"\u010B3F";
        console2.log("010B3F: ", terminalPunctuation122);
        console2.logBytes(abi.encodePacked(terminalPunctuation122));
        // loop 49: start
        string memory terminalPunctuation123 = unicode"\u010B99";
        console2.log("010B99: ", terminalPunctuation123);
        console2.logBytes(abi.encodePacked(terminalPunctuation123));
        // loop 49: end
        string memory terminalPunctuation124 = unicode"\u010B9C";
        console2.log("010B9C: ", terminalPunctuation124);
        console2.logBytes(abi.encodePacked(terminalPunctuation124));
        // loop 50: start
        string memory terminalPunctuation125 = unicode"\u010F55";
        console2.log("010F55: ", terminalPunctuation125);
        console2.logBytes(abi.encodePacked(terminalPunctuation125));
        // loop 50: end
        string memory terminalPunctuation126 = unicode"\u010F59";
        console2.log("010F59: ", terminalPunctuation126);
        console2.logBytes(abi.encodePacked(terminalPunctuation126));
        // loop 51: start
        string memory terminalPunctuation127 = unicode"\u010F86";
        console2.log("010F86: ", terminalPunctuation127);
        console2.logBytes(abi.encodePacked(terminalPunctuation127));
        // loop 51: end
        string memory terminalPunctuation128 = unicode"\u010F89";
        console2.log("010F89: ", terminalPunctuation128);
        console2.logBytes(abi.encodePacked(terminalPunctuation128));
        // loop 52: start
        string memory terminalPunctuation129 = unicode"\u011047";
        console2.log("011047: ", terminalPunctuation129);
        console2.logBytes(abi.encodePacked(terminalPunctuation129));
        // loop 53: end
        string memory terminalPunctuation130 = unicode"\u01104D";
        console2.log("01104D: ", terminalPunctuation130);
        console2.logBytes(abi.encodePacked(terminalPunctuation130));
        // loop 54: start
        string memory terminalPunctuation131 = unicode"\u0110BE";
        console2.log("0110BE: ", terminalPunctuation131);
        console2.logBytes(abi.encodePacked(terminalPunctuation131));
        // loop 54: end
        string memory terminalPunctuation132 = unicode"\u0110C1";
        console2.log("0110C1: ", terminalPunctuation132);
        console2.logBytes(abi.encodePacked(terminalPunctuation132));
        // loop 55: start
        string memory terminalPunctuation133 = unicode"\u011141";
        console2.log("011141: ", terminalPunctuation133);
        console2.logBytes(abi.encodePacked(terminalPunctuation133));
        // loop 56: end
        string memory terminalPunctuation134 = unicode"\u011143";
        console2.log("011143: ", terminalPunctuation134);
        console2.logBytes(abi.encodePacked(terminalPunctuation134));
        // loop 57: start
        string memory terminalPunctuation135 = unicode"\u0111C5";
        console2.log("0111C5: ", terminalPunctuation135);
        console2.logBytes(abi.encodePacked(terminalPunctuation135));
        // loop 57: end
        string memory terminalPunctuation136 = unicode"\u0111C6";
        console2.log("0111C6: ", terminalPunctuation136);
        console2.logBytes(abi.encodePacked(terminalPunctuation136));
        // loop 58: start
        string memory terminalPunctuation137 = unicode"\u0111DE";
        console2.log("0111DE: ", terminalPunctuation137);
        console2.logBytes(abi.encodePacked(terminalPunctuation137));
        // loop 58: end
        string memory terminalPunctuation138 = unicode"\u0111DF";
        console2.log("0111DF: ", terminalPunctuation138);
        console2.logBytes(abi.encodePacked(terminalPunctuation138));
        // loop 59: start
        string memory terminalPunctuation139 = unicode"\u011238";
        console2.log("011238: ", terminalPunctuation139);
        console2.logBytes(abi.encodePacked(terminalPunctuation139));
        // loop 59: end
        string memory terminalPunctuation140 = unicode"\u01123C";
        console2.log("01123C: ", terminalPunctuation140);
        console2.logBytes(abi.encodePacked(terminalPunctuation140));
        string memory terminalPunctuation141 = unicode"\u0112A9";
        console2.log("0112A9: ", terminalPunctuation141);
        console2.logBytes(abi.encodePacked(terminalPunctuation141));
        // loop 60: start
        string memory terminalPunctuation142 = unicode"\u0113D4";
        console2.log("0113D4: ", terminalPunctuation142);
        console2.logBytes(abi.encodePacked(terminalPunctuation142));
        // loop 61: end
        string memory terminalPunctuation143 = unicode"\u0113D5";
        console2.log("0113D5: ", terminalPunctuation143);
        console2.logBytes(abi.encodePacked(terminalPunctuation143));
        // loop 62: start
        string memory terminalPunctuation144 = unicode"\u01144B";
        console2.log("01144B: ", terminalPunctuation144);
        console2.logBytes(abi.encodePacked(terminalPunctuation144));
        // loop 62: end
        string memory terminalPunctuation145 = unicode"\u01144D";
        console2.log("01144D: ", terminalPunctuation145);
        console2.logBytes(abi.encodePacked(terminalPunctuation145));
        // loop 63: start
        string memory terminalPunctuation146 = unicode"\u01145A";
        console2.log("01145A: ", terminalPunctuation146);
        console2.logBytes(abi.encodePacked(terminalPunctuation146));
        // loop 63: end
        string memory terminalPunctuation147 = unicode"\u01145B";
        console2.log("01145B: ", terminalPunctuation147);
        console2.logBytes(abi.encodePacked(terminalPunctuation147));
        // loop 64: start
        string memory terminalPunctuation148 = unicode"\u0115C2";
        console2.log("0115C2: ", terminalPunctuation148);
        console2.logBytes(abi.encodePacked(terminalPunctuation148));
        // loop 64: end
        string memory terminalPunctuation149 = unicode"\u0115C5";
        console2.log("0115C5: ", terminalPunctuation149);
        console2.logBytes(abi.encodePacked(terminalPunctuation149));
        // loop 65: start
        string memory terminalPunctuation150 = unicode"\u0115C9";
        console2.log("0115C9: ", terminalPunctuation150);
        console2.logBytes(abi.encodePacked(terminalPunctuation150));
        // loop 66: end
        string memory terminalPunctuation151 = unicode"\u0115D7";
        console2.log("0115D7: ", terminalPunctuation151);
        console2.logBytes(abi.encodePacked(terminalPunctuation151));
        // loop 67: start
        string memory terminalPunctuation152 = unicode"\u011641";
        console2.log("011641: ", terminalPunctuation152);
        console2.logBytes(abi.encodePacked(terminalPunctuation152));
        // loop 67: end
        string memory terminalPunctuation153 = unicode"\u011642";
        console2.log("011642: ", terminalPunctuation153);
        console2.logBytes(abi.encodePacked(terminalPunctuation153));
        // loop 68: start
        string memory terminalPunctuation154 = unicode"\u01173C";
        console2.log("01173C: ", terminalPunctuation154);
        console2.logBytes(abi.encodePacked(terminalPunctuation154));
        // loop 68: end
        string memory terminalPunctuation155 = unicode"\u01173E";
        console2.log("01173E: ", terminalPunctuation155);
        console2.logBytes(abi.encodePacked(terminalPunctuation155));
        string memory terminalPunctuation156 = unicode"\u011946";
        console2.log("011946: ", terminalPunctuation156);
        console2.logBytes(abi.encodePacked(terminalPunctuation156));
        // loop 69: start
        string memory terminalPunctuation157 = unicode"\u011A42";
        console2.log("011A42: ", terminalPunctuation157);
        console2.logBytes(abi.encodePacked(terminalPunctuation157));
        // loop 69: end
        string memory terminalPunctuation158 = unicode"\u011A43";
        console2.log("011A43: ", terminalPunctuation158);
        console2.logBytes(abi.encodePacked(terminalPunctuation158));
        // loop 70: start
        string memory terminalPunctuation159 = unicode"\u011A9B";
        console2.log("011A9B: ", terminalPunctuation159);
        console2.logBytes(abi.encodePacked(terminalPunctuation159));
        // loop 70: end
        string memory terminalPunctuation160 = unicode"\u011A9C";
        console2.log("011A9C: ", terminalPunctuation160);
        console2.logBytes(abi.encodePacked(terminalPunctuation160));
        // loop 71: start
        string memory terminalPunctuation161 = unicode"\u011AA1";
        console2.log("011AA1: ", terminalPunctuation161);
        console2.logBytes(abi.encodePacked(terminalPunctuation161));
        // loop 71: end
        string memory terminalPunctuation162 = unicode"\u011AA2";
        console2.log("011AA2: ", terminalPunctuation162);
        console2.logBytes(abi.encodePacked(terminalPunctuation162));
        // loop 72: start
        string memory terminalPunctuation163 = unicode"\u011C41";
        console2.log("011C41: ", terminalPunctuation163);
        console2.logBytes(abi.encodePacked(terminalPunctuation163));
        // loop 72: end
        string memory terminalPunctuation164 = unicode"\u011C43";
        console2.log("011C43: ", terminalPunctuation164);
        console2.logBytes(abi.encodePacked(terminalPunctuation164));
        string memory terminalPunctuation165 = unicode"\u011C71";
        console2.log("011C71: ", terminalPunctuation165);
        console2.logBytes(abi.encodePacked(terminalPunctuation165));
        // loop 73: start
        string memory terminalPunctuation166 = unicode"\u011EF7";
        console2.log("011EF7: ", terminalPunctuation166);
        console2.logBytes(abi.encodePacked(terminalPunctuation166));
        // loop 73: end
        string memory terminalPunctuation167 = unicode"\u011EF8";
        console2.log("011EF8: ", terminalPunctuation167);
        console2.logBytes(abi.encodePacked(terminalPunctuation167));
        // loop 74: start
        string memory terminalPunctuation168 = unicode"\u011F43";
        console2.log("011F43: ", terminalPunctuation168);
        console2.logBytes(abi.encodePacked(terminalPunctuation168));
        // loop 74: end
        string memory terminalPunctuation169 = unicode"\u011F44";
        console2.log("011F44: ", terminalPunctuation169);
        console2.logBytes(abi.encodePacked(terminalPunctuation169));
        // loop 75: start
        string memory terminalPunctuation170 = unicode"\u012470";
        console2.log("012470: ", terminalPunctuation170);
        console2.logBytes(abi.encodePacked(terminalPunctuation170));
        // loop 75: end
        string memory terminalPunctuation171 = unicode"\u012474";
        console2.log("012474: ", terminalPunctuation171);
        console2.logBytes(abi.encodePacked(terminalPunctuation171));
        // loop 76: start
        string memory terminalPunctuation172 = unicode"\u016A6E";
        console2.log("016A6E: ", terminalPunctuation172);
        console2.logBytes(abi.encodePacked(terminalPunctuation172));
        // loop 76: end
        string memory terminalPunctuation173 = unicode"\u016A6F";
        console2.log("016A6F: ", terminalPunctuation173);
        console2.logBytes(abi.encodePacked(terminalPunctuation173));
        string memory terminalPunctuation174 = unicode"\u016AF5";
        console2.log("016AF5: ", terminalPunctuation174);
        console2.logBytes(abi.encodePacked(terminalPunctuation174));
        // loop 77: start
        string memory terminalPunctuation175 = unicode"\u016B37";
        console2.log("016B37: ", terminalPunctuation175);
        console2.logBytes(abi.encodePacked(terminalPunctuation175));
        // loop 77: end
        string memory terminalPunctuation176 = unicode"\u016B39";
        console2.log("016B39: ", terminalPunctuation176);
        console2.logBytes(abi.encodePacked(terminalPunctuation176));
        string memory terminalPunctuation177 = unicode"\u016B44";
        console2.log("016B44: ", terminalPunctuation177);
        console2.logBytes(abi.encodePacked(terminalPunctuation177));
        // loop 78: start
        string memory terminalPunctuation178 = unicode"\u016D6E";
        console2.log("016D6E: ", terminalPunctuation178);
        console2.logBytes(abi.encodePacked(terminalPunctuation178));
        // loop 78: end
        string memory terminalPunctuation179 = unicode"\u016D6F";
        console2.log("016D6F: ", terminalPunctuation179);
        console2.logBytes(abi.encodePacked(terminalPunctuation179));
        // loop 79: start
        string memory terminalPunctuation180 = unicode"\u016E97";
        console2.log("016E97: ", terminalPunctuation180);
        console2.logBytes(abi.encodePacked(terminalPunctuation180));
        // loop 79: end
        string memory terminalPunctuation181 = unicode"\u016E98";
        console2.log("016E98: ", terminalPunctuation181);
        console2.logBytes(abi.encodePacked(terminalPunctuation181));
        string memory terminalPunctuation182 = unicode"\u01BC9F";
        console2.log("01BC9F: ", terminalPunctuation182);
        console2.logBytes(abi.encodePacked(terminalPunctuation182));
        // loop 80: start
        string memory terminalPunctuation183 = unicode"\u01DA87";
        console2.log("01DA87: ", terminalPunctuation183);
        console2.logBytes(abi.encodePacked(terminalPunctuation183));
        // loop 80: end
        string memory terminalPunctuation184 = unicode"\u01DA8A";
        console2.log("01DA8A: ", terminalPunctuation184);
        console2.logBytes(abi.encodePacked(terminalPunctuation184));
        string memory terminalPunctuation185 = unicode"\u2024";
        console2.log("2024: ", terminalPunctuation185);
        console2.logBytes(abi.encodePacked(terminalPunctuation185));
        string memory terminalPunctuation186 = unicode"\u0111CD";
        console2.log("0111CD: ", terminalPunctuation186);
        console2.logBytes(abi.encodePacked(terminalPunctuation186));
        string memory terminalPunctuation187 = unicode"\u011944";
        console2.log("011944: ", terminalPunctuation187);
        console2.logBytes(abi.encodePacked(terminalPunctuation187));
        string memory terminalPunctuation188 = unicode"\u085E";
        console2.log("085E: ", terminalPunctuation188);
        console2.logBytes(abi.encodePacked(terminalPunctuation188));

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
