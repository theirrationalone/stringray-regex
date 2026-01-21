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

    function _indexOf(string memory _target, string memory _search, uint256 _startIndex) private pure returns (int256) {
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
    uint8 private constant DOT = 46;
    uint8 private constant OPEN_SQUARE_BRACKET = 91;
    uint8 private constant CLOSE_SQUARE_BRACKET = 93;
    uint8 private constant OPEN_PARANTHESIS = 40;
    uint8 private constant CLOSE_PARANTHESIS = 41;
    uint8 private constant PLUS_SIGN = 43;
    uint8 private constant ASTERSIK = 42;
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
    uint8 private constant BIG_S = 83;
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
    bytes32 private constant QUANTIFIER_PLUS = keccak256(abi.encodePacked("QUANTIFIER_PLUS"));
    bytes32 private constant QUANTIFIER_ASTERISK = keccak256(abi.encodePacked("QUANTIFIER_ASTERISK"));
    bytes32 private constant QUANTIFIER_QUESTION_MARK = keccak256(abi.encodePacked("QUANTIFIER_QUESTION_MARK"));
    bytes32 private constant QUANTIFIER_CURLY_BRACES_BOUNDED =
        keccak256(abi.encodePacked("QUANTIFIER_CURLY_BRACES_BOUNDED"));
    bytes32 private constant SINGLE_CHARACTER = keccak256(abi.encodePacked("SINGLE_CHARACTER"));
    bytes32 private constant GROUP = keccak256(abi.encodePacked("GROUP"));
    bytes32 private constant METACHARACTER = keccak256(abi.encodePacked("METACHARACTER"));

    struct PatternMatchedData {
        uint256 lastPatternStartingSpecialSeqIdx;
        uint256 lastPatternEndingSpecialSeqIdx;
        uint256 previousLastPatternStartingSpecialSeqIdx;
        uint256 previousLastPatternEndingSpecialSeqIdx;
        bytes mainString;
        bytes remainingString;
        bytes patternString;
        bytes remainingPatternString;
        bytes lastPatternAtom;
        bytes previousLastPatternAtom;
        bytes patternMatchedString;
        bytes1 patternMatchedChar;
        int256 stringLastMatchedCharIndex;
        uint256 trimmedStringLength;
        bool matchedWithPreceedingAtom;
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
        patternMatchedData.remainingPatternString = patternInBytes;
        patternMatchedData.stringLastMatchedCharIndex = -1;
        patternMatchedData.lastPatternStartingSpecialSeqIdx = 1;
        patternMatchedData.lastPatternEndingSpecialSeqIdx = 1;
        patternMatchedData.previousLastPatternStartingSpecialSeqIdx = 1;
        patternMatchedData.previousLastPatternEndingSpecialSeqIdx = 1;
        patternMatchedData.matchedWithPreceedingAtom = false;
        PatternIdentifier memory patternIdentifier;
        for (uint256 i = 1; i < patternInBytes.length - 1;) {
            patternIdentifier = identifyPatternCharacter(patternInBytes, i);
            bytes32 _patternHash = patternIdentifier.patternNameHash;
            if (_patternHash == bytes32(0)) {
                i++;
                continue;
            }
            uint256 _startIndex = patternIdentifier.patternSpecialSeqStartingIdx;
            uint256 _endIndex = patternIdentifier.patternSpecialSeqEndingIdx;
            patternMatchedData = patterns(
                _startIndex,
                _endIndex,
                _patternHash,
                patternMatchedData,
                patternInBytes,
                patternMatchedData.remainingString
            );

            // if (!patternMatchedData.matchedWithPreceedingAtom) {
            //     patternMatchedData.remainingString = trimString(patternMatchedData.remainingString, 1, -1);
            //     patternMatchedData.patternMatchedChar = bytes1(0);
            //     patternMatchedData.patternMatchedString = new bytes(0);

            //     patternMatchedData.lastPatternAtom = patternMatchedData.previousLastPatternAtom;

            //     patternMatchedData.lastPatternStartingSpecialSeqIdx =
            //         patternMatchedData.previousLastPatternStartingSpecialSeqIdx;

            //     patternMatchedData.lastPatternEndingSpecialSeqIdx =
            //         patternMatchedData.previousLastPatternEndingSpecialSeqIdx;

            //     i = patternMatchedData.previousLastPatternEndingSpecialSeqIdx;

            //     if (patternMatchedData.remainingString.length == 0) return patternMatchedData;
            //     continue;
            // }

            patternMatchedData.lastPatternStartingSpecialSeqIdx = _startIndex;
            patternMatchedData.lastPatternEndingSpecialSeqIdx = _endIndex;

            bytes memory remainingPatternString =
                trimString(patternInBytes, _endIndex + 1, int256(patternInBytes.length - 2));
            patternMatchedData.remainingPatternString = remainingPatternString;
            patternMatchedData.lastPatternAtom = trimString(patternInBytes, _startIndex, int256(_endIndex));
            patternMatchedData.matchedWithPreceedingAtom = false;

            i = patternIdentifier.patternSpecialSeqEndingIdx = patternIdentifier.patternSpecialSeqEndingIdx + 1;
        }
        return patternMatchedData;
    }

    function identifyPatternCharacter(bytes memory _pattern, uint256 _currentPatternIndex)
        private
        pure
        returns (PatternIdentifier memory _patternIdentifier)
    {
        _patternIdentifier = identifyMetacharacters(_pattern, _currentPatternIndex);

        if (_patternIdentifier.patternNameHash != bytes32(0)) {
            return _patternIdentifier;
        } else {
            _patternIdentifier = PatternIdentifier({
                patternNameHash: SINGLE_CHARACTER,
                patternSpecialSeqStartingIdx: _currentPatternIndex,
                patternSpecialSeqEndingIdx: _currentPatternIndex
            });
        }
    }

    function identifyMetacharacters(bytes memory _pattern, uint256 _currentPatternIndex)
        private
        pure
        returns (PatternIdentifier memory _patternIdentifier)
    {
        if (isDotMetacharacter(_pattern, _currentPatternIndex)) {
            _patternIdentifier = PatternIdentifier({
                patternNameHash: METACHARACTER,
                patternSpecialSeqStartingIdx: _currentPatternIndex,
                patternSpecialSeqEndingIdx: _currentPatternIndex
            });
        }
    }

    function isDotMetacharacter(bytes memory _pattern, uint256 _currentPatternIndex) private pure returns (bool) {
        if (uint8(_pattern[_currentPatternIndex]) == DOT && uint8(_pattern[_currentPatternIndex - 1]) != BACK_SLASH) {
            return true;
        }
        return false;
    }

    function patterns(
        uint256 _startIndex,
        uint256 _endIndex,
        bytes32 _patternHash,
        PatternMatchedData memory _patternMatchedData,
        bytes memory _pattern,
        bytes memory _string
    ) private pure returns (PatternMatchedData memory) {
        bool matchFound;

        if (_patternHash == METACHARACTER) {
            _patternMatchedData = metaCharacterPattern(_patternMatchedData, _startIndex);
        }

        return _patternMatchedData;
    }

    function metaCharacterPattern(PatternMatchedData memory _patternMatchedData, uint256 metaCharacterIndex)
        private
        pure
        returns (PatternMatchedData memory)
    {
        if (isDotMetacharacter(_patternMatchedData.patternString, metaCharacterIndex)) {
            return dotMetaCharacter(_patternMatchedData);
        }
    }

    function dotMetaCharacter(PatternMatchedData memory _patternMatchedData)
        private
        pure
        returns (PatternMatchedData memory)
    {
        bytes1 currentChar = _patternMatchedData.remainingString[0];
        uint8 targetCharCode = uint8(currentChar);
        bool matchFound = _dotMetaCharacter(_patternMatchedData, targetCharCode, false);
        if (matchFound) {
            int256 targetCharIdx = indexOf(
                string(_patternMatchedData.mainString),
                string(abi.encodePacked(currentChar)),
                _patternMatchedData.trimmedStringLength // lays bug: infinite loop MOOG, on removing it
            );
            if (targetCharIdx > -1) {
                _patternMatchedData =
                    organizeOutput(uint256(targetCharIdx), _patternMatchedData.mainString, _patternMatchedData);
            }
        }
        return _patternMatchedData;
    }

    function _dotMetaCharacter(PatternMatchedData memory _patternMatchedData, uint8 targetCharCode, bool negation)
        private
        pure
        returns (bool)
    {
        uint8 newlineCode = uint8(bytes1(abi.encodePacked("\n")));
        uint8 carriageReturnCode = uint8(bytes1(abi.encodePacked("\r")));

        if (negation) {
            if (targetCharCode == newlineCode || targetCharCode == carriageReturnCode) {
                return true;
            } else {
                return false;
            }
        } else {
            if (targetCharCode != newlineCode && targetCharCode != carriageReturnCode) {
                return true;
            } else {
                return false;
            }
        }
    }

    function organizeOutput(uint256 foundCharIndex, bytes memory _string, PatternMatchedData memory _patternMatchedData)
        private
        pure
        returns (PatternMatchedData memory)
    {
        _patternMatchedData.patternMatchedChar = _string[foundCharIndex];
        _patternMatchedData.patternMatchedString = abi.encodePacked(
            string(_patternMatchedData.patternMatchedString), string(abi.encodePacked(_string[foundCharIndex]))
        );

        _patternMatchedData.stringLastMatchedCharIndex = int256(foundCharIndex);
        _patternMatchedData.remainingString = trimString(_string, foundCharIndex + 1, -1);
        _patternMatchedData.trimmedStringLength = _string.length - _patternMatchedData.remainingString.length;
        _patternMatchedData.previousLastPatternAtom = _patternMatchedData.lastPatternAtom;
        _patternMatchedData.matchedWithPreceedingAtom = true;
        _patternMatchedData.previousLastPatternStartingSpecialSeqIdx =
        _patternMatchedData.lastPatternStartingSpecialSeqIdx;
        _patternMatchedData.previousLastPatternEndingSpecialSeqIdx = _patternMatchedData.lastPatternEndingSpecialSeqIdx;
        return _patternMatchedData;
    }

    function trimString(bytes memory _string, uint256 _newStartIndex, int256 _newEndingIndex)
        private
        pure
        returns (bytes memory)
    {
        bytes memory _newString;

        if (_newEndingIndex <= -1) {
            _newEndingIndex = int256(_string.length) - 1;
        }

        for (uint256 i = _newStartIndex; i <= uint256(_newEndingIndex); i++) {
            _newString = abi.encodePacked(_newString, _string[i]);
        }

        return _newString;
    }
}
