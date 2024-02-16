// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

library Stringray {
    function copyWithIn(string memory _string, uint256 _targetIndex, uint256 _startIndex, uint256 _endIndex)
        internal
        pure
        returns (string memory)
    {
        bytes memory packedString = abi.encodePacked(_string);
        bytes memory packedStringInvariant = abi.encodePacked(_string);

        if (
            _startIndex >= _endIndex || _targetIndex >= packedString.length || _targetIndex == _startIndex
                || _endIndex > packedString.length
        ) {
            return _string;
        }

        for (uint256 i = _startIndex; i < _endIndex; i++) {
            packedString[_targetIndex] = packedStringInvariant[i];
            _targetIndex += 1;
        }

        return string(packedString);
    }
}
