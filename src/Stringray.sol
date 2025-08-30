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

    struct PatternMatchedData {
        uint256 lastPatternStartingSpecialSeqIdx;
        uint256 lastPatternEndingSpecialSeqIdx;
        bytes mainString;
        bytes remainingString;
        bytes patternString;
        bytes remainingPatternString;
        bytes lastPatternAtom;
        bytes patternMatchedString;
        bytes1 patternMatchedChar;
        int256 stringLastMatchedCharIndex;
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

        PatternIdentifier memory patternIdentifier;

        for (uint256 i = 1; i < patternInBytes.length - 1;) {
            patternIdentifier = identifyPatternCharacter(patternInBytes, i);

            bytes32 _patternHash = patternIdentifier.patternNameHash;
            if (_patternHash == bytes32(0)) {
                i++;
                continue;
            }

            uint256 _startIndex = patternIdentifier.patternSpecialSeqStartingIdx + 1;
            uint256 _endIndex = patternIdentifier.patternSpecialSeqEndingIdx - 1;

            patternMatchedData.lastPatternStartingSpecialSeqIdx = _startIndex - 1;
            patternMatchedData.lastPatternEndingSpecialSeqIdx = _endIndex + 1;

            bytes memory remainingPatternString = trimString(patternInBytes, _endIndex + 1, patternInBytes.length - 3);
            patternMatchedData.remainingPatternString = remainingPatternString;

            patternMatchedData.lastPatternAtom = trimString(patternInBytes, _startIndex - 1, _endIndex + 1);

            patternMatchedData =
                patterns(_startIndex, _endIndex, _patternHash, patternMatchedData, patternInBytes, stringInBytes);

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
        } else if (uint8(_pattern[_currentPatternIndex]) == PLUS_SIGN) {
            _patternIdentifier = PatternIdentifier({
                patternNameHash: QUANTIFIER_PLUS,
                patternSpecialSeqStartingIdx: _currentPatternIndex,
                patternSpecialSeqEndingIdx: _currentPatternIndex
            });
        } else {
            _patternIdentifier;
        }
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

        if (_patternHash == CHARACTER_CLASSES) {
            for (uint256 s = 0; s < _string.length; s++) {
                matchFound = squareBracketsPattern(_startIndex, _endIndex, _pattern, _string[s]);

                if (matchFound) {
                    _patternMatchedData.patternMatchedChar = _string[s];
                    _patternMatchedData.patternMatchedString = abi.encodePacked(
                        string(_patternMatchedData.patternMatchedString), string(abi.encodePacked(_string[s]))
                    );

                    _patternMatchedData.stringLastMatchedCharIndex = int256(s);
                    _patternMatchedData.remainingString = trimString(_string, s + 1, 0);
                    return _patternMatchedData;
                }
            }
        }

        if (_patternHash == QUANTIFIER_PLUS) {
            for (uint256 s = 0; s < _patternMatchedData.remainingString.length; s++) {
                matchFound = quantifierPlusPattern();

                if (matchFound) {
                    return organizeOutput(s, _string, _patternMatchedData);
                }
            }
        }

        return _patternMatchedData;
    }

    function quantifierPlusPattern() private pure returns (bool) {}

    function squareBracketsPattern(uint256 _startIndex, uint256 _endIndex, bytes memory _pattern, bytes1 _targetChar)
        private
        pure
        returns (bool)
    {
        bool matchFound;

        if (uint8(_pattern[_startIndex]) == CARET_SIGN) {
            matchFound = squareBracketsSpecialSequences(_startIndex, _endIndex, _pattern, _targetChar, true);

            if (matchFound) {
                return matchFound;
            }
        } else {
            matchFound = squareBracketsSpecialSequences(_startIndex, _endIndex, _pattern, _targetChar, false);

            if (matchFound) {
                return matchFound;
            }
        }

        return matchFound;
    }

    function squareBracketsSpecialSequences(
        uint256 _startIndex,
        uint256 _endIndex,
        bytes memory _pattern,
        bytes1 _targetChar,
        bool _negation
    ) private pure returns (bool) {
        uint256 startingIndex = _negation ? _startIndex + 1 : _startIndex;
        bool matchFound;
        bool[] memory allTruthFlags = new bool[](_endIndex - startingIndex);
        uint256 currentAllTruthFlagsIdx;

        for (uint256 i = startingIndex; i <= _endIndex;) {
            if (uint8(_pattern[i + 1]) == MINUS_SIGN && i + 1 < _endIndex) {
                matchFound = findInRange(i, i + 2, _pattern, _targetChar, _negation);

                if (!_negation && matchFound) {
                    return true;
                }

                allTruthFlags[currentAllTruthFlagsIdx] = matchFound;
                currentAllTruthFlagsIdx++;
                i = i + 3;
            } else if (uint8(_pattern[i]) == BACK_SLASH) {
                if (uint8(_pattern[i + 1]) == SMALL_d) {
                    matchFound = findInNumberRange(_targetChar, _negation);

                    if (!_negation && matchFound) {
                        return true;
                    }

                    allTruthFlags[currentAllTruthFlagsIdx] = matchFound;
                    currentAllTruthFlagsIdx++;
                    i += 2;
                } else if (uint8(_pattern[i + 1]) == SMALL_w) {
                    matchFound = findInWordCharsRange(_targetChar, _negation);

                    if (!_negation && matchFound) {
                        return true;
                    }

                    allTruthFlags[currentAllTruthFlagsIdx] = matchFound;
                    currentAllTruthFlagsIdx++;
                    i += 2;
                } else if (uint8(_pattern[i + 1]) == SMALL_s) {
                    matchFound = findInWhiteSpaceRange(_targetChar, _negation);

                    if (!_negation && matchFound) {
                        return true;
                    }

                    allTruthFlags[currentAllTruthFlagsIdx] = matchFound;
                    currentAllTruthFlagsIdx++;
                    i += 2;
                } else if (uint8(_pattern[i + 1]) == BIG_D) {
                    matchFound = findInNumberRange(_targetChar, _negation, true);

                    if (!_negation && matchFound) {
                        return true;
                    }

                    allTruthFlags[currentAllTruthFlagsIdx] = matchFound;
                    currentAllTruthFlagsIdx++;
                    i += 2;
                } else if (uint8(_pattern[i + 1]) == BIG_W) {
                    matchFound = findInWordCharsRange(_targetChar, _negation, true);

                    if (!_negation && matchFound) {
                        return true;
                    }

                    allTruthFlags[currentAllTruthFlagsIdx] = matchFound;
                    currentAllTruthFlagsIdx++;
                    i += 2;
                } else if (uint8(_pattern[i + 1]) == BIG_S) {
                    matchFound = findInWhiteSpaceRange(_targetChar, _negation, true);

                    if (!_negation && matchFound) {
                        return true;
                    }

                    allTruthFlags[currentAllTruthFlagsIdx] = matchFound;
                    currentAllTruthFlagsIdx++;
                    i += 2;
                } else {
                    string memory errorMsg = string(
                        abi.encodePacked(
                            "SyntaxError: Invalid regular expression ",
                            _pattern,
                            " '\\",
                            _pattern[i + 1],
                            "', out of order in character class"
                        )
                    );
                    revert(errorMsg);
                }
            } else {
                matchFound = findSingleChar(i, _pattern, _targetChar, _negation);

                if (!_negation && matchFound) {
                    return true;
                }

                allTruthFlags[currentAllTruthFlagsIdx] = matchFound;
                currentAllTruthFlagsIdx++;
                i++;
            }
        }

        matchFound = true;
        for (uint256 m = 0; m < currentAllTruthFlagsIdx; m++) {
            if (allTruthFlags[m] == false) {
                matchFound = false;
                break;
            }
        }

        return matchFound;
    }

    function findInRange(
        uint256 _lowerBoundIndex,
        uint256 _upperBoundIndex,
        bytes memory _pattern,
        bytes1 _targetChar,
        bool _negation
    ) private pure returns (bool) {
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

        return findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, _negation);
    }

    function findSingleChar(uint256 _singleBoundIndex, bytes memory _pattern, bytes1 _targetChar, bool _negation)
        private
        pure
        returns (bool)
    {
        uint8 singleBoundUnicode = uint8(_pattern[_singleBoundIndex]);

        return _findSingleChar(singleBoundUnicode, _targetChar, _negation);
    }

    function _findSingleChar(uint8 singleBoundUnicode, bytes1 _targetChar, bool _negation)
        private
        pure
        returns (bool)
    {
        if (_negation) {
            if (uint8(_targetChar) != singleBoundUnicode) {
                return true;
            }
            return false;
        }

        if (uint8(_targetChar) == singleBoundUnicode) {
            return true;
        }
        return false;
    }

    function findInNumberRange(bytes1 _targetChar, bool _negation) private pure returns (bool) {
        return _findInNumberRange(_targetChar, _negation, false);
    }

    function findInNumberRange(bytes1 _targetChar, bool _negation, bool _bigCase) private pure returns (bool) {
        return _findInNumberRange(_targetChar, _negation, _bigCase);
    }

    function _findInNumberRange(bytes1 _targetChar, bool _negation, bool _bigCase) private pure returns (bool) {
        if ((_bigCase || _negation) && !(_bigCase && _negation)) {
            _negation = true;
        } else if (_bigCase && _negation) {
            _negation = false;
        }

        bytes1 zero = bytes1(abi.encodePacked("0"));
        bytes1 nine = bytes1(abi.encodePacked("9"));
        uint8 lowerBoundUnicode = uint8(zero);
        uint8 upperBoundUnicode = uint8(nine);

        return findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, _negation);
    }

    function findInWordCharsRange(bytes1 _targetChar, bool _negation) private pure returns (bool) {
        return _findInWordCharsRange(_targetChar, _negation, false);
    }

    function findInWordCharsRange(bytes1 _targetChar, bool _negation, bool _bigCase) private pure returns (bool) {
        return _findInWordCharsRange(_targetChar, _negation, _bigCase);
    }

    function _findInWordCharsRange(bytes1 _targetChar, bool _negation, bool _bigCase) private pure returns (bool) {
        if ((_bigCase || _negation) && !(_bigCase && _negation)) {
            _negation = true;
        } else if (_bigCase && _negation) {
            _negation = false;
        }

        bytes1 lowerBoundWord = bytes1(abi.encodePacked("a"));
        bytes1 upperBoundWord = bytes1(abi.encodePacked("z"));
        uint8 lowerBoundUnicode = uint8(lowerBoundWord);
        uint8 upperBoundUnicode = uint8(upperBoundWord);

        bool found = findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, _negation);

        if ((!found && !_negation) || (found && _negation)) {
            lowerBoundWord = bytes1(abi.encodePacked("A"));
            upperBoundWord = bytes1(abi.encodePacked("Z"));
            lowerBoundUnicode = uint8(lowerBoundWord);
            upperBoundUnicode = uint8(upperBoundWord);
            found = findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, _negation);
        }

        if ((!found && !_negation) || (found && _negation)) {
            found = _findInNumberRange(_targetChar, _negation, false);
        }

        if ((!found && !_negation) || (found && _negation)) {
            found = _findSingleChar(uint8(bytes1(abi.encodePacked("_"))), _targetChar, _negation);
        }

        return found;
    }

    function findInWhiteSpaceRange(bytes1 _targetChar, bool _negation) private pure returns (bool) {
        return _findInWhiteSpaceRange(_targetChar, _negation, false);
    }

    function findInWhiteSpaceRange(bytes1 _targetChar, bool _negation, bool _bigCase) private pure returns (bool) {
        return _findInWhiteSpaceRange(_targetChar, _negation, _bigCase);
    }

    function _findInWhiteSpaceRange(bytes1 _targetChar, bool _negation, bool _bigCase) private pure returns (bool) {
        if ((_bigCase || _negation) && !(_bigCase && _negation)) {
            _negation = true;
        } else if (_bigCase && _negation) {
            _negation = false;
        }

        bytes1 lowerBoundWhiteSpace = bytes1(abi.encodePacked("\t"));
        bytes1 upperBoundWhiteSpace = bytes1(abi.encodePacked("\r"));
        bytes1 singleBoundWhiteSpace = bytes1(abi.encodePacked(" "));
        uint8 lowerBoundUnicode = uint8(lowerBoundWhiteSpace);
        uint8 upperBoundUnicode = uint8(upperBoundWhiteSpace);
        uint8 singleBoundUnicode = uint8(singleBoundWhiteSpace);

        bool found = findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, _negation);

        if ((!found && !_negation) || (found && _negation)) {
            found = _findSingleChar(singleBoundUnicode, _targetChar, _negation);
        }

        return found;
    }

    function findPatternStringInRangeBounds(
        uint8 lowerBoundUnicode,
        uint8 upperBoundUnicode,
        bytes1 _targetChar,
        bool _negation
    ) private pure returns (bool) {
        if (_negation) {
            if (uint8(_targetChar) < lowerBoundUnicode || uint8(_targetChar) > upperBoundUnicode) {
                return true;
            }
            return false;
        }

        if (uint8(_targetChar) >= lowerBoundUnicode && uint8(_targetChar) <= upperBoundUnicode) {
            return true;
        }
        return false;
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
        _patternMatchedData.remainingString = trimString(_string, foundCharIndex + 1, 0);
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

    function trimString(bytes memory _string, uint256 _newStartIndex, uint256 _newEndingIndex)
        private
        pure
        returns (bytes memory)
    {
        bytes memory _newString;

        if (_newEndingIndex <= 0) {
            _newEndingIndex = _string.length - 1;
        }

        for (uint256 i = _newStartIndex; i <= _newEndingIndex; i++) {
            _newString = abi.encodePacked(_newString, _string[i]);
        }

        return _newString;
    }
}
