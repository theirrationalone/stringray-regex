// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {Stringray} from "../src/Stringray.sol";

contract PlayStringTest is Test {
    using Stringray for string;

    function setUp() external {
        // done
    }

    function testRegexLiteralsCase1() public pure {
        string memory target = "anything";

        string memory pattern = unicode"/a/";
        target.regex(pattern);

        pattern = unicode"/b/";
        target.regex(pattern);

        pattern = unicode"/1/";
        target.regex(pattern);

        pattern = unicode"/_/";
        target.regex(pattern);

        pattern = unicode"/€/";
        target.regex(pattern);

        pattern = unicode"/क/";
        target.regex(pattern);

        pattern = unicode"/あ/";
        target.regex(pattern);

        pattern = unicode"/😀/";
        target.regex(pattern);
    }
}
