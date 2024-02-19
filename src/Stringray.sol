// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

library Stringray {
    function charAt(string memory _string, uint256 _index) internal pure returns (string memory) {
        bytes memory bytesForm = bytes(_string);
        bytes memory bytesFormSpace = new bytes(1);

        if (_index >= bytesForm.length) return "";

        bytesFormSpace[0] = bytesForm[_index];

        return string(bytesFormSpace);
    }

    function charCodeAt(string memory _string, uint256 _index) internal pure returns (int256) {
        bytes memory bytesForm = bytes(_string);
        if (_index >= bytesForm.length) return -1;

        return int256(uint256(uint8(bytesForm[_index])));
    }

    function copyWithIn(string memory _string, uint256 _targetIndex, uint256 _startIndex, uint256 _endIndex)
        internal
        pure
        returns (string memory)
    {
        // converted to bytes but still points to `_string`.
        bytes memory bytesForm = bytes(_string);

        // converted to bytes and not points to `_string`.
        bytes memory bytesFormInvariant = abi.encodePacked(_string);

        if (
            _startIndex >= _endIndex || _targetIndex >= bytesForm.length || _targetIndex == _startIndex
                || _endIndex > bytesForm.length
        ) return _string;

        for (uint256 i = _startIndex; i < _endIndex; i++) {
            bytesForm[_targetIndex] = bytesFormInvariant[i];
            _targetIndex += 1;
        }

        return string(bytesForm);
    }

    function endsWith(string memory _string, string memory _searchString) internal pure returns (bool) {
        bytes memory bytesForm = bytes(_string);
        bytes memory searchBytesForm = bytes(_searchString);

        uint256 _searchEndIndex = bytesForm.length - 1;

        if (searchBytesForm.length > bytesForm.length || _searchEndIndex < searchBytesForm.length) return false;

        return _endsWith(_searchEndIndex, bytesForm, searchBytesForm);
    }

    function endsWith(string memory _string, string memory _searchString, uint256 _searchEndIndex)
        internal
        pure
        returns (bool)
    {
        bytes memory bytesForm = bytes(_string);

        if (_searchEndIndex >= bytesForm.length) return false;

        bytes memory searchBytesForm = bytes(_searchString);

        if (searchBytesForm.length > bytesForm.length || _searchEndIndex < searchBytesForm.length) return false;

        return _endsWith(_searchEndIndex, bytesForm, searchBytesForm);
    }

    function _endsWith(uint256 _searchEndIndex, bytes memory _target, bytes memory _search)
        private
        pure
        returns (bool)
    {
        uint256 searchStartIndex = _searchEndIndex + 1 - _search.length;

        for (uint256 i = 0; i < _search.length; i++) {
            if (_search[i] != _target[searchStartIndex]) return false;

            searchStartIndex += 1;
        }

        return true;
    }
}
