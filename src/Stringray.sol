// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

library Stringray {
    function copyWithIn(uint256[] memory _array, uint256 _targetIndex, uint256 _startIndex, uint256 _endIndex)
        internal
        pure
        returns (string[] memory)
    {}
}

contract Play {
    using Stringray for uint256;

    uint256 private myArray;

    function letCopy() public {
        // myArray.copyWithIn();
    }
}
