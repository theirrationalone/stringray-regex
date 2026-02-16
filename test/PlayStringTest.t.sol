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

    function testRegexPropertyPatternSyntax() public pure {
        string memory patternSyntax0021 = "\\u{0021}";
        bytes memory utf8PatternSyntax0021 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax0021));
        console2.log("0021: ", string(utf8PatternSyntax0021));
        console2.logBytes(utf8PatternSyntax0021);

        console2.log("..");

        string memory patternSyntax0023 = "\\u{0023}";
        bytes memory utf8PatternSyntax0023 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax0023));
        console2.log("0023: ", string(utf8PatternSyntax0023));
        console2.logBytes(utf8PatternSyntax0023);

        string memory patternSyntax0024 = "\\u{0024}";
        bytes memory utf8PatternSyntax0024 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax0024));
        console2.log("0024: ", string(utf8PatternSyntax0024));
        console2.logBytes(utf8PatternSyntax0024);

        string memory patternSyntax0025 = "\\u{0025}";
        bytes memory utf8PatternSyntax0025 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax0025));
        console2.log("0025: ", string(utf8PatternSyntax0025));
        console2.logBytes(utf8PatternSyntax0025);

        console2.log("..");

        string memory patternSyntax0027 = "\\u{0027}";
        bytes memory utf8PatternSyntax0027 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax0027));
        console2.log("0027: ", string(utf8PatternSyntax0027));
        console2.logBytes(utf8PatternSyntax0027);

        string memory patternSyntax0028 = "\\u{0028}";
        bytes memory utf8PatternSyntax0028 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax0028));
        console2.log("0028: ", string(utf8PatternSyntax0028));
        console2.logBytes(utf8PatternSyntax0028);

        string memory patternSyntax0029 = "\\u{0029}";
        bytes memory utf8PatternSyntax0029 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax0029));
        console2.log("0029: ", string(utf8PatternSyntax0029));
        console2.logBytes(utf8PatternSyntax0029);

        string memory patternSyntax002A = "\\u{002A}";
        bytes memory utf8PatternSyntax002A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax002A));
        console2.log("002A: ", string(utf8PatternSyntax002A));
        console2.logBytes(utf8PatternSyntax002A);

        string memory patternSyntax002B = "\\u{002B}";
        bytes memory utf8PatternSyntax002B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax002B));
        console2.log("002B: ", string(utf8PatternSyntax002B));
        console2.logBytes(utf8PatternSyntax002B);

        string memory patternSyntax002C = "\\u{002C}";
        bytes memory utf8PatternSyntax002C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax002C));
        console2.log("002C: ", string(utf8PatternSyntax002C));
        console2.logBytes(utf8PatternSyntax002C);

        string memory patternSyntax002D = "\\u{002D}";
        bytes memory utf8PatternSyntax002D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax002D));
        console2.log("002D: ", string(utf8PatternSyntax002D));
        console2.logBytes(utf8PatternSyntax002D);

        string memory patternSyntax002E = "\\u{002E}";
        bytes memory utf8PatternSyntax002E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax002E));
        console2.log("002E: ", string(utf8PatternSyntax002E));
        console2.logBytes(utf8PatternSyntax002E);

        console2.log("..");

        string memory patternSyntax002F = "\\u{002F}";
        bytes memory utf8PatternSyntax002F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax002F));
        console2.log("002F: ", string(utf8PatternSyntax002F));
        console2.logBytes(utf8PatternSyntax002F);

        string memory patternSyntax003A = "\\u{003A}";
        bytes memory utf8PatternSyntax003A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax003A));
        console2.log("003A: ", string(utf8PatternSyntax003A));
        console2.logBytes(utf8PatternSyntax003A);

        console2.log("..");

        string memory patternSyntax003B = "\\u{003B}";
        bytes memory utf8PatternSyntax003B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax003B));
        console2.log("003B: ", string(utf8PatternSyntax003B));
        console2.logBytes(utf8PatternSyntax003B);

        string memory patternSyntax003C = "\\u{003C}";
        bytes memory utf8PatternSyntax003C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax003C));
        console2.log("003C: ", string(utf8PatternSyntax003C));
        console2.logBytes(utf8PatternSyntax003C);

        console2.log("..");

        string memory patternSyntax003E = "\\u{003E}";
        bytes memory utf8PatternSyntax003E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax003E));
        console2.log("003E: ", string(utf8PatternSyntax003E));
        console2.logBytes(utf8PatternSyntax003E);

        string memory patternSyntax003F = "\\u{003F}";
        bytes memory utf8PatternSyntax003F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax003F));
        console2.log("003F: ", string(utf8PatternSyntax003F));
        console2.logBytes(utf8PatternSyntax003F);

        console2.log("..");

        string memory patternSyntax0040 = "\\u{0040}";
        bytes memory utf8PatternSyntax0040 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax0040));
        console2.log("0040: ", string(utf8PatternSyntax0040));
        console2.logBytes(utf8PatternSyntax0040);

        string memory patternSyntax005B = "\\u{005B}";
        bytes memory utf8PatternSyntax005B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax005B));
        console2.log("005B: ", string(utf8PatternSyntax005B));
        console2.logBytes(utf8PatternSyntax005B);

        string memory patternSyntax005C = "\\u{005C}";
        bytes memory utf8PatternSyntax005C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax005C));
        console2.log("005C: ", string(utf8PatternSyntax005C));
        console2.logBytes(utf8PatternSyntax005C);

        string memory patternSyntax005D = "\\u{005D}";
        bytes memory utf8PatternSyntax005D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax005D));
        console2.log("005D: ", string(utf8PatternSyntax005D));
        console2.logBytes(utf8PatternSyntax005D);

        string memory patternSyntax005E = "\\u{005E}";
        bytes memory utf8PatternSyntax005E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax005E));
        console2.log("005E: ", string(utf8PatternSyntax005E));
        console2.logBytes(utf8PatternSyntax005E);

        string memory patternSyntax0060 = "\\u{0060}";
        bytes memory utf8PatternSyntax0060 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax0060));
        console2.log("0060: ", string(utf8PatternSyntax0060));
        console2.logBytes(utf8PatternSyntax0060);

        string memory patternSyntax007B = "\\u{007B}";
        bytes memory utf8PatternSyntax007B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax007B));
        console2.log("007B: ", string(utf8PatternSyntax007B));
        console2.logBytes(utf8PatternSyntax007B);

        string memory patternSyntax007C = "\\u{007C}";
        bytes memory utf8PatternSyntax007C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax007C));
        console2.log("007C: ", string(utf8PatternSyntax007C));
        console2.logBytes(utf8PatternSyntax007C);

        string memory patternSyntax007D = "\\u{007D}";
        bytes memory utf8PatternSyntax007D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax007D));
        console2.log("007D: ", string(utf8PatternSyntax007D));
        console2.logBytes(utf8PatternSyntax007D);

        string memory patternSyntax007E = "\\u{007E}";
        bytes memory utf8PatternSyntax007E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax007E));
        console2.log("007E: ", string(utf8PatternSyntax007E));
        console2.logBytes(utf8PatternSyntax007E);

        string memory patternSyntax00A1 = "\\u{00A1}";
        bytes memory utf8PatternSyntax00A1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00A1));
        console2.log("00A1: ", string(utf8PatternSyntax00A1));
        console2.logBytes(utf8PatternSyntax00A1);

        string memory patternSyntax00A2 = "\\u{00A2}";
        bytes memory utf8PatternSyntax00A2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00A2));
        console2.log("00A2: ", string(utf8PatternSyntax00A2));
        console2.logBytes(utf8PatternSyntax00A2);

        console2.log("..");

        string memory patternSyntax00A5 = "\\u{00A5}";
        bytes memory utf8PatternSyntax00A5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00A5));
        console2.log("00A5: ", string(utf8PatternSyntax00A5));
        console2.logBytes(utf8PatternSyntax00A5);

        string memory patternSyntax00A6 = "\\u{00A6}";
        bytes memory utf8PatternSyntax00A6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00A6));
        console2.log("00A6: ", string(utf8PatternSyntax00A6));
        console2.logBytes(utf8PatternSyntax00A6);

        string memory patternSyntax00A7 = "\\u{00A7}";
        bytes memory utf8PatternSyntax00A7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00A7));
        console2.log("00A7: ", string(utf8PatternSyntax00A7));
        console2.logBytes(utf8PatternSyntax00A7);

        string memory patternSyntax00A9 = "\\u{00A9}";
        bytes memory utf8PatternSyntax00A9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00A9));
        console2.log("00A9: ", string(utf8PatternSyntax00A9));
        console2.logBytes(utf8PatternSyntax00A9);

        string memory patternSyntax00AB = "\\u{00AB}";
        bytes memory utf8PatternSyntax00AB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00AB));
        console2.log("00AB: ", string(utf8PatternSyntax00AB));
        console2.logBytes(utf8PatternSyntax00AB);

        string memory patternSyntax00AC = "\\u{00AC}";
        bytes memory utf8PatternSyntax00AC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00AC));
        console2.log("00AC: ", string(utf8PatternSyntax00AC));
        console2.logBytes(utf8PatternSyntax00AC);

        string memory patternSyntax00AE = "\\u{00AE}";
        bytes memory utf8PatternSyntax00AE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00AE));
        console2.log("00AE: ", string(utf8PatternSyntax00AE));
        console2.logBytes(utf8PatternSyntax00AE);

        string memory patternSyntax00B0 = "\\u{00B0}";
        bytes memory utf8PatternSyntax00B0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00B0));
        console2.log("00B0: ", string(utf8PatternSyntax00B0));
        console2.logBytes(utf8PatternSyntax00B0);

        string memory patternSyntax00B1 = "\\u{00B1}";
        bytes memory utf8PatternSyntax00B1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00B1));
        console2.log("00B1: ", string(utf8PatternSyntax00B1));
        console2.logBytes(utf8PatternSyntax00B1);

        string memory patternSyntax00B6 = "\\u{00B6}";
        bytes memory utf8PatternSyntax00B6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00B6));
        console2.log("00B6: ", string(utf8PatternSyntax00B6));
        console2.logBytes(utf8PatternSyntax00B6);

        string memory patternSyntax00BB = "\\u{00BB}";
        bytes memory utf8PatternSyntax00BB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00BB));
        console2.log("00BB: ", string(utf8PatternSyntax00BB));
        console2.logBytes(utf8PatternSyntax00BB);

        string memory patternSyntax00BF = "\\u{00BF}";
        bytes memory utf8PatternSyntax00BF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00BF));
        console2.log("00BF: ", string(utf8PatternSyntax00BF));
        console2.logBytes(utf8PatternSyntax00BF);

        string memory patternSyntax00D7 = "\\u{00D7}";
        bytes memory utf8PatternSyntax00D7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00D7));
        console2.log("00D7: ", string(utf8PatternSyntax00D7));
        console2.logBytes(utf8PatternSyntax00D7);

        string memory patternSyntax00F7 = "\\u{00F7}";
        bytes memory utf8PatternSyntax00F7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax00F7));
        console2.log("00F7: ", string(utf8PatternSyntax00F7));
        console2.logBytes(utf8PatternSyntax00F7);

        string memory patternSyntax2010 = "\\u{2010}";
        bytes memory utf8PatternSyntax2010 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2010));
        console2.log("2010: ", string(utf8PatternSyntax2010));
        console2.logBytes(utf8PatternSyntax2010);

        console2.log("..");

        string memory patternSyntax2015 = "\\u{2015}";
        bytes memory utf8PatternSyntax2015 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2015));
        console2.log("2015: ", string(utf8PatternSyntax2015));
        console2.logBytes(utf8PatternSyntax2015);

        string memory patternSyntax2016 = "\\u{2016}";
        bytes memory utf8PatternSyntax2016 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2016));
        console2.log("2016: ", string(utf8PatternSyntax2016));
        console2.logBytes(utf8PatternSyntax2016);

        console2.log("..");

        string memory patternSyntax2017 = "\\u{2017}";
        bytes memory utf8PatternSyntax2017 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2017));
        console2.log("2017: ", string(utf8PatternSyntax2017));
        console2.logBytes(utf8PatternSyntax2017);

        string memory patternSyntax2018 = "\\u{2018}";
        bytes memory utf8PatternSyntax2018 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2018));
        console2.log("2018: ", string(utf8PatternSyntax2018));
        console2.logBytes(utf8PatternSyntax2018);

        string memory patternSyntax2019 = "\\u{2019}";
        bytes memory utf8PatternSyntax2019 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2019));
        console2.log("2019: ", string(utf8PatternSyntax2019));
        console2.logBytes(utf8PatternSyntax2019);

        string memory patternSyntax201A = "\\u{201A}";
        bytes memory utf8PatternSyntax201A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax201A));
        console2.log("201A: ", string(utf8PatternSyntax201A));
        console2.logBytes(utf8PatternSyntax201A);

        string memory patternSyntax201B = "\\u{201B}";
        bytes memory utf8PatternSyntax201B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax201B));
        console2.log("201B: ", string(utf8PatternSyntax201B));
        console2.logBytes(utf8PatternSyntax201B);

        console2.log("..");

        string memory patternSyntax201C = "\\u{201C}";
        bytes memory utf8PatternSyntax201C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax201C));
        console2.log("201C: ", string(utf8PatternSyntax201C));
        console2.logBytes(utf8PatternSyntax201C);

        string memory patternSyntax201D = "\\u{201D}";
        bytes memory utf8PatternSyntax201D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax201D));
        console2.log("201D: ", string(utf8PatternSyntax201D));
        console2.logBytes(utf8PatternSyntax201D);

        string memory patternSyntax201E = "\\u{201E}";
        bytes memory utf8PatternSyntax201E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax201E));
        console2.log("201E: ", string(utf8PatternSyntax201E));
        console2.logBytes(utf8PatternSyntax201E);

        string memory patternSyntax201F = "\\u{201F}";
        bytes memory utf8PatternSyntax201F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax201F));
        console2.log("201F: ", string(utf8PatternSyntax201F));
        console2.logBytes(utf8PatternSyntax201F);

        string memory patternSyntax2020 = "\\u{2020}";
        bytes memory utf8PatternSyntax2020 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2020));
        console2.log("2020: ", string(utf8PatternSyntax2020));
        console2.logBytes(utf8PatternSyntax2020);

        console2.log("..");

        string memory patternSyntax2027 = "\\u{2027}";
        bytes memory utf8PatternSyntax2027 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2027));
        console2.log("2027: ", string(utf8PatternSyntax2027));
        console2.logBytes(utf8PatternSyntax2027);

        string memory patternSyntax2030 = "\\u{2030}";
        bytes memory utf8PatternSyntax2030 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2030));
        console2.log("2030: ", string(utf8PatternSyntax2030));
        console2.logBytes(utf8PatternSyntax2030);

        console2.log("..");

        string memory patternSyntax2038 = "\\u{2038}";
        bytes memory utf8PatternSyntax2038 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2038));
        console2.log("2038: ", string(utf8PatternSyntax2038));
        console2.logBytes(utf8PatternSyntax2038);

        string memory patternSyntax2039 = "\\u{2039}";
        bytes memory utf8PatternSyntax2039 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2039));
        console2.log("2039: ", string(utf8PatternSyntax2039));
        console2.logBytes(utf8PatternSyntax2039);

        string memory patternSyntax203A = "\\u{203A}";
        bytes memory utf8PatternSyntax203A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax203A));
        console2.log("203A: ", string(utf8PatternSyntax203A));
        console2.logBytes(utf8PatternSyntax203A);

        string memory patternSyntax203B = "\\u{203B}";
        bytes memory utf8PatternSyntax203B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax203B));
        console2.log("203B: ", string(utf8PatternSyntax203B));
        console2.logBytes(utf8PatternSyntax203B);

        console2.log("..");

        string memory patternSyntax203E = "\\u{203E}";
        bytes memory utf8PatternSyntax203E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax203E));
        console2.log("203E: ", string(utf8PatternSyntax203E));
        console2.logBytes(utf8PatternSyntax203E);

        string memory patternSyntax2041 = "\\u{2041}";
        bytes memory utf8PatternSyntax2041 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2041));
        console2.log("2041: ", string(utf8PatternSyntax2041));
        console2.logBytes(utf8PatternSyntax2041);

        console2.log("..");

        string memory patternSyntax2043 = "\\u{2043}";
        bytes memory utf8PatternSyntax2043 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2043));
        console2.log("2043: ", string(utf8PatternSyntax2043));
        console2.logBytes(utf8PatternSyntax2043);

        string memory patternSyntax2044 = "\\u{2044}";
        bytes memory utf8PatternSyntax2044 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2044));
        console2.log("2044: ", string(utf8PatternSyntax2044));
        console2.logBytes(utf8PatternSyntax2044);

        string memory patternSyntax2045 = "\\u{2045}";
        bytes memory utf8PatternSyntax2045 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2045));
        console2.log("2045: ", string(utf8PatternSyntax2045));
        console2.logBytes(utf8PatternSyntax2045);

        string memory patternSyntax2046 = "\\u{2046}";
        bytes memory utf8PatternSyntax2046 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2046));
        console2.log("2046: ", string(utf8PatternSyntax2046));
        console2.logBytes(utf8PatternSyntax2046);

        string memory patternSyntax2047 = "\\u{2047}";
        bytes memory utf8PatternSyntax2047 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2047));
        console2.log("2047: ", string(utf8PatternSyntax2047));
        console2.logBytes(utf8PatternSyntax2047);

        console2.log("..");

        string memory patternSyntax2051 = "\\u{2051}";
        bytes memory utf8PatternSyntax2051 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2051));
        console2.log("2051: ", string(utf8PatternSyntax2051));
        console2.logBytes(utf8PatternSyntax2051);

        string memory patternSyntax2052 = "\\u{2052}";
        bytes memory utf8PatternSyntax2052 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2052));
        console2.log("2052: ", string(utf8PatternSyntax2052));
        console2.logBytes(utf8PatternSyntax2052);

        string memory patternSyntax2053 = "\\u{2053}";
        bytes memory utf8PatternSyntax2053 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2053));
        console2.log("2053: ", string(utf8PatternSyntax2053));
        console2.logBytes(utf8PatternSyntax2053);

        string memory patternSyntax2055 = "\\u{2055}";
        bytes memory utf8PatternSyntax2055 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2055));
        console2.log("2055: ", string(utf8PatternSyntax2055));
        console2.logBytes(utf8PatternSyntax2055);

        console2.log("..");

        string memory patternSyntax205E = "\\u{205E}";
        bytes memory utf8PatternSyntax205E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax205E));
        console2.log("205E: ", string(utf8PatternSyntax205E));
        console2.logBytes(utf8PatternSyntax205E);

        string memory patternSyntax2190 = "\\u{2190}";
        bytes memory utf8PatternSyntax2190 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2190));
        console2.log("2190: ", string(utf8PatternSyntax2190));
        console2.logBytes(utf8PatternSyntax2190);

        console2.log("..");

        string memory patternSyntax2194 = "\\u{2194}";
        bytes memory utf8PatternSyntax2194 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2194));
        console2.log("2194: ", string(utf8PatternSyntax2194));
        console2.logBytes(utf8PatternSyntax2194);

        string memory patternSyntax2195 = "\\u{2195}";
        bytes memory utf8PatternSyntax2195 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2195));
        console2.log("2195: ", string(utf8PatternSyntax2195));
        console2.logBytes(utf8PatternSyntax2195);

        console2.log("..");

        string memory patternSyntax2199 = "\\u{2199}";
        bytes memory utf8PatternSyntax2199 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2199));
        console2.log("2199: ", string(utf8PatternSyntax2199));
        console2.logBytes(utf8PatternSyntax2199);

        string memory patternSyntax219A = "\\u{219A}";
        bytes memory utf8PatternSyntax219A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax219A));
        console2.log("219A: ", string(utf8PatternSyntax219A));
        console2.logBytes(utf8PatternSyntax219A);

        console2.log("..");

        string memory patternSyntax219B = "\\u{219B}";
        bytes memory utf8PatternSyntax219B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax219B));
        console2.log("219B: ", string(utf8PatternSyntax219B));
        console2.logBytes(utf8PatternSyntax219B);

        string memory patternSyntax219C = "\\u{219C}";
        bytes memory utf8PatternSyntax219C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax219C));
        console2.log("219C: ", string(utf8PatternSyntax219C));
        console2.logBytes(utf8PatternSyntax219C);

        console2.log("..");

        string memory patternSyntax219F = "\\u{219F}";
        bytes memory utf8PatternSyntax219F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax219F));
        console2.log("219F: ", string(utf8PatternSyntax219F));
        console2.logBytes(utf8PatternSyntax219F);

        string memory patternSyntax21A0 = "\\u{21A0}";
        bytes memory utf8PatternSyntax21A0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21A0));
        console2.log("21A0: ", string(utf8PatternSyntax21A0));
        console2.logBytes(utf8PatternSyntax21A0);

        string memory patternSyntax21A1 = "\\u{21A1}";
        bytes memory utf8PatternSyntax21A1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21A1));
        console2.log("21A1: ", string(utf8PatternSyntax21A1));
        console2.logBytes(utf8PatternSyntax21A1);

        console2.log("..");

        string memory patternSyntax21A2 = "\\u{21A2}";
        bytes memory utf8PatternSyntax21A2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21A2));
        console2.log("21A2: ", string(utf8PatternSyntax21A2));
        console2.logBytes(utf8PatternSyntax21A2);

        string memory patternSyntax21A3 = "\\u{21A3}";
        bytes memory utf8PatternSyntax21A3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21A3));
        console2.log("21A3: ", string(utf8PatternSyntax21A3));
        console2.logBytes(utf8PatternSyntax21A3);

        string memory patternSyntax21A4 = "\\u{21A4}";
        bytes memory utf8PatternSyntax21A4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21A4));
        console2.log("21A4: ", string(utf8PatternSyntax21A4));
        console2.logBytes(utf8PatternSyntax21A4);

        console2.log("..");

        string memory patternSyntax21A5 = "\\u{21A5}";
        bytes memory utf8PatternSyntax21A5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21A5));
        console2.log("21A5: ", string(utf8PatternSyntax21A5));
        console2.logBytes(utf8PatternSyntax21A5);

        string memory patternSyntax21A6 = "\\u{21A6}";
        bytes memory utf8PatternSyntax21A6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21A6));
        console2.log("21A6: ", string(utf8PatternSyntax21A6));
        console2.logBytes(utf8PatternSyntax21A6);

        string memory patternSyntax21A7 = "\\u{21A7}";
        bytes memory utf8PatternSyntax21A7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21A7));
        console2.log("21A7: ", string(utf8PatternSyntax21A7));
        console2.logBytes(utf8PatternSyntax21A7);

        console2.log("..");

        string memory patternSyntax21AD = "\\u{21AD}";
        bytes memory utf8PatternSyntax21AD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21AD));
        console2.log("21AD: ", string(utf8PatternSyntax21AD));
        console2.logBytes(utf8PatternSyntax21AD);

        string memory patternSyntax21AE = "\\u{21AE}";
        bytes memory utf8PatternSyntax21AE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21AE));
        console2.log("21AE: ", string(utf8PatternSyntax21AE));
        console2.logBytes(utf8PatternSyntax21AE);

        string memory patternSyntax21AF = "\\u{21AF}";
        bytes memory utf8PatternSyntax21AF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21AF));
        console2.log("21AF: ", string(utf8PatternSyntax21AF));
        console2.logBytes(utf8PatternSyntax21AF);

        console2.log("..");

        string memory patternSyntax21CD = "\\u{21CD}";
        bytes memory utf8PatternSyntax21CD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21CD));
        console2.log("21CD: ", string(utf8PatternSyntax21CD));
        console2.logBytes(utf8PatternSyntax21CD);

        string memory patternSyntax21CE = "\\u{21CE}";
        bytes memory utf8PatternSyntax21CE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21CE));
        console2.log("21CE: ", string(utf8PatternSyntax21CE));
        console2.logBytes(utf8PatternSyntax21CE);

        console2.log("..");

        string memory patternSyntax21CF = "\\u{21CF}";
        bytes memory utf8PatternSyntax21CF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21CF));
        console2.log("21CF: ", string(utf8PatternSyntax21CF));
        console2.logBytes(utf8PatternSyntax21CF);

        string memory patternSyntax21D0 = "\\u{21D0}";
        bytes memory utf8PatternSyntax21D0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21D0));
        console2.log("21D0: ", string(utf8PatternSyntax21D0));
        console2.logBytes(utf8PatternSyntax21D0);

        console2.log("..");

        string memory patternSyntax21D1 = "\\u{21D1}";
        bytes memory utf8PatternSyntax21D1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21D1));
        console2.log("21D1: ", string(utf8PatternSyntax21D1));
        console2.logBytes(utf8PatternSyntax21D1);

        string memory patternSyntax21D2 = "\\u{21D2}";
        bytes memory utf8PatternSyntax21D2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21D2));
        console2.log("21D2: ", string(utf8PatternSyntax21D2));
        console2.logBytes(utf8PatternSyntax21D2);

        string memory patternSyntax21D3 = "\\u{21D3}";
        bytes memory utf8PatternSyntax21D3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21D3));
        console2.log("21D3: ", string(utf8PatternSyntax21D3));
        console2.logBytes(utf8PatternSyntax21D3);

        string memory patternSyntax21D4 = "\\u{21D4}";
        bytes memory utf8PatternSyntax21D4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21D4));
        console2.log("21D4: ", string(utf8PatternSyntax21D4));
        console2.logBytes(utf8PatternSyntax21D4);

        string memory patternSyntax21D5 = "\\u{21D5}";
        bytes memory utf8PatternSyntax21D5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21D5));
        console2.log("21D5: ", string(utf8PatternSyntax21D5));
        console2.logBytes(utf8PatternSyntax21D5);

        console2.log("..");

        string memory patternSyntax21F3 = "\\u{21F3}";
        bytes memory utf8PatternSyntax21F3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21F3));
        console2.log("21F3: ", string(utf8PatternSyntax21F3));
        console2.logBytes(utf8PatternSyntax21F3);

        string memory patternSyntax21F4 = "\\u{21F4}";
        bytes memory utf8PatternSyntax21F4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax21F4));
        console2.log("21F4: ", string(utf8PatternSyntax21F4));
        console2.logBytes(utf8PatternSyntax21F4);

        console2.log("..");

        string memory patternSyntax22FF = "\\u{22FF}";
        bytes memory utf8PatternSyntax22FF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax22FF));
        console2.log("22FF: ", string(utf8PatternSyntax22FF));
        console2.logBytes(utf8PatternSyntax22FF);

        string memory patternSyntax2300 = "\\u{2300}";
        bytes memory utf8PatternSyntax2300 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2300));
        console2.log("2300: ", string(utf8PatternSyntax2300));
        console2.logBytes(utf8PatternSyntax2300);

        console2.log("..");

        string memory patternSyntax2307 = "\\u{2307}";
        bytes memory utf8PatternSyntax2307 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2307));
        console2.log("2307: ", string(utf8PatternSyntax2307));
        console2.logBytes(utf8PatternSyntax2307);

        string memory patternSyntax2308 = "\\u{2308}";
        bytes memory utf8PatternSyntax2308 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2308));
        console2.log("2308: ", string(utf8PatternSyntax2308));
        console2.logBytes(utf8PatternSyntax2308);

        string memory patternSyntax2309 = "\\u{2309}";
        bytes memory utf8PatternSyntax2309 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2309));
        console2.log("2309: ", string(utf8PatternSyntax2309));
        console2.logBytes(utf8PatternSyntax2309);

        string memory patternSyntax230A = "\\u{230A}";
        bytes memory utf8PatternSyntax230A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax230A));
        console2.log("230A: ", string(utf8PatternSyntax230A));
        console2.logBytes(utf8PatternSyntax230A);

        string memory patternSyntax230B = "\\u{230B}";
        bytes memory utf8PatternSyntax230B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax230B));
        console2.log("230B: ", string(utf8PatternSyntax230B));
        console2.logBytes(utf8PatternSyntax230B);

        string memory patternSyntax230C = "\\u{230C}";
        bytes memory utf8PatternSyntax230C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax230C));
        console2.log("230C: ", string(utf8PatternSyntax230C));
        console2.logBytes(utf8PatternSyntax230C);

        console2.log("..");

        string memory patternSyntax231F = "\\u{231F}";
        bytes memory utf8PatternSyntax231F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax231F));
        console2.log("231F: ", string(utf8PatternSyntax231F));
        console2.logBytes(utf8PatternSyntax231F);

        string memory patternSyntax2320 = "\\u{2320}";
        bytes memory utf8PatternSyntax2320 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2320));
        console2.log("2320: ", string(utf8PatternSyntax2320));
        console2.logBytes(utf8PatternSyntax2320);

        console2.log("..");

        string memory patternSyntax2321 = "\\u{2321}";
        bytes memory utf8PatternSyntax2321 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2321));
        console2.log("2321: ", string(utf8PatternSyntax2321));
        console2.logBytes(utf8PatternSyntax2321);

        string memory patternSyntax2322 = "\\u{2322}";
        bytes memory utf8PatternSyntax2322 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2322));
        console2.log("2322: ", string(utf8PatternSyntax2322));
        console2.logBytes(utf8PatternSyntax2322);

        console2.log("..");

        string memory patternSyntax2328 = "\\u{2328}";
        bytes memory utf8PatternSyntax2328 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2328));
        console2.log("2328: ", string(utf8PatternSyntax2328));
        console2.logBytes(utf8PatternSyntax2328);

        string memory patternSyntax2329 = "\\u{2329}";
        bytes memory utf8PatternSyntax2329 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2329));
        console2.log("2329: ", string(utf8PatternSyntax2329));
        console2.logBytes(utf8PatternSyntax2329);

        string memory patternSyntax232A = "\\u{232A}";
        bytes memory utf8PatternSyntax232A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax232A));
        console2.log("232A: ", string(utf8PatternSyntax232A));
        console2.logBytes(utf8PatternSyntax232A);

        string memory patternSyntax232B = "\\u{232B}";
        bytes memory utf8PatternSyntax232B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax232B));
        console2.log("232B: ", string(utf8PatternSyntax232B));
        console2.logBytes(utf8PatternSyntax232B);

        console2.log("..");

        string memory patternSyntax237B = "\\u{237B}";
        bytes memory utf8PatternSyntax237B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax237B));
        console2.log("237B: ", string(utf8PatternSyntax237B));
        console2.logBytes(utf8PatternSyntax237B);

        string memory patternSyntax237C = "\\u{237C}";
        bytes memory utf8PatternSyntax237C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax237C));
        console2.log("237C: ", string(utf8PatternSyntax237C));
        console2.logBytes(utf8PatternSyntax237C);

        string memory patternSyntax237D = "\\u{237D}";
        bytes memory utf8PatternSyntax237D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax237D));
        console2.log("237D: ", string(utf8PatternSyntax237D));
        console2.logBytes(utf8PatternSyntax237D);

        console2.log("..");

        string memory patternSyntax239A = "\\u{239A}";
        bytes memory utf8PatternSyntax239A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax239A));
        console2.log("239A: ", string(utf8PatternSyntax239A));
        console2.logBytes(utf8PatternSyntax239A);

        string memory patternSyntax239B = "\\u{239B}";
        bytes memory utf8PatternSyntax239B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax239B));
        console2.log("239B: ", string(utf8PatternSyntax239B));
        console2.logBytes(utf8PatternSyntax239B);

        console2.log("..");

        string memory patternSyntax23B3 = "\\u{23B3}";
        bytes memory utf8PatternSyntax23B3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax23B3));
        console2.log("23B3: ", string(utf8PatternSyntax23B3));
        console2.logBytes(utf8PatternSyntax23B3);

        string memory patternSyntax23B4 = "\\u{23B4}";
        bytes memory utf8PatternSyntax23B4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax23B4));
        console2.log("23B4: ", string(utf8PatternSyntax23B4));
        console2.logBytes(utf8PatternSyntax23B4);

        console2.log("..");

        string memory patternSyntax23DB = "\\u{23DB}";
        bytes memory utf8PatternSyntax23DB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax23DB));
        console2.log("23DB: ", string(utf8PatternSyntax23DB));
        console2.logBytes(utf8PatternSyntax23DB);

        string memory patternSyntax23DC = "\\u{23DC}";
        bytes memory utf8PatternSyntax23DC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax23DC));
        console2.log("23DC: ", string(utf8PatternSyntax23DC));
        console2.logBytes(utf8PatternSyntax23DC);

        console2.log("..");

        string memory patternSyntax23E1 = "\\u{23E1}";
        bytes memory utf8PatternSyntax23E1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax23E1));
        console2.log("23E1: ", string(utf8PatternSyntax23E1));
        console2.logBytes(utf8PatternSyntax23E1);

        string memory patternSyntax23E2 = "\\u{23E2}";
        bytes memory utf8PatternSyntax23E2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax23E2));
        console2.log("23E2: ", string(utf8PatternSyntax23E2));
        console2.logBytes(utf8PatternSyntax23E2);

        console2.log("..");

        string memory patternSyntax2429 = "\\u{2429}";
        bytes memory utf8PatternSyntax2429 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2429));
        console2.log("2429: ", string(utf8PatternSyntax2429));
        console2.logBytes(utf8PatternSyntax2429);

        string memory patternSyntax242A = "\\u{242A}";
        bytes memory utf8PatternSyntax242A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax242A));
        console2.log("242A: ", string(utf8PatternSyntax242A));
        console2.logBytes(utf8PatternSyntax242A);

        console2.log("..");

        string memory patternSyntax243F = "\\u{243F}";
        bytes memory utf8PatternSyntax243F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax243F));
        console2.log("243F: ", string(utf8PatternSyntax243F));
        console2.logBytes(utf8PatternSyntax243F);

        string memory patternSyntax2440 = "\\u{2440}";
        bytes memory utf8PatternSyntax2440 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2440));
        console2.log("2440: ", string(utf8PatternSyntax2440));
        console2.logBytes(utf8PatternSyntax2440);

        console2.log("..");

        string memory patternSyntax244A = "\\u{244A}";
        bytes memory utf8PatternSyntax244A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax244A));
        console2.log("244A: ", string(utf8PatternSyntax244A));
        console2.logBytes(utf8PatternSyntax244A);

        string memory patternSyntax244B = "\\u{244B}";
        bytes memory utf8PatternSyntax244B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax244B));
        console2.log("244B: ", string(utf8PatternSyntax244B));
        console2.logBytes(utf8PatternSyntax244B);

        console2.log("..");

        string memory patternSyntax245F = "\\u{245F}";
        bytes memory utf8PatternSyntax245F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax245F));
        console2.log("245F: ", string(utf8PatternSyntax245F));
        console2.logBytes(utf8PatternSyntax245F);

        string memory patternSyntax2500 = "\\u{2500}";
        bytes memory utf8PatternSyntax2500 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2500));
        console2.log("2500: ", string(utf8PatternSyntax2500));
        console2.logBytes(utf8PatternSyntax2500);

        console2.log("..");

        string memory patternSyntax25B6 = "\\u{25B6}";
        bytes memory utf8PatternSyntax25B6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax25B6));
        console2.log("25B6: ", string(utf8PatternSyntax25B6));
        console2.logBytes(utf8PatternSyntax25B6);

        string memory patternSyntax25B7 = "\\u{25B7}";
        bytes memory utf8PatternSyntax25B7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax25B7));
        console2.log("25B7: ", string(utf8PatternSyntax25B7));
        console2.logBytes(utf8PatternSyntax25B7);

        string memory patternSyntax25B8 = "\\u{25B8}";
        bytes memory utf8PatternSyntax25B8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax25B8));
        console2.log("25B8: ", string(utf8PatternSyntax25B8));
        console2.logBytes(utf8PatternSyntax25B8);

        console2.log("..");

        string memory patternSyntax25C0 = "\\u{25C0}";
        bytes memory utf8PatternSyntax25C0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax25C0));
        console2.log("25C0: ", string(utf8PatternSyntax25C0));
        console2.logBytes(utf8PatternSyntax25C0);

        string memory patternSyntax25C1 = "\\u{25C1}";
        bytes memory utf8PatternSyntax25C1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax25C1));
        console2.log("25C1: ", string(utf8PatternSyntax25C1));
        console2.logBytes(utf8PatternSyntax25C1);

        string memory patternSyntax25C2 = "\\u{25C2}";
        bytes memory utf8PatternSyntax25C2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax25C2));
        console2.log("25C2: ", string(utf8PatternSyntax25C2));
        console2.logBytes(utf8PatternSyntax25C2);

        console2.log("..");

        string memory patternSyntax25F7 = "\\u{25F7}";
        bytes memory utf8PatternSyntax25F7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax25F7));
        console2.log("25F7: ", string(utf8PatternSyntax25F7));
        console2.logBytes(utf8PatternSyntax25F7);

        string memory patternSyntax25F8 = "\\u{25F8}";
        bytes memory utf8PatternSyntax25F8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax25F8));
        console2.log("25F8: ", string(utf8PatternSyntax25F8));
        console2.logBytes(utf8PatternSyntax25F8);

        console2.log("..");

        string memory patternSyntax25FF = "\\u{25FF}";
        bytes memory utf8PatternSyntax25FF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax25FF));
        console2.log("25FF: ", string(utf8PatternSyntax25FF));
        console2.logBytes(utf8PatternSyntax25FF);

        string memory patternSyntax2600 = "\\u{2600}";
        bytes memory utf8PatternSyntax2600 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2600));
        console2.log("2600: ", string(utf8PatternSyntax2600));
        console2.logBytes(utf8PatternSyntax2600);

        console2.log("..");

        string memory patternSyntax266E = "\\u{266E}";
        bytes memory utf8PatternSyntax266E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax266E));
        console2.log("266E: ", string(utf8PatternSyntax266E));
        console2.logBytes(utf8PatternSyntax266E);

        string memory patternSyntax266F = "\\u{266F}";
        bytes memory utf8PatternSyntax266F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax266F));
        console2.log("266F: ", string(utf8PatternSyntax266F));
        console2.logBytes(utf8PatternSyntax266F);

        string memory patternSyntax2670 = "\\u{2670}";
        bytes memory utf8PatternSyntax2670 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2670));
        console2.log("2670: ", string(utf8PatternSyntax2670));
        console2.logBytes(utf8PatternSyntax2670);

        console2.log("..");

        string memory patternSyntax2767 = "\\u{2767}";
        bytes memory utf8PatternSyntax2767 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2767));
        console2.log("2767: ", string(utf8PatternSyntax2767));
        console2.logBytes(utf8PatternSyntax2767);

        string memory patternSyntax2768 = "\\u{2768}";
        bytes memory utf8PatternSyntax2768 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2768));
        console2.log("2768: ", string(utf8PatternSyntax2768));
        console2.logBytes(utf8PatternSyntax2768);

        string memory patternSyntax2769 = "\\u{2769}";
        bytes memory utf8PatternSyntax2769 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2769));
        console2.log("2769: ", string(utf8PatternSyntax2769));
        console2.logBytes(utf8PatternSyntax2769);

        string memory patternSyntax276A = "\\u{276A}";
        bytes memory utf8PatternSyntax276A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax276A));
        console2.log("276A: ", string(utf8PatternSyntax276A));
        console2.logBytes(utf8PatternSyntax276A);

        string memory patternSyntax276B = "\\u{276B}";
        bytes memory utf8PatternSyntax276B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax276B));
        console2.log("276B: ", string(utf8PatternSyntax276B));
        console2.logBytes(utf8PatternSyntax276B);

        string memory patternSyntax276C = "\\u{276C}";
        bytes memory utf8PatternSyntax276C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax276C));
        console2.log("276C: ", string(utf8PatternSyntax276C));
        console2.logBytes(utf8PatternSyntax276C);

        string memory patternSyntax276D = "\\u{276D}";
        bytes memory utf8PatternSyntax276D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax276D));
        console2.log("276D: ", string(utf8PatternSyntax276D));
        console2.logBytes(utf8PatternSyntax276D);

        string memory patternSyntax276E = "\\u{276E}";
        bytes memory utf8PatternSyntax276E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax276E));
        console2.log("276E: ", string(utf8PatternSyntax276E));
        console2.logBytes(utf8PatternSyntax276E);

        string memory patternSyntax276F = "\\u{276F}";
        bytes memory utf8PatternSyntax276F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax276F));
        console2.log("276F: ", string(utf8PatternSyntax276F));
        console2.logBytes(utf8PatternSyntax276F);

        string memory patternSyntax2770 = "\\u{2770}";
        bytes memory utf8PatternSyntax2770 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2770));
        console2.log("2770: ", string(utf8PatternSyntax2770));
        console2.logBytes(utf8PatternSyntax2770);

        string memory patternSyntax2771 = "\\u{2771}";
        bytes memory utf8PatternSyntax2771 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2771));
        console2.log("2771: ", string(utf8PatternSyntax2771));
        console2.logBytes(utf8PatternSyntax2771);

        string memory patternSyntax2772 = "\\u{2772}";
        bytes memory utf8PatternSyntax2772 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2772));
        console2.log("2772: ", string(utf8PatternSyntax2772));
        console2.logBytes(utf8PatternSyntax2772);

        string memory patternSyntax2773 = "\\u{2773}";
        bytes memory utf8PatternSyntax2773 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2773));
        console2.log("2773: ", string(utf8PatternSyntax2773));
        console2.logBytes(utf8PatternSyntax2773);

        string memory patternSyntax2774 = "\\u{2774}";
        bytes memory utf8PatternSyntax2774 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2774));
        console2.log("2774: ", string(utf8PatternSyntax2774));
        console2.logBytes(utf8PatternSyntax2774);

        string memory patternSyntax2775 = "\\u{2775}";
        bytes memory utf8PatternSyntax2775 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2775));
        console2.log("2775: ", string(utf8PatternSyntax2775));
        console2.logBytes(utf8PatternSyntax2775);

        string memory patternSyntax2794 = "\\u{2794}";
        bytes memory utf8PatternSyntax2794 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2794));
        console2.log("2794: ", string(utf8PatternSyntax2794));
        console2.logBytes(utf8PatternSyntax2794);

        console2.log("..");

        string memory patternSyntax27BF = "\\u{27BF}";
        bytes memory utf8PatternSyntax27BF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27BF));
        console2.log("27BF: ", string(utf8PatternSyntax27BF));
        console2.logBytes(utf8PatternSyntax27BF);

        string memory patternSyntax27C0 = "\\u{27C0}";
        bytes memory utf8PatternSyntax27C0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27C0));
        console2.log("27C0: ", string(utf8PatternSyntax27C0));
        console2.logBytes(utf8PatternSyntax27C0);

        console2.log("..");

        string memory patternSyntax27C4 = "\\u{27C4}";
        bytes memory utf8PatternSyntax27C4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27C4));
        console2.log("27C4: ", string(utf8PatternSyntax27C4));
        console2.logBytes(utf8PatternSyntax27C4);

        string memory patternSyntax27C5 = "\\u{27C5}";
        bytes memory utf8PatternSyntax27C5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27C5));
        console2.log("27C5: ", string(utf8PatternSyntax27C5));
        console2.logBytes(utf8PatternSyntax27C5);

        string memory patternSyntax27C6 = "\\u{27C6}";
        bytes memory utf8PatternSyntax27C6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27C6));
        console2.log("27C6: ", string(utf8PatternSyntax27C6));
        console2.logBytes(utf8PatternSyntax27C6);

        string memory patternSyntax27C7 = "\\u{27C7}";
        bytes memory utf8PatternSyntax27C7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27C7));
        console2.log("27C7: ", string(utf8PatternSyntax27C7));
        console2.logBytes(utf8PatternSyntax27C7);

        console2.log("..");

        string memory patternSyntax27E5 = "\\u{27E5}";
        bytes memory utf8PatternSyntax27E5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27E5));
        console2.log("27E5: ", string(utf8PatternSyntax27E5));
        console2.logBytes(utf8PatternSyntax27E5);

        string memory patternSyntax27E6 = "\\u{27E6}";
        bytes memory utf8PatternSyntax27E6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27E6));
        console2.log("27E6: ", string(utf8PatternSyntax27E6));
        console2.logBytes(utf8PatternSyntax27E6);

        string memory patternSyntax27E7 = "\\u{27E7}";
        bytes memory utf8PatternSyntax27E7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27E7));
        console2.log("27E7: ", string(utf8PatternSyntax27E7));
        console2.logBytes(utf8PatternSyntax27E7);

        string memory patternSyntax27E8 = "\\u{27E8}";
        bytes memory utf8PatternSyntax27E8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27E8));
        console2.log("27E8: ", string(utf8PatternSyntax27E8));
        console2.logBytes(utf8PatternSyntax27E8);

        string memory patternSyntax27E9 = "\\u{27E9}";
        bytes memory utf8PatternSyntax27E9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27E9));
        console2.log("27E9: ", string(utf8PatternSyntax27E9));
        console2.logBytes(utf8PatternSyntax27E9);

        string memory patternSyntax27EA = "\\u{27EA}";
        bytes memory utf8PatternSyntax27EA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27EA));
        console2.log("27EA: ", string(utf8PatternSyntax27EA));
        console2.logBytes(utf8PatternSyntax27EA);

        string memory patternSyntax27EB = "\\u{27EB}";
        bytes memory utf8PatternSyntax27EB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27EB));
        console2.log("27EB: ", string(utf8PatternSyntax27EB));
        console2.logBytes(utf8PatternSyntax27EB);

        string memory patternSyntax27EC = "\\u{27EC}";
        bytes memory utf8PatternSyntax27EC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27EC));
        console2.log("27EC: ", string(utf8PatternSyntax27EC));
        console2.logBytes(utf8PatternSyntax27EC);

        string memory patternSyntax27ED = "\\u{27ED}";
        bytes memory utf8PatternSyntax27ED = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27ED));
        console2.log("27ED: ", string(utf8PatternSyntax27ED));
        console2.logBytes(utf8PatternSyntax27ED);

        string memory patternSyntax27EE = "\\u{27EE}";
        bytes memory utf8PatternSyntax27EE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27EE));
        console2.log("27EE: ", string(utf8PatternSyntax27EE));
        console2.logBytes(utf8PatternSyntax27EE);

        string memory patternSyntax27EF = "\\u{27EF}";
        bytes memory utf8PatternSyntax27EF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27EF));
        console2.log("27EF: ", string(utf8PatternSyntax27EF));
        console2.logBytes(utf8PatternSyntax27EF);

        string memory patternSyntax27F0 = "\\u{27F0}";
        bytes memory utf8PatternSyntax27F0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27F0));
        console2.log("27F0: ", string(utf8PatternSyntax27F0));
        console2.logBytes(utf8PatternSyntax27F0);

        console2.log("..");

        string memory patternSyntax27FF = "\\u{27FF}";
        bytes memory utf8PatternSyntax27FF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax27FF));
        console2.log("27FF: ", string(utf8PatternSyntax27FF));
        console2.logBytes(utf8PatternSyntax27FF);

        string memory patternSyntax2800 = "\\u{2800}";
        bytes memory utf8PatternSyntax2800 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2800));
        console2.log("2800: ", string(utf8PatternSyntax2800));
        console2.logBytes(utf8PatternSyntax2800);

        console2.log("..");

        string memory patternSyntax28FF = "\\u{28FF}";
        bytes memory utf8PatternSyntax28FF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax28FF));
        console2.log("28FF: ", string(utf8PatternSyntax28FF));
        console2.logBytes(utf8PatternSyntax28FF);

        string memory patternSyntax2900 = "\\u{2900}";
        bytes memory utf8PatternSyntax2900 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2900));
        console2.log("2900: ", string(utf8PatternSyntax2900));
        console2.logBytes(utf8PatternSyntax2900);

        console2.log("..");

        string memory patternSyntax2982 = "\\u{2982}";
        bytes memory utf8PatternSyntax2982 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2982));
        console2.log("2982: ", string(utf8PatternSyntax2982));
        console2.logBytes(utf8PatternSyntax2982);

        string memory patternSyntax2983 = "\\u{2983}";
        bytes memory utf8PatternSyntax2983 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2983));
        console2.log("2983: ", string(utf8PatternSyntax2983));
        console2.logBytes(utf8PatternSyntax2983);

        string memory patternSyntax2984 = "\\u{2984}";
        bytes memory utf8PatternSyntax2984 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2984));
        console2.log("2984: ", string(utf8PatternSyntax2984));
        console2.logBytes(utf8PatternSyntax2984);

        string memory patternSyntax2985 = "\\u{2985}";
        bytes memory utf8PatternSyntax2985 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2985));
        console2.log("2985: ", string(utf8PatternSyntax2985));
        console2.logBytes(utf8PatternSyntax2985);

        string memory patternSyntax2986 = "\\u{2986}";
        bytes memory utf8PatternSyntax2986 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2986));
        console2.log("2986: ", string(utf8PatternSyntax2986));
        console2.logBytes(utf8PatternSyntax2986);

        string memory patternSyntax2987 = "\\u{2987}";
        bytes memory utf8PatternSyntax2987 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2987));
        console2.log("2987: ", string(utf8PatternSyntax2987));
        console2.logBytes(utf8PatternSyntax2987);

        string memory patternSyntax2988 = "\\u{2988}";
        bytes memory utf8PatternSyntax2988 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2988));
        console2.log("2988: ", string(utf8PatternSyntax2988));
        console2.logBytes(utf8PatternSyntax2988);

        string memory patternSyntax2989 = "\\u{2989}";
        bytes memory utf8PatternSyntax2989 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2989));
        console2.log("2989: ", string(utf8PatternSyntax2989));
        console2.logBytes(utf8PatternSyntax2989);

        string memory patternSyntax298A = "\\u{298A}";
        bytes memory utf8PatternSyntax298A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax298A));
        console2.log("298A: ", string(utf8PatternSyntax298A));
        console2.logBytes(utf8PatternSyntax298A);

        string memory patternSyntax298B = "\\u{298B}";
        bytes memory utf8PatternSyntax298B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax298B));
        console2.log("298B: ", string(utf8PatternSyntax298B));
        console2.logBytes(utf8PatternSyntax298B);

        string memory patternSyntax298C = "\\u{298C}";
        bytes memory utf8PatternSyntax298C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax298C));
        console2.log("298C: ", string(utf8PatternSyntax298C));
        console2.logBytes(utf8PatternSyntax298C);

        string memory patternSyntax298D = "\\u{298D}";
        bytes memory utf8PatternSyntax298D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax298D));
        console2.log("298D: ", string(utf8PatternSyntax298D));
        console2.logBytes(utf8PatternSyntax298D);

        string memory patternSyntax298E = "\\u{298E}";
        bytes memory utf8PatternSyntax298E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax298E));
        console2.log("298E: ", string(utf8PatternSyntax298E));
        console2.logBytes(utf8PatternSyntax298E);

        string memory patternSyntax298F = "\\u{298F}";
        bytes memory utf8PatternSyntax298F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax298F));
        console2.log("298F: ", string(utf8PatternSyntax298F));
        console2.logBytes(utf8PatternSyntax298F);

        string memory patternSyntax2990 = "\\u{2990}";
        bytes memory utf8PatternSyntax2990 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2990));
        console2.log("2990: ", string(utf8PatternSyntax2990));
        console2.logBytes(utf8PatternSyntax2990);

        string memory patternSyntax2991 = "\\u{2991}";
        bytes memory utf8PatternSyntax2991 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2991));
        console2.log("2991: ", string(utf8PatternSyntax2991));
        console2.logBytes(utf8PatternSyntax2991);

        string memory patternSyntax2992 = "\\u{2992}";
        bytes memory utf8PatternSyntax2992 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2992));
        console2.log("2992: ", string(utf8PatternSyntax2992));
        console2.logBytes(utf8PatternSyntax2992);

        string memory patternSyntax2993 = "\\u{2993}";
        bytes memory utf8PatternSyntax2993 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2993));
        console2.log("2993: ", string(utf8PatternSyntax2993));
        console2.logBytes(utf8PatternSyntax2993);

        string memory patternSyntax2994 = "\\u{2994}";
        bytes memory utf8PatternSyntax2994 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2994));
        console2.log("2994: ", string(utf8PatternSyntax2994));
        console2.logBytes(utf8PatternSyntax2994);

        string memory patternSyntax2995 = "\\u{2995}";
        bytes memory utf8PatternSyntax2995 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2995));
        console2.log("2995: ", string(utf8PatternSyntax2995));
        console2.logBytes(utf8PatternSyntax2995);

        string memory patternSyntax2996 = "\\u{2996}";
        bytes memory utf8PatternSyntax2996 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2996));
        console2.log("2996: ", string(utf8PatternSyntax2996));
        console2.logBytes(utf8PatternSyntax2996);

        string memory patternSyntax2997 = "\\u{2997}";
        bytes memory utf8PatternSyntax2997 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2997));
        console2.log("2997: ", string(utf8PatternSyntax2997));
        console2.logBytes(utf8PatternSyntax2997);

        string memory patternSyntax2998 = "\\u{2998}";
        bytes memory utf8PatternSyntax2998 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2998));
        console2.log("2998: ", string(utf8PatternSyntax2998));
        console2.logBytes(utf8PatternSyntax2998);

        string memory patternSyntax2999 = "\\u{2999}";
        bytes memory utf8PatternSyntax2999 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2999));
        console2.log("2999: ", string(utf8PatternSyntax2999));
        console2.logBytes(utf8PatternSyntax2999);

        console2.log("..");

        string memory patternSyntax29D7 = "\\u{29D7}";
        bytes memory utf8PatternSyntax29D7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax29D7));
        console2.log("29D7: ", string(utf8PatternSyntax29D7));
        console2.logBytes(utf8PatternSyntax29D7);

        string memory patternSyntax29D8 = "\\u{29D8}";
        bytes memory utf8PatternSyntax29D8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax29D8));
        console2.log("29D8: ", string(utf8PatternSyntax29D8));
        console2.logBytes(utf8PatternSyntax29D8);

        string memory patternSyntax29D9 = "\\u{29D9}";
        bytes memory utf8PatternSyntax29D9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax29D9));
        console2.log("29D9: ", string(utf8PatternSyntax29D9));
        console2.logBytes(utf8PatternSyntax29D9);

        string memory patternSyntax29DA = "\\u{29DA}";
        bytes memory utf8PatternSyntax29DA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax29DA));
        console2.log("29DA: ", string(utf8PatternSyntax29DA));
        console2.logBytes(utf8PatternSyntax29DA);

        string memory patternSyntax29DB = "\\u{29DB}";
        bytes memory utf8PatternSyntax29DB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax29DB));
        console2.log("29DB: ", string(utf8PatternSyntax29DB));
        console2.logBytes(utf8PatternSyntax29DB);

        string memory patternSyntax29DC = "\\u{29DC}";
        bytes memory utf8PatternSyntax29DC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax29DC));
        console2.log("29DC: ", string(utf8PatternSyntax29DC));
        console2.logBytes(utf8PatternSyntax29DC);

        console2.log("..");

        string memory patternSyntax29FB = "\\u{29FB}";
        bytes memory utf8PatternSyntax29FB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax29FB));
        console2.log("29FB: ", string(utf8PatternSyntax29FB));
        console2.logBytes(utf8PatternSyntax29FB);

        string memory patternSyntax29FC = "\\u{29FC}";
        bytes memory utf8PatternSyntax29FC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax29FC));
        console2.log("29FC: ", string(utf8PatternSyntax29FC));
        console2.logBytes(utf8PatternSyntax29FC);

        string memory patternSyntax29FD = "\\u{29FD}";
        bytes memory utf8PatternSyntax29FD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax29FD));
        console2.log("29FD: ", string(utf8PatternSyntax29FD));
        console2.logBytes(utf8PatternSyntax29FD);

        string memory patternSyntax29FE = "\\u{29FE}";
        bytes memory utf8PatternSyntax29FE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax29FE));
        console2.log("29FE: ", string(utf8PatternSyntax29FE));
        console2.logBytes(utf8PatternSyntax29FE);

        console2.log("..");

        string memory patternSyntax2AFF = "\\u{2AFF}";
        bytes memory utf8PatternSyntax2AFF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2AFF));
        console2.log("2AFF: ", string(utf8PatternSyntax2AFF));
        console2.logBytes(utf8PatternSyntax2AFF);

        string memory patternSyntax2B00 = "\\u{2B00}";
        bytes memory utf8PatternSyntax2B00 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B00));
        console2.log("2B00: ", string(utf8PatternSyntax2B00));
        console2.logBytes(utf8PatternSyntax2B00);

        console2.log("..");

        string memory patternSyntax2B2F = "\\u{2B2F}";
        bytes memory utf8PatternSyntax2B2F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B2F));
        console2.log("2B2F: ", string(utf8PatternSyntax2B2F));
        console2.logBytes(utf8PatternSyntax2B2F);

        string memory patternSyntax2B30 = "\\u{2B30}";
        bytes memory utf8PatternSyntax2B30 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B30));
        console2.log("2B30: ", string(utf8PatternSyntax2B30));
        console2.logBytes(utf8PatternSyntax2B30);

        console2.log("..");

        string memory patternSyntax2B44 = "\\u{2B44}";
        bytes memory utf8PatternSyntax2B44 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B44));
        console2.log("2B44: ", string(utf8PatternSyntax2B44));
        console2.logBytes(utf8PatternSyntax2B44);

        string memory patternSyntax2B45 = "\\u{2B45}";
        bytes memory utf8PatternSyntax2B45 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B45));
        console2.log("2B45: ", string(utf8PatternSyntax2B45));
        console2.logBytes(utf8PatternSyntax2B45);

        console2.log("..");

        string memory patternSyntax2B46 = "\\u{2B46}";
        bytes memory utf8PatternSyntax2B46 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B46));
        console2.log("2B46: ", string(utf8PatternSyntax2B46));
        console2.logBytes(utf8PatternSyntax2B46);

        string memory patternSyntax2B47 = "\\u{2B47}";
        bytes memory utf8PatternSyntax2B47 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B47));
        console2.log("2B47: ", string(utf8PatternSyntax2B47));
        console2.logBytes(utf8PatternSyntax2B47);

        console2.log("..");

        string memory patternSyntax2B4C = "\\u{2B4C}";
        bytes memory utf8PatternSyntax2B4C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B4C));
        console2.log("2B4C: ", string(utf8PatternSyntax2B4C));
        console2.logBytes(utf8PatternSyntax2B4C);

        string memory patternSyntax2B4D = "\\u{2B4D}";
        bytes memory utf8PatternSyntax2B4D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B4D));
        console2.log("2B4D: ", string(utf8PatternSyntax2B4D));
        console2.logBytes(utf8PatternSyntax2B4D);

        console2.log("..");

        string memory patternSyntax2B73 = "\\u{2B73}";
        bytes memory utf8PatternSyntax2B73 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B73));
        console2.log("2B73: ", string(utf8PatternSyntax2B73));
        console2.logBytes(utf8PatternSyntax2B73);

        string memory patternSyntax2B74 = "\\u{2B74}";
        bytes memory utf8PatternSyntax2B74 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B74));
        console2.log("2B74: ", string(utf8PatternSyntax2B74));
        console2.logBytes(utf8PatternSyntax2B74);

        console2.log("..");

        string memory patternSyntax2B75 = "\\u{2B75}";
        bytes memory utf8PatternSyntax2B75 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B75));
        console2.log("2B75: ", string(utf8PatternSyntax2B75));
        console2.logBytes(utf8PatternSyntax2B75);

        string memory patternSyntax2B76 = "\\u{2B76}";
        bytes memory utf8PatternSyntax2B76 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2B76));
        console2.log("2B76: ", string(utf8PatternSyntax2B76));
        console2.logBytes(utf8PatternSyntax2B76);

        console2.log("..");

        string memory patternSyntax2BFF = "\\u{2BFF}";
        bytes memory utf8PatternSyntax2BFF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2BFF));
        console2.log("2BFF: ", string(utf8PatternSyntax2BFF));
        console2.logBytes(utf8PatternSyntax2BFF);

        string memory patternSyntax2E00 = "\\u{2E00}";
        bytes memory utf8PatternSyntax2E00 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E00));
        console2.log("2E00: ", string(utf8PatternSyntax2E00));
        console2.logBytes(utf8PatternSyntax2E00);

        console2.log("..");

        string memory patternSyntax2E01 = "\\u{2E01}";
        bytes memory utf8PatternSyntax2E01 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E01));
        console2.log("2E01: ", string(utf8PatternSyntax2E01));
        console2.logBytes(utf8PatternSyntax2E01);

        string memory patternSyntax2E02 = "\\u{2E02}";
        bytes memory utf8PatternSyntax2E02 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E02));
        console2.log("2E02: ", string(utf8PatternSyntax2E02));
        console2.logBytes(utf8PatternSyntax2E02);

        string memory patternSyntax2E03 = "\\u{2E03}";
        bytes memory utf8PatternSyntax2E03 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E03));
        console2.log("2E03: ", string(utf8PatternSyntax2E03));
        console2.logBytes(utf8PatternSyntax2E03);

        string memory patternSyntax2E04 = "\\u{2E04}";
        bytes memory utf8PatternSyntax2E04 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E04));
        console2.log("2E04: ", string(utf8PatternSyntax2E04));
        console2.logBytes(utf8PatternSyntax2E04);

        string memory patternSyntax2E05 = "\\u{2E05}";
        bytes memory utf8PatternSyntax2E05 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E05));
        console2.log("2E05: ", string(utf8PatternSyntax2E05));
        console2.logBytes(utf8PatternSyntax2E05);

        string memory patternSyntax2E06 = "\\u{2E06}";
        bytes memory utf8PatternSyntax2E06 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E06));
        console2.log("2E06: ", string(utf8PatternSyntax2E06));
        console2.logBytes(utf8PatternSyntax2E06);

        console2.log("..");

        string memory patternSyntax2E08 = "\\u{2E08}";
        bytes memory utf8PatternSyntax2E08 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E08));
        console2.log("2E08: ", string(utf8PatternSyntax2E08));
        console2.logBytes(utf8PatternSyntax2E08);

        string memory patternSyntax2E09 = "\\u{2E09}";
        bytes memory utf8PatternSyntax2E09 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E09));
        console2.log("2E09: ", string(utf8PatternSyntax2E09));
        console2.logBytes(utf8PatternSyntax2E09);

        string memory patternSyntax2E0A = "\\u{2E0A}";
        bytes memory utf8PatternSyntax2E0A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E0A));
        console2.log("2E0A: ", string(utf8PatternSyntax2E0A));
        console2.logBytes(utf8PatternSyntax2E0A);

        string memory patternSyntax2E0B = "\\u{2E0B}";
        bytes memory utf8PatternSyntax2E0B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E0B));
        console2.log("2E0B: ", string(utf8PatternSyntax2E0B));
        console2.logBytes(utf8PatternSyntax2E0B);

        string memory patternSyntax2E0C = "\\u{2E0C}";
        bytes memory utf8PatternSyntax2E0C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E0C));
        console2.log("2E0C: ", string(utf8PatternSyntax2E0C));
        console2.logBytes(utf8PatternSyntax2E0C);

        string memory patternSyntax2E0D = "\\u{2E0D}";
        bytes memory utf8PatternSyntax2E0D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E0D));
        console2.log("2E0D: ", string(utf8PatternSyntax2E0D));
        console2.logBytes(utf8PatternSyntax2E0D);

        string memory patternSyntax2E0E = "\\u{2E0E}";
        bytes memory utf8PatternSyntax2E0E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E0E));
        console2.log("2E0E: ", string(utf8PatternSyntax2E0E));
        console2.logBytes(utf8PatternSyntax2E0E);

        console2.log("..");

        string memory patternSyntax2E16 = "\\u{2E16}";
        bytes memory utf8PatternSyntax2E16 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E16));
        console2.log("2E16: ", string(utf8PatternSyntax2E16));
        console2.logBytes(utf8PatternSyntax2E16);

        string memory patternSyntax2E17 = "\\u{2E17}";
        bytes memory utf8PatternSyntax2E17 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E17));
        console2.log("2E17: ", string(utf8PatternSyntax2E17));
        console2.logBytes(utf8PatternSyntax2E17);

        string memory patternSyntax2E18 = "\\u{2E18}";
        bytes memory utf8PatternSyntax2E18 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E18));
        console2.log("2E18: ", string(utf8PatternSyntax2E18));
        console2.logBytes(utf8PatternSyntax2E18);

        console2.log("..");

        string memory patternSyntax2E19 = "\\u{2E19}";
        bytes memory utf8PatternSyntax2E19 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E19));
        console2.log("2E19: ", string(utf8PatternSyntax2E19));
        console2.logBytes(utf8PatternSyntax2E19);

        string memory patternSyntax2E1A = "\\u{2E1A}";
        bytes memory utf8PatternSyntax2E1A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E1A));
        console2.log("2E1A: ", string(utf8PatternSyntax2E1A));
        console2.logBytes(utf8PatternSyntax2E1A);

        string memory patternSyntax2E1B = "\\u{2E1B}";
        bytes memory utf8PatternSyntax2E1B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E1B));
        console2.log("2E1B: ", string(utf8PatternSyntax2E1B));
        console2.logBytes(utf8PatternSyntax2E1B);

        string memory patternSyntax2E1C = "\\u{2E1C}";
        bytes memory utf8PatternSyntax2E1C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E1C));
        console2.log("2E1C: ", string(utf8PatternSyntax2E1C));
        console2.logBytes(utf8PatternSyntax2E1C);

        string memory patternSyntax2E1D = "\\u{2E1D}";
        bytes memory utf8PatternSyntax2E1D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E1D));
        console2.log("2E1D: ", string(utf8PatternSyntax2E1D));
        console2.logBytes(utf8PatternSyntax2E1D);

        string memory patternSyntax2E1E = "\\u{2E1E}";
        bytes memory utf8PatternSyntax2E1E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E1E));
        console2.log("2E1E: ", string(utf8PatternSyntax2E1E));
        console2.logBytes(utf8PatternSyntax2E1E);

        console2.log("..");

        string memory patternSyntax2E1F = "\\u{2E1F}";
        bytes memory utf8PatternSyntax2E1F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E1F));
        console2.log("2E1F: ", string(utf8PatternSyntax2E1F));
        console2.logBytes(utf8PatternSyntax2E1F);

        string memory patternSyntax2E20 = "\\u{2E20}";
        bytes memory utf8PatternSyntax2E20 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E20));
        console2.log("2E20: ", string(utf8PatternSyntax2E20));
        console2.logBytes(utf8PatternSyntax2E20);

        string memory patternSyntax2E21 = "\\u{2E21}";
        bytes memory utf8PatternSyntax2E21 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E21));
        console2.log("2E21: ", string(utf8PatternSyntax2E21));
        console2.logBytes(utf8PatternSyntax2E21);

        string memory patternSyntax2E22 = "\\u{2E22}";
        bytes memory utf8PatternSyntax2E22 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E22));
        console2.log("2E22: ", string(utf8PatternSyntax2E22));
        console2.logBytes(utf8PatternSyntax2E22);

        string memory patternSyntax2E23 = "\\u{2E23}";
        bytes memory utf8PatternSyntax2E23 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E23));
        console2.log("2E23: ", string(utf8PatternSyntax2E23));
        console2.logBytes(utf8PatternSyntax2E23);

        string memory patternSyntax2E24 = "\\u{2E24}";
        bytes memory utf8PatternSyntax2E24 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E24));
        console2.log("2E24: ", string(utf8PatternSyntax2E24));
        console2.logBytes(utf8PatternSyntax2E24);

        string memory patternSyntax2E25 = "\\u{2E25}";
        bytes memory utf8PatternSyntax2E25 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E25));
        console2.log("2E25: ", string(utf8PatternSyntax2E25));
        console2.logBytes(utf8PatternSyntax2E25);

        string memory patternSyntax2E26 = "\\u{2E26}";
        bytes memory utf8PatternSyntax2E26 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E26));
        console2.log("2E26: ", string(utf8PatternSyntax2E26));
        console2.logBytes(utf8PatternSyntax2E26);

        string memory patternSyntax2E27 = "\\u{2E27}";
        bytes memory utf8PatternSyntax2E27 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E27));
        console2.log("2E27: ", string(utf8PatternSyntax2E27));
        console2.logBytes(utf8PatternSyntax2E27);

        string memory patternSyntax2E28 = "\\u{2E28}";
        bytes memory utf8PatternSyntax2E28 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E28));
        console2.log("2E28: ", string(utf8PatternSyntax2E28));
        console2.logBytes(utf8PatternSyntax2E28);

        string memory patternSyntax2E29 = "\\u{2E29}";
        bytes memory utf8PatternSyntax2E29 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E29));
        console2.log("2E29: ", string(utf8PatternSyntax2E29));
        console2.logBytes(utf8PatternSyntax2E29);

        string memory patternSyntax2E2A = "\\u{2E2A}";
        bytes memory utf8PatternSyntax2E2A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E2A));
        console2.log("2E2A: ", string(utf8PatternSyntax2E2A));
        console2.logBytes(utf8PatternSyntax2E2A);

        console2.log("..");

        string memory patternSyntax2E2E = "\\u{2E2E}";
        bytes memory utf8PatternSyntax2E2E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E2E));
        console2.log("2E2E: ", string(utf8PatternSyntax2E2E));
        console2.logBytes(utf8PatternSyntax2E2E);

        string memory patternSyntax2E2F = "\\u{2E2F}";
        bytes memory utf8PatternSyntax2E2F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E2F));
        console2.log("2E2F: ", string(utf8PatternSyntax2E2F));
        console2.logBytes(utf8PatternSyntax2E2F);

        string memory patternSyntax2E30 = "\\u{2E30}";
        bytes memory utf8PatternSyntax2E30 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E30));
        console2.log("2E30: ", string(utf8PatternSyntax2E30));
        console2.logBytes(utf8PatternSyntax2E30);

        console2.log("..");

        string memory patternSyntax2E39 = "\\u{2E39}";
        bytes memory utf8PatternSyntax2E39 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E39));
        console2.log("2E39: ", string(utf8PatternSyntax2E39));
        console2.logBytes(utf8PatternSyntax2E39);

        string memory patternSyntax2E3A = "\\u{2E3A}";
        bytes memory utf8PatternSyntax2E3A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E3A));
        console2.log("2E3A: ", string(utf8PatternSyntax2E3A));
        console2.logBytes(utf8PatternSyntax2E3A);

        console2.log("..");

        string memory patternSyntax2E3B = "\\u{2E3B}";
        bytes memory utf8PatternSyntax2E3B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E3B));
        console2.log("2E3B: ", string(utf8PatternSyntax2E3B));
        console2.logBytes(utf8PatternSyntax2E3B);

        string memory patternSyntax2E3C = "\\u{2E3C}";
        bytes memory utf8PatternSyntax2E3C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E3C));
        console2.log("2E3C: ", string(utf8PatternSyntax2E3C));
        console2.logBytes(utf8PatternSyntax2E3C);

        console2.log("..");

        string memory patternSyntax2E3F = "\\u{2E3F}";
        bytes memory utf8PatternSyntax2E3F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E3F));
        console2.log("2E3F: ", string(utf8PatternSyntax2E3F));
        console2.logBytes(utf8PatternSyntax2E3F);

        string memory patternSyntax2E40 = "\\u{2E40}";
        bytes memory utf8PatternSyntax2E40 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E40));
        console2.log("2E40: ", string(utf8PatternSyntax2E40));
        console2.logBytes(utf8PatternSyntax2E40);

        string memory patternSyntax2E41 = "\\u{2E41}";
        bytes memory utf8PatternSyntax2E41 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E41));
        console2.log("2E41: ", string(utf8PatternSyntax2E41));
        console2.logBytes(utf8PatternSyntax2E41);

        string memory patternSyntax2E42 = "\\u{2E42}";
        bytes memory utf8PatternSyntax2E42 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E42));
        console2.log("2E42: ", string(utf8PatternSyntax2E42));
        console2.logBytes(utf8PatternSyntax2E42);

        string memory patternSyntax2E43 = "\\u{2E43}";
        bytes memory utf8PatternSyntax2E43 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E43));
        console2.log("2E43: ", string(utf8PatternSyntax2E43));
        console2.logBytes(utf8PatternSyntax2E43);

        console2.log("..");

        string memory patternSyntax2E4F = "\\u{2E4F}";
        bytes memory utf8PatternSyntax2E4F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E4F));
        console2.log("2E4F: ", string(utf8PatternSyntax2E4F));
        console2.logBytes(utf8PatternSyntax2E4F);

        string memory patternSyntax2E50 = "\\u{2E50}";
        bytes memory utf8PatternSyntax2E50 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E50));
        console2.log("2E50: ", string(utf8PatternSyntax2E50));
        console2.logBytes(utf8PatternSyntax2E50);

        console2.log("..");

        string memory patternSyntax2E51 = "\\u{2E51}";
        bytes memory utf8PatternSyntax2E51 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E51));
        console2.log("2E51: ", string(utf8PatternSyntax2E51));
        console2.logBytes(utf8PatternSyntax2E51);

        string memory patternSyntax2E52 = "\\u{2E52}";
        bytes memory utf8PatternSyntax2E52 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E52));
        console2.log("2E52: ", string(utf8PatternSyntax2E52));
        console2.logBytes(utf8PatternSyntax2E52);

        console2.log("..");

        string memory patternSyntax2E54 = "\\u{2E54}";
        bytes memory utf8PatternSyntax2E54 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E54));
        console2.log("2E54: ", string(utf8PatternSyntax2E54));
        console2.logBytes(utf8PatternSyntax2E54);

        string memory patternSyntax2E55 = "\\u{2E55}";
        bytes memory utf8PatternSyntax2E55 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E55));
        console2.log("2E55: ", string(utf8PatternSyntax2E55));
        console2.logBytes(utf8PatternSyntax2E55);

        string memory patternSyntax2E56 = "\\u{2E56}";
        bytes memory utf8PatternSyntax2E56 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E56));
        console2.log("2E56: ", string(utf8PatternSyntax2E56));
        console2.logBytes(utf8PatternSyntax2E56);

        string memory patternSyntax2E57 = "\\u{2E57}";
        bytes memory utf8PatternSyntax2E57 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E57));
        console2.log("2E57: ", string(utf8PatternSyntax2E57));
        console2.logBytes(utf8PatternSyntax2E57);

        string memory patternSyntax2E58 = "\\u{2E58}";
        bytes memory utf8PatternSyntax2E58 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E58));
        console2.log("2E58: ", string(utf8PatternSyntax2E58));
        console2.logBytes(utf8PatternSyntax2E58);

        string memory patternSyntax2E59 = "\\u{2E59}";
        bytes memory utf8PatternSyntax2E59 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E59));
        console2.log("2E59: ", string(utf8PatternSyntax2E59));
        console2.logBytes(utf8PatternSyntax2E59);

        string memory patternSyntax2E5A = "\\u{2E5A}";
        bytes memory utf8PatternSyntax2E5A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E5A));
        console2.log("2E5A: ", string(utf8PatternSyntax2E5A));
        console2.logBytes(utf8PatternSyntax2E5A);

        string memory patternSyntax2E5B = "\\u{2E5B}";
        bytes memory utf8PatternSyntax2E5B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E5B));
        console2.log("2E5B: ", string(utf8PatternSyntax2E5B));
        console2.logBytes(utf8PatternSyntax2E5B);

        string memory patternSyntax2E5C = "\\u{2E5C}";
        bytes memory utf8PatternSyntax2E5C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E5C));
        console2.log("2E5C: ", string(utf8PatternSyntax2E5C));
        console2.logBytes(utf8PatternSyntax2E5C);

        string memory patternSyntax2E5D = "\\u{2E5D}";
        bytes memory utf8PatternSyntax2E5D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E5D));
        console2.log("2E5D: ", string(utf8PatternSyntax2E5D));
        console2.logBytes(utf8PatternSyntax2E5D);

        string memory patternSyntax2E5E = "\\u{2E5E}";
        bytes memory utf8PatternSyntax2E5E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E5E));
        console2.log("2E5E: ", string(utf8PatternSyntax2E5E));
        console2.logBytes(utf8PatternSyntax2E5E);

        console2.log("..");

        string memory patternSyntax2E7F = "\\u{2E7F}";
        bytes memory utf8PatternSyntax2E7F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax2E7F));
        console2.log("2E7F: ", string(utf8PatternSyntax2E7F));
        console2.logBytes(utf8PatternSyntax2E7F);

        string memory patternSyntax3001 = "\\u{3001}";
        bytes memory utf8PatternSyntax3001 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3001));
        console2.log("3001: ", string(utf8PatternSyntax3001));
        console2.logBytes(utf8PatternSyntax3001);

        console2.log("..");

        string memory patternSyntax3003 = "\\u{3003}";
        bytes memory utf8PatternSyntax3003 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3003));
        console2.log("3003: ", string(utf8PatternSyntax3003));
        console2.logBytes(utf8PatternSyntax3003);

        string memory patternSyntax3008 = "\\u{3008}";
        bytes memory utf8PatternSyntax3008 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3008));
        console2.log("3008: ", string(utf8PatternSyntax3008));
        console2.logBytes(utf8PatternSyntax3008);

        string memory patternSyntax3009 = "\\u{3009}";
        bytes memory utf8PatternSyntax3009 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3009));
        console2.log("3009: ", string(utf8PatternSyntax3009));
        console2.logBytes(utf8PatternSyntax3009);

        string memory patternSyntax300A = "\\u{300A}";
        bytes memory utf8PatternSyntax300A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax300A));
        console2.log("300A: ", string(utf8PatternSyntax300A));
        console2.logBytes(utf8PatternSyntax300A);

        string memory patternSyntax300B = "\\u{300B}";
        bytes memory utf8PatternSyntax300B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax300B));
        console2.log("300B: ", string(utf8PatternSyntax300B));
        console2.logBytes(utf8PatternSyntax300B);

        string memory patternSyntax300C = "\\u{300C}";
        bytes memory utf8PatternSyntax300C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax300C));
        console2.log("300C: ", string(utf8PatternSyntax300C));
        console2.logBytes(utf8PatternSyntax300C);

        string memory patternSyntax300D = "\\u{300D}";
        bytes memory utf8PatternSyntax300D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax300D));
        console2.log("300D: ", string(utf8PatternSyntax300D));
        console2.logBytes(utf8PatternSyntax300D);

        string memory patternSyntax300E = "\\u{300E}";
        bytes memory utf8PatternSyntax300E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax300E));
        console2.log("300E: ", string(utf8PatternSyntax300E));
        console2.logBytes(utf8PatternSyntax300E);

        string memory patternSyntax300F = "\\u{300F}";
        bytes memory utf8PatternSyntax300F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax300F));
        console2.log("300F: ", string(utf8PatternSyntax300F));
        console2.logBytes(utf8PatternSyntax300F);

        string memory patternSyntax3010 = "\\u{3010}";
        bytes memory utf8PatternSyntax3010 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3010));
        console2.log("3010: ", string(utf8PatternSyntax3010));
        console2.logBytes(utf8PatternSyntax3010);

        string memory patternSyntax3011 = "\\u{3011}";
        bytes memory utf8PatternSyntax3011 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3011));
        console2.log("3011: ", string(utf8PatternSyntax3011));
        console2.logBytes(utf8PatternSyntax3011);

        string memory patternSyntax3012 = "\\u{3012}";
        bytes memory utf8PatternSyntax3012 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3012));
        console2.log("3012: ", string(utf8PatternSyntax3012));
        console2.logBytes(utf8PatternSyntax3012);

        console2.log("..");

        string memory patternSyntax3013 = "\\u{3013}";
        bytes memory utf8PatternSyntax3013 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3013));
        console2.log("3013: ", string(utf8PatternSyntax3013));
        console2.logBytes(utf8PatternSyntax3013);

        string memory patternSyntax3014 = "\\u{3014}";
        bytes memory utf8PatternSyntax3014 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3014));
        console2.log("3014: ", string(utf8PatternSyntax3014));
        console2.logBytes(utf8PatternSyntax3014);

        string memory patternSyntax3015 = "\\u{3015}";
        bytes memory utf8PatternSyntax3015 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3015));
        console2.log("3015: ", string(utf8PatternSyntax3015));
        console2.logBytes(utf8PatternSyntax3015);

        string memory patternSyntax3016 = "\\u{3016}";
        bytes memory utf8PatternSyntax3016 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3016));
        console2.log("3016: ", string(utf8PatternSyntax3016));
        console2.logBytes(utf8PatternSyntax3016);

        string memory patternSyntax3017 = "\\u{3017}";
        bytes memory utf8PatternSyntax3017 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3017));
        console2.log("3017: ", string(utf8PatternSyntax3017));
        console2.logBytes(utf8PatternSyntax3017);

        string memory patternSyntax3018 = "\\u{3018}";
        bytes memory utf8PatternSyntax3018 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3018));
        console2.log("3018: ", string(utf8PatternSyntax3018));
        console2.logBytes(utf8PatternSyntax3018);

        string memory patternSyntax3019 = "\\u{3019}";
        bytes memory utf8PatternSyntax3019 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3019));
        console2.log("3019: ", string(utf8PatternSyntax3019));
        console2.logBytes(utf8PatternSyntax3019);

        string memory patternSyntax301A = "\\u{301A}";
        bytes memory utf8PatternSyntax301A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax301A));
        console2.log("301A: ", string(utf8PatternSyntax301A));
        console2.logBytes(utf8PatternSyntax301A);

        string memory patternSyntax301B = "\\u{301B}";
        bytes memory utf8PatternSyntax301B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax301B));
        console2.log("301B: ", string(utf8PatternSyntax301B));
        console2.logBytes(utf8PatternSyntax301B);

        string memory patternSyntax301C = "\\u{301C}";
        bytes memory utf8PatternSyntax301C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax301C));
        console2.log("301C: ", string(utf8PatternSyntax301C));
        console2.logBytes(utf8PatternSyntax301C);

        string memory patternSyntax301D = "\\u{301D}";
        bytes memory utf8PatternSyntax301D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax301D));
        console2.log("301D: ", string(utf8PatternSyntax301D));
        console2.logBytes(utf8PatternSyntax301D);

        string memory patternSyntax301E = "\\u{301E}";
        bytes memory utf8PatternSyntax301E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax301E));
        console2.log("301E: ", string(utf8PatternSyntax301E));
        console2.logBytes(utf8PatternSyntax301E);

        console2.log("..");

        string memory patternSyntax301F = "\\u{301F}";
        bytes memory utf8PatternSyntax301F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax301F));
        console2.log("301F: ", string(utf8PatternSyntax301F));
        console2.logBytes(utf8PatternSyntax301F);

        string memory patternSyntax3020 = "\\u{3020}";
        bytes memory utf8PatternSyntax3020 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3020));
        console2.log("3020: ", string(utf8PatternSyntax3020));
        console2.logBytes(utf8PatternSyntax3020);

        string memory patternSyntax3030 = "\\u{3030}";
        bytes memory utf8PatternSyntax3030 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntax3030));
        console2.log("3030: ", string(utf8PatternSyntax3030));
        console2.logBytes(utf8PatternSyntax3030);

        string memory patternSyntaxFD3E = "\\u{FD3E}";
        bytes memory utf8PatternSyntaxFD3E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntaxFD3E));
        console2.log("FD3E: ", string(utf8PatternSyntaxFD3E));
        console2.logBytes(utf8PatternSyntaxFD3E);

        string memory patternSyntaxFD3F = "\\u{FD3F}";
        bytes memory utf8PatternSyntaxFD3F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntaxFD3F));
        console2.log("FD3F: ", string(utf8PatternSyntaxFD3F));
        console2.logBytes(utf8PatternSyntaxFD3F);

        string memory patternSyntaxFE45 = "\\u{FE45}";
        bytes memory utf8PatternSyntaxFE45 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntaxFE45));
        console2.log("FE45: ", string(utf8PatternSyntaxFE45));
        console2.logBytes(utf8PatternSyntaxFE45);

        console2.log("..");

        string memory patternSyntaxFE46 = "\\u{FE46}";
        bytes memory utf8PatternSyntaxFE46 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(patternSyntaxFE46));
        console2.log("FE46: ", string(utf8PatternSyntaxFE46));
        console2.logBytes(utf8PatternSyntaxFE46);
    }

    function testRegexPropertyHexDigit() public pure {
        string memory hexDigit0030 = "\\u{0030}";
        bytes memory utf8HexDigit0030 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(hexDigit0030));
        console2.log("0030: ", string(utf8HexDigit0030));
        console2.logBytes(utf8HexDigit0030);

        console2.log("..");

        string memory hexDigit0039 = "\\u{0039}";
        bytes memory utf8HexDigit0039 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(hexDigit0039));
        console2.log("0039: ", string(utf8HexDigit0039));
        console2.logBytes(utf8HexDigit0039);

        string memory hexDigit0041 = "\\u{0041}";
        bytes memory utf8HexDigit0041 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(hexDigit0041));
        console2.log("0041: ", string(utf8HexDigit0041));
        console2.logBytes(utf8HexDigit0041);

        console2.log("..");

        string memory hexDigit0046 = "\\u{0046}";
        bytes memory utf8HexDigit0046 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(hexDigit0046));
        console2.log("0046: ", string(utf8HexDigit0046));
        console2.logBytes(utf8HexDigit0046);

        string memory hexDigit0061 = "\\u{0061}";
        bytes memory utf8HexDigit0061 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(hexDigit0061));
        console2.log("0061: ", string(utf8HexDigit0061));
        console2.logBytes(utf8HexDigit0061);

        console2.log("..");

        string memory hexDigit0066 = "\\u{0066}";
        bytes memory utf8HexDigit0066 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(hexDigit0066));
        console2.log("0066: ", string(utf8HexDigit0066));
        console2.logBytes(utf8HexDigit0066);

        string memory hexDigitFF10 = "\\u{FF10}";
        bytes memory utf8HexDigitFF10 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(hexDigitFF10));
        console2.log("FF10: ", string(utf8HexDigitFF10));
        console2.logBytes(utf8HexDigitFF10);

        console2.log("..");

        string memory hexDigitFF19 = "\\u{FF19}";
        bytes memory utf8HexDigitFF19 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(hexDigitFF19));
        console2.log("FF19: ", string(utf8HexDigitFF19));
        console2.logBytes(utf8HexDigitFF19);

        string memory hexDigitFF21 = "\\u{FF21}";
        bytes memory utf8HexDigitFF21 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(hexDigitFF21));
        console2.log("FF21: ", string(utf8HexDigitFF21));
        console2.logBytes(utf8HexDigitFF21);

        console2.log("..");

        string memory hexDigitFF26 = "\\u{FF26}";
        bytes memory utf8HexDigitFF26 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(hexDigitFF26));
        console2.log("FF26: ", string(utf8HexDigitFF26));
        console2.logBytes(utf8HexDigitFF26);

        string memory hexDigitFF41 = "\\u{FF41}";
        bytes memory utf8HexDigitFF41 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(hexDigitFF41));
        console2.log("FF41: ", string(utf8HexDigitFF41));
        console2.logBytes(utf8HexDigitFF41);

        console2.log("..");

        string memory hexDigitFF46 = "\\u{FF46}";
        bytes memory utf8HexDigitFF46 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(hexDigitFF46));
        console2.log("FF46: ", string(utf8HexDigitFF46));
        console2.logBytes(utf8HexDigitFF46);
    }

    function testRegexPropertyAsciiHexDigit() public pure {
        string memory asciiHexDigit0030 = "\\u{0030}";
        bytes memory utf8AsciiHexDigit0030 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(asciiHexDigit0030));
        console2.log("0030: ", string(utf8AsciiHexDigit0030));
        console2.logBytes(utf8AsciiHexDigit0030);

        console2.log("..");

        string memory asciiHexDigit0039 = "\\u{0039}";
        bytes memory utf8AsciiHexDigit0039 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(asciiHexDigit0039));
        console2.log("0039: ", string(utf8AsciiHexDigit0039));
        console2.logBytes(utf8AsciiHexDigit0039);

        string memory asciiHexDigit0041 = "\\u{0041}";
        bytes memory utf8AsciiHexDigit0041 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(asciiHexDigit0041));
        console2.log("0041: ", string(utf8AsciiHexDigit0041));
        console2.logBytes(utf8AsciiHexDigit0041);

        console2.log("..");

        string memory asciiHexDigit0046 = "\\u{0046}";
        bytes memory utf8AsciiHexDigit0046 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(asciiHexDigit0046));
        console2.log("0046: ", string(utf8AsciiHexDigit0046));
        console2.logBytes(utf8AsciiHexDigit0046);

        string memory asciiHexDigit0061 = "\\u{0061}";
        bytes memory utf8AsciiHexDigit0061 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(asciiHexDigit0061));
        console2.log("0061: ", string(utf8AsciiHexDigit0061));
        console2.logBytes(utf8AsciiHexDigit0061);

        console2.log("..");

        string memory asciiHexDigit0066 = "\\u{0066}";
        bytes memory utf8AsciiHexDigit0066 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(asciiHexDigit0066));
        console2.log("0066: ", string(utf8AsciiHexDigit0066));
        console2.logBytes(utf8AsciiHexDigit0066);
    }

    function testRegexPropertyIdeographic() public pure {
        string memory ideographic3006 = "\\u{3006}";
        bytes memory utf8Ideographic3006 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic3006));
        console2.log("3006: ", string(utf8Ideographic3006));
        console2.logBytes(utf8Ideographic3006);

        string memory ideographic3007 = "\\u{3007}";
        bytes memory utf8Ideographic3007 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic3007));
        console2.log("3007: ", string(utf8Ideographic3007));
        console2.logBytes(utf8Ideographic3007);

        string memory ideographic3021 = "\\u{3021}";
        bytes memory utf8Ideographic3021 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic3021));
        console2.log("3021: ", string(utf8Ideographic3021));
        console2.logBytes(utf8Ideographic3021);

        console2.log("..");

        string memory ideographic3029 = "\\u{3029}";
        bytes memory utf8Ideographic3029 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic3029));
        console2.log("3029: ", string(utf8Ideographic3029));
        console2.logBytes(utf8Ideographic3029);

        string memory ideographic3038 = "\\u{3038}";
        bytes memory utf8Ideographic3038 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic3038));
        console2.log("3038: ", string(utf8Ideographic3038));
        console2.logBytes(utf8Ideographic3038);

        console2.log("..");

        string memory ideographic303A = "\\u{303A}";
        bytes memory utf8Ideographic303A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic303A));
        console2.log("303A: ", string(utf8Ideographic303A));
        console2.logBytes(utf8Ideographic303A);

        string memory ideographic3400 = "\\u{3400}";
        bytes memory utf8Ideographic3400 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic3400));
        console2.log("3400: ", string(utf8Ideographic3400));
        console2.logBytes(utf8Ideographic3400);

        console2.log("..");

        string memory ideographic4DBF = "\\u{4DBF}";
        bytes memory utf8Ideographic4DBF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic4DBF));
        console2.log("4DBF: ", string(utf8Ideographic4DBF));
        console2.logBytes(utf8Ideographic4DBF);

        string memory ideographic4E00 = "\\u{4E00}";
        bytes memory utf8Ideographic4E00 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic4E00));
        console2.log("4E00: ", string(utf8Ideographic4E00));
        console2.logBytes(utf8Ideographic4E00);

        console2.log("..");

        string memory ideographic9FFF = "\\u{9FFF}";
        bytes memory utf8Ideographic9FFF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic9FFF));
        console2.log("9FFF: ", string(utf8Ideographic9FFF));
        console2.logBytes(utf8Ideographic9FFF);

        string memory ideographicF900 = "\\u{F900}";
        bytes memory utf8IdeographicF900 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographicF900));
        console2.log("F900: ", string(utf8IdeographicF900));
        console2.logBytes(utf8IdeographicF900);

        console2.log("..");

        string memory ideographicFA6D = "\\u{FA6D}";
        bytes memory utf8IdeographicFA6D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographicFA6D));
        console2.log("FA6D: ", string(utf8IdeographicFA6D));
        console2.logBytes(utf8IdeographicFA6D);

        string memory ideographicFA70 = "\\u{FA70}";
        bytes memory utf8IdeographicFA70 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographicFA70));
        console2.log("FA70: ", string(utf8IdeographicFA70));
        console2.logBytes(utf8IdeographicFA70);

        console2.log("..");

        string memory ideographicFAD9 = "\\u{FAD9}";
        bytes memory utf8IdeographicFAD9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographicFAD9));
        console2.log("FAD9: ", string(utf8IdeographicFAD9));
        console2.logBytes(utf8IdeographicFAD9);

        string memory ideographic16FE4 = "\\u{16FE4}";
        bytes memory utf8Ideographic16FE4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic16FE4));
        console2.log("16FE4: ", string(utf8Ideographic16FE4));
        console2.logBytes(utf8Ideographic16FE4);

        string memory ideographic16FF2 = "\\u{16FF2}";
        bytes memory utf8Ideographic16FF2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic16FF2));
        console2.log("16FF2: ", string(utf8Ideographic16FF2));
        console2.logBytes(utf8Ideographic16FF2);

        console2.log("..");

        string memory ideographic16FF3 = "\\u{16FF3}";
        bytes memory utf8Ideographic16FF3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic16FF3));
        console2.log("16FF3: ", string(utf8Ideographic16FF3));
        console2.logBytes(utf8Ideographic16FF3);

        string memory ideographic16FF4 = "\\u{16FF4}";
        bytes memory utf8Ideographic16FF4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic16FF4));
        console2.log("16FF4: ", string(utf8Ideographic16FF4));
        console2.logBytes(utf8Ideographic16FF4);

        console2.log("..");

        string memory ideographic16FF6 = "\\u{16FF6}";
        bytes memory utf8Ideographic16FF6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic16FF6));
        console2.log("16FF6: ", string(utf8Ideographic16FF6));
        console2.logBytes(utf8Ideographic16FF6);

        string memory ideographic17000 = "\\u{17000}";
        bytes memory utf8Ideographic17000 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic17000));
        console2.log("17000: ", string(utf8Ideographic17000));
        console2.logBytes(utf8Ideographic17000);

        console2.log("..");

        string memory ideographic18CD5 = "\\u{18CD5}";
        bytes memory utf8Ideographic18CD5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic18CD5));
        console2.log("18CD5: ", string(utf8Ideographic18CD5));
        console2.logBytes(utf8Ideographic18CD5);

        string memory ideographic18CFF = "\\u{18CFF}";
        bytes memory utf8Ideographic18CFF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic18CFF));
        console2.log("18CFF: ", string(utf8Ideographic18CFF));
        console2.logBytes(utf8Ideographic18CFF);

        console2.log("..");

        string memory ideographic18D1E = "\\u{18D1E}";
        bytes memory utf8Ideographic18D1E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic18D1E));
        console2.log("18D1E: ", string(utf8Ideographic18D1E));
        console2.logBytes(utf8Ideographic18D1E);

        string memory ideographic18D80 = "\\u{18D80}";
        bytes memory utf8Ideographic18D80 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic18D80));
        console2.log("18D80: ", string(utf8Ideographic18D80));
        console2.logBytes(utf8Ideographic18D80);

        console2.log("..");

        string memory ideographic18DF2 = "\\u{18DF2}";
        bytes memory utf8Ideographic18DF2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic18DF2));
        console2.log("18DF2: ", string(utf8Ideographic18DF2));
        console2.logBytes(utf8Ideographic18DF2);

        string memory ideographic1B170 = "\\u{1B170}";
        bytes memory utf8Ideographic1B170 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic1B170));
        console2.log("1B170: ", string(utf8Ideographic1B170));
        console2.logBytes(utf8Ideographic1B170);

        console2.log("..");

        string memory ideographic1B2FB = "\\u{1B2FB}";
        bytes memory utf8Ideographic1B2FB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic1B2FB));
        console2.log("1B2FB: ", string(utf8Ideographic1B2FB));
        console2.logBytes(utf8Ideographic1B2FB);

        string memory ideographic20000 = "\\u{20000}";
        bytes memory utf8Ideographic20000 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic20000));
        console2.log("20000: ", string(utf8Ideographic20000));
        console2.logBytes(utf8Ideographic20000);

        console2.log("..");

        string memory ideographic2A6DF = "\\u{2A6DF}";
        bytes memory utf8Ideographic2A6DF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic2A6DF));
        console2.log("2A6DF: ", string(utf8Ideographic2A6DF));
        console2.logBytes(utf8Ideographic2A6DF);

        string memory ideographic2A700 = "\\u{2A700}";
        bytes memory utf8Ideographic2A700 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic2A700));
        console2.log("2A700: ", string(utf8Ideographic2A700));
        console2.logBytes(utf8Ideographic2A700);

        console2.log("..");

        string memory ideographic2B81D = "\\u{2B81D}";
        bytes memory utf8Ideographic2B81D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic2B81D));
        console2.log("2B81D: ", string(utf8Ideographic2B81D));
        console2.logBytes(utf8Ideographic2B81D);

        string memory ideographic2B820 = "\\u{2B820}";
        bytes memory utf8Ideographic2B820 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic2B820));
        console2.log("2B820: ", string(utf8Ideographic2B820));
        console2.logBytes(utf8Ideographic2B820);

        console2.log("..");

        string memory ideographic2CEAD = "\\u{2CEAD}";
        bytes memory utf8Ideographic2CEAD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic2CEAD));
        console2.log("2CEAD: ", string(utf8Ideographic2CEAD));
        console2.logBytes(utf8Ideographic2CEAD);

        string memory ideographic2CEB0 = "\\u{2CEB0}";
        bytes memory utf8Ideographic2CEB0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic2CEB0));
        console2.log("2CEB0: ", string(utf8Ideographic2CEB0));
        console2.logBytes(utf8Ideographic2CEB0);

        console2.log("..");

        string memory ideographic2EBE0 = "\\u{2EBE0}";
        bytes memory utf8Ideographic2EBE0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic2EBE0));
        console2.log("2EBE0: ", string(utf8Ideographic2EBE0));
        console2.logBytes(utf8Ideographic2EBE0);

        string memory ideographic2EBF0 = "\\u{2EBF0}";
        bytes memory utf8Ideographic2EBF0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic2EBF0));
        console2.log("2EBF0: ", string(utf8Ideographic2EBF0));
        console2.logBytes(utf8Ideographic2EBF0);

        console2.log("..");

        string memory ideographic2EE5D = "\\u{2EE5D}";
        bytes memory utf8Ideographic2EE5D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic2EE5D));
        console2.log("2EE5D: ", string(utf8Ideographic2EE5D));
        console2.logBytes(utf8Ideographic2EE5D);

        string memory ideographic2F800 = "\\u{2F800}";
        bytes memory utf8Ideographic2F800 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic2F800));
        console2.log("2F800: ", string(utf8Ideographic2F800));
        console2.logBytes(utf8Ideographic2F800);

        console2.log("..");

        string memory ideographic2FA1D = "\\u{2FA1D}";
        bytes memory utf8Ideographic2FA1D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic2FA1D));
        console2.log("2FA1D: ", string(utf8Ideographic2FA1D));
        console2.logBytes(utf8Ideographic2FA1D);

        string memory ideographic30000 = "\\u{30000}";
        bytes memory utf8Ideographic30000 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic30000));
        console2.log("30000: ", string(utf8Ideographic30000));
        console2.logBytes(utf8Ideographic30000);

        console2.log("..");

        string memory ideographic3134A = "\\u{3134A}";
        bytes memory utf8Ideographic3134A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic3134A));
        console2.log("3134A: ", string(utf8Ideographic3134A));
        console2.logBytes(utf8Ideographic3134A);

        string memory ideographic31350 = "\\u{31350}";
        bytes memory utf8Ideographic31350 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic31350));
        console2.log("31350: ", string(utf8Ideographic31350));
        console2.logBytes(utf8Ideographic31350);

        console2.log("..");

        string memory ideographic33479 = "\\u{33479}";
        bytes memory utf8Ideographic33479 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(ideographic33479));
        console2.log("33479: ", string(utf8Ideographic33479));
        console2.logBytes(utf8Ideographic33479);
    }

    function testRegexPropertyExtender() public pure {
        string memory extender00B7 = "\\u{00B7}";
        bytes memory utf8Extender00B7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender00B7));
        console2.log("00B7: ", string(utf8Extender00B7));
        console2.logBytes(utf8Extender00B7);

        string memory extender02D0 = "\\u{02D0}";
        bytes memory utf8Extender02D0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender02D0));
        console2.log("02D0: ", string(utf8Extender02D0));
        console2.logBytes(utf8Extender02D0);

        console2.log("..");

        string memory extender02D1 = "\\u{02D1}";
        bytes memory utf8Extender02D1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender02D1));
        console2.log("02D1: ", string(utf8Extender02D1));
        console2.logBytes(utf8Extender02D1);

        string memory extender0640 = "\\u{0640}";
        bytes memory utf8Extender0640 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender0640));
        console2.log("0640: ", string(utf8Extender0640));
        console2.logBytes(utf8Extender0640);

        string memory extender07FA = "\\u{07FA}";
        bytes memory utf8Extender07FA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender07FA));
        console2.log("07FA: ", string(utf8Extender07FA));
        console2.logBytes(utf8Extender07FA);

        string memory extender0A71 = "\\u{0A71}";
        bytes memory utf8Extender0A71 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender0A71));
        console2.log("0A71: ", string(utf8Extender0A71));
        console2.logBytes(utf8Extender0A71);

        string memory extender0AFB = "\\u{0AFB}";
        bytes memory utf8Extender0AFB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender0AFB));
        console2.log("0AFB: ", string(utf8Extender0AFB));
        console2.logBytes(utf8Extender0AFB);

        string memory extender0B55 = "\\u{0B55}";
        bytes memory utf8Extender0B55 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender0B55));
        console2.log("0B55: ", string(utf8Extender0B55));
        console2.logBytes(utf8Extender0B55);

        string memory extender0E46 = "\\u{0E46}";
        bytes memory utf8Extender0E46 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender0E46));
        console2.log("0E46: ", string(utf8Extender0E46));
        console2.logBytes(utf8Extender0E46);

        string memory extender0EC6 = "\\u{0EC6}";
        bytes memory utf8Extender0EC6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender0EC6));
        console2.log("0EC6: ", string(utf8Extender0EC6));
        console2.logBytes(utf8Extender0EC6);

        string memory extender180A = "\\u{180A}";
        bytes memory utf8Extender180A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender180A));
        console2.log("180A: ", string(utf8Extender180A));
        console2.logBytes(utf8Extender180A);

        string memory extender1843 = "\\u{1843}";
        bytes memory utf8Extender1843 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender1843));
        console2.log("1843: ", string(utf8Extender1843));
        console2.logBytes(utf8Extender1843);

        string memory extender1AA7 = "\\u{1AA7}";
        bytes memory utf8Extender1AA7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender1AA7));
        console2.log("1AA7: ", string(utf8Extender1AA7));
        console2.logBytes(utf8Extender1AA7);

        string memory extender1C36 = "\\u{1C36}";
        bytes memory utf8Extender1C36 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender1C36));
        console2.log("1C36: ", string(utf8Extender1C36));
        console2.logBytes(utf8Extender1C36);

        string memory extender1C7B = "\\u{1C7B}";
        bytes memory utf8Extender1C7B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender1C7B));
        console2.log("1C7B: ", string(utf8Extender1C7B));
        console2.logBytes(utf8Extender1C7B);

        string memory extender3005 = "\\u{3005}";
        bytes memory utf8Extender3005 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender3005));
        console2.log("3005: ", string(utf8Extender3005));
        console2.logBytes(utf8Extender3005);

        string memory extender3031 = "\\u{3031}";
        bytes memory utf8Extender3031 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender3031));
        console2.log("3031: ", string(utf8Extender3031));
        console2.logBytes(utf8Extender3031);

        console2.log("..");

        string memory extender3035 = "\\u{3035}";
        bytes memory utf8Extender3035 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender3035));
        console2.log("3035: ", string(utf8Extender3035));
        console2.logBytes(utf8Extender3035);

        string memory extender309D = "\\u{309D}";
        bytes memory utf8Extender309D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender309D));
        console2.log("309D: ", string(utf8Extender309D));
        console2.logBytes(utf8Extender309D);

        console2.log("..");

        string memory extender309E = "\\u{309E}";
        bytes memory utf8Extender309E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender309E));
        console2.log("309E: ", string(utf8Extender309E));
        console2.logBytes(utf8Extender309E);

        string memory extender30FC = "\\u{30FC}";
        bytes memory utf8Extender30FC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender30FC));
        console2.log("30FC: ", string(utf8Extender30FC));
        console2.logBytes(utf8Extender30FC);

        console2.log("..");

        string memory extender30FE = "\\u{30FE}";
        bytes memory utf8Extender30FE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender30FE));
        console2.log("30FE: ", string(utf8Extender30FE));
        console2.logBytes(utf8Extender30FE);

        string memory extenderA015 = "\\u{A015}";
        bytes memory utf8ExtenderA015 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extenderA015));
        console2.log("A015: ", string(utf8ExtenderA015));
        console2.logBytes(utf8ExtenderA015);

        string memory extenderA60C = "\\u{A60C}";
        bytes memory utf8ExtenderA60C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extenderA60C));
        console2.log("A60C: ", string(utf8ExtenderA60C));
        console2.logBytes(utf8ExtenderA60C);

        string memory extenderA9CF = "\\u{A9CF}";
        bytes memory utf8ExtenderA9CF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extenderA9CF));
        console2.log("A9CF: ", string(utf8ExtenderA9CF));
        console2.logBytes(utf8ExtenderA9CF);

        string memory extenderA9E6 = "\\u{A9E6}";
        bytes memory utf8ExtenderA9E6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extenderA9E6));
        console2.log("A9E6: ", string(utf8ExtenderA9E6));
        console2.logBytes(utf8ExtenderA9E6);

        string memory extenderAA70 = "\\u{AA70}";
        bytes memory utf8ExtenderAA70 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extenderAA70));
        console2.log("AA70: ", string(utf8ExtenderAA70));
        console2.logBytes(utf8ExtenderAA70);

        string memory extenderAADD = "\\u{AADD}";
        bytes memory utf8ExtenderAADD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extenderAADD));
        console2.log("AADD: ", string(utf8ExtenderAADD));
        console2.logBytes(utf8ExtenderAADD);

        string memory extenderAAF3 = "\\u{AAF3}";
        bytes memory utf8ExtenderAAF3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extenderAAF3));
        console2.log("AAF3: ", string(utf8ExtenderAAF3));
        console2.logBytes(utf8ExtenderAAF3);

        console2.log("..");

        string memory extenderAAF4 = "\\u{AAF4}";
        bytes memory utf8ExtenderAAF4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extenderAAF4));
        console2.log("AAF4: ", string(utf8ExtenderAAF4));
        console2.logBytes(utf8ExtenderAAF4);

        string memory extenderFF70 = "\\u{FF70}";
        bytes memory utf8ExtenderFF70 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extenderFF70));
        console2.log("FF70: ", string(utf8ExtenderFF70));
        console2.logBytes(utf8ExtenderFF70);

        string memory extender10781 = "\\u{10781}";
        bytes memory utf8Extender10781 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender10781));
        console2.log("10781: ", string(utf8Extender10781));
        console2.logBytes(utf8Extender10781);

        console2.log("..");

        string memory extender10782 = "\\u{10782}";
        bytes memory utf8Extender10782 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender10782));
        console2.log("10782: ", string(utf8Extender10782));
        console2.logBytes(utf8Extender10782);

        string memory extender10D4E = "\\u{10D4E}";
        bytes memory utf8Extender10D4E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender10D4E));
        console2.log("10D4E: ", string(utf8Extender10D4E));
        console2.logBytes(utf8Extender10D4E);

        string memory extender10D6A = "\\u{10D6A}";
        bytes memory utf8Extender10D6A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender10D6A));
        console2.log("10D6A: ", string(utf8Extender10D6A));
        console2.logBytes(utf8Extender10D6A);

        string memory extender10D6F = "\\u{10D6F}";
        bytes memory utf8Extender10D6F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender10D6F));
        console2.log("10D6F: ", string(utf8Extender10D6F));
        console2.logBytes(utf8Extender10D6F);

        string memory extender11237 = "\\u{11237}";
        bytes memory utf8Extender11237 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender11237));
        console2.log("11237: ", string(utf8Extender11237));
        console2.logBytes(utf8Extender11237);

        string memory extender1135D = "\\u{1135D}";
        bytes memory utf8Extender1135D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender1135D));
        console2.log("1135D: ", string(utf8Extender1135D));
        console2.logBytes(utf8Extender1135D);

        string memory extender113D2 = "\\u{113D2}";
        bytes memory utf8Extender113D2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender113D2));
        console2.log("113D2: ", string(utf8Extender113D2));
        console2.logBytes(utf8Extender113D2);

        string memory extender113D3 = "\\u{113D3}";
        bytes memory utf8Extender113D3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender113D3));
        console2.log("113D3: ", string(utf8Extender113D3));
        console2.logBytes(utf8Extender113D3);

        string memory extender115C6 = "\\u{115C6}";
        bytes memory utf8Extender115C6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender115C6));
        console2.log("115C6: ", string(utf8Extender115C6));
        console2.logBytes(utf8Extender115C6);

        console2.log("..");

        string memory extender115C8 = "\\u{115C8}";
        bytes memory utf8Extender115C8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender115C8));
        console2.log("115C8: ", string(utf8Extender115C8));
        console2.logBytes(utf8Extender115C8);

        string memory extender11A98 = "\\u{11A98}";
        bytes memory utf8Extender11A98 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender11A98));
        console2.log("11A98: ", string(utf8Extender11A98));
        console2.logBytes(utf8Extender11A98);

        string memory extender11DD9 = "\\u{11DD9}";
        bytes memory utf8Extender11DD9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender11DD9));
        console2.log("11DD9: ", string(utf8Extender11DD9));
        console2.logBytes(utf8Extender11DD9);

        string memory extender16B42 = "\\u{16B42}";
        bytes memory utf8Extender16B42 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender16B42));
        console2.log("16B42: ", string(utf8Extender16B42));
        console2.logBytes(utf8Extender16B42);

        console2.log("..");

        string memory extender16B43 = "\\u{16B43}";
        bytes memory utf8Extender16B43 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender16B43));
        console2.log("16B43: ", string(utf8Extender16B43));
        console2.logBytes(utf8Extender16B43);

        string memory extender16FE0 = "\\u{16FE0}";
        bytes memory utf8Extender16FE0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender16FE0));
        console2.log("16FE0: ", string(utf8Extender16FE0));
        console2.logBytes(utf8Extender16FE0);

        console2.log("..");

        string memory extender16FE1 = "\\u{16FE1}";
        bytes memory utf8Extender16FE1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender16FE1));
        console2.log("16FE1: ", string(utf8Extender16FE1));
        console2.logBytes(utf8Extender16FE1);

        string memory extender16FE3 = "\\u{16FE3}";
        bytes memory utf8Extender16FE3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender16FE3));
        console2.log("16FE3: ", string(utf8Extender16FE3));
        console2.logBytes(utf8Extender16FE3);

        string memory extender16FF2 = "\\u{16FF2}";
        bytes memory utf8Extender16FF2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender16FF2));
        console2.log("16FF2: ", string(utf8Extender16FF2));
        console2.logBytes(utf8Extender16FF2);

        console2.log("..");

        string memory extender16FF3 = "\\u{16FF3}";
        bytes memory utf8Extender16FF3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender16FF3));
        console2.log("16FF3: ", string(utf8Extender16FF3));
        console2.logBytes(utf8Extender16FF3);

        string memory extender1E13C = "\\u{1E13C}";
        bytes memory utf8Extender1E13C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender1E13C));
        console2.log("1E13C: ", string(utf8Extender1E13C));
        console2.logBytes(utf8Extender1E13C);

        console2.log("..");

        string memory extender1E13D = "\\u{1E13D}";
        bytes memory utf8Extender1E13D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender1E13D));
        console2.log("1E13D: ", string(utf8Extender1E13D));
        console2.logBytes(utf8Extender1E13D);

        string memory extender1E5EF = "\\u{1E5EF}";
        bytes memory utf8Extender1E5EF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender1E5EF));
        console2.log("1E5EF: ", string(utf8Extender1E5EF));
        console2.logBytes(utf8Extender1E5EF);

        string memory extender1E944 = "\\u{1E944}";
        bytes memory utf8Extender1E944 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender1E944));
        console2.log("1E944: ", string(utf8Extender1E944));
        console2.logBytes(utf8Extender1E944);

        console2.log("..");

        string memory extender1E946 = "\\u{1E946}";
        bytes memory utf8Extender1E946 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(extender1E946));
        console2.log("1E946: ", string(utf8Extender1E946));
        console2.logBytes(utf8Extender1E946);
    }

    function testRegexPropertyOtherLowercase() public pure {
        string memory otherLowercase00AA = "\\u{00AA}";
        bytes memory utf8OtherLowercase00AA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase00AA));
        console2.log("00AA: ", string(utf8OtherLowercase00AA));
        console2.logBytes(utf8OtherLowercase00AA);

        string memory otherLowercase00BA = "\\u{00BA}";
        bytes memory utf8OtherLowercase00BA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase00BA));
        console2.log("00BA: ", string(utf8OtherLowercase00BA));
        console2.logBytes(utf8OtherLowercase00BA);

        string memory otherLowercase02B0 = "\\u{02B0}";
        bytes memory utf8OtherLowercase02B0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase02B0));
        console2.log("02B0: ", string(utf8OtherLowercase02B0));
        console2.logBytes(utf8OtherLowercase02B0);

        console2.log("..");

        string memory otherLowercase02B8 = "\\u{02B8}";
        bytes memory utf8OtherLowercase02B8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase02B8));
        console2.log("02B8: ", string(utf8OtherLowercase02B8));
        console2.logBytes(utf8OtherLowercase02B8);

        string memory otherLowercase02C0 = "\\u{02C0}";
        bytes memory utf8OtherLowercase02C0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase02C0));
        console2.log("02C0: ", string(utf8OtherLowercase02C0));
        console2.logBytes(utf8OtherLowercase02C0);

        console2.log("..");

        string memory otherLowercase02C1 = "\\u{02C1}";
        bytes memory utf8OtherLowercase02C1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase02C1));
        console2.log("02C1: ", string(utf8OtherLowercase02C1));
        console2.logBytes(utf8OtherLowercase02C1);

        string memory otherLowercase02E0 = "\\u{02E0}";
        bytes memory utf8OtherLowercase02E0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase02E0));
        console2.log("02E0: ", string(utf8OtherLowercase02E0));
        console2.logBytes(utf8OtherLowercase02E0);

        console2.log("..");

        string memory otherLowercase02E4 = "\\u{02E4}";
        bytes memory utf8OtherLowercase02E4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase02E4));
        console2.log("02E4: ", string(utf8OtherLowercase02E4));
        console2.logBytes(utf8OtherLowercase02E4);

        string memory otherLowercase0345 = "\\u{0345}";
        bytes memory utf8OtherLowercase0345 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase0345));
        console2.log("0345: ", string(utf8OtherLowercase0345));
        console2.logBytes(utf8OtherLowercase0345);

        string memory otherLowercase037A = "\\u{037A}";
        bytes memory utf8OtherLowercase037A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase037A));
        console2.log("037A: ", string(utf8OtherLowercase037A));
        console2.logBytes(utf8OtherLowercase037A);

        string memory otherLowercase10FC = "\\u{10FC}";
        bytes memory utf8OtherLowercase10FC = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase10FC));
        console2.log("10FC: ", string(utf8OtherLowercase10FC));
        console2.logBytes(utf8OtherLowercase10FC);

        string memory otherLowercase1D2C = "\\u{1D2C}";
        bytes memory utf8OtherLowercase1D2C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase1D2C));
        console2.log("1D2C: ", string(utf8OtherLowercase1D2C));
        console2.logBytes(utf8OtherLowercase1D2C);

        console2.log("..");

        string memory otherLowercase1D6A = "\\u{1D6A}";
        bytes memory utf8OtherLowercase1D6A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase1D6A));
        console2.log("1D6A: ", string(utf8OtherLowercase1D6A));
        console2.logBytes(utf8OtherLowercase1D6A);

        string memory otherLowercase1D78 = "\\u{1D78}";
        bytes memory utf8OtherLowercase1D78 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase1D78));
        console2.log("1D78: ", string(utf8OtherLowercase1D78));
        console2.logBytes(utf8OtherLowercase1D78);

        string memory otherLowercase1D9B = "\\u{1D9B}";
        bytes memory utf8OtherLowercase1D9B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase1D9B));
        console2.log("1D9B: ", string(utf8OtherLowercase1D9B));
        console2.logBytes(utf8OtherLowercase1D9B);

        console2.log("..");

        string memory otherLowercase1DBF = "\\u{1DBF}";
        bytes memory utf8OtherLowercase1DBF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase1DBF));
        console2.log("1DBF: ", string(utf8OtherLowercase1DBF));
        console2.logBytes(utf8OtherLowercase1DBF);

        string memory otherLowercase2071 = "\\u{2071}";
        bytes memory utf8OtherLowercase2071 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase2071));
        console2.log("2071: ", string(utf8OtherLowercase2071));
        console2.logBytes(utf8OtherLowercase2071);

        string memory otherLowercase207F = "\\u{207F}";
        bytes memory utf8OtherLowercase207F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase207F));
        console2.log("207F: ", string(utf8OtherLowercase207F));
        console2.logBytes(utf8OtherLowercase207F);

        string memory otherLowercase2090 = "\\u{2090}";
        bytes memory utf8OtherLowercase2090 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase2090));
        console2.log("2090: ", string(utf8OtherLowercase2090));
        console2.logBytes(utf8OtherLowercase2090);

        console2.log("..");

        string memory otherLowercase209C = "\\u{209C}";
        bytes memory utf8OtherLowercase209C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase209C));
        console2.log("209C: ", string(utf8OtherLowercase209C));
        console2.logBytes(utf8OtherLowercase209C);

        string memory otherLowercase2170 = "\\u{2170}";
        bytes memory utf8OtherLowercase2170 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase2170));
        console2.log("2170: ", string(utf8OtherLowercase2170));
        console2.logBytes(utf8OtherLowercase2170);

        console2.log("..");

        string memory otherLowercase217F = "\\u{217F}";
        bytes memory utf8OtherLowercase217F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase217F));
        console2.log("217F: ", string(utf8OtherLowercase217F));
        console2.logBytes(utf8OtherLowercase217F);

        string memory otherLowercase24D0 = "\\u{24D0}";
        bytes memory utf8OtherLowercase24D0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase24D0));
        console2.log("24D0: ", string(utf8OtherLowercase24D0));
        console2.logBytes(utf8OtherLowercase24D0);

        console2.log("..");

        string memory otherLowercase24E9 = "\\u{24E9}";
        bytes memory utf8OtherLowercase24E9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase24E9));
        console2.log("24E9: ", string(utf8OtherLowercase24E9));
        console2.logBytes(utf8OtherLowercase24E9);

        string memory otherLowercase2C7C = "\\u{2C7C}";
        bytes memory utf8OtherLowercase2C7C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase2C7C));
        console2.log("2C7C: ", string(utf8OtherLowercase2C7C));
        console2.logBytes(utf8OtherLowercase2C7C);

        console2.log("..");

        string memory otherLowercase2C7D = "\\u{2C7D}";
        bytes memory utf8OtherLowercase2C7D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase2C7D));
        console2.log("2C7D: ", string(utf8OtherLowercase2C7D));
        console2.logBytes(utf8OtherLowercase2C7D);

        string memory otherLowercaseA69C = "\\u{A69C}";
        bytes memory utf8OtherLowercaseA69C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercaseA69C));
        console2.log("A69C: ", string(utf8OtherLowercaseA69C));
        console2.logBytes(utf8OtherLowercaseA69C);

        console2.log("..");

        string memory otherLowercaseA69D = "\\u{A69D}";
        bytes memory utf8OtherLowercaseA69D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercaseA69D));
        console2.log("A69D: ", string(utf8OtherLowercaseA69D));
        console2.logBytes(utf8OtherLowercaseA69D);

        string memory otherLowercaseA770 = "\\u{A770}";
        bytes memory utf8OtherLowercaseA770 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercaseA770));
        console2.log("A770: ", string(utf8OtherLowercaseA770));
        console2.logBytes(utf8OtherLowercaseA770);

        string memory otherLowercaseA7F1 = "\\u{A7F1}";
        bytes memory utf8OtherLowercaseA7F1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercaseA7F1));
        console2.log("A7F1: ", string(utf8OtherLowercaseA7F1));
        console2.logBytes(utf8OtherLowercaseA7F1);

        console2.log("..");

        string memory otherLowercaseA7F4 = "\\u{A7F4}";
        bytes memory utf8OtherLowercaseA7F4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercaseA7F4));
        console2.log("A7F4: ", string(utf8OtherLowercaseA7F4));
        console2.logBytes(utf8OtherLowercaseA7F4);

        string memory otherLowercaseA7F8 = "\\u{A7F8}";
        bytes memory utf8OtherLowercaseA7F8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercaseA7F8));
        console2.log("A7F8: ", string(utf8OtherLowercaseA7F8));
        console2.logBytes(utf8OtherLowercaseA7F8);

        console2.log("..");

        string memory otherLowercaseA7F9 = "\\u{A7F9}";
        bytes memory utf8OtherLowercaseA7F9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercaseA7F9));
        console2.log("A7F9: ", string(utf8OtherLowercaseA7F9));
        console2.logBytes(utf8OtherLowercaseA7F9);

        string memory otherLowercaseAB5C = "\\u{AB5C}";
        bytes memory utf8OtherLowercaseAB5C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercaseAB5C));
        console2.log("AB5C: ", string(utf8OtherLowercaseAB5C));
        console2.logBytes(utf8OtherLowercaseAB5C);

        console2.log("..");

        string memory otherLowercaseAB5F = "\\u{AB5F}";
        bytes memory utf8OtherLowercaseAB5F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercaseAB5F));
        console2.log("AB5F: ", string(utf8OtherLowercaseAB5F));
        console2.logBytes(utf8OtherLowercaseAB5F);

        string memory otherLowercaseAB69 = "\\u{AB69}";
        bytes memory utf8OtherLowercaseAB69 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercaseAB69));
        console2.log("AB69: ", string(utf8OtherLowercaseAB69));
        console2.logBytes(utf8OtherLowercaseAB69);

        string memory otherLowercase10780 = "\\u{10780}";
        bytes memory utf8OtherLowercase10780 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase10780));
        console2.log("10780: ", string(utf8OtherLowercase10780));
        console2.logBytes(utf8OtherLowercase10780);

        string memory otherLowercase10783 = "\\u{10783}";
        bytes memory utf8OtherLowercase10783 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase10783));
        console2.log("10783: ", string(utf8OtherLowercase10783));
        console2.logBytes(utf8OtherLowercase10783);

        console2.log("..");

        string memory otherLowercase10785 = "\\u{10785}";
        bytes memory utf8OtherLowercase10785 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase10785));
        console2.log("10785: ", string(utf8OtherLowercase10785));
        console2.logBytes(utf8OtherLowercase10785);

        string memory otherLowercase10787 = "\\u{10787}";
        bytes memory utf8OtherLowercase10787 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase10787));
        console2.log("10787: ", string(utf8OtherLowercase10787));
        console2.logBytes(utf8OtherLowercase10787);

        console2.log("..");

        string memory otherLowercase107B0 = "\\u{107B0}";
        bytes memory utf8OtherLowercase107B0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase107B0));
        console2.log("107B0: ", string(utf8OtherLowercase107B0));
        console2.logBytes(utf8OtherLowercase107B0);

        string memory otherLowercase107B2 = "\\u{107B2}";
        bytes memory utf8OtherLowercase107B2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase107B2));
        console2.log("107B2: ", string(utf8OtherLowercase107B2));
        console2.logBytes(utf8OtherLowercase107B2);

        console2.log("..");

        string memory otherLowercase107BA = "\\u{107BA}";
        bytes memory utf8OtherLowercase107BA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase107BA));
        console2.log("107BA: ", string(utf8OtherLowercase107BA));
        console2.logBytes(utf8OtherLowercase107BA);

        string memory otherLowercase1E030 = "\\u{1E030}";
        bytes memory utf8OtherLowercase1E030 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase1E030));
        console2.log("1E030: ", string(utf8OtherLowercase1E030));
        console2.logBytes(utf8OtherLowercase1E030);

        console2.log("..");

        string memory otherLowercase1E06D = "\\u{1E06D}";
        bytes memory utf8OtherLowercase1E06D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherLowercase1E06D));
        console2.log("1E06D: ", string(utf8OtherLowercase1E06D));
        console2.logBytes(utf8OtherLowercase1E06D);
    }

    function testRegexPropertyOtherUppercase() public pure {
        string memory otherUppercase2160 = "\\u{2160}";
        bytes memory utf8OtherUppercase2160 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherUppercase2160));
        console2.log("2160: ", string(utf8OtherUppercase2160));
        console2.logBytes(utf8OtherUppercase2160);

        console2.log("..");

        string memory otherUppercase216F = "\\u{216F}";
        bytes memory utf8OtherUppercase216F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherUppercase216F));
        console2.log("216F: ", string(utf8OtherUppercase216F));
        console2.logBytes(utf8OtherUppercase216F);

        string memory otherUppercase24B6 = "\\u{24B6}";
        bytes memory utf8OtherUppercase24B6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherUppercase24B6));
        console2.log("24B6: ", string(utf8OtherUppercase24B6));
        console2.logBytes(utf8OtherUppercase24B6);

        console2.log("..");

        string memory otherUppercase24CF = "\\u{24CF}";
        bytes memory utf8OtherUppercase24CF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherUppercase24CF));
        console2.log("24CF: ", string(utf8OtherUppercase24CF));
        console2.logBytes(utf8OtherUppercase24CF);

        string memory otherUppercase1F130 = "\\u{1F130}";
        bytes memory utf8OtherUppercase1F130 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherUppercase1F130));
        console2.log("1F130: ", string(utf8OtherUppercase1F130));
        console2.logBytes(utf8OtherUppercase1F130);

        console2.log("..");

        string memory otherUppercase1F149 = "\\u{1F149}";
        bytes memory utf8OtherUppercase1F149 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherUppercase1F149));
        console2.log("1F149: ", string(utf8OtherUppercase1F149));
        console2.logBytes(utf8OtherUppercase1F149);

        string memory otherUppercase1F150 = "\\u{1F150}";
        bytes memory utf8OtherUppercase1F150 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherUppercase1F150));
        console2.log("1F150: ", string(utf8OtherUppercase1F150));
        console2.logBytes(utf8OtherUppercase1F150);

        console2.log("..");

        string memory otherUppercase1F169 = "\\u{1F169}";
        bytes memory utf8OtherUppercase1F169 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherUppercase1F169));
        console2.log("1F169: ", string(utf8OtherUppercase1F169));
        console2.logBytes(utf8OtherUppercase1F169);

        string memory otherUppercase1F170 = "\\u{1F170}";
        bytes memory utf8OtherUppercase1F170 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherUppercase1F170));
        console2.log("1F170: ", string(utf8OtherUppercase1F170));
        console2.logBytes(utf8OtherUppercase1F170);

        console2.log("..");

        string memory otherUppercase1F189 = "\\u{1F189}";
        bytes memory utf8OtherUppercase1F189 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherUppercase1F189));
        console2.log("1F189: ", string(utf8OtherUppercase1F189));
        console2.logBytes(utf8OtherUppercase1F189);
    }

    function testRegexPropertyNoncharacterCodePoint() public pure {
        string memory noncharacterCodePointFDD0 = "\\u{FDD0}";
        bytes memory utf8NoncharacterCodePointFDD0 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointFDD0));
        console2.log("FDD0: ", string(utf8NoncharacterCodePointFDD0));
        console2.logBytes(utf8NoncharacterCodePointFDD0);

        console2.log("..");

        string memory noncharacterCodePointFDEF = "\\u{FDEF}";
        bytes memory utf8NoncharacterCodePointFDEF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointFDEF));
        console2.log("FDEF: ", string(utf8NoncharacterCodePointFDEF));
        console2.logBytes(utf8NoncharacterCodePointFDEF);

        string memory noncharacterCodePointFFFE = "\\u{FFFE}";
        bytes memory utf8NoncharacterCodePointFFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointFFFE));
        console2.log("FFFE: ", string(utf8NoncharacterCodePointFFFE));
        console2.logBytes(utf8NoncharacterCodePointFFFE);

        console2.log("..");

        string memory noncharacterCodePointFFFF = "\\u{FFFF}";
        bytes memory utf8NoncharacterCodePointFFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointFFFF));
        console2.log("FFFF: ", string(utf8NoncharacterCodePointFFFF));
        console2.logBytes(utf8NoncharacterCodePointFFFF);

        string memory noncharacterCodePoint1FFFE = "\\u{1FFFE}";
        bytes memory utf8NoncharacterCodePoint1FFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint1FFFE));
        console2.log("1FFFE: ", string(utf8NoncharacterCodePoint1FFFE));
        console2.logBytes(utf8NoncharacterCodePoint1FFFE);

        console2.log("..");

        string memory noncharacterCodePoint1FFFF = "\\u{1FFFF}";
        bytes memory utf8NoncharacterCodePoint1FFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint1FFFF));
        console2.log("1FFFF: ", string(utf8NoncharacterCodePoint1FFFF));
        console2.logBytes(utf8NoncharacterCodePoint1FFFF);

        string memory noncharacterCodePoint2FFFE = "\\u{2FFFE}";
        bytes memory utf8NoncharacterCodePoint2FFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint2FFFE));
        console2.log("2FFFE: ", string(utf8NoncharacterCodePoint2FFFE));
        console2.logBytes(utf8NoncharacterCodePoint2FFFE);

        console2.log("..");

        string memory noncharacterCodePoint2FFFF = "\\u{2FFFF}";
        bytes memory utf8NoncharacterCodePoint2FFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint2FFFF));
        console2.log("2FFFF: ", string(utf8NoncharacterCodePoint2FFFF));
        console2.logBytes(utf8NoncharacterCodePoint2FFFF);

        string memory noncharacterCodePoint3FFFE = "\\u{3FFFE}";
        bytes memory utf8NoncharacterCodePoint3FFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint3FFFE));
        console2.log("3FFFE: ", string(utf8NoncharacterCodePoint3FFFE));
        console2.logBytes(utf8NoncharacterCodePoint3FFFE);

        console2.log("..");

        string memory noncharacterCodePoint3FFFF = "\\u{3FFFF}";
        bytes memory utf8NoncharacterCodePoint3FFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint3FFFF));
        console2.log("3FFFF: ", string(utf8NoncharacterCodePoint3FFFF));
        console2.logBytes(utf8NoncharacterCodePoint3FFFF);

        string memory noncharacterCodePoint4FFFE = "\\u{4FFFE}";
        bytes memory utf8NoncharacterCodePoint4FFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint4FFFE));
        console2.log("4FFFE: ", string(utf8NoncharacterCodePoint4FFFE));
        console2.logBytes(utf8NoncharacterCodePoint4FFFE);

        console2.log("..");

        string memory noncharacterCodePoint4FFFF = "\\u{4FFFF}";
        bytes memory utf8NoncharacterCodePoint4FFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint4FFFF));
        console2.log("4FFFF: ", string(utf8NoncharacterCodePoint4FFFF));
        console2.logBytes(utf8NoncharacterCodePoint4FFFF);

        string memory noncharacterCodePoint5FFFE = "\\u{5FFFE}";
        bytes memory utf8NoncharacterCodePoint5FFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint5FFFE));
        console2.log("5FFFE: ", string(utf8NoncharacterCodePoint5FFFE));
        console2.logBytes(utf8NoncharacterCodePoint5FFFE);

        console2.log("..");

        string memory noncharacterCodePoint5FFFF = "\\u{5FFFF}";
        bytes memory utf8NoncharacterCodePoint5FFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint5FFFF));
        console2.log("5FFFF: ", string(utf8NoncharacterCodePoint5FFFF));
        console2.logBytes(utf8NoncharacterCodePoint5FFFF);

        string memory noncharacterCodePoint6FFFE = "\\u{6FFFE}";
        bytes memory utf8NoncharacterCodePoint6FFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint6FFFE));
        console2.log("6FFFE: ", string(utf8NoncharacterCodePoint6FFFE));
        console2.logBytes(utf8NoncharacterCodePoint6FFFE);

        console2.log("..");

        string memory noncharacterCodePoint6FFFF = "\\u{6FFFF}";
        bytes memory utf8NoncharacterCodePoint6FFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint6FFFF));
        console2.log("6FFFF: ", string(utf8NoncharacterCodePoint6FFFF));
        console2.logBytes(utf8NoncharacterCodePoint6FFFF);

        string memory noncharacterCodePoint7FFFE = "\\u{7FFFE}";
        bytes memory utf8NoncharacterCodePoint7FFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint7FFFE));
        console2.log("7FFFE: ", string(utf8NoncharacterCodePoint7FFFE));
        console2.logBytes(utf8NoncharacterCodePoint7FFFE);

        console2.log("..");

        string memory noncharacterCodePoint7FFFF = "\\u{7FFFF}";
        bytes memory utf8NoncharacterCodePoint7FFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint7FFFF));
        console2.log("7FFFF: ", string(utf8NoncharacterCodePoint7FFFF));
        console2.logBytes(utf8NoncharacterCodePoint7FFFF);

        string memory noncharacterCodePoint8FFFE = "\\u{8FFFE}";
        bytes memory utf8NoncharacterCodePoint8FFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint8FFFE));
        console2.log("8FFFE: ", string(utf8NoncharacterCodePoint8FFFE));
        console2.logBytes(utf8NoncharacterCodePoint8FFFE);

        console2.log("..");

        string memory noncharacterCodePoint8FFFF = "\\u{8FFFF}";
        bytes memory utf8NoncharacterCodePoint8FFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint8FFFF));
        console2.log("8FFFF: ", string(utf8NoncharacterCodePoint8FFFF));
        console2.logBytes(utf8NoncharacterCodePoint8FFFF);

        string memory noncharacterCodePoint9FFFE = "\\u{9FFFE}";
        bytes memory utf8NoncharacterCodePoint9FFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint9FFFE));
        console2.log("9FFFE: ", string(utf8NoncharacterCodePoint9FFFE));
        console2.logBytes(utf8NoncharacterCodePoint9FFFE);

        console2.log("..");

        string memory noncharacterCodePoint9FFFF = "\\u{9FFFF}";
        bytes memory utf8NoncharacterCodePoint9FFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint9FFFF));
        console2.log("9FFFF: ", string(utf8NoncharacterCodePoint9FFFF));
        console2.logBytes(utf8NoncharacterCodePoint9FFFF);

        string memory noncharacterCodePointAFFFE = "\\u{AFFFE}";
        bytes memory utf8NoncharacterCodePointAFFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointAFFFE));
        console2.log("AFFFE: ", string(utf8NoncharacterCodePointAFFFE));
        console2.logBytes(utf8NoncharacterCodePointAFFFE);

        console2.log("..");

        string memory noncharacterCodePointAFFFF = "\\u{AFFFF}";
        bytes memory utf8NoncharacterCodePointAFFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointAFFFF));
        console2.log("AFFFF: ", string(utf8NoncharacterCodePointAFFFF));
        console2.logBytes(utf8NoncharacterCodePointAFFFF);

        string memory noncharacterCodePointBFFFE = "\\u{BFFFE}";
        bytes memory utf8NoncharacterCodePointBFFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointBFFFE));
        console2.log("BFFFE: ", string(utf8NoncharacterCodePointBFFFE));
        console2.logBytes(utf8NoncharacterCodePointBFFFE);

        console2.log("..");

        string memory noncharacterCodePointBFFFF = "\\u{BFFFF}";
        bytes memory utf8NoncharacterCodePointBFFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointBFFFF));
        console2.log("BFFFF: ", string(utf8NoncharacterCodePointBFFFF));
        console2.logBytes(utf8NoncharacterCodePointBFFFF);

        string memory noncharacterCodePointCFFFE = "\\u{CFFFE}";
        bytes memory utf8NoncharacterCodePointCFFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointCFFFE));
        console2.log("CFFFE: ", string(utf8NoncharacterCodePointCFFFE));
        console2.logBytes(utf8NoncharacterCodePointCFFFE);

        console2.log("..");

        string memory noncharacterCodePointCFFFF = "\\u{CFFFF}";
        bytes memory utf8NoncharacterCodePointCFFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointCFFFF));
        console2.log("CFFFF: ", string(utf8NoncharacterCodePointCFFFF));
        console2.logBytes(utf8NoncharacterCodePointCFFFF);

        string memory noncharacterCodePointDFFFE = "\\u{DFFFE}";
        bytes memory utf8NoncharacterCodePointDFFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointDFFFE));
        console2.log("DFFFE: ", string(utf8NoncharacterCodePointDFFFE));
        console2.logBytes(utf8NoncharacterCodePointDFFFE);

        console2.log("..");

        string memory noncharacterCodePointDFFFF = "\\u{DFFFF}";
        bytes memory utf8NoncharacterCodePointDFFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointDFFFF));
        console2.log("DFFFF: ", string(utf8NoncharacterCodePointDFFFF));
        console2.logBytes(utf8NoncharacterCodePointDFFFF);

        string memory noncharacterCodePointEFFFE = "\\u{EFFFE}";
        bytes memory utf8NoncharacterCodePointEFFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointEFFFE));
        console2.log("EFFFE: ", string(utf8NoncharacterCodePointEFFFE));
        console2.logBytes(utf8NoncharacterCodePointEFFFE);

        console2.log("..");

        string memory noncharacterCodePointEFFFF = "\\u{EFFFF}";
        bytes memory utf8NoncharacterCodePointEFFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointEFFFF));
        console2.log("EFFFF: ", string(utf8NoncharacterCodePointEFFFF));
        console2.logBytes(utf8NoncharacterCodePointEFFFF);

        string memory noncharacterCodePointFFFFE = "\\u{FFFFE}";
        bytes memory utf8NoncharacterCodePointFFFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointFFFFE));
        console2.log("FFFFE: ", string(utf8NoncharacterCodePointFFFFE));
        console2.logBytes(utf8NoncharacterCodePointFFFFE);

        console2.log("..");

        string memory noncharacterCodePointFFFFF = "\\u{FFFFF}";
        bytes memory utf8NoncharacterCodePointFFFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePointFFFFF));
        console2.log("FFFFF: ", string(utf8NoncharacterCodePointFFFFF));
        console2.logBytes(utf8NoncharacterCodePointFFFFF);

        string memory noncharacterCodePoint10FFFE = "\\u{10FFFE}";
        bytes memory utf8NoncharacterCodePoint10FFFE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint10FFFE));
        console2.log("10FFFE: ", string(utf8NoncharacterCodePoint10FFFE));
        console2.logBytes(utf8NoncharacterCodePoint10FFFE);

        console2.log("..");

        string memory noncharacterCodePoint10FFFF = "\\u{10FFFF}";
        bytes memory utf8NoncharacterCodePoint10FFFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(noncharacterCodePoint10FFFF));
        console2.log("10FFFF: ", string(utf8NoncharacterCodePoint10FFFF));
        console2.logBytes(utf8NoncharacterCodePoint10FFFF);
    }

    function testRegexPropertyOtherGraphemeExtend() public pure {
        string memory otherGraphemeExtend09BE = "\\u{09BE}";
        bytes memory utf8OtherGraphemeExtend09BE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend09BE));
        console2.log("09BE: ", string(utf8OtherGraphemeExtend09BE));
        console2.logBytes(utf8OtherGraphemeExtend09BE);

        string memory otherGraphemeExtend09D7 = "\\u{09D7}";
        bytes memory utf8OtherGraphemeExtend09D7 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend09D7));
        console2.log("09D7: ", string(utf8OtherGraphemeExtend09D7));
        console2.logBytes(utf8OtherGraphemeExtend09D7);

        string memory otherGraphemeExtend0B3E = "\\u{0B3E}";
        bytes memory utf8OtherGraphemeExtend0B3E =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0B3E));
        console2.log("0B3E: ", string(utf8OtherGraphemeExtend0B3E));
        console2.logBytes(utf8OtherGraphemeExtend0B3E);

        string memory otherGraphemeExtend0B57 = "\\u{0B57}";
        bytes memory utf8OtherGraphemeExtend0B57 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0B57));
        console2.log("0B57: ", string(utf8OtherGraphemeExtend0B57));
        console2.logBytes(utf8OtherGraphemeExtend0B57);

        string memory otherGraphemeExtend0BBE = "\\u{0BBE}";
        bytes memory utf8OtherGraphemeExtend0BBE =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0BBE));
        console2.log("0BBE: ", string(utf8OtherGraphemeExtend0BBE));
        console2.logBytes(utf8OtherGraphemeExtend0BBE);

        string memory otherGraphemeExtend0BD7 = "\\u{0BD7}";
        bytes memory utf8OtherGraphemeExtend0BD7 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0BD7));
        console2.log("0BD7: ", string(utf8OtherGraphemeExtend0BD7));
        console2.logBytes(utf8OtherGraphemeExtend0BD7);

        string memory otherGraphemeExtend0CC0 = "\\u{0CC0}";
        bytes memory utf8OtherGraphemeExtend0CC0 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0CC0));
        console2.log("0CC0: ", string(utf8OtherGraphemeExtend0CC0));
        console2.logBytes(utf8OtherGraphemeExtend0CC0);

        string memory otherGraphemeExtend0CC2 = "\\u{0CC2}";
        bytes memory utf8OtherGraphemeExtend0CC2 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0CC2));
        console2.log("0CC2: ", string(utf8OtherGraphemeExtend0CC2));
        console2.logBytes(utf8OtherGraphemeExtend0CC2);

        string memory otherGraphemeExtend0CC7 = "\\u{0CC7}";
        bytes memory utf8OtherGraphemeExtend0CC7 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0CC7));
        console2.log("0CC7: ", string(utf8OtherGraphemeExtend0CC7));
        console2.logBytes(utf8OtherGraphemeExtend0CC7);

        console2.log("..");

        string memory otherGraphemeExtend0CC8 = "\\u{0CC8}";
        bytes memory utf8OtherGraphemeExtend0CC8 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0CC8));
        console2.log("0CC8: ", string(utf8OtherGraphemeExtend0CC8));
        console2.logBytes(utf8OtherGraphemeExtend0CC8);

        string memory otherGraphemeExtend0CCA = "\\u{0CCA}";
        bytes memory utf8OtherGraphemeExtend0CCA =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0CCA));
        console2.log("0CCA: ", string(utf8OtherGraphemeExtend0CCA));
        console2.logBytes(utf8OtherGraphemeExtend0CCA);

        console2.log("..");

        string memory otherGraphemeExtend0CCB = "\\u{0CCB}";
        bytes memory utf8OtherGraphemeExtend0CCB =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0CCB));
        console2.log("0CCB: ", string(utf8OtherGraphemeExtend0CCB));
        console2.logBytes(utf8OtherGraphemeExtend0CCB);

        string memory otherGraphemeExtend0CD5 = "\\u{0CD5}";
        bytes memory utf8OtherGraphemeExtend0CD5 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0CD5));
        console2.log("0CD5: ", string(utf8OtherGraphemeExtend0CD5));
        console2.logBytes(utf8OtherGraphemeExtend0CD5);

        console2.log("..");

        string memory otherGraphemeExtend0CD6 = "\\u{0CD6}";
        bytes memory utf8OtherGraphemeExtend0CD6 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0CD6));
        console2.log("0CD6: ", string(utf8OtherGraphemeExtend0CD6));
        console2.logBytes(utf8OtherGraphemeExtend0CD6);

        string memory otherGraphemeExtend0D3E = "\\u{0D3E}";
        bytes memory utf8OtherGraphemeExtend0D3E =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0D3E));
        console2.log("0D3E: ", string(utf8OtherGraphemeExtend0D3E));
        console2.logBytes(utf8OtherGraphemeExtend0D3E);

        string memory otherGraphemeExtend0D57 = "\\u{0D57}";
        bytes memory utf8OtherGraphemeExtend0D57 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0D57));
        console2.log("0D57: ", string(utf8OtherGraphemeExtend0D57));
        console2.logBytes(utf8OtherGraphemeExtend0D57);

        string memory otherGraphemeExtend0DCF = "\\u{0DCF}";
        bytes memory utf8OtherGraphemeExtend0DCF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0DCF));
        console2.log("0DCF: ", string(utf8OtherGraphemeExtend0DCF));
        console2.logBytes(utf8OtherGraphemeExtend0DCF);

        string memory otherGraphemeExtend0DDF = "\\u{0DDF}";
        bytes memory utf8OtherGraphemeExtend0DDF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend0DDF));
        console2.log("0DDF: ", string(utf8OtherGraphemeExtend0DDF));
        console2.logBytes(utf8OtherGraphemeExtend0DDF);

        string memory otherGraphemeExtend1715 = "\\u{1715}";
        bytes memory utf8OtherGraphemeExtend1715 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1715));
        console2.log("1715: ", string(utf8OtherGraphemeExtend1715));
        console2.logBytes(utf8OtherGraphemeExtend1715);

        string memory otherGraphemeExtend1734 = "\\u{1734}";
        bytes memory utf8OtherGraphemeExtend1734 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1734));
        console2.log("1734: ", string(utf8OtherGraphemeExtend1734));
        console2.logBytes(utf8OtherGraphemeExtend1734);

        string memory otherGraphemeExtend1B35 = "\\u{1B35}";
        bytes memory utf8OtherGraphemeExtend1B35 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1B35));
        console2.log("1B35: ", string(utf8OtherGraphemeExtend1B35));
        console2.logBytes(utf8OtherGraphemeExtend1B35);

        string memory otherGraphemeExtend1B3B = "\\u{1B3B}";
        bytes memory utf8OtherGraphemeExtend1B3B =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1B3B));
        console2.log("1B3B: ", string(utf8OtherGraphemeExtend1B3B));
        console2.logBytes(utf8OtherGraphemeExtend1B3B);

        string memory otherGraphemeExtend1B3D = "\\u{1B3D}";
        bytes memory utf8OtherGraphemeExtend1B3D =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1B3D));
        console2.log("1B3D: ", string(utf8OtherGraphemeExtend1B3D));
        console2.logBytes(utf8OtherGraphemeExtend1B3D);

        string memory otherGraphemeExtend1B43 = "\\u{1B43}";
        bytes memory utf8OtherGraphemeExtend1B43 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1B43));
        console2.log("1B43: ", string(utf8OtherGraphemeExtend1B43));
        console2.logBytes(utf8OtherGraphemeExtend1B43);

        console2.log("..");

        string memory otherGraphemeExtend1B44 = "\\u{1B44}";
        bytes memory utf8OtherGraphemeExtend1B44 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1B44));
        console2.log("1B44: ", string(utf8OtherGraphemeExtend1B44));
        console2.logBytes(utf8OtherGraphemeExtend1B44);

        string memory otherGraphemeExtend1BAA = "\\u{1BAA}";
        bytes memory utf8OtherGraphemeExtend1BAA =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1BAA));
        console2.log("1BAA: ", string(utf8OtherGraphemeExtend1BAA));
        console2.logBytes(utf8OtherGraphemeExtend1BAA);

        string memory otherGraphemeExtend1BF2 = "\\u{1BF2}";
        bytes memory utf8OtherGraphemeExtend1BF2 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1BF2));
        console2.log("1BF2: ", string(utf8OtherGraphemeExtend1BF2));
        console2.logBytes(utf8OtherGraphemeExtend1BF2);

        console2.log("..");

        string memory otherGraphemeExtend1BF3 = "\\u{1BF3}";
        bytes memory utf8OtherGraphemeExtend1BF3 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1BF3));
        console2.log("1BF3: ", string(utf8OtherGraphemeExtend1BF3));
        console2.logBytes(utf8OtherGraphemeExtend1BF3);

        string memory otherGraphemeExtend200C = "\\u{200C}";
        bytes memory utf8OtherGraphemeExtend200C =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend200C));
        console2.log("200C: ", string(utf8OtherGraphemeExtend200C));
        console2.logBytes(utf8OtherGraphemeExtend200C);

        string memory otherGraphemeExtend302E = "\\u{302E}";
        bytes memory utf8OtherGraphemeExtend302E =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend302E));
        console2.log("302E: ", string(utf8OtherGraphemeExtend302E));
        console2.logBytes(utf8OtherGraphemeExtend302E);

        console2.log("..");

        string memory otherGraphemeExtend302F = "\\u{302F}";
        bytes memory utf8OtherGraphemeExtend302F =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend302F));
        console2.log("302F: ", string(utf8OtherGraphemeExtend302F));
        console2.logBytes(utf8OtherGraphemeExtend302F);

        string memory otherGraphemeExtendA953 = "\\u{A953}";
        bytes memory utf8OtherGraphemeExtendA953 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtendA953));
        console2.log("A953: ", string(utf8OtherGraphemeExtendA953));
        console2.logBytes(utf8OtherGraphemeExtendA953);

        string memory otherGraphemeExtendA9C0 = "\\u{A9C0}";
        bytes memory utf8OtherGraphemeExtendA9C0 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtendA9C0));
        console2.log("A9C0: ", string(utf8OtherGraphemeExtendA9C0));
        console2.logBytes(utf8OtherGraphemeExtendA9C0);

        string memory otherGraphemeExtendFF9E = "\\u{FF9E}";
        bytes memory utf8OtherGraphemeExtendFF9E =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtendFF9E));
        console2.log("FF9E: ", string(utf8OtherGraphemeExtendFF9E));
        console2.logBytes(utf8OtherGraphemeExtendFF9E);

        console2.log("..");

        string memory otherGraphemeExtendFF9F = "\\u{FF9F}";
        bytes memory utf8OtherGraphemeExtendFF9F =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtendFF9F));
        console2.log("FF9F: ", string(utf8OtherGraphemeExtendFF9F));
        console2.logBytes(utf8OtherGraphemeExtendFF9F);

        string memory otherGraphemeExtend111C0 = "\\u{111C0}";
        bytes memory utf8OtherGraphemeExtend111C0 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend111C0));
        console2.log("111C0: ", string(utf8OtherGraphemeExtend111C0));
        console2.logBytes(utf8OtherGraphemeExtend111C0);

        string memory otherGraphemeExtend11235 = "\\u{11235}";
        bytes memory utf8OtherGraphemeExtend11235 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend11235));
        console2.log("11235: ", string(utf8OtherGraphemeExtend11235));
        console2.logBytes(utf8OtherGraphemeExtend11235);

        string memory otherGraphemeExtend1133E = "\\u{1133E}";
        bytes memory utf8OtherGraphemeExtend1133E =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1133E));
        console2.log("1133E: ", string(utf8OtherGraphemeExtend1133E));
        console2.logBytes(utf8OtherGraphemeExtend1133E);

        string memory otherGraphemeExtend1134D = "\\u{1134D}";
        bytes memory utf8OtherGraphemeExtend1134D =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1134D));
        console2.log("1134D: ", string(utf8OtherGraphemeExtend1134D));
        console2.logBytes(utf8OtherGraphemeExtend1134D);

        string memory otherGraphemeExtend11357 = "\\u{11357}";
        bytes memory utf8OtherGraphemeExtend11357 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend11357));
        console2.log("11357: ", string(utf8OtherGraphemeExtend11357));
        console2.logBytes(utf8OtherGraphemeExtend11357);

        string memory otherGraphemeExtend113B8 = "\\u{113B8}";
        bytes memory utf8OtherGraphemeExtend113B8 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend113B8));
        console2.log("113B8: ", string(utf8OtherGraphemeExtend113B8));
        console2.logBytes(utf8OtherGraphemeExtend113B8);

        string memory otherGraphemeExtend113C2 = "\\u{113C2}";
        bytes memory utf8OtherGraphemeExtend113C2 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend113C2));
        console2.log("113C2: ", string(utf8OtherGraphemeExtend113C2));
        console2.logBytes(utf8OtherGraphemeExtend113C2);

        string memory otherGraphemeExtend113C5 = "\\u{113C5}";
        bytes memory utf8OtherGraphemeExtend113C5 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend113C5));
        console2.log("113C5: ", string(utf8OtherGraphemeExtend113C5));
        console2.logBytes(utf8OtherGraphemeExtend113C5);

        string memory otherGraphemeExtend113C7 = "\\u{113C7}";
        bytes memory utf8OtherGraphemeExtend113C7 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend113C7));
        console2.log("113C7: ", string(utf8OtherGraphemeExtend113C7));
        console2.logBytes(utf8OtherGraphemeExtend113C7);

        console2.log("..");

        string memory otherGraphemeExtend113C9 = "\\u{113C9}";
        bytes memory utf8OtherGraphemeExtend113C9 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend113C9));
        console2.log("113C9: ", string(utf8OtherGraphemeExtend113C9));
        console2.logBytes(utf8OtherGraphemeExtend113C9);

        string memory otherGraphemeExtend113CF = "\\u{113CF}";
        bytes memory utf8OtherGraphemeExtend113CF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend113CF));
        console2.log("113CF: ", string(utf8OtherGraphemeExtend113CF));
        console2.logBytes(utf8OtherGraphemeExtend113CF);

        string memory otherGraphemeExtend114B0 = "\\u{114B0}";
        bytes memory utf8OtherGraphemeExtend114B0 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend114B0));
        console2.log("114B0: ", string(utf8OtherGraphemeExtend114B0));
        console2.logBytes(utf8OtherGraphemeExtend114B0);

        string memory otherGraphemeExtend114BD = "\\u{114BD}";
        bytes memory utf8OtherGraphemeExtend114BD =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend114BD));
        console2.log("114BD: ", string(utf8OtherGraphemeExtend114BD));
        console2.logBytes(utf8OtherGraphemeExtend114BD);

        string memory otherGraphemeExtend115AF = "\\u{115AF}";
        bytes memory utf8OtherGraphemeExtend115AF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend115AF));
        console2.log("115AF: ", string(utf8OtherGraphemeExtend115AF));
        console2.logBytes(utf8OtherGraphemeExtend115AF);

        string memory otherGraphemeExtend116B6 = "\\u{116B6}";
        bytes memory utf8OtherGraphemeExtend116B6 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend116B6));
        console2.log("116B6: ", string(utf8OtherGraphemeExtend116B6));
        console2.logBytes(utf8OtherGraphemeExtend116B6);

        string memory otherGraphemeExtend11930 = "\\u{11930}";
        bytes memory utf8OtherGraphemeExtend11930 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend11930));
        console2.log("11930: ", string(utf8OtherGraphemeExtend11930));
        console2.logBytes(utf8OtherGraphemeExtend11930);

        string memory otherGraphemeExtend1193D = "\\u{1193D}";
        bytes memory utf8OtherGraphemeExtend1193D =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1193D));
        console2.log("1193D: ", string(utf8OtherGraphemeExtend1193D));
        console2.logBytes(utf8OtherGraphemeExtend1193D);

        string memory otherGraphemeExtend11F41 = "\\u{11F41}";
        bytes memory utf8OtherGraphemeExtend11F41 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend11F41));
        console2.log("11F41: ", string(utf8OtherGraphemeExtend11F41));
        console2.logBytes(utf8OtherGraphemeExtend11F41);

        string memory otherGraphemeExtend16FF0 = "\\u{16FF0}";
        bytes memory utf8OtherGraphemeExtend16FF0 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend16FF0));
        console2.log("16FF0: ", string(utf8OtherGraphemeExtend16FF0));
        console2.logBytes(utf8OtherGraphemeExtend16FF0);

        console2.log("..");

        string memory otherGraphemeExtend16FF1 = "\\u{16FF1}";
        bytes memory utf8OtherGraphemeExtend16FF1 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend16FF1));
        console2.log("16FF1: ", string(utf8OtherGraphemeExtend16FF1));
        console2.logBytes(utf8OtherGraphemeExtend16FF1);

        string memory otherGraphemeExtend1D165 = "\\u{1D165}";
        bytes memory utf8OtherGraphemeExtend1D165 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1D165));
        console2.log("1D165: ", string(utf8OtherGraphemeExtend1D165));
        console2.logBytes(utf8OtherGraphemeExtend1D165);

        console2.log("..");

        string memory otherGraphemeExtend1D166 = "\\u{1D166}";
        bytes memory utf8OtherGraphemeExtend1D166 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1D166));
        console2.log("1D166: ", string(utf8OtherGraphemeExtend1D166));
        console2.logBytes(utf8OtherGraphemeExtend1D166);

        string memory otherGraphemeExtend1D16D = "\\u{1D16D}";
        bytes memory utf8OtherGraphemeExtend1D16D =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1D16D));
        console2.log("1D16D: ", string(utf8OtherGraphemeExtend1D16D));
        console2.logBytes(utf8OtherGraphemeExtend1D16D);

        console2.log("..");

        string memory otherGraphemeExtend1D172 = "\\u{1D172}";
        bytes memory utf8OtherGraphemeExtend1D172 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtend1D172));
        console2.log("1D172: ", string(utf8OtherGraphemeExtend1D172));
        console2.logBytes(utf8OtherGraphemeExtend1D172);

        string memory otherGraphemeExtendE0020 = "\\u{E0020}";
        bytes memory utf8OtherGraphemeExtendE0020 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtendE0020));
        console2.log("E0020: ", string(utf8OtherGraphemeExtendE0020));
        console2.logBytes(utf8OtherGraphemeExtendE0020);

        console2.log("..");

        string memory otherGraphemeExtendE007F = "\\u{E007F}";
        bytes memory utf8OtherGraphemeExtendE007F =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherGraphemeExtendE007F));
        console2.log("E007F: ", string(utf8OtherGraphemeExtendE007F));
        console2.logBytes(utf8OtherGraphemeExtendE007F);
    }

    function testRegexPropertyIDSBinaryOperator() public pure {
        string memory idsBinaryOperator2FF0 = "\\u{2FF0}";
        bytes memory utf8IdsBinaryOperator2FF0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idsBinaryOperator2FF0));
        console2.log("2FF0: ", string(utf8IdsBinaryOperator2FF0));
        console2.logBytes(utf8IdsBinaryOperator2FF0);

        console2.log("..");

        string memory idsBinaryOperator2FF1 = "\\u{2FF1}";
        bytes memory utf8IdsBinaryOperator2FF1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idsBinaryOperator2FF1));
        console2.log("2FF1: ", string(utf8IdsBinaryOperator2FF1));
        console2.logBytes(utf8IdsBinaryOperator2FF1);

        string memory idsBinaryOperator2FF4 = "\\u{2FF4}";
        bytes memory utf8IdsBinaryOperator2FF4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idsBinaryOperator2FF4));
        console2.log("2FF4: ", string(utf8IdsBinaryOperator2FF4));
        console2.logBytes(utf8IdsBinaryOperator2FF4);

        console2.log("..");

        string memory idsBinaryOperator2FFD = "\\u{2FFD}";
        bytes memory utf8IdsBinaryOperator2FFD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idsBinaryOperator2FFD));
        console2.log("2FFD: ", string(utf8IdsBinaryOperator2FFD));
        console2.logBytes(utf8IdsBinaryOperator2FFD);

        string memory idsBinaryOperator31EF = "\\u{31EF}";
        bytes memory utf8IdsBinaryOperator31EF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idsBinaryOperator31EF));
        console2.log("31EF: ", string(utf8IdsBinaryOperator31EF));
        console2.logBytes(utf8IdsBinaryOperator31EF);
    }

    function testRegexPropertyIDSTrinaryOperator() public pure {
        string memory idsTrinaryOperator2FF2 = "\\u{2FF2}";
        bytes memory utf8IdsTrinaryOperator2FF2 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idsTrinaryOperator2FF2));
        console2.log("2FF2: ", string(utf8IdsTrinaryOperator2FF2));
        console2.logBytes(utf8IdsTrinaryOperator2FF2);

        console2.log("..");

        string memory idsTrinaryOperator2FF3 = "\\u{2FF3}";
        bytes memory utf8IdsTrinaryOperator2FF3 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idsTrinaryOperator2FF3));
        console2.log("2FF3: ", string(utf8IdsTrinaryOperator2FF3));
        console2.logBytes(utf8IdsTrinaryOperator2FF3);
    }

    function testRegexPropertyIDSUnaryOperator() public pure {
        string memory idsUnaryOperator2FFE = "\\u{2FFE}";
        bytes memory utf8UnaryOperator2FFE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idsUnaryOperator2FFE));
        console2.log("2FFE: ", string(utf8UnaryOperator2FFE));
        console2.logBytes(utf8UnaryOperator2FFE);

        console2.log("..");

        string memory idsUnaryOperator2FFF = "\\u{2FFF}";
        bytes memory utf8UnaryOperator2FFF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idsUnaryOperator2FFF));
        console2.log("2FFF: ", string(utf8UnaryOperator2FFF));
        console2.logBytes(utf8UnaryOperator2FFF);
    }

    function testRegexPropertyRadical() public pure {
        string memory radical2E80 = "\\u{2E80}";
        bytes memory utf8Radical2E80 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(radical2E80));
        console2.log("2E80: ", string(utf8Radical2E80));
        console2.logBytes(utf8Radical2E80);

        console2.log("..");

        string memory radical2E99 = "\\u{2E99}";
        bytes memory utf8Radical2E99 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(radical2E99));
        console2.log("2E99: ", string(utf8Radical2E99));
        console2.logBytes(utf8Radical2E99);

        string memory radical2E9B = "\\u{2E9B}";
        bytes memory utf8Radical2E9B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(radical2E9B));
        console2.log("2E9B: ", string(utf8Radical2E9B));
        console2.logBytes(utf8Radical2E9B);

        console2.log("..");

        string memory radical2EF3 = "\\u{2EF3}";
        bytes memory utf8Radical2EF3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(radical2EF3));
        console2.log("2EF3: ", string(utf8Radical2EF3));
        console2.logBytes(utf8Radical2EF3);

        string memory radical2F00 = "\\u{2F00}";
        bytes memory utf8Radical2F00 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(radical2F00));
        console2.log("2F00: ", string(utf8Radical2F00));
        console2.logBytes(utf8Radical2F00);

        console2.log("..");

        string memory radical2FD5 = "\\u{2FD5}";
        bytes memory utf8Radical2FD5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(radical2FD5));
        console2.log("2FD5: ", string(utf8Radical2FD5));
        console2.logBytes(utf8Radical2FD5);
    }

    function testRegexPropertyUnifiedIdeograph() public pure {
        string memory unifiedIdeograph3400 = "\\u{3400}";
        bytes memory utf8UnifiedIdeograph3400 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph3400));
        console2.log("3400: ", string(utf8UnifiedIdeograph3400));
        console2.logBytes(utf8UnifiedIdeograph3400);

        console2.log("..");

        string memory unifiedIdeograph4DBF = "\\u{4DBF}";
        bytes memory utf8UnifiedIdeograph4DBF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph4DBF));
        console2.log("4DBF: ", string(utf8UnifiedIdeograph4DBF));
        console2.logBytes(utf8UnifiedIdeograph4DBF);

        string memory unifiedIdeograph4E00 = "\\u{4E00}";
        bytes memory utf8UnifiedIdeograph4E00 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph4E00));
        console2.log("4E00: ", string(utf8UnifiedIdeograph4E00));
        console2.logBytes(utf8UnifiedIdeograph4E00);

        console2.log("..");

        string memory unifiedIdeograph9FFF = "\\u{9FFF}";
        bytes memory utf8UnifiedIdeograph9FFF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph9FFF));
        console2.log("9FFF: ", string(utf8UnifiedIdeograph9FFF));
        console2.logBytes(utf8UnifiedIdeograph9FFF);

        string memory unifiedIdeographFA0E = "\\u{FA0E}";
        bytes memory utf8UnifiedIdeographFA0E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeographFA0E));
        console2.log("FA0E: ", string(utf8UnifiedIdeographFA0E));
        console2.logBytes(utf8UnifiedIdeographFA0E);

        console2.log("..");

        string memory unifiedIdeographFA0F = "\\u{FA0F}";
        bytes memory utf8UnifiedIdeographFA0F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeographFA0F));
        console2.log("FA0F: ", string(utf8UnifiedIdeographFA0F));
        console2.logBytes(utf8UnifiedIdeographFA0F);

        string memory unifiedIdeographFA11 = "\\u{FA11}";
        bytes memory utf8UnifiedIdeographFA11 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeographFA11));
        console2.log("FA11: ", string(utf8UnifiedIdeographFA11));
        console2.logBytes(utf8UnifiedIdeographFA11);

        string memory unifiedIdeographFA13 = "\\u{FA13}";
        bytes memory utf8UnifiedIdeographFA13 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeographFA13));
        console2.log("FA13: ", string(utf8UnifiedIdeographFA13));
        console2.logBytes(utf8UnifiedIdeographFA13);

        console2.log("..");

        string memory unifiedIdeographFA14 = "\\u{FA14}";
        bytes memory utf8UnifiedIdeographFA14 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeographFA14));
        console2.log("FA14: ", string(utf8UnifiedIdeographFA14));
        console2.logBytes(utf8UnifiedIdeographFA14);

        string memory unifiedIdeographFA1F = "\\u{FA1F}";
        bytes memory utf8UnifiedIdeographFA1F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeographFA1F));
        console2.log("FA1F: ", string(utf8UnifiedIdeographFA1F));
        console2.logBytes(utf8UnifiedIdeographFA1F);

        string memory unifiedIdeographFA21 = "\\u{FA21}";
        bytes memory utf8UnifiedIdeographFA21 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeographFA21));
        console2.log("FA21: ", string(utf8UnifiedIdeographFA21));
        console2.logBytes(utf8UnifiedIdeographFA21);

        string memory unifiedIdeographFA23 = "\\u{FA23}";
        bytes memory utf8UnifiedIdeographFA23 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeographFA23));
        console2.log("FA23: ", string(utf8UnifiedIdeographFA23));
        console2.logBytes(utf8UnifiedIdeographFA23);

        console2.log("..");

        string memory unifiedIdeographFA24 = "\\u{FA24}";
        bytes memory utf8UnifiedIdeographFA24 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeographFA24));
        console2.log("FA24: ", string(utf8UnifiedIdeographFA24));
        console2.logBytes(utf8UnifiedIdeographFA24);

        string memory unifiedIdeographFA27 = "\\u{FA27}";
        bytes memory utf8UnifiedIdeographFA27 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeographFA27));
        console2.log("FA27: ", string(utf8UnifiedIdeographFA27));
        console2.logBytes(utf8UnifiedIdeographFA27);

        console2.log("..");

        string memory unifiedIdeographFA29 = "\\u{FA29}";
        bytes memory utf8UnifiedIdeographFA29 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeographFA29));
        console2.log("FA29: ", string(utf8UnifiedIdeographFA29));
        console2.logBytes(utf8UnifiedIdeographFA29);

        string memory unifiedIdeograph20000 = "\\u{20000}";
        bytes memory utf8UnifiedIdeograph20000 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph20000));
        console2.log("20000: ", string(utf8UnifiedIdeograph20000));
        console2.logBytes(utf8UnifiedIdeograph20000);

        console2.log("..");

        string memory unifiedIdeograph2A6DF = "\\u{2A6DF}";
        bytes memory utf8UnifiedIdeograph2A6DF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph2A6DF));
        console2.log("2A6DF: ", string(utf8UnifiedIdeograph2A6DF));
        console2.logBytes(utf8UnifiedIdeograph2A6DF);

        string memory unifiedIdeograph2A700 = "\\u{2A700}";
        bytes memory utf8UnifiedIdeograph2A700 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph2A700));
        console2.log("2A700: ", string(utf8UnifiedIdeograph2A700));
        console2.logBytes(utf8UnifiedIdeograph2A700);

        console2.log("..");

        string memory unifiedIdeograph2B81D = "\\u{2B81D}";
        bytes memory utf8UnifiedIdeograph2B81D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph2B81D));
        console2.log("2B81D: ", string(utf8UnifiedIdeograph2B81D));
        console2.logBytes(utf8UnifiedIdeograph2B81D);

        string memory unifiedIdeograph2B820 = "\\u{2B820}";
        bytes memory utf8UnifiedIdeograph2B820 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph2B820));
        console2.log("2B820: ", string(utf8UnifiedIdeograph2B820));
        console2.logBytes(utf8UnifiedIdeograph2B820);

        console2.log("..");

        string memory unifiedIdeograph2CEAD = "\\u{2CEAD}";
        bytes memory utf8UnifiedIdeograph2CEAD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph2CEAD));
        console2.log("2CEAD: ", string(utf8UnifiedIdeograph2CEAD));
        console2.logBytes(utf8UnifiedIdeograph2CEAD);

        string memory unifiedIdeograph2CEB0 = "\\u{2CEB0}";
        bytes memory utf8UnifiedIdeograph2CEB0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph2CEB0));
        console2.log("2CEB0: ", string(utf8UnifiedIdeograph2CEB0));
        console2.logBytes(utf8UnifiedIdeograph2CEB0);

        console2.log("..");

        string memory unifiedIdeograph2EBE0 = "\\u{2EBE0}";
        bytes memory utf8UnifiedIdeograph2EBE0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph2EBE0));
        console2.log("2EBE0: ", string(utf8UnifiedIdeograph2EBE0));
        console2.logBytes(utf8UnifiedIdeograph2EBE0);

        string memory unifiedIdeograph2EBF0 = "\\u{2EBF0}";
        bytes memory utf8UnifiedIdeograph2EBF0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph2EBF0));
        console2.log("2EBF0: ", string(utf8UnifiedIdeograph2EBF0));
        console2.logBytes(utf8UnifiedIdeograph2EBF0);

        console2.log("..");

        string memory unifiedIdeograph2EE5D = "\\u{2EE5D}";
        bytes memory utf8UnifiedIdeograph2EE5D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph2EE5D));
        console2.log("2EE5D: ", string(utf8UnifiedIdeograph2EE5D));
        console2.logBytes(utf8UnifiedIdeograph2EE5D);

        string memory unifiedIdeograph30000 = "\\u{30000}";
        bytes memory utf8UnifiedIdeograph30000 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph30000));
        console2.log("30000: ", string(utf8UnifiedIdeograph30000));
        console2.logBytes(utf8UnifiedIdeograph30000);

        console2.log("..");

        string memory unifiedIdeograph3134A = "\\u{3134A}";
        bytes memory utf8UnifiedIdeograph3134A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph3134A));
        console2.log("3134A: ", string(utf8UnifiedIdeograph3134A));
        console2.logBytes(utf8UnifiedIdeograph3134A);

        string memory unifiedIdeograph31350 = "\\u{31350}";
        bytes memory utf8UnifiedIdeograph31350 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph31350));
        console2.log("31350: ", string(utf8UnifiedIdeograph31350));
        console2.logBytes(utf8UnifiedIdeograph31350);

        console2.log("..");

        string memory unifiedIdeograph33479 = "\\u{33479}";
        bytes memory utf8UnifiedIdeograph33479 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(unifiedIdeograph33479));
        console2.log("33479: ", string(utf8UnifiedIdeograph33479));
        console2.logBytes(utf8UnifiedIdeograph33479);
    }

    function testRegexPropertyOtherDefaultIgnorableCodePoint() public pure {
        string memory otherDefaultIgnorableCodePoint034F = "\\u{034F}";
        bytes memory utf8OtherDefaultIgnorableCodePoint034F =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePoint034F));
        console2.log("034F: ", string(utf8OtherDefaultIgnorableCodePoint034F));
        console2.logBytes(utf8OtherDefaultIgnorableCodePoint034F);

        string memory otherDefaultIgnorableCodePoint115F = "\\u{115F}";
        bytes memory utf8OtherDefaultIgnorableCodePoint115F =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePoint115F));
        console2.log("115F: ", string(utf8OtherDefaultIgnorableCodePoint115F));
        console2.logBytes(utf8OtherDefaultIgnorableCodePoint115F);

        console2.log("..");

        string memory otherDefaultIgnorableCodePoint1160 = "\\u{1160}";
        bytes memory utf8OtherDefaultIgnorableCodePoint1160 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePoint1160));
        console2.log("1160: ", string(utf8OtherDefaultIgnorableCodePoint1160));
        console2.logBytes(utf8OtherDefaultIgnorableCodePoint1160);

        string memory otherDefaultIgnorableCodePoint17B4 = "\\u{17B4}";
        bytes memory utf8OtherDefaultIgnorableCodePoint17B4 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePoint17B4));
        console2.log("17B4: ", string(utf8OtherDefaultIgnorableCodePoint17B4));
        console2.logBytes(utf8OtherDefaultIgnorableCodePoint17B4);

        console2.log("..");

        string memory otherDefaultIgnorableCodePoint17B5 = "\\u{17B5}";
        bytes memory utf8OtherDefaultIgnorableCodePoint17B5 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePoint17B5));
        console2.log("17B5: ", string(utf8OtherDefaultIgnorableCodePoint17B5));
        console2.logBytes(utf8OtherDefaultIgnorableCodePoint17B5);

        string memory otherDefaultIgnorableCodePoint2065 = "\\u{2065}";
        bytes memory utf8OtherDefaultIgnorableCodePoint2065 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePoint2065));
        console2.log("2065: ", string(utf8OtherDefaultIgnorableCodePoint2065));
        console2.logBytes(utf8OtherDefaultIgnorableCodePoint2065);

        string memory otherDefaultIgnorableCodePoint3164 = "\\u{3164}";
        bytes memory utf8OtherDefaultIgnorableCodePoint3164 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePoint3164));
        console2.log("3164: ", string(utf8OtherDefaultIgnorableCodePoint3164));
        console2.logBytes(utf8OtherDefaultIgnorableCodePoint3164);

        string memory otherDefaultIgnorableCodePointFFA0 = "\\u{FFA0}";
        bytes memory utf8OtherDefaultIgnorableCodePointFFA0 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePointFFA0));
        console2.log("FFA0: ", string(utf8OtherDefaultIgnorableCodePointFFA0));
        console2.logBytes(utf8OtherDefaultIgnorableCodePointFFA0);

        string memory otherDefaultIgnorableCodePointFFF0 = "\\u{FFF0}";
        bytes memory utf8OtherDefaultIgnorableCodePointFFF0 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePointFFF0));
        console2.log("FFF0: ", string(utf8OtherDefaultIgnorableCodePointFFF0));
        console2.logBytes(utf8OtherDefaultIgnorableCodePointFFF0);

        console2.log("..");

        string memory otherDefaultIgnorableCodePointFFF8 = "\\u{FFF8}";
        bytes memory utf8OtherDefaultIgnorableCodePointFFF8 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePointFFF8));
        console2.log("FFF8: ", string(utf8OtherDefaultIgnorableCodePointFFF8));
        console2.logBytes(utf8OtherDefaultIgnorableCodePointFFF8);

        string memory otherDefaultIgnorableCodePointE0000 = "\\u{E0000}";
        bytes memory utf8OtherDefaultIgnorableCodePointE0000 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePointE0000));
        console2.log("E0000: ", string(utf8OtherDefaultIgnorableCodePointE0000));
        console2.logBytes(utf8OtherDefaultIgnorableCodePointE0000);

        string memory otherDefaultIgnorableCodePointE0002 = "\\u{E0002}";
        bytes memory utf8OtherDefaultIgnorableCodePointE0002 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePointE0002));
        console2.log("E0002: ", string(utf8OtherDefaultIgnorableCodePointE0002));
        console2.logBytes(utf8OtherDefaultIgnorableCodePointE0002);

        console2.log("..");

        string memory otherDefaultIgnorableCodePointE001F = "\\u{E001F}";
        bytes memory utf8OtherDefaultIgnorableCodePointE001F =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePointE001F));
        console2.log("E001F: ", string(utf8OtherDefaultIgnorableCodePointE001F));
        console2.logBytes(utf8OtherDefaultIgnorableCodePointE001F);

        string memory otherDefaultIgnorableCodePointE0080 = "\\u{E0080}";
        bytes memory utf8OtherDefaultIgnorableCodePointE0080 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePointE0080));
        console2.log("E0080: ", string(utf8OtherDefaultIgnorableCodePointE0080));
        console2.logBytes(utf8OtherDefaultIgnorableCodePointE0080);

        console2.log("..");

        string memory otherDefaultIgnorableCodePointE00FF = "\\u{E00FF}";
        bytes memory utf8OtherDefaultIgnorableCodePointE00FF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePointE00FF));
        console2.log("E00FF: ", string(utf8OtherDefaultIgnorableCodePointE00FF));
        console2.logBytes(utf8OtherDefaultIgnorableCodePointE00FF);

        string memory otherDefaultIgnorableCodePointE01F0 = "\\u{E01F0}";
        bytes memory utf8OtherDefaultIgnorableCodePointE01F0 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePointE01F0));
        console2.log("E01F0: ", string(utf8OtherDefaultIgnorableCodePointE01F0));
        console2.logBytes(utf8OtherDefaultIgnorableCodePointE01F0);

        console2.log("..");

        string memory otherDefaultIgnorableCodePointE0FFF = "\\u{E0FFF}";
        bytes memory utf8OtherDefaultIgnorableCodePointE0FFF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherDefaultIgnorableCodePointE0FFF));
        console2.log("E0FFF: ", string(utf8OtherDefaultIgnorableCodePointE0FFF));
        console2.logBytes(utf8OtherDefaultIgnorableCodePointE0FFF);
    }

    function testRegexPropertyDeprecated() public pure {
        string memory deprecated0149 = "\\u{0149}";
        bytes memory utf8Deprecated0149 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(deprecated0149));
        console2.log("0149: ", string(utf8Deprecated0149));
        console2.logBytes(utf8Deprecated0149);

        string memory deprecated0673 = "\\u{0673}";
        bytes memory utf8Deprecated0673 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(deprecated0673));
        console2.log("0673: ", string(utf8Deprecated0673));
        console2.logBytes(utf8Deprecated0673);

        string memory deprecated0F77 = "\\u{0F77}";
        bytes memory utf8Deprecated0F77 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(deprecated0F77));
        console2.log("0F77: ", string(utf8Deprecated0F77));
        console2.logBytes(utf8Deprecated0F77);

        string memory deprecated0F79 = "\\u{0F79}";
        bytes memory utf8Deprecated0F79 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(deprecated0F79));
        console2.log("0F79: ", string(utf8Deprecated0F79));
        console2.logBytes(utf8Deprecated0F79);

        string memory deprecated17A3 = "\\u{17A3}";
        bytes memory utf8Deprecated17A3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(deprecated17A3));
        console2.log("17A3: ", string(utf8Deprecated17A3));
        console2.logBytes(utf8Deprecated17A3);

        console2.log("..");

        string memory deprecated17A4 = "\\u{17A4}";
        bytes memory utf8Deprecated17A4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(deprecated17A4));
        console2.log("17A4: ", string(utf8Deprecated17A4));
        console2.logBytes(utf8Deprecated17A4);

        string memory deprecated206A = "\\u{206A}";
        bytes memory utf8Deprecated206A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(deprecated206A));
        console2.log("206A: ", string(utf8Deprecated206A));
        console2.logBytes(utf8Deprecated206A);

        console2.log("..");

        string memory deprecated206F = "\\u{206F}";
        bytes memory utf8Deprecated206F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(deprecated206F));
        console2.log("206F: ", string(utf8Deprecated206F));
        console2.logBytes(utf8Deprecated206F);

        string memory deprecated2329 = "\\u{2329}";
        bytes memory utf8Deprecated2329 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(deprecated2329));
        console2.log("2329: ", string(utf8Deprecated2329));
        console2.logBytes(utf8Deprecated2329);

        string memory deprecated232A = "\\u{232A}";
        bytes memory utf8Deprecated232A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(deprecated232A));
        console2.log("232A: ", string(utf8Deprecated232A));
        console2.logBytes(utf8Deprecated232A);

        string memory deprecatedE0001 = "\\u{E0001}";
        bytes memory utf8DeprecatedE0001 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(deprecatedE0001));
        console2.log("E0001: ", string(utf8DeprecatedE0001));
        console2.logBytes(utf8DeprecatedE0001);
    }

    function testRegexPropertySoft_Dotted() public pure {
        string memory softDotted0069 = "\\u{softDotted0069}";
        bytes memory utf8SoftDotted0069 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted0069));
        console2.log("0069: ", string(utf8SoftDotted0069));
        console2.logBytes(utf8SoftDotted0069);

        console2.log("..");

        string memory softDotted006A = "\\u{softDotted006A}";
        bytes memory utf8SoftDotted006A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted006A));
        console2.log("006A: ", string(utf8SoftDotted006A));
        console2.logBytes(utf8SoftDotted006A);

        string memory softDotted012F = "\\u{softDotted012F}";
        bytes memory utf8SoftDotted012F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted012F));
        console2.log("012F: ", string(utf8SoftDotted012F));
        console2.logBytes(utf8SoftDotted012F);

        string memory softDotted0249 = "\\u{softDotted0249}";
        bytes memory utf8SoftDotted0249 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted0249));
        console2.log("0249: ", string(utf8SoftDotted0249));
        console2.logBytes(utf8SoftDotted0249);

        string memory softDotted0268 = "\\u{softDotted0268}";
        bytes memory utf8SoftDotted0268 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted0268));
        console2.log("0268: ", string(utf8SoftDotted0268));
        console2.logBytes(utf8SoftDotted0268);

        string memory softDotted029D = "\\u{softDotted029D}";
        bytes memory utf8SoftDotted029D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted029D));
        console2.log("029D: ", string(utf8SoftDotted029D));
        console2.logBytes(utf8SoftDotted029D);

        string memory softDotted02B2 = "\\u{softDotted02B2}";
        bytes memory utf8SoftDotted02B2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted02B2));
        console2.log("02B2: ", string(utf8SoftDotted02B2));
        console2.logBytes(utf8SoftDotted02B2);

        string memory softDotted03F3 = "\\u{softDotted03F3}";
        bytes memory utf8SoftDotted03F3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted03F3));
        console2.log("03F3: ", string(utf8SoftDotted03F3));
        console2.logBytes(utf8SoftDotted03F3);

        string memory softDotted0456 = "\\u{softDotted0456}";
        bytes memory utf8SoftDotted0456 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted0456));
        console2.log("0456: ", string(utf8SoftDotted0456));
        console2.logBytes(utf8SoftDotted0456);

        string memory softDotted0458 = "\\u{softDotted0458}";
        bytes memory utf8SoftDotted0458 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted0458));
        console2.log("0458: ", string(utf8SoftDotted0458));
        console2.logBytes(utf8SoftDotted0458);

        string memory softDotted1D62 = "\\u{softDotted1D62}";
        bytes memory utf8SoftDotted1D62 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D62));
        console2.log("1D62: ", string(utf8SoftDotted1D62));
        console2.logBytes(utf8SoftDotted1D62);

        string memory softDotted1D96 = "\\u{softDotted1D96}";
        bytes memory utf8SoftDotted1D96 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D96));
        console2.log("1D96: ", string(utf8SoftDotted1D96));
        console2.logBytes(utf8SoftDotted1D96);

        string memory softDotted1DA4 = "\\u{softDotted1DA4}";
        bytes memory utf8SoftDotted1DA4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1DA4));
        console2.log("1DA4: ", string(utf8SoftDotted1DA4));
        console2.logBytes(utf8SoftDotted1DA4);

        string memory softDotted1DA8 = "\\u{softDotted1DA8}";
        bytes memory utf8SoftDotted1DA8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1DA8));
        console2.log("1DA8: ", string(utf8SoftDotted1DA8));
        console2.logBytes(utf8SoftDotted1DA8);

        string memory softDotted1E2D = "\\u{softDotted1E2D}";
        bytes memory utf8SoftDotted1E2D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1E2D));
        console2.log("1E2D: ", string(utf8SoftDotted1E2D));
        console2.logBytes(utf8SoftDotted1E2D);

        string memory softDotted1ECB = "\\u{softDotted1ECB}";
        bytes memory utf8SoftDotted1ECB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1ECB));
        console2.log("1ECB: ", string(utf8SoftDotted1ECB));
        console2.logBytes(utf8SoftDotted1ECB);

        string memory softDotted2071 = "\\u{softDotted2071}";
        bytes memory utf8SoftDotted2071 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted2071));
        console2.log("2071: ", string(utf8SoftDotted2071));
        console2.logBytes(utf8SoftDotted2071);

        string memory softDotted2148 = "\\u{softDotted2148}";
        bytes memory utf8SoftDotted2148 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted2148));
        console2.log("2148: ", string(utf8SoftDotted2148));
        console2.logBytes(utf8SoftDotted2148);

        console2.log("..");

        string memory softDotted2149 = "\\u{softDotted2149}";
        bytes memory utf8SoftDotted2149 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted2149));
        console2.log("2149: ", string(utf8SoftDotted2149));
        console2.logBytes(utf8SoftDotted2149);

        string memory softDotted2C7C = "\\u{softDotted2C7C}";
        bytes memory utf8SoftDotted2C7C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted2C7C));
        console2.log("2C7C: ", string(utf8SoftDotted2C7C));
        console2.logBytes(utf8SoftDotted2C7C);

        string memory softDotted1D422 = "\\u{softDotted1D422}";
        bytes memory utf8SoftDotted1D422 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D422));
        console2.log("1D422: ", string(utf8SoftDotted1D422));
        console2.logBytes(utf8SoftDotted1D422);

        console2.log("..");

        string memory softDotted1D423 = "\\u{softDotted1D423}";
        bytes memory utf8SoftDotted1D423 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D423));
        console2.log("1D423: ", string(utf8SoftDotted1D423));
        console2.logBytes(utf8SoftDotted1D423);

        string memory softDotted1D456 = "\\u{softDotted1D456}";
        bytes memory utf8SoftDotted1D456 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D456));
        console2.log("1D456: ", string(utf8SoftDotted1D456));
        console2.logBytes(utf8SoftDotted1D456);

        console2.log("..");

        string memory softDotted1D457 = "\\u{softDotted1D457}";
        bytes memory utf8SoftDotted1D457 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D457));
        console2.log("1D457: ", string(utf8SoftDotted1D457));
        console2.logBytes(utf8SoftDotted1D457);

        string memory softDotted1D48A = "\\u{softDotted1D48A}";
        bytes memory utf8SoftDotted1D48A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D48A));
        console2.log("1D48A: ", string(utf8SoftDotted1D48A));
        console2.logBytes(utf8SoftDotted1D48A);

        console2.log("..");

        string memory softDotted1D48B = "\\u{softDotted1D48B}";
        bytes memory utf8SoftDotted1D48B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D48B));
        console2.log("1D48B: ", string(utf8SoftDotted1D48B));
        console2.logBytes(utf8SoftDotted1D48B);

        string memory softDotted1D4BE = "\\u{softDotted1D4BE}";
        bytes memory utf8SoftDotted1D4BE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D4BE));
        console2.log("1D4BE: ", string(utf8SoftDotted1D4BE));
        console2.logBytes(utf8SoftDotted1D4BE);

        console2.log("..");

        string memory softDotted1D4BF = "\\u{softDotted1D4BF}";
        bytes memory utf8SoftDotted1D4BF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D4BF));
        console2.log("1D4BF: ", string(utf8SoftDotted1D4BF));
        console2.logBytes(utf8SoftDotted1D4BF);

        string memory softDotted1D4F2 = "\\u{softDotted1D4F2}";
        bytes memory utf8SoftDotted1D4F2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D4F2));
        console2.log("1D4F2: ", string(utf8SoftDotted1D4F2));
        console2.logBytes(utf8SoftDotted1D4F2);

        console2.log("..");

        string memory softDotted1D4F3 = "\\u{softDotted1D4F3}";
        bytes memory utf8SoftDotted1D4F3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D4F3));
        console2.log("1D4F3: ", string(utf8SoftDotted1D4F3));
        console2.logBytes(utf8SoftDotted1D4F3);

        string memory softDotted1D526 = "\\u{softDotted1D526}";
        bytes memory utf8SoftDotted1D526 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D526));
        console2.log("1D526: ", string(utf8SoftDotted1D526));
        console2.logBytes(utf8SoftDotted1D526);

        console2.log("..");

        string memory softDotted1D527 = "\\u{softDotted1D527}";
        bytes memory utf8SoftDotted1D527 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D527));
        console2.log("1D527: ", string(utf8SoftDotted1D527));
        console2.logBytes(utf8SoftDotted1D527);

        string memory softDotted1D55A = "\\u{softDotted1D55A}";
        bytes memory utf8SoftDotted1D55A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D55A));
        console2.log("1D55A: ", string(utf8SoftDotted1D55A));
        console2.logBytes(utf8SoftDotted1D55A);

        console2.log("..");

        string memory softDotted1D55B = "\\u{softDotted1D55B}";
        bytes memory utf8SoftDotted1D55B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D55B));
        console2.log("1D55B: ", string(utf8SoftDotted1D55B));
        console2.logBytes(utf8SoftDotted1D55B);

        string memory softDotted1D58E = "\\u{softDotted1D58E}";
        bytes memory utf8SoftDotted1D58E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D58E));
        console2.log("1D58E: ", string(utf8SoftDotted1D58E));
        console2.logBytes(utf8SoftDotted1D58E);

        console2.log("..");

        string memory softDotted1D58F = "\\u{softDotted1D58F}";
        bytes memory utf8SoftDotted1D58F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D58F));
        console2.log("1D58F: ", string(utf8SoftDotted1D58F));
        console2.logBytes(utf8SoftDotted1D58F);

        string memory softDotted1D5C2 = "\\u{softDotted1D5C2}";
        bytes memory utf8SoftDotted1D5C2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D5C2));
        console2.log("1D5C2: ", string(utf8SoftDotted1D5C2));
        console2.logBytes(utf8SoftDotted1D5C2);

        console2.log("..");

        string memory softDotted1D5C3 = "\\u{softDotted1D5C3}";
        bytes memory utf8SoftDotted1D5C3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D5C3));
        console2.log("1D5C3: ", string(utf8SoftDotted1D5C3));
        console2.logBytes(utf8SoftDotted1D5C3);

        string memory softDotted1D5F6 = "\\u{softDotted1D5F6}";
        bytes memory utf8SoftDotted1D5F6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D5F6));
        console2.log("1D5F6: ", string(utf8SoftDotted1D5F6));
        console2.logBytes(utf8SoftDotted1D5F6);

        console2.log("..");

        string memory softDotted1D5F7 = "\\u{softDotted1D5F7}";
        bytes memory utf8SoftDotted1D5F7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D5F7));
        console2.log("1D5F7: ", string(utf8SoftDotted1D5F7));
        console2.logBytes(utf8SoftDotted1D5F7);

        string memory softDotted1D62A = "\\u{softDotted1D62A}";
        bytes memory utf8SoftDotted1D62A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D62A));
        console2.log("1D62A: ", string(utf8SoftDotted1D62A));
        console2.logBytes(utf8SoftDotted1D62A);

        console2.log("..");

        string memory softDotted1D62B = "\\u{softDotted1D62B}";
        bytes memory utf8SoftDotted1D62B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D62B));
        console2.log("1D62B: ", string(utf8SoftDotted1D62B));
        console2.logBytes(utf8SoftDotted1D62B);

        string memory softDotted1D65E = "\\u{softDotted1D65E}";
        bytes memory utf8SoftDotted1D65E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D65E));
        console2.log("1D65E: ", string(utf8SoftDotted1D65E));
        console2.logBytes(utf8SoftDotted1D65E);

        console2.log("..");

        string memory softDotted1D65F = "\\u{softDotted1D65F}";
        bytes memory utf8SoftDotted1D65F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D65F));
        console2.log("1D65F: ", string(utf8SoftDotted1D65F));
        console2.logBytes(utf8SoftDotted1D65F);

        string memory softDotted1D692 = "\\u{softDotted1D692}";
        bytes memory utf8SoftDotted1D692 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D692));
        console2.log("1D692: ", string(utf8SoftDotted1D692));
        console2.logBytes(utf8SoftDotted1D692);

        console2.log("..");

        string memory softDotted1D693 = "\\u{softDotted1D693}";
        bytes memory utf8SoftDotted1D693 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1D693));
        console2.log("1D693: ", string(utf8SoftDotted1D693));
        console2.logBytes(utf8SoftDotted1D693);

        string memory softDotted1DF1A = "\\u{softDotted1DF1A}";
        bytes memory utf8SoftDotted1DF1A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1DF1A));
        console2.log("1DF1A: ", string(utf8SoftDotted1DF1A));
        console2.logBytes(utf8SoftDotted1DF1A);

        string memory softDotted1E04C = "\\u{softDotted1E04C}";
        bytes memory utf8SoftDotted1E04C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1E04C));
        console2.log("1E04C: ", string(utf8SoftDotted1E04C));
        console2.logBytes(utf8SoftDotted1E04C);

        console2.log("..");

        string memory softDotted1E04D = "\\u{softDotted1E04D}";
        bytes memory utf8SoftDotted1E04D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1E04D));
        console2.log("1E04D: ", string(utf8SoftDotted1E04D));
        console2.logBytes(utf8SoftDotted1E04D);

        string memory softDotted1E068 = "\\u{softDotted1E068}";
        bytes memory utf8SoftDotted1E068 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(softDotted1E068));
        console2.log("1E068: ", string(utf8SoftDotted1E068));
        console2.logBytes(utf8SoftDotted1E068);
    }

    function testRegexPropertyLogicalOrderException() public pure {
        string memory logicalOrderException0E40 = "\\u{0E40}";
        bytes memory utf8LogicalOrderException0E40 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(logicalOrderException0E40));
        console2.log("0E40: ", string(utf8LogicalOrderException0E40));
        console2.logBytes(utf8LogicalOrderException0E40);

        console2.log("..");

        string memory logicalOrderException0E44 = "\\u{0E44}";
        bytes memory utf8LogicalOrderException0E44 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(logicalOrderException0E44));
        console2.log("0E44: ", string(utf8LogicalOrderException0E44));
        console2.logBytes(utf8LogicalOrderException0E44);

        string memory logicalOrderException0EC0 = "\\u{0EC0}";
        bytes memory utf8LogicalOrderException0EC0 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(logicalOrderException0EC0));
        console2.log("0EC0: ", string(utf8LogicalOrderException0EC0));
        console2.logBytes(utf8LogicalOrderException0EC0);

        console2.log("..");

        string memory logicalOrderException0EC4 = "\\u{0EC4}";
        bytes memory utf8LogicalOrderException0EC4 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(logicalOrderException0EC4));
        console2.log("0EC4: ", string(utf8LogicalOrderException0EC4));
        console2.logBytes(utf8LogicalOrderException0EC4);

        string memory logicalOrderException19B5 = "\\u{19B5}";
        bytes memory utf8LogicalOrderException19B5 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(logicalOrderException19B5));
        console2.log("19B5: ", string(utf8LogicalOrderException19B5));
        console2.logBytes(utf8LogicalOrderException19B5);

        console2.log("..");

        string memory logicalOrderException19B7 = "\\u{19B7}";
        bytes memory utf8LogicalOrderException19B7 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(logicalOrderException19B7));
        console2.log("19B7: ", string(utf8LogicalOrderException19B7));
        console2.logBytes(utf8LogicalOrderException19B7);

        string memory logicalOrderException19BA = "\\u{19BA}";
        bytes memory utf8LogicalOrderException19BA =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(logicalOrderException19BA));
        console2.log("19BA: ", string(utf8LogicalOrderException19BA));
        console2.logBytes(utf8LogicalOrderException19BA);

        string memory logicalOrderExceptionAAB5 = "\\u{AAB5}";
        bytes memory utf8LogicalOrderExceptionAAB5 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(logicalOrderExceptionAAB5));
        console2.log("AAB5: ", string(utf8LogicalOrderExceptionAAB5));
        console2.logBytes(utf8LogicalOrderExceptionAAB5);

        console2.log("..");

        string memory logicalOrderExceptionAAB6 = "\\u{AAB6}";
        bytes memory utf8LogicalOrderExceptionAAB6 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(logicalOrderExceptionAAB6));
        console2.log("AAB6: ", string(utf8LogicalOrderExceptionAAB6));
        console2.logBytes(utf8LogicalOrderExceptionAAB6);

        string memory logicalOrderExceptionAAB9 = "\\u{AAB9}";
        bytes memory utf8LogicalOrderExceptionAAB9 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(logicalOrderExceptionAAB9));
        console2.log("AAB9: ", string(utf8LogicalOrderExceptionAAB9));
        console2.logBytes(utf8LogicalOrderExceptionAAB9);

        string memory logicalOrderExceptionAABB = "\\u{AABB}";
        bytes memory utf8LogicalOrderExceptionAABB =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(logicalOrderExceptionAABB));
        console2.log("AABB: ", string(utf8LogicalOrderExceptionAABB));
        console2.logBytes(utf8LogicalOrderExceptionAABB);

        console2.log("..");

        string memory logicalOrderExceptionAABC = "\\u{AABC}";
        bytes memory utf8LogicalOrderExceptionAABC =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(logicalOrderExceptionAABC));
        console2.log("AABC: ", string(utf8LogicalOrderExceptionAABC));
        console2.logBytes(utf8LogicalOrderExceptionAABC);
    }

    function testRegexPropertyOtherIDStart() public pure {
        string memory otherIdStart1885 = "\\u{1885}";
        bytes memory utf8OtherIdStart1885 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdStart1885));
        console2.log("1885: ", string(utf8OtherIdStart1885));
        console2.logBytes(utf8OtherIdStart1885);

        console2.log("..");

        string memory otherIdStart1886 = "\\u{1886}";
        bytes memory utf8OtherIdStart1886 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdStart1886));
        console2.log("1886: ", string(utf8OtherIdStart1886));
        console2.logBytes(utf8OtherIdStart1886);

        string memory otherIdStart2118 = "\\u{2118}";
        bytes memory utf8OtherIdStart2118 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdStart2118));
        console2.log("2118: ", string(utf8OtherIdStart2118));
        console2.logBytes(utf8OtherIdStart2118);

        string memory otherIdStart212E = "\\u{212E}";
        bytes memory utf8OtherIdStart212E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdStart212E));
        console2.log("212E: ", string(utf8OtherIdStart212E));
        console2.logBytes(utf8OtherIdStart212E);

        string memory otherIdStart309B = "\\u{309B}";
        bytes memory utf8OtherIdStart309B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdStart309B));
        console2.log("309B: ", string(utf8OtherIdStart309B));
        console2.logBytes(utf8OtherIdStart309B);

        console2.log("..");

        string memory otherIdStart309C = "\\u{309C}";
        bytes memory utf8OtherIdStart309C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdStart309C));
        console2.log("309C: ", string(utf8OtherIdStart309C));
        console2.logBytes(utf8OtherIdStart309C);
    }

    function testRegexPropertyOtherIDContinue() public pure {
        string memory otherIdContinue00B7 = "\\u{00B7}";
        bytes memory utf8OtherIdContinue00B7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdContinue00B7));
        console2.log("00B7: ", string(utf8OtherIdContinue00B7));
        console2.logBytes(utf8OtherIdContinue00B7);

        string memory otherIdContinue0387 = "\\u{0387}";
        bytes memory utf8OtherIdContinue0387 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdContinue0387));
        console2.log("0387: ", string(utf8OtherIdContinue0387));
        console2.logBytes(utf8OtherIdContinue0387);

        string memory otherIdContinue1369 = "\\u{1369}";
        bytes memory utf8OtherIdContinue1369 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdContinue1369));
        console2.log("1369: ", string(utf8OtherIdContinue1369));
        console2.logBytes(utf8OtherIdContinue1369);

        console2.log("..");

        string memory otherIdContinue1371 = "\\u{1371}";
        bytes memory utf8OtherIdContinue1371 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdContinue1371));
        console2.log("1371: ", string(utf8OtherIdContinue1371));
        console2.logBytes(utf8OtherIdContinue1371);

        string memory otherIdContinue19DA = "\\u{19DA}";
        bytes memory utf8OtherIdContinue19DA = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdContinue19DA));
        console2.log("19DA: ", string(utf8OtherIdContinue19DA));
        console2.logBytes(utf8OtherIdContinue19DA);

        string memory otherIdContinue200C = "\\u{200C}";
        bytes memory utf8OtherIdContinue200C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdContinue200C));
        console2.log("200C: ", string(utf8OtherIdContinue200C));
        console2.logBytes(utf8OtherIdContinue200C);

        console2.log("..");

        string memory otherIdContinue200D = "\\u{200D}";
        bytes memory utf8OtherIdContinue200D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdContinue200D));
        console2.log("200D: ", string(utf8OtherIdContinue200D));
        console2.logBytes(utf8OtherIdContinue200D);

        string memory otherIdContinue30FB = "\\u{30FB}";
        bytes memory utf8OtherIdContinue30FB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdContinue30FB));
        console2.log("30FB: ", string(utf8OtherIdContinue30FB));
        console2.logBytes(utf8OtherIdContinue30FB);

        string memory otherIdContinueFF65 = "\\u{FF65}";
        bytes memory utf8OtherIdContinueFF65 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(otherIdContinueFF65));
        console2.log("FF65: ", string(utf8OtherIdContinueFF65));
        console2.logBytes(utf8OtherIdContinueFF65);
    }

    function testRegexPropertyIDCompatMathContinue() public pure {
        string memory idCompatMathContinue00B2 = "\\u{00B2}";
        bytes memory utf8IdCompatMathContinue00B2 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue00B2));
        console2.log("00B2: ", string(utf8IdCompatMathContinue00B2));
        console2.logBytes(utf8IdCompatMathContinue00B2);

        console2.log("..");

        string memory idCompatMathContinue00B3 = "\\u{00B3}";
        bytes memory utf8IdCompatMathContinue00B3 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue00B3));
        console2.log("00B3: ", string(utf8IdCompatMathContinue00B3));
        console2.logBytes(utf8IdCompatMathContinue00B3);

        string memory idCompatMathContinue00B9 = "\\u{00B9}";
        bytes memory utf8IdCompatMathContinue00B9 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue00B9));
        console2.log("00B9: ", string(utf8IdCompatMathContinue00B9));
        console2.logBytes(utf8IdCompatMathContinue00B9);

        string memory idCompatMathContinue2070 = "\\u{2070}";
        bytes memory utf8IdCompatMathContinue2070 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue2070));
        console2.log("2070: ", string(utf8IdCompatMathContinue2070));
        console2.logBytes(utf8IdCompatMathContinue2070);

        string memory idCompatMathContinue2074 = "\\u{2074}";
        bytes memory utf8IdCompatMathContinue2074 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue2074));
        console2.log("2074: ", string(utf8IdCompatMathContinue2074));
        console2.logBytes(utf8IdCompatMathContinue2074);

        console2.log("..");

        string memory idCompatMathContinue2079 = "\\u{2079}";
        bytes memory utf8IdCompatMathContinue2079 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue2079));
        console2.log("2079: ", string(utf8IdCompatMathContinue2079));
        console2.logBytes(utf8IdCompatMathContinue2079);

        string memory idCompatMathContinue207A = "\\u{207A}";
        bytes memory utf8IdCompatMathContinue207A =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue207A));
        console2.log("207A: ", string(utf8IdCompatMathContinue207A));
        console2.logBytes(utf8IdCompatMathContinue207A);

        console2.log("..");

        string memory idCompatMathContinue207C = "\\u{207C}";
        bytes memory utf8IdCompatMathContinue207C =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue207C));
        console2.log("207C: ", string(utf8IdCompatMathContinue207C));
        console2.logBytes(utf8IdCompatMathContinue207C);

        string memory idCompatMathContinue207D = "\\u{207D}";
        bytes memory utf8IdCompatMathContinue207D =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue207D));
        console2.log("207D: ", string(utf8IdCompatMathContinue207D));
        console2.logBytes(utf8IdCompatMathContinue207D);

        string memory idCompatMathContinue207E = "\\u{207E}";
        bytes memory utf8IdCompatMathContinue207E =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue207E));
        console2.log("207E: ", string(utf8IdCompatMathContinue207E));
        console2.logBytes(utf8IdCompatMathContinue207E);

        string memory idCompatMathContinue2080 = "\\u{2080}";
        bytes memory utf8IdCompatMathContinue2080 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue2080));
        console2.log("2080: ", string(utf8IdCompatMathContinue2080));
        console2.logBytes(utf8IdCompatMathContinue2080);

        console2.log("..");

        string memory idCompatMathContinue2089 = "\\u{2089}";
        bytes memory utf8IdCompatMathContinue2089 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue2089));
        console2.log("2089: ", string(utf8IdCompatMathContinue2089));
        console2.logBytes(utf8IdCompatMathContinue2089);

        string memory idCompatMathContinue208A = "\\u{208A}";
        bytes memory utf8IdCompatMathContinue208A =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue208A));
        console2.log("208A: ", string(utf8IdCompatMathContinue208A));
        console2.logBytes(utf8IdCompatMathContinue208A);

        console2.log("..");

        string memory idCompatMathContinue208C = "\\u{208C}";
        bytes memory utf8IdCompatMathContinue208C =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue208C));
        console2.log("208C: ", string(utf8IdCompatMathContinue208C));
        console2.logBytes(utf8IdCompatMathContinue208C);

        string memory idCompatMathContinue208D = "\\u{208D}";
        bytes memory utf8IdCompatMathContinue208D =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue208D));
        console2.log("208D: ", string(utf8IdCompatMathContinue208D));
        console2.logBytes(utf8IdCompatMathContinue208D);

        string memory idCompatMathContinue208E = "\\u{208E}";
        bytes memory utf8IdCompatMathContinue208E =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue208E));
        console2.log("208E: ", string(utf8IdCompatMathContinue208E));
        console2.logBytes(utf8IdCompatMathContinue208E);

        string memory idCompatMathContinue2202 = "\\u{2202}";
        bytes memory utf8IdCompatMathContinue2202 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue2202));
        console2.log("2202: ", string(utf8IdCompatMathContinue2202));
        console2.logBytes(utf8IdCompatMathContinue2202);

        string memory idCompatMathContinue2207 = "\\u{2207}";
        bytes memory utf8IdCompatMathContinue2207 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue2207));
        console2.log("2207: ", string(utf8IdCompatMathContinue2207));
        console2.logBytes(utf8IdCompatMathContinue2207);

        string memory idCompatMathContinue221E = "\\u{221E}";
        bytes memory utf8IdCompatMathContinue221E =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue221E));
        console2.log("221E: ", string(utf8IdCompatMathContinue221E));
        console2.logBytes(utf8IdCompatMathContinue221E);

        string memory idCompatMathContinue1D6C1 = "\\u{1D6C1}";
        bytes memory utf8IdCompatMathContinue1D6C1 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue1D6C1));
        console2.log("1D6C1: ", string(utf8IdCompatMathContinue1D6C1));
        console2.logBytes(utf8IdCompatMathContinue1D6C1);

        string memory idCompatMathContinue1D6DB = "\\u{1D6DB}";
        bytes memory utf8IdCompatMathContinue1D6DB =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue1D6DB));
        console2.log("1D6DB: ", string(utf8IdCompatMathContinue1D6DB));
        console2.logBytes(utf8IdCompatMathContinue1D6DB);

        string memory idCompatMathContinue1D6FB = "\\u{1D6FB}";
        bytes memory utf8IdCompatMathContinue1D6FB =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue1D6FB));
        console2.log("1D6FB: ", string(utf8IdCompatMathContinue1D6FB));
        console2.logBytes(utf8IdCompatMathContinue1D6FB);

        string memory idCompatMathContinue1D715 = "\\u{1D715}";
        bytes memory utf8IdCompatMathContinue1D715 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue1D715));
        console2.log("1D715: ", string(utf8IdCompatMathContinue1D715));
        console2.logBytes(utf8IdCompatMathContinue1D715);

        string memory idCompatMathContinue1D735 = "\\u{1D735}";
        bytes memory utf8IdCompatMathContinue1D735 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue1D735));
        console2.log("1D735: ", string(utf8IdCompatMathContinue1D735));
        console2.logBytes(utf8IdCompatMathContinue1D735);

        string memory idCompatMathContinue1D74F = "\\u{1D74F}";
        bytes memory utf8IdCompatMathContinue1D74F =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue1D74F));
        console2.log("1D74F: ", string(utf8IdCompatMathContinue1D74F));
        console2.logBytes(utf8IdCompatMathContinue1D74F);

        string memory idCompatMathContinue1D76F = "\\u{1D76F}";
        bytes memory utf8IdCompatMathContinue1D76F =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue1D76F));
        console2.log("1D76F: ", string(utf8IdCompatMathContinue1D76F));
        console2.logBytes(utf8IdCompatMathContinue1D76F);

        string memory idCompatMathContinue1D789 = "\\u{1D789}";
        bytes memory utf8IdCompatMathContinue1D789 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue1D789));
        console2.log("1D789: ", string(utf8IdCompatMathContinue1D789));
        console2.logBytes(utf8IdCompatMathContinue1D789);

        string memory idCompatMathContinue1D7A9 = "\\u{1D7A9}";
        bytes memory utf8IdCompatMathContinue1D7A9 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue1D7A9));
        console2.log("1D7A9: ", string(utf8IdCompatMathContinue1D7A9));
        console2.logBytes(utf8IdCompatMathContinue1D7A9);

        string memory idCompatMathContinue1D7C3 = "\\u{1D7C3}";
        bytes memory utf8IdCompatMathContinue1D7C3 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(idCompatMathContinue1D7C3));
        console2.log("1D7C3: ", string(utf8IdCompatMathContinue1D7C3));
        console2.logBytes(utf8IdCompatMathContinue1D7C3);
    }

    function testRegexPropertySentenceTerminal() public pure {
        string memory sentenceTerminal0021 = "\\u{0021}";
        bytes memory utf8SentenceTerminal0021 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal0021));
        console2.log("0021: ", string(utf8SentenceTerminal0021));
        console2.logBytes(utf8SentenceTerminal0021);

        string memory sentenceTerminal002E = "\\u{002E}";
        bytes memory utf8SentenceTerminal002E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal002E));
        console2.log("002E: ", string(utf8SentenceTerminal002E));
        console2.logBytes(utf8SentenceTerminal002E);

        string memory sentenceTerminal003F = "\\u{003F}";
        bytes memory utf8SentenceTerminal003F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal003F));
        console2.log("003F: ", string(utf8SentenceTerminal003F));
        console2.logBytes(utf8SentenceTerminal003F);

        string memory sentenceTerminal0589 = "\\u{0589}";
        bytes memory utf8SentenceTerminal0589 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal0589));
        console2.log("0589: ", string(utf8SentenceTerminal0589));
        console2.logBytes(utf8SentenceTerminal0589);

        string memory sentenceTerminal061D = "\\u{061D}";
        bytes memory utf8SentenceTerminal061D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal061D));
        console2.log("061D: ", string(utf8SentenceTerminal061D));
        console2.logBytes(utf8SentenceTerminal061D);

        console2.log("..");

        string memory sentenceTerminal061F = "\\u{061F}";
        bytes memory utf8SentenceTerminal061F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal061F));
        console2.log("061F: ", string(utf8SentenceTerminal061F));
        console2.logBytes(utf8SentenceTerminal061F);

        string memory sentenceTerminal06D4 = "\\u{06D4}";
        bytes memory utf8SentenceTerminal06D4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal06D4));
        console2.log("06D4: ", string(utf8SentenceTerminal06D4));
        console2.logBytes(utf8SentenceTerminal06D4);

        string memory sentenceTerminal0700 = "\\u{0700}";
        bytes memory utf8SentenceTerminal0700 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal0700));
        console2.log("0700: ", string(utf8SentenceTerminal0700));
        console2.logBytes(utf8SentenceTerminal0700);

        console2.log("..");

        string memory sentenceTerminal0702 = "\\u{0702}";
        bytes memory utf8SentenceTerminal0702 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal0702));
        console2.log("0702: ", string(utf8SentenceTerminal0702));
        console2.logBytes(utf8SentenceTerminal0702);

        string memory sentenceTerminal07F9 = "\\u{07F9}";
        bytes memory utf8SentenceTerminal07F9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal07F9));
        console2.log("07F9: ", string(utf8SentenceTerminal07F9));
        console2.logBytes(utf8SentenceTerminal07F9);

        string memory sentenceTerminal0837 = "\\u{0837}";
        bytes memory utf8SentenceTerminal0837 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal0837));
        console2.log("0837: ", string(utf8SentenceTerminal0837));
        console2.logBytes(utf8SentenceTerminal0837);

        string memory sentenceTerminal0839 = "\\u{0839}";
        bytes memory utf8SentenceTerminal0839 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal0839));
        console2.log("0839: ", string(utf8SentenceTerminal0839));
        console2.logBytes(utf8SentenceTerminal0839);

        string memory sentenceTerminal083D = "\\u{083D}";
        bytes memory utf8SentenceTerminal083D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal083D));
        console2.log("083D: ", string(utf8SentenceTerminal083D));
        console2.logBytes(utf8SentenceTerminal083D);

        console2.log("..");

        string memory sentenceTerminal083E = "\\u{083E}";
        bytes memory utf8SentenceTerminal083E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal083E));
        console2.log("083E: ", string(utf8SentenceTerminal083E));
        console2.logBytes(utf8SentenceTerminal083E);

        string memory sentenceTerminal0964 = "\\u{0964}";
        bytes memory utf8SentenceTerminal0964 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal0964));
        console2.log("0964: ", string(utf8SentenceTerminal0964));
        console2.logBytes(utf8SentenceTerminal0964);

        console2.log("..");

        string memory sentenceTerminal0965 = "\\u{0965}";
        bytes memory utf8SentenceTerminal0965 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal0965));
        console2.log("0965: ", string(utf8SentenceTerminal0965));
        console2.logBytes(utf8SentenceTerminal0965);

        string memory sentenceTerminal104A = "\\u{104A}";
        bytes memory utf8SentenceTerminal104A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal104A));
        console2.log("104A: ", string(utf8SentenceTerminal104A));
        console2.logBytes(utf8SentenceTerminal104A);

        console2.log("..");

        string memory sentenceTerminal104B = "\\u{104B}";
        bytes memory utf8SentenceTerminal104B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal104B));
        console2.log("104B: ", string(utf8SentenceTerminal104B));
        console2.logBytes(utf8SentenceTerminal104B);

        string memory sentenceTerminal1362 = "\\u{1362}";
        bytes memory utf8SentenceTerminal1362 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1362));
        console2.log("1362: ", string(utf8SentenceTerminal1362));
        console2.logBytes(utf8SentenceTerminal1362);

        string memory sentenceTerminal1367 = "\\u{1367}";
        bytes memory utf8SentenceTerminal1367 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1367));
        console2.log("1367: ", string(utf8SentenceTerminal1367));
        console2.logBytes(utf8SentenceTerminal1367);

        console2.log("..");

        string memory sentenceTerminal1368 = "\\u{1368}";
        bytes memory utf8SentenceTerminal1368 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1368));
        console2.log("1368: ", string(utf8SentenceTerminal1368));
        console2.logBytes(utf8SentenceTerminal1368);

        string memory sentenceTerminal166E = "\\u{166E}";
        bytes memory utf8SentenceTerminal166E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal166E));
        console2.log("166E: ", string(utf8SentenceTerminal166E));
        console2.logBytes(utf8SentenceTerminal166E);

        string memory sentenceTerminal1735 = "\\u{1735}";
        bytes memory utf8SentenceTerminal1735 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1735));
        console2.log("1735: ", string(utf8SentenceTerminal1735));
        console2.logBytes(utf8SentenceTerminal1735);

        console2.log("..");

        string memory sentenceTerminal1736 = "\\u{1736}";
        bytes memory utf8SentenceTerminal1736 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1736));
        console2.log("1736: ", string(utf8SentenceTerminal1736));
        console2.logBytes(utf8SentenceTerminal1736);

        string memory sentenceTerminal17D4 = "\\u{17D4}";
        bytes memory utf8SentenceTerminal17D4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal17D4));
        console2.log("17D4: ", string(utf8SentenceTerminal17D4));
        console2.logBytes(utf8SentenceTerminal17D4);

        console2.log("..");

        string memory sentenceTerminal17D5 = "\\u{17D5}";
        bytes memory utf8SentenceTerminal17D5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal17D5));
        console2.log("17D5: ", string(utf8SentenceTerminal17D5));
        console2.logBytes(utf8SentenceTerminal17D5);

        string memory sentenceTerminal1803 = "\\u{1803}";
        bytes memory utf8SentenceTerminal1803 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1803));
        console2.log("1803: ", string(utf8SentenceTerminal1803));
        console2.logBytes(utf8SentenceTerminal1803);

        string memory sentenceTerminal1809 = "\\u{1809}";
        bytes memory utf8SentenceTerminal1809 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1809));
        console2.log("1809: ", string(utf8SentenceTerminal1809));
        console2.logBytes(utf8SentenceTerminal1809);

        string memory sentenceTerminal1944 = "\\u{1944}";
        bytes memory utf8SentenceTerminal1944 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1944));
        console2.log("1944: ", string(utf8SentenceTerminal1944));
        console2.logBytes(utf8SentenceTerminal1944);

        console2.log("..");

        string memory sentenceTerminal1945 = "\\u{1945}";
        bytes memory utf8SentenceTerminal1945 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1945));
        console2.log("1945: ", string(utf8SentenceTerminal1945));
        console2.logBytes(utf8SentenceTerminal1945);

        string memory sentenceTerminal1AA8 = "\\u{1AA8}";
        bytes memory utf8SentenceTerminal1AA8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1AA8));
        console2.log("1AA8: ", string(utf8SentenceTerminal1AA8));
        console2.logBytes(utf8SentenceTerminal1AA8);

        console2.log("..");

        string memory sentenceTerminal1AAB = "\\u{1AAB}";
        bytes memory utf8SentenceTerminal1AAB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1AAB));
        console2.log("1AAB: ", string(utf8SentenceTerminal1AAB));
        console2.logBytes(utf8SentenceTerminal1AAB);

        string memory sentenceTerminal1B4E = "\\u{1B4E}";
        bytes memory utf8SentenceTerminal1B4E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1B4E));
        console2.log("1B4E: ", string(utf8SentenceTerminal1B4E));
        console2.logBytes(utf8SentenceTerminal1B4E);

        console2.log("..");

        string memory sentenceTerminal1B4F = "\\u{1B4F}";
        bytes memory utf8SentenceTerminal1B4F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1B4F));
        console2.log("1B4F: ", string(utf8SentenceTerminal1B4F));
        console2.logBytes(utf8SentenceTerminal1B4F);

        string memory sentenceTerminal1B5A = "\\u{1B5A}";
        bytes memory utf8SentenceTerminal1B5A = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1B5A));
        console2.log("1B5A: ", string(utf8SentenceTerminal1B5A));
        console2.logBytes(utf8SentenceTerminal1B5A);

        console2.log("..");

        string memory sentenceTerminal1B5B = "\\u{1B5B}";
        bytes memory utf8SentenceTerminal1B5B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1B5B));
        console2.log("1B5B: ", string(utf8SentenceTerminal1B5B));
        console2.logBytes(utf8SentenceTerminal1B5B);

        string memory sentenceTerminal1B5E = "\\u{1B5E}";
        bytes memory utf8SentenceTerminal1B5E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1B5E));
        console2.log("1B5E: ", string(utf8SentenceTerminal1B5E));
        console2.logBytes(utf8SentenceTerminal1B5E);

        console2.log("..");

        string memory sentenceTerminal1B5F = "\\u{1B5F}";
        bytes memory utf8SentenceTerminal1B5F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1B5F));
        console2.log("1B5F: ", string(utf8SentenceTerminal1B5F));
        console2.logBytes(utf8SentenceTerminal1B5F);

        string memory sentenceTerminal1B7D = "\\u{1B7D}";
        bytes memory utf8SentenceTerminal1B7D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1B7D));
        console2.log("1B7D: ", string(utf8SentenceTerminal1B7D));
        console2.logBytes(utf8SentenceTerminal1B7D);

        console2.log("..");

        string memory sentenceTerminal1B7F = "\\u{1B7F}";
        bytes memory utf8SentenceTerminal1B7F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1B7F));
        console2.log("1B7F: ", string(utf8SentenceTerminal1B7F));
        console2.logBytes(utf8SentenceTerminal1B7F);

        string memory sentenceTerminal1C3B = "\\u{1C3B}";
        bytes memory utf8SentenceTerminal1C3B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1C3B));
        console2.log("1C3B: ", string(utf8SentenceTerminal1C3B));
        console2.logBytes(utf8SentenceTerminal1C3B);

        console2.log("..");

        string memory sentenceTerminal1C3C = "\\u{1C3C}";
        bytes memory utf8SentenceTerminal1C3C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1C3C));
        console2.log("1C3C: ", string(utf8SentenceTerminal1C3C));
        console2.logBytes(utf8SentenceTerminal1C3C);

        string memory sentenceTerminal1C7E = "\\u{1C7E}";
        bytes memory utf8SentenceTerminal1C7E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1C7E));
        console2.log("1C7E: ", string(utf8SentenceTerminal1C7E));
        console2.logBytes(utf8SentenceTerminal1C7E);

        console2.log("..");

        string memory sentenceTerminal1C7F = "\\u{1C7F}";
        bytes memory utf8SentenceTerminal1C7F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1C7F));
        console2.log("1C7F: ", string(utf8SentenceTerminal1C7F));
        console2.logBytes(utf8SentenceTerminal1C7F);

        string memory sentenceTerminal2024 = "\\u{2024}";
        bytes memory utf8SentenceTerminal2024 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal2024));
        console2.log("2024: ", string(utf8SentenceTerminal2024));
        console2.logBytes(utf8SentenceTerminal2024);

        string memory sentenceTerminal203C = "\\u{203C}";
        bytes memory utf8SentenceTerminal203C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal203C));
        console2.log("203C: ", string(utf8SentenceTerminal203C));
        console2.logBytes(utf8SentenceTerminal203C);

        console2.log("..");

        string memory sentenceTerminal203D = "\\u{203D}";
        bytes memory utf8SentenceTerminal203D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal203D));
        console2.log("203D: ", string(utf8SentenceTerminal203D));
        console2.logBytes(utf8SentenceTerminal203D);

        string memory sentenceTerminal2047 = "\\u{2047}";
        bytes memory utf8SentenceTerminal2047 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal2047));
        console2.log("2047: ", string(utf8SentenceTerminal2047));
        console2.logBytes(utf8SentenceTerminal2047);

        console2.log("..");

        string memory sentenceTerminal2049 = "\\u{2049}";
        bytes memory utf8SentenceTerminal2049 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal2049));
        console2.log("2049: ", string(utf8SentenceTerminal2049));
        console2.logBytes(utf8SentenceTerminal2049);

        string memory sentenceTerminal2CF9 = "\\u{2CF9}";
        bytes memory utf8SentenceTerminal2CF9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal2CF9));
        console2.log("2CF9: ", string(utf8SentenceTerminal2CF9));
        console2.logBytes(utf8SentenceTerminal2CF9);

        console2.log("..");

        string memory sentenceTerminal2CFB = "\\u{2CFB}";
        bytes memory utf8SentenceTerminal2CFB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal2CFB));
        console2.log("2CFB: ", string(utf8SentenceTerminal2CFB));
        console2.logBytes(utf8SentenceTerminal2CFB);

        string memory sentenceTerminal2E2E = "\\u{2E2E}";
        bytes memory utf8SentenceTerminal2E2E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal2E2E));
        console2.log("2E2E: ", string(utf8SentenceTerminal2E2E));
        console2.logBytes(utf8SentenceTerminal2E2E);

        string memory sentenceTerminal2E3C = "\\u{2E3C}";
        bytes memory utf8SentenceTerminal2E3C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal2E3C));
        console2.log("2E3C: ", string(utf8SentenceTerminal2E3C));
        console2.logBytes(utf8SentenceTerminal2E3C);

        string memory sentenceTerminal2E53 = "\\u{2E53}";
        bytes memory utf8SentenceTerminal2E53 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal2E53));
        console2.log("2E53: ", string(utf8SentenceTerminal2E53));
        console2.logBytes(utf8SentenceTerminal2E53);

        console2.log("..");

        string memory sentenceTerminal2E54 = "\\u{2E54}";
        bytes memory utf8SentenceTerminal2E54 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal2E54));
        console2.log("2E54: ", string(utf8SentenceTerminal2E54));
        console2.logBytes(utf8SentenceTerminal2E54);

        string memory sentenceTerminal3002 = "\\u{3002}";
        bytes memory utf8SentenceTerminal3002 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal3002));
        console2.log("3002: ", string(utf8SentenceTerminal3002));
        console2.logBytes(utf8SentenceTerminal3002);

        string memory sentenceTerminalA4FF = "\\u{A4FF}";
        bytes memory utf8SentenceTerminalA4FF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalA4FF));
        console2.log("A4FF: ", string(utf8SentenceTerminalA4FF));
        console2.logBytes(utf8SentenceTerminalA4FF);

        string memory sentenceTerminalA60E = "\\u{A60E}";
        bytes memory utf8SentenceTerminalA60E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalA60E));
        console2.log("A60E: ", string(utf8SentenceTerminalA60E));
        console2.logBytes(utf8SentenceTerminalA60E);

        console2.log("..");

        string memory sentenceTerminalA60F = "\\u{A60F}";
        bytes memory utf8SentenceTerminalA60F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalA60F));
        console2.log("A60F: ", string(utf8SentenceTerminalA60F));
        console2.logBytes(utf8SentenceTerminalA60F);

        string memory sentenceTerminalA6F3 = "\\u{A6F3}";
        bytes memory utf8SentenceTerminalA6F3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalA6F3));
        console2.log("A6F3: ", string(utf8SentenceTerminalA6F3));
        console2.logBytes(utf8SentenceTerminalA6F3);

        string memory sentenceTerminalA6F7 = "\\u{A6F7}";
        bytes memory utf8SentenceTerminalA6F7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalA6F7));
        console2.log("A6F7: ", string(utf8SentenceTerminalA6F7));
        console2.logBytes(utf8SentenceTerminalA6F7);

        string memory sentenceTerminalA876 = "\\u{A876}";
        bytes memory utf8SentenceTerminalA876 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalA876));
        console2.log("A876: ", string(utf8SentenceTerminalA876));
        console2.logBytes(utf8SentenceTerminalA876);

        console2.log("..");

        string memory sentenceTerminalA877 = "\\u{A877}";
        bytes memory utf8SentenceTerminalA877 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalA877));
        console2.log("A877: ", string(utf8SentenceTerminalA877));
        console2.logBytes(utf8SentenceTerminalA877);

        string memory sentenceTerminalA8CE = "\\u{A8CE}";
        bytes memory utf8SentenceTerminalA8CE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalA8CE));
        console2.log("A8CE: ", string(utf8SentenceTerminalA8CE));
        console2.logBytes(utf8SentenceTerminalA8CE);

        console2.log("..");

        string memory sentenceTerminalA8CF = "\\u{A8CF}";
        bytes memory utf8SentenceTerminalA8CF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalA8CF));
        console2.log("A8CF: ", string(utf8SentenceTerminalA8CF));
        console2.logBytes(utf8SentenceTerminalA8CF);

        string memory sentenceTerminalA92F = "\\u{A92F}";
        bytes memory utf8SentenceTerminalA92F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalA92F));
        console2.log("A92F: ", string(utf8SentenceTerminalA92F));
        console2.logBytes(utf8SentenceTerminalA92F);

        string memory sentenceTerminalA9C8 = "\\u{A9C8}";
        bytes memory utf8SentenceTerminalA9C8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalA9C8));
        console2.log("A9C8: ", string(utf8SentenceTerminalA9C8));
        console2.logBytes(utf8SentenceTerminalA9C8);

        console2.log("..");

        string memory sentenceTerminalA9C9 = "\\u{A9C9}";
        bytes memory utf8SentenceTerminalA9C9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalA9C9));
        console2.log("A9C9: ", string(utf8SentenceTerminalA9C9));
        console2.logBytes(utf8SentenceTerminalA9C9);

        string memory sentenceTerminalAA5D = "\\u{AA5D}";
        bytes memory utf8SentenceTerminalAA5D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalAA5D));
        console2.log("AA5D: ", string(utf8SentenceTerminalAA5D));
        console2.logBytes(utf8SentenceTerminalAA5D);

        console2.log("..");

        string memory sentenceTerminalAA5F = "\\u{AA5F}";
        bytes memory utf8SentenceTerminalAA5F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalAA5F));
        console2.log("AA5F: ", string(utf8SentenceTerminalAA5F));
        console2.logBytes(utf8SentenceTerminalAA5F);

        string memory sentenceTerminalAAF0 = "\\u{AAF0}";
        bytes memory utf8SentenceTerminalAAF0 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalAAF0));
        console2.log("AAF0: ", string(utf8SentenceTerminalAAF0));
        console2.logBytes(utf8SentenceTerminalAAF0);

        console2.log("..");

        string memory sentenceTerminalAAF1 = "\\u{AAF1}";
        bytes memory utf8SentenceTerminalAAF1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalAAF1));
        console2.log("AAF1: ", string(utf8SentenceTerminalAAF1));
        console2.logBytes(utf8SentenceTerminalAAF1);

        string memory sentenceTerminalABEB = "\\u{ABEB}";
        bytes memory utf8SentenceTerminalABEB = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalABEB));
        console2.log("ABEB: ", string(utf8SentenceTerminalABEB));
        console2.logBytes(utf8SentenceTerminalABEB);

        string memory sentenceTerminalFE12 = "\\u{FE12}";
        bytes memory utf8SentenceTerminalFE12 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalFE12));
        console2.log("FE12: ", string(utf8SentenceTerminalFE12));
        console2.logBytes(utf8SentenceTerminalFE12);

        string memory sentenceTerminalFE15 = "\\u{FE15}";
        bytes memory utf8SentenceTerminalFE15 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalFE15));
        console2.log("FE15: ", string(utf8SentenceTerminalFE15));
        console2.logBytes(utf8SentenceTerminalFE15);

        console2.log("..");

        string memory sentenceTerminalFE16 = "\\u{FE16}";
        bytes memory utf8SentenceTerminalFE16 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalFE16));
        console2.log("FE16: ", string(utf8SentenceTerminalFE16));
        console2.logBytes(utf8SentenceTerminalFE16);

        string memory sentenceTerminalFE52 = "\\u{FE52}";
        bytes memory utf8SentenceTerminalFE52 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalFE52));
        console2.log("FE52: ", string(utf8SentenceTerminalFE52));
        console2.logBytes(utf8SentenceTerminalFE52);

        string memory sentenceTerminalFE56 = "\\u{FE56}";
        bytes memory utf8SentenceTerminalFE56 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalFE56));
        console2.log("FE56: ", string(utf8SentenceTerminalFE56));
        console2.logBytes(utf8SentenceTerminalFE56);

        console2.log("..");

        string memory sentenceTerminalFE57 = "\\u{FE57}";
        bytes memory utf8SentenceTerminalFE57 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalFE57));
        console2.log("FE57: ", string(utf8SentenceTerminalFE57));
        console2.logBytes(utf8SentenceTerminalFE57);

        string memory sentenceTerminalFF01 = "\\u{FF01}";
        bytes memory utf8SentenceTerminalFF01 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalFF01));
        console2.log("FF01: ", string(utf8SentenceTerminalFF01));
        console2.logBytes(utf8SentenceTerminalFF01);

        string memory sentenceTerminalFF0E = "\\u{FF0E}";
        bytes memory utf8SentenceTerminalFF0E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalFF0E));
        console2.log("FF0E: ", string(utf8SentenceTerminalFF0E));
        console2.logBytes(utf8SentenceTerminalFF0E);

        string memory sentenceTerminalFF1F = "\\u{FF1F}";
        bytes memory utf8SentenceTerminalFF1F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalFF1F));
        console2.log("FF1F: ", string(utf8SentenceTerminalFF1F));
        console2.logBytes(utf8SentenceTerminalFF1F);

        string memory sentenceTerminalFF61 = "\\u{FF61}";
        bytes memory utf8SentenceTerminalFF61 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminalFF61));
        console2.log("FF61: ", string(utf8SentenceTerminalFF61));
        console2.logBytes(utf8SentenceTerminalFF61);

        string memory sentenceTerminal10A56 = "\\u{10A56}";
        bytes memory utf8SentenceTerminal10A56 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal10A56));
        console2.log("10A56: ", string(utf8SentenceTerminal10A56));
        console2.logBytes(utf8SentenceTerminal10A56);

        console2.log("..");

        string memory sentenceTerminal10A57 = "\\u{10A57}";
        bytes memory utf8SentenceTerminal10A57 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal10A57));
        console2.log("10A57: ", string(utf8SentenceTerminal10A57));
        console2.logBytes(utf8SentenceTerminal10A57);

        string memory sentenceTerminal10F55 = "\\u{10F55}";
        bytes memory utf8SentenceTerminal10F55 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal10F55));
        console2.log("10F55: ", string(utf8SentenceTerminal10F55));
        console2.logBytes(utf8SentenceTerminal10F55);

        console2.log("..");

        string memory sentenceTerminal10F59 = "\\u{10F59}";
        bytes memory utf8SentenceTerminal10F59 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal10F59));
        console2.log("10F59: ", string(utf8SentenceTerminal10F59));
        console2.logBytes(utf8SentenceTerminal10F59);

        string memory sentenceTerminal10F86 = "\\u{10F86}";
        bytes memory utf8SentenceTerminal10F86 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal10F86));
        console2.log("10F86: ", string(utf8SentenceTerminal10F86));
        console2.logBytes(utf8SentenceTerminal10F86);

        console2.log("..");

        string memory sentenceTerminal10F89 = "\\u{10F89}";
        bytes memory utf8SentenceTerminal10F89 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal10F89));
        console2.log("10F89: ", string(utf8SentenceTerminal10F89));
        console2.logBytes(utf8SentenceTerminal10F89);

        string memory sentenceTerminal11047 = "\\u{11047}";
        bytes memory utf8SentenceTerminal11047 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11047));
        console2.log("11047: ", string(utf8SentenceTerminal11047));
        console2.logBytes(utf8SentenceTerminal11047);

        console2.log("..");

        string memory sentenceTerminal11048 = "\\u{11048}";
        bytes memory utf8SentenceTerminal11048 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11048));
        console2.log("11048: ", string(utf8SentenceTerminal11048));
        console2.logBytes(utf8SentenceTerminal11048);

        string memory sentenceTerminal110BE = "\\u{110BE}";
        bytes memory utf8SentenceTerminal110BE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal110BE));
        console2.log("110BE: ", string(utf8SentenceTerminal110BE));
        console2.logBytes(utf8SentenceTerminal110BE);

        console2.log("..");

        string memory sentenceTerminal110C1 = "\\u{110C1}";
        bytes memory utf8SentenceTerminal110C1 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal110C1));
        console2.log("110C1: ", string(utf8SentenceTerminal110C1));
        console2.logBytes(utf8SentenceTerminal110C1);

        string memory sentenceTerminal11141 = "\\u{11141}";
        bytes memory utf8SentenceTerminal11141 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11141));
        console2.log("11141: ", string(utf8SentenceTerminal11141));
        console2.logBytes(utf8SentenceTerminal11141);

        console2.log("..");

        string memory sentenceTerminal11143 = "\\u{11143}";
        bytes memory utf8SentenceTerminal11143 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11143));
        console2.log("11143: ", string(utf8SentenceTerminal11143));
        console2.logBytes(utf8SentenceTerminal11143);

        string memory sentenceTerminal111C5 = "\\u{111C5}";
        bytes memory utf8SentenceTerminal111C5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal111C5));
        console2.log("111C5: ", string(utf8SentenceTerminal111C5));
        console2.logBytes(utf8SentenceTerminal111C5);

        console2.log("..");

        string memory sentenceTerminal111C6 = "\\u{111C6}";
        bytes memory utf8SentenceTerminal111C6 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal111C6));
        console2.log("111C6: ", string(utf8SentenceTerminal111C6));
        console2.logBytes(utf8SentenceTerminal111C6);

        string memory sentenceTerminal111CD = "\\u{111CD}";
        bytes memory utf8SentenceTerminal111CD = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal111CD));
        console2.log("111CD: ", string(utf8SentenceTerminal111CD));
        console2.logBytes(utf8SentenceTerminal111CD);

        string memory sentenceTerminal111DE = "\\u{111DE}";
        bytes memory utf8SentenceTerminal111DE = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal111DE));
        console2.log("111DE: ", string(utf8SentenceTerminal111DE));
        console2.logBytes(utf8SentenceTerminal111DE);

        console2.log("..");

        string memory sentenceTerminal111DF = "\\u{111DF}";
        bytes memory utf8SentenceTerminal111DF = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal111DF));
        console2.log("111DF: ", string(utf8SentenceTerminal111DF));
        console2.logBytes(utf8SentenceTerminal111DF);

        string memory sentenceTerminal11238 = "\\u{11238}";
        bytes memory utf8SentenceTerminal11238 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11238));
        console2.log("11238: ", string(utf8SentenceTerminal11238));
        console2.logBytes(utf8SentenceTerminal11238);

        console2.log("..");

        string memory sentenceTerminal11239 = "\\u{11239}";
        bytes memory utf8SentenceTerminal11239 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11239));
        console2.log("11239: ", string(utf8SentenceTerminal11239));
        console2.logBytes(utf8SentenceTerminal11239);

        string memory sentenceTerminal1123B = "\\u{1123B}";
        bytes memory utf8SentenceTerminal1123B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1123B));
        console2.log("1123B: ", string(utf8SentenceTerminal1123B));
        console2.logBytes(utf8SentenceTerminal1123B);

        console2.log("..");

        string memory sentenceTerminal1123C = "\\u{1123C}";
        bytes memory utf8SentenceTerminal1123C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1123C));
        console2.log("1123C: ", string(utf8SentenceTerminal1123C));
        console2.logBytes(utf8SentenceTerminal1123C);

        string memory sentenceTerminal112A9 = "\\u{112A9}";
        bytes memory utf8SentenceTerminal112A9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal112A9));
        console2.log("112A9: ", string(utf8SentenceTerminal112A9));
        console2.logBytes(utf8SentenceTerminal112A9);

        string memory sentenceTerminal113D4 = "\\u{113D4}";
        bytes memory utf8SentenceTerminal113D4 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal113D4));
        console2.log("113D4: ", string(utf8SentenceTerminal113D4));
        console2.logBytes(utf8SentenceTerminal113D4);

        console2.log("..");

        string memory sentenceTerminal113D5 = "\\u{113D5}";
        bytes memory utf8SentenceTerminal113D5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal113D5));
        console2.log("113D5: ", string(utf8SentenceTerminal113D5));
        console2.logBytes(utf8SentenceTerminal113D5);

        string memory sentenceTerminal1144B = "\\u{1144B}";
        bytes memory utf8SentenceTerminal1144B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1144B));
        console2.log("1144B: ", string(utf8SentenceTerminal1144B));
        console2.logBytes(utf8SentenceTerminal1144B);

        console2.log("..");

        string memory sentenceTerminal1144C = "\\u{1144C}";
        bytes memory utf8SentenceTerminal1144C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1144C));
        console2.log("1144C: ", string(utf8SentenceTerminal1144C));
        console2.logBytes(utf8SentenceTerminal1144C);

        string memory sentenceTerminal115C2 = "\\u{115C2}";
        bytes memory utf8SentenceTerminal115C2 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal115C2));
        console2.log("115C2: ", string(utf8SentenceTerminal115C2));
        console2.logBytes(utf8SentenceTerminal115C2);

        console2.log("..");

        string memory sentenceTerminal115C3 = "\\u{115C3}";
        bytes memory utf8SentenceTerminal115C3 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal115C3));
        console2.log("115C3: ", string(utf8SentenceTerminal115C3));
        console2.logBytes(utf8SentenceTerminal115C3);

        string memory sentenceTerminal115C9 = "\\u{115C9}";
        bytes memory utf8SentenceTerminal115C9 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal115C9));
        console2.log("115C9: ", string(utf8SentenceTerminal115C9));
        console2.logBytes(utf8SentenceTerminal115C9);

        console2.log("..");

        string memory sentenceTerminal115D7 = "\\u{115D7}";
        bytes memory utf8SentenceTerminal115D7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal115D7));
        console2.log("115D7: ", string(utf8SentenceTerminal115D7));
        console2.logBytes(utf8SentenceTerminal115D7);

        string memory sentenceTerminal11641 = "\\u{11641}";
        bytes memory utf8SentenceTerminal11641 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11641));
        console2.log("11641: ", string(utf8SentenceTerminal11641));
        console2.logBytes(utf8SentenceTerminal11641);

        console2.log("..");

        string memory sentenceTerminal11642 = "\\u{11642}";
        bytes memory utf8SentenceTerminal11642 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11642));
        console2.log("11642: ", string(utf8SentenceTerminal11642));
        console2.logBytes(utf8SentenceTerminal11642);

        string memory sentenceTerminal1173C = "\\u{1173C}";
        bytes memory utf8SentenceTerminal1173C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1173C));
        console2.log("1173C: ", string(utf8SentenceTerminal1173C));
        console2.logBytes(utf8SentenceTerminal1173C);

        console2.log("..");

        string memory sentenceTerminal1173E = "\\u{1173E}";
        bytes memory utf8SentenceTerminal1173E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1173E));
        console2.log("1173E: ", string(utf8SentenceTerminal1173E));
        console2.logBytes(utf8SentenceTerminal1173E);

        string memory sentenceTerminal11944 = "\\u{11944}";
        bytes memory utf8SentenceTerminal11944 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11944));
        console2.log("11944: ", string(utf8SentenceTerminal11944));
        console2.logBytes(utf8SentenceTerminal11944);

        string memory sentenceTerminal11946 = "\\u{11946}";
        bytes memory utf8SentenceTerminal11946 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11946));
        console2.log("11946: ", string(utf8SentenceTerminal11946));
        console2.logBytes(utf8SentenceTerminal11946);

        string memory sentenceTerminal11A42 = "\\u{11A42}";
        bytes memory utf8SentenceTerminal11A42 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11A42));
        console2.log("11A42: ", string(utf8SentenceTerminal11A42));
        console2.logBytes(utf8SentenceTerminal11A42);

        console2.log("..");

        string memory sentenceTerminal11A43 = "\\u{11A43}";
        bytes memory utf8SentenceTerminal11A43 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11A43));
        console2.log("11A43: ", string(utf8SentenceTerminal11A43));
        console2.logBytes(utf8SentenceTerminal11A43);

        string memory sentenceTerminal11A9B = "\\u{11A9B}";
        bytes memory utf8SentenceTerminal11A9B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11A9B));
        console2.log("11A9B: ", string(utf8SentenceTerminal11A9B));
        console2.logBytes(utf8SentenceTerminal11A9B);

        console2.log("..");

        string memory sentenceTerminal11A9C = "\\u{11A9C}";
        bytes memory utf8SentenceTerminal11A9C = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11A9C));
        console2.log("11A9C: ", string(utf8SentenceTerminal11A9C));
        console2.logBytes(utf8SentenceTerminal11A9C);

        string memory sentenceTerminal11C41 = "\\u{11C41}";
        bytes memory utf8SentenceTerminal11C41 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11C41));
        console2.log("11C41: ", string(utf8SentenceTerminal11C41));
        console2.logBytes(utf8SentenceTerminal11C41);

        console2.log("..");

        string memory sentenceTerminal11C42 = "\\u{11C42}";
        bytes memory utf8SentenceTerminal11C42 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11C42));
        console2.log("11C42: ", string(utf8SentenceTerminal11C42));
        console2.logBytes(utf8SentenceTerminal11C42);

        string memory sentenceTerminal11EF7 = "\\u{11EF7}";
        bytes memory utf8SentenceTerminal11EF7 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11EF7));
        console2.log("11EF7: ", string(utf8SentenceTerminal11EF7));
        console2.logBytes(utf8SentenceTerminal11EF7);

        console2.log("..");

        string memory sentenceTerminal11EF8 = "\\u{11EF8}";
        bytes memory utf8SentenceTerminal11EF8 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11EF8));
        console2.log("11EF8: ", string(utf8SentenceTerminal11EF8));
        console2.logBytes(utf8SentenceTerminal11EF8);

        string memory sentenceTerminal11F43 = "\\u{11F43}";
        bytes memory utf8SentenceTerminal11F43 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11F43));
        console2.log("11F43: ", string(utf8SentenceTerminal11F43));
        console2.logBytes(utf8SentenceTerminal11F43);

        console2.log("..");

        string memory sentenceTerminal11F44 = "\\u{11F44}";
        bytes memory utf8SentenceTerminal11F44 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal11F44));
        console2.log("11F44: ", string(utf8SentenceTerminal11F44));
        console2.logBytes(utf8SentenceTerminal11F44);

        string memory sentenceTerminal16A6E = "\\u{16A6E}";
        bytes memory utf8SentenceTerminal16A6E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal16A6E));
        console2.log("16A6E: ", string(utf8SentenceTerminal16A6E));
        console2.logBytes(utf8SentenceTerminal16A6E);

        console2.log("..");

        string memory sentenceTerminal16A6F = "\\u{16A6F}";
        bytes memory utf8SentenceTerminal16A6F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal16A6F));
        console2.log("16A6F: ", string(utf8SentenceTerminal16A6F));
        console2.logBytes(utf8SentenceTerminal16A6F);

        string memory sentenceTerminal16AF5 = "\\u{16AF5}";
        bytes memory utf8SentenceTerminal16AF5 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal16AF5));
        console2.log("16AF5: ", string(utf8SentenceTerminal16AF5));
        console2.logBytes(utf8SentenceTerminal16AF5);

        string memory sentenceTerminal16B37 = "\\u{16B37}";
        bytes memory utf8SentenceTerminal16B37 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal16B37));
        console2.log("16B37: ", string(utf8SentenceTerminal16B37));
        console2.logBytes(utf8SentenceTerminal16B37);

        console2.log("..");

        string memory sentenceTerminal16B38 = "\\u{16B38}";
        bytes memory utf8SentenceTerminal16B38 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal16B38));
        console2.log("16B38: ", string(utf8SentenceTerminal16B38));
        console2.logBytes(utf8SentenceTerminal16B38);

        string memory sentenceTerminal16B44 = "\\u{16B44}";
        bytes memory utf8SentenceTerminal16B44 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal16B44));
        console2.log("16B44: ", string(utf8SentenceTerminal16B44));
        console2.logBytes(utf8SentenceTerminal16B44);

        string memory sentenceTerminal16D6E = "\\u{16D6E}";
        bytes memory utf8SentenceTerminal16D6E = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal16D6E));
        console2.log("16D6E: ", string(utf8SentenceTerminal16D6E));
        console2.logBytes(utf8SentenceTerminal16D6E);

        console2.log("..");

        string memory sentenceTerminal16D6F = "\\u{16D6F}";
        bytes memory utf8SentenceTerminal16D6F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal16D6F));
        console2.log("16D6F: ", string(utf8SentenceTerminal16D6F));
        console2.logBytes(utf8SentenceTerminal16D6F);

        string memory sentenceTerminal16E98 = "\\u{16E98}";
        bytes memory utf8SentenceTerminal16E98 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal16E98));
        console2.log("16E98: ", string(utf8SentenceTerminal16E98));
        console2.logBytes(utf8SentenceTerminal16E98);

        string memory sentenceTerminal1BC9F = "\\u{1BC9F}";
        bytes memory utf8SentenceTerminal1BC9F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1BC9F));
        console2.log("1BC9F: ", string(utf8SentenceTerminal1BC9F));
        console2.logBytes(utf8SentenceTerminal1BC9F);

        string memory sentenceTerminal1DA88 = "\\u{1DA88}";
        bytes memory utf8SentenceTerminal1DA88 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(sentenceTerminal1DA88));
        console2.log("1DA88: ", string(utf8SentenceTerminal1DA88));
        console2.logBytes(utf8SentenceTerminal1DA88);
    }

    function testRegexPropertyVariationSelector() public pure {
        string memory variationSelector180B = "\\u{180B}";
        bytes memory utf8VariationSelector180B = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(variationSelector180B));
        console2.log("180B: ", string(utf8VariationSelector180B));
        console2.logBytes(utf8VariationSelector180B);

        console2.log("..");

        string memory variationSelector180D = "\\u{180D}";
        bytes memory utf8VariationSelector180D = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(variationSelector180D));
        console2.log("180D: ", string(utf8VariationSelector180D));
        console2.logBytes(utf8VariationSelector180D);

        string memory variationSelector180F = "\\u{180F}";
        bytes memory utf8VariationSelector180F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(variationSelector180F));
        console2.log("180F: ", string(utf8VariationSelector180F));
        console2.logBytes(utf8VariationSelector180F);

        string memory variationSelectorFE00 = "\\u{FE00}";
        bytes memory utf8VariationSelectorFE00 = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(variationSelectorFE00));
        console2.log("FE00: ", string(utf8VariationSelectorFE00));
        console2.logBytes(utf8VariationSelectorFE00);

        console2.log("..");

        string memory variationSelectorFE0F = "\\u{FE0F}";
        bytes memory utf8VariationSelectorFE0F = Stringray.unicodeHexToUtf8Hex(abi.encodePacked(variationSelectorFE0F));
        console2.log("FE0F: ", string(utf8VariationSelectorFE0F));
        console2.logBytes(utf8VariationSelectorFE0F);

        string memory variationSelectorE0100 = "\\u{E0100}";
        bytes memory utf8VariationSelectorE0100 =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(variationSelectorE0100));
        console2.log("E0100: ", string(utf8VariationSelectorE0100));
        console2.logBytes(utf8VariationSelectorE0100);

        console2.log("..");

        string memory variationSelectorE01EF = "\\u{E01EF}";
        bytes memory utf8VariationSelectorE01EF =
            Stringray.unicodeHexToUtf8Hex(abi.encodePacked(variationSelectorE01EF));
        console2.log("E01EF: ", string(utf8VariationSelectorE01EF));
        console2.logBytes(utf8VariationSelectorE01EF);
    }

    function testRegexPropertyPatternWhiteSpace() public pure {
        string memory patternWhiteSpace0009 = "\\u{0009}";
        bytes memory utf8PatternWhiteSpace0009 = Stringray.unicodeHexToUtf8Hex(patternWhiteSpace0009);
        console2.log("0009: ", utf8PatternWhiteSpace0009);
        console2.logBytes(utf8PatternWhiteSpace0009);

        console2.log("..");

        string memory patternWhiteSpace000D = "\\u{000D}";
        bytes memory utf8PatternWhiteSpace000D = Stringray.unicodeHexToUtf8Hex(patternWhiteSpace000D);
        console2.log("000D: ", utf8PatternWhiteSpace000D);
        console2.logBytes(utf8PatternWhiteSpace000D);

        string memory patternWhiteSpace0020 = "\\u{0020}";
        bytes memory utf8PatternWhiteSpace0020 = Stringray.unicodeHexToUtf8Hex(patternWhiteSpace0020);
        console2.log("0020: ", utf8PatternWhiteSpace0020);
        console2.logBytes(utf8PatternWhiteSpace0020);

        string memory patternWhiteSpace0085 = "\\u{0085}";
        bytes memory utf8PatternWhiteSpace0085 = Stringray.unicodeHexToUtf8Hex(patternWhiteSpace0085);
        console2.log("0085: ", utf8PatternWhiteSpace0085);
        console2.logBytes(utf8PatternWhiteSpace0085);

        string memory patternWhiteSpace200E = "\\u{200E}";
        bytes memory utf8PatternWhiteSpace200E = Stringray.unicodeHexToUtf8Hex(patternWhiteSpace200E);
        console2.log("200E: ", utf8PatternWhiteSpace200E);
        console2.logBytes(utf8PatternWhiteSpace200E);

        console2.log("..");

        string memory patternWhiteSpace200F = "\\u{200F}";
        bytes memory utf8PatternWhiteSpace200F = Stringray.unicodeHexToUtf8Hex(patternWhiteSpace200F);
        console2.log("200F: ", utf8PatternWhiteSpace200F);
        console2.logBytes(utf8PatternWhiteSpace200F);

        string memory patternWhiteSpace2028 = "\\u{2028}";
        bytes memory utf8PatternWhiteSpace2028 = Stringray.unicodeHexToUtf8Hex(patternWhiteSpace2028);
        console2.log("2028: ", utf8PatternWhiteSpace2028);
        console2.logBytes(utf8PatternWhiteSpace2028);

        string memory patternWhiteSpace2029 = "\\u{2029}";
        bytes memory utf8PatternWhiteSpace2029 = Stringray.unicodeHexToUtf8Hex(patternWhiteSpace2029);
        console2.log("2029: ", utf8PatternWhiteSpace2029);
        console2.logBytes(utf8PatternWhiteSpace2029);
    }

    function testRegexPropertyPrependedConcatenationMark() public pure {
        // @TODO: complete the property Prepended_Concatenation_Mark testing🧪...🚀🚀
    }

    function testRegexPropertyRegionalIndicator() public pure {
        // @TODO: complete the property Regional_Indicator testing🧪...🚀🚀
    }

    function testRegexPropertyModifierCombiningMark() public pure {
        // @TODO: complete the property Modifier_Combining_Mark testing🧪...🚀🚀
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
