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

        // a, b, c, d, e, f, g, h, i, j, k, l, m, n
        // 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111

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

        string memory sixtyEight = "68";
        bytes memory sixtyEightB = bytes(sixtyEight);

        uint8 sixty = (uint8(sixtyEightB[0]) - 48) * 10;
        uint8 sixtyEightfinal = sixty + (uint8(sixtyEightB[1]) - 48);

        console2.log("final: ", sixtyEightfinal);

        assertEq(isEndsWith, true);
        assertEq(isEndsWithTwo, true);
    }
}
