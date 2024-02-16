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
        string memory oneName = "ANIL KUSHWAHA";

        string memory modifiedName = oneName.copyWithIn(2, 0, 3);

        console2.log("oneName: ", oneName);
        console2.log("modifiedName:  ANANIKUSHWAHA");
        console2.log("modifiedName: ", modifiedName);
    }
}
