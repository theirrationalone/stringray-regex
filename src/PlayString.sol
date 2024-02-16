// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Stringray} from "./Stringray.sol";

contract Play {
    using Stringray for string;

    function letCopy(string memory myName) public pure returns (string memory) {
        // string memory modifiedName = myName.copyWithIn(0, 1, 2);
        // return modifiedName;
    }
}
