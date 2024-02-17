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

        string memory dat = "U+1F428";
        string memory data = "\x1b[32manil\x1b[0m";

        bytes memory packedString = abi.encodePacked(oneName);

        bytes memory packedSpace = new bytes(1);

        uint8 unicodeValue = uint8(packedString[0]);

        bytes1 name = bytes1(uint8(255));

        bytes memory datum = new bytes(1);

        datum[0] = name;

        console2.log("unicodeValue: ", string(datum));
    }
}
