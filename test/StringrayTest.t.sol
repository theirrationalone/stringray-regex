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
        string memory pattern = unicode"/(?<=ab){1,}/";
        target.regex(pattern);
    }
}
