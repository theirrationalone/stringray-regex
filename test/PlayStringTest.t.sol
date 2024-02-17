// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {Stringray} from "../src/Stringray.sol";

contract PlayStringTest is Test {
    using Stringray for string;

    function setUp() external {
        // done
    }

    function test_copyWithFunction() public {
        string memory oneName = "ANIL KUSHWAHa";

        int256 code = oneName.charCodeAt(12);

        console2.log("code: ", code);

        assertEq(code, 97);
    }
}
