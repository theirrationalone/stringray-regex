// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {console2} from "forge-std/console2.sol";

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
        return _endsWith(0, _string, _searchString);
    }

    function endsWith(string memory _string, string memory _searchString, uint256 _searchEndIndex)
        internal
        pure
        returns (bool)
    {
        return _endsWith(_searchEndIndex, _string, _searchString);
    }

    function _endsWith(uint256 _searchEndIndex, string memory _target, string memory _search)
        private
        pure
        returns (bool)
    {
        bytes memory bytesForm = bytes(_target);

        if (_searchEndIndex == 0) {
            _searchEndIndex = bytesForm.length - 1;
        }

        if (_searchEndIndex >= bytesForm.length) return false;

        bytes memory searchBytesForm = bytes(_search);

        if (searchBytesForm.length > bytesForm.length || _searchEndIndex < searchBytesForm.length) return false;

        uint256 searchStartIndex = _searchEndIndex + 1 - searchBytesForm.length;

        for (uint256 i = 0; i < searchBytesForm.length; i++) {
            if (searchBytesForm[i] != bytesForm[searchStartIndex]) return false;

            searchStartIndex += 1;
        }

        return true;
    }

    function includes(string memory _string, string memory _subString) internal pure returns (bool) {
        bytes memory bytesForm = bytes(_string);
        bytes memory subBytesForm = bytes(_subString);

        if (subBytesForm.length <= 0 || subBytesForm.length > bytesForm.length) {
            return false;
        }

        for (uint256 i = 0; i < bytesForm.length; i++) {
            uint256 k = 0;
            for (uint256 j = i; j < bytesForm.length; j++) {
                if (bytesForm[j] != subBytesForm[k]) break;

                if (k == subBytesForm.length - 1) {
                    return true;
                }

                k++;
            }
        }

        return false;
    }

    function indexOf(string memory _string, string memory _subString) internal pure returns (int256) {
        return _indexOf(_string, _subString, 0);
    }

    function indexOf(string memory _string, string memory _subString, uint256 _beginIndex)
        internal
        pure
        returns (int256)
    {
        return _indexOf(_string, _subString, _beginIndex);
    }

    function _indexOf(string memory _target, string memory _search, uint256 _startIndex)
        private
        pure
        returns (int256)
    {
        bytes memory bytesForm = bytes(_target);
        bytes memory subBytesForm = bytes(_search);

        if (subBytesForm.length <= 0 || subBytesForm.length > bytesForm.length || _startIndex >= bytesForm.length) {
            return -1;
        }

        for (uint256 i = _startIndex; i < bytesForm.length; i++) {
            uint256 k = 0;
            for (uint256 j = i; j < bytesForm.length; j++) {
                if (bytesForm[j] != subBytesForm[k]) break;

                if (k == subBytesForm.length - 1) {
                    return int256(i);
                }

                k++;
            }
        }

        return -1;
    }

    function lastIndexOf(string memory _string, string memory _subString) internal pure returns (int256) {
        bytes memory bytesForm = bytes(_string);
        return _lastIndexOf(_string, _subString, bytesForm.length - 1);
    }

    function lastIndexOf(string memory _string, string memory _subString, uint256 _lastIndex)
        internal
        pure
        returns (int256)
    {
        return _lastIndexOf(_string, _subString, _lastIndex);
    }

    function _lastIndexOf(string memory _target, string memory _search, uint256 _lastIndex)
        private
        pure
        returns (int256)
    {
        bytes memory bytesForm = bytes(_target);
        bytes memory subBytesForm = bytes(_search);

        if (subBytesForm.length <= 0 || subBytesForm.length > bytesForm.length || _lastIndex == 0) {
            return -1;
        }

        if (_lastIndex >= bytesForm.length) {
            _lastIndex = bytesForm.length - 1;
        }

        for (uint256 i = _lastIndex; i >= 0; i--) {
            uint256 k = subBytesForm.length - 1;
            for (uint256 j = i; j >= 0; j--) {
                if (bytesForm[j] != subBytesForm[k] || j == 0) break;

                if (k == 0) {
                    return int256(j);
                }

                k--;
            }

            if (i == 0) return -1;
        }

        return -1;
    }

    function length(string memory _string) internal pure returns (uint256) {
        return bytes(_string).length;
    }

    function localeCompare(string memory _string, string memory _subString) internal pure returns (int256) {
        return _localeCompare(_string, _subString, false);
    }

    function localeCompare(string memory _string, string memory _subString, bool _ignoreCase)
        internal
        pure
        returns (int256)
    {
        return _localeCompare(_string, _subString, _ignoreCase);
    }

    function _localeCompare(string memory _target, string memory _search, bool _ignoreCase)
        private
        pure
        returns (int256)
    {
        bytes memory bytesForm = bytes(_target);
        bytes memory subBytesForm = bytes(_search);

        if (subBytesForm.length < bytesForm.length) {
            return 1;
        }

        if (subBytesForm.length > bytesForm.length) {
            return -1;
        }

        for (uint256 i = 0; i < bytesForm.length; i++) {
            uint8 targetValue = uint8(bytesForm[i]);
            uint8 searchValue = uint8(subBytesForm[i]);

            if (
                targetValue >= 48 && targetValue <= 57 && searchValue >= 65 && searchValue <= 91 && searchValue >= 97
                    && searchValue <= 122
            ) {
                return -1;
            }

            if (
                searchValue >= 48 && searchValue <= 57 && targetValue >= 65 && targetValue <= 91 && targetValue >= 97
                    && targetValue <= 122
            ) {
                return 1;
            }

            if (_ignoreCase) {
                if (searchValue > targetValue) {
                    if (targetValue >= 65 && targetValue <= 91 && searchValue >= 97 && searchValue <= 122) {
                        if (searchValue < targetValue + 32) {
                            return 1;
                        }

                        if (searchValue == targetValue + 32) {
                            return 0;
                        }
                    }
                    return -1;
                }

                if (searchValue < targetValue) {
                    if (targetValue >= 97 && targetValue <= 122 && searchValue >= 65 && searchValue <= 91) {
                        if (searchValue + 32 > targetValue) {
                            return -1;
                        }

                        if (searchValue + 32 == targetValue) {
                            return 0;
                        }
                    }

                    return 1;
                }
            } else {
                if (searchValue < targetValue) {
                    if (targetValue >= 97 && targetValue <= 122 && searchValue >= 65 && searchValue <= 91) {
                        return -1;
                    }
                    return 1;
                }

                if (searchValue > targetValue) {
                    if (searchValue >= 97 && searchValue <= 122 && targetValue >= 65 && targetValue <= 91) {
                        return 1;
                    }
                    return -1;
                }
            }
        }

        return 0;
    }

    struct PatternMatchedData {
        int256 matchedStartIndex;
        int256 matchedEndIndex;
        string subStrMatched;
        uint256 patternLastIndex;
        bool patternMatched;
    }

    function regex(string memory _string, string memory _pattern) internal returns (PatternMatchedData memory) {
        uint8 forwardSlash = 47;

        bytes memory stringInBytes = bytes(_string);
        bytes memory patternInBytes = bytes(_pattern);
        PatternMatchedData memory patternData;

        if (
            uint8(patternInBytes[0]) != forwardSlash || uint8(patternInBytes[patternInBytes.length - 1]) != forwardSlash
        ) {
            return patternData;
        }

        patternData.patternLastIndex = 1;
        for (uint256 i = patternData.patternLastIndex; i < patternInBytes.length - 1;) {
            patternData = wordPattern(i, patternData.matchedEndIndex, stringInBytes, patternInBytes, patternData);

            if (patternData.matchedEndIndex == -1) {
                return patternData;
            }

            i = patternData.patternLastIndex;
        }

        return patternData;
    }

    function wordPattern(
        uint256 i,
        int256 j,
        bytes memory stringInBytes,
        bytes memory patternInBytes,
        PatternMatchedData memory lastPatternCollecedData
    ) private pure returns (PatternMatchedData memory patternData) {
        uint8 backSlash = 92;
        uint8 questionMark = 63;
        uint8 exclamationMark = 33;
        uint8 period = 46;
        uint8 openSquareBracket = 91;
        uint8 closeSquareBracket = 93;
        uint8 openParenthesis = 40;
        uint8 closeParenthesis = 41;
        uint8 plusSign = 43;
        uint8 asterisk = 42;
        uint8 minusSign = 45;
        uint8 dollarSign = 36;
        uint8 carrotSign = 94;
        uint8 smallB = 98;
        uint8 bigB = 66;
        uint8 smallD = 100;
        uint8 bigD = 68;
        uint8 smallW = 119;
        uint8 bigW = 87;
        uint8 smallS = 115;
        uint8 bigS = 83;
        uint8 smallG = 103;
        uint8 assignmentSign = 61;
        uint8 greaterThanSign = 62;
        uint8 lessThanSign = 60;
        uint8 verticalBar = 124;
        uint8 colon = 58;
        uint8 openCurlyBrace = 123;
        uint8 closeCurlyBrace = 125;
        uint8 commaSign = 44;

        patternData = lastPatternCollecedData;
        uint256 z = uint256(j);
        if (uint8(patternInBytes[i]) == backSlash && i < patternInBytes.length - 2) {
            if (
                uint8(patternInBytes[i + 1]) == smallW && uint8(patternInBytes[i + 2]) != plusSign
                    && uint8(patternInBytes[i + 2]) != asterisk
            ) {
                for (z; z < stringInBytes.length; z++) {
                    if (isWord(z, stringInBytes)) {
                        patternData.matchedStartIndex = int256(z);
                        patternData.matchedEndIndex = int256(z);
                        patternData.patternMatched = true;
                        patternData.subStrMatched =
                            string(abi.encodePacked(patternData.subStrMatched, stringInBytes[z]));
                        break;
                    } else {
                        if (z == stringInBytes.length - 1) {
                            patternData.matchedStartIndex = -1;
                            patternData.matchedEndIndex = -1;
                            patternData.patternMatched = false;
                        }
                    }
                }
            } else if (uint8(patternInBytes[i + 1]) == smallW && uint8(patternInBytes[i + 2]) == plusSign) {
                bool isFoundFirstIndex = false;
                for (z; z < stringInBytes.length; z++) {
                    if (isWord(z, stringInBytes)) {
                        if (!isFoundFirstIndex) {
                            isFoundFirstIndex = true;
                            patternData.matchedStartIndex = int256(z);
                            patternData.patternMatched = true;
                        }

                        patternData.matchedEndIndex = int256(z);
                        patternData.subStrMatched =
                            string(abi.encodePacked(patternData.subStrMatched, stringInBytes[z]));
                    } else {
                        if (!isFoundFirstIndex && z == stringInBytes.length - 1) {
                            patternData.matchedStartIndex = -1;
                            patternData.matchedEndIndex = -1;
                            patternData.patternMatched = false;
                        } else if (isFoundFirstIndex) {
                            if (z > 0) {
                                patternData.matchedEndIndex = int256(z - 1);
                            } else {
                                patternData.matchedEndIndex = int256(z);
                            }
                            break;
                        }
                    }
                }
            } else if (uint8(patternInBytes[i + 1]) == smallW && uint8(patternInBytes[i + 2]) == asterisk) {
                bool isFoundFirstIndex = false;
                for (z; z < stringInBytes.length; z++) {
                    if (isWord(z, stringInBytes)) {
                        if (!isFoundFirstIndex) {
                            isFoundFirstIndex = true;
                            patternData.matchedStartIndex = int256(z);
                            patternData.patternMatched = true;
                        }

                        patternData.subStrMatched =
                            string(abi.encodePacked(patternData.subStrMatched, stringInBytes[z]));
                    } else {
                        if (z == 0) {
                            patternData.matchedStartIndex = -1;
                            patternData.matchedEndIndex = -1;
                            patternData.patternMatched = true;
                        } else {
                            patternData.matchedEndIndex = int256(z - 1);
                        }
                        break;
                    }
                }
            } else if (
                uint8(patternInBytes[i + 1]) == bigW && uint8(patternInBytes[i + 2]) != plusSign
                    && uint8(patternInBytes[i + 2]) != asterisk
            ) {
                for (z; z < stringInBytes.length; z++) {
                    if (!isWord(z, stringInBytes)) {
                        patternData.matchedStartIndex = int256(z);
                        patternData.matchedEndIndex = int256(z);
                        patternData.patternMatched = true;
                        patternData.subStrMatched =
                            string(abi.encodePacked(patternData.subStrMatched, stringInBytes[z]));
                        break;
                    } else {
                        if (z == stringInBytes.length - 1) {
                            patternData.matchedStartIndex = -1;
                            patternData.matchedEndIndex = -1;
                            patternData.patternMatched = false;
                        }
                    }
                }
            } else if (uint8(patternInBytes[i + 1]) == bigW && uint8(patternInBytes[i + 2]) == plusSign) {
                bool isFoundFirstIndex = false;
                for (z; z < stringInBytes.length; z++) {
                    if (!isWord(z, stringInBytes)) {
                        if (!isFoundFirstIndex) {
                            isFoundFirstIndex = true;
                            patternData.matchedStartIndex = int256(z);
                            patternData.patternMatched = true;
                        }

                        patternData.matchedEndIndex = int256(z);
                        patternData.subStrMatched =
                            string(abi.encodePacked(patternData.subStrMatched, stringInBytes[z]));
                    } else {
                        if (!isFoundFirstIndex && z == stringInBytes.length - 1) {
                            patternData.matchedStartIndex = -1;
                            patternData.matchedEndIndex = -1;
                            patternData.patternMatched = false;
                        } else if (isFoundFirstIndex) {
                            if (z > 0) {
                                patternData.matchedEndIndex = int256(z - 1);
                            } else {
                                patternData.matchedEndIndex = int256(z);
                            }
                            break;
                        }
                    }
                }
            } else {
                patternData.matchedStartIndex = -1;
                patternData.matchedEndIndex = -1;
                patternData.patternMatched = false;
            }
        }
        patternData.patternLastIndex += 1;
    }

    function isWord(uint256 z, bytes memory stringInBytes) private pure returns (bool) {
        if (
            (uint8(stringInBytes[z]) >= 65 && uint8(stringInBytes[z]) <= 90)
                || (uint8(stringInBytes[z]) >= 97 && uint8(stringInBytes[z]) <= 122)
                || (uint8(stringInBytes[z]) >= 48 && uint8(stringInBytes[z]) <= 57) || uint8(stringInBytes[z]) == 95
        ) {
            return true;
        }
        return false;
    }
}
