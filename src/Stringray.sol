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

    uint8 private constant FORWARD_SLASH = 47;
    uint8 private constant BACK_SLASH = 92;
    uint8 private constant QUESTION_MARK = 63;
    uint8 private constant EXCLAMATION_MARK = 33;
    uint8 private constant PERIOD = 46;
    uint8 private constant OPEN_SQUARE_BRACKET = 91;
    uint8 private constant CLOSE_SQUARE_BRACKET = 93;
    uint8 private constant OPEN_PARANTHESIS = 40;
    uint8 private constant CLOSE_PARANTHESIS = 41;
    uint8 private constant PLUS_SIGN = 43;
    uint8 private constant ASTERIK = 42;
    uint8 private constant MINUS_SIGN = 45;
    uint8 private constant DOLLAR_SIGN = 36;
    uint8 private constant CARET_SIGN = 94;
    uint8 private constant SMALL_b = 98;
    uint8 private constant BIG_B = 66;
    uint8 private constant SMALL_d = 100;
    uint8 private constant BIG_D = 68;
    uint8 private constant SMALL_w = 119;
    uint8 private constant BIG_W = 87;
    uint8 private constant SMALL_s = 115;
    uint8 private constant BIG_s = 83;
    uint8 private constant SMALL_g = 103;
    uint8 private constant ASSIGNMENT_SIGN = 61;
    uint8 private constant GREATER_THAN_SIGN = 62;
    uint8 private constant LESS_THAN_SIGN = 60;
    uint8 private constant VERTICAL_BAR = 124;
    uint8 private constant COLON = 58;
    uint8 private constant OPEN_CURLY_BRACE = 123;
    uint8 private constant CLOSE_CURLY_BRACE = 125;
    uint8 private constant COMMA_SIGN = 44;

    // pattern names
    bytes32 private constant CHARACTER_CLASSES = keccak256(abi.encodePacked("CHARACTER_CLASSES"));

    struct PatternMatchedData {
        uint256 lastPatternStartingSpecialSeqIdx;
        uint256 lastPatternEndingSpecialSeqIdx;
        bytes mainString;
        bytes remainingString;
        bytes patternString;
        bytes patternMatchedString;
        uint256 stringLastMatchedCharIndex;
    }

    struct PatternIdentifier {
        bytes32 patternNameHash;
        uint256 patternSpecialSeqStartingIdx;
        uint256 patternSpecialSeqEndingIdx;
    }

    function regex(string memory _proposedString, string memory _pattern)
        internal
        pure
        returns (PatternMatchedData memory patternMatchedData)
    {
        bytes memory stringInBytes = bytes(_proposedString);
        bytes memory patternInBytes = bytes(_pattern);

        if (
            uint8(patternInBytes[0]) != FORWARD_SLASH
                || uint8(patternInBytes[patternInBytes.length - 1]) != FORWARD_SLASH
        ) {
            return patternMatchedData;
        }

        patternMatchedData.mainString = stringInBytes;
        patternMatchedData.remainingString = stringInBytes;
        patternMatchedData.patternString = patternInBytes;
        patternMatchedData.lastPatternStartingSpecialSeqIdx = 1;
        patternMatchedData.lastPatternEndingSpecialSeqIdx = 1;

        PatternIdentifier memory patternIdentifier;
        for (uint256 i = 1; i < patternInBytes.length - 1;) {
            patternIdentifier = identifyPatternCharacter(patternInBytes, i);

            if (patternIdentifier.patternNameHash == bytes32(0)) {
                i++;
                continue;
            }

            patternMatchedData = patterns(patternIdentifier, patternMatchedData);

            patternMatchedData.lastPatternStartingSpecialSeqIdx = patternIdentifier.patternSpecialSeqStartingIdx;
            patternMatchedData.lastPatternEndingSpecialSeqIdx = patternIdentifier.patternSpecialSeqEndingIdx;
            i = patternIdentifier.patternSpecialSeqEndingIdx;
        }

        return patternMatchedData;
    }

    function identifyPatternCharacter(bytes memory _pattern, uint256 _currentPatternIndex)
        private
        pure
        returns (PatternIdentifier memory _patternIdentifier)
    {
        if (
            uint8(_pattern[_currentPatternIndex]) == OPEN_SQUARE_BRACKET
                && uint8(_pattern[_currentPatternIndex - 1]) != OPEN_SQUARE_BRACKET
        ) {
            uint256 _closeSquareBracketIndex = _currentPatternIndex + 1;
            for (uint256 j = _closeSquareBracketIndex; j < _pattern.length - 1; j++) {
                if (uint8(_pattern[j]) == CLOSE_SQUARE_BRACKET && uint8(_pattern[j - 1]) != BACK_SLASH) {
                    _closeSquareBracketIndex = j;
                    break;
                }
            }

            if (_closeSquareBracketIndex > _currentPatternIndex) {
                _patternIdentifier = PatternIdentifier({
                    patternNameHash: CHARACTER_CLASSES,
                    patternSpecialSeqStartingIdx: _currentPatternIndex,
                    patternSpecialSeqEndingIdx: _closeSquareBracketIndex
                });
            }
        } else {
            _patternIdentifier;
        }
    }

    function patterns(PatternIdentifier memory _patternIdentifier, PatternMatchedData memory _patternMatchedData)
        private
        pure
        returns (PatternMatchedData memory patternMatchedData)
    {
        if (_patternIdentifier.patternNameHash == CHARACTER_CLASSES) {
            patternMatchedData = squareBracketsPattern(_patternIdentifier, _patternMatchedData);
        }
    }

    function squareBracketsPattern(
        PatternIdentifier memory _patternIdentifier,
        PatternMatchedData memory _patternMatchedData
    ) private pure returns (PatternMatchedData memory) {
        uint256 _startIndex = _patternIdentifier.patternSpecialSeqStartingIdx + 1;
        uint256 _endIndex = _patternIdentifier.patternSpecialSeqEndingIdx - 1;
        bytes memory _pattern = _patternMatchedData.patternString;

        if (uint8(_pattern[_startIndex]) == CARET_SIGN) {
            _patternMatchedData = squareBracketsSpecialSequences(_startIndex, _endIndex, _patternMatchedData, true);
        } else {
            _patternMatchedData = squareBracketsSpecialSequences(_startIndex, _endIndex, _patternMatchedData, false);
        }

        return _patternMatchedData;
    }

    function squareBracketsSpecialSequences(
        uint256 _startIndex,
        uint256 _endIndex,
        PatternMatchedData memory _patternMatchedData,
        bool _negation
    ) private pure returns (PatternMatchedData memory) {
        bytes memory _pattern = _patternMatchedData.patternString;

        for (uint256 i = _negation ? _startIndex + 1 : _startIndex; i <= _endIndex;) {
            if (uint8(_pattern[i + 1]) == MINUS_SIGN && i + 1 < _endIndex) {
                _patternMatchedData =
                    findInRange(i, i + 2, _patternMatchedData, _pattern, _patternMatchedData.remainingString, _negation);
                i = i + 3;
            } else if (uint8(_pattern[i]) == BACK_SLASH) {
                if (uint8(_pattern[i + 1]) == SMALL_d) {
                    _patternMatchedData =
                        findInNumberRange(_patternMatchedData, _patternMatchedData.remainingString, _negation);
                    i += 2;
                }
            } else {
                _patternMatchedData =
                    findSingleChar(i, _patternMatchedData, _pattern, _patternMatchedData.remainingString, _negation);
                i++;
            }
        }

        return _patternMatchedData;
    }

    function findInRange(
        uint256 _lowerBoundIndex,
        uint256 _upperBoundIndex,
        PatternMatchedData memory _patternMatchedData,
        bytes memory _pattern,
        bytes memory _string,
        bool _negation
    ) private pure returns (PatternMatchedData memory) {
        uint8 lowerBoundUnicode = uint8(_pattern[_lowerBoundIndex]);
        uint8 upperBoundUnicode = uint8(_pattern[_upperBoundIndex]);

        if (lowerBoundUnicode > upperBoundUnicode) {
            string memory errorMsg = string(
                abi.encodePacked(
                    "SyntaxError: Invalid regular expression ", _pattern, " Range out of order in character class"
                )
            );
            revert(errorMsg);
        }

        return findPatternStringInRangeBounds(
            _string, _negation, lowerBoundUnicode, upperBoundUnicode, _patternMatchedData
        );
    }

    function findSingleChar(
        uint256 _singleBoundIndex,
        PatternMatchedData memory _patternMatchedData,
        bytes memory _pattern,
        bytes memory _string,
        bool _negation
    ) private pure returns (PatternMatchedData memory) {
        bytes memory remainingString;
        int256 foundCharIndex = -1;
        uint8 singleBoundUnicode = uint8(_pattern[_singleBoundIndex]);

        for (uint256 i = 0; i < _string.length; i++) {
            if (_negation) {
                if (uint8(_string[i]) != singleBoundUnicode) {
                    remainingString = abi.encodePacked(remainingString, string(abi.encodePacked(_string[i])));
                    if (foundCharIndex == -1) {
                        foundCharIndex = int256(i);
                    }
                }
            } else {
                if (uint8(_string[i]) == singleBoundUnicode) {
                    remainingString = trimString(_string, i);
                    foundCharIndex = int256(i);
                    break;
                }
            }
        }

        _patternMatchedData = organizeOutput(foundCharIndex, _string, remainingString, _patternMatchedData);

        return _patternMatchedData;
    }

    function findInNumberRange(PatternMatchedData memory _patternMatchedData, bytes memory _string, bool _negation)
        private
        pure
        returns (PatternMatchedData memory)
    {
        bytes1 zeroUnicode = bytes1(abi.encodePacked("0"));
        bytes1 nineUnicode = bytes1(abi.encodePacked("9"));
        uint8 lowerBoundUnicode = uint8(zeroUnicode);
        uint8 upperBoundUnicode = uint8(nineUnicode);

        return findPatternStringInRangeBounds(
            _string, _negation, lowerBoundUnicode, upperBoundUnicode, _patternMatchedData
        );
    }

    function findPatternStringInRangeBounds(
        bytes memory _string,
        bool _negation,
        uint8 lowerBoundUnicode,
        uint8 upperBoundUnicode,
        PatternMatchedData memory _patternMatchedData
    ) private pure returns (PatternMatchedData memory) {
        bytes memory remainingString;
        int256 foundCharIndex = -1;

        for (uint256 i = 0; i < _string.length; i++) {
            if (_negation) {
                if (uint8(_string[i]) < lowerBoundUnicode || uint8(_string[i]) > upperBoundUnicode) {
                    remainingString = abi.encodePacked(remainingString, string(abi.encodePacked(_string[i])));
                    if (foundCharIndex == -1) {
                        foundCharIndex = int256(i);
                    }
                }
            } else {
                if (uint8(_string[i]) >= lowerBoundUnicode && uint8(_string[i]) <= upperBoundUnicode) {
                    remainingString = trimString(_string, i);
                    foundCharIndex = int256(i);
                    break;
                }
            }
        }

        _patternMatchedData = organizeOutput(foundCharIndex, _string, remainingString, _patternMatchedData);

        return _patternMatchedData;
    }

    function organizeOutput(
        int256 foundCharIndex,
        bytes memory _string,
        bytes memory remainingString,
        PatternMatchedData memory _patternMatchedData
    ) private pure returns (PatternMatchedData memory) {
        if (foundCharIndex > -1) {
            bytes memory absoluteRemainingString;
            bytes memory foundChar = abi.encodePacked(_string[uint256(foundCharIndex)]);
            int256 firstIndexOfMatchedChar = indexOf(string(remainingString), string(foundChar));

            if (firstIndexOfMatchedChar > -1) {
                for (uint256 i = 0; i < remainingString.length; i++) {
                    if (i == uint256(firstIndexOfMatchedChar)) {
                        continue;
                    }

                    absoluteRemainingString =
                        abi.encodePacked(string(absoluteRemainingString), string(abi.encodePacked(remainingString[i])));
                }
            }

            _patternMatchedData.remainingString = absoluteRemainingString;
            _patternMatchedData.patternMatchedString = abi.encodePacked(_string[uint256(foundCharIndex)]);
            _patternMatchedData.stringLastMatchedCharIndex =
                uint256(indexOf(string(_patternMatchedData.mainString), string(foundChar)));
        }

        return _patternMatchedData;
    }

    // function plusOneOrMore(
    //     uint256 _startPatternIndex,
    //     bytes memory _lastPatternOutput,
    //     bytes memory _string,
    //     bytes memory _pattern
    // ) private pure returns (bytes memory) {
    //     string memory lastChar = string(abi.encodePacked(_lastPatternOutput[_lastPatternOutput.length - 1]));
    //     int256 lastIndex = indexOf(string(_string), lastChar);

    //     bytes memory _trimmedString;
    //     if (lastIndex >= 0) {
    //         _trimmedString = trimString(_string, uint256(lastIndex));
    //     }

    //     bool loopFlag = true;

    //     while (loopFlag && _trimmedString.length > 0) {
    //         string memory output = identifyPatternCharacter(_trimmedString, _pattern, _startPatternIndex);
    //         int256 newIndex = indexOf(string(_trimmedString), output);
    //         if (newIndex >= 0) {
    //             if (lastIndex + 1 != newIndex) break;
    //             _trimmedString = trimString(_trimmedString, uint256(newIndex));
    //             _lastPatternOutput = abi.encodePacked(string(_lastPatternOutput), output);
    //         }
    //     }

    //     return _lastPatternOutput;
    // }

    function trimString(bytes memory _string, uint256 _newStartIndex) private pure returns (bytes memory) {
        bytes memory _newString;

        for (uint256 i = _newStartIndex; i < _string.length; i++) {
            _newString = abi.encodePacked(_newString, _string[i]);
        }

        return _newString;
    }
}
