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
        bytes memory utf8OtherMath75 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherMath75));
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

    function testRegexPropertyOtherAlphabetic() public pure {
        string memory otherAlphabetic = "\\u{0345}";
        bytes memory utf8OtherAlphabetic = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic));
        console2.log("0345: ", string(utf8OtherAlphabetic));
        console2.logBytes(utf8OtherAlphabetic);

        string memory otherAlphabetic2 = "\\u{0363}";
        bytes memory utf8OtherAlphabetic2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic2));
        console2.log("0363: ", string(utf8OtherAlphabetic2));
        console2.logBytes(utf8OtherAlphabetic2);

        string memory otherAlphabetic3 = "\\u{036F}";
        bytes memory utf8OtherAlphabetic3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic3));
        console2.log("036F: ", string(utf8OtherAlphabetic3));
        console2.logBytes(utf8OtherAlphabetic3);

        string memory otherAlphabetic4 = "\\u{05B0}";
        bytes memory utf8OtherAlphabetic4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic4));
        console2.log("05B0: ", string(utf8OtherAlphabetic4));
        console2.logBytes(utf8OtherAlphabetic4);

        string memory otherAlphabetic5 = "\\u{05BD}";
        bytes memory utf8OtherAlphabetic5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic5));
        console2.log("05BD: ", string(utf8OtherAlphabetic5));
        console2.logBytes(utf8OtherAlphabetic5);

        string memory otherAlphabetic6 = "\\u{05BF}";
        bytes memory utf8OtherAlphabetic6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic6));
        console2.log("05BF: ", string(utf8OtherAlphabetic6));
        console2.logBytes(utf8OtherAlphabetic6);

        string memory otherAlphabetic7 = "\\u{05C1}";
        bytes memory utf8OtherAlphabetic7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic7));
        console2.log("05C1: ", string(utf8OtherAlphabetic7));
        console2.logBytes(utf8OtherAlphabetic7);

        string memory otherAlphabetic8 = "\\u{05C2}";
        bytes memory utf8OtherAlphabetic8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic8));
        console2.log("05C2: ", string(utf8OtherAlphabetic8));
        console2.logBytes(utf8OtherAlphabetic8);

        string memory otherAlphabetic9 = "\\u{05C4}";
        bytes memory utf8OtherAlphabetic9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic9));
        console2.log("05C4: ", string(utf8OtherAlphabetic9));
        console2.logBytes(utf8OtherAlphabetic9);

        string memory otherAlphabetic10 = "\\u{05C5}";
        bytes memory utf8OtherAlphabetic10 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic10));
        console2.log("05C5: ", string(utf8OtherAlphabetic10));
        console2.logBytes(utf8OtherAlphabetic10);

        string memory otherAlphabetic11 = "\\u{05C7}";
        bytes memory utf8OtherAlphabetic11 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic11));
        console2.log("05C7: ", string(utf8OtherAlphabetic11));
        console2.logBytes(utf8OtherAlphabetic11);

        string memory otherAlphabetic12 = "\\u{0610}";
        bytes memory utf8OtherAlphabetic12 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic12));
        console2.log("0610: ", string(utf8OtherAlphabetic12));
        console2.logBytes(utf8OtherAlphabetic12);

        string memory otherAlphabetic13 = "\\u{061A}";
        bytes memory utf8OtherAlphabetic13 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic13));
        console2.log("061A: ", string(utf8OtherAlphabetic13));
        console2.logBytes(utf8OtherAlphabetic13);

        string memory otherAlphabetic14 = "\\u{064B}";
        bytes memory utf8OtherAlphabetic14 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic14));
        console2.log("064B: ", string(utf8OtherAlphabetic14));
        console2.logBytes(utf8OtherAlphabetic14);

        string memory otherAlphabetic15 = "\\u{0657}";
        bytes memory utf8OtherAlphabetic15 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic15));
        console2.log("0657: ", string(utf8OtherAlphabetic15));
        console2.logBytes(utf8OtherAlphabetic15);

        string memory otherAlphabetic16 = "\\u{0659}";
        bytes memory utf8OtherAlphabetic16 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic16));
        console2.log("0659: ", string(utf8OtherAlphabetic16));
        console2.logBytes(utf8OtherAlphabetic16);

        string memory otherAlphabetic17 = "\\u{065F}";
        bytes memory utf8OtherAlphabetic17 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic17));
        console2.log("065F: ", string(utf8OtherAlphabetic17));
        console2.logBytes(utf8OtherAlphabetic17);

        string memory otherAlphabetic18 = "\\u{0670}";
        bytes memory utf8OtherAlphabetic18 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic18));
        console2.log("0670: ", string(utf8OtherAlphabetic18));
        console2.logBytes(utf8OtherAlphabetic18);

        string memory otherAlphabetic19 = "\\u{06D6}";
        bytes memory utf8OtherAlphabetic19 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic19));
        console2.log("06D6: ", string(utf8OtherAlphabetic19));
        console2.logBytes(utf8OtherAlphabetic19);

        string memory otherAlphabetic20 = "\\u{06DC}";
        bytes memory utf8OtherAlphabetic20 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic20));
        console2.log("06DC: ", string(utf8OtherAlphabetic20));
        console2.logBytes(utf8OtherAlphabetic20);

        string memory otherAlphabetic21 = "\\u{06E1}";
        bytes memory utf8OtherAlphabetic21 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic21));
        console2.log("06E1: ", string(utf8OtherAlphabetic21));
        console2.logBytes(utf8OtherAlphabetic21);

        string memory otherAlphabetic22 = "\\u{06E4}";
        bytes memory utf8OtherAlphabetic22 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic22));
        console2.log("06E4: ", string(utf8OtherAlphabetic22));
        console2.logBytes(utf8OtherAlphabetic22);

        string memory otherAlphabetic23 = "\\u{06E7}";
        bytes memory utf8OtherAlphabetic23 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic23));
        console2.log("06E7: ", string(utf8OtherAlphabetic23));
        console2.logBytes(utf8OtherAlphabetic23);

        string memory otherAlphabetic24 = "\\u{06E8}";
        bytes memory utf8OtherAlphabetic24 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic24));
        console2.log("06E8: ", string(utf8OtherAlphabetic24));
        console2.logBytes(utf8OtherAlphabetic24);

        string memory otherAlphabetic25 = "\\u{06ED}";
        bytes memory utf8OtherAlphabetic25 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic25));
        console2.log("06ED: ", string(utf8OtherAlphabetic25));
        console2.logBytes(utf8OtherAlphabetic25);

        string memory otherAlphabetic26 = "\\u{0711}";
        bytes memory utf8OtherAlphabetic26 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic26));
        console2.log("0711: ", string(utf8OtherAlphabetic26));
        console2.logBytes(utf8OtherAlphabetic26);

        string memory otherAlphabetic27 = "\\u{0730}";
        bytes memory utf8OtherAlphabetic27 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic27));
        console2.log("0730: ", string(utf8OtherAlphabetic27));
        console2.logBytes(utf8OtherAlphabetic27);

        string memory otherAlphabetic28 = "\\u{073F}";
        bytes memory utf8OtherAlphabetic28 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic28));
        console2.log("073F: ", string(utf8OtherAlphabetic28));
        console2.logBytes(utf8OtherAlphabetic28);

        string memory otherAlphabetic29 = "\\u{07A6}";
        bytes memory utf8OtherAlphabetic29 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic29));
        console2.log("07A6: ", string(utf8OtherAlphabetic29));
        console2.logBytes(utf8OtherAlphabetic29);

        string memory otherAlphabetic30 = "\\u{07B0}";
        bytes memory utf8OtherAlphabetic30 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic30));
        console2.log("07B0: ", string(utf8OtherAlphabetic30));
        console2.logBytes(utf8OtherAlphabetic30);

        string memory otherAlphabetic31 = "\\u{0816}";
        bytes memory utf8OtherAlphabetic31 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic31));
        console2.log("0816: ", string(utf8OtherAlphabetic31));
        console2.logBytes(utf8OtherAlphabetic31);

        string memory otherAlphabetic32 = "\\u{0817}";
        bytes memory utf8OtherAlphabetic32 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic32));
        console2.log("0817: ", string(utf8OtherAlphabetic32));
        console2.logBytes(utf8OtherAlphabetic32);

        string memory otherAlphabetic33 = "\\u{081B}";
        bytes memory utf8OtherAlphabetic33 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic33));
        console2.log("081B: ", string(utf8OtherAlphabetic33));
        console2.logBytes(utf8OtherAlphabetic33);

        string memory otherAlphabetic34 = "\\u{0823}";
        bytes memory utf8OtherAlphabetic34 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic34));
        console2.log("0823: ", string(utf8OtherAlphabetic34));
        console2.logBytes(utf8OtherAlphabetic34);

        string memory otherAlphabetic35 = "\\u{0825}";
        bytes memory utf8OtherAlphabetic35 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic35));
        console2.log("0825: ", string(utf8OtherAlphabetic35));
        console2.logBytes(utf8OtherAlphabetic35);

        string memory otherAlphabetic36 = "\\u{0827}";
        bytes memory utf8OtherAlphabetic36 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic36));
        console2.log("0827: ", string(utf8OtherAlphabetic36));
        console2.logBytes(utf8OtherAlphabetic36);

        string memory otherAlphabetic37 = "\\u{0829}";
        bytes memory utf8OtherAlphabetic37 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic37));
        console2.log("0829: ", string(utf8OtherAlphabetic37));
        console2.logBytes(utf8OtherAlphabetic37);

        string memory otherAlphabetic38 = "\\u{082C}";
        bytes memory utf8OtherAlphabetic38 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic38));
        console2.log("082C: ", string(utf8OtherAlphabetic38));
        console2.logBytes(utf8OtherAlphabetic38);

        string memory otherAlphabetic39 = "\\u{0897}";
        bytes memory utf8OtherAlphabetic39 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic39));
        console2.log("0897: ", string(utf8OtherAlphabetic39));
        console2.logBytes(utf8OtherAlphabetic39);

        string memory otherAlphabetic40 = "\\u{08D4}";
        bytes memory utf8OtherAlphabetic40 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic40));
        console2.log("08D4: ", string(utf8OtherAlphabetic40));
        console2.logBytes(utf8OtherAlphabetic40);

        string memory otherAlphabetic41 = "\\u{08DF}";
        bytes memory utf8OtherAlphabetic41 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic41));
        console2.log("08DF: ", string(utf8OtherAlphabetic41));
        console2.logBytes(utf8OtherAlphabetic41);

        string memory otherAlphabetic42 = "\\u{08E3}";
        bytes memory utf8OtherAlphabetic42 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic42));
        console2.log("08E3: ", string(utf8OtherAlphabetic42));
        console2.logBytes(utf8OtherAlphabetic42);

        string memory otherAlphabetic43 = "\\u{08E9}";
        bytes memory utf8OtherAlphabetic43 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic43));
        console2.log("08E9: ", string(utf8OtherAlphabetic43));
        console2.logBytes(utf8OtherAlphabetic43);

        string memory otherAlphabetic44 = "\\u{08F0}";
        bytes memory utf8OtherAlphabetic44 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic44));
        console2.log("08F0: ", string(utf8OtherAlphabetic44));
        console2.logBytes(utf8OtherAlphabetic44);

        string memory otherAlphabetic45 = "\\u{0902}";
        bytes memory utf8OtherAlphabetic45 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic45));
        console2.log("0902: ", string(utf8OtherAlphabetic45));
        console2.logBytes(utf8OtherAlphabetic45);

        string memory otherAlphabetic46 = "\\u{0903}";
        bytes memory utf8OtherAlphabetic46 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic46));
        console2.log("0903: ", string(utf8OtherAlphabetic46));
        console2.logBytes(utf8OtherAlphabetic46);

        string memory otherAlphabetic47 = "\\u{093A}";
        bytes memory utf8OtherAlphabetic47 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic47));
        console2.log("093A: ", string(utf8OtherAlphabetic47));
        console2.logBytes(utf8OtherAlphabetic47);

        string memory otherAlphabetic48 = "\\u{093B}";
        bytes memory utf8OtherAlphabetic48 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic48));
        console2.log("093B: ", string(utf8OtherAlphabetic48));
        console2.logBytes(utf8OtherAlphabetic48);

        string memory otherAlphabetic49 = "\\u{093E}";
        bytes memory utf8OtherAlphabetic49 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic49));
        console2.log("093E: ", string(utf8OtherAlphabetic49));
        console2.logBytes(utf8OtherAlphabetic49);

        string memory otherAlphabetic50 = "\\u{0940}";
        bytes memory utf8OtherAlphabetic50 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic50));
        console2.log("0940: ", string(utf8OtherAlphabetic50));
        console2.logBytes(utf8OtherAlphabetic50);

        string memory otherAlphabetic51 = "\\u{0941}";
        bytes memory utf8OtherAlphabetic51 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic51));
        console2.log("0941: ", string(utf8OtherAlphabetic51));
        console2.logBytes(utf8OtherAlphabetic51);

        string memory otherAlphabetic52 = "\\u{0948}";
        bytes memory utf8OtherAlphabetic52 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic52));
        console2.log("0948: ", string(utf8OtherAlphabetic52));
        console2.logBytes(utf8OtherAlphabetic52);

        string memory otherAlphabetic53 = "\\u{0949}";
        bytes memory utf8OtherAlphabetic53 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic53));
        console2.log("0949: ", string(utf8OtherAlphabetic53));
        console2.logBytes(utf8OtherAlphabetic53);

        string memory otherAlphabetic54 = "\\u{094C}";
        bytes memory utf8OtherAlphabetic54 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic54));
        console2.log("094C: ", string(utf8OtherAlphabetic54));
        console2.logBytes(utf8OtherAlphabetic54);

        string memory otherAlphabetic55 = "\\u{094E}";
        bytes memory utf8OtherAlphabetic55 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic55));
        console2.log("094E: ", string(utf8OtherAlphabetic55));
        console2.logBytes(utf8OtherAlphabetic55);

        string memory otherAlphabetic56 = "\\u{094F}";
        bytes memory utf8OtherAlphabetic56 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic56));
        console2.log("094F: ", string(utf8OtherAlphabetic56));
        console2.logBytes(utf8OtherAlphabetic56);

        string memory otherAlphabetic57 = "\\u{0955}";
        bytes memory utf8OtherAlphabetic57 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic57));
        console2.log("0955: ", string(utf8OtherAlphabetic57));
        console2.logBytes(utf8OtherAlphabetic57);

        string memory otherAlphabetic58 = "\\u{0957}";
        bytes memory utf8OtherAlphabetic58 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic58));
        console2.log("0957: ", string(utf8OtherAlphabetic58));
        console2.logBytes(utf8OtherAlphabetic58);

        string memory otherAlphabetic59 = "\\u{0962}";
        bytes memory utf8OtherAlphabetic59 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic59));
        console2.log("0962: ", string(utf8OtherAlphabetic59));
        console2.logBytes(utf8OtherAlphabetic59);

        string memory otherAlphabetic60 = "\\u{0963}";
        bytes memory utf8OtherAlphabetic60 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic60));
        console2.log("0963: ", string(utf8OtherAlphabetic60));
        console2.logBytes(utf8OtherAlphabetic60);

        string memory otherAlphabetic61 = "\\u{0981}";
        bytes memory utf8OtherAlphabetic61 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic61));
        console2.log("0981: ", string(utf8OtherAlphabetic61));
        console2.logBytes(utf8OtherAlphabetic61);

        string memory otherAlphabetic62 = "\\u{0982}";
        bytes memory utf8OtherAlphabetic62 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic62));
        console2.log("0982: ", string(utf8OtherAlphabetic62));
        console2.logBytes(utf8OtherAlphabetic62);

        string memory otherAlphabetic63 = "\\u{0983}";
        bytes memory utf8OtherAlphabetic63 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic63));
        console2.log("0983: ", string(utf8OtherAlphabetic63));
        console2.logBytes(utf8OtherAlphabetic63);

        string memory otherAlphabetic64 = "\\u{09BE}";
        bytes memory utf8OtherAlphabetic64 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic64));
        console2.log("09BE: ", string(utf8OtherAlphabetic64));
        console2.logBytes(utf8OtherAlphabetic64);

        string memory otherAlphabetic65 = "\\u{09C0}";
        bytes memory utf8OtherAlphabetic65 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic65));
        console2.log("09C0: ", string(utf8OtherAlphabetic65));
        console2.logBytes(utf8OtherAlphabetic65);

        string memory otherAlphabetic66 = "\\u{09C1}";
        bytes memory utf8OtherAlphabetic66 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic66));
        console2.log("09C1: ", string(utf8OtherAlphabetic66));
        console2.logBytes(utf8OtherAlphabetic66);

        string memory otherAlphabetic67 = "\\u{09C4}";
        bytes memory utf8OtherAlphabetic67 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic67));
        console2.log("09C4: ", string(utf8OtherAlphabetic67));
        console2.logBytes(utf8OtherAlphabetic67);

        string memory otherAlphabetic68 = "\\u{09C7}";
        bytes memory utf8OtherAlphabetic68 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic68));
        console2.log("09C7: ", string(utf8OtherAlphabetic68));
        console2.logBytes(utf8OtherAlphabetic68);

        string memory otherAlphabetic69 = "\\u{09C8}";
        bytes memory utf8OtherAlphabetic69 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic69));
        console2.log("09C8: ", string(utf8OtherAlphabetic69));
        console2.logBytes(utf8OtherAlphabetic69);

        string memory otherAlphabetic70 = "\\u{09CB}";
        bytes memory utf8OtherAlphabetic70 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic70));
        console2.log("09CB: ", string(utf8OtherAlphabetic70));
        console2.logBytes(utf8OtherAlphabetic70);

        string memory otherAlphabetic71 = "\\u{09CC}";
        bytes memory utf8OtherAlphabetic71 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic71));
        console2.log("09CC: ", string(utf8OtherAlphabetic71));
        console2.logBytes(utf8OtherAlphabetic71);

        string memory otherAlphabetic72 = "\\u{09D7}";
        bytes memory utf8OtherAlphabetic72 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic72));
        console2.log("09D7: ", string(utf8OtherAlphabetic72));
        console2.logBytes(utf8OtherAlphabetic72);

        string memory otherAlphabetic73 = "\\u{09E2}";
        bytes memory utf8OtherAlphabetic73 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic73));
        console2.log("09E2: ", string(utf8OtherAlphabetic73));
        console2.logBytes(utf8OtherAlphabetic73);

        string memory otherAlphabetic74 = "\\u{09E3}";
        bytes memory utf8OtherAlphabetic74 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic74));
        console2.log("09E3: ", string(utf8OtherAlphabetic74));
        console2.logBytes(utf8OtherAlphabetic74);

        string memory otherAlphabetic75 = "\\u{0A01}";
        bytes memory utf8OtherAlphabetic75 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic75));
        console2.log("0A01: ", string(utf8OtherAlphabetic75));
        console2.logBytes(utf8OtherAlphabetic75);

        string memory otherAlphabetic76 = "\\u{0A02}";
        bytes memory utf8OtherAlphabetic76 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic76));
        console2.log("0A02: ", string(utf8OtherAlphabetic76));
        console2.logBytes(utf8OtherAlphabetic76);

        string memory otherAlphabetic77 = "\\u{0A03}";
        bytes memory utf8OtherAlphabetic77 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic77));
        console2.log("0A03: ", string(utf8OtherAlphabetic77));
        console2.logBytes(utf8OtherAlphabetic77);

        string memory otherAlphabetic78 = "\\u{0A3E}";
        bytes memory utf8OtherAlphabetic78 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic78));
        console2.log("0A3E: ", string(utf8OtherAlphabetic78));
        console2.logBytes(utf8OtherAlphabetic78);

        string memory otherAlphabetic79 = "\\u{0A40}";
        bytes memory utf8OtherAlphabetic79 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic79));
        console2.log("0A40: ", string(utf8OtherAlphabetic79));
        console2.logBytes(utf8OtherAlphabetic79);

        string memory otherAlphabetic80 = "\\u{0A41}";
        bytes memory utf8OtherAlphabetic80 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic80));
        console2.log("0A41: ", string(utf8OtherAlphabetic80));
        console2.logBytes(utf8OtherAlphabetic80);

        string memory otherAlphabetic81 = "\\u{0A42}";
        bytes memory utf8OtherAlphabetic81 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic81));
        console2.log("0A42: ", string(utf8OtherAlphabetic81));
        console2.logBytes(utf8OtherAlphabetic81);

        string memory otherAlphabetic82 = "\\u{0A47}";
        bytes memory utf8OtherAlphabetic82 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic82));
        console2.log("0A47: ", string(utf8OtherAlphabetic82));
        console2.logBytes(utf8OtherAlphabetic82);

        string memory otherAlphabetic83 = "\\u{0A48}";
        bytes memory utf8OtherAlphabetic83 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic83));
        console2.log("0A48: ", string(utf8OtherAlphabetic83));
        console2.logBytes(utf8OtherAlphabetic83);

        string memory otherAlphabetic84 = "\\u{0A4B}";
        bytes memory utf8OtherAlphabetic84 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic84));
        console2.log("0A4B: ", string(utf8OtherAlphabetic84));
        console2.logBytes(utf8OtherAlphabetic84);

        string memory otherAlphabetic85 = "\\u{0A4C}";
        bytes memory utf8OtherAlphabetic85 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic85));
        console2.log("0A4C: ", string(utf8OtherAlphabetic85));
        console2.logBytes(utf8OtherAlphabetic85);

        string memory otherAlphabetic86 = "\\u{0A51}";
        bytes memory utf8OtherAlphabetic86 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic86));
        console2.log("0A51: ", string(utf8OtherAlphabetic86));
        console2.logBytes(utf8OtherAlphabetic86);

        string memory otherAlphabetic87 = "\\u{0A70}";
        bytes memory utf8OtherAlphabetic87 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic87));
        console2.log("0A70: ", string(utf8OtherAlphabetic87));
        console2.logBytes(utf8OtherAlphabetic87);

        string memory otherAlphabetic88 = "\\u{0A71}";
        bytes memory utf8OtherAlphabetic88 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic88));
        console2.log("0A71: ", string(utf8OtherAlphabetic88));
        console2.logBytes(utf8OtherAlphabetic88);

        string memory otherAlphabetic89 = "\\u{0A75}";
        bytes memory utf8OtherAlphabetic89 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic89));
        console2.log("0A75: ", string(utf8OtherAlphabetic89));
        console2.logBytes(utf8OtherAlphabetic89);

        string memory otherAlphabetic90 = "\\u{0A81}";
        bytes memory utf8OtherAlphabetic90 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic90));
        console2.log("0A81: ", string(utf8OtherAlphabetic90));
        console2.logBytes(utf8OtherAlphabetic90);

        string memory otherAlphabetic91 = "\\u{0A82}";
        bytes memory utf8OtherAlphabetic91 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic91));
        console2.log("0A82: ", string(utf8OtherAlphabetic91));
        console2.logBytes(utf8OtherAlphabetic91);

        string memory otherAlphabetic92 = "\\u{0A83}";
        bytes memory utf8OtherAlphabetic92 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic92));
        console2.log("0A83: ", string(utf8OtherAlphabetic92));
        console2.logBytes(utf8OtherAlphabetic92);

        string memory otherAlphabetic93 = "\\u{0ABE}";
        bytes memory utf8OtherAlphabetic93 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic93));
        console2.log("0ABE: ", string(utf8OtherAlphabetic93));
        console2.logBytes(utf8OtherAlphabetic93);

        string memory otherAlphabetic94 = "\\u{0AC0}";
        bytes memory utf8OtherAlphabetic94 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic94));
        console2.log("0AC0: ", string(utf8OtherAlphabetic94));
        console2.logBytes(utf8OtherAlphabetic94);

        string memory otherAlphabetic95 = "\\u{0AC1}";
        bytes memory utf8OtherAlphabetic95 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic95));
        console2.log("0AC1: ", string(utf8OtherAlphabetic95));
        console2.logBytes(utf8OtherAlphabetic95);

        string memory otherAlphabetic96 = "\\u{0AC5}";
        bytes memory utf8OtherAlphabetic96 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic96));
        console2.log("0AC5: ", string(utf8OtherAlphabetic96));
        console2.logBytes(utf8OtherAlphabetic96);

        string memory otherAlphabetic97 = "\\u{0AC7}";
        bytes memory utf8OtherAlphabetic97 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic97));
        console2.log("0AC7: ", string(utf8OtherAlphabetic97));
        console2.logBytes(utf8OtherAlphabetic97);

        string memory otherAlphabetic98 = "\\u{0AC8}";
        bytes memory utf8OtherAlphabetic98 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic98));
        console2.log("0AC8: ", string(utf8OtherAlphabetic98));
        console2.logBytes(utf8OtherAlphabetic98);

        string memory otherAlphabetic99 = "\\u{0AC9}";
        bytes memory utf8OtherAlphabetic99 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic99));
        console2.log("0AC9: ", string(utf8OtherAlphabetic99));
        console2.logBytes(utf8OtherAlphabetic99);

        string memory otherAlphabetic100 = "\\u{0ACB}";
        bytes memory utf8OtherAlphabetic100 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic100));
        console2.log("0ACB: ", string(utf8OtherAlphabetic100));
        console2.logBytes(utf8OtherAlphabetic100);

        string memory otherAlphabetic101 = "\\u{0ACC}";
        bytes memory utf8OtherAlphabetic101 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic101));
        console2.log("0ACC: ", string(utf8OtherAlphabetic101));
        console2.logBytes(utf8OtherAlphabetic101);

        string memory otherAlphabetic102 = "\\u{0AE2}";
        bytes memory utf8OtherAlphabetic102 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic102));
        console2.log("0AE2: ", string(utf8OtherAlphabetic102));
        console2.logBytes(utf8OtherAlphabetic102);

        string memory otherAlphabetic103 = "\\u{0AE3}";
        bytes memory utf8OtherAlphabetic103 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic103));
        console2.log("0AE3: ", string(utf8OtherAlphabetic103));
        console2.logBytes(utf8OtherAlphabetic103);

        string memory otherAlphabetic104 = "\\u{0AFA}";
        bytes memory utf8OtherAlphabetic104 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic104));
        console2.log("0AFA: ", string(utf8OtherAlphabetic104));
        console2.logBytes(utf8OtherAlphabetic104);

        string memory otherAlphabetic105 = "\\u{0AFC}";
        bytes memory utf8OtherAlphabetic105 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic105));
        console2.log("0AFC: ", string(utf8OtherAlphabetic105));
        console2.logBytes(utf8OtherAlphabetic105);

        string memory otherAlphabetic106 = "\\u{0B01}";
        bytes memory utf8OtherAlphabetic106 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic106));
        console2.log("0B01: ", string(utf8OtherAlphabetic106));
        console2.logBytes(utf8OtherAlphabetic106);

        string memory otherAlphabetic107 = "\\u{0B02}";
        bytes memory utf8OtherAlphabetic107 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic107));
        console2.log("0B02: ", string(utf8OtherAlphabetic107));
        console2.logBytes(utf8OtherAlphabetic107);

        string memory otherAlphabetic108 = "\\u{0B03}";
        bytes memory utf8OtherAlphabetic108 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic108));
        console2.log("0B03: ", string(utf8OtherAlphabetic108));
        console2.logBytes(utf8OtherAlphabetic108);

        string memory otherAlphabetic109 = "\\u{0B3E}";
        bytes memory utf8OtherAlphabetic109 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic109));
        console2.log("0B3E: ", string(utf8OtherAlphabetic109));
        console2.logBytes(utf8OtherAlphabetic109);

        string memory otherAlphabetic110 = "\\u{0B3F}";
        bytes memory utf8OtherAlphabetic110 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic110));
        console2.log("0B3F: ", string(utf8OtherAlphabetic110));
        console2.logBytes(utf8OtherAlphabetic110);

        string memory otherAlphabetic111 = "\\u{0B40}";
        bytes memory utf8OtherAlphabetic111 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic111));
        console2.log("0B40: ", string(utf8OtherAlphabetic111));
        console2.logBytes(utf8OtherAlphabetic111);

        string memory otherAlphabetic112 = "\\u{0B41}";
        bytes memory utf8OtherAlphabetic112 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic112));
        console2.log("0B41: ", string(utf8OtherAlphabetic112));
        console2.logBytes(utf8OtherAlphabetic112);

        string memory otherAlphabetic113 = "\\u{0B44}";
        bytes memory utf8OtherAlphabetic113 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic113));
        console2.log("0B44: ", string(utf8OtherAlphabetic113));
        console2.logBytes(utf8OtherAlphabetic113);

        string memory otherAlphabetic114 = "\\u{0B47}";
        bytes memory utf8OtherAlphabetic114 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic114));
        console2.log("0B47: ", string(utf8OtherAlphabetic114));
        console2.logBytes(utf8OtherAlphabetic114);

        string memory otherAlphabetic115 = "\\u{0B48}";
        bytes memory utf8OtherAlphabetic115 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic115));
        console2.log("0B48: ", string(utf8OtherAlphabetic115));
        console2.logBytes(utf8OtherAlphabetic115);

        string memory otherAlphabetic116 = "\\u{0B4B}";
        bytes memory utf8OtherAlphabetic116 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic116));
        console2.log("0B4B: ", string(utf8OtherAlphabetic116));
        console2.logBytes(utf8OtherAlphabetic116);

        string memory otherAlphabetic117 = "\\u{0B4C}";
        bytes memory utf8OtherAlphabetic117 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic117));
        console2.log("0B4C: ", string(utf8OtherAlphabetic117));
        console2.logBytes(utf8OtherAlphabetic117);

        string memory otherAlphabetic118 = "\\u{0B56}";
        bytes memory utf8OtherAlphabetic118 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic118));
        console2.log("0B56: ", string(utf8OtherAlphabetic118));
        console2.logBytes(utf8OtherAlphabetic118);

        string memory otherAlphabetic119 = "\\u{0B57}";
        bytes memory utf8OtherAlphabetic119 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic119));
        console2.log("0B57: ", string(utf8OtherAlphabetic119));
        console2.logBytes(utf8OtherAlphabetic119);

        string memory otherAlphabetic120 = "\\u{0B62}";
        bytes memory utf8OtherAlphabetic120 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic120));
        console2.log("0B62: ", string(utf8OtherAlphabetic120));
        console2.logBytes(utf8OtherAlphabetic120);

        string memory otherAlphabetic121 = "\\u{0B63}";
        bytes memory utf8OtherAlphabetic121 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic121));
        console2.log("0B63: ", string(utf8OtherAlphabetic121));
        console2.logBytes(utf8OtherAlphabetic121);

        string memory otherAlphabetic122 = "\\u{0B82}";
        bytes memory utf8OtherAlphabetic122 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic122));
        console2.log("0B82: ", string(utf8OtherAlphabetic122));
        console2.logBytes(utf8OtherAlphabetic122);

        string memory otherAlphabetic123 = "\\u{0BBE}";
        bytes memory utf8OtherAlphabetic123 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic123));
        console2.log("0BBE: ", string(utf8OtherAlphabetic123));
        console2.logBytes(utf8OtherAlphabetic123);

        string memory otherAlphabetic124 = "\\u{0BBF}";
        bytes memory utf8OtherAlphabetic124 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic124));
        console2.log("0BBF: ", string(utf8OtherAlphabetic124));
        console2.logBytes(utf8OtherAlphabetic124);

        string memory otherAlphabetic125 = "\\u{0BC0}";
        bytes memory utf8OtherAlphabetic125 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic125));
        console2.log("0BC0: ", string(utf8OtherAlphabetic125));
        console2.logBytes(utf8OtherAlphabetic125);

        string memory otherAlphabetic126 = "\\u{0BC1}";
        bytes memory utf8OtherAlphabetic126 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic126));
        console2.log("0BC1: ", string(utf8OtherAlphabetic126));
        console2.logBytes(utf8OtherAlphabetic126);

        string memory otherAlphabetic127 = "\\u{0BC2}";
        bytes memory utf8OtherAlphabetic127 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic127));
        console2.log("0BC2: ", string(utf8OtherAlphabetic127));
        console2.logBytes(utf8OtherAlphabetic127);

        string memory otherAlphabetic128 = "\\u{0BC6}";
        bytes memory utf8OtherAlphabetic128 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic128));
        console2.log("0BC6: ", string(utf8OtherAlphabetic128));
        console2.logBytes(utf8OtherAlphabetic128);

        string memory otherAlphabetic129 = "\\u{0BC8}";
        bytes memory utf8OtherAlphabetic129 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic129));
        console2.log("0BC8: ", string(utf8OtherAlphabetic129));
        console2.logBytes(utf8OtherAlphabetic129);

        string memory otherAlphabetic130 = "\\u{0BCA}";
        bytes memory utf8OtherAlphabetic130 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic130));
        console2.log("0BCA: ", string(utf8OtherAlphabetic130));
        console2.logBytes(utf8OtherAlphabetic130);

        string memory otherAlphabetic131 = "\\u{0BCC}";
        bytes memory utf8OtherAlphabetic131 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic131));
        console2.log("0BCC: ", string(utf8OtherAlphabetic131));
        console2.logBytes(utf8OtherAlphabetic131);

        string memory otherAlphabetic132 = "\\u{0BD7}";
        bytes memory utf8OtherAlphabetic132 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic132));
        console2.log("0BD7: ", string(utf8OtherAlphabetic132));
        console2.logBytes(utf8OtherAlphabetic132);

        string memory otherAlphabetic133 = "\\u{0C00}";
        bytes memory utf8OtherAlphabetic133 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic133));
        console2.log("0C00: ", string(utf8OtherAlphabetic133));
        console2.logBytes(utf8OtherAlphabetic133);

        string memory otherAlphabetic134 = "\\u{0C01}";
        bytes memory utf8OtherAlphabetic134 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic134));
        console2.log("0C01: ", string(utf8OtherAlphabetic134));
        console2.logBytes(utf8OtherAlphabetic134);

        string memory otherAlphabetic135 = "\\u{0C03}";
        bytes memory utf8OtherAlphabetic135 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic135));
        console2.log("0C03: ", string(utf8OtherAlphabetic135));
        console2.logBytes(utf8OtherAlphabetic135);

        string memory otherAlphabetic136 = "\\u{0C04}";
        bytes memory utf8OtherAlphabetic136 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic136));
        console2.log("0C04: ", string(utf8OtherAlphabetic136));
        console2.logBytes(utf8OtherAlphabetic136);

        string memory otherAlphabetic137 = "\\u{0C3E}";
        bytes memory utf8OtherAlphabetic137 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic137));
        console2.log("0C3E: ", string(utf8OtherAlphabetic137));
        console2.logBytes(utf8OtherAlphabetic137);

        string memory otherAlphabetic138 = "\\u{0C40}";
        bytes memory utf8OtherAlphabetic138 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic138));
        console2.log("0C40: ", string(utf8OtherAlphabetic138));
        console2.logBytes(utf8OtherAlphabetic138);

        string memory otherAlphabetic139 = "\\u{0C41}";
        bytes memory utf8OtherAlphabetic139 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic139));
        console2.log("0C41: ", string(utf8OtherAlphabetic139));
        console2.logBytes(utf8OtherAlphabetic139);

        string memory otherAlphabetic140 = "\\u{0C44}";
        bytes memory utf8OtherAlphabetic140 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic140));
        console2.log("0C44: ", string(utf8OtherAlphabetic140));
        console2.logBytes(utf8OtherAlphabetic140);

        string memory otherAlphabetic141 = "\\u{0C46}";
        bytes memory utf8OtherAlphabetic141 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic141));
        console2.log("0C46: ", string(utf8OtherAlphabetic141));
        console2.logBytes(utf8OtherAlphabetic141);

        string memory otherAlphabetic142 = "\\u{0C48}";
        bytes memory utf8OtherAlphabetic142 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic142));
        console2.log("0C48: ", string(utf8OtherAlphabetic142));
        console2.logBytes(utf8OtherAlphabetic142);

        string memory otherAlphabetic143 = "\\u{0C4A}";
        bytes memory utf8OtherAlphabetic143 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic143));
        console2.log("0C4A: ", string(utf8OtherAlphabetic143));
        console2.logBytes(utf8OtherAlphabetic143);

        string memory otherAlphabetic144 = "\\u{0C4C}";
        bytes memory utf8OtherAlphabetic144 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic144));
        console2.log("0C4C: ", string(utf8OtherAlphabetic144));
        console2.logBytes(utf8OtherAlphabetic144);

        string memory otherAlphabetic145 = "\\u{0C55}";
        bytes memory utf8OtherAlphabetic145 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic145));
        console2.log("0C55: ", string(utf8OtherAlphabetic145));
        console2.logBytes(utf8OtherAlphabetic145);

        string memory otherAlphabetic146 = "\\u{0C56}";
        bytes memory utf8OtherAlphabetic146 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic146));
        console2.log("0C56: ", string(utf8OtherAlphabetic146));
        console2.logBytes(utf8OtherAlphabetic146);

        string memory otherAlphabetic147 = "\\u{0C62}";
        bytes memory utf8OtherAlphabetic147 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic147));
        console2.log("0C62: ", string(utf8OtherAlphabetic147));
        console2.logBytes(utf8OtherAlphabetic147);

        string memory otherAlphabetic148 = "\\u{0C63}";
        bytes memory utf8OtherAlphabetic148 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic148));
        console2.log("0C63: ", string(utf8OtherAlphabetic148));
        console2.logBytes(utf8OtherAlphabetic148);

        string memory otherAlphabetic149 = "\\u{0C81}";
        bytes memory utf8OtherAlphabetic149 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic149));
        console2.log("0C81: ", string(utf8OtherAlphabetic149));
        console2.logBytes(utf8OtherAlphabetic149);

        string memory otherAlphabetic150 = "\\u{0C82}";
        bytes memory utf8OtherAlphabetic150 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic150));
        console2.log("0C82: ", string(utf8OtherAlphabetic150));
        console2.logBytes(utf8OtherAlphabetic150);

        string memory otherAlphabetic151 = "\\u{0C83}";
        bytes memory utf8OtherAlphabetic151 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic151));
        console2.log("0C83: ", string(utf8OtherAlphabetic151));
        console2.logBytes(utf8OtherAlphabetic151);

        string memory otherAlphabetic152 = "\\u{0CBE}";
        bytes memory utf8OtherAlphabetic152 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic152));
        console2.log("0CBE: ", string(utf8OtherAlphabetic152));
        console2.logBytes(utf8OtherAlphabetic152);

        string memory otherAlphabetic153 = "\\u{0CBF}";
        bytes memory utf8OtherAlphabetic153 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic153));
        console2.log("0CBF: ", string(utf8OtherAlphabetic153));
        console2.logBytes(utf8OtherAlphabetic153);

        string memory otherAlphabetic154 = "\\u{0CC0}";
        bytes memory utf8OtherAlphabetic154 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic154));
        console2.log("0CC0: ", string(utf8OtherAlphabetic154));
        console2.logBytes(utf8OtherAlphabetic154);

        string memory otherAlphabetic155 = "\\u{0CC4}";
        bytes memory utf8OtherAlphabetic155 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic155));
        console2.log("0CC4: ", string(utf8OtherAlphabetic155));
        console2.logBytes(utf8OtherAlphabetic155);

        string memory otherAlphabetic156 = "\\u{0CC6}";
        bytes memory utf8OtherAlphabetic156 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic156));
        console2.log("0CC6: ", string(utf8OtherAlphabetic156));
        console2.logBytes(utf8OtherAlphabetic156);

        string memory otherAlphabetic157 = "\\u{0CC7}";
        bytes memory utf8OtherAlphabetic157 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic157));
        console2.log("0CC7: ", string(utf8OtherAlphabetic157));
        console2.logBytes(utf8OtherAlphabetic157);

        string memory otherAlphabetic158 = "\\u{0CC8}";
        bytes memory utf8OtherAlphabetic158 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic158));
        console2.log("0CC8: ", string(utf8OtherAlphabetic158));
        console2.logBytes(utf8OtherAlphabetic158);

        string memory otherAlphabetic159 = "\\u{0CCA}";
        bytes memory utf8OtherAlphabetic159 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic159));
        console2.log("0CCA: ", string(utf8OtherAlphabetic159));
        console2.logBytes(utf8OtherAlphabetic159);

        string memory otherAlphabetic160 = "\\u{0CCB}";
        bytes memory utf8OtherAlphabetic160 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic160));
        console2.log("0CCB: ", string(utf8OtherAlphabetic160));
        console2.logBytes(utf8OtherAlphabetic160);

        string memory otherAlphabetic161 = "\\u{0CCC}";
        bytes memory utf8OtherAlphabetic161 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic161));
        console2.log("0CCC: ", string(utf8OtherAlphabetic161));
        console2.logBytes(utf8OtherAlphabetic161);

        string memory otherAlphabetic162 = "\\u{0CD5}";
        bytes memory utf8OtherAlphabetic162 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic162));
        console2.log("0CD5: ", string(utf8OtherAlphabetic162));
        console2.logBytes(utf8OtherAlphabetic162);

        string memory otherAlphabetic163 = "\\u{0CD6}";
        bytes memory utf8OtherAlphabetic163 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic163));
        console2.log("0CD6: ", string(utf8OtherAlphabetic163));
        console2.logBytes(utf8OtherAlphabetic163);

        string memory otherAlphabetic164 = "\\u{0CE2}";
        bytes memory utf8OtherAlphabetic164 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic164));
        console2.log("0CE2: ", string(utf8OtherAlphabetic164));
        console2.logBytes(utf8OtherAlphabetic164);

        string memory otherAlphabetic165 = "\\u{0CE3}";
        bytes memory utf8OtherAlphabetic165 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic165));
        console2.log("0CE3: ", string(utf8OtherAlphabetic165));
        console2.logBytes(utf8OtherAlphabetic165);

        string memory otherAlphabetic166 = "\\u{0CF3}";
        bytes memory utf8OtherAlphabetic166 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic166));
        console2.log("0CF3: ", string(utf8OtherAlphabetic166));
        console2.logBytes(utf8OtherAlphabetic166);

        string memory otherAlphabetic167 = "\\u{0D00}";
        bytes memory utf8OtherAlphabetic167 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic167));
        console2.log("0D00: ", string(utf8OtherAlphabetic167));
        console2.logBytes(utf8OtherAlphabetic167);

        string memory otherAlphabetic168 = "\\u{0D01}";
        bytes memory utf8OtherAlphabetic168 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic168));
        console2.log("0D01: ", string(utf8OtherAlphabetic168));
        console2.logBytes(utf8OtherAlphabetic168);

        string memory otherAlphabetic169 = "\\u{0D02}";
        bytes memory utf8OtherAlphabetic169 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic169));
        console2.log("0D02: ", string(utf8OtherAlphabetic169));
        console2.logBytes(utf8OtherAlphabetic169);

        string memory otherAlphabetic170 = "\\u{0D03}";
        bytes memory utf8OtherAlphabetic170 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic170));
        console2.log("0D03: ", string(utf8OtherAlphabetic170));
        console2.logBytes(utf8OtherAlphabetic170);

        string memory otherAlphabetic171 = "\\u{0D3E}";
        bytes memory utf8OtherAlphabetic171 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic171));
        console2.log("0D3E: ", string(utf8OtherAlphabetic171));
        console2.logBytes(utf8OtherAlphabetic171);

        string memory otherAlphabetic172 = "\\u{0D40}";
        bytes memory utf8OtherAlphabetic172 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic172));
        console2.log("0D40: ", string(utf8OtherAlphabetic172));
        console2.logBytes(utf8OtherAlphabetic172);

        string memory otherAlphabetic173 = "\\u{0D41}";
        bytes memory utf8OtherAlphabetic173 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic173));
        console2.log("0D41: ", string(utf8OtherAlphabetic173));
        console2.logBytes(utf8OtherAlphabetic173);

        string memory otherAlphabetic174 = "\\u{0D44}";
        bytes memory utf8OtherAlphabetic174 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic174));
        console2.log("0D44: ", string(utf8OtherAlphabetic174));
        console2.logBytes(utf8OtherAlphabetic174);

        string memory otherAlphabetic175 = "\\u{0D46}";
        bytes memory utf8OtherAlphabetic175 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic175));
        console2.log("0D46: ", string(utf8OtherAlphabetic175));
        console2.logBytes(utf8OtherAlphabetic175);

        string memory otherAlphabetic176 = "\\u{0D48}";
        bytes memory utf8OtherAlphabetic176 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic176));
        console2.log("0D48: ", string(utf8OtherAlphabetic176));
        console2.logBytes(utf8OtherAlphabetic176);

        string memory otherAlphabetic177 = "\\u{0D4A}";
        bytes memory utf8OtherAlphabetic177 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic177));
        console2.log("0D4A: ", string(utf8OtherAlphabetic177));
        console2.logBytes(utf8OtherAlphabetic177);

        string memory otherAlphabetic178 = "\\u{0D4C}";
        bytes memory utf8OtherAlphabetic178 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic178));
        console2.log("0D4C: ", string(utf8OtherAlphabetic178));
        console2.logBytes(utf8OtherAlphabetic178);

        string memory otherAlphabetic179 = "\\u{0D57}";
        bytes memory utf8OtherAlphabetic179 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic179));
        console2.log("0D57: ", string(utf8OtherAlphabetic179));
        console2.logBytes(utf8OtherAlphabetic179);

        string memory otherAlphabetic180 = "\\u{0D62}";
        bytes memory utf8OtherAlphabetic180 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic180));
        console2.log("0D62: ", string(utf8OtherAlphabetic180));
        console2.logBytes(utf8OtherAlphabetic180);

        string memory otherAlphabetic181 = "\\u{0D63}";
        bytes memory utf8OtherAlphabetic181 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic181));
        console2.log("0D63: ", string(utf8OtherAlphabetic181));
        console2.logBytes(utf8OtherAlphabetic181);

        string memory otherAlphabetic182 = "\\u{0D81}";
        bytes memory utf8OtherAlphabetic182 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic182));
        console2.log("0D81: ", string(utf8OtherAlphabetic182));
        console2.logBytes(utf8OtherAlphabetic182);

        string memory otherAlphabetic183 = "\\u{0D82}";
        bytes memory utf8OtherAlphabetic183 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic183));
        console2.log("0D82: ", string(utf8OtherAlphabetic183));
        console2.logBytes(utf8OtherAlphabetic183);

        string memory otherAlphabetic184 = "\\u{0D83}";
        bytes memory utf8OtherAlphabetic184 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic184));
        console2.log("0D83: ", string(utf8OtherAlphabetic184));
        console2.logBytes(utf8OtherAlphabetic184);

        string memory otherAlphabetic185 = "\\u{0DCF}";
        bytes memory utf8OtherAlphabetic185 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic185));
        console2.log("0DCF: ", string(utf8OtherAlphabetic185));
        console2.logBytes(utf8OtherAlphabetic185);

        string memory otherAlphabetic186 = "\\u{0DD1}";
        bytes memory utf8OtherAlphabetic186 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic186));
        console2.log("0DD1: ", string(utf8OtherAlphabetic186));
        console2.logBytes(utf8OtherAlphabetic186);

        string memory otherAlphabetic187 = "\\u{0DD2}";
        bytes memory utf8OtherAlphabetic187 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic187));
        console2.log("0DD2: ", string(utf8OtherAlphabetic187));
        console2.logBytes(utf8OtherAlphabetic187);

        string memory otherAlphabetic188 = "\\u{0DD4}";
        bytes memory utf8OtherAlphabetic188 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic188));
        console2.log("0DD4: ", string(utf8OtherAlphabetic188));
        console2.logBytes(utf8OtherAlphabetic188);

        string memory otherAlphabetic189 = "\\u{0DD6}";
        bytes memory utf8OtherAlphabetic189 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic189));
        console2.log("0DD6: ", string(utf8OtherAlphabetic189));
        console2.logBytes(utf8OtherAlphabetic189);

        string memory otherAlphabetic190 = "\\u{0DD8}";
        bytes memory utf8OtherAlphabetic190 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic190));
        console2.log("0DD8: ", string(utf8OtherAlphabetic190));
        console2.logBytes(utf8OtherAlphabetic190);

        string memory otherAlphabetic191 = "\\u{0DDF}";
        bytes memory utf8OtherAlphabetic191 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic191));
        console2.log("0DDF: ", string(utf8OtherAlphabetic191));
        console2.logBytes(utf8OtherAlphabetic191);

        string memory otherAlphabetic192 = "\\u{0DF2}";
        bytes memory utf8OtherAlphabetic192 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic192));
        console2.log("0DF2: ", string(utf8OtherAlphabetic192));
        console2.logBytes(utf8OtherAlphabetic192);

        string memory otherAlphabetic193 = "\\u{0DF3}";
        bytes memory utf8OtherAlphabetic193 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic193));
        console2.log("0DF3: ", string(utf8OtherAlphabetic193));
        console2.logBytes(utf8OtherAlphabetic193);

        string memory otherAlphabetic194 = "\\u{0E31}";
        bytes memory utf8OtherAlphabetic194 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic194));
        console2.log("0E31: ", string(utf8OtherAlphabetic194));
        console2.logBytes(utf8OtherAlphabetic194);

        string memory otherAlphabetic195 = "\\u{0E34}";
        bytes memory utf8OtherAlphabetic195 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic195));
        console2.log("0E34: ", string(utf8OtherAlphabetic195));
        console2.logBytes(utf8OtherAlphabetic195);

        string memory otherAlphabetic196 = "\\u{0E3A}";
        bytes memory utf8OtherAlphabetic196 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic196));
        console2.log("0E3A: ", string(utf8OtherAlphabetic196));
        console2.logBytes(utf8OtherAlphabetic196);

        string memory otherAlphabetic197 = "\\u{0E4D}";
        bytes memory utf8OtherAlphabetic197 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic197));
        console2.log("0E4D: ", string(utf8OtherAlphabetic197));
        console2.logBytes(utf8OtherAlphabetic197);

        string memory otherAlphabetic198 = "\\u{0EB1}";
        bytes memory utf8OtherAlphabetic198 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic198));
        console2.log("0EB1: ", string(utf8OtherAlphabetic198));
        console2.logBytes(utf8OtherAlphabetic198);

        string memory otherAlphabetic199 = "\\u{0EB4}";
        bytes memory utf8OtherAlphabetic199 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic199));
        console2.log("0EB4: ", string(utf8OtherAlphabetic199));
        console2.logBytes(utf8OtherAlphabetic199);

        string memory otherAlphabetic200 = "\\u{0EB9}";
        bytes memory utf8OtherAlphabetic200 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic200));
        console2.log("0EB9: ", string(utf8OtherAlphabetic200));
        console2.logBytes(utf8OtherAlphabetic200);

        string memory otherAlphabetic201 = "\\u{0EBB}";
        bytes memory utf8OtherAlphabetic201 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic201));
        console2.log("0EBB: ", string(utf8OtherAlphabetic201));
        console2.logBytes(utf8OtherAlphabetic201);

        string memory otherAlphabetic202 = "\\u{0EBC}";
        bytes memory utf8OtherAlphabetic202 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic202));
        console2.log("0EBC: ", string(utf8OtherAlphabetic202));
        console2.logBytes(utf8OtherAlphabetic202);

        string memory otherAlphabetic203 = "\\u{0ECD}";
        bytes memory utf8OtherAlphabetic203 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic203));
        console2.log("0ECD: ", string(utf8OtherAlphabetic203));
        console2.logBytes(utf8OtherAlphabetic203);

        string memory otherAlphabetic204 = "\\u{0F71}";
        bytes memory utf8OtherAlphabetic204 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic204));
        console2.log("0F71: ", string(utf8OtherAlphabetic204));
        console2.logBytes(utf8OtherAlphabetic204);

        string memory otherAlphabetic205 = "\\u{0F7E}";
        bytes memory utf8OtherAlphabetic205 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic205));
        console2.log("0F7E: ", string(utf8OtherAlphabetic205));
        console2.logBytes(utf8OtherAlphabetic205);

        string memory otherAlphabetic206 = "\\u{0F7F}";
        bytes memory utf8OtherAlphabetic206 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic206));
        console2.log("0F7F: ", string(utf8OtherAlphabetic206));
        console2.logBytes(utf8OtherAlphabetic206);

        string memory otherAlphabetic207 = "\\u{0F80}";
        bytes memory utf8OtherAlphabetic207 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic207));
        console2.log("0F80: ", string(utf8OtherAlphabetic207));
        console2.logBytes(utf8OtherAlphabetic207);

        string memory otherAlphabetic208 = "\\u{0F83}";
        bytes memory utf8OtherAlphabetic208 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic208));
        console2.log("0F83: ", string(utf8OtherAlphabetic208));
        console2.logBytes(utf8OtherAlphabetic208);

        string memory otherAlphabetic209 = "\\u{0F8D}";
        bytes memory utf8OtherAlphabetic209 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic209));
        console2.log("0F8D: ", string(utf8OtherAlphabetic209));
        console2.logBytes(utf8OtherAlphabetic209);

        string memory otherAlphabetic210 = "\\u{0F97}";
        bytes memory utf8OtherAlphabetic210 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic210));
        console2.log("0F97: ", string(utf8OtherAlphabetic210));
        console2.logBytes(utf8OtherAlphabetic210);

        string memory otherAlphabetic211 = "\\u{0F99}";
        bytes memory utf8OtherAlphabetic211 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic211));
        console2.log("0F99: ", string(utf8OtherAlphabetic211));
        console2.logBytes(utf8OtherAlphabetic211);

        string memory otherAlphabetic212 = "\\u{0FBC}";
        bytes memory utf8OtherAlphabetic212 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic212));
        console2.log("0FBC: ", string(utf8OtherAlphabetic212));
        console2.logBytes(utf8OtherAlphabetic212);

        string memory otherAlphabetic213 = "\\u{102B}";
        bytes memory utf8OtherAlphabetic213 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic213));
        console2.log("102B: ", string(utf8OtherAlphabetic213));
        console2.logBytes(utf8OtherAlphabetic213);

        string memory otherAlphabetic214 = "\\u{102C}";
        bytes memory utf8OtherAlphabetic214 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic214));
        console2.log("102C: ", string(utf8OtherAlphabetic214));
        console2.logBytes(utf8OtherAlphabetic214);

        string memory otherAlphabetic215 = "\\u{102D}";
        bytes memory utf8OtherAlphabetic215 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic215));
        console2.log("102D: ", string(utf8OtherAlphabetic215));
        console2.logBytes(utf8OtherAlphabetic215);

        string memory otherAlphabetic216 = "\\u{1030}";
        bytes memory utf8OtherAlphabetic216 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic216));
        console2.log("1030: ", string(utf8OtherAlphabetic216));
        console2.logBytes(utf8OtherAlphabetic216);

        string memory otherAlphabetic217 = "\\u{1031}";
        bytes memory utf8OtherAlphabetic217 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic217));
        console2.log("1031: ", string(utf8OtherAlphabetic217));
        console2.logBytes(utf8OtherAlphabetic217);

        string memory otherAlphabetic218 = "\\u{1032}";
        bytes memory utf8OtherAlphabetic218 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic218));
        console2.log("1032: ", string(utf8OtherAlphabetic218));
        console2.logBytes(utf8OtherAlphabetic218);

        string memory otherAlphabetic219 = "\\u{1036}";
        bytes memory utf8OtherAlphabetic219 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic219));
        console2.log("1036: ", string(utf8OtherAlphabetic219));
        console2.logBytes(utf8OtherAlphabetic219);

        string memory otherAlphabetic220 = "\\u{1038}";
        bytes memory utf8OtherAlphabetic220 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic220));
        console2.log("1038: ", string(utf8OtherAlphabetic220));
        console2.logBytes(utf8OtherAlphabetic220);

        string memory otherAlphabetic221 = "\\u{103B}";
        bytes memory utf8OtherAlphabetic221 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic221));
        console2.log("103B: ", string(utf8OtherAlphabetic221));
        console2.logBytes(utf8OtherAlphabetic221);

        string memory otherAlphabetic222 = "\\u{103C}";
        bytes memory utf8OtherAlphabetic222 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic222));
        console2.log("103C: ", string(utf8OtherAlphabetic222));
        console2.logBytes(utf8OtherAlphabetic222);

        string memory otherAlphabetic223 = "\\u{103D}";
        bytes memory utf8OtherAlphabetic223 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic223));
        console2.log("103D: ", string(utf8OtherAlphabetic223));
        console2.logBytes(utf8OtherAlphabetic223);

        string memory otherAlphabetic224 = "\\u{103E}";
        bytes memory utf8OtherAlphabetic224 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic224));
        console2.log("103E: ", string(utf8OtherAlphabetic224));
        console2.logBytes(utf8OtherAlphabetic224);

        string memory otherAlphabetic225 = "\\u{1056}";
        bytes memory utf8OtherAlphabetic225 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic225));
        console2.log("1056: ", string(utf8OtherAlphabetic225));
        console2.logBytes(utf8OtherAlphabetic225);

        string memory otherAlphabetic226 = "\\u{1057}";
        bytes memory utf8OtherAlphabetic226 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic226));
        console2.log("1057: ", string(utf8OtherAlphabetic226));
        console2.logBytes(utf8OtherAlphabetic226);

        string memory otherAlphabetic227 = "\\u{1058}";
        bytes memory utf8OtherAlphabetic227 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic227));
        console2.log("1058: ", string(utf8OtherAlphabetic227));
        console2.logBytes(utf8OtherAlphabetic227);

        string memory otherAlphabetic228 = "\\u{1059}";
        bytes memory utf8OtherAlphabetic228 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic228));
        console2.log("1059: ", string(utf8OtherAlphabetic228));
        console2.logBytes(utf8OtherAlphabetic228);

        string memory otherAlphabetic229 = "\\u{105E}";
        bytes memory utf8OtherAlphabetic229 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic229));
        console2.log("105E: ", string(utf8OtherAlphabetic229));
        console2.logBytes(utf8OtherAlphabetic229);

        string memory otherAlphabetic230 = "\\u{1060}";
        bytes memory utf8OtherAlphabetic230 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic230));
        console2.log("1060: ", string(utf8OtherAlphabetic230));
        console2.logBytes(utf8OtherAlphabetic230);

        string memory otherAlphabetic231 = "\\u{1062}";
        bytes memory utf8OtherAlphabetic231 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic231));
        console2.log("1062: ", string(utf8OtherAlphabetic231));
        console2.logBytes(utf8OtherAlphabetic231);

        string memory otherAlphabetic232 = "\\u{1064}";
        bytes memory utf8OtherAlphabetic232 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic232));
        console2.log("1064: ", string(utf8OtherAlphabetic232));
        console2.logBytes(utf8OtherAlphabetic232);

        string memory otherAlphabetic234 = "\\u{1067}";
        bytes memory utf8OtherAlphabetic234 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic234));
        console2.log("1067: ", string(utf8OtherAlphabetic234));
        console2.logBytes(utf8OtherAlphabetic234);

        string memory otherAlphabetic235 = "\\u{106D}";
        bytes memory utf8OtherAlphabetic235 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic235));
        console2.log("106D: ", string(utf8OtherAlphabetic235));
        console2.logBytes(utf8OtherAlphabetic235);

        string memory otherAlphabetic236 = "\\u{1071}";
        bytes memory utf8OtherAlphabetic236 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic236));
        console2.log("1071: ", string(utf8OtherAlphabetic236));
        console2.logBytes(utf8OtherAlphabetic236);

        string memory otherAlphabetic237 = "\\u{1074}";
        bytes memory utf8OtherAlphabetic237 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic237));
        console2.log("1074: ", string(utf8OtherAlphabetic237));
        console2.logBytes(utf8OtherAlphabetic237);

        string memory otherAlphabetic237a = "\\u{1082}";
        bytes memory utf8OtherAlphabetic237a = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic237a));
        console2.log("1082: ", string(utf8OtherAlphabetic237a));
        console2.logBytes(utf8OtherAlphabetic237a);

        string memory otherAlphabetic238 = "\\u{1083}";
        bytes memory utf8OtherAlphabetic238 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic238));
        console2.log("1083: ", string(utf8OtherAlphabetic238));
        console2.logBytes(utf8OtherAlphabetic238);

        string memory otherAlphabetic239 = "\\u{1084}";
        bytes memory utf8OtherAlphabetic239 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic239));
        console2.log("1084: ", string(utf8OtherAlphabetic239));
        console2.logBytes(utf8OtherAlphabetic239);

        string memory otherAlphabetic240 = "\\u{1085}";
        bytes memory utf8OtherAlphabetic240 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic240));
        console2.log("1085: ", string(utf8OtherAlphabetic240));
        console2.logBytes(utf8OtherAlphabetic240);

        string memory otherAlphabetic241 = "\\u{1086}";
        bytes memory utf8OtherAlphabetic241 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic241));
        console2.log("1086: ", string(utf8OtherAlphabetic241));
        console2.logBytes(utf8OtherAlphabetic241);

        string memory otherAlphabetic242 = "\\u{1087}";
        bytes memory utf8OtherAlphabetic242 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic242));
        console2.log("1087: ", string(utf8OtherAlphabetic242));
        console2.logBytes(utf8OtherAlphabetic242);

        string memory otherAlphabetic243 = "\\u{108C}";
        bytes memory utf8OtherAlphabetic243 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic243));
        console2.log("108C: ", string(utf8OtherAlphabetic243));
        console2.logBytes(utf8OtherAlphabetic243);

        string memory otherAlphabetic244 = "\\u{108D}";
        bytes memory utf8OtherAlphabetic244 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic244));
        console2.log("108D: ", string(utf8OtherAlphabetic244));
        console2.logBytes(utf8OtherAlphabetic244);

        string memory otherAlphabetic245 = "\\u{108F}";
        bytes memory utf8OtherAlphabetic245 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic245));
        console2.log("108F: ", string(utf8OtherAlphabetic245));
        console2.logBytes(utf8OtherAlphabetic245);

        string memory otherAlphabetic246 = "\\u{109A}";
        bytes memory utf8OtherAlphabetic246 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic246));
        console2.log("109A: ", string(utf8OtherAlphabetic246));
        console2.logBytes(utf8OtherAlphabetic246);

        string memory otherAlphabetic247 = "\\u{109C}";
        bytes memory utf8OtherAlphabetic247 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic247));
        console2.log("109C: ", string(utf8OtherAlphabetic247));
        console2.logBytes(utf8OtherAlphabetic247);

        string memory otherAlphabetic248 = "\\u{109D}";
        bytes memory utf8OtherAlphabetic248 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic248));
        console2.log("109D: ", string(utf8OtherAlphabetic248));
        console2.logBytes(utf8OtherAlphabetic248);

        string memory otherAlphabetic249 = "\\u{1712}";
        bytes memory utf8OtherAlphabetic249 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic249));
        console2.log("1712: ", string(utf8OtherAlphabetic249));
        console2.logBytes(utf8OtherAlphabetic249);

        string memory otherAlphabetic250 = "\\u{1713}";
        bytes memory utf8OtherAlphabetic250 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic250));
        console2.log("1713: ", string(utf8OtherAlphabetic250));
        console2.logBytes(utf8OtherAlphabetic250);

        string memory otherAlphabetic251 = "\\u{1732}";
        bytes memory utf8OtherAlphabetic251 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic251));
        console2.log("1732: ", string(utf8OtherAlphabetic251));
        console2.logBytes(utf8OtherAlphabetic251);

        string memory otherAlphabetic252 = "\\u{1733}";
        bytes memory utf8OtherAlphabetic252 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic252));
        console2.log("1733: ", string(utf8OtherAlphabetic252));
        console2.logBytes(utf8OtherAlphabetic252);

        string memory otherAlphabetic253 = "\\u{1752}";
        bytes memory utf8OtherAlphabetic253 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic253));
        console2.log("1752: ", string(utf8OtherAlphabetic253));
        console2.logBytes(utf8OtherAlphabetic253);

        string memory otherAlphabetic254 = "\\u{1753}";
        bytes memory utf8OtherAlphabetic254 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic254));
        console2.log("1753: ", string(utf8OtherAlphabetic254));
        console2.logBytes(utf8OtherAlphabetic254);

        string memory otherAlphabetic255 = "\\u{1772}";
        bytes memory utf8OtherAlphabetic255 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic255));
        console2.log("1772: ", string(utf8OtherAlphabetic255));
        console2.logBytes(utf8OtherAlphabetic255);

        string memory otherAlphabetic256 = "\\u{1773}";
        bytes memory utf8OtherAlphabetic256 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic256));
        console2.log("1773: ", string(utf8OtherAlphabetic256));
        console2.logBytes(utf8OtherAlphabetic256);

        string memory otherAlphabetic257 = "\\u{17B6}";
        bytes memory utf8OtherAlphabetic257 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic257));
        console2.log("17B6: ", string(utf8OtherAlphabetic257));
        console2.logBytes(utf8OtherAlphabetic257);

        string memory otherAlphabetic258 = "\\u{17B7}";
        bytes memory utf8OtherAlphabetic258 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic258));
        console2.log("17B7: ", string(utf8OtherAlphabetic258));
        console2.logBytes(utf8OtherAlphabetic258);

        string memory otherAlphabetic259 = "\\u{17BD}";
        bytes memory utf8OtherAlphabetic259 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic259));
        console2.log("17BD: ", string(utf8OtherAlphabetic259));
        console2.logBytes(utf8OtherAlphabetic259);

        string memory otherAlphabetic260 = "\\u{17BE}";
        bytes memory utf8OtherAlphabetic260 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic260));
        console2.log("17BE: ", string(utf8OtherAlphabetic260));
        console2.logBytes(utf8OtherAlphabetic260);

        string memory otherAlphabetic261 = "\\u{17C5}";
        bytes memory utf8OtherAlphabetic261 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic261));
        console2.log("17C5: ", string(utf8OtherAlphabetic261));
        console2.logBytes(utf8OtherAlphabetic261);

        string memory otherAlphabetic262 = "\\u{17C6}";
        bytes memory utf8OtherAlphabetic262 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic262));
        console2.log("17C6: ", string(utf8OtherAlphabetic262));
        console2.logBytes(utf8OtherAlphabetic262);

        string memory otherAlphabetic263 = "\\u{17C7}";
        bytes memory utf8OtherAlphabetic263 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic263));
        console2.log("17C7: ", string(utf8OtherAlphabetic263));
        console2.logBytes(utf8OtherAlphabetic263);

        string memory otherAlphabetic264 = "\\u{17C8}";
        bytes memory utf8OtherAlphabetic264 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic264));
        console2.log("17C8: ", string(utf8OtherAlphabetic264));
        console2.logBytes(utf8OtherAlphabetic264);

        string memory otherAlphabetic265 = "\\u{1885}";
        bytes memory utf8OtherAlphabetic265 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic265));
        console2.log("1885: ", string(utf8OtherAlphabetic265));
        console2.logBytes(utf8OtherAlphabetic265);

        string memory otherAlphabetic266 = "\\u{1886}";
        bytes memory utf8OtherAlphabetic266 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic266));
        console2.log("1886: ", string(utf8OtherAlphabetic266));
        console2.logBytes(utf8OtherAlphabetic266);

        string memory otherAlphabetic267 = "\\u{18A9}";
        bytes memory utf8OtherAlphabetic267 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic267));
        console2.log("18A9: ", string(utf8OtherAlphabetic267));
        console2.logBytes(utf8OtherAlphabetic267);

        string memory otherAlphabetic268 = "\\u{1920}";
        bytes memory utf8OtherAlphabetic268 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic268));
        console2.log("1920: ", string(utf8OtherAlphabetic268));
        console2.logBytes(utf8OtherAlphabetic268);

        string memory otherAlphabetic269 = "\\u{1922}";
        bytes memory utf8OtherAlphabetic269 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic269));
        console2.log("1922: ", string(utf8OtherAlphabetic269));
        console2.logBytes(utf8OtherAlphabetic269);

        string memory otherAlphabetic270 = "\\u{1923}";
        bytes memory utf8OtherAlphabetic270 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic270));
        console2.log("1923: ", string(utf8OtherAlphabetic270));
        console2.logBytes(utf8OtherAlphabetic270);

        string memory otherAlphabetic271 = "\\u{1926}";
        bytes memory utf8OtherAlphabetic271 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic271));
        console2.log("1926: ", string(utf8OtherAlphabetic271));
        console2.logBytes(utf8OtherAlphabetic271);

        string memory otherAlphabetic272 = "\\u{1927}";
        bytes memory utf8OtherAlphabetic272 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic272));
        console2.log("1927: ", string(utf8OtherAlphabetic272));
        console2.logBytes(utf8OtherAlphabetic272);

        string memory otherAlphabetic273 = "\\u{1928}";
        bytes memory utf8OtherAlphabetic273 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic273));
        console2.log("1928: ", string(utf8OtherAlphabetic273));
        console2.logBytes(utf8OtherAlphabetic273);

        string memory otherAlphabetic274 = "\\u{1929}";
        bytes memory utf8OtherAlphabetic274 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic274));
        console2.log("1929: ", string(utf8OtherAlphabetic274));
        console2.logBytes(utf8OtherAlphabetic274);

        string memory otherAlphabetic275 = "\\u{192B}";
        bytes memory utf8OtherAlphabetic275 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic275));
        console2.log("192B: ", string(utf8OtherAlphabetic275));
        console2.logBytes(utf8OtherAlphabetic275);

        string memory otherAlphabetic276 = "\\u{1930}";
        bytes memory utf8OtherAlphabetic276 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic276));
        console2.log("1930: ", string(utf8OtherAlphabetic276));
        console2.logBytes(utf8OtherAlphabetic276);

        string memory otherAlphabetic277 = "\\u{1931}";
        bytes memory utf8OtherAlphabetic277 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic277));
        console2.log("1931: ", string(utf8OtherAlphabetic277));
        console2.logBytes(utf8OtherAlphabetic277);

        string memory otherAlphabetic278 = "\\u{1932}";
        bytes memory utf8OtherAlphabetic278 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic278));
        console2.log("1932: ", string(utf8OtherAlphabetic278));
        console2.logBytes(utf8OtherAlphabetic278);

        string memory otherAlphabetic279 = "\\u{1933}";
        bytes memory utf8OtherAlphabetic279 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic279));
        console2.log("1933: ", string(utf8OtherAlphabetic279));
        console2.logBytes(utf8OtherAlphabetic279);

        string memory otherAlphabetic280 = "\\u{1938}";
        bytes memory utf8OtherAlphabetic280 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic280));
        console2.log("1938: ", string(utf8OtherAlphabetic280));
        console2.logBytes(utf8OtherAlphabetic280);

        string memory otherAlphabetic281 = "\\u{1A17}";
        bytes memory utf8OtherAlphabetic281 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic281));
        console2.log("1A17: ", string(utf8OtherAlphabetic281));
        console2.logBytes(utf8OtherAlphabetic281);

        string memory otherAlphabetic282 = "\\u{1A18}";
        bytes memory utf8OtherAlphabetic282 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic282));
        console2.log("1A18: ", string(utf8OtherAlphabetic282));
        console2.logBytes(utf8OtherAlphabetic282);

        string memory otherAlphabetic283 = "\\u{1A19}";
        bytes memory utf8OtherAlphabetic283 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic283));
        console2.log("1A19: ", string(utf8OtherAlphabetic283));
        console2.logBytes(utf8OtherAlphabetic283);

        string memory otherAlphabetic284 = "\\u{1A1A}";
        bytes memory utf8OtherAlphabetic284 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic284));
        console2.log("1A1A: ", string(utf8OtherAlphabetic284));
        console2.logBytes(utf8OtherAlphabetic284);

        string memory otherAlphabetic285 = "\\u{1A1B}";
        bytes memory utf8OtherAlphabetic285 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic285));
        console2.log("1A1B: ", string(utf8OtherAlphabetic285));
        console2.logBytes(utf8OtherAlphabetic285);

        string memory otherAlphabetic286 = "\\u{1A55}";
        bytes memory utf8OtherAlphabetic286 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic286));
        console2.log("1A55: ", string(utf8OtherAlphabetic286));
        console2.logBytes(utf8OtherAlphabetic286);

        string memory otherAlphabetic287 = "\\u{1A56}";
        bytes memory utf8OtherAlphabetic287 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic287));
        console2.log("1A56: ", string(utf8OtherAlphabetic287));
        console2.logBytes(utf8OtherAlphabetic287);

        string memory otherAlphabetic288 = "\\u{1A57}";
        bytes memory utf8OtherAlphabetic288 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic288));
        console2.log("1A57: ", string(utf8OtherAlphabetic288));
        console2.logBytes(utf8OtherAlphabetic288);

        string memory otherAlphabetic289 = "\\u{1A58}";
        bytes memory utf8OtherAlphabetic289 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic289));
        console2.log("1A58: ", string(utf8OtherAlphabetic289));
        console2.logBytes(utf8OtherAlphabetic289);

        string memory otherAlphabetic290 = "\\u{1A5E}";
        bytes memory utf8OtherAlphabetic290 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic290));
        console2.log("1A5E: ", string(utf8OtherAlphabetic290));
        console2.logBytes(utf8OtherAlphabetic290);

        string memory otherAlphabetic291 = "\\u{1A61}";
        bytes memory utf8OtherAlphabetic291 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic291));
        console2.log("1A61: ", string(utf8OtherAlphabetic291));
        console2.logBytes(utf8OtherAlphabetic291);

        string memory otherAlphabetic292 = "\\u{1A62}";
        bytes memory utf8OtherAlphabetic292 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic292));
        console2.log("1A62: ", string(utf8OtherAlphabetic292));
        console2.logBytes(utf8OtherAlphabetic292);

        string memory otherAlphabetic293 = "\\u{1A63}";
        bytes memory utf8OtherAlphabetic293 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic293));
        console2.log("1A63: ", string(utf8OtherAlphabetic293));
        console2.logBytes(utf8OtherAlphabetic293);

        string memory otherAlphabetic294 = "\\u{1A64}";
        bytes memory utf8OtherAlphabetic294 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic294));
        console2.log("1A64: ", string(utf8OtherAlphabetic294));
        console2.logBytes(utf8OtherAlphabetic294);

        string memory otherAlphabetic295 = "\\u{1A65}";
        bytes memory utf8OtherAlphabetic295 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic295));
        console2.log("1A65: ", string(utf8OtherAlphabetic295));
        console2.logBytes(utf8OtherAlphabetic295);

        string memory otherAlphabetic296 = "\\u{1A6C}";
        bytes memory utf8OtherAlphabetic296 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic296));
        console2.log("1A6C: ", string(utf8OtherAlphabetic296));
        console2.logBytes(utf8OtherAlphabetic296);

        string memory otherAlphabetic297 = "\\u{1A6D}";
        bytes memory utf8OtherAlphabetic297 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic297));
        console2.log("1A6D: ", string(utf8OtherAlphabetic297));
        console2.logBytes(utf8OtherAlphabetic297);

        string memory otherAlphabetic298 = "\\u{1A72}";
        bytes memory utf8OtherAlphabetic298 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic298));
        console2.log("1A72: ", string(utf8OtherAlphabetic298));
        console2.logBytes(utf8OtherAlphabetic298);

        string memory otherAlphabetic299 = "\\u{1A73}";
        bytes memory utf8OtherAlphabetic299 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic299));
        console2.log("1A73: ", string(utf8OtherAlphabetic299));
        console2.logBytes(utf8OtherAlphabetic299);

        string memory otherAlphabetic300 = "\\u{1A74}";
        bytes memory utf8OtherAlphabetic300 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic300));
        console2.log("1A74: ", string(utf8OtherAlphabetic300));
        console2.logBytes(utf8OtherAlphabetic300);

        string memory otherAlphabetic301 = "\\u{1ABF}";
        bytes memory utf8OtherAlphabetic301 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic301));
        console2.log("1ABF: ", string(utf8OtherAlphabetic301));
        console2.logBytes(utf8OtherAlphabetic301);

        string memory otherAlphabetic302 = "\\u{1AC0}";
        bytes memory utf8OtherAlphabetic302 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic302));
        console2.log("1AC0: ", string(utf8OtherAlphabetic302));
        console2.logBytes(utf8OtherAlphabetic302);

        string memory otherAlphabetic303 = "\\u{1ACC}";
        bytes memory utf8OtherAlphabetic303 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic303));
        console2.log("1ACC: ", string(utf8OtherAlphabetic303));
        console2.logBytes(utf8OtherAlphabetic303);

        string memory otherAlphabetic304 = "\\u{1ACE}";
        bytes memory utf8OtherAlphabetic304 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic304));
        console2.log("1ACE: ", string(utf8OtherAlphabetic304));
        console2.logBytes(utf8OtherAlphabetic304);

        string memory otherAlphabetic305 = "\\u{1B00}";
        bytes memory utf8OtherAlphabetic305 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic305));
        console2.log("1B00: ", string(utf8OtherAlphabetic305));
        console2.logBytes(utf8OtherAlphabetic305);

        string memory otherAlphabetic306 = "\\u{1B03}";
        bytes memory utf8OtherAlphabetic306 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic306));
        console2.log("1B03: ", string(utf8OtherAlphabetic306));
        console2.logBytes(utf8OtherAlphabetic306);

        string memory otherAlphabetic307 = "\\u{1B04}";
        bytes memory utf8OtherAlphabetic307 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic307));
        console2.log("1B04: ", string(utf8OtherAlphabetic307));
        console2.logBytes(utf8OtherAlphabetic307);

        string memory otherAlphabetic308 = "\\u{1B35}";
        bytes memory utf8OtherAlphabetic308 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic308));
        console2.log("1B35: ", string(utf8OtherAlphabetic308));
        console2.logBytes(utf8OtherAlphabetic308);

        string memory otherAlphabetic309 = "\\u{1B36}";
        bytes memory utf8OtherAlphabetic309 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic309));
        console2.log("1B36: ", string(utf8OtherAlphabetic309));
        console2.logBytes(utf8OtherAlphabetic309);

        string memory otherAlphabetic310 = "\\u{1B3A}";
        bytes memory utf8OtherAlphabetic310 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic310));
        console2.log("1B3A: ", string(utf8OtherAlphabetic310));
        console2.logBytes(utf8OtherAlphabetic310);

        string memory otherAlphabetic311 = "\\u{1B3B}";
        bytes memory utf8OtherAlphabetic311 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic311));
        console2.log("1B3B: ", string(utf8OtherAlphabetic311));
        console2.logBytes(utf8OtherAlphabetic311);

        string memory otherAlphabetic312 = "\\u{1B3C}";
        bytes memory utf8OtherAlphabetic312 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic312));
        console2.log("1B3C: ", string(utf8OtherAlphabetic312));
        console2.logBytes(utf8OtherAlphabetic312);

        string memory otherAlphabetic313 = "\\u{1B3D}";
        bytes memory utf8OtherAlphabetic313 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic313));
        console2.log("1B3D: ", string(utf8OtherAlphabetic313));
        console2.logBytes(utf8OtherAlphabetic313);

        string memory otherAlphabetic314 = "\\u{1B41}";
        bytes memory utf8OtherAlphabetic314 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic314));
        console2.log("1B41: ", string(utf8OtherAlphabetic314));
        console2.logBytes(utf8OtherAlphabetic314);

        string memory otherAlphabetic315 = "\\u{1B42}";
        bytes memory utf8OtherAlphabetic315 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic315));
        console2.log("1B42: ", string(utf8OtherAlphabetic315));
        console2.logBytes(utf8OtherAlphabetic315);

        string memory otherAlphabetic316 = "\\u{1B43}";
        bytes memory utf8OtherAlphabetic316 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic316));
        console2.log("1B43: ", string(utf8OtherAlphabetic316));
        console2.logBytes(utf8OtherAlphabetic316);

        string memory otherAlphabetic317 = "\\u{1B80}";
        bytes memory utf8OtherAlphabetic317 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic317));
        console2.log("1B80: ", string(utf8OtherAlphabetic317));
        console2.logBytes(utf8OtherAlphabetic317);

        string memory otherAlphabetic318 = "\\u{1B81}";
        bytes memory utf8OtherAlphabetic318 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic318));
        console2.log("1B81: ", string(utf8OtherAlphabetic318));
        console2.logBytes(utf8OtherAlphabetic318);

        string memory otherAlphabetic319 = "\\u{1B82}";
        bytes memory utf8OtherAlphabetic319 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic319));
        console2.log("1B82: ", string(utf8OtherAlphabetic319));
        console2.logBytes(utf8OtherAlphabetic319);

        string memory otherAlphabetic320 = "\\u{1BA1}";
        bytes memory utf8OtherAlphabetic320 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic320));
        console2.log("1BA1: ", string(utf8OtherAlphabetic320));
        console2.logBytes(utf8OtherAlphabetic320);

        string memory otherAlphabetic321 = "\\u{1BA2}";
        bytes memory utf8OtherAlphabetic321 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic321));
        console2.log("1BA2: ", string(utf8OtherAlphabetic321));
        console2.logBytes(utf8OtherAlphabetic321);

        string memory otherAlphabetic322 = "\\u{1BA5}";
        bytes memory utf8OtherAlphabetic322 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic322));
        console2.log("1BA5: ", string(utf8OtherAlphabetic322));
        console2.logBytes(utf8OtherAlphabetic322);

        string memory otherAlphabetic323 = "\\u{1BA6}";
        bytes memory utf8OtherAlphabetic323 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic323));
        console2.log("1BA6: ", string(utf8OtherAlphabetic323));
        console2.logBytes(utf8OtherAlphabetic323);

        string memory otherAlphabetic324 = "\\u{1BA7}";
        bytes memory utf8OtherAlphabetic324 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic324));
        console2.log("1BA7: ", string(utf8OtherAlphabetic324));
        console2.logBytes(utf8OtherAlphabetic324);

        string memory otherAlphabetic325 = "\\u{1BA8}";
        bytes memory utf8OtherAlphabetic325 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic325));
        console2.log("1BA8: ", string(utf8OtherAlphabetic325));
        console2.logBytes(utf8OtherAlphabetic325);

        string memory otherAlphabetic326 = "\\u{1BA9}";
        bytes memory utf8OtherAlphabetic326 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic326));
        console2.log("1BA9: ", string(utf8OtherAlphabetic326));
        console2.logBytes(utf8OtherAlphabetic326);

        string memory otherAlphabetic327 = "\\u{1BAC}";
        bytes memory utf8OtherAlphabetic327 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic327));
        console2.log("1BAC: ", string(utf8OtherAlphabetic327));
        console2.logBytes(utf8OtherAlphabetic327);

        string memory otherAlphabetic328 = "\\u{1BAD}";
        bytes memory utf8OtherAlphabetic328 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic328));
        console2.log("1BAD: ", string(utf8OtherAlphabetic328));
        console2.logBytes(utf8OtherAlphabetic328);

        string memory otherAlphabetic329 = "\\u{1BE7}";
        bytes memory utf8OtherAlphabetic329 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic329));
        console2.log("1BE7: ", string(utf8OtherAlphabetic329));
        console2.logBytes(utf8OtherAlphabetic329);

        string memory otherAlphabetic330 = "\\u{1BE8}";
        bytes memory utf8OtherAlphabetic330 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic330));
        console2.log("1BE8: ", string(utf8OtherAlphabetic330));
        console2.logBytes(utf8OtherAlphabetic330);

        string memory otherAlphabetic331 = "\\u{1BE9}";
        bytes memory utf8OtherAlphabetic331 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic331));
        console2.log("1BE9: ", string(utf8OtherAlphabetic331));
        console2.logBytes(utf8OtherAlphabetic331);

        string memory otherAlphabetic332 = "\\u{1BEA}";
        bytes memory utf8OtherAlphabetic332 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic332));
        console2.log("1BEA: ", string(utf8OtherAlphabetic332));
        console2.logBytes(utf8OtherAlphabetic332);

        string memory otherAlphabetic333 = "\\u{1BEC}";
        bytes memory utf8OtherAlphabetic333 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic333));
        console2.log("1BEC: ", string(utf8OtherAlphabetic333));
        console2.logBytes(utf8OtherAlphabetic333);

        string memory otherAlphabetic334 = "\\u{1BED}";
        bytes memory utf8OtherAlphabetic334 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic334));
        console2.log("1BED: ", string(utf8OtherAlphabetic334));
        console2.logBytes(utf8OtherAlphabetic334);

        string memory otherAlphabetic335 = "\\u{1BEE}";
        bytes memory utf8OtherAlphabetic335 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic335));
        console2.log("1BEE: ", string(utf8OtherAlphabetic335));
        console2.logBytes(utf8OtherAlphabetic335);

        string memory otherAlphabetic336 = "\\u{1BEF}";
        bytes memory utf8OtherAlphabetic336 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic336));
        console2.log("1BEF: ", string(utf8OtherAlphabetic336));
        console2.logBytes(utf8OtherAlphabetic336);

        string memory otherAlphabetic337 = "\\u{1BEF}";
        bytes memory utf8OtherAlphabetic337 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic337));
        console2.log("1BEF: ", string(utf8OtherAlphabetic337));
        console2.logBytes(utf8OtherAlphabetic337);

        string memory otherAlphabetic338 = "\\u{1BF1}";
        bytes memory utf8OtherAlphabetic338 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic338));
        console2.log("1BF1: ", string(utf8OtherAlphabetic338));
        console2.logBytes(utf8OtherAlphabetic338);

        string memory otherAlphabetic339 = "\\u{1C24}";
        bytes memory utf8OtherAlphabetic339 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic339));
        console2.log("1C24: ", string(utf8OtherAlphabetic339));
        console2.logBytes(utf8OtherAlphabetic339);

        string memory otherAlphabetic340 = "\\u{1C2B}";
        bytes memory utf8OtherAlphabetic340 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic340));
        console2.log("1C2B: ", string(utf8OtherAlphabetic340));
        console2.logBytes(utf8OtherAlphabetic340);

        string memory otherAlphabetic341 = "\\u{1C2C}";
        bytes memory utf8OtherAlphabetic341 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic341));
        console2.log("1C2C: ", string(utf8OtherAlphabetic341));
        console2.logBytes(utf8OtherAlphabetic341);

        string memory otherAlphabetic342 = "\\u{1C33}";
        bytes memory utf8OtherAlphabetic342 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic342));
        console2.log("1C33: ", string(utf8OtherAlphabetic342));
        console2.logBytes(utf8OtherAlphabetic342);

        string memory otherAlphabetic343 = "\\u{1C34}";
        bytes memory utf8OtherAlphabetic343 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic343));
        console2.log("1C34: ", string(utf8OtherAlphabetic343));
        console2.logBytes(utf8OtherAlphabetic343);

        string memory otherAlphabetic344 = "\\u{1C35}";
        bytes memory utf8OtherAlphabetic344 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic344));
        console2.log("1C35: ", string(utf8OtherAlphabetic344));
        console2.logBytes(utf8OtherAlphabetic344);

        string memory otherAlphabetic345 = "\\u{1C36}";
        bytes memory utf8OtherAlphabetic345 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic345));
        console2.log("1C36: ", string(utf8OtherAlphabetic345));
        console2.logBytes(utf8OtherAlphabetic345);

        string memory otherAlphabetic346 = "\\u{1DD3}";
        bytes memory utf8OtherAlphabetic346 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic346));
        console2.log("1DD3: ", string(utf8OtherAlphabetic346));
        console2.logBytes(utf8OtherAlphabetic346);

        string memory otherAlphabetic347 = "\\u{1DF4}";
        bytes memory utf8OtherAlphabetic347 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic347));
        console2.log("1DF4: ", string(utf8OtherAlphabetic347));
        console2.logBytes(utf8OtherAlphabetic347);

        string memory otherAlphabetic348 = "\\u{24B6}";
        bytes memory utf8OtherAlphabetic348 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic348));
        console2.log("24B6: ", string(utf8OtherAlphabetic348));
        console2.logBytes(utf8OtherAlphabetic348);

        string memory otherAlphabetic349 = "\\u{24E9}";
        bytes memory utf8OtherAlphabetic349 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic349));
        console2.log("24E9: ", string(utf8OtherAlphabetic349));
        console2.logBytes(utf8OtherAlphabetic349);

        string memory otherAlphabetic350 = "\\u{2DE0}";
        bytes memory utf8OtherAlphabetic350 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic350));
        console2.log("2DE0: ", string(utf8OtherAlphabetic350));
        console2.logBytes(utf8OtherAlphabetic350);

        string memory otherAlphabetic351 = "\\u{2DFF}";
        bytes memory utf8OtherAlphabetic351 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic351));
        console2.log("2DFF: ", string(utf8OtherAlphabetic351));
        console2.logBytes(utf8OtherAlphabetic351);

        string memory otherAlphabetic352 = "\\u{A674}";
        bytes memory utf8OtherAlphabetic352 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic352));
        console2.log("A674: ", string(utf8OtherAlphabetic352));
        console2.logBytes(utf8OtherAlphabetic352);

        string memory otherAlphabetic353 = "\\u{A67B}";
        bytes memory utf8OtherAlphabetic353 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic353));
        console2.log("A67B: ", string(utf8OtherAlphabetic353));
        console2.logBytes(utf8OtherAlphabetic353);

        string memory otherAlphabetic354 = "\\u{A69E}";
        bytes memory utf8OtherAlphabetic354 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic354));
        console2.log("A69E: ", string(utf8OtherAlphabetic354));
        console2.logBytes(utf8OtherAlphabetic354);

        string memory otherAlphabetic355 = "\\u{A69F}";
        bytes memory utf8OtherAlphabetic355 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic355));
        console2.log("A69F: ", string(utf8OtherAlphabetic355));
        console2.logBytes(utf8OtherAlphabetic355);

        string memory otherAlphabetic356 = "\\u{A802}";
        bytes memory utf8OtherAlphabetic356 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic356));
        console2.log("A802: ", string(utf8OtherAlphabetic356));
        console2.logBytes(utf8OtherAlphabetic356);

        string memory otherAlphabetic357 = "\\u{A80B}";
        bytes memory utf8OtherAlphabetic357 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic357));
        console2.log("A80B: ", string(utf8OtherAlphabetic357));
        console2.logBytes(utf8OtherAlphabetic357);

        string memory otherAlphabetic358 = "\\u{A823}";
        bytes memory utf8OtherAlphabetic358 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic358));
        console2.log("A823: ", string(utf8OtherAlphabetic358));
        console2.logBytes(utf8OtherAlphabetic358);

        string memory otherAlphabetic359 = "\\u{A824}";
        bytes memory utf8OtherAlphabetic359 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic359));
        console2.log("A824: ", string(utf8OtherAlphabetic359));
        console2.logBytes(utf8OtherAlphabetic359);

        string memory otherAlphabetic360 = "\\u{A825}";
        bytes memory utf8OtherAlphabetic360 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic360));
        console2.log("A825: ", string(utf8OtherAlphabetic360));
        console2.logBytes(utf8OtherAlphabetic360);

        string memory otherAlphabetic361 = "\\u{A826}";
        bytes memory utf8OtherAlphabetic361 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic361));
        console2.log("A826: ", string(utf8OtherAlphabetic361));
        console2.logBytes(utf8OtherAlphabetic361);

        string memory otherAlphabetic362 = "\\u{A827}";
        bytes memory utf8OtherAlphabetic362 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic362));
        console2.log("A827: ", string(utf8OtherAlphabetic362));
        console2.logBytes(utf8OtherAlphabetic362);

        string memory otherAlphabetic363 = "\\u{A880}";
        bytes memory utf8OtherAlphabetic363 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic363));
        console2.log("A880: ", string(utf8OtherAlphabetic363));
        console2.logBytes(utf8OtherAlphabetic363);

        string memory otherAlphabetic364 = "\\u{A881}";
        bytes memory utf8OtherAlphabetic364 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic364));
        console2.log("A881: ", string(utf8OtherAlphabetic364));
        console2.logBytes(utf8OtherAlphabetic364);

        string memory otherAlphabetic365 = "\\u{A8B4}";
        bytes memory utf8OtherAlphabetic365 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic365));
        console2.log("A8B4: ", string(utf8OtherAlphabetic365));
        console2.logBytes(utf8OtherAlphabetic365);

        string memory otherAlphabetic366 = "\\u{A8C3}";
        bytes memory utf8OtherAlphabetic366 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic366));
        console2.log("A8C3: ", string(utf8OtherAlphabetic366));
        console2.logBytes(utf8OtherAlphabetic366);

        string memory otherAlphabetic367 = "\\u{A8C5}";
        bytes memory utf8OtherAlphabetic367 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic367));
        console2.log("A8C5: ", string(utf8OtherAlphabetic367));
        console2.logBytes(utf8OtherAlphabetic367);

        string memory otherAlphabetic368 = "\\u{A8FF}";
        bytes memory utf8OtherAlphabetic368 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic368));
        console2.log("A8FF: ", string(utf8OtherAlphabetic368));
        console2.logBytes(utf8OtherAlphabetic368);

        string memory otherAlphabetic369 = "\\u{A926}";
        bytes memory utf8OtherAlphabetic369 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic369));
        console2.log("A926: ", string(utf8OtherAlphabetic369));
        console2.logBytes(utf8OtherAlphabetic369);

        string memory otherAlphabetic370 = "\\u{A92A}";
        bytes memory utf8OtherAlphabetic370 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic370));
        console2.log("A92A: ", string(utf8OtherAlphabetic370));
        console2.logBytes(utf8OtherAlphabetic370);

        string memory otherAlphabetic371 = "\\u{A947}";
        bytes memory utf8OtherAlphabetic371 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic371));
        console2.log("A947: ", string(utf8OtherAlphabetic371));
        console2.logBytes(utf8OtherAlphabetic371);

        string memory otherAlphabetic372 = "\\u{A951}";
        bytes memory utf8OtherAlphabetic372 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic372));
        console2.log("A951: ", string(utf8OtherAlphabetic372));
        console2.logBytes(utf8OtherAlphabetic372);

        string memory otherAlphabetic373 = "\\u{A952}";
        bytes memory utf8OtherAlphabetic373 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic373));
        console2.log("A952: ", string(utf8OtherAlphabetic373));
        console2.logBytes(utf8OtherAlphabetic373);

        string memory otherAlphabetic374 = "\\u{A980}";
        bytes memory utf8OtherAlphabetic374 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic374));
        console2.log("A980: ", string(utf8OtherAlphabetic374));
        console2.logBytes(utf8OtherAlphabetic374);

        string memory otherAlphabetic375 = "\\u{A982}";
        bytes memory utf8OtherAlphabetic375 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic375));
        console2.log("A982: ", string(utf8OtherAlphabetic375));
        console2.logBytes(utf8OtherAlphabetic375);

        string memory otherAlphabetic376 = "\\u{A983}";
        bytes memory utf8OtherAlphabetic376 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic376));
        console2.log("A983: ", string(utf8OtherAlphabetic376));
        console2.logBytes(utf8OtherAlphabetic376);

        string memory otherAlphabetic377 = "\\u{A9B4}";
        bytes memory utf8OtherAlphabetic377 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic377));
        console2.log("A9B4: ", string(utf8OtherAlphabetic377));
        console2.logBytes(utf8OtherAlphabetic377);

        string memory otherAlphabetic378 = "\\u{A9B5}";
        bytes memory utf8OtherAlphabetic378 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic378));
        console2.log("A9B5: ", string(utf8OtherAlphabetic378));
        console2.logBytes(utf8OtherAlphabetic378);

        string memory otherAlphabetic379 = "\\u{A9B6}";
        bytes memory utf8OtherAlphabetic379 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic379));
        console2.log("A9B6: ", string(utf8OtherAlphabetic379));
        console2.logBytes(utf8OtherAlphabetic379);

        string memory otherAlphabetic380 = "\\u{A9B9}";
        bytes memory utf8OtherAlphabetic380 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic380));
        console2.log("A9B9: ", string(utf8OtherAlphabetic380));
        console2.logBytes(utf8OtherAlphabetic380);

        string memory otherAlphabetic381 = "\\u{A9BA}";
        bytes memory utf8OtherAlphabetic381 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic381));
        console2.log("A9BA: ", string(utf8OtherAlphabetic381));
        console2.logBytes(utf8OtherAlphabetic381);

        string memory otherAlphabetic382 = "\\u{A9BB}";
        bytes memory utf8OtherAlphabetic382 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic382));
        console2.log("A9BB: ", string(utf8OtherAlphabetic382));
        console2.logBytes(utf8OtherAlphabetic382);

        string memory otherAlphabetic383 = "\\u{A9BC}";
        bytes memory utf8OtherAlphabetic383 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic383));
        console2.log("A9BC: ", string(utf8OtherAlphabetic383));
        console2.logBytes(utf8OtherAlphabetic383);

        string memory otherAlphabetic384 = "\\u{A9BD}";
        bytes memory utf8OtherAlphabetic384 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic384));
        console2.log("A9BD: ", string(utf8OtherAlphabetic384));
        console2.logBytes(utf8OtherAlphabetic384);

        string memory otherAlphabetic385 = "\\u{A9BE}";
        bytes memory utf8OtherAlphabetic385 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic385));
        console2.log("A9BE: ", string(utf8OtherAlphabetic385));
        console2.logBytes(utf8OtherAlphabetic385);

        string memory otherAlphabetic386 = "\\u{A9BF}";
        bytes memory utf8OtherAlphabetic386 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic386));
        console2.log("A9BF: ", string(utf8OtherAlphabetic386));
        console2.logBytes(utf8OtherAlphabetic386);

        string memory otherAlphabetic387 = "\\u{A9E5}";
        bytes memory utf8OtherAlphabetic387 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic387));
        console2.log("A9E5: ", string(utf8OtherAlphabetic387));
        console2.logBytes(utf8OtherAlphabetic387);

        string memory otherAlphabetic388 = "\\u{AA29}";
        bytes memory utf8OtherAlphabetic388 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic388));
        console2.log("AA29: ", string(utf8OtherAlphabetic388));
        console2.logBytes(utf8OtherAlphabetic388);

        string memory otherAlphabetic389 = "\\u{AA2E}";
        bytes memory utf8OtherAlphabetic389 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic389));
        console2.log("AA2E: ", string(utf8OtherAlphabetic389));
        console2.logBytes(utf8OtherAlphabetic389);

        string memory otherAlphabetic390 = "\\u{AA2F}";
        bytes memory utf8OtherAlphabetic390 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic390));
        console2.log("AA2F: ", string(utf8OtherAlphabetic390));
        console2.logBytes(utf8OtherAlphabetic390);

        string memory otherAlphabetic391 = "\\u{AA30}";
        bytes memory utf8OtherAlphabetic391 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic391));
        console2.log("AA30: ", string(utf8OtherAlphabetic391));
        console2.logBytes(utf8OtherAlphabetic391);

        string memory otherAlphabetic392 = "\\u{AA31}";
        bytes memory utf8OtherAlphabetic392 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic392));
        console2.log("AA31: ", string(utf8OtherAlphabetic392));
        console2.logBytes(utf8OtherAlphabetic392);

        string memory otherAlphabetic393 = "\\u{AA32}";
        bytes memory utf8OtherAlphabetic393 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic393));
        console2.log("AA32: ", string(utf8OtherAlphabetic393));
        console2.logBytes(utf8OtherAlphabetic393);

        string memory otherAlphabetic394 = "\\u{AA33}";
        bytes memory utf8OtherAlphabetic394 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic394));
        console2.log("AA33: ", string(utf8OtherAlphabetic394));
        console2.logBytes(utf8OtherAlphabetic394);

        string memory otherAlphabetic395 = "\\u{AA34}";
        bytes memory utf8OtherAlphabetic395 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic395));
        console2.log("AA34: ", string(utf8OtherAlphabetic395));
        console2.logBytes(utf8OtherAlphabetic395);

        string memory otherAlphabetic396 = "\\u{AA35}";
        bytes memory utf8OtherAlphabetic396 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic396));
        console2.log("AA35: ", string(utf8OtherAlphabetic396));
        console2.logBytes(utf8OtherAlphabetic396);

        string memory otherAlphabetic397 = "\\u{AA36}";
        bytes memory utf8OtherAlphabetic397 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic397));
        console2.log("AA36: ", string(utf8OtherAlphabetic397));
        console2.logBytes(utf8OtherAlphabetic397);

        string memory otherAlphabetic398 = "\\u{AA43}";
        bytes memory utf8OtherAlphabetic398 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic398));
        console2.log("AA43: ", string(utf8OtherAlphabetic398));
        console2.logBytes(utf8OtherAlphabetic398);

        string memory otherAlphabetic399 = "\\u{AA4C}";
        bytes memory utf8OtherAlphabetic399 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic399));
        console2.log("AA4C: ", string(utf8OtherAlphabetic399));
        console2.logBytes(utf8OtherAlphabetic399);

        string memory otherAlphabetic400 = "\\u{AA4D}";
        bytes memory utf8OtherAlphabetic400 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic400));
        console2.log("AA4D: ", string(utf8OtherAlphabetic400));
        console2.logBytes(utf8OtherAlphabetic400);

        string memory otherAlphabetic401 = "\\u{AA7B}";
        bytes memory utf8OtherAlphabetic401 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic401));
        console2.log("AA7B: ", string(utf8OtherAlphabetic401));
        console2.logBytes(utf8OtherAlphabetic401);

        string memory otherAlphabetic402 = "\\u{AA7C}";
        bytes memory utf8OtherAlphabetic402 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic402));
        console2.log("AA7C: ", string(utf8OtherAlphabetic402));
        console2.logBytes(utf8OtherAlphabetic402);

        string memory otherAlphabetic403 = "\\u{AA7D}";
        bytes memory utf8OtherAlphabetic403 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic403));
        console2.log("AA7D: ", string(utf8OtherAlphabetic403));
        console2.logBytes(utf8OtherAlphabetic403);

        string memory otherAlphabetic404 = "\\u{AAB0}";
        bytes memory utf8OtherAlphabetic404 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic404));
        console2.log("AAB0: ", string(utf8OtherAlphabetic404));
        console2.logBytes(utf8OtherAlphabetic404);

        string memory otherAlphabetic405 = "\\u{AAB2}";
        bytes memory utf8OtherAlphabetic405 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic405));
        console2.log("AAB2: ", string(utf8OtherAlphabetic405));
        console2.logBytes(utf8OtherAlphabetic405);

        string memory otherAlphabetic406 = "\\u{AAB4}";
        bytes memory utf8OtherAlphabetic406 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic406));
        console2.log("AAB4: ", string(utf8OtherAlphabetic406));
        console2.logBytes(utf8OtherAlphabetic406);

        string memory otherAlphabetic407 = "\\u{AAB7}";
        bytes memory utf8OtherAlphabetic407 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic407));
        console2.log("AAB7: ", string(utf8OtherAlphabetic407));
        console2.logBytes(utf8OtherAlphabetic407);

        string memory otherAlphabetic408 = "\\u{AAB8}";
        bytes memory utf8OtherAlphabetic408 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic408));
        console2.log("AAB8: ", string(utf8OtherAlphabetic408));
        console2.logBytes(utf8OtherAlphabetic408);

        string memory otherAlphabetic409 = "\\u{AABE}";
        bytes memory utf8OtherAlphabetic409 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic409));
        console2.log("AABE: ", string(utf8OtherAlphabetic409));
        console2.logBytes(utf8OtherAlphabetic409);

        string memory otherAlphabetic410 = "\\u{AAEB}";
        bytes memory utf8OtherAlphabetic410 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic410));
        console2.log("AAEB: ", string(utf8OtherAlphabetic410));
        console2.logBytes(utf8OtherAlphabetic410);

        string memory otherAlphabetic411 = "\\u{AAEC}";
        bytes memory utf8OtherAlphabetic411 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic411));
        console2.log("AAEC: ", string(utf8OtherAlphabetic411));
        console2.logBytes(utf8OtherAlphabetic411);

        string memory otherAlphabetic412 = "\\u{AAED}";
        bytes memory utf8OtherAlphabetic412 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic412));
        console2.log("AAED: ", string(utf8OtherAlphabetic412));
        console2.logBytes(utf8OtherAlphabetic412);

        string memory otherAlphabetic413 = "\\u{AAEE}";
        bytes memory utf8OtherAlphabetic413 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic413));
        console2.log("AAEE: ", string(utf8OtherAlphabetic413));
        console2.logBytes(utf8OtherAlphabetic413);

        string memory otherAlphabetic414 = "\\u{AAEF}";
        bytes memory utf8OtherAlphabetic414 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic414));
        console2.log("AAEF: ", string(utf8OtherAlphabetic414));
        console2.logBytes(utf8OtherAlphabetic414);

        string memory otherAlphabetic415 = "\\u{AAF5}";
        bytes memory utf8OtherAlphabetic415 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic415));
        console2.log("AAF5: ", string(utf8OtherAlphabetic415));
        console2.logBytes(utf8OtherAlphabetic415);

        string memory otherAlphabetic416 = "\\u{ABE3}";
        bytes memory utf8OtherAlphabetic416 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic416));
        console2.log("ABE3: ", string(utf8OtherAlphabetic416));
        console2.logBytes(utf8OtherAlphabetic416);

        string memory otherAlphabetic417 = "\\u{ABE4}";
        bytes memory utf8OtherAlphabetic417 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic417));
        console2.log("ABE4: ", string(utf8OtherAlphabetic417));
        console2.logBytes(utf8OtherAlphabetic417);

        string memory otherAlphabetic418 = "\\u{ABE5}";
        bytes memory utf8OtherAlphabetic418 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic418));
        console2.log("ABE5: ", string(utf8OtherAlphabetic418));
        console2.logBytes(utf8OtherAlphabetic418);

        string memory otherAlphabetic419 = "\\u{ABE6}";
        bytes memory utf8OtherAlphabetic419 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic419));
        console2.log("ABE6: ", string(utf8OtherAlphabetic419));
        console2.logBytes(utf8OtherAlphabetic419);

        string memory otherAlphabetic420 = "\\u{ABE7}";
        bytes memory utf8OtherAlphabetic420 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic420));
        console2.log("ABE7: ", string(utf8OtherAlphabetic420));
        console2.logBytes(utf8OtherAlphabetic420);

        string memory otherAlphabetic421 = "\\u{ABE8}";
        bytes memory utf8OtherAlphabetic421 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic421));
        console2.log("ABE8: ", string(utf8OtherAlphabetic421));
        console2.logBytes(utf8OtherAlphabetic421);

        string memory otherAlphabetic422 = "\\u{ABE9}";
        bytes memory utf8OtherAlphabetic422 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic422));
        console2.log("ABE9: ", string(utf8OtherAlphabetic422));
        console2.logBytes(utf8OtherAlphabetic422);

        string memory otherAlphabetic423 = "\\u{ABEA}";
        bytes memory utf8OtherAlphabetic423 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic423));
        console2.log("ABEA: ", string(utf8OtherAlphabetic423));
        console2.logBytes(utf8OtherAlphabetic423);

        string memory otherAlphabetic424 = "\\u{FB1E}";
        bytes memory utf8OtherAlphabetic424 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic424));
        console2.log("FB1E: ", string(utf8OtherAlphabetic424));
        console2.logBytes(utf8OtherAlphabetic424);

        string memory otherAlphabetic425 = "\\u{10376}";
        bytes memory utf8OtherAlphabetic425 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic425));
        console2.log("10376: ", string(utf8OtherAlphabetic425));
        console2.logBytes(utf8OtherAlphabetic425);

        string memory otherAlphabetic426 = "\\u{1037A}";
        bytes memory utf8OtherAlphabetic426 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic426));
        console2.log("1037A: ", string(utf8OtherAlphabetic426));
        console2.logBytes(utf8OtherAlphabetic426);

        string memory otherAlphabetic427 = "\\u{10A01}";
        bytes memory utf8OtherAlphabetic427 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic427));
        console2.log("10A01: ", string(utf8OtherAlphabetic427));
        console2.logBytes(utf8OtherAlphabetic427);

        string memory otherAlphabetic428 = "\\u{10A03}";
        bytes memory utf8OtherAlphabetic428 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic428));
        console2.log("10A03: ", string(utf8OtherAlphabetic428));
        console2.logBytes(utf8OtherAlphabetic428);

        string memory otherAlphabetic429 = "\\u{10A05}";
        bytes memory utf8OtherAlphabetic429 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic429));
        console2.log("10A05: ", string(utf8OtherAlphabetic429));
        console2.logBytes(utf8OtherAlphabetic429);

        string memory otherAlphabetic430 = "\\u{10A06}";
        bytes memory utf8OtherAlphabetic430 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic430));
        console2.log("10A06: ", string(utf8OtherAlphabetic430));
        console2.logBytes(utf8OtherAlphabetic430);

        string memory otherAlphabetic431 = "\\u{10A0C}";
        bytes memory utf8OtherAlphabetic431 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic431));
        console2.log("10A0C: ", string(utf8OtherAlphabetic431));
        console2.logBytes(utf8OtherAlphabetic431);

        string memory otherAlphabetic432 = "\\u{10A0F}";
        bytes memory utf8OtherAlphabetic432 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic432));
        console2.log("10A0F: ", string(utf8OtherAlphabetic432));
        console2.logBytes(utf8OtherAlphabetic432);

        string memory otherAlphabetic433 = "\\u{10D24}";
        bytes memory utf8OtherAlphabetic433 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic433));
        console2.log("10D24: ", string(utf8OtherAlphabetic433));
        console2.logBytes(utf8OtherAlphabetic433);

        string memory otherAlphabetic434 = "\\u{10D27}";
        bytes memory utf8OtherAlphabetic434 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic434));
        console2.log("10D27: ", string(utf8OtherAlphabetic434));
        console2.logBytes(utf8OtherAlphabetic434);

        string memory otherAlphabetic435 = "\\u{10D69}";
        bytes memory utf8OtherAlphabetic435 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic435));
        console2.log("10D69: ", string(utf8OtherAlphabetic435));
        console2.logBytes(utf8OtherAlphabetic435);

        string memory otherAlphabetic436 = "\\u{10EAB}";
        bytes memory utf8OtherAlphabetic436 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic436));
        console2.log("10EAB: ", string(utf8OtherAlphabetic436));
        console2.logBytes(utf8OtherAlphabetic436);

        string memory otherAlphabetic437 = "\\u{10EAC}";
        bytes memory utf8OtherAlphabetic437 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic437));
        console2.log("10EAC: ", string(utf8OtherAlphabetic437));
        console2.logBytes(utf8OtherAlphabetic437);

        string memory otherAlphabetic438 = "\\u{10EFA}";
        bytes memory utf8OtherAlphabetic438 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic438));
        console2.log("10EFA: ", string(utf8OtherAlphabetic438));
        console2.logBytes(utf8OtherAlphabetic438);

        string memory otherAlphabetic439 = "\\u{10EFC}";
        bytes memory utf8OtherAlphabetic439 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic439));
        console2.log("10EFC: ", string(utf8OtherAlphabetic439));
        console2.logBytes(utf8OtherAlphabetic439);

        string memory otherAlphabetic440 = "\\u{11000}";
        bytes memory utf8OtherAlphabetic440 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic440));
        console2.log("11000: ", string(utf8OtherAlphabetic440));
        console2.logBytes(utf8OtherAlphabetic440);

        string memory otherAlphabetic441 = "\\u{11001}";
        bytes memory utf8OtherAlphabetic441 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic441));
        console2.log("11001: ", string(utf8OtherAlphabetic441));
        console2.logBytes(utf8OtherAlphabetic441);

        string memory otherAlphabetic442 = "\\u{11002}";
        bytes memory utf8OtherAlphabetic442 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic442));
        console2.log("11002: ", string(utf8OtherAlphabetic442));
        console2.logBytes(utf8OtherAlphabetic442);

        string memory otherAlphabetic443 = "\\u{11038}";
        bytes memory utf8OtherAlphabetic443 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic443));
        console2.log("11038: ", string(utf8OtherAlphabetic443));
        console2.logBytes(utf8OtherAlphabetic443);

        string memory otherAlphabetic444 = "\\u{11045}";
        bytes memory utf8OtherAlphabetic444 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic444));
        console2.log("11045: ", string(utf8OtherAlphabetic444));
        console2.logBytes(utf8OtherAlphabetic444);

        string memory otherAlphabetic445 = "\\u{11073}";
        bytes memory utf8OtherAlphabetic445 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic445));
        console2.log("11073: ", string(utf8OtherAlphabetic445));
        console2.logBytes(utf8OtherAlphabetic445);

        string memory otherAlphabetic446 = "\\u{11074}";
        bytes memory utf8OtherAlphabetic446 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic446));
        console2.log("11074: ", string(utf8OtherAlphabetic446));
        console2.logBytes(utf8OtherAlphabetic446);

        string memory otherAlphabetic447 = "\\u{11080}";
        bytes memory utf8OtherAlphabetic447 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic447));
        console2.log("11080: ", string(utf8OtherAlphabetic447));
        console2.logBytes(utf8OtherAlphabetic447);

        string memory otherAlphabetic448 = "\\u{11081}";
        bytes memory utf8OtherAlphabetic448 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic448));
        console2.log("11081: ", string(utf8OtherAlphabetic448));
        console2.logBytes(utf8OtherAlphabetic448);

        string memory otherAlphabetic449 = "\\u{11082}";
        bytes memory utf8OtherAlphabetic449 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic449));
        console2.log("11082: ", string(utf8OtherAlphabetic449));
        console2.logBytes(utf8OtherAlphabetic449);

        string memory otherAlphabetic450 = "\\u{110B0}";
        bytes memory utf8OtherAlphabetic450 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic450));
        console2.log("110B0: ", string(utf8OtherAlphabetic450));
        console2.logBytes(utf8OtherAlphabetic450);

        string memory otherAlphabetic451 = "\\u{110B2}";
        bytes memory utf8OtherAlphabetic451 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic451));
        console2.log("110B2: ", string(utf8OtherAlphabetic451));
        console2.logBytes(utf8OtherAlphabetic451);

        string memory otherAlphabetic452 = "\\u{110B3}";
        bytes memory utf8OtherAlphabetic452 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic452));
        console2.log("110B3: ", string(utf8OtherAlphabetic452));
        console2.logBytes(utf8OtherAlphabetic452);

        string memory otherAlphabetic453 = "\\u{110B6}";
        bytes memory utf8OtherAlphabetic453 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic453));
        console2.log("110B6: ", string(utf8OtherAlphabetic453));
        console2.logBytes(utf8OtherAlphabetic453);

        string memory otherAlphabetic454 = "\\u{110B7}";
        bytes memory utf8OtherAlphabetic454 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic454));
        console2.log("110B7: ", string(utf8OtherAlphabetic454));
        console2.logBytes(utf8OtherAlphabetic454);

        string memory otherAlphabetic455 = "\\u{110B8}";
        bytes memory utf8OtherAlphabetic455 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic455));
        console2.log("110B8: ", string(utf8OtherAlphabetic455));
        console2.logBytes(utf8OtherAlphabetic455);

        string memory otherAlphabetic456 = "\\u{110C2}";
        bytes memory utf8OtherAlphabetic456 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic456));
        console2.log("110C2: ", string(utf8OtherAlphabetic456));
        console2.logBytes(utf8OtherAlphabetic456);

        string memory otherAlphabetic457 = "\\u{11100}";
        bytes memory utf8OtherAlphabetic457 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic457));
        console2.log("11100: ", string(utf8OtherAlphabetic457));
        console2.logBytes(utf8OtherAlphabetic457);

        string memory otherAlphabetic458 = "\\u{11102}";
        bytes memory utf8OtherAlphabetic458 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic458));
        console2.log("11102: ", string(utf8OtherAlphabetic458));
        console2.logBytes(utf8OtherAlphabetic458);

        string memory otherAlphabetic459 = "\\u{11127}";
        bytes memory utf8OtherAlphabetic459 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic459));
        console2.log("11127: ", string(utf8OtherAlphabetic459));
        console2.logBytes(utf8OtherAlphabetic459);

        string memory otherAlphabetic460 = "\\u{1112B}";
        bytes memory utf8OtherAlphabetic460 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic460));
        console2.log("1112B: ", string(utf8OtherAlphabetic460));
        console2.logBytes(utf8OtherAlphabetic460);

        string memory otherAlphabetic461 = "\\u{1112C}";
        bytes memory utf8OtherAlphabetic461 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic461));
        console2.log("1112C: ", string(utf8OtherAlphabetic461));
        console2.logBytes(utf8OtherAlphabetic461);

        string memory otherAlphabetic462 = "\\u{1112D}";
        bytes memory utf8OtherAlphabetic462 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic462));
        console2.log("1112D: ", string(utf8OtherAlphabetic462));
        console2.logBytes(utf8OtherAlphabetic462);

        string memory otherAlphabetic463 = "\\u{11132}";
        bytes memory utf8OtherAlphabetic463 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic463));
        console2.log("11132: ", string(utf8OtherAlphabetic463));
        console2.logBytes(utf8OtherAlphabetic463);

        string memory otherAlphabetic464 = "\\u{11145}";
        bytes memory utf8OtherAlphabetic464 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic464));
        console2.log("11145: ", string(utf8OtherAlphabetic464));
        console2.logBytes(utf8OtherAlphabetic464);

        string memory otherAlphabetic465 = "\\u{11146}";
        bytes memory utf8OtherAlphabetic465 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic465));
        console2.log("11146: ", string(utf8OtherAlphabetic465));
        console2.logBytes(utf8OtherAlphabetic465);

        string memory otherAlphabetic466 = "\\u{11180}";
        bytes memory utf8OtherAlphabetic466 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic466));
        console2.log("11180: ", string(utf8OtherAlphabetic466));
        console2.logBytes(utf8OtherAlphabetic466);

        string memory otherAlphabetic467 = "\\u{11181}";
        bytes memory utf8OtherAlphabetic467 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic467));
        console2.log("11181: ", string(utf8OtherAlphabetic467));
        console2.logBytes(utf8OtherAlphabetic467);

        string memory otherAlphabetic468 = "\\u{11182}";
        bytes memory utf8OtherAlphabetic468 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic468));
        console2.log("11182: ", string(utf8OtherAlphabetic468));
        console2.logBytes(utf8OtherAlphabetic468);

        string memory otherAlphabetic469 = "\\u{111B3}";
        bytes memory utf8OtherAlphabetic469 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic469));
        console2.log("111B3: ", string(utf8OtherAlphabetic469));
        console2.logBytes(utf8OtherAlphabetic469);

        string memory otherAlphabetic470 = "\\u{111B5}";
        bytes memory utf8OtherAlphabetic470 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic470));
        console2.log("111B5: ", string(utf8OtherAlphabetic470));
        console2.logBytes(utf8OtherAlphabetic470);

        string memory otherAlphabetic471 = "\\u{111B6}";
        bytes memory utf8OtherAlphabetic471 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic471));
        console2.log("111B6: ", string(utf8OtherAlphabetic471));
        console2.logBytes(utf8OtherAlphabetic471);

        string memory otherAlphabetic472 = "\\u{111BE}";
        bytes memory utf8OtherAlphabetic472 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic472));
        console2.log("111BE: ", string(utf8OtherAlphabetic472));
        console2.logBytes(utf8OtherAlphabetic472);

        string memory otherAlphabetic473 = "\\u{111BF}";
        bytes memory utf8OtherAlphabetic473 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic473));
        console2.log("111BF: ", string(utf8OtherAlphabetic473));
        console2.logBytes(utf8OtherAlphabetic473);

        string memory otherAlphabetic474 = "\\u{111CE}";
        bytes memory utf8OtherAlphabetic474 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic474));
        console2.log("111CE: ", string(utf8OtherAlphabetic474));
        console2.logBytes(utf8OtherAlphabetic474);

        string memory otherAlphabetic475 = "\\u{111CF}";
        bytes memory utf8OtherAlphabetic475 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic475));
        console2.log("111CF: ", string(utf8OtherAlphabetic475));
        console2.logBytes(utf8OtherAlphabetic475);

        string memory otherAlphabetic476 = "\\u{1122C}";
        bytes memory utf8OtherAlphabetic476 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic476));
        console2.log("1122C: ", string(utf8OtherAlphabetic476));
        console2.logBytes(utf8OtherAlphabetic476);

        string memory otherAlphabetic477 = "\\u{1122E}";
        bytes memory utf8OtherAlphabetic477 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic477));
        console2.log("1122E: ", string(utf8OtherAlphabetic477));
        console2.logBytes(utf8OtherAlphabetic477);

        string memory otherAlphabetic478 = "\\u{1122F}";
        bytes memory utf8OtherAlphabetic478 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic478));
        console2.log("1122F: ", string(utf8OtherAlphabetic478));
        console2.logBytes(utf8OtherAlphabetic478);

        string memory otherAlphabetic479 = "\\u{11231}";
        bytes memory utf8OtherAlphabetic479 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic479));
        console2.log("11231: ", string(utf8OtherAlphabetic479));
        console2.logBytes(utf8OtherAlphabetic479);

        string memory otherAlphabetic480 = "\\u{11232}";
        bytes memory utf8OtherAlphabetic480 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic480));
        console2.log("11232: ", string(utf8OtherAlphabetic480));
        console2.logBytes(utf8OtherAlphabetic480);

        string memory otherAlphabetic481 = "\\u{11233}";
        bytes memory utf8OtherAlphabetic481 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic481));
        console2.log("11233: ", string(utf8OtherAlphabetic481));
        console2.logBytes(utf8OtherAlphabetic481);

        string memory otherAlphabetic482 = "\\u{11234}";
        bytes memory utf8OtherAlphabetic482 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic482));
        console2.log("11234: ", string(utf8OtherAlphabetic482));
        console2.logBytes(utf8OtherAlphabetic482);

        string memory otherAlphabetic483 = "\\u{11237}";
        bytes memory utf8OtherAlphabetic483 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic483));
        console2.log("11237: ", string(utf8OtherAlphabetic483));
        console2.logBytes(utf8OtherAlphabetic483);

        string memory otherAlphabetic484 = "\\u{1123E}";
        bytes memory utf8OtherAlphabetic484 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic484));
        console2.log("1123E: ", string(utf8OtherAlphabetic484));
        console2.logBytes(utf8OtherAlphabetic484);

        string memory otherAlphabetic485 = "\\u{11241}";
        bytes memory utf8OtherAlphabetic485 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic485));
        console2.log("11241: ", string(utf8OtherAlphabetic485));
        console2.logBytes(utf8OtherAlphabetic485);

        string memory otherAlphabetic486 = "\\u{112DF}";
        bytes memory utf8OtherAlphabetic486 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic486));
        console2.log("112DF: ", string(utf8OtherAlphabetic486));
        console2.logBytes(utf8OtherAlphabetic486);

        string memory otherAlphabetic487 = "\\u{112E0}";
        bytes memory utf8OtherAlphabetic487 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic487));
        console2.log("112E0: ", string(utf8OtherAlphabetic487));
        console2.logBytes(utf8OtherAlphabetic487);

        string memory otherAlphabetic488 = "\\u{112E2}";
        bytes memory utf8OtherAlphabetic488 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic488));
        console2.log("112E2: ", string(utf8OtherAlphabetic488));
        console2.logBytes(utf8OtherAlphabetic488);

        string memory otherAlphabetic489 = "\\u{112E3}";
        bytes memory utf8OtherAlphabetic489 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic489));
        console2.log("112E3: ", string(utf8OtherAlphabetic489));
        console2.logBytes(utf8OtherAlphabetic489);

        string memory otherAlphabetic490 = "\\u{112E8}";
        bytes memory utf8OtherAlphabetic490 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic490));
        console2.log("112E8: ", string(utf8OtherAlphabetic490));
        console2.logBytes(utf8OtherAlphabetic490);

        // Remaining other alphabetic Unicode codepoints are inscripted in the next function `testRegexPropertyOtherAlphabetic2`
        // beyond this LoC, any extra commented-in LoC causes Stack-Overflow
        // wanna try? inscript any valid LoC or comment LoCs below back in.
        // console2.log("stack overflow testinnnggg....");
        // string memory otherAlphabetic491 = "\\u{11300}";
        // bytes memory utf8OtherAlphabetic491 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic491));
        // console2.log("11300: ", string(utf8OtherAlphabetic491));
        // console2.logBytes(utf8OtherAlphabetic491);
    }

    function testRegexPropertyOtherAlphabetic2() public pure {
        string memory otherAlphabetic491 = "\\u{11300}";
        bytes memory utf8OtherAlphabetic491 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic491));
        console2.log("11300: ", string(utf8OtherAlphabetic491));
        console2.logBytes(utf8OtherAlphabetic491);

        string memory otherAlphabetic492 = "\\u{11301}";
        bytes memory utf8OtherAlphabetic492 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic492));
        console2.log("11301: ", string(utf8OtherAlphabetic492));
        console2.logBytes(utf8OtherAlphabetic492);

        string memory otherAlphabetic493 = "\\u{11302}";
        bytes memory utf8OtherAlphabetic493 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic493));
        console2.log("11302: ", string(utf8OtherAlphabetic493));
        console2.logBytes(utf8OtherAlphabetic493);

        string memory otherAlphabetic494 = "\\u{11303}";
        bytes memory utf8OtherAlphabetic494 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic494));
        console2.log("11303: ", string(utf8OtherAlphabetic494));
        console2.logBytes(utf8OtherAlphabetic494);

        string memory otherAlphabetic495 = "\\u{1133E}";
        bytes memory utf8OtherAlphabetic495 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic495));
        console2.log("1133E: ", string(utf8OtherAlphabetic495));
        console2.logBytes(utf8OtherAlphabetic495);

        string memory otherAlphabetic496 = "\\u{1133F}";
        bytes memory utf8OtherAlphabetic496 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic496));
        console2.log("1133F: ", string(utf8OtherAlphabetic496));
        console2.logBytes(utf8OtherAlphabetic496);

        string memory otherAlphabetic497 = "\\u{11340}";
        bytes memory utf8OtherAlphabetic497 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic497));
        console2.log("11340: ", string(utf8OtherAlphabetic497));
        console2.logBytes(utf8OtherAlphabetic497);

        string memory otherAlphabetic498 = "\\u{11341}";
        bytes memory utf8OtherAlphabetic498 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic498));
        console2.log("11341: ", string(utf8OtherAlphabetic498));
        console2.logBytes(utf8OtherAlphabetic498);

        string memory otherAlphabetic499 = "\\u{11344}";
        bytes memory utf8OtherAlphabetic499 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic499));
        console2.log("11344: ", string(utf8OtherAlphabetic499));
        console2.logBytes(utf8OtherAlphabetic499);

        string memory otherAlphabetic500 = "\\u{11347}";
        bytes memory utf8OtherAlphabetic500 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic500));
        console2.log("11347: ", string(utf8OtherAlphabetic500));
        console2.logBytes(utf8OtherAlphabetic500);

        string memory otherAlphabetic501 = "\\u{11348}";
        bytes memory utf8OtherAlphabetic501 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic501));
        console2.log("11348: ", string(utf8OtherAlphabetic501));
        console2.logBytes(utf8OtherAlphabetic501);

        string memory otherAlphabetic502 = "\\u{1134B}";
        bytes memory utf8OtherAlphabetic502 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic502));
        console2.log("1134B: ", string(utf8OtherAlphabetic502));
        console2.logBytes(utf8OtherAlphabetic502);

        string memory otherAlphabetic503 = "\\u{1134C}";
        bytes memory utf8OtherAlphabetic503 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic503));
        console2.log("1134C: ", string(utf8OtherAlphabetic503));
        console2.logBytes(utf8OtherAlphabetic503);

        string memory otherAlphabetic504 = "\\u{11357}";
        bytes memory utf8OtherAlphabetic504 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic504));
        console2.log("11357: ", string(utf8OtherAlphabetic504));
        console2.logBytes(utf8OtherAlphabetic504);

        string memory otherAlphabetic505 = "\\u{11362}";
        bytes memory utf8OtherAlphabetic505 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic505));
        console2.log("11362: ", string(utf8OtherAlphabetic505));
        console2.logBytes(utf8OtherAlphabetic505);

        string memory otherAlphabetic506 = "\\u{11363}";
        bytes memory utf8OtherAlphabetic506 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic506));
        console2.log("11363: ", string(utf8OtherAlphabetic506));
        console2.logBytes(utf8OtherAlphabetic506);

        string memory otherAlphabetic507 = "\\u{113B8}";
        bytes memory utf8OtherAlphabetic507 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic507));
        console2.log("113B8: ", string(utf8OtherAlphabetic507));
        console2.logBytes(utf8OtherAlphabetic507);

        string memory otherAlphabetic508 = "\\u{113BA}";
        bytes memory utf8OtherAlphabetic508 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic508));
        console2.log("113BA: ", string(utf8OtherAlphabetic508));
        console2.logBytes(utf8OtherAlphabetic508);

        string memory otherAlphabetic509 = "\\u{113BB}";
        bytes memory utf8OtherAlphabetic509 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic509));
        console2.log("113BB: ", string(utf8OtherAlphabetic509));
        console2.logBytes(utf8OtherAlphabetic509);

        string memory otherAlphabetic510 = "\\u{113C0}";
        bytes memory utf8OtherAlphabetic510 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic510));
        console2.log("113C0: ", string(utf8OtherAlphabetic510));
        console2.logBytes(utf8OtherAlphabetic510);

        string memory otherAlphabetic511 = "\\u{113C2}";
        bytes memory utf8OtherAlphabetic511 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic511));
        console2.log("113C2: ", string(utf8OtherAlphabetic511));
        console2.logBytes(utf8OtherAlphabetic511);

        string memory otherAlphabetic512 = "\\u{113C5}";
        bytes memory utf8OtherAlphabetic512 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic512));
        console2.log("113C5: ", string(utf8OtherAlphabetic512));
        console2.logBytes(utf8OtherAlphabetic512);

        string memory otherAlphabetic513 = "\\u{113C7}";
        bytes memory utf8OtherAlphabetic513 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic513));
        console2.log("113C7: ", string(utf8OtherAlphabetic513));
        console2.logBytes(utf8OtherAlphabetic513);

        string memory otherAlphabetic514 = "\\u{113CA}";
        bytes memory utf8OtherAlphabetic514 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic514));
        console2.log("113CA: ", string(utf8OtherAlphabetic514));
        console2.logBytes(utf8OtherAlphabetic514);

        string memory otherAlphabetic515 = "\\u{113CC}";
        bytes memory utf8OtherAlphabetic515 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic515));
        console2.log("113CC: ", string(utf8OtherAlphabetic515));
        console2.logBytes(utf8OtherAlphabetic515);

        string memory otherAlphabetic516 = "\\u{113CD}";
        bytes memory utf8OtherAlphabetic516 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic516));
        console2.log("113CD: ", string(utf8OtherAlphabetic516));
        console2.logBytes(utf8OtherAlphabetic516);

        string memory otherAlphabetic517 = "\\u{11435}";
        bytes memory utf8OtherAlphabetic517 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic517));
        console2.log("11435: ", string(utf8OtherAlphabetic517));
        console2.logBytes(utf8OtherAlphabetic517);

        string memory otherAlphabetic518 = "\\u{11437}";
        bytes memory utf8OtherAlphabetic518 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic518));
        console2.log("11437: ", string(utf8OtherAlphabetic518));
        console2.logBytes(utf8OtherAlphabetic518);

        string memory otherAlphabetic519 = "\\u{11438}";
        bytes memory utf8OtherAlphabetic519 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic519));
        console2.log("11438: ", string(utf8OtherAlphabetic519));
        console2.logBytes(utf8OtherAlphabetic519);

        string memory otherAlphabetic520 = "\\u{1143F}";
        bytes memory utf8OtherAlphabetic520 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic520));
        console2.log("1143F: ", string(utf8OtherAlphabetic520));
        console2.logBytes(utf8OtherAlphabetic520);

        string memory otherAlphabetic521 = "\\u{11440}";
        bytes memory utf8OtherAlphabetic521 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic521));
        console2.log("11440: ", string(utf8OtherAlphabetic521));
        console2.logBytes(utf8OtherAlphabetic521);

        string memory otherAlphabetic522 = "\\u{11441}";
        bytes memory utf8OtherAlphabetic522 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic522));
        console2.log("11441: ", string(utf8OtherAlphabetic522));
        console2.logBytes(utf8OtherAlphabetic522);

        string memory otherAlphabetic523 = "\\u{11443}";
        bytes memory utf8OtherAlphabetic523 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic523));
        console2.log("11443: ", string(utf8OtherAlphabetic523));
        console2.logBytes(utf8OtherAlphabetic523);

        string memory otherAlphabetic524 = "\\u{11444}";
        bytes memory utf8OtherAlphabetic524 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic524));
        console2.log("11444: ", string(utf8OtherAlphabetic524));
        console2.logBytes(utf8OtherAlphabetic524);

        string memory otherAlphabetic525 = "\\u{11445}";
        bytes memory utf8OtherAlphabetic525 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic525));
        console2.log("11445: ", string(utf8OtherAlphabetic525));
        console2.logBytes(utf8OtherAlphabetic525);

        string memory otherAlphabetic526 = "\\u{114B0}";
        bytes memory utf8OtherAlphabetic526 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic526));
        console2.log("114B0: ", string(utf8OtherAlphabetic526));
        console2.logBytes(utf8OtherAlphabetic526);

        string memory otherAlphabetic527 = "\\u{114B2}";
        bytes memory utf8OtherAlphabetic527 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic527));
        console2.log("114B2: ", string(utf8OtherAlphabetic527));
        console2.logBytes(utf8OtherAlphabetic527);

        string memory otherAlphabetic528 = "\\u{114B3}";
        bytes memory utf8OtherAlphabetic528 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic528));
        console2.log("114B3: ", string(utf8OtherAlphabetic528));
        console2.logBytes(utf8OtherAlphabetic528);

        string memory otherAlphabetic529 = "\\u{114B8}";
        bytes memory utf8OtherAlphabetic529 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic529));
        console2.log("114B8: ", string(utf8OtherAlphabetic529));
        console2.logBytes(utf8OtherAlphabetic529);

        string memory otherAlphabetic530 = "\\u{114B9}";
        bytes memory utf8OtherAlphabetic530 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic530));
        console2.log("114B9: ", string(utf8OtherAlphabetic530));
        console2.logBytes(utf8OtherAlphabetic530);

        string memory otherAlphabetic531 = "\\u{114BA}";
        bytes memory utf8OtherAlphabetic531 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic531));
        console2.log("114BA: ", string(utf8OtherAlphabetic531));
        console2.logBytes(utf8OtherAlphabetic531);

        string memory otherAlphabetic532 = "\\u{114BB}";
        bytes memory utf8OtherAlphabetic532 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic532));
        console2.log("114BB: ", string(utf8OtherAlphabetic532));
        console2.logBytes(utf8OtherAlphabetic532);

        string memory otherAlphabetic533 = "\\u{114BE}";
        bytes memory utf8OtherAlphabetic533 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic533));
        console2.log("114BE: ", string(utf8OtherAlphabetic533));
        console2.logBytes(utf8OtherAlphabetic533);

        string memory otherAlphabetic534 = "\\u{114BF}";
        bytes memory utf8OtherAlphabetic534 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic534));
        console2.log("114BF: ", string(utf8OtherAlphabetic534));
        console2.logBytes(utf8OtherAlphabetic534);

        string memory otherAlphabetic535 = "\\u{114C0}";
        bytes memory utf8OtherAlphabetic535 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic535));
        console2.log("114C0: ", string(utf8OtherAlphabetic535));
        console2.logBytes(utf8OtherAlphabetic535);

        string memory otherAlphabetic536 = "\\u{114C1}";
        bytes memory utf8OtherAlphabetic536 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic536));
        console2.log("114C1: ", string(utf8OtherAlphabetic536));
        console2.logBytes(utf8OtherAlphabetic536);

        string memory otherAlphabetic537 = "\\u{115AF}";
        bytes memory utf8OtherAlphabetic537 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic537));
        console2.log("115AF: ", string(utf8OtherAlphabetic537));
        console2.logBytes(utf8OtherAlphabetic537);

        string memory otherAlphabetic538 = "\\u{115B1}";
        bytes memory utf8OtherAlphabetic538 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic538));
        console2.log("115B1: ", string(utf8OtherAlphabetic538));
        console2.logBytes(utf8OtherAlphabetic538);

        string memory otherAlphabetic539 = "\\u{115B2}";
        bytes memory utf8OtherAlphabetic539 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic539));
        console2.log("115B2: ", string(utf8OtherAlphabetic539));
        console2.logBytes(utf8OtherAlphabetic539);

        string memory otherAlphabetic540 = "\\u{115B5}";
        bytes memory utf8OtherAlphabetic540 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic540));
        console2.log("115B5: ", string(utf8OtherAlphabetic540));
        console2.logBytes(utf8OtherAlphabetic540);

        string memory otherAlphabetic541 = "\\u{115B8}";
        bytes memory utf8OtherAlphabetic541 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic541));
        console2.log("115B8: ", string(utf8OtherAlphabetic541));
        console2.logBytes(utf8OtherAlphabetic541);

        string memory otherAlphabetic542 = "\\u{115BB}";
        bytes memory utf8OtherAlphabetic542 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic542));
        console2.log("115BB: ", string(utf8OtherAlphabetic542));
        console2.logBytes(utf8OtherAlphabetic542);

        string memory otherAlphabetic543 = "\\u{115BC}";
        bytes memory utf8OtherAlphabetic543 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic543));
        console2.log("115BC: ", string(utf8OtherAlphabetic543));
        console2.logBytes(utf8OtherAlphabetic543);

        string memory otherAlphabetic544 = "\\u{115BD}";
        bytes memory utf8OtherAlphabetic544 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic544));
        console2.log("115BD: ", string(utf8OtherAlphabetic544));
        console2.logBytes(utf8OtherAlphabetic544);

        string memory otherAlphabetic545 = "\\u{115BE}";
        bytes memory utf8OtherAlphabetic545 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic545));
        console2.log("115BE: ", string(utf8OtherAlphabetic545));
        console2.logBytes(utf8OtherAlphabetic545);

        string memory otherAlphabetic546 = "\\u{115DC}";
        bytes memory utf8OtherAlphabetic546 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic546));
        console2.log("115DC: ", string(utf8OtherAlphabetic546));
        console2.logBytes(utf8OtherAlphabetic546);

        string memory otherAlphabetic547 = "\\u{115DD}";
        bytes memory utf8OtherAlphabetic547 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic547));
        console2.log("115DD: ", string(utf8OtherAlphabetic547));
        console2.logBytes(utf8OtherAlphabetic547);

        string memory otherAlphabetic548 = "\\u{11630}";
        bytes memory utf8OtherAlphabetic548 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic548));
        console2.log("11630: ", string(utf8OtherAlphabetic548));
        console2.logBytes(utf8OtherAlphabetic548);

        string memory otherAlphabetic549 = "\\u{11632}";
        bytes memory utf8OtherAlphabetic549 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic549));
        console2.log("11632: ", string(utf8OtherAlphabetic549));
        console2.logBytes(utf8OtherAlphabetic549);

        string memory otherAlphabetic550 = "\\u{11633}";
        bytes memory utf8OtherAlphabetic550 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic550));
        console2.log("11633: ", string(utf8OtherAlphabetic550));
        console2.logBytes(utf8OtherAlphabetic550);

        string memory otherAlphabetic551 = "\\u{1163A}";
        bytes memory utf8OtherAlphabetic551 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic551));
        console2.log("1163A: ", string(utf8OtherAlphabetic551));
        console2.logBytes(utf8OtherAlphabetic551);

        string memory otherAlphabetic552 = "\\u{1163B}";
        bytes memory utf8OtherAlphabetic552 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic552));
        console2.log("1163B: ", string(utf8OtherAlphabetic552));
        console2.logBytes(utf8OtherAlphabetic552);

        string memory otherAlphabetic553 = "\\u{1163C}";
        bytes memory utf8OtherAlphabetic553 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic553));
        console2.log("1163C: ", string(utf8OtherAlphabetic553));
        console2.logBytes(utf8OtherAlphabetic553);

        string memory otherAlphabetic554 = "\\u{1163D}";
        bytes memory utf8OtherAlphabetic554 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic554));
        console2.log("1163D: ", string(utf8OtherAlphabetic554));
        console2.logBytes(utf8OtherAlphabetic554);

        string memory otherAlphabetic555 = "\\u{1163E}";
        bytes memory utf8OtherAlphabetic555 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic555));
        console2.log("1163E: ", string(utf8OtherAlphabetic555));
        console2.logBytes(utf8OtherAlphabetic555);

        string memory otherAlphabetic556 = "\\u{11640}";
        bytes memory utf8OtherAlphabetic556 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic556));
        console2.log("11640: ", string(utf8OtherAlphabetic556));
        console2.logBytes(utf8OtherAlphabetic556);

        string memory otherAlphabetic557 = "\\u{116AB}";
        bytes memory utf8OtherAlphabetic557 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic557));
        console2.log("116AB: ", string(utf8OtherAlphabetic557));
        console2.logBytes(utf8OtherAlphabetic557);

        string memory otherAlphabetic558 = "\\u{116AC}";
        bytes memory utf8OtherAlphabetic558 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic558));
        console2.log("116AC: ", string(utf8OtherAlphabetic558));
        console2.logBytes(utf8OtherAlphabetic558);

        string memory otherAlphabetic559 = "\\u{116AD}";
        bytes memory utf8OtherAlphabetic559 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic559));
        console2.log("116AD: ", string(utf8OtherAlphabetic559));
        console2.logBytes(utf8OtherAlphabetic559);

        string memory otherAlphabetic560 = "\\u{116AE}";
        bytes memory utf8OtherAlphabetic560 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic560));
        console2.log("116AE: ", string(utf8OtherAlphabetic560));
        console2.logBytes(utf8OtherAlphabetic560);

        string memory otherAlphabetic561 = "\\u{116AF}";
        bytes memory utf8OtherAlphabetic561 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic561));
        console2.log("116AF: ", string(utf8OtherAlphabetic561));
        console2.logBytes(utf8OtherAlphabetic561);

        string memory otherAlphabetic562 = "\\u{116B0}";
        bytes memory utf8OtherAlphabetic562 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic562));
        console2.log("116B0: ", string(utf8OtherAlphabetic562));
        console2.logBytes(utf8OtherAlphabetic562);

        string memory otherAlphabetic563 = "\\u{116B5}";
        bytes memory utf8OtherAlphabetic563 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic563));
        console2.log("116B5: ", string(utf8OtherAlphabetic563));
        console2.logBytes(utf8OtherAlphabetic563);

        string memory otherAlphabetic564 = "\\u{1171D}";
        bytes memory utf8OtherAlphabetic564 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic564));
        console2.log("1171D: ", string(utf8OtherAlphabetic564));
        console2.logBytes(utf8OtherAlphabetic564);

        string memory otherAlphabetic565 = "\\u{1171E}";
        bytes memory utf8OtherAlphabetic565 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic565));
        console2.log("1171E: ", string(utf8OtherAlphabetic565));
        console2.logBytes(utf8OtherAlphabetic565);

        string memory otherAlphabetic566 = "\\u{1171F}";
        bytes memory utf8OtherAlphabetic566 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic566));
        console2.log("1171F: ", string(utf8OtherAlphabetic566));
        console2.logBytes(utf8OtherAlphabetic566);

        string memory otherAlphabetic567 = "\\u{11720}";
        bytes memory utf8OtherAlphabetic567 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic567));
        console2.log("11720: ", string(utf8OtherAlphabetic567));
        console2.logBytes(utf8OtherAlphabetic567);

        string memory otherAlphabetic568 = "\\u{11721}";
        bytes memory utf8OtherAlphabetic568 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic568));
        console2.log("11721: ", string(utf8OtherAlphabetic568));
        console2.logBytes(utf8OtherAlphabetic568);

        string memory otherAlphabetic569 = "\\u{11722}";
        bytes memory utf8OtherAlphabetic569 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic569));
        console2.log("11722: ", string(utf8OtherAlphabetic569));
        console2.logBytes(utf8OtherAlphabetic569);

        string memory otherAlphabetic570 = "\\u{11725}";
        bytes memory utf8OtherAlphabetic570 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic570));
        console2.log("11725: ", string(utf8OtherAlphabetic570));
        console2.logBytes(utf8OtherAlphabetic570);

        string memory otherAlphabetic571 = "\\u{11726}";
        bytes memory utf8OtherAlphabetic571 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic571));
        console2.log("11726: ", string(utf8OtherAlphabetic571));
        console2.logBytes(utf8OtherAlphabetic571);

        string memory otherAlphabetic572 = "\\u{11727}";
        bytes memory utf8OtherAlphabetic572 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic572));
        console2.log("11727: ", string(utf8OtherAlphabetic572));
        console2.logBytes(utf8OtherAlphabetic572);

        string memory otherAlphabetic573 = "\\u{1172A}";
        bytes memory utf8OtherAlphabetic573 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic573));
        console2.log("1172A: ", string(utf8OtherAlphabetic573));
        console2.logBytes(utf8OtherAlphabetic573);

        string memory otherAlphabetic574 = "\\u{1182C}";
        bytes memory utf8OtherAlphabetic574 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic574));
        console2.log("1182C: ", string(utf8OtherAlphabetic574));
        console2.logBytes(utf8OtherAlphabetic574);

        string memory otherAlphabetic575 = "\\u{1182E}";
        bytes memory utf8OtherAlphabetic575 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic575));
        console2.log("1182E: ", string(utf8OtherAlphabetic575));
        console2.logBytes(utf8OtherAlphabetic575);

        string memory otherAlphabetic576 = "\\u{1182F}";
        bytes memory utf8OtherAlphabetic576 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic576));
        console2.log("1182F: ", string(utf8OtherAlphabetic576));
        console2.logBytes(utf8OtherAlphabetic576);

        string memory otherAlphabetic577 = "\\u{11837}";
        bytes memory utf8OtherAlphabetic577 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic577));
        console2.log("11837: ", string(utf8OtherAlphabetic577));
        console2.logBytes(utf8OtherAlphabetic577);

        string memory otherAlphabetic578 = "\\u{11838}";
        bytes memory utf8OtherAlphabetic578 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic578));
        console2.log("11838: ", string(utf8OtherAlphabetic578));
        console2.logBytes(utf8OtherAlphabetic578);

        string memory otherAlphabetic579 = "\\u{11930}";
        bytes memory utf8OtherAlphabetic579 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic579));
        console2.log("11930: ", string(utf8OtherAlphabetic579));
        console2.logBytes(utf8OtherAlphabetic579);

        string memory otherAlphabetic580 = "\\u{11935}";
        bytes memory utf8OtherAlphabetic580 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic580));
        console2.log("11935: ", string(utf8OtherAlphabetic580));
        console2.logBytes(utf8OtherAlphabetic580);

        string memory otherAlphabetic581 = "\\u{11937}";
        bytes memory utf8OtherAlphabetic581 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic581));
        console2.log("11937: ", string(utf8OtherAlphabetic581));
        console2.logBytes(utf8OtherAlphabetic581);

        string memory otherAlphabetic582 = "\\u{11938}";
        bytes memory utf8OtherAlphabetic582 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic582));
        console2.log("11938: ", string(utf8OtherAlphabetic582));
        console2.logBytes(utf8OtherAlphabetic582);

        string memory otherAlphabetic583 = "\\u{1193B}";
        bytes memory utf8OtherAlphabetic583 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic583));
        console2.log("1193B: ", string(utf8OtherAlphabetic583));
        console2.logBytes(utf8OtherAlphabetic583);

        string memory otherAlphabetic584 = "\\u{1193C}";
        bytes memory utf8OtherAlphabetic584 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic584));
        console2.log("1193C: ", string(utf8OtherAlphabetic584));
        console2.logBytes(utf8OtherAlphabetic584);

        string memory otherAlphabetic585 = "\\u{11940}";
        bytes memory utf8OtherAlphabetic585 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic585));
        console2.log("11940: ", string(utf8OtherAlphabetic585));
        console2.logBytes(utf8OtherAlphabetic585);

        string memory otherAlphabetic586 = "\\u{11942}";
        bytes memory utf8OtherAlphabetic586 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic586));
        console2.log("11942: ", string(utf8OtherAlphabetic586));
        console2.logBytes(utf8OtherAlphabetic586);

        string memory otherAlphabetic587 = "\\u{119D1}";
        bytes memory utf8OtherAlphabetic587 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic587));
        console2.log("119D1: ", string(utf8OtherAlphabetic587));
        console2.logBytes(utf8OtherAlphabetic587);

        string memory otherAlphabetic588 = "\\u{119D3}";
        bytes memory utf8OtherAlphabetic588 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic588));
        console2.log("119D3: ", string(utf8OtherAlphabetic588));
        console2.logBytes(utf8OtherAlphabetic588);

        string memory otherAlphabetic589 = "\\u{119D4}";
        bytes memory utf8OtherAlphabetic589 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic589));
        console2.log("119D4: ", string(utf8OtherAlphabetic589));
        console2.logBytes(utf8OtherAlphabetic589);

        string memory otherAlphabetic590 = "\\u{119D7}";
        bytes memory utf8OtherAlphabetic590 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic590));
        console2.log("119D7: ", string(utf8OtherAlphabetic590));
        console2.logBytes(utf8OtherAlphabetic590);

        string memory otherAlphabetic591 = "\\u{119DA}";
        bytes memory utf8OtherAlphabetic591 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic591));
        console2.log("119DA: ", string(utf8OtherAlphabetic591));
        console2.logBytes(utf8OtherAlphabetic591);

        string memory otherAlphabetic592 = "\\u{119DB}";
        bytes memory utf8OtherAlphabetic592 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic592));
        console2.log("119DB: ", string(utf8OtherAlphabetic592));
        console2.logBytes(utf8OtherAlphabetic592);

        string memory otherAlphabetic593 = "\\u{119DC}";
        bytes memory utf8OtherAlphabetic593 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic593));
        console2.log("119DC: ", string(utf8OtherAlphabetic593));
        console2.logBytes(utf8OtherAlphabetic593);

        string memory otherAlphabetic594 = "\\u{119DF}";
        bytes memory utf8OtherAlphabetic594 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic594));
        console2.log("119DF: ", string(utf8OtherAlphabetic594));
        console2.logBytes(utf8OtherAlphabetic594);

        string memory otherAlphabetic595 = "\\u{119E4}";
        bytes memory utf8OtherAlphabetic595 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic595));
        console2.log("119E4: ", string(utf8OtherAlphabetic595));
        console2.logBytes(utf8OtherAlphabetic595);

        string memory otherAlphabetic596 = "\\u{11A01}";
        bytes memory utf8OtherAlphabetic596 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic596));
        console2.log("11A01: ", string(utf8OtherAlphabetic596));
        console2.logBytes(utf8OtherAlphabetic596);

        string memory otherAlphabetic597 = "\\u{11A0A}";
        bytes memory utf8OtherAlphabetic597 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic597));
        console2.log("11A0A: ", string(utf8OtherAlphabetic597));
        console2.logBytes(utf8OtherAlphabetic597);

        string memory otherAlphabetic598 = "\\u{11A35}";
        bytes memory utf8OtherAlphabetic598 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic598));
        console2.log("11A35: ", string(utf8OtherAlphabetic598));
        console2.logBytes(utf8OtherAlphabetic598);

        string memory otherAlphabetic599 = "\\u{11A38}";
        bytes memory utf8OtherAlphabetic599 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic599));
        console2.log("11A38: ", string(utf8OtherAlphabetic599));
        console2.logBytes(utf8OtherAlphabetic599);

        string memory otherAlphabetic600 = "\\u{11A39}";
        bytes memory utf8OtherAlphabetic600 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic600));
        console2.log("11A39: ", string(utf8OtherAlphabetic600));
        console2.logBytes(utf8OtherAlphabetic600);

        string memory otherAlphabetic601 = "\\u{11A3B}";
        bytes memory utf8OtherAlphabetic601 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic601));
        console2.log("11A3B: ", string(utf8OtherAlphabetic601));
        console2.logBytes(utf8OtherAlphabetic601);

        string memory otherAlphabetic602 = "\\u{11A3E}";
        bytes memory utf8OtherAlphabetic602 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic602));
        console2.log("11A3E: ", string(utf8OtherAlphabetic602));
        console2.logBytes(utf8OtherAlphabetic602);

        string memory otherAlphabetic603 = "\\u{11A51}";
        bytes memory utf8OtherAlphabetic603 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic603));
        console2.log("11A51: ", string(utf8OtherAlphabetic603));
        console2.logBytes(utf8OtherAlphabetic603);

        string memory otherAlphabetic604 = "\\u{11A56}";
        bytes memory utf8OtherAlphabetic604 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic604));
        console2.log("11A56: ", string(utf8OtherAlphabetic604));
        console2.logBytes(utf8OtherAlphabetic604);

        string memory otherAlphabetic605 = "\\u{11A57}";
        bytes memory utf8OtherAlphabetic605 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic605));
        console2.log("11A57: ", string(utf8OtherAlphabetic605));
        console2.logBytes(utf8OtherAlphabetic605);

        string memory otherAlphabetic606 = "\\u{11A58}";
        bytes memory utf8OtherAlphabetic606 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic606));
        console2.log("11A58: ", string(utf8OtherAlphabetic606));
        console2.logBytes(utf8OtherAlphabetic606);

        string memory otherAlphabetic607 = "\\u{11A59}";
        bytes memory utf8OtherAlphabetic607 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic607));
        console2.log("11A59: ", string(utf8OtherAlphabetic607));
        console2.logBytes(utf8OtherAlphabetic607);

        string memory otherAlphabetic608 = "\\u{11A5B}";
        bytes memory utf8OtherAlphabetic608 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic608));
        console2.log("11A5B: ", string(utf8OtherAlphabetic608));
        console2.logBytes(utf8OtherAlphabetic608);

        string memory otherAlphabetic609 = "\\u{11A8A}";
        bytes memory utf8OtherAlphabetic609 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic609));
        console2.log("11A8A: ", string(utf8OtherAlphabetic609));
        console2.logBytes(utf8OtherAlphabetic609);

        string memory otherAlphabetic610 = "\\u{11A96}";
        bytes memory utf8OtherAlphabetic610 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic610));
        console2.log("11A96: ", string(utf8OtherAlphabetic610));
        console2.logBytes(utf8OtherAlphabetic610);

        string memory otherAlphabetic611 = "\\u{11A97}";
        bytes memory utf8OtherAlphabetic611 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic611));
        console2.log("11A97: ", string(utf8OtherAlphabetic611));
        console2.logBytes(utf8OtherAlphabetic611);

        string memory otherAlphabetic612 = "\\u{11B60}";
        bytes memory utf8OtherAlphabetic612 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic612));
        console2.log("11B60: ", string(utf8OtherAlphabetic612));
        console2.logBytes(utf8OtherAlphabetic612);

        string memory otherAlphabetic613 = "\\u{11B61}";
        bytes memory utf8OtherAlphabetic613 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic613));
        console2.log("11B61: ", string(utf8OtherAlphabetic613));
        console2.logBytes(utf8OtherAlphabetic613);

        string memory otherAlphabetic614 = "\\u{11B62}";
        bytes memory utf8OtherAlphabetic614 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic614));
        console2.log("11B62: ", string(utf8OtherAlphabetic614));
        console2.logBytes(utf8OtherAlphabetic614);

        string memory otherAlphabetic615 = "\\u{11B64}";
        bytes memory utf8OtherAlphabetic615 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic615));
        console2.log("11B64: ", string(utf8OtherAlphabetic615));
        console2.logBytes(utf8OtherAlphabetic615);

        string memory otherAlphabetic616 = "\\u{11B65}";
        bytes memory utf8OtherAlphabetic616 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic616));
        console2.log("11B65: ", string(utf8OtherAlphabetic616));
        console2.logBytes(utf8OtherAlphabetic616);

        string memory otherAlphabetic617 = "\\u{11B66}";
        bytes memory utf8OtherAlphabetic617 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic617));
        console2.log("11B66: ", string(utf8OtherAlphabetic617));
        console2.logBytes(utf8OtherAlphabetic617);

        string memory otherAlphabetic618 = "\\u{11B67}";
        bytes memory utf8OtherAlphabetic618 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic618));
        console2.log("11B67: ", string(utf8OtherAlphabetic618));
        console2.logBytes(utf8OtherAlphabetic618);

        string memory otherAlphabetic619 = "\\u{11C2F}";
        bytes memory utf8OtherAlphabetic619 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic619));
        console2.log("11C2F: ", string(utf8OtherAlphabetic619));
        console2.logBytes(utf8OtherAlphabetic619);

        string memory otherAlphabetic620 = "\\u{11C30}";
        bytes memory utf8OtherAlphabetic620 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic620));
        console2.log("11C30: ", string(utf8OtherAlphabetic620));
        console2.logBytes(utf8OtherAlphabetic620);

        string memory otherAlphabetic621 = "\\u{11C36}";
        bytes memory utf8OtherAlphabetic621 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic621));
        console2.log("11C36: ", string(utf8OtherAlphabetic621));
        console2.logBytes(utf8OtherAlphabetic621);

        string memory otherAlphabetic622 = "\\u{11C38}";
        bytes memory utf8OtherAlphabetic622 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic622));
        console2.log("11C38: ", string(utf8OtherAlphabetic622));
        console2.logBytes(utf8OtherAlphabetic622);

        string memory otherAlphabetic623 = "\\u{11C3D}";
        bytes memory utf8OtherAlphabetic623 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic623));
        console2.log("11C3D: ", string(utf8OtherAlphabetic623));
        console2.logBytes(utf8OtherAlphabetic623);

        string memory otherAlphabetic624 = "\\u{11C3E}";
        bytes memory utf8OtherAlphabetic624 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic624));
        console2.log("11C3E: ", string(utf8OtherAlphabetic624));
        console2.logBytes(utf8OtherAlphabetic624);

        string memory otherAlphabetic625 = "\\u{11C92}";
        bytes memory utf8OtherAlphabetic625 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic625));
        console2.log("11C92: ", string(utf8OtherAlphabetic625));
        console2.logBytes(utf8OtherAlphabetic625);

        string memory otherAlphabetic625a = "\\u{11CA7}";
        bytes memory utf8OtherAlphabetic625a = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic625a));
        console2.log("11CA7: ", string(utf8OtherAlphabetic625a));
        console2.logBytes(utf8OtherAlphabetic625a);

        string memory otherAlphabetic626 = "\\u{11CA9}";
        bytes memory utf8OtherAlphabetic626 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic626));
        console2.log("11CA9: ", string(utf8OtherAlphabetic626));
        console2.logBytes(utf8OtherAlphabetic626);

        string memory otherAlphabetic627 = "\\u{11CAA}";
        bytes memory utf8OtherAlphabetic627 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic627));
        console2.log("11CAA: ", string(utf8OtherAlphabetic627));
        console2.logBytes(utf8OtherAlphabetic627);

        string memory otherAlphabetic628 = "\\u{11CB0}";
        bytes memory utf8OtherAlphabetic628 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic628));
        console2.log("11CB0: ", string(utf8OtherAlphabetic628));
        console2.logBytes(utf8OtherAlphabetic628);

        string memory otherAlphabetic629 = "\\u{11CB1}";
        bytes memory utf8OtherAlphabetic629 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic629));
        console2.log("11CB1: ", string(utf8OtherAlphabetic629));
        console2.logBytes(utf8OtherAlphabetic629);

        string memory otherAlphabetic630 = "\\u{11CB2}";
        bytes memory utf8OtherAlphabetic630 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic630));
        console2.log("11CB2: ", string(utf8OtherAlphabetic630));
        console2.logBytes(utf8OtherAlphabetic630);

        string memory otherAlphabetic631 = "\\u{11CB3}";
        bytes memory utf8OtherAlphabetic631 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic631));
        console2.log("11CB3: ", string(utf8OtherAlphabetic631));
        console2.logBytes(utf8OtherAlphabetic631);

        string memory otherAlphabetic632 = "\\u{11CB4}";
        bytes memory utf8OtherAlphabetic632 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic632));
        console2.log("11CB4: ", string(utf8OtherAlphabetic632));
        console2.logBytes(utf8OtherAlphabetic632);

        string memory otherAlphabetic633 = "\\u{11CB5}";
        bytes memory utf8OtherAlphabetic633 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic633));
        console2.log("11CB5: ", string(utf8OtherAlphabetic633));
        console2.logBytes(utf8OtherAlphabetic633);

        string memory otherAlphabetic634 = "\\u{11CB6}";
        bytes memory utf8OtherAlphabetic634 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic634));
        console2.log("11CB6: ", string(utf8OtherAlphabetic634));
        console2.logBytes(utf8OtherAlphabetic634);

        string memory otherAlphabetic635 = "\\u{11D31}";
        bytes memory utf8OtherAlphabetic635 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic635));
        console2.log("11D31: ", string(utf8OtherAlphabetic635));
        console2.logBytes(utf8OtherAlphabetic635);

        string memory otherAlphabetic636 = "\\u{11D36}";
        bytes memory utf8OtherAlphabetic636 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic636));
        console2.log("11D36: ", string(utf8OtherAlphabetic636));
        console2.logBytes(utf8OtherAlphabetic636);

        string memory otherAlphabetic637 = "\\u{11D3A}";
        bytes memory utf8OtherAlphabetic637 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic637));
        console2.log("11D3A: ", string(utf8OtherAlphabetic637));
        console2.logBytes(utf8OtherAlphabetic637);

        string memory otherAlphabetic638 = "\\u{11D3C}";
        bytes memory utf8OtherAlphabetic638 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic638));
        console2.log("11D3C: ", string(utf8OtherAlphabetic638));
        console2.logBytes(utf8OtherAlphabetic638);

        string memory otherAlphabetic639 = "\\u{11D3D}";
        bytes memory utf8OtherAlphabetic639 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic639));
        console2.log("11D3D: ", string(utf8OtherAlphabetic639));
        console2.logBytes(utf8OtherAlphabetic639);

        string memory otherAlphabetic640 = "\\u{11D3F}";
        bytes memory utf8OtherAlphabetic640 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic640));
        console2.log("11D3F: ", string(utf8OtherAlphabetic640));
        console2.logBytes(utf8OtherAlphabetic640);

        string memory otherAlphabetic641 = "\\u{11D41}";
        bytes memory utf8OtherAlphabetic641 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic641));
        console2.log("11D41: ", string(utf8OtherAlphabetic641));
        console2.logBytes(utf8OtherAlphabetic641);

        string memory otherAlphabetic642 = "\\u{11D43}";
        bytes memory utf8OtherAlphabetic642 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic642));
        console2.log("11D43: ", string(utf8OtherAlphabetic642));
        console2.logBytes(utf8OtherAlphabetic642);

        string memory otherAlphabetic643 = "\\u{11D47}";
        bytes memory utf8OtherAlphabetic643 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic643));
        console2.log("11D47: ", string(utf8OtherAlphabetic643));
        console2.logBytes(utf8OtherAlphabetic643);

        string memory otherAlphabetic644 = "\\u{11D8A}";
        bytes memory utf8OtherAlphabetic644 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic644));
        console2.log("11D8A: ", string(utf8OtherAlphabetic644));
        console2.logBytes(utf8OtherAlphabetic644);

        string memory otherAlphabetic644a = "\\u{11D8E}";
        bytes memory utf8OtherAlphabetic644a = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic644a));
        console2.log("11D8E: ", string(utf8OtherAlphabetic644a));
        console2.logBytes(utf8OtherAlphabetic644a);

        string memory otherAlphabetic644b = "\\u{11D90}";
        bytes memory utf8OtherAlphabetic644b = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic644b));
        console2.log("11D90: ", string(utf8OtherAlphabetic644b));
        console2.logBytes(utf8OtherAlphabetic644b);

        string memory otherAlphabetic645 = "\\u{11D91}";
        bytes memory utf8OtherAlphabetic645 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic645));
        console2.log("11D91: ", string(utf8OtherAlphabetic645));
        console2.logBytes(utf8OtherAlphabetic645);

        string memory otherAlphabetic646 = "\\u{11D93}";
        bytes memory utf8OtherAlphabetic646 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic646));
        console2.log("11D93: ", string(utf8OtherAlphabetic646));
        console2.logBytes(utf8OtherAlphabetic646);

        string memory otherAlphabetic647 = "\\u{11D94}";
        bytes memory utf8OtherAlphabetic647 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic647));
        console2.log("11D94: ", string(utf8OtherAlphabetic647));
        console2.logBytes(utf8OtherAlphabetic647);

        string memory otherAlphabetic648 = "\\u{11D95}";
        bytes memory utf8OtherAlphabetic648 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic648));
        console2.log("11D95: ", string(utf8OtherAlphabetic648));
        console2.logBytes(utf8OtherAlphabetic648);

        string memory otherAlphabetic649 = "\\u{11D96}";
        bytes memory utf8OtherAlphabetic649 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic649));
        console2.log("11D96: ", string(utf8OtherAlphabetic649));
        console2.logBytes(utf8OtherAlphabetic649);

        string memory otherAlphabetic650 = "\\u{11EF3}";
        bytes memory utf8OtherAlphabetic650 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic650));
        console2.log("11EF3: ", string(utf8OtherAlphabetic650));
        console2.logBytes(utf8OtherAlphabetic650);

        string memory otherAlphabetic651 = "\\u{11EF4}";
        bytes memory utf8OtherAlphabetic651 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic651));
        console2.log("11EF4: ", string(utf8OtherAlphabetic651));
        console2.logBytes(utf8OtherAlphabetic651);

        string memory otherAlphabetic652 = "\\u{11EF5}";
        bytes memory utf8OtherAlphabetic652 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic652));
        console2.log("11EF5: ", string(utf8OtherAlphabetic652));
        console2.logBytes(utf8OtherAlphabetic652);

        string memory otherAlphabetic653 = "\\u{11EF6}";
        bytes memory utf8OtherAlphabetic653 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic653));
        console2.log("11EF6: ", string(utf8OtherAlphabetic653));
        console2.logBytes(utf8OtherAlphabetic653);

        string memory otherAlphabetic654 = "\\u{11F00}";
        bytes memory utf8OtherAlphabetic654 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic654));
        console2.log("11F00: ", string(utf8OtherAlphabetic654));
        console2.logBytes(utf8OtherAlphabetic654);

        string memory otherAlphabetic655 = "\\u{11F01}";
        bytes memory utf8OtherAlphabetic655 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic655));
        console2.log("11F01: ", string(utf8OtherAlphabetic655));
        console2.logBytes(utf8OtherAlphabetic655);

        string memory otherAlphabetic656 = "\\u{11F03}";
        bytes memory utf8OtherAlphabetic656 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic656));
        console2.log("11F03: ", string(utf8OtherAlphabetic656));
        console2.logBytes(utf8OtherAlphabetic656);

        string memory otherAlphabetic657 = "\\u{11F34}";
        bytes memory utf8OtherAlphabetic657 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic657));
        console2.log("11F34: ", string(utf8OtherAlphabetic657));
        console2.logBytes(utf8OtherAlphabetic657);

        string memory otherAlphabetic658 = "\\u{11F35}";
        bytes memory utf8OtherAlphabetic658 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic658));
        console2.log("11F35: ", string(utf8OtherAlphabetic658));
        console2.logBytes(utf8OtherAlphabetic658);

        string memory otherAlphabetic659 = "\\u{11F36}";
        bytes memory utf8OtherAlphabetic659 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic659));
        console2.log("11F36: ", string(utf8OtherAlphabetic659));
        console2.logBytes(utf8OtherAlphabetic659);

        string memory otherAlphabetic660 = "\\u{11F3A}";
        bytes memory utf8OtherAlphabetic660 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic660));
        console2.log("11F3A: ", string(utf8OtherAlphabetic660));
        console2.logBytes(utf8OtherAlphabetic660);

        string memory otherAlphabetic661 = "\\u{11F3E}";
        bytes memory utf8OtherAlphabetic661 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic661));
        console2.log("11F3E: ", string(utf8OtherAlphabetic661));
        console2.logBytes(utf8OtherAlphabetic661);

        string memory otherAlphabetic662 = "\\u{11F3F}";
        bytes memory utf8OtherAlphabetic662 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic662));
        console2.log("11F3F: ", string(utf8OtherAlphabetic662));
        console2.logBytes(utf8OtherAlphabetic662);

        string memory otherAlphabetic663 = "\\u{11F40}";
        bytes memory utf8OtherAlphabetic663 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic663));
        console2.log("11F40: ", string(utf8OtherAlphabetic663));
        console2.logBytes(utf8OtherAlphabetic663);

        string memory otherAlphabetic664 = "\\u{1611E}";
        bytes memory utf8OtherAlphabetic664 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic664));
        console2.log("1611E: ", string(utf8OtherAlphabetic664));
        console2.logBytes(utf8OtherAlphabetic664);

        string memory otherAlphabetic665 = "\\u{16129}";
        bytes memory utf8OtherAlphabetic665 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic665));
        console2.log("16129: ", string(utf8OtherAlphabetic665));
        console2.logBytes(utf8OtherAlphabetic665);

        string memory otherAlphabetic666 = "\\u{1612A}";
        bytes memory utf8OtherAlphabetic666 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic666));
        console2.log("1612A: ", string(utf8OtherAlphabetic666));
        console2.logBytes(utf8OtherAlphabetic666);

        string memory otherAlphabetic667 = "\\u{1612C}";
        bytes memory utf8OtherAlphabetic667 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic667));
        console2.log("1612C: ", string(utf8OtherAlphabetic667));
        console2.logBytes(utf8OtherAlphabetic667);

        string memory otherAlphabetic668 = "\\u{1612D}";
        bytes memory utf8OtherAlphabetic668 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic668));
        console2.log("1612D: ", string(utf8OtherAlphabetic668));
        console2.logBytes(utf8OtherAlphabetic668);

        string memory otherAlphabetic669 = "\\u{1612E}";
        bytes memory utf8OtherAlphabetic669 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic669));
        console2.log("1612E: ", string(utf8OtherAlphabetic669));
        console2.logBytes(utf8OtherAlphabetic669);

        string memory otherAlphabetic670 = "\\u{16F4F}";
        bytes memory utf8OtherAlphabetic670 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic670));
        console2.log("16F4F: ", string(utf8OtherAlphabetic670));
        console2.logBytes(utf8OtherAlphabetic670);

        string memory otherAlphabetic671 = "\\u{16F51}";
        bytes memory utf8OtherAlphabetic671 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic671));
        console2.log("16F51: ", string(utf8OtherAlphabetic671));
        console2.logBytes(utf8OtherAlphabetic671);

        string memory otherAlphabetic672 = "\\u{16F87}";
        bytes memory utf8OtherAlphabetic672 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic672));
        console2.log("16F87: ", string(utf8OtherAlphabetic672));
        console2.logBytes(utf8OtherAlphabetic672);

        string memory otherAlphabetic673 = "\\u{16F8F}";
        bytes memory utf8OtherAlphabetic673 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic673));
        console2.log("16F8F: ", string(utf8OtherAlphabetic673));
        console2.logBytes(utf8OtherAlphabetic673);

        string memory otherAlphabetic674 = "\\u{16F92}";
        bytes memory utf8OtherAlphabetic674 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic674));
        console2.log("16F92: ", string(utf8OtherAlphabetic674));
        console2.logBytes(utf8OtherAlphabetic674);

        string memory otherAlphabetic675 = "\\u{16FF0}";
        bytes memory utf8OtherAlphabetic675 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic675));
        console2.log("16FF0: ", string(utf8OtherAlphabetic675));
        console2.logBytes(utf8OtherAlphabetic675);

        string memory otherAlphabetic676 = "\\u{16FF1}";
        bytes memory utf8OtherAlphabetic676 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic676));
        console2.log("16FF1: ", string(utf8OtherAlphabetic676));
        console2.logBytes(utf8OtherAlphabetic676);

        string memory otherAlphabetic677 = "\\u{1BC9E}";
        bytes memory utf8OtherAlphabetic677 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic677));
        console2.log("1BC9E: ", string(utf8OtherAlphabetic677));
        console2.logBytes(utf8OtherAlphabetic677);

        string memory otherAlphabetic678 = "\\u{1E000}";
        bytes memory utf8OtherAlphabetic678 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic678));
        console2.log("1E000: ", string(utf8OtherAlphabetic678));
        console2.logBytes(utf8OtherAlphabetic678);

        string memory otherAlphabetic679 = "\\u{1E006}";
        bytes memory utf8OtherAlphabetic679 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic679));
        console2.log("1E006: ", string(utf8OtherAlphabetic679));
        console2.logBytes(utf8OtherAlphabetic679);

        string memory otherAlphabetic680 = "\\u{1E008}";
        bytes memory utf8OtherAlphabetic680 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic680));
        console2.log("1E008: ", string(utf8OtherAlphabetic680));
        console2.logBytes(utf8OtherAlphabetic680);

        string memory otherAlphabetic681 = "\\u{1E018}";
        bytes memory utf8OtherAlphabetic681 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic681));
        console2.log("1E018: ", string(utf8OtherAlphabetic681));
        console2.logBytes(utf8OtherAlphabetic681);

        string memory otherAlphabetic682 = "\\u{1E01B}";
        bytes memory utf8OtherAlphabetic682 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic682));
        console2.log("1E01B: ", string(utf8OtherAlphabetic682));
        console2.logBytes(utf8OtherAlphabetic682);

        string memory otherAlphabetic683 = "\\u{1E021}";
        bytes memory utf8OtherAlphabetic683 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic683));
        console2.log("1E021: ", string(utf8OtherAlphabetic683));
        console2.logBytes(utf8OtherAlphabetic683);

        string memory otherAlphabetic684 = "\\u{1E023}";
        bytes memory utf8OtherAlphabetic684 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic684));
        console2.log("1E023: ", string(utf8OtherAlphabetic684));
        console2.logBytes(utf8OtherAlphabetic684);

        string memory otherAlphabetic685 = "\\u{1E024}";
        bytes memory utf8OtherAlphabetic685 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic685));
        console2.log("1E024: ", string(utf8OtherAlphabetic685));
        console2.logBytes(utf8OtherAlphabetic685);

        string memory otherAlphabetic686 = "\\u{1E026}";
        bytes memory utf8OtherAlphabetic686 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic686));
        console2.log("1E026: ", string(utf8OtherAlphabetic686));
        console2.logBytes(utf8OtherAlphabetic686);

        string memory otherAlphabetic687 = "\\u{1E02A}";
        bytes memory utf8OtherAlphabetic687 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic687));
        console2.log("1E02A: ", string(utf8OtherAlphabetic687));
        console2.logBytes(utf8OtherAlphabetic687);

        string memory otherAlphabetic688 = "\\u{1E08F}";
        bytes memory utf8OtherAlphabetic688 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic688));
        console2.log("1E08F: ", string(utf8OtherAlphabetic688));
        console2.logBytes(utf8OtherAlphabetic688);

        string memory otherAlphabetic689 = "\\u{1E6E3}";
        bytes memory utf8OtherAlphabetic689 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic689));
        console2.log("1E6E3: ", string(utf8OtherAlphabetic689));
        console2.logBytes(utf8OtherAlphabetic689);

        string memory otherAlphabetic690 = "\\u{1E6E6}";
        bytes memory utf8OtherAlphabetic690 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic690));
        console2.log("1E6E6: ", string(utf8OtherAlphabetic690));
        console2.logBytes(utf8OtherAlphabetic690);

        string memory otherAlphabetic691 = "\\u{1E6EE}";
        bytes memory utf8OtherAlphabetic691 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic691));
        console2.log("1E6EE: ", string(utf8OtherAlphabetic691));
        console2.logBytes(utf8OtherAlphabetic691);

        string memory otherAlphabetic692 = "\\u{1E6EF}";
        bytes memory utf8OtherAlphabetic692 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic692));
        console2.log("1E6EF: ", string(utf8OtherAlphabetic692));
        console2.logBytes(utf8OtherAlphabetic692);

        string memory otherAlphabetic693 = "\\u{1E6F5}";
        bytes memory utf8OtherAlphabetic693 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic693));
        console2.log("1E6F5: ", string(utf8OtherAlphabetic693));
        console2.logBytes(utf8OtherAlphabetic693);

        string memory otherAlphabetic694 = "\\u{1E947}";
        bytes memory utf8OtherAlphabetic694 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic694));
        console2.log("1E947: ", string(utf8OtherAlphabetic694));
        console2.logBytes(utf8OtherAlphabetic694);

        string memory otherAlphabetic695 = "\\u{1F130}";
        bytes memory utf8OtherAlphabetic695 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic695));
        console2.log("1F130: ", string(utf8OtherAlphabetic695));
        console2.logBytes(utf8OtherAlphabetic695);

        string memory otherAlphabetic696 = "\\u{1F149}";
        bytes memory utf8OtherAlphabetic696 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic696));
        console2.log("1F149: ", string(utf8OtherAlphabetic696));
        console2.logBytes(utf8OtherAlphabetic696);

        string memory otherAlphabetic697 = "\\u{1F150}";
        bytes memory utf8OtherAlphabetic697 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic697));
        console2.log("1F150: ", string(utf8OtherAlphabetic697));
        console2.logBytes(utf8OtherAlphabetic697);

        string memory otherAlphabetic698 = "\\u{1F169}";
        bytes memory utf8OtherAlphabetic698 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic698));
        console2.log("1F169: ", string(utf8OtherAlphabetic698));
        console2.logBytes(utf8OtherAlphabetic698);

        string memory otherAlphabetic699 = "\\u{1F170}";
        bytes memory utf8OtherAlphabetic699 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic699));
        console2.log("1F170: ", string(utf8OtherAlphabetic699));
        console2.logBytes(utf8OtherAlphabetic699);

        string memory otherAlphabetic700 = "\\u{1F189}";
        bytes memory utf8OtherAlphabetic700 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherAlphabetic700));
        console2.log("1F189: ", string(utf8OtherAlphabetic700));
        console2.logBytes(utf8OtherAlphabetic700);
    }

    function testRegexPropertyDiacritic() public pure {
        string memory diacritic005E = "\\u{005E}";
        bytes memory utf8Diacritic005E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic005E));
        console2.log("005E: ", string(utf8Diacritic005E));
        console2.logBytes(utf8Diacritic005E);

        string memory diacritic0060 = "\\u{0060}";
        bytes memory utf8Diacritic0060 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0060));
        console2.log("0060: ", string(utf8Diacritic0060));
        console2.logBytes(utf8Diacritic0060);

        string memory diacritic00A8 = "\\u{00A8}";
        bytes memory utf8Diacritic00A8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic00A8));
        console2.log("00A8: ", string(utf8Diacritic00A8));
        console2.logBytes(utf8Diacritic00A8);

        string memory diacritic00AF = "\\u{00AF}";
        bytes memory utf8Diacritic00AF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic00AF));
        console2.log("00AF: ", string(utf8Diacritic00AF));
        console2.logBytes(utf8Diacritic00AF);

        string memory diacritic00B4 = "\\u{00B4}";
        bytes memory utf8Diacritic00B4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic00B4));
        console2.log("00B4: ", string(utf8Diacritic00B4));
        console2.logBytes(utf8Diacritic00B4);

        string memory diacritic00B7 = "\\u{00B7}";
        bytes memory utf8Diacritic00B7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic00B7));
        console2.log("00B7: ", string(utf8Diacritic00B7));
        console2.logBytes(utf8Diacritic00B7);

        string memory diacritic00B8 = "\\u{00B8}";
        bytes memory utf8Diacritic00B8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic00B8));
        console2.log("00B8: ", string(utf8Diacritic00B8));
        console2.logBytes(utf8Diacritic00B8);

        string memory diacritic02B0 = "\\u{02B0}";
        bytes memory utf8Diacritic02B0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02B0));
        console2.log("02B0: ", string(utf8Diacritic02B0));
        console2.logBytes(utf8Diacritic02B0);

        console2.log("..");

        string memory diacritic02C1 = "\\u{02C1}";
        bytes memory utf8Diacritic02C1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02C1));
        console2.log("02C1: ", string(utf8Diacritic02C1));
        console2.logBytes(utf8Diacritic02C1);

        string memory diacritic02C2 = "\\u{02C2}";
        bytes memory utf8Diacritic02C2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02C2));
        console2.log("02C2: ", string(utf8Diacritic02C2));
        console2.logBytes(utf8Diacritic02C2);

        console2.log("..");

        string memory diacritic02C5 = "\\u{02C5}";
        bytes memory utf8Diacritic02C5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02C5));
        console2.log("02C5: ", string(utf8Diacritic02C5));
        console2.logBytes(utf8Diacritic02C5);

        string memory diacritic02C6 = "\\u{02C6}";
        bytes memory utf8Diacritic02C6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02C6));
        console2.log("02C6: ", string(utf8Diacritic02C6));
        console2.logBytes(utf8Diacritic02C6);

        console2.log("..");

        string memory diacritic02D1 = "\\u{02D1}";
        bytes memory utf8Diacritic02D1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02D1));
        console2.log("02D1: ", string(utf8Diacritic02D1));
        console2.logBytes(utf8Diacritic02D1);

        string memory diacritic02D2 = "\\u{02D2}";
        bytes memory utf8Diacritic02D2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02D2));
        console2.log("02D2: ", string(utf8Diacritic02D2));
        console2.logBytes(utf8Diacritic02D2);

        console2.log("..");

        string memory diacritic02DF = "\\u{02DF}";
        bytes memory utf8Diacritic02DF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02DF));
        console2.log("02DF: ", string(utf8Diacritic02DF));
        console2.logBytes(utf8Diacritic02DF);

        string memory diacritic02E0 = "\\u{02E0}";
        bytes memory utf8Diacritic02E0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02E0));
        console2.log("02E0: ", string(utf8Diacritic02E0));
        console2.logBytes(utf8Diacritic02E0);

        console2.log("..");

        string memory diacritic02E4 = "\\u{02E4}";
        bytes memory utf8Diacritic02E4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02E4));
        console2.log("02E4: ", string(utf8Diacritic02E4));
        console2.logBytes(utf8Diacritic02E4);

        string memory diacritic02E5 = "\\u{02E5}";
        bytes memory utf8Diacritic02E5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02E5));
        console2.log("02E5: ", string(utf8Diacritic02E5));
        console2.logBytes(utf8Diacritic02E5);

        console2.log("..");

        string memory diacritic02EB = "\\u{02EB}";
        bytes memory utf8Diacritic02EB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02EB));
        console2.log("02EB: ", string(utf8Diacritic02EB));
        console2.logBytes(utf8Diacritic02EB);

        string memory diacritic02EC = "\\u{02EC}";
        bytes memory utf8Diacritic02EC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02EC));
        console2.log("02EC: ", string(utf8Diacritic02EC));
        console2.logBytes(utf8Diacritic02EC);

        string memory diacritic02ED = "\\u{02ED}";
        bytes memory utf8Diacritic02ED = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02ED));
        console2.log("02ED: ", string(utf8Diacritic02ED));
        console2.logBytes(utf8Diacritic02ED);

        string memory diacritic02EE = "\\u{02EE}";
        bytes memory utf8Diacritic02EE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02EE));
        console2.log("02EE: ", string(utf8Diacritic02EE));
        console2.logBytes(utf8Diacritic02EE);

        string memory diacritic02EF = "\\u{02EF}";
        bytes memory utf8Diacritic02EF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02EF));
        console2.log("02EF: ", string(utf8Diacritic02EF));
        console2.logBytes(utf8Diacritic02EF);

        console2.log("..");

        string memory diacritic02FF = "\\u{02FF}";
        bytes memory utf8Diacritic02FF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic02FF));
        console2.log("02FF: ", string(utf8Diacritic02FF));
        console2.logBytes(utf8Diacritic02FF);

        string memory diacritic0300 = "\\u{0300}";
        bytes memory utf8Diacritic0300 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0300));
        console2.log("0300: ", string(utf8Diacritic0300));
        console2.logBytes(utf8Diacritic0300);

        console2.log("..");

        string memory diacritic034E = "\\u{034E}";
        bytes memory utf8Diacritic034E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic034E));
        console2.log("034E: ", string(utf8Diacritic034E));
        console2.logBytes(utf8Diacritic034E);

        string memory diacritic0350 = "\\u{0350}";
        bytes memory utf8Diacritic0350 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0350));
        console2.log("0350: ", string(utf8Diacritic0350));
        console2.logBytes(utf8Diacritic0350);

        console2.log("..");

        string memory diacritic0357 = "\\u{0357}";
        bytes memory utf8Diacritic0357 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0357));
        console2.log("0357: ", string(utf8Diacritic0357));
        console2.logBytes(utf8Diacritic0357);

        string memory diacritic035D = "\\u{035D}";
        bytes memory utf8Diacritic035D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic035D));
        console2.log("035D: ", string(utf8Diacritic035D));
        console2.logBytes(utf8Diacritic035D);

        console2.log("..");

        string memory diacritic0362 = "\\u{0362}";
        bytes memory utf8Diacritic0362 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0362));
        console2.log("0362: ", string(utf8Diacritic0362));
        console2.logBytes(utf8Diacritic0362);

        string memory diacritic0374 = "\\u{0374}";
        bytes memory utf8Diacritic0374 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0374));
        console2.log("0374: ", string(utf8Diacritic0374));
        console2.logBytes(utf8Diacritic0374);

        string memory diacritic0375 = "\\u{0375}";
        bytes memory utf8Diacritic0375 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0375));
        console2.log("0375: ", string(utf8Diacritic0375));
        console2.logBytes(utf8Diacritic0375);

        string memory diacritic037A = "\\u{037A}";
        bytes memory utf8Diacritic037A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic037A));
        console2.log("037A: ", string(utf8Diacritic037A));
        console2.logBytes(utf8Diacritic037A);

        string memory diacritic0384 = "\\u{0384}";
        bytes memory utf8Diacritic0384 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0384));
        console2.log("0384: ", string(utf8Diacritic0384));
        console2.logBytes(utf8Diacritic0384);

        console2.log("..");

        string memory diacritic0385 = "\\u{0385}";
        bytes memory utf8Diacritic0385 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0385));
        console2.log("0385: ", string(utf8Diacritic0385));
        console2.logBytes(utf8Diacritic0385);

        string memory diacritic0483 = "\\u{0483}";
        bytes memory utf8Diacritic0483 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0483));
        console2.log("0483: ", string(utf8Diacritic0483));
        console2.logBytes(utf8Diacritic0483);

        console2.log("..");

        string memory diacritic0487 = "\\u{0487}";
        bytes memory utf8Diacritic0487 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0487));
        console2.log("0487: ", string(utf8Diacritic0487));
        console2.logBytes(utf8Diacritic0487);

        string memory diacritic0559 = "\\u{0559}";
        bytes memory utf8Diacritic0559 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0559));
        console2.log("0559: ", string(utf8Diacritic0559));
        console2.logBytes(utf8Diacritic0559);

        string memory diacritic0591 = "\\u{0591}";
        bytes memory utf8Diacritic0591 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0591));
        console2.log("0591: ", string(utf8Diacritic0591));
        console2.logBytes(utf8Diacritic0591);

        console2.log("..");

        string memory diacritic05BD = "\\u{05BD}";
        bytes memory utf8Diacritic05BD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic05BD));
        console2.log("05BD: ", string(utf8Diacritic05BD));
        console2.logBytes(utf8Diacritic05BD);

        string memory diacritic05BF = "\\u{05BF}";
        bytes memory utf8Diacritic05BF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic05BF));
        console2.log("05BF: ", string(utf8Diacritic05BF));
        console2.logBytes(utf8Diacritic05BF);

        string memory diacritic05C1 = "\\u{05C1}";
        bytes memory utf8Diacritic05C1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic05C1));
        console2.log("05C1: ", string(utf8Diacritic05C1));
        console2.logBytes(utf8Diacritic05C1);

        console2.log("..");

        string memory diacritic05C2 = "\\u{05C2}";
        bytes memory utf8Diacritic05C2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic05C2));
        console2.log("05C2: ", string(utf8Diacritic05C2));
        console2.logBytes(utf8Diacritic05C2);

        string memory diacritic05C4 = "\\u{05C4}";
        bytes memory utf8Diacritic05C4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic05C4));
        console2.log("05C4: ", string(utf8Diacritic05C4));
        console2.logBytes(utf8Diacritic05C4);

        console2.log("..");

        string memory diacritic05C5 = "\\u{05C5}";
        bytes memory utf8Diacritic05C5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic05C5));
        console2.log("05C5: ", string(utf8Diacritic05C5));
        console2.logBytes(utf8Diacritic05C5);

        string memory diacritic05C7 = "\\u{05C7}";
        bytes memory utf8Diacritic05C7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic05C7));
        console2.log("05C7: ", string(utf8Diacritic05C7));
        console2.logBytes(utf8Diacritic05C7);

        string memory diacritic064B = "\\u{064B}";
        bytes memory utf8Diacritic064B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic064B));
        console2.log("064B: ", string(utf8Diacritic064B));
        console2.logBytes(utf8Diacritic064B);

        console2.log("..");

        string memory diacritic0652 = "\\u{0652}";
        bytes memory utf8Diacritic0652 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0652));
        console2.log("0652: ", string(utf8Diacritic0652));
        console2.logBytes(utf8Diacritic0652);

        string memory diacritic0657 = "\\u{0657}";
        bytes memory utf8Diacritic0657 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0657));
        console2.log("0657: ", string(utf8Diacritic0657));
        console2.logBytes(utf8Diacritic0657);

        console2.log("..");

        string memory diacritic0658 = "\\u{0658}";
        bytes memory utf8Diacritic0658 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0658));
        console2.log("0658: ", string(utf8Diacritic0658));
        console2.logBytes(utf8Diacritic0658);

        string memory diacritic06DF = "\\u{06DF}";
        bytes memory utf8Diacritic06DF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic06DF));
        console2.log("06DF: ", string(utf8Diacritic06DF));
        console2.logBytes(utf8Diacritic06DF);

        console2.log("..");

        string memory diacritic06E0 = "\\u{06E0}";
        bytes memory utf8Diacritic06E0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic06E0));
        console2.log("06E0: ", string(utf8Diacritic06E0));
        console2.logBytes(utf8Diacritic06E0);

        string memory diacritic06E5 = "\\u{06E5}";
        bytes memory utf8Diacritic06E5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic06E5));
        console2.log("06E5: ", string(utf8Diacritic06E5));
        console2.logBytes(utf8Diacritic06E5);

        console2.log("..");

        string memory diacritic06E6 = "\\u{06E6}";
        bytes memory utf8Diacritic06E6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic06E6));
        console2.log("06E6: ", string(utf8Diacritic06E6));
        console2.logBytes(utf8Diacritic06E6);

        string memory diacritic06EA = "\\u{06EA}";
        bytes memory utf8Diacritic06EA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic06EA));
        console2.log("06EA: ", string(utf8Diacritic06EA));
        console2.logBytes(utf8Diacritic06EA);

        console2.log("..");

        string memory diacritic06EC = "\\u{06EC}";
        bytes memory utf8Diacritic06EC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic06EC));
        console2.log("06EC: ", string(utf8Diacritic06EC));
        console2.logBytes(utf8Diacritic06EC);

        string memory diacritic0730 = "\\u{0730}";
        bytes memory utf8Diacritic0730 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0730));
        console2.log("0730: ", string(utf8Diacritic0730));
        console2.logBytes(utf8Diacritic0730);

        console2.log("..");

        string memory diacritic074A = "\\u{074A}";
        bytes memory utf8Diacritic074A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic074A));
        console2.log("074A: ", string(utf8Diacritic074A));
        console2.logBytes(utf8Diacritic074A);

        string memory diacritic07A6 = "\\u{07A6}";
        bytes memory utf8Diacritic07A6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic07A6));
        console2.log("07A6: ", string(utf8Diacritic07A6));
        console2.logBytes(utf8Diacritic07A6);

        console2.log("..");

        string memory diacritic07B0 = "\\u{07B0}";
        bytes memory utf8Diacritic07B0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic07B0));
        console2.log("07B0: ", string(utf8Diacritic07B0));
        console2.logBytes(utf8Diacritic07B0);

        string memory diacritic07EB = "\\u{07EB}";
        bytes memory utf8Diacritic07EB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic07EB));
        console2.log("07EB: ", string(utf8Diacritic07EB));
        console2.logBytes(utf8Diacritic07EB);

        console2.log("..");

        string memory diacritic07F3 = "\\u{07F3}";
        bytes memory utf8Diacritic07F3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic07F3));
        console2.log("07F3: ", string(utf8Diacritic07F3));
        console2.logBytes(utf8Diacritic07F3);

        string memory diacritic07F4 = "\\u{07F4}";
        bytes memory utf8Diacritic07F4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic07F4));
        console2.log("07F4: ", string(utf8Diacritic07F4));
        console2.logBytes(utf8Diacritic07F4);

        console2.log("..");

        string memory diacritic07F5 = "\\u{07F5}";
        bytes memory utf8Diacritic07F5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic07F5));
        console2.log("07F5: ", string(utf8Diacritic07F5));
        console2.logBytes(utf8Diacritic07F5);

        string memory diacritic0818 = "\\u{0818}";
        bytes memory utf8Diacritic0818 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0818));
        console2.log("0818: ", string(utf8Diacritic0818));
        console2.logBytes(utf8Diacritic0818);

        console2.log("..");

        string memory diacritic0819 = "\\u{0819}";
        bytes memory utf8Diacritic0819 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0819));
        console2.log("0819: ", string(utf8Diacritic0819));
        console2.logBytes(utf8Diacritic0819);

        string memory diacritic0898 = "\\u{0898}";
        bytes memory utf8Diacritic0898 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0898));
        console2.log("0898: ", string(utf8Diacritic0898));
        console2.logBytes(utf8Diacritic0898);

        console2.log("..");

        string memory diacritic089F = "\\u{089F}";
        bytes memory utf8Diacritic089F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic089F));
        console2.log("089F: ", string(utf8Diacritic089F));
        console2.logBytes(utf8Diacritic089F);

        string memory diacritic08C9 = "\\u{08C9}";
        bytes memory utf8Diacritic08C9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic08C9));
        console2.log("08C9: ", string(utf8Diacritic08C9));
        console2.logBytes(utf8Diacritic08C9);

        string memory diacritic08CA = "\\u{08CA}";
        bytes memory utf8Diacritic08CA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic08CA));
        console2.log("08CA: ", string(utf8Diacritic08CA));
        console2.logBytes(utf8Diacritic08CA);

        console2.log("..");

        string memory diacritic08D2 = "\\u{08D2}";
        bytes memory utf8Diacritic08D2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic08D2));
        console2.log("08D2: ", string(utf8Diacritic08D2));
        console2.logBytes(utf8Diacritic08D2);

        string memory diacritic08E3 = "\\u{08E3}";
        bytes memory utf8Diacritic08E3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic08E3));
        console2.log("08E3: ", string(utf8Diacritic08E3));
        console2.logBytes(utf8Diacritic08E3);

        console2.log("..");

        string memory diacritic08FE = "\\u{08FE}";
        bytes memory utf8Diacritic08FE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic08FE));
        console2.log("08FE: ", string(utf8Diacritic08FE));
        console2.logBytes(utf8Diacritic08FE);

        string memory diacritic093C = "\\u{093C}";
        bytes memory utf8Diacritic093C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic093C));
        console2.log("093C: ", string(utf8Diacritic093C));
        console2.logBytes(utf8Diacritic093C);

        string memory diacritic094D = "\\u{094D}";
        bytes memory utf8Diacritic094D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic094D));
        console2.log("094D: ", string(utf8Diacritic094D));
        console2.logBytes(utf8Diacritic094D);

        string memory diacritic0951 = "\\u{0951}";
        bytes memory utf8Diacritic0951 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0951));
        console2.log("0951: ", string(utf8Diacritic0951));
        console2.logBytes(utf8Diacritic0951);

        console2.log("..");

        string memory diacritic0954 = "\\u{0954}";
        bytes memory utf8Diacritic0954 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0954));
        console2.log("0954: ", string(utf8Diacritic0954));
        console2.logBytes(utf8Diacritic0954);

        string memory diacritic0971 = "\\u{0971}";
        bytes memory utf8Diacritic0971 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0971));
        console2.log("0971: ", string(utf8Diacritic0971));
        console2.logBytes(utf8Diacritic0971);

        string memory diacritic09BC = "\\u{09BC}";
        bytes memory utf8Diacritic09BC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic09BC));
        console2.log("09BC: ", string(utf8Diacritic09BC));
        console2.logBytes(utf8Diacritic09BC);

        string memory diacritic09CD = "\\u{09CD}";
        bytes memory utf8Diacritic09CD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic09CD));
        console2.log("09CD: ", string(utf8Diacritic09CD));
        console2.logBytes(utf8Diacritic09CD);

        string memory diacritic0A3C = "\\u{0A3C}";
        bytes memory utf8Diacritic0A3C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0A3C));
        console2.log("0A3C: ", string(utf8Diacritic0A3C));
        console2.logBytes(utf8Diacritic0A3C);

        string memory diacritic0A4D = "\\u{0A4D}";
        bytes memory utf8Diacritic0A4D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0A4D));
        console2.log("0A4D: ", string(utf8Diacritic0A4D));
        console2.logBytes(utf8Diacritic0A4D);

        string memory diacritic0ABC = "\\u{0ABC}";
        bytes memory utf8Diacritic0ABC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0ABC));
        console2.log("0ABC: ", string(utf8Diacritic0ABC));
        console2.logBytes(utf8Diacritic0ABC);

        string memory diacritic0ACD = "\\u{0ACD}";
        bytes memory utf8Diacritic0ACD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0ACD));
        console2.log("0ACD: ", string(utf8Diacritic0ACD));
        console2.logBytes(utf8Diacritic0ACD);

        string memory diacritic0AFD = "\\u{0AFD}";
        bytes memory utf8Diacritic0AFD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0AFD));
        console2.log("0AFD: ", string(utf8Diacritic0AFD));
        console2.logBytes(utf8Diacritic0AFD);

        console2.log("..");

        string memory diacritic0AFF = "\\u{0AFF}";
        bytes memory utf8Diacritic0AFF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0AFF));
        console2.log("0AFF: ", string(utf8Diacritic0AFF));
        console2.logBytes(utf8Diacritic0AFF);

        string memory diacritic0B3C = "\\u{0B3C}";
        bytes memory utf8Diacritic0B3C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0B3C));
        console2.log("0B3C: ", string(utf8Diacritic0B3C));
        console2.logBytes(utf8Diacritic0B3C);

        string memory diacritic0B4D = "\\u{0B4D}";
        bytes memory utf8Diacritic0B4D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0B4D));
        console2.log("0B4D: ", string(utf8Diacritic0B4D));
        console2.logBytes(utf8Diacritic0B4D);

        string memory diacritic0B55 = "\\u{0B55}";
        bytes memory utf8Diacritic0B55 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0B55));
        console2.log("0B55: ", string(utf8Diacritic0B55));
        console2.logBytes(utf8Diacritic0B55);

        string memory diacritic0BCD = "\\u{0BCD}";
        bytes memory utf8Diacritic0BCD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0BCD));
        console2.log("0BCD: ", string(utf8Diacritic0BCD));
        console2.logBytes(utf8Diacritic0BCD);

        string memory diacritic0C3C = "\\u{0C3C}";
        bytes memory utf8Diacritic0C3C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0C3C));
        console2.log("0C3C: ", string(utf8Diacritic0C3C));
        console2.logBytes(utf8Diacritic0C3C);

        string memory diacritic0C4D = "\\u{0C4D}";
        bytes memory utf8Diacritic0C4D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0C4D));
        console2.log("0C4D: ", string(utf8Diacritic0C4D));
        console2.logBytes(utf8Diacritic0C4D);

        string memory diacritic0CBC = "\\u{0CBC}";
        bytes memory utf8Diacritic0CBC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0CBC));
        console2.log("0CBC: ", string(utf8Diacritic0CBC));
        console2.logBytes(utf8Diacritic0CBC);

        string memory diacritic0CCD = "\\u{0CCD}";
        bytes memory utf8Diacritic0CCD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0CCD));
        console2.log("0CCD: ", string(utf8Diacritic0CCD));
        console2.logBytes(utf8Diacritic0CCD);

        string memory diacritic0D3B = "\\u{0D3B}";
        bytes memory utf8Diacritic0D3B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0D3B));
        console2.log("0D3B: ", string(utf8Diacritic0D3B));
        console2.logBytes(utf8Diacritic0D3B);

        console2.log("..");

        string memory diacritic0D3C = "\\u{0D3C}";
        bytes memory utf8Diacritic0D3C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0D3C));
        console2.log("0D3C: ", string(utf8Diacritic0D3C));
        console2.logBytes(utf8Diacritic0D3C);

        string memory diacritic0D4D = "\\u{0D4D}";
        bytes memory utf8Diacritic0D4D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0D4D));
        console2.log("0D4D: ", string(utf8Diacritic0D4D));
        console2.logBytes(utf8Diacritic0D4D);

        string memory diacritic0DCA = "\\u{0DCA}";
        bytes memory utf8Diacritic0DCA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0DCA));
        console2.log("0DCA: ", string(utf8Diacritic0DCA));
        console2.logBytes(utf8Diacritic0DCA);

        string memory diacritic0E3A = "\\u{0E3A}";
        bytes memory utf8Diacritic0E3A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0E3A));
        console2.log("0E3A: ", string(utf8Diacritic0E3A));
        console2.logBytes(utf8Diacritic0E3A);

        string memory diacritic0E47 = "\\u{0E47}";
        bytes memory utf8Diacritic0E47 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0E47));
        console2.log("0E47: ", string(utf8Diacritic0E47));
        console2.logBytes(utf8Diacritic0E47);

        console2.log("..");

        string memory diacritic0E4C = "\\u{0E4C}";
        bytes memory utf8Diacritic0E4C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0E4C));
        console2.log("0E4C: ", string(utf8Diacritic0E4C));
        console2.logBytes(utf8Diacritic0E4C);

        string memory diacritic0E4E = "\\u{0E4E}";
        bytes memory utf8Diacritic0E4E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0E4E));
        console2.log("0E4E: ", string(utf8Diacritic0E4E));
        console2.logBytes(utf8Diacritic0E4E);

        string memory diacritic0EBA = "\\u{0EBA}";
        bytes memory utf8Diacritic0EBA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0EBA));
        console2.log("0EBA: ", string(utf8Diacritic0EBA));
        console2.logBytes(utf8Diacritic0EBA);

        string memory diacritic0EC8 = "\\u{0EC8}";
        bytes memory utf8Diacritic0EC8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0EC8));
        console2.log("0EC8: ", string(utf8Diacritic0EC8));
        console2.logBytes(utf8Diacritic0EC8);

        console2.log("..");

        string memory diacritic0ECC = "\\u{0ECC}";
        bytes memory utf8Diacritic0ECC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0ECC));
        console2.log("0ECC: ", string(utf8Diacritic0ECC));
        console2.logBytes(utf8Diacritic0ECC);

        string memory diacritic0F18 = "\\u{0F18}";
        bytes memory utf8Diacritic0F18 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0F18));
        console2.log("0F18: ", string(utf8Diacritic0F18));
        console2.logBytes(utf8Diacritic0F18);

        console2.log("..");

        string memory diacritic0F19 = "\\u{0F19}";
        bytes memory utf8Diacritic0F19 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0F19));
        console2.log("0F19: ", string(utf8Diacritic0F19));
        console2.logBytes(utf8Diacritic0F19);

        string memory diacritic0F35 = "\\u{0F35}";
        bytes memory utf8Diacritic0F35 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0F35));
        console2.log("0F35: ", string(utf8Diacritic0F35));
        console2.logBytes(utf8Diacritic0F35);

        string memory diacritic0F37 = "\\u{0F37}";
        bytes memory utf8Diacritic0F37 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0F37));
        console2.log("0F37: ", string(utf8Diacritic0F37));
        console2.logBytes(utf8Diacritic0F37);

        string memory diacritic0F39 = "\\u{0F39}";
        bytes memory utf8Diacritic0F39 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0F39));
        console2.log("0F39: ", string(utf8Diacritic0F39));
        console2.logBytes(utf8Diacritic0F39);

        string memory diacritic0F3E = "\\u{0F3E}";
        bytes memory utf8Diacritic0F3E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0F3E));
        console2.log("0F3E: ", string(utf8Diacritic0F3E));
        console2.logBytes(utf8Diacritic0F3E);

        console2.log("..");

        string memory diacritic0F3F = "\\u{0F3F}";
        bytes memory utf8Diacritic0F3F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0F3F));
        console2.log("0F3F: ", string(utf8Diacritic0F3F));
        console2.logBytes(utf8Diacritic0F3F);

        string memory diacritic0F82 = "\\u{0F82}";
        bytes memory utf8Diacritic0F82 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0F82));
        console2.log("0F82: ", string(utf8Diacritic0F82));
        console2.logBytes(utf8Diacritic0F82);

        console2.log("..");

        string memory diacritic0F84 = "\\u{0F84}";
        bytes memory utf8Diacritic0F84 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0F84));
        console2.log("0F84: ", string(utf8Diacritic0F84));
        console2.logBytes(utf8Diacritic0F84);

        string memory diacritic0F86 = "\\u{0F86}";
        bytes memory utf8Diacritic0F86 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0F86));
        console2.log("0F86: ", string(utf8Diacritic0F86));
        console2.logBytes(utf8Diacritic0F86);

        console2.log("..");

        string memory diacritic0F87 = "\\u{0F87}";
        bytes memory utf8Diacritic0F87 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0F87));
        console2.log("0F87: ", string(utf8Diacritic0F87));
        console2.logBytes(utf8Diacritic0F87);

        string memory diacritic0FC6 = "\\u{0FC6}";
        bytes memory utf8Diacritic0FC6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic0FC6));
        console2.log("0FC6: ", string(utf8Diacritic0FC6));
        console2.logBytes(utf8Diacritic0FC6);

        string memory diacritic1037 = "\\u{1037}";
        bytes memory utf8Diacritic1037 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1037));
        console2.log("1037: ", string(utf8Diacritic1037));
        console2.logBytes(utf8Diacritic1037);

        string memory diacritic1039 = "\\u{1039}";
        bytes memory utf8Diacritic1039 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1039));
        console2.log("1039: ", string(utf8Diacritic1039));
        console2.logBytes(utf8Diacritic1039);

        console2.log("..");

        string memory diacritic103A = "\\u{103A}";
        bytes memory utf8Diacritic103A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic103A));
        console2.log("103A: ", string(utf8Diacritic103A));
        console2.logBytes(utf8Diacritic103A);

        string memory diacritic1063 = "\\u{1063}";
        bytes memory utf8Diacritic1063 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1063));
        console2.log("1063: ", string(utf8Diacritic1063));
        console2.logBytes(utf8Diacritic1063);

        console2.log("..");

        string memory diacritic1064 = "\\u{1064}";
        bytes memory utf8Diacritic1064 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1064));
        console2.log("1064: ", string(utf8Diacritic1064));
        console2.logBytes(utf8Diacritic1064);

        string memory diacritic1069 = "\\u{1069}";
        bytes memory utf8Diacritic1069 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1069));
        console2.log("1069: ", string(utf8Diacritic1069));
        console2.logBytes(utf8Diacritic1069);

        console2.log("..");

        string memory diacritic106D = "\\u{106D}";
        bytes memory utf8Diacritic106D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic106D));
        console2.log("106D: ", string(utf8Diacritic106D));
        console2.logBytes(utf8Diacritic106D);

        string memory diacritic1087 = "\\u{1087}";
        bytes memory utf8Diacritic1087 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1087));
        console2.log("1087: ", string(utf8Diacritic1087));
        console2.logBytes(utf8Diacritic1087);

        console2.log("..");

        string memory diacritic108C = "\\u{108C}";
        bytes memory utf8Diacritic108C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic108C));
        console2.log("108C: ", string(utf8Diacritic108C));
        console2.logBytes(utf8Diacritic108C);

        string memory diacritic108D = "\\u{108D}";
        bytes memory utf8Diacritic108D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic108D));
        console2.log("108D: ", string(utf8Diacritic108D));
        console2.logBytes(utf8Diacritic108D);

        string memory diacritic108F = "\\u{108F}";
        bytes memory utf8Diacritic108F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic108F));
        console2.log("108F: ", string(utf8Diacritic108F));
        console2.logBytes(utf8Diacritic108F);

        string memory diacritic109A = "\\u{109A}";
        bytes memory utf8Diacritic109A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic109A));
        console2.log("109A: ", string(utf8Diacritic109A));
        console2.logBytes(utf8Diacritic109A);

        console2.log("..");

        string memory diacritic109B = "\\u{109B}";
        bytes memory utf8Diacritic109B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic109B));
        console2.log("109B: ", string(utf8Diacritic109B));
        console2.logBytes(utf8Diacritic109B);

        string memory diacritic135D = "\\u{135D}";
        bytes memory utf8Diacritic135D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic135D));
        console2.log("135D: ", string(utf8Diacritic135D));
        console2.logBytes(utf8Diacritic135D);

        console2.log("..");

        string memory diacritic135F = "\\u{135F}";
        bytes memory utf8Diacritic135F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic135F));
        console2.log("135F: ", string(utf8Diacritic135F));
        console2.logBytes(utf8Diacritic135F);

        string memory diacritic1714 = "\\u{1714}";
        bytes memory utf8Diacritic1714 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1714));
        console2.log("1714: ", string(utf8Diacritic1714));
        console2.logBytes(utf8Diacritic1714);

        string memory diacritic1715 = "\\u{1715}";
        bytes memory utf8Diacritic1715 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1715));
        console2.log("1715: ", string(utf8Diacritic1715));
        console2.logBytes(utf8Diacritic1715);

        string memory diacritic1734 = "\\u{1734}";
        bytes memory utf8Diacritic1734 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1734));
        console2.log("1734: ", string(utf8Diacritic1734));
        console2.logBytes(utf8Diacritic1734);

        string memory diacritic17C9 = "\\u{17C9}";
        bytes memory utf8Diacritic17C9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic17C9));
        console2.log("17C9: ", string(utf8Diacritic17C9));
        console2.logBytes(utf8Diacritic17C9);

        console2.log("..");

        string memory diacritic17D3 = "\\u{17D3}";
        bytes memory utf8Diacritic17D3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic17D3));
        console2.log("17D3: ", string(utf8Diacritic17D3));
        console2.logBytes(utf8Diacritic17D3);

        string memory diacritic17DD = "\\u{17DD}";
        bytes memory utf8Diacritic17DD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic17DD));
        console2.log("17DD: ", string(utf8Diacritic17DD));
        console2.logBytes(utf8Diacritic17DD);

        string memory diacritic1939 = "\\u{1939}";
        bytes memory utf8Diacritic1939 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1939));
        console2.log("1939: ", string(utf8Diacritic1939));
        console2.logBytes(utf8Diacritic1939);

        console2.log("..");

        string memory diacritic193B = "\\u{193B}";
        bytes memory utf8Diacritic193B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic193B));
        console2.log("193B: ", string(utf8Diacritic193B));
        console2.logBytes(utf8Diacritic193B);

        string memory diacritic1A60 = "\\u{1A60}";
        bytes memory utf8Diacritic1A60 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1A60));
        console2.log("1A60: ", string(utf8Diacritic1A60));
        console2.logBytes(utf8Diacritic1A60);

        string memory diacritic1A75 = "\\u{1A75}";
        bytes memory utf8Diacritic1A75 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1A75));
        console2.log("1A75: ", string(utf8Diacritic1A75));
        console2.logBytes(utf8Diacritic1A75);

        console2.log("..");

        string memory diacritic1A7C = "\\u{1A7C}";
        bytes memory utf8Diacritic1A7C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1A7C));
        console2.log("1A7C: ", string(utf8Diacritic1A7C));
        console2.logBytes(utf8Diacritic1A7C);

        string memory diacritic1A7F = "\\u{1A7F}";
        bytes memory utf8Diacritic1A7F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1A7F));
        console2.log("1A7F: ", string(utf8Diacritic1A7F));
        console2.logBytes(utf8Diacritic1A7F);

        string memory diacritic1AB0 = "\\u{1AB0}";
        bytes memory utf8Diacritic1AB0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1AB0));
        console2.log("1AB0: ", string(utf8Diacritic1AB0));
        console2.logBytes(utf8Diacritic1AB0);

        console2.log("..");

        string memory diacritic1ABD = "\\u{1ABD}";
        bytes memory utf8Diacritic1ABD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1ABD));
        console2.log("1ABD: ", string(utf8Diacritic1ABD));
        console2.logBytes(utf8Diacritic1ABD);

        string memory diacritic1ABE = "\\u{1ABE}";
        bytes memory utf8Diacritic1ABE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1ABE));
        console2.log("1ABE: ", string(utf8Diacritic1ABE));
        console2.logBytes(utf8Diacritic1ABE);

        string memory diacritic1AC1 = "\\u{1AC1}";
        bytes memory utf8Diacritic1AC1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1AC1));
        console2.log("1AC1: ", string(utf8Diacritic1AC1));
        console2.logBytes(utf8Diacritic1AC1);

        console2.log("..");

        string memory diacritic1ACB = "\\u{1ACB}";
        bytes memory utf8Diacritic1ACB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1ACB));
        console2.log("1ACB: ", string(utf8Diacritic1ACB));
        console2.logBytes(utf8Diacritic1ACB);

        string memory diacritic1ACF = "\\u{1ACF}";
        bytes memory utf8Diacritic1ACF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1ACF));
        console2.log("1ACF: ", string(utf8Diacritic1ACF));
        console2.logBytes(utf8Diacritic1ACF);

        console2.log("..");

        string memory diacritic1ADD = "\\u{1ADD}";
        bytes memory utf8Diacritic1ADD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1ADD));
        console2.log("1ADD: ", string(utf8Diacritic1ADD));
        console2.logBytes(utf8Diacritic1ADD);

        string memory diacritic1AE0 = "\\u{1AE0}";
        bytes memory utf8Diacritic1AE0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1AE0));
        console2.log("1AE0: ", string(utf8Diacritic1AE0));
        console2.logBytes(utf8Diacritic1AE0);

        console2.log("..");

        string memory diacritic1AEB = "\\u{1AEB}";
        bytes memory utf8Diacritic1AEB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1AEB));
        console2.log("1AEB: ", string(utf8Diacritic1AEB));
        console2.logBytes(utf8Diacritic1AEB);

        string memory diacritic1B34 = "\\u{1B34}";
        bytes memory utf8Diacritic1B34 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1B34));
        console2.log("1B34: ", string(utf8Diacritic1B34));
        console2.logBytes(utf8Diacritic1B34);

        string memory diacritic1B44 = "\\u{1B44}";
        bytes memory utf8Diacritic1B44 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1B44));
        console2.log("1B44: ", string(utf8Diacritic1B44));
        console2.logBytes(utf8Diacritic1B44);

        string memory diacritic1B6B = "\\u{1B6B}";
        bytes memory utf8Diacritic1B6B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1B6B));
        console2.log("1B6B: ", string(utf8Diacritic1B6B));
        console2.logBytes(utf8Diacritic1B6B);

        console2.log("..");

        string memory diacritic1B73 = "\\u{1B73}";
        bytes memory utf8Diacritic1B73 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1B73));
        console2.log("1B73: ", string(utf8Diacritic1B73));
        console2.logBytes(utf8Diacritic1B73);

        string memory diacritic1BAA = "\\u{1BAA}";
        bytes memory utf8Diacritic1BAA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1BAA));
        console2.log("1BAA: ", string(utf8Diacritic1BAA));
        console2.logBytes(utf8Diacritic1BAA);

        string memory diacritic1BAB = "\\u{1BAB}";
        bytes memory utf8Diacritic1BAB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1BAB));
        console2.log("1BAB: ", string(utf8Diacritic1BAB));
        console2.logBytes(utf8Diacritic1BAB);

        string memory diacritic1BE6 = "\\u{1BE6}";
        bytes memory utf8Diacritic1BE6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1BE6));
        console2.log("1BE6: ", string(utf8Diacritic1BE6));
        console2.logBytes(utf8Diacritic1BE6);

        string memory diacritic1BF2 = "\\u{1BF2}";
        bytes memory utf8Diacritic1BF2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1BF2));
        console2.log("1BF2: ", string(utf8Diacritic1BF2));
        console2.logBytes(utf8Diacritic1BF2);

        console2.log("..");

        string memory diacritic1BF3 = "\\u{1BF3}";
        bytes memory utf8Diacritic1BF3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1BF3));
        console2.log("1BF3: ", string(utf8Diacritic1BF3));
        console2.logBytes(utf8Diacritic1BF3);

        string memory diacritic1C36 = "\\u{1C36}";
        bytes memory utf8Diacritic1C36 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1C36));
        console2.log("1C36: ", string(utf8Diacritic1C36));
        console2.logBytes(utf8Diacritic1C36);

        console2.log("..");

        string memory diacritic1C37 = "\\u{1C37}";
        bytes memory utf8Diacritic1C37 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1C37));
        console2.log("1C37: ", string(utf8Diacritic1C37));
        console2.logBytes(utf8Diacritic1C37);

        string memory diacritic1C78 = "\\u{1C78}";
        bytes memory utf8Diacritic1C78 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1C78));
        console2.log("1C78: ", string(utf8Diacritic1C78));
        console2.logBytes(utf8Diacritic1C78);

        console2.log("..");

        string memory diacritic1C7D = "\\u{1C7D}";
        bytes memory utf8Diacritic1C7D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1C7D));
        console2.log("1C7D: ", string(utf8Diacritic1C7D));
        console2.logBytes(utf8Diacritic1C7D);

        string memory diacritic1CD0 = "\\u{1CD0}";
        bytes memory utf8Diacritic1CD0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CD0));
        console2.log("1CD0: ", string(utf8Diacritic1CD0));
        console2.logBytes(utf8Diacritic1CD0);

        console2.log("..");

        string memory diacritic1CD2 = "\\u{1CD2}";
        bytes memory utf8Diacritic1CD2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CD2));
        console2.log("1CD2: ", string(utf8Diacritic1CD2));
        console2.logBytes(utf8Diacritic1CD2);

        string memory diacritic1CD3 = "\\u{1CD3}";
        bytes memory utf8Diacritic1CD3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CD3));
        console2.log("1CD3: ", string(utf8Diacritic1CD3));
        console2.logBytes(utf8Diacritic1CD3);

        string memory diacritic1CD4 = "\\u{1CD4}";
        bytes memory utf8Diacritic1CD4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CD4));
        console2.log("1CD4: ", string(utf8Diacritic1CD4));
        console2.logBytes(utf8Diacritic1CD4);

        console2.log("..");

        string memory diacritic1CE0 = "\\u{1CE0}";
        bytes memory utf8Diacritic1CE0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CE0));
        console2.log("1CE0: ", string(utf8Diacritic1CE0));
        console2.logBytes(utf8Diacritic1CE0);

        string memory diacritic1CE1 = "\\u{1CE1}";
        bytes memory utf8Diacritic1CE1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CE1));
        console2.log("1CE1: ", string(utf8Diacritic1CE1));
        console2.logBytes(utf8Diacritic1CE1);

        string memory diacritic1CE2 = "\\u{1CE2}";
        bytes memory utf8Diacritic1CE2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CE2));
        console2.log("1CE2: ", string(utf8Diacritic1CE2));
        console2.logBytes(utf8Diacritic1CE2);

        console2.log("..");

        string memory diacritic1CE8 = "\\u{1CE8}";
        bytes memory utf8Diacritic1CE8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CE8));
        console2.log("1CE8: ", string(utf8Diacritic1CE8));
        console2.logBytes(utf8Diacritic1CE8);

        string memory diacritic1CED = "\\u{1CED}";
        bytes memory utf8Diacritic1CED = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CED));
        console2.log("1CED: ", string(utf8Diacritic1CED));
        console2.logBytes(utf8Diacritic1CED);

        string memory diacritic1CF4 = "\\u{1CF4}";
        bytes memory utf8Diacritic1CF4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CF4));
        console2.log("1CF4: ", string(utf8Diacritic1CF4));
        console2.logBytes(utf8Diacritic1CF4);

        string memory diacritic1CF7 = "\\u{1CF7}";
        bytes memory utf8Diacritic1CF7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CF7));
        console2.log("1CF7: ", string(utf8Diacritic1CF7));
        console2.logBytes(utf8Diacritic1CF7);

        string memory diacritic1CF8 = "\\u{1CF8}";
        bytes memory utf8Diacritic1CF8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CF8));
        console2.log("1CF8: ", string(utf8Diacritic1CF8));
        console2.logBytes(utf8Diacritic1CF8);

        console2.log("..");

        string memory diacritic1CF9 = "\\u{1CF9}";
        bytes memory utf8Diacritic1CF9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CF9));
        console2.log("1CF9: ", string(utf8Diacritic1CF9));
        console2.logBytes(utf8Diacritic1CF9);

        string memory diacritic1D2C = "\\u{1D2C}";
        bytes memory utf8Diacritic1D2C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D2C));
        console2.log("1D2C: ", string(utf8Diacritic1D2C));
        console2.logBytes(utf8Diacritic1D2C);

        console2.log("..");

        string memory diacritic1D6A = "\\u{1D6A}";
        bytes memory utf8Diacritic1D6A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D6A));
        console2.log("1D6A: ", string(utf8Diacritic1D6A));
        console2.logBytes(utf8Diacritic1D6A);

        string memory diacritic1D9B = "\\u{1D9B}";
        bytes memory utf8Diacritic1D9B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D9B));
        console2.log("1D9B: ", string(utf8Diacritic1D9B));
        console2.logBytes(utf8Diacritic1D9B);

        console2.log("..");

        string memory diacritic1DBE = "\\u{1DBE}";
        bytes memory utf8Diacritic1DBE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1DBE));
        console2.log("1DBE: ", string(utf8Diacritic1DBE));
        console2.logBytes(utf8Diacritic1DBE);

        string memory diacritic1DC4 = "\\u{1DC4}";
        bytes memory utf8Diacritic1DC4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1DC4));
        console2.log("1DC4: ", string(utf8Diacritic1DC4));
        console2.logBytes(utf8Diacritic1DC4);

        console2.log("..");

        string memory diacritic1DCF = "\\u{1DCF}";
        bytes memory utf8Diacritic1DCF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1DCF));
        console2.log("1DCF: ", string(utf8Diacritic1DCF));
        console2.logBytes(utf8Diacritic1DCF);

        string memory diacritic1DF5 = "\\u{1DF5}";
        bytes memory utf8Diacritic1DF5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1DF5));
        console2.log("1DF5: ", string(utf8Diacritic1DF5));
        console2.logBytes(utf8Diacritic1DF5);

        console2.log("..");

        string memory diacritic1DFF = "\\u{1DFF}";
        bytes memory utf8Diacritic1DFF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1DFF));
        console2.log("1DFF: ", string(utf8Diacritic1DFF));
        console2.logBytes(utf8Diacritic1DFF);

        string memory diacritic1FBD = "\\u{1FBD}";
        bytes memory utf8Diacritic1FBD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1FBD));
        console2.log("1FBD: ", string(utf8Diacritic1FBD));
        console2.logBytes(utf8Diacritic1FBD);

        string memory diacritic1FBF = "\\u{1FBF}";
        bytes memory utf8Diacritic1FBF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1FBF));
        console2.log("1FBF: ", string(utf8Diacritic1FBF));
        console2.logBytes(utf8Diacritic1FBF);

        console2.log("..");

        string memory diacritic1FC1 = "\\u{1FC1}";
        bytes memory utf8Diacritic1FC1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1FC1));
        console2.log("1FC1: ", string(utf8Diacritic1FC1));
        console2.logBytes(utf8Diacritic1FC1);

        string memory diacritic1FCD = "\\u{1FCD}";
        bytes memory utf8Diacritic1FCD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1FCD));
        console2.log("1FCD: ", string(utf8Diacritic1FCD));
        console2.logBytes(utf8Diacritic1FCD);

        console2.log("..");

        string memory diacritic1FCF = "\\u{1FCF}";
        bytes memory utf8Diacritic1FCF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1FCF));
        console2.log("1FCF: ", string(utf8Diacritic1FCF));
        console2.logBytes(utf8Diacritic1FCF);

        string memory diacritic1FDD = "\\u{1FDD}";
        bytes memory utf8Diacritic1FDD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1FDD));
        console2.log("1FDD: ", string(utf8Diacritic1FDD));
        console2.logBytes(utf8Diacritic1FDD);

        console2.log("..");

        string memory diacritic1FDF = "\\u{1FDF}";
        bytes memory utf8Diacritic1FDF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1FDF));
        console2.log("1FDF: ", string(utf8Diacritic1FDF));
        console2.logBytes(utf8Diacritic1FDF);

        string memory diacritic1FED = "\\u{1FED}";
        bytes memory utf8Diacritic1FED = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1FED));
        console2.log("1FED: ", string(utf8Diacritic1FED));
        console2.logBytes(utf8Diacritic1FED);

        console2.log("..");

        string memory diacritic1FEF = "\\u{1FEF}";
        bytes memory utf8Diacritic1FEF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1FEF));
        console2.log("1FEF: ", string(utf8Diacritic1FEF));
        console2.logBytes(utf8Diacritic1FEF);

        string memory diacritic1FFD = "\\u{1FFD}";
        bytes memory utf8Diacritic1FFD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1FFD));
        console2.log("1FFD: ", string(utf8Diacritic1FFD));
        console2.logBytes(utf8Diacritic1FFD);

        console2.log("..");

        string memory diacritic1FFE = "\\u{1FFE}";
        bytes memory utf8Diacritic1FFE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1FFE));
        console2.log("1FFE: ", string(utf8Diacritic1FFE));
        console2.logBytes(utf8Diacritic1FFE);

        string memory diacritic2CEF = "\\u{2CEF}";
        bytes memory utf8Diacritic2CEF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic2CEF));
        console2.log("2CEF: ", string(utf8Diacritic2CEF));
        console2.logBytes(utf8Diacritic2CEF);

        console2.log("..");

        string memory diacritic2CF1 = "\\u{2CF1}";
        bytes memory utf8Diacritic2CF1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic2CF1));
        console2.log("2CF1: ", string(utf8Diacritic2CF1));
        console2.logBytes(utf8Diacritic2CF1);

        string memory diacritic2E2F = "\\u{2E2F}";
        bytes memory utf8Diacritic2E2F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic2E2F));
        console2.log("2E2F: ", string(utf8Diacritic2E2F));
        console2.logBytes(utf8Diacritic2E2F);

        string memory diacritic302A = "\\u{302A}";
        bytes memory utf8Diacritic302A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic302A));
        console2.log("302A: ", string(utf8Diacritic302A));
        console2.logBytes(utf8Diacritic302A);

        console2.log("..");

        string memory diacritic302D = "\\u{302D}";
        bytes memory utf8Diacritic302D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic302D));
        console2.log("302D: ", string(utf8Diacritic302D));
        console2.logBytes(utf8Diacritic302D);

        string memory diacritic302E = "\\u{302E}";
        bytes memory utf8Diacritic302E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic302E));
        console2.log("302E: ", string(utf8Diacritic302E));
        console2.logBytes(utf8Diacritic302E);

        console2.log("..");

        string memory diacritic302F = "\\u{302F}";
        bytes memory utf8Diacritic302F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic302F));
        console2.log("302F: ", string(utf8Diacritic302F));
        console2.logBytes(utf8Diacritic302F);

        string memory diacritic3099 = "\\u{3099}";
        bytes memory utf8Diacritic3099 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic3099));
        console2.log("3099: ", string(utf8Diacritic3099));
        console2.logBytes(utf8Diacritic3099);

        console2.log("..");

        string memory diacritic309A = "\\u{309A}";
        bytes memory utf8Diacritic309A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic309A));
        console2.log("309A: ", string(utf8Diacritic309A));
        console2.logBytes(utf8Diacritic309A);

        string memory diacritic309B = "\\u{309B}";
        bytes memory utf8Diacritic309B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic309B));
        console2.log("309B: ", string(utf8Diacritic309B));
        console2.logBytes(utf8Diacritic309B);

        console2.log("..");

        string memory diacritic309C = "\\u{309C}";
        bytes memory utf8Diacritic309C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic309C));
        console2.log("309C: ", string(utf8Diacritic309C));
        console2.logBytes(utf8Diacritic309C);

        string memory diacritic30FC = "\\u{30FC}";
        bytes memory utf8Diacritic30FC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic30FC));
        console2.log("30FC: ", string(utf8Diacritic30FC));
        console2.logBytes(utf8Diacritic30FC);

        string memory diacriticA66F = "\\u{A66F}";
        bytes memory utf8DiacriticA66F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA66F));
        console2.log("A66F: ", string(utf8DiacriticA66F));
        console2.logBytes(utf8DiacriticA66F);

        string memory diacriticA67C = "\\u{A67C}";
        bytes memory utf8DiacriticA67C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA67C));
        console2.log("A67C: ", string(utf8DiacriticA67C));
        console2.logBytes(utf8DiacriticA67C);

        console2.log("..");

        string memory diacriticA67D = "\\u{A67D}";
        bytes memory utf8DiacriticA67D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA67D));
        console2.log("A67D: ", string(utf8DiacriticA67D));
        console2.logBytes(utf8DiacriticA67D);

        string memory diacriticA67F = "\\u{A67F}";
        bytes memory utf8DiacriticA67F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA67F));
        console2.log("A67F: ", string(utf8DiacriticA67F));
        console2.logBytes(utf8DiacriticA67F);

        string memory diacriticA69C = "\\u{A69C}";
        bytes memory utf8DiacriticA69C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA69C));
        console2.log("A69C: ", string(utf8DiacriticA69C));
        console2.logBytes(utf8DiacriticA69C);

        console2.log("..");

        string memory diacriticA69D = "\\u{A69D}";
        bytes memory utf8DiacriticA69D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA69D));
        console2.log("A69D: ", string(utf8DiacriticA69D));
        console2.logBytes(utf8DiacriticA69D);

        string memory diacriticA6F0 = "\\u{A6F0}";
        bytes memory utf8DiacriticA6F0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA6F0));
        console2.log("A6F0: ", string(utf8DiacriticA6F0));
        console2.logBytes(utf8DiacriticA6F0);

        console2.log("..");

        string memory diacriticA6F1 = "\\u{A6F1}";
        bytes memory utf8DiacriticA6F1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA6F1));
        console2.log("A6F1: ", string(utf8DiacriticA6F1));
        console2.logBytes(utf8DiacriticA6F1);

        string memory diacriticA700 = "\\u{A700}";
        bytes memory utf8DiacriticA700 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA700));
        console2.log("A700: ", string(utf8DiacriticA700));
        console2.logBytes(utf8DiacriticA700);

        console2.log("..");

        string memory diacriticA716 = "\\u{A716}";
        bytes memory utf8DiacriticA716 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA716));
        console2.log("A716: ", string(utf8DiacriticA716));
        console2.logBytes(utf8DiacriticA716);

        string memory diacriticA717 = "\\u{A717}";
        bytes memory utf8DiacriticA717 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA717));
        console2.log("A717: ", string(utf8DiacriticA717));
        console2.logBytes(utf8DiacriticA717);

        console2.log("..");

        string memory diacriticA71F = "\\u{A71F}";
        bytes memory utf8DiacriticA71F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA71F));
        console2.log("A71F: ", string(utf8DiacriticA71F));
        console2.logBytes(utf8DiacriticA71F);

        string memory diacriticA720 = "\\u{A720}";
        bytes memory utf8DiacriticA720 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA720));
        console2.log("A720: ", string(utf8DiacriticA720));
        console2.logBytes(utf8DiacriticA720);

        console2.log("..");

        string memory diacriticA721 = "\\u{A721}";
        bytes memory utf8DiacriticA721 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA721));
        console2.log("A721: ", string(utf8DiacriticA721));
        console2.logBytes(utf8DiacriticA721);

        string memory diacriticA788 = "\\u{A788}";
        bytes memory utf8DiacriticA788 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA788));
        console2.log("A788: ", string(utf8DiacriticA788));
        console2.logBytes(utf8DiacriticA788);

        string memory diacriticA789 = "\\u{A789}";
        bytes memory utf8DiacriticA789 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA789));
        console2.log("A789: ", string(utf8DiacriticA789));
        console2.logBytes(utf8DiacriticA789);

        console2.log("..");

        string memory diacriticA78A = "\\u{A78A}";
        bytes memory utf8DiacriticA78A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA78A));
        console2.log("A78A: ", string(utf8DiacriticA78A));
        console2.logBytes(utf8DiacriticA78A);

        string memory diacriticA7F1 = "\\u{A7F1}";
        bytes memory utf8DiacriticA7F1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA7F1));
        console2.log("A7F1: ", string(utf8DiacriticA7F1));
        console2.logBytes(utf8DiacriticA7F1);

        string memory diacriticA7F8 = "\\u{A7F8}";
        bytes memory utf8DiacriticA7F8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA7F8));
        console2.log("A7F8: ", string(utf8DiacriticA7F8));
        console2.logBytes(utf8DiacriticA7F8);

        console2.log("..");

        string memory diacriticA7F9 = "\\u{A7F9}";
        bytes memory utf8DiacriticA7F9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA7F9));
        console2.log("A7F9: ", string(utf8DiacriticA7F9));
        console2.logBytes(utf8DiacriticA7F9);

        string memory diacriticA806 = "\\u{A806}";
        bytes memory utf8DiacriticA806 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA806));
        console2.log("A806: ", string(utf8DiacriticA806));
        console2.logBytes(utf8DiacriticA806);

        string memory diacriticA82C = "\\u{A82C}";
        bytes memory utf8DiacriticA82C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA82C));
        console2.log("A82C: ", string(utf8DiacriticA82C));
        console2.logBytes(utf8DiacriticA82C);

        string memory diacriticA8C4 = "\\u{A8C4}";
        bytes memory utf8DiacriticA8C4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA8C4));
        console2.log("A8C4: ", string(utf8DiacriticA8C4));
        console2.logBytes(utf8DiacriticA8C4);

        string memory diacriticA8E0 = "\\u{A8E0}";
        bytes memory utf8DiacriticA8E0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA8E0));
        console2.log("A8E0: ", string(utf8DiacriticA8E0));
        console2.logBytes(utf8DiacriticA8E0);

        console2.log("..");

        string memory diacriticA8F1 = "\\u{A8F1}";
        bytes memory utf8DiacriticA8F1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA8F1));
        console2.log("A8F1: ", string(utf8DiacriticA8F1));
        console2.logBytes(utf8DiacriticA8F1);

        string memory diacriticA92B = "\\u{A92B}";
        bytes memory utf8DiacriticA92B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA92B));
        console2.log("A92B: ", string(utf8DiacriticA92B));
        console2.logBytes(utf8DiacriticA92B);

        console2.log("..");

        string memory diacriticA92D = "\\u{A92D}";
        bytes memory utf8DiacriticA92D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA92D));
        console2.log("A92D: ", string(utf8DiacriticA92D));
        console2.logBytes(utf8DiacriticA92D);

        string memory diacriticA92E = "\\u{A92E}";
        bytes memory utf8DiacriticA92E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA92E));
        console2.log("A92E: ", string(utf8DiacriticA92E));
        console2.logBytes(utf8DiacriticA92E);

        string memory diacriticA953 = "\\u{A953}";
        bytes memory utf8DiacriticA953 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA953));
        console2.log("A953: ", string(utf8DiacriticA953));
        console2.logBytes(utf8DiacriticA953);

        string memory diacriticA9B3 = "\\u{A9B3}";
        bytes memory utf8DiacriticA9B3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA9B3));
        console2.log("A9B3: ", string(utf8DiacriticA9B3));
        console2.logBytes(utf8DiacriticA9B3);

        string memory diacriticA9C0 = "\\u{A9C0}";
        bytes memory utf8DiacriticA9C0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA9C0));
        console2.log("A9C0: ", string(utf8DiacriticA9C0));
        console2.logBytes(utf8DiacriticA9C0);

        string memory diacriticA9E5 = "\\u{A9E5}";
        bytes memory utf8DiacriticA9E5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticA9E5));
        console2.log("A9E5: ", string(utf8DiacriticA9E5));
        console2.logBytes(utf8DiacriticA9E5);

        string memory diacriticAA7B = "\\u{AA7B}";
        bytes memory utf8DiacriticAA7B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAA7B));
        console2.log("AA7B: ", string(utf8DiacriticAA7B));
        console2.logBytes(utf8DiacriticAA7B);

        string memory diacriticAA7C = "\\u{AA7C}";
        bytes memory utf8DiacriticAA7C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAA7C));
        console2.log("AA7C: ", string(utf8DiacriticAA7C));
        console2.logBytes(utf8DiacriticAA7C);

        string memory diacriticAA7D = "\\u{AA7D}";
        bytes memory utf8DiacriticAA7D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAA7D));
        console2.log("AA7D: ", string(utf8DiacriticAA7D));
        console2.logBytes(utf8DiacriticAA7D);

        string memory diacriticAABF = "\\u{AABF}";
        bytes memory utf8DiacriticAABF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAABF));
        console2.log("AABF: ", string(utf8DiacriticAABF));
        console2.logBytes(utf8DiacriticAABF);

        string memory diacriticAAC0 = "\\u{AAC0}";
        bytes memory utf8DiacriticAAC0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAAC0));
        console2.log("AAC0: ", string(utf8DiacriticAAC0));
        console2.logBytes(utf8DiacriticAAC0);

        string memory diacriticAAC1 = "\\u{AAC1}";
        bytes memory utf8DiacriticAAC1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAAC1));
        console2.log("AAC1: ", string(utf8DiacriticAAC1));
        console2.logBytes(utf8DiacriticAAC1);

        string memory diacriticAAC2 = "\\u{AAC2}";
        bytes memory utf8DiacriticAAC2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAAC2));
        console2.log("AAC2: ", string(utf8DiacriticAAC2));
        console2.logBytes(utf8DiacriticAAC2);

        string memory diacriticAAF6 = "\\u{AAF6}";
        bytes memory utf8DiacriticAAF6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAAF6));
        console2.log("AAF6: ", string(utf8DiacriticAAF6));
        console2.logBytes(utf8DiacriticAAF6);

        string memory diacriticAB5B = "\\u{AB5B}";
        bytes memory utf8DiacriticAB5B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAB5B));
        console2.log("AB5B: ", string(utf8DiacriticAB5B));
        console2.logBytes(utf8DiacriticAB5B);

        string memory diacriticAB5C = "\\u{AB5C}";
        bytes memory utf8DiacriticAB5C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAB5C));
        console2.log("AB5C: ", string(utf8DiacriticAB5C));
        console2.logBytes(utf8DiacriticAB5C);

        console2.log("..");

        string memory diacriticAB5F = "\\u{AB5F}";
        bytes memory utf8DiacriticAB5F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAB5F));
        console2.log("AB5F: ", string(utf8DiacriticAB5F));
        console2.logBytes(utf8DiacriticAB5F);

        string memory diacriticAB69 = "\\u{AB69}";
        bytes memory utf8DiacriticAB69 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAB69));
        console2.log("AB69: ", string(utf8DiacriticAB69));
        console2.logBytes(utf8DiacriticAB69);

        string memory diacriticAB6A = "\\u{AB6A}";
        bytes memory utf8DiacriticAB6A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAB6A));
        console2.log("AB6A: ", string(utf8DiacriticAB6A));
        console2.logBytes(utf8DiacriticAB6A);

        console2.log("..");

        string memory diacriticAB6B = "\\u{AB6B}";
        bytes memory utf8DiacriticAB6B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticAB6B));
        console2.log("AB6B: ", string(utf8DiacriticAB6B));
        console2.logBytes(utf8DiacriticAB6B);

        string memory diacriticABEC = "\\u{ABEC}";
        bytes memory utf8DiacriticABEC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticABEC));
        console2.log("ABEC: ", string(utf8DiacriticABEC));
        console2.logBytes(utf8DiacriticABEC);

        string memory diacriticABED = "\\u{ABED}";
        bytes memory utf8DiacriticABED = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticABED));
        console2.log("ABED: ", string(utf8DiacriticABED));
        console2.logBytes(utf8DiacriticABED);

        string memory diacriticFB1E = "\\u{FB1E}";
        bytes memory utf8DiacriticFB1E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticFB1E));
        console2.log("FB1E: ", string(utf8DiacriticFB1E));
        console2.logBytes(utf8DiacriticFB1E);

        string memory diacriticFE20 = "\\u{FE20}";
        bytes memory utf8DiacriticFE20 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticFE20));
        console2.log("FE20: ", string(utf8DiacriticFE20));
        console2.logBytes(utf8DiacriticFE20);

        console2.log("..");

        string memory diacriticFE2F = "\\u{FE2F}";
        bytes memory utf8DiacriticFE2F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticFE2F));
        console2.log("FE2F: ", string(utf8DiacriticFE2F));
        console2.logBytes(utf8DiacriticFE2F);

        string memory diacriticFF3E = "\\u{FF3E}";
        bytes memory utf8DiacriticFF3E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticFF3E));
        console2.log("FF3E: ", string(utf8DiacriticFF3E));
        console2.logBytes(utf8DiacriticFF3E);

        string memory diacriticFF40 = "\\u{FF40}";
        bytes memory utf8DiacriticFF40 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticFF40));
        console2.log("FF40: ", string(utf8DiacriticFF40));
        console2.logBytes(utf8DiacriticFF40);

        string memory diacriticFF70 = "\\u{FF70}";
        bytes memory utf8DiacriticFF70 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticFF70));
        console2.log("FF70: ", string(utf8DiacriticFF70));
        console2.logBytes(utf8DiacriticFF70);

        string memory diacriticFF9E = "\\u{FF9E}";
        bytes memory utf8DiacriticFF9E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticFF9E));
        console2.log("FF9E: ", string(utf8DiacriticFF9E));
        console2.logBytes(utf8DiacriticFF9E);

        console2.log("..");

        string memory diacriticFF9F = "\\u{FF9F}";
        bytes memory utf8DiacriticFF9F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticFF9F));
        console2.log("FF9F: ", string(utf8DiacriticFF9F));
        console2.logBytes(utf8DiacriticFF9F);

        string memory diacriticFFE3 = "\\u{FFE3}";
        bytes memory utf8DiacriticFFE3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacriticFFE3));
        console2.log("FFE3: ", string(utf8DiacriticFFE3));
        console2.logBytes(utf8DiacriticFFE3);

        string memory diacritic102E0 = "\\u{102E0}";
        bytes memory utf8Diacritic102E0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic102E0));
        console2.log("102E0: ", string(utf8Diacritic102E0));
        console2.logBytes(utf8Diacritic102E0);

        string memory diacritic10780 = "\\u{10780}";
        bytes memory utf8Diacritic10780 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10780));
        console2.log("10780: ", string(utf8Diacritic10780));
        console2.logBytes(utf8Diacritic10780);

        console2.log("..");

        string memory diacritic10785 = "\\u{10785}";
        bytes memory utf8Diacritic10785 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10785));
        console2.log("10785: ", string(utf8Diacritic10785));
        console2.logBytes(utf8Diacritic10785);

        string memory diacritic10787 = "\\u{10787}";
        bytes memory utf8Diacritic10787 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10787));
        console2.log("10787: ", string(utf8Diacritic10787));
        console2.logBytes(utf8Diacritic10787);

        console2.log("..");

        string memory diacritic107B0 = "\\u{107B0}";
        bytes memory utf8Diacritic107B0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic107B0));
        console2.log("107B0: ", string(utf8Diacritic107B0));
        console2.logBytes(utf8Diacritic107B0);

        string memory diacritic107B2 = "\\u{107B2}";
        bytes memory utf8Diacritic107B2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic107B2));
        console2.log("107B2: ", string(utf8Diacritic107B2));
        console2.logBytes(utf8Diacritic107B2);

        console2.log("..");

        string memory diacritic107BA = "\\u{107BA}";
        bytes memory utf8Diacritic107BA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic107BA));
        console2.log("107BA: ", string(utf8Diacritic107BA));
        console2.logBytes(utf8Diacritic107BA);

        string memory diacritic10A38 = "\\u{10A38}";
        bytes memory utf8Diacritic10A38 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10A38));
        console2.log("10A38: ", string(utf8Diacritic10A38));
        console2.logBytes(utf8Diacritic10A38);

        console2.log("..");

        string memory diacritic10A3A = "\\u{10A3A}";
        bytes memory utf8Diacritic10A3A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10A3A));
        console2.log("10A3A: ", string(utf8Diacritic10A3A));
        console2.logBytes(utf8Diacritic10A3A);

        string memory diacritic10A3F = "\\u{10A3F}";
        bytes memory utf8Diacritic10A3F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10A3F));
        console2.log("10A3F: ", string(utf8Diacritic10A3F));
        console2.logBytes(utf8Diacritic10A3F);

        string memory diacritic10AE5 = "\\u{10AE5}";
        bytes memory utf8Diacritic10AE5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10AE5));
        console2.log("10AE5: ", string(utf8Diacritic10AE5));
        console2.logBytes(utf8Diacritic10AE5);

        console2.log("..");

        string memory diacritic10AE6 = "\\u{10AE6}";
        bytes memory utf8Diacritic10AE6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10AE6));
        console2.log("10AE6: ", string(utf8Diacritic10AE6));
        console2.logBytes(utf8Diacritic10AE6);

        string memory diacritic10D22 = "\\u{10D22}";
        bytes memory utf8Diacritic10D22 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10D22));
        console2.log("10D22: ", string(utf8Diacritic10D22));
        console2.logBytes(utf8Diacritic10D22);

        console2.log("..");

        string memory diacritic10D23 = "\\u{10D23}";
        bytes memory utf8Diacritic10D23 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10D23));
        console2.log("10D23: ", string(utf8Diacritic10D23));
        console2.logBytes(utf8Diacritic10D23);

        string memory diacritic10D24 = "\\u{10D24}";
        bytes memory utf8Diacritic10D24 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10D24));
        console2.log("10D24: ", string(utf8Diacritic10D24));
        console2.logBytes(utf8Diacritic10D24);

        console2.log("..");

        string memory diacritic10D27 = "\\u{10D27}";
        bytes memory utf8Diacritic10D27 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10D27));
        console2.log("10D27: ", string(utf8Diacritic10D27));
        console2.logBytes(utf8Diacritic10D27);

        string memory diacritic10D4E = "\\u{10D4E}";
        bytes memory utf8Diacritic10D4E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10D4E));
        console2.log("10D4E: ", string(utf8Diacritic10D4E));
        console2.logBytes(utf8Diacritic10D4E);

        string memory diacritic10D69 = "\\u{10D69}";
        bytes memory utf8Diacritic10D69 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10D69));
        console2.log("10D69: ", string(utf8Diacritic10D69));
        console2.logBytes(utf8Diacritic10D69);

        console2.log("..");

        string memory diacritic10D6D = "\\u{10D6D}";
        bytes memory utf8Diacritic10D6D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10D6D));
        console2.log("10D6D: ", string(utf8Diacritic10D6D));
        console2.logBytes(utf8Diacritic10D6D);

        string memory diacritic10EFA = "\\u{10EFA}";
        bytes memory utf8Diacritic10EFA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10EFA));
        console2.log("10EFA: ", string(utf8Diacritic10EFA));
        console2.logBytes(utf8Diacritic10EFA);

        string memory diacritic10EFD = "\\u{10EFD}";
        bytes memory utf8Diacritic10EFD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10EFD));
        console2.log("10EFD: ", string(utf8Diacritic10EFD));
        console2.logBytes(utf8Diacritic10EFD);

        console2.log("..");

        string memory diacritic10EFF = "\\u{10EFF}";
        bytes memory utf8Diacritic10EFF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10EFF));
        console2.log("10EFF: ", string(utf8Diacritic10EFF));
        console2.logBytes(utf8Diacritic10EFF);

        string memory diacritic10F46 = "\\u{10F46}";
        bytes memory utf8Diacritic10F46 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10F46));
        console2.log("10F46: ", string(utf8Diacritic10F46));
        console2.logBytes(utf8Diacritic10F46);

        console2.log("..");

        string memory diacritic10F50 = "\\u{10F50}";
        bytes memory utf8Diacritic10F50 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10F50));
        console2.log("10F50: ", string(utf8Diacritic10F50));
        console2.logBytes(utf8Diacritic10F50);

        string memory diacritic10F82 = "\\u{10F82}";
        bytes memory utf8Diacritic10F82 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10F82));
        console2.log("10F82: ", string(utf8Diacritic10F82));
        console2.logBytes(utf8Diacritic10F82);

        console2.log("..");

        string memory diacritic10F85 = "\\u{10F85}";
        bytes memory utf8Diacritic10F85 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic10F85));
        console2.log("10F85: ", string(utf8Diacritic10F85));
        console2.logBytes(utf8Diacritic10F85);

        string memory diacritic11046 = "\\u{11046}";
        bytes memory utf8Diacritic11046 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11046));
        console2.log("11046: ", string(utf8Diacritic11046));
        console2.logBytes(utf8Diacritic11046);

        string memory diacritic11070 = "\\u{11070}";
        bytes memory utf8Diacritic11070 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11070));
        console2.log("11070: ", string(utf8Diacritic11070));
        console2.logBytes(utf8Diacritic11070);

        string memory diacritic110B9 = "\\u{110B9}";
        bytes memory utf8Diacritic110B9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic110B9));
        console2.log("110B9: ", string(utf8Diacritic110B9));
        console2.logBytes(utf8Diacritic110B9);

        console2.log("..");

        string memory diacritic110BA = "\\u{110BA}";
        bytes memory utf8Diacritic110BA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic110BA));
        console2.log("110BA: ", string(utf8Diacritic110BA));
        console2.logBytes(utf8Diacritic110BA);

        string memory diacritic11133 = "\\u{11133}";
        bytes memory utf8Diacritic11133 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11133));
        console2.log("11133: ", string(utf8Diacritic11133));
        console2.logBytes(utf8Diacritic11133);

        console2.log("..");

        string memory diacritic11134 = "\\u{11134}";
        bytes memory utf8Diacritic11134 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11134));
        console2.log("11134: ", string(utf8Diacritic11134));
        console2.logBytes(utf8Diacritic11134);

        string memory diacritic11173 = "\\u{11173}";
        bytes memory utf8Diacritic11173 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11173));
        console2.log("11173: ", string(utf8Diacritic11173));
        console2.logBytes(utf8Diacritic11173);

        string memory diacritic111C0 = "\\u{111C0}";
        bytes memory utf8Diacritic111C0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic111C0));
        console2.log("111C0: ", string(utf8Diacritic111C0));
        console2.logBytes(utf8Diacritic111C0);

        string memory diacritic111CA = "\\u{111CA}";
        bytes memory utf8Diacritic111CA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic111CA));
        console2.log("111CA: ", string(utf8Diacritic111CA));
        console2.logBytes(utf8Diacritic111CA);

        console2.log("..");

        string memory diacritic111CC = "\\u{111CC}";
        bytes memory utf8Diacritic111CC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic111CC));
        console2.log("111CC: ", string(utf8Diacritic111CC));
        console2.logBytes(utf8Diacritic111CC);

        string memory diacritic11235 = "\\u{11235}";
        bytes memory utf8Diacritic11235 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11235));
        console2.log("11235: ", string(utf8Diacritic11235));
        console2.logBytes(utf8Diacritic11235);

        string memory diacritic11236 = "\\u{11236}";
        bytes memory utf8Diacritic11236 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11236));
        console2.log("11236: ", string(utf8Diacritic11236));
        console2.logBytes(utf8Diacritic11236);

        string memory diacritic112E9 = "\\u{112E9}";
        bytes memory utf8Diacritic112E9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic112E9));
        console2.log("112E9: ", string(utf8Diacritic112E9));
        console2.logBytes(utf8Diacritic112E9);

        console2.log("..");

        string memory diacritic112EA = "\\u{112EA}";
        bytes memory utf8Diacritic112EA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic112EA));
        console2.log("112EA: ", string(utf8Diacritic112EA));
        console2.logBytes(utf8Diacritic112EA);

        string memory diacritic1133B = "\\u{1133B}";
        bytes memory utf8Diacritic1133B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1133B));
        console2.log("1133B: ", string(utf8Diacritic1133B));
        console2.logBytes(utf8Diacritic1133B);

        console2.log("..");

        string memory diacritic1133C = "\\u{1133C}";
        bytes memory utf8Diacritic1133C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1133C));
        console2.log("1133C: ", string(utf8Diacritic1133C));
        console2.logBytes(utf8Diacritic1133C);

        string memory diacritic1134D = "\\u{1134D}";
        bytes memory utf8Diacritic1134D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1134D));
        console2.log("1134D: ", string(utf8Diacritic1134D));
        console2.logBytes(utf8Diacritic1134D);

        string memory diacritic11366 = "\\u{11366}";
        bytes memory utf8Diacritic11366 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11366));
        console2.log("11366: ", string(utf8Diacritic11366));
        console2.logBytes(utf8Diacritic11366);

        console2.log("..");

        string memory diacritic1136C = "\\u{1136C}";
        bytes memory utf8Diacritic1136C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1136C));
        console2.log("1136C: ", string(utf8Diacritic1136C));
        console2.logBytes(utf8Diacritic1136C);

        string memory diacritic11370 = "\\u{11370}";
        bytes memory utf8Diacritic11370 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11370));
        console2.log("11370: ", string(utf8Diacritic11370));
        console2.logBytes(utf8Diacritic11370);

        console2.log("..");

        string memory diacritic11374 = "\\u{11374}";
        bytes memory utf8Diacritic11374 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11374));
        console2.log("11374: ", string(utf8Diacritic11374));
        console2.logBytes(utf8Diacritic11374);

        string memory diacritic113CE = "\\u{113CE}";
        bytes memory utf8Diacritic113CE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic113CE));
        console2.log("113CE: ", string(utf8Diacritic113CE));
        console2.logBytes(utf8Diacritic113CE);

        string memory diacritic113CF = "\\u{113CF}";
        bytes memory utf8Diacritic113CF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic113CF));
        console2.log("113CF: ", string(utf8Diacritic113CF));
        console2.logBytes(utf8Diacritic113CF);

        string memory diacritic113D0 = "\\u{113D0}";
        bytes memory utf8Diacritic113D0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic113D0));
        console2.log("113D0: ", string(utf8Diacritic113D0));
        console2.logBytes(utf8Diacritic113D0);

        string memory diacritic113D2 = "\\u{113D2}";
        bytes memory utf8Diacritic113D2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic113D2));
        console2.log("113D2: ", string(utf8Diacritic113D2));
        console2.logBytes(utf8Diacritic113D2);

        string memory diacritic113D3 = "\\u{113D3}";
        bytes memory utf8Diacritic113D3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic113D3));
        console2.log("113D3: ", string(utf8Diacritic113D3));
        console2.logBytes(utf8Diacritic113D3);

        string memory diacritic113E1 = "\\u{113E1}";
        bytes memory utf8Diacritic113E1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic113E1));
        console2.log("113E1: ", string(utf8Diacritic113E1));
        console2.logBytes(utf8Diacritic113E1);

        console2.log("..");

        string memory diacritic113E2 = "\\u{113E2}";
        bytes memory utf8Diacritic113E2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic113E2));
        console2.log("113E2: ", string(utf8Diacritic113E2));
        console2.logBytes(utf8Diacritic113E2);

        string memory diacritic11442 = "\\u{11442}";
        bytes memory utf8Diacritic11442 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11442));
        console2.log("11442: ", string(utf8Diacritic11442));
        console2.logBytes(utf8Diacritic11442);

        string memory diacritic11446 = "\\u{11446}";
        bytes memory utf8Diacritic11446 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11446));
        console2.log("11446: ", string(utf8Diacritic11446));
        console2.logBytes(utf8Diacritic11446);

        string memory diacritic114C2 = "\\u{114C2}";
        bytes memory utf8Diacritic114C2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic114C2));
        console2.log("114C2: ", string(utf8Diacritic114C2));
        console2.logBytes(utf8Diacritic114C2);

        console2.log("..");

        string memory diacritic114C3 = "\\u{114C3}";
        bytes memory utf8Diacritic114C3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic114C3));
        console2.log("114C3: ", string(utf8Diacritic114C3));
        console2.logBytes(utf8Diacritic114C3);

        string memory diacritic115BF = "\\u{115BF}";
        bytes memory utf8Diacritic115BF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic115BF));
        console2.log("115BF: ", string(utf8Diacritic115BF));
        console2.logBytes(utf8Diacritic115BF);

        console2.log("..");

        string memory diacritic115C0 = "\\u{115C0}";
        bytes memory utf8Diacritic115C0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic115C0));
        console2.log("115C0: ", string(utf8Diacritic115C0));
        console2.logBytes(utf8Diacritic115C0);

        string memory diacritic1163F = "\\u{1163F}";
        bytes memory utf8Diacritic1163F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1163F));
        console2.log("1163F: ", string(utf8Diacritic1163F));
        console2.logBytes(utf8Diacritic1163F);

        string memory diacritic116B6 = "\\u{116B6}";
        bytes memory utf8Diacritic116B6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic116B6));
        console2.log("116B6: ", string(utf8Diacritic116B6));
        console2.logBytes(utf8Diacritic116B6);

        string memory diacritic116B7 = "\\u{116B7}";
        bytes memory utf8Diacritic116B7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic116B7));
        console2.log("116B7: ", string(utf8Diacritic116B7));
        console2.logBytes(utf8Diacritic116B7);

        string memory diacritic1172B = "\\u{1172B}";
        bytes memory utf8Diacritic1172B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1172B));
        console2.log("1172B: ", string(utf8Diacritic1172B));
        console2.logBytes(utf8Diacritic1172B);

        string memory diacritic11839 = "\\u{11839}";
        bytes memory utf8Diacritic11839 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11839));
        console2.log("11839: ", string(utf8Diacritic11839));
        console2.logBytes(utf8Diacritic11839);

        console2.log("..");

        string memory diacritic1183A = "\\u{1183A}";
        bytes memory utf8Diacritic1183A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1183A));
        console2.log("1183A: ", string(utf8Diacritic1183A));
        console2.logBytes(utf8Diacritic1183A);

        string memory diacritic1193D = "\\u{1193D}";
        bytes memory utf8Diacritic1193D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1193D));
        console2.log("1193D: ", string(utf8Diacritic1193D));
        console2.logBytes(utf8Diacritic1193D);

        string memory diacritic1193E = "\\u{1193E}";
        bytes memory utf8Diacritic1193E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1193E));
        console2.log("1193E: ", string(utf8Diacritic1193E));
        console2.logBytes(utf8Diacritic1193E);

        string memory diacritic11943 = "\\u{11943}";
        bytes memory utf8Diacritic11943 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11943));
        console2.log("11943: ", string(utf8Diacritic11943));
        console2.logBytes(utf8Diacritic11943);

        string memory diacritic119E0 = "\\u{119E0}";
        bytes memory utf8Diacritic119E0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic119E0));
        console2.log("119E0: ", string(utf8Diacritic119E0));
        console2.logBytes(utf8Diacritic119E0);

        string memory diacritic11A34 = "\\u{11A34}";
        bytes memory utf8Diacritic11A34 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11A34));
        console2.log("11A34: ", string(utf8Diacritic11A34));
        console2.logBytes(utf8Diacritic11A34);

        string memory diacritic11A47 = "\\u{11A47}";
        bytes memory utf8Diacritic11A47 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11A47));
        console2.log("11A47: ", string(utf8Diacritic11A47));
        console2.logBytes(utf8Diacritic11A47);

        string memory diacritic11A99 = "\\u{11A99}";
        bytes memory utf8Diacritic11A99 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11A99));
        console2.log("11A99: ", string(utf8Diacritic11A99));
        console2.logBytes(utf8Diacritic11A99);

        string memory diacritic11C3F = "\\u{11C3F}";
        bytes memory utf8Diacritic11C3F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11C3F));
        console2.log("11C3F: ", string(utf8Diacritic11C3F));
        console2.logBytes(utf8Diacritic11C3F);

        string memory diacritic11D42 = "\\u{11D42}";
        bytes memory utf8Diacritic11D42 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11D42));
        console2.log("11D42: ", string(utf8Diacritic11D42));
        console2.logBytes(utf8Diacritic11D42);

        string memory diacritic11D44 = "\\u{11D44}";
        bytes memory utf8Diacritic11D44 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11D44));
        console2.log("11D44: ", string(utf8Diacritic11D44));
        console2.logBytes(utf8Diacritic11D44);

        console2.log("..");

        string memory diacritic11D45 = "\\u{11D45}";
        bytes memory utf8Diacritic11D45 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11D45));
        console2.log("11D45: ", string(utf8Diacritic11D45));
        console2.logBytes(utf8Diacritic11D45);

        string memory diacritic11D97 = "\\u{11D97}";
        bytes memory utf8Diacritic11D97 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11D97));
        console2.log("11D97: ", string(utf8Diacritic11D97));
        console2.logBytes(utf8Diacritic11D97);

        string memory diacritic11DD9 = "\\u{11DD9}";
        bytes memory utf8Diacritic11DD9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11DD9));
        console2.log("11DD9: ", string(utf8Diacritic11DD9));
        console2.logBytes(utf8Diacritic11DD9);

        string memory diacritic11F41 = "\\u{11F41}";
        bytes memory utf8Diacritic11F41 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11F41));
        console2.log("11F41: ", string(utf8Diacritic11F41));
        console2.logBytes(utf8Diacritic11F41);

        string memory diacritic11F42 = "\\u{11F42}";
        bytes memory utf8Diacritic11F42 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11F42));
        console2.log("11F42: ", string(utf8Diacritic11F42));
        console2.logBytes(utf8Diacritic11F42);

        string memory diacritic11F5A = "\\u{11F5A}";
        bytes memory utf8Diacritic11F5A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic11F5A));
        console2.log("11F5A: ", string(utf8Diacritic11F5A));
        console2.logBytes(utf8Diacritic11F5A);

        string memory diacritic13447 = "\\u{13447}";
        bytes memory utf8Diacritic13447 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic13447));
        console2.log("13447: ", string(utf8Diacritic13447));
        console2.logBytes(utf8Diacritic13447);

        console2.log("..");

        string memory diacritic13455 = "\\u{13455}";
        bytes memory utf8Diacritic13455 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic13455));
        console2.log("13455: ", string(utf8Diacritic13455));
        console2.logBytes(utf8Diacritic13455);

        string memory diacritic1612F = "\\u{1612F}";
        bytes memory utf8Diacritic1612F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1612F));
        console2.log("1612F: ", string(utf8Diacritic1612F));
        console2.logBytes(utf8Diacritic1612F);

        string memory diacritic16AF0 = "\\u{16AF0}";
        bytes memory utf8Diacritic16AF0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic16AF0));
        console2.log("16AF0: ", string(utf8Diacritic16AF0));
        console2.logBytes(utf8Diacritic16AF0);

        console2.log("..");

        string memory diacritic16AF4 = "\\u{16AF4}";
        bytes memory utf8Diacritic16AF4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic16AF4));
        console2.log("16AF4: ", string(utf8Diacritic16AF4));
        console2.logBytes(utf8Diacritic16AF4);

        string memory diacritic16B30 = "\\u{16B30}";
        bytes memory utf8Diacritic16B30 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic16B30));
        console2.log("16B30: ", string(utf8Diacritic16B30));
        console2.logBytes(utf8Diacritic16B30);

        console2.log("..");

        string memory diacritic16B36 = "\\u{16B36}";
        bytes memory utf8Diacritic16B36 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic16B36));
        console2.log("16B36: ", string(utf8Diacritic16B36));
        console2.logBytes(utf8Diacritic16B36);

        string memory diacritic16D6B = "\\u{16D6B}";
        bytes memory utf8Diacritic16D6B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic16D6B));
        console2.log("16D6B: ", string(utf8Diacritic16D6B));
        console2.logBytes(utf8Diacritic16D6B);

        console2.log("..");

        string memory diacritic16D6C = "\\u{16D6C}";
        bytes memory utf8Diacritic16D6C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic16D6C));
        console2.log("16D6C: ", string(utf8Diacritic16D6C));
        console2.logBytes(utf8Diacritic16D6C);

        string memory diacritic16F8F = "\\u{16F8F}";
        bytes memory utf8Diacritic16F8F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic16F8F));
        console2.log("16F8F: ", string(utf8Diacritic16F8F));
        console2.logBytes(utf8Diacritic16F8F);

        console2.log("..");

        string memory diacritic16F92 = "\\u{16F92}";
        bytes memory utf8Diacritic16F92 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic16F92));
        console2.log("16F92: ", string(utf8Diacritic16F92));
        console2.logBytes(utf8Diacritic16F92);

        string memory diacritic16F93 = "\\u{16F93}";
        bytes memory utf8Diacritic16F93 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic16F93));
        console2.log("16F93: ", string(utf8Diacritic16F93));
        console2.logBytes(utf8Diacritic16F93);

        console2.log("..");

        string memory diacritic16F9F = "\\u{16F9F}";
        bytes memory utf8Diacritic16F9F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic16F9F));
        console2.log("16F9F: ", string(utf8Diacritic16F9F));
        console2.logBytes(utf8Diacritic16F9F);

        string memory diacritic16FF0 = "\\u{16FF0}";
        bytes memory utf8Diacritic16FF0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic16FF0));
        console2.log("16FF0: ", string(utf8Diacritic16FF0));
        console2.logBytes(utf8Diacritic16FF0);

        console2.log("..");

        string memory diacritic16FF1 = "\\u{16FF1}";
        bytes memory utf8Diacritic16FF1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic16FF1));
        console2.log("16FF1: ", string(utf8Diacritic16FF1));
        console2.logBytes(utf8Diacritic16FF1);

        string memory diacritic1AFF0 = "\\u{1AFF0}";
        bytes memory utf8Diacritic1AFF0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1AFF0));
        console2.log("1AFF0: ", string(utf8Diacritic1AFF0));
        console2.logBytes(utf8Diacritic1AFF0);

        console2.log("..");

        string memory diacritic1AFF3 = "\\u{1AFF3}";
        bytes memory utf8Diacritic1AFF3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1AFF3));
        console2.log("1AFF3: ", string(utf8Diacritic1AFF3));
        console2.logBytes(utf8Diacritic1AFF3);

        string memory diacritic1AFF5 = "\\u{1AFF5}";
        bytes memory utf8Diacritic1AFF5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1AFF5));
        console2.log("1AFF5: ", string(utf8Diacritic1AFF5));
        console2.logBytes(utf8Diacritic1AFF5);

        console2.log("..");

        string memory diacritic1AFFB = "\\u{1AFFB}";
        bytes memory utf8Diacritic1AFFB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1AFFB));
        console2.log("1AFFB: ", string(utf8Diacritic1AFFB));
        console2.logBytes(utf8Diacritic1AFFB);

        string memory diacritic1AFFD = "\\u{1AFFD}";
        bytes memory utf8Diacritic1AFFD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1AFFD));
        console2.log("1AFFD: ", string(utf8Diacritic1AFFD));
        console2.logBytes(utf8Diacritic1AFFD);

        console2.log("..");

        string memory diacritic1AFFE = "\\u{1AFFE}";
        bytes memory utf8Diacritic1AFFE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1AFFE));
        console2.log("1AFFE: ", string(utf8Diacritic1AFFE));
        console2.logBytes(utf8Diacritic1AFFE);

        string memory diacritic1CF00 = "\\u{1CF00}";
        bytes memory utf8Diacritic1CF00 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CF00));
        console2.log("1CF00: ", string(utf8Diacritic1CF00));
        console2.logBytes(utf8Diacritic1CF00);

        console2.log("..");

        string memory diacritic1CF2D = "\\u{1CF2D}";
        bytes memory utf8Diacritic1CF2D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CF2D));
        console2.log("1CF2D: ", string(utf8Diacritic1CF2D));
        console2.logBytes(utf8Diacritic1CF2D);

        string memory diacritic1CF30 = "\\u{1CF30}";
        bytes memory utf8Diacritic1CF30 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CF30));
        console2.log("1CF30: ", string(utf8Diacritic1CF30));
        console2.logBytes(utf8Diacritic1CF30);

        console2.log("..");

        string memory diacritic1CF46 = "\\u{1CF46}";
        bytes memory utf8Diacritic1CF46 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1CF46));
        console2.log("1CF46: ", string(utf8Diacritic1CF46));
        console2.logBytes(utf8Diacritic1CF46);

        string memory diacritic1D167 = "\\u{1D167}";
        bytes memory utf8Diacritic1D167 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D167));
        console2.log("1D167: ", string(utf8Diacritic1D167));
        console2.logBytes(utf8Diacritic1D167);

        console2.log("..");

        string memory diacritic1D169 = "\\u{1D169}";
        bytes memory utf8Diacritic1D169 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D169));
        console2.log("1D169: ", string(utf8Diacritic1D169));
        console2.logBytes(utf8Diacritic1D169);

        string memory diacritic1D16D = "\\u{1D16D}";
        bytes memory utf8Diacritic1D16D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D16D));
        console2.log("1D16D: ", string(utf8Diacritic1D16D));
        console2.logBytes(utf8Diacritic1D16D);

        console2.log("..");

        string memory diacritic1D172 = "\\u{1D172}";
        bytes memory utf8Diacritic1D172 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D172));
        console2.log("1D172: ", string(utf8Diacritic1D172));
        console2.logBytes(utf8Diacritic1D172);

        string memory diacritic1D17B = "\\u{1D17B}";
        bytes memory utf8Diacritic1D17B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D17B));
        console2.log("1D17B: ", string(utf8Diacritic1D17B));
        console2.logBytes(utf8Diacritic1D17B);

        console2.log("..");

        string memory diacritic1D182 = "\\u{1D182}";
        bytes memory utf8Diacritic1D182 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D182));
        console2.log("1D182: ", string(utf8Diacritic1D182));
        console2.logBytes(utf8Diacritic1D182);

        string memory diacritic1D185 = "\\u{1D185}";
        bytes memory utf8Diacritic1D185 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D185));
        console2.log("1D185: ", string(utf8Diacritic1D185));
        console2.logBytes(utf8Diacritic1D185);

        console2.log("..");

        string memory diacritic1D18B = "\\u{1D18B}";
        bytes memory utf8Diacritic1D18B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D18B));
        console2.log("1D18B: ", string(utf8Diacritic1D18B));
        console2.logBytes(utf8Diacritic1D18B);

        string memory diacritic1D1AA = "\\u{1D1AA}";
        bytes memory utf8Diacritic1D1AA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D1AA));
        console2.log("1D1AA: ", string(utf8Diacritic1D1AA));
        console2.logBytes(utf8Diacritic1D1AA);

        console2.log("..");

        string memory diacritic1D1AD = "\\u{1D1AD}";
        bytes memory utf8Diacritic1D1AD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1D1AD));
        console2.log("1D1AD: ", string(utf8Diacritic1D1AD));
        console2.logBytes(utf8Diacritic1D1AD);

        string memory diacritic1E030 = "\\u{1E030}";
        bytes memory utf8Diacritic1E030 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E030));
        console2.log("1E030: ", string(utf8Diacritic1E030));
        console2.logBytes(utf8Diacritic1E030);

        console2.log("..");

        string memory diacritic1E06D = "\\u{1E06D}";
        bytes memory utf8Diacritic1E06D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E06D));
        console2.log("1E06D: ", string(utf8Diacritic1E06D));
        console2.logBytes(utf8Diacritic1E06D);

        string memory diacritic1E130 = "\\u{1E130}";
        bytes memory utf8Diacritic1E130 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E130));
        console2.log("1E130: ", string(utf8Diacritic1E130));
        console2.logBytes(utf8Diacritic1E130);

        console2.log("..");

        string memory diacritic1E136 = "\\u{1E136}";
        bytes memory utf8Diacritic1E136 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E136));
        console2.log("1E136: ", string(utf8Diacritic1E136));
        console2.logBytes(utf8Diacritic1E136);

        string memory diacritic1E2AE = "\\u{1E2AE}";
        bytes memory utf8Diacritic1E2AE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E2AE));
        console2.log("1E2AE: ", string(utf8Diacritic1E2AE));
        console2.logBytes(utf8Diacritic1E2AE);

        string memory diacritic1E2EC = "\\u{1E2EC}";
        bytes memory utf8Diacritic1E2EC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E2EC));
        console2.log("1E2EC: ", string(utf8Diacritic1E2EC));
        console2.logBytes(utf8Diacritic1E2EC);

        console2.log("..");

        string memory diacritic1E2EF = "\\u{1E2EF}";
        bytes memory utf8Diacritic1E2EF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E2EF));
        console2.log("1E2EF: ", string(utf8Diacritic1E2EF));
        console2.logBytes(utf8Diacritic1E2EF);

        string memory diacritic1E5EE = "\\u{1E5EE}";
        bytes memory utf8Diacritic1E5EE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E5EE));
        console2.log("1E5EE: ", string(utf8Diacritic1E5EE));
        console2.logBytes(utf8Diacritic1E5EE);

        console2.log("..");

        string memory diacritic1E5EF = "\\u{1E5EF}";
        bytes memory utf8Diacritic1E5EF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E5EF));
        console2.log("1E5EF: ", string(utf8Diacritic1E5EF));
        console2.logBytes(utf8Diacritic1E5EF);

        string memory diacritic1E8D0 = "\\u{1E8D0}";
        bytes memory utf8Diacritic1E8D0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E8D0));
        console2.log("1E8D0: ", string(utf8Diacritic1E8D0));
        console2.logBytes(utf8Diacritic1E8D0);

        console2.log("..");

        string memory diacritic1E8D6 = "\\u{1E8D6}";
        bytes memory utf8Diacritic1E8D6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E8D6));
        console2.log("1E8D6: ", string(utf8Diacritic1E8D6));
        console2.logBytes(utf8Diacritic1E8D6);

        string memory diacritic1E944 = "\\u{1E944}";
        bytes memory utf8Diacritic1E944 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E944));
        console2.log("1E944: ", string(utf8Diacritic1E944));
        console2.logBytes(utf8Diacritic1E944);

        console2.log("..");

        string memory diacritic1E946 = "\\u{1E946}";
        bytes memory utf8Diacritic1E946 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E946));
        console2.log("1E946: ", string(utf8Diacritic1E946));
        console2.logBytes(utf8Diacritic1E946);

        string memory diacritic1E948 = "\\u{1E948}";
        bytes memory utf8Diacritic1E948 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E948));
        console2.log("1E948: ", string(utf8Diacritic1E948));
        console2.logBytes(utf8Diacritic1E948);

        console2.log("..");

        string memory diacritic1E94A = "\\u{1E94A}";
        bytes memory utf8Diacritic1E94A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(diacritic1E94A));
        console2.log("1E94A: ", string(utf8Diacritic1E94A));
        console2.logBytes(utf8Diacritic1E94A);
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
