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
        bytes memory someHex = abi.encodePacked(hex"01E921");
        console2.logBytes(someHex);
        uint256 dec = Stringray.hexToDec(someHex);
        console2.log("decimal: ", dec);
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
