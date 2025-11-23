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
    uint8 private constant DOT = 46;
    uint8 private constant OPEN_SQUARE_BRACKET = 91;
    uint8 private constant CLOSE_SQUARE_BRACKET = 93;
    uint8 private constant OPEN_PARANTHESIS = 40;
    uint8 private constant CLOSE_PARANTHESIS = 41;
    uint8 private constant PLUS_SIGN = 43;
    uint8 private constant ASTERISK = 42;
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
    bytes32 private constant META_CHARACTER = keccak256(abi.encodePacked("META_CHARACTER"));
    bytes32 private constant ESCAPE_CHARACTER = keccak256(abi.encodePacked("ESCAPE_CHARACTER"));

    struct PatternMatchedData {
        uint256 lastPatternStartingSpecialSeqIdx;
        uint256 lastPatternEndingSpecialSeqIdx;
        uint256 previousLastPatternStartingSpecialSeqIdx;
        uint256 previousLastPatternEndingSpecialSeqIdx;
        bytes mainString;
        bytes remainingString;
        bytes patternString;
        bytes remainingPatternString;
        bytes remainingPattern;
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
        patternMatchedData.remainingPattern = patternInBytes;
        patternMatchedData.stringLastMatchedCharIndex = -1;
        patternMatchedData.lastPatternStartingSpecialSeqIdx = 1;
        patternMatchedData.lastPatternEndingSpecialSeqIdx = 1;
        patternMatchedData.previousLastPatternStartingSpecialSeqIdx = 1;
        patternMatchedData.previousLastPatternEndingSpecialSeqIdx = 1;
        patternMatchedData.matchedWithPreceedingAtom = false;

        PatternIdentifier memory patternIdentifier;

        for (uint256 i = 1; i < patternInBytes.length - 1;) {
            console2.log("back to regex, remaining string length: ", patternMatchedData.remainingString.length);
            if (patternMatchedData.remainingString.length == 0) {
                uint256 zero = 0;
                patternMatchedData.patternMatchedString = bytes("");
                patternMatchedData.patternMatchedChar = bytes1("");
                return patternMatchedData;
            }
            console2.log("remaining pattern string in regex: ", string(patternMatchedData.remainingPatternString));
            console2.log("i: ", i);
            patternIdentifier = identifyPatternCharacter(patternInBytes, i, patternMatchedData.remainingPattern);

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

            if (!patternMatchedData.matchedWithPreceedingAtom) {
                patternMatchedData.remainingString = trimString(patternMatchedData.remainingString, 1, -1);
                patternMatchedData.patternMatchedChar = bytes1(0);
                patternMatchedData.patternMatchedString = new bytes(0);

                patternMatchedData.lastPatternAtom = patternMatchedData.previousLastPatternAtom;

                patternMatchedData.lastPatternStartingSpecialSeqIdx =
                    patternMatchedData.previousLastPatternStartingSpecialSeqIdx;

                patternMatchedData.lastPatternEndingSpecialSeqIdx =
                    patternMatchedData.previousLastPatternEndingSpecialSeqIdx;

                i = patternMatchedData.previousLastPatternEndingSpecialSeqIdx;

                if (patternMatchedData.remainingString.length == 0) return patternMatchedData;
                continue;
            }

            patternMatchedData.lastPatternStartingSpecialSeqIdx = _startIndex;
            patternMatchedData.lastPatternEndingSpecialSeqIdx = _endIndex;

            bytes memory remainingPatternString =
                trimString(patternInBytes, _endIndex + 1, int256(patternInBytes.length - 2));
            patternMatchedData.remainingPatternString = remainingPatternString;
            patternMatchedData.remainingPattern = abi.encodePacked("/", remainingPatternString, "/");
            patternMatchedData.lastPatternAtom = trimString(patternInBytes, _startIndex, int256(_endIndex));
            patternMatchedData.matchedWithPreceedingAtom = false;

            i = patternIdentifier.patternSpecialSeqEndingIdx + 1;
        }

        return patternMatchedData;
    }

    function identifyPatternCharacter(
        bytes memory _pattern,
        uint256 _currentPatternIndex,
        bytes memory _remainingPattern
    ) private pure returns (PatternIdentifier memory _patternIdentifier) {
        console2.log("identifyPatternCharacter remainingPatternString: ", string(_remainingPattern));
        console2.log("identifyPatternCharacter currentPatternIndex: ", _currentPatternIndex);
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
        } else if (uint8(_pattern[_currentPatternIndex]) == ASTERISK) {
            _patternIdentifier = PatternIdentifier({
                patternNameHash: QUANTIFIER_ASTERISK,
                patternSpecialSeqStartingIdx: _currentPatternIndex,
                patternSpecialSeqEndingIdx: _currentPatternIndex
            });
        } else if (uint8(_pattern[_currentPatternIndex]) == QUESTION_MARK) {
            console2.log("in question mark");
            _patternIdentifier = PatternIdentifier({
                patternNameHash: QUANTIFIER_QUESTION_MARK,
                patternSpecialSeqStartingIdx: _currentPatternIndex,
                patternSpecialSeqEndingIdx: _currentPatternIndex
            });
        } else if (
            uint8(_pattern[_currentPatternIndex]) == OPEN_CURLY_BRACE
                && uint8(_pattern[_currentPatternIndex + 1]) != CLOSE_CURLY_BRACE
                && uint8(_pattern[_currentPatternIndex + 1]) != COMMA_SIGN
        ) {
            uint256 endingIndex = _currentPatternIndex + 1;

            for (uint256 i = _currentPatternIndex + 1; i < _pattern.length; i++) {
                if (uint8(_pattern[i]) == CLOSE_CURLY_BRACE) {
                    endingIndex = i;
                    break;
                }
            }

            uint256 commaOccurence;
            bool validPattern = true;

            if (endingIndex > _currentPatternIndex + 1) {
                for (uint256 i = _currentPatternIndex + 1; i < endingIndex; i++) {
                    if (uint8(_pattern[i]) == COMMA_SIGN) {
                        commaOccurence += 1;
                        if (commaOccurence > 1) {
                            validPattern = false;
                            break;
                        }
                    } else if (uint8(_pattern[i]) < 48 || uint8(_pattern[i]) > 57) {
                        validPattern = false;
                        break;
                    }
                }

                if (validPattern) {
                    _patternIdentifier = PatternIdentifier({
                        patternNameHash: QUANTIFIER_CURLY_BRACES_BOUNDED,
                        patternSpecialSeqStartingIdx: _currentPatternIndex,
                        patternSpecialSeqEndingIdx: endingIndex
                    });
                }
            }
        } else if (
            uint8(_pattern[_currentPatternIndex]) == OPEN_PARANTHESIS
                && uint8(_pattern[_currentPatternIndex - 1]) != BACK_SLASH
        ) {
            uint256 numOpenParanthesis = 1;
            uint256 numCloseParanthesis;
            uint256 currentPatternEndingIndex = _currentPatternIndex + 1;
            bool openSquareBracketFoundInsideGroup;
            bool closeSquareBracketFoundInsideGroup;
            for (uint256 p = currentPatternEndingIndex; p < _pattern.length; p++) {
                if (!closeSquareBracketFoundInsideGroup) {
                    if (
                        openSquareBracketFoundInsideGroup && uint8(_pattern[p]) != CLOSE_SQUARE_BRACKET
                            && uint8(_pattern[p]) == CLOSE_PARANTHESIS
                    ) {
                        string memory errorMsg = string(
                            abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern, ": missing ]")
                        );
                        revert(errorMsg);
                    }

                    if (!openSquareBracketFoundInsideGroup && uint8(_pattern[p]) == OPEN_SQUARE_BRACKET) {
                        openSquareBracketFoundInsideGroup = true;
                        continue;
                    }

                    if (
                        openSquareBracketFoundInsideGroup
                            && (
                                (uint8(_pattern[p]) != CLOSE_SQUARE_BRACKET && uint8(_pattern[p]) != CLOSE_PARANTHESIS)
                                    || (uint8(_pattern[p]) == CLOSE_SQUARE_BRACKET && uint8(_pattern[p - 1]) == BACK_SLASH)
                            )
                    ) {
                        continue;
                    }

                    if (
                        openSquareBracketFoundInsideGroup
                            && (uint8(_pattern[p]) == CLOSE_SQUARE_BRACKET && uint8(_pattern[p - 1]) != BACK_SLASH)
                    ) {
                        closeSquareBracketFoundInsideGroup = true;
                        continue;
                    }
                }

                if (uint8(_pattern[p]) == CLOSE_PARANTHESIS && uint8(_pattern[p - 1]) != BACK_SLASH) {
                    numCloseParanthesis += 1;

                    if (numOpenParanthesis == numCloseParanthesis) {
                        currentPatternEndingIndex = p;
                    }
                } else if (uint8(_pattern[p]) == OPEN_PARANTHESIS && uint8(_pattern[p - 1]) != BACK_SLASH) {
                    numOpenParanthesis += 1;
                }
            }

            if (numOpenParanthesis != numCloseParanthesis) {
                string memory errorMsg = string(
                    abi.encodePacked(
                        "SyntaxError: Invalid regular expression: ",
                        _pattern,
                        ": Un",
                        numOpenParanthesis > numCloseParanthesis ? "terminated" : "matched",
                        " group"
                    )
                );
                revert(errorMsg);
            }

            if (currentPatternEndingIndex > _currentPatternIndex + 1) {
                _patternIdentifier = PatternIdentifier({
                    patternNameHash: GROUP,
                    patternSpecialSeqStartingIdx: _currentPatternIndex,
                    patternSpecialSeqEndingIdx: currentPatternEndingIndex
                });
            }
        } else if (
            uint8(_pattern[_currentPatternIndex]) == BACK_SLASH && _isEscapeSequence(_pattern, _currentPatternIndex + 1)
        ) {
            console2.log("yes it's a back slash");
            _patternIdentifier = PatternIdentifier({
                patternNameHash: ESCAPE_CHARACTER,
                patternSpecialSeqStartingIdx: _currentPatternIndex,
                patternSpecialSeqEndingIdx: _currentPatternIndex + 1
            });
        } else if (isMetaCharacter(_remainingPattern, 1)) {
            console2.log("detected that it's a metaCharacter!");
            _patternIdentifier = PatternIdentifier({
                patternNameHash: META_CHARACTER,
                patternSpecialSeqStartingIdx: _currentPatternIndex,
                patternSpecialSeqEndingIdx: _currentPatternIndex
            });
        } else {
            console2.log("yes it's a single character!");
            _patternIdentifier = PatternIdentifier({
                patternNameHash: SINGLE_CHARACTER,
                patternSpecialSeqStartingIdx: _currentPatternIndex,
                patternSpecialSeqEndingIdx: _currentPatternIndex
            });
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
            (,, bool isHashEmpty) = findQuantifierLastAtom(_patternMatchedData);

            if (isHashEmpty) {
                for (uint256 s = 0; s < _patternMatchedData.mainString.length; s++) {
                    matchFound = squareBracketsPattern(
                        _startIndex + 1, _endIndex - 1, _pattern, _patternMatchedData.mainString[s]
                    );

                    if (matchFound) {
                        return organizeOutput(s, _patternMatchedData.mainString, _patternMatchedData);
                    }
                }
            } else {
                bytes1 currentChar = _patternMatchedData.remainingString[0];

                matchFound = squareBracketsPattern(_startIndex + 1, _endIndex - 1, _pattern, currentChar);

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
            }
        }

        if (_patternHash == QUANTIFIER_PLUS) {
            (bytes32 _atomPatternHash, bytes memory lastPatternAtom, bool isHashEmpty) =
                findQuantifierLastAtom(_patternMatchedData);

            if (isHashEmpty) {
                return _patternMatchedData;
            }

            if (_atomPatternHash == CHARACTER_CLASSES) {
                for (uint256 s = 0; s < _patternMatchedData.remainingString.length;) {
                    bytes1 targetChar = _patternMatchedData.remainingString[s];

                    matchFound = quantifierPattern(lastPatternAtom, targetChar, _atomPatternHash);

                    if (matchFound) {
                        int256 targetCharIdx = indexOf(
                            string(_string),
                            string(abi.encodePacked(targetChar)),
                            _patternMatchedData.trimmedStringLength // lays bug: infinite loop MOOG, on removing it
                        );
                        if (targetCharIdx > -1) {
                            _patternMatchedData = organizeOutput(uint256(targetCharIdx), _string, _patternMatchedData);
                        }
                    } else {
                        break;
                    }
                }
            }

            if (_atomPatternHash == SINGLE_CHARACTER) {
                _patternMatchedData = singleCharacterFinder(_patternMatchedData, _startIndex - 1, true);
            }
        }

        if (_patternHash == QUANTIFIER_ASTERISK) {
            (bytes32 _atomPatternHash, bytes memory lastPatternAtom, bool isHashEmpty) =
                findQuantifierLastAtom(_patternMatchedData);

            if (isHashEmpty) {
                return _patternMatchedData;
            }

            if (_atomPatternHash == CHARACTER_CLASSES) {
                _patternMatchedData.patternMatchedChar = bytes1("");
                _patternMatchedData.patternMatchedString = new bytes(0);
                _patternMatchedData.stringLastMatchedCharIndex = -1;

                for (uint256 s = 0; s < _string.length; s++) {
                    bytes1 targetChar = _string[s];

                    matchFound = quantifierPattern(lastPatternAtom, targetChar, _atomPatternHash);

                    if (matchFound) {
                        _patternMatchedData = organizeOutput(s, _string, _patternMatchedData);
                    } else {
                        break;
                    }
                }
            }

            if (_atomPatternHash == SINGLE_CHARACTER) {
                _patternMatchedData.patternMatchedChar = bytes1("");
                _patternMatchedData.patternMatchedString = new bytes(0);
                _patternMatchedData.stringLastMatchedCharIndex = -1;

                for (uint256 s = 0; s < _string.length; s++) {
                    bytes1 targetChar = _string[s];

                    matchFound = findSingleChar(_startIndex - 1, _pattern, targetChar, false);

                    if (matchFound) {
                        _patternMatchedData = organizeOutput(s, _string, _patternMatchedData);
                    } else {
                        break;
                    }
                }
            }
        }

        if (_patternHash == QUANTIFIER_QUESTION_MARK) {
            console2.log("in question mark in patterns func");
            (bytes32 _atomPatternHash, bytes memory lastPatternAtom, bool isHashEmpty) =
                findQuantifierLastAtom(_patternMatchedData);

            console2.log("last atom: ", string(lastPatternAtom));
            if (isHashEmpty) {
                console2.log("hash is empty");
                return _patternMatchedData;
            }
            console2.log("not empty");

            if (_atomPatternHash == CHARACTER_CLASSES) {
                _patternMatchedData.patternMatchedChar = bytes1("");
                _patternMatchedData.patternMatchedString = new bytes(0);
                _patternMatchedData.stringLastMatchedCharIndex = -1;

                bytes1 targetChar = _string[0];

                matchFound = quantifierPattern(lastPatternAtom, targetChar, _atomPatternHash);

                if (matchFound) {
                    _patternMatchedData = organizeOutput(0, _string, _patternMatchedData);
                }
            }

            if (_atomPatternHash == SINGLE_CHARACTER) {
                console2.log("previous hash was a single character");
                console2.log("remaining string: ", string(_string));
                console2.log(
                    "_patternMatchedData.stringLastMatchedCharIndex: ", _patternMatchedData.stringLastMatchedCharIndex
                );
                bytes1 targetChar = _string[0];

                matchFound = findSingleChar(_startIndex - 1, _pattern, targetChar, false);

                if (matchFound) {
                    console2.log("match found organizing output");
                    _patternMatchedData = organizeOutput(0, _string, _patternMatchedData);
                    _patternMatchedData.stringLastMatchedCharIndex += 1;
                } else {
                    _patternMatchedData.patternMatchedChar = bytes1("");
                    _patternMatchedData.patternMatchedString = new bytes(0);
                    _patternMatchedData.stringLastMatchedCharIndex = -1;
                }
            }
        }

        if (_patternHash == QUANTIFIER_CURLY_BRACES_BOUNDED) {
            (bytes32 _atomPatternHash, bytes memory lastPatternAtom, bool isHashEmpty) =
                findQuantifierLastAtom(_patternMatchedData);

            if (isHashEmpty) {
                return _patternMatchedData;
            }

            (uint256 min, int256 max, bool commaFound) = minMaxBracketBoundFinder(_patternMatchedData);

            if (max > -1 && (min > uint256(max))) {
                string memory errorMsg = string(
                    abi.encodePacked(
                        "SyntaxError: Invalid regular expression: ", _pattern, ": numbers out of order in {} quantifier"
                    )
                );
                revert(errorMsg);
            }

            if (_atomPatternHash == CHARACTER_CLASSES) {
                _patternMatchedData.patternMatchedChar = bytes1("");
                _patternMatchedData.patternMatchedString = new bytes(0);
                _patternMatchedData.stringLastMatchedCharIndex = -1;

                (bytes memory matchedSubString, int256 stringLastMatchedCharIndex) =
                    BracketBoundMatchFinder(_string, lastPatternAtom, _atomPatternHash, min, max, commaFound);

                _patternMatchedData.patternMatchedString = matchedSubString;
                _patternMatchedData.remainingString = trimString(_string, uint256(stringLastMatchedCharIndex) + 1, -1);
                if (stringLastMatchedCharIndex > -1) {
                    _patternMatchedData.patternMatchedChar = _string[uint256(stringLastMatchedCharIndex)];
                    _patternMatchedData.stringLastMatchedCharIndex = stringLastMatchedCharIndex;
                }
            }

            if (_atomPatternHash == SINGLE_CHARACTER) {
                _patternMatchedData.patternMatchedChar = bytes1("");
                _patternMatchedData.patternMatchedString = new bytes(0);
                _patternMatchedData.stringLastMatchedCharIndex = -1;

                (bytes memory matchedSubString, int256 stringLastMatchedCharIndex) =
                    BracketBoundMatchFinder(_string, lastPatternAtom, _atomPatternHash, min, max, commaFound);

                _patternMatchedData.patternMatchedString = matchedSubString;
                _patternMatchedData.remainingString = trimString(_string, uint256(stringLastMatchedCharIndex) + 1, -1);
                if (stringLastMatchedCharIndex > -1) {
                    _patternMatchedData.patternMatchedChar = _string[uint256(stringLastMatchedCharIndex)];
                    _patternMatchedData.stringLastMatchedCharIndex = stringLastMatchedCharIndex;
                }
            }
        }

        if (_patternHash == GROUP) {
            _patternMatchedData = groupFinder(_startIndex, _endIndex, _patternMatchedData);
        }

        if (_patternHash == META_CHARACTER) {
            _patternMatchedData = metaCharacter(_patternMatchedData);
        }

        if (_patternHash == ESCAPE_CHARACTER) {
            console2.log("-------***-------");
            console2.log("remaining pattern string: ", string(_patternMatchedData.remainingPatternString));
            _patternMatchedData = singleCharacterFinder(_patternMatchedData, _endIndex, false);
            console2.log("remaining pattern string: ", string(_patternMatchedData.remainingPatternString));
            console2.log("-------***-------");
        }

        if (_patternHash == SINGLE_CHARACTER) {
            (,, bool isHashEmpty) = findQuantifierLastAtom(_patternMatchedData);

            if (isHashEmpty) {
                _patternMatchedData = singleCharacterFinder(_patternMatchedData, _startIndex, false);
            } else {
                bytes1 currentChar = _patternMatchedData.remainingString[0];
                console2.log("-------------");
                console2.log("pattern char: ", string(abi.encodePacked(_pattern[_startIndex])));
                console2.log("target char : ", string(abi.encodePacked(currentChar)));
                console2.log("pattern: ", string(_pattern));
                console2.log("index: ", _startIndex);
                console2.log("------END-------");

                bytes1 patternChar = _pattern[_startIndex];
                // activating below if statement also activates the following BUG.
                // BUG: target = "abc\\", pattern = "/abc\\/"
                // if (uint8(patternChar) == BACK_SLASH) {
                //     patternChar = _pattern[_startIndex + 1];
                // }

                if (currentChar == patternChar) {
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
            }
        }

        return _patternMatchedData;
    }

    function _isEscapeSequence(bytes memory _pattern, uint256 _attachedIndex) private pure returns (bool) {
        if (
            uint8(_pattern[_attachedIndex]) == FORWARD_SLASH && _pattern.length - 1 != _attachedIndex
                || uint8(_pattern[_attachedIndex]) == DOT || uint8(_pattern[_attachedIndex]) == ASTERISK
                || uint8(_pattern[_attachedIndex]) == PLUS_SIGN || uint8(_pattern[_attachedIndex]) == QUESTION_MARK
                || uint8(_pattern[_attachedIndex]) == OPEN_PARANTHESIS
                || uint8(_pattern[_attachedIndex]) == CLOSE_PARANTHESIS
                || uint8(_pattern[_attachedIndex]) == OPEN_SQUARE_BRACKET
                || uint8(_pattern[_attachedIndex]) == CLOSE_SQUARE_BRACKET
                || uint8(_pattern[_attachedIndex]) == OPEN_CURLY_BRACE
                || uint8(_pattern[_attachedIndex]) == CLOSE_CURLY_BRACE || uint8(_pattern[_attachedIndex]) == VERTICAL_BAR
                || uint8(_pattern[_attachedIndex]) == BACK_SLASH
        ) {
            return true;
        }
        return false;
    }

    function _metaCharacter(PatternMatchedData memory _patternMatchedData, uint8 targetCharCode, bool negation)
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

    function metaCharacter(PatternMatchedData memory _patternMatchedData)
        private
        pure
        returns (PatternMatchedData memory)
    {
        bytes1 currentChar = _patternMatchedData.remainingString[0];
        uint8 targetCharCode = uint8(currentChar);
        bool matchFound = _metaCharacter(_patternMatchedData, targetCharCode, false);
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

    // function metaCharacterPattern(PatternMatchedData memory _patternMatchedData, uint256 metaCharacterIndex)
    //     private
    //     pure
    //     returns (PatternMatchedData memory)
    // {
    //     if (uint8(_patternMatchedData.patternString[metaCharacterIndex]) == DOT) {
    //         return metaCharacter(_patternMatchedData);
    // }

    // @Last: we did a patch here
    function isMetaCharacter(bytes memory _pattern, uint256 _currentPatternIndex) private pure returns (bool) {
        console2.log("isMetaCharacter _pattern: ", string(_pattern));
        console2.log("isMetaCharacter currentPatternIndex: ", _currentPatternIndex);
        if (_pattern.length > 2 && _currentPatternIndex > 0 && uint8(_pattern[_currentPatternIndex - 1]) != BACK_SLASH)
        {
            if (
                uint8(_pattern[_currentPatternIndex]) == DOT || uint8(_pattern[_currentPatternIndex]) == ASTERISK
                    || uint8(_pattern[_currentPatternIndex]) == PLUS_SIGN
                    || uint8(_pattern[_currentPatternIndex]) == QUESTION_MARK
                    || uint8(_pattern[_currentPatternIndex]) == OPEN_PARANTHESIS
                    || uint8(_pattern[_currentPatternIndex]) == CLOSE_PARANTHESIS
                    || uint8(_pattern[_currentPatternIndex]) == OPEN_SQUARE_BRACKET
                    || uint8(_pattern[_currentPatternIndex]) == CLOSE_SQUARE_BRACKET
                    || uint8(_pattern[_currentPatternIndex]) == OPEN_CURLY_BRACE
                    || uint8(_pattern[_currentPatternIndex]) == CLOSE_CURLY_BRACE
                    || uint8(_pattern[_currentPatternIndex]) == VERTICAL_BAR
                    || uint8(_pattern[_currentPatternIndex]) == BACK_SLASH
                    || uint8(_pattern[_currentPatternIndex]) == FORWARD_SLASH
            ) {
                return true;
            }
        }
        return false;
    }

    function groupFinder(uint256 _startIndex, uint256 _endIndex, PatternMatchedData memory _patternMatchedData)
        private
        pure
        returns (PatternMatchedData memory)
    {
        bytes memory trimmedPattern =
            trimString(_patternMatchedData.patternString, _startIndex + 1, int256(_endIndex - 1));

        bytes memory newPattern = abi.encodePacked("/", string(trimmedPattern), "/");

        PatternMatchedData memory newPatternData = regex(string(_patternMatchedData.mainString), string(newPattern));

        uint256 lastPatternStartingSpecialSeqIdx = newPatternData.lastPatternStartingSpecialSeqIdx;
        uint256 lastPatternEndingSpecialSeqIdx = newPatternData.lastPatternEndingSpecialSeqIdx;
        bytes memory mainString = newPatternData.mainString;
        bytes memory remainingString = newPatternData.remainingString;
        bytes memory patternString = newPatternData.patternString;
        bytes memory patternMatchedString = newPatternData.patternMatchedString;
        bytes memory remainingPatternString = newPatternData.remainingPatternString;
        bytes memory lastPatternAtom = newPatternData.lastPatternAtom;
        bytes1 patternMatchedChar = newPatternData.patternMatchedChar;
        int256 stringLastMatchedCharIndex = newPatternData.stringLastMatchedCharIndex;

        console2.log("lastPatternStartingSpecialSeqIdx: ", lastPatternStartingSpecialSeqIdx);
        console2.log("lastPatternEndingSpecialSeqIdx  : ", lastPatternEndingSpecialSeqIdx);
        console2.log("mainString                      : ", string(mainString));
        console2.logBytes(mainString);
        console2.log("remainingString                 : ", string(remainingString));
        console2.logBytes(remainingString);
        console2.log("patternMatchedChar              : ", string(abi.encodePacked(patternMatchedChar)));
        console2.logBytes1(patternMatchedChar);
        console2.log("patternString                   : ", string(patternString));
        console2.logBytes(patternString);
        console2.log("patternMatchedString            : ", string(patternMatchedString));
        console2.logBytes(patternMatchedString);
        console2.log("remainingPatternString          : ", string(remainingPatternString));
        console2.logBytes(lastPatternAtom);
        console2.log("lastPatternAtom                 : ", string(lastPatternAtom));
        console2.logBytes(patternMatchedString);
        console2.log("stringLastMatchedCharIndex      : ", stringLastMatchedCharIndex);
        console2.log("inside library ends here..............................");
    }

    function singleCharacterFinder(PatternMatchedData memory _patternMatchedData, uint256 _startIndex, bool repeat)
        private
        pure
        returns (PatternMatchedData memory)
    {
        bool matchFound;
        for (uint256 s = 0; s < _patternMatchedData.remainingString.length;) {
            bytes1 targetChar = _patternMatchedData.remainingString[s];
            matchFound = findSingleChar(_startIndex, _patternMatchedData.patternString, targetChar, false);

            if (matchFound) {
                int256 targetCharIdx = indexOf(
                    string(_patternMatchedData.mainString),
                    string(abi.encodePacked(targetChar)),
                    _patternMatchedData.trimmedStringLength // lays bug: infinite loop MOOG, on removing it
                );
                if (targetCharIdx > -1) {
                    _patternMatchedData =
                        organizeOutput(uint256(targetCharIdx), _patternMatchedData.mainString, _patternMatchedData);
                }

                if (!repeat) {
                    break;
                }
            } else {
                if (_patternMatchedData.patternMatchedString.length > 0 && !repeat) {
                    _patternMatchedData.patternMatchedChar = bytes1("");
                    _patternMatchedData.patternMatchedString = new bytes(0);
                    _patternMatchedData.stringLastMatchedCharIndex = -1;
                    break;
                }

                if (repeat) {
                    break;
                }

                s++;
            }
        }

        return _patternMatchedData;
    }

    function BracketBoundMatchFinder(
        bytes memory _string,
        bytes memory lastPatternAtom,
        bytes32 _atomPatternHash,
        uint256 min,
        int256 max,
        bool commaFound
    ) private pure returns (bytes memory, int256) {
        bool matchFound;
        bytes memory matchedSubString;
        int256 stringLastMatchedCharIndex = -1;

        for (uint256 i = 0; i < _string.length; i++) {
            matchFound = quantifierPattern(lastPatternAtom, _string[i], _atomPatternHash);

            if (matchedSubString.length < min && (max == -1 && !commaFound)) {
                if (matchFound) {
                    matchedSubString = abi.encodePacked(string(matchedSubString), string(abi.encodePacked(_string[i])));

                    if (matchedSubString.length == min) {
                        stringLastMatchedCharIndex = int256(i);
                        break;
                    }
                } else {
                    matchedSubString = new bytes(0);
                }
            } else if (min > 0 && (max == -1 && commaFound)) {
                if (matchFound) {
                    matchedSubString = abi.encodePacked(string(matchedSubString), string(abi.encodePacked(_string[i])));
                } else {
                    if (matchedSubString.length < min) {
                        matchedSubString = new bytes(0);
                    } else {
                        stringLastMatchedCharIndex = int256(i);
                        break;
                    }
                }
            } else if (min > 0 && (max > 0 && uint256(max) >= min)) {
                if (matchFound) {
                    matchedSubString = abi.encodePacked(string(matchedSubString), string(abi.encodePacked(_string[i])));
                    if (matchedSubString.length == uint256(max)) {
                        stringLastMatchedCharIndex = int256(i);
                        break;
                    }
                } else {
                    if (matchedSubString.length < min) {
                        matchedSubString = new bytes(0);
                    } else if (matchedSubString.length == min) {
                        stringLastMatchedCharIndex = int256(i);
                        break;
                    }
                }
            }
        }

        return (matchedSubString, stringLastMatchedCharIndex);
    }

    function minMaxBracketBoundFinder(PatternMatchedData memory _patternMatchedData)
        private
        pure
        returns (uint256, int256, bool)
    {
        uint256 startIndex = _patternMatchedData.lastPatternStartingSpecialSeqIdx + 1;
        uint256 endIndex = _patternMatchedData.lastPatternEndingSpecialSeqIdx - 1;
        bytes memory remainingPatternString =
            trimString(_patternMatchedData.patternString, startIndex, int256(endIndex));

        bytes memory minOccurence;
        bytes memory maxOccurence;
        bool commaFound;

        uint256 min;
        int256 max = -1;

        for (uint256 i = 0; i < remainingPatternString.length; i++) {
            if (uint8(remainingPatternString[i]) == COMMA_SIGN) {
                commaFound = true;
                minOccurence = trimString(remainingPatternString, 0, int256(i - 1));
                maxOccurence = trimString(remainingPatternString, i + 1, -1);
                break;
            }
        }

        if (!commaFound) {
            min = strToIntConverter(remainingPatternString);
        }

        if (commaFound && maxOccurence.length > 0) {
            min = strToIntConverter(minOccurence);
            max = int256(strToIntConverter(maxOccurence));
        } else if (commaFound && maxOccurence.length == 0) {
            min = strToIntConverter(minOccurence);
        }

        return (min, max, commaFound);
    }

    function strToIntConverter(bytes memory stringOccurence) private pure returns (uint256) {
        uint256 stringLength = stringOccurence.length;
        uint256 convertedToInteger;
        uint8 stringUnicode;
        uint256 multiplier = 1;

        uint256 integerForm;

        if (stringLength == 1) {
            stringUnicode = uint8(stringOccurence[0]);

            integerForm = integerUnicodeTranslator(stringUnicode);
        } else {
            for (uint256 i = stringLength - 1; i >= 0;) {
                stringUnicode = uint8(stringOccurence[i]);

                convertedToInteger = integerUnicodeTranslator(stringUnicode);

                integerForm += (multiplier * convertedToInteger);
                multiplier *= 10;

                if (i == 0) {
                    break;
                }

                i--;
            }
        }

        return integerForm;
    }

    function integerUnicodeTranslator(uint8 stringUnicode) private pure returns (uint256 convertedToInteger) {
        if (stringUnicode == 48) {
            convertedToInteger = 0;
        } else if (stringUnicode == 49) {
            convertedToInteger = 1;
        } else if (stringUnicode == 50) {
            convertedToInteger = 2;
        } else if (stringUnicode == 51) {
            convertedToInteger = 3;
        } else if (stringUnicode == 52) {
            convertedToInteger = 4;
        } else if (stringUnicode == 53) {
            convertedToInteger = 5;
        } else if (stringUnicode == 54) {
            convertedToInteger = 6;
        } else if (stringUnicode == 55) {
            convertedToInteger = 7;
        } else if (stringUnicode == 56) {
            convertedToInteger = 8;
        } else if (stringUnicode == 57) {
            convertedToInteger = 9;
        }
    }

    function quantifierPattern(bytes memory lastPatternAtom, bytes1 _targetChar, bytes32 _atomPatternHash)
        private
        pure
        returns (bool)
    {
        bool matchFound;

        if (_atomPatternHash == CHARACTER_CLASSES) {
            matchFound = squareBracketsPattern(2, lastPatternAtom.length - 2, lastPatternAtom, _targetChar);
        }

        if (_atomPatternHash == SINGLE_CHARACTER) {
            matchFound = findSingleChar(1, lastPatternAtom, _targetChar, false);
        }

        return matchFound;
    }

    function findQuantifierLastAtom(PatternMatchedData memory _patternMatchedData)
        private
        pure
        returns (bytes32, bytes memory, bool)
    {
        bool isHashEmpty;
        bytes memory lastPatternAtom = _patternMatchedData.lastPatternAtom;
        lastPatternAtom = abi.encodePacked("/", lastPatternAtom, "/");

        PatternIdentifier memory patternIdentifier = identifyPatternCharacter(lastPatternAtom, 1, bytes(""));

        bytes32 _atomPatternHash = patternIdentifier.patternNameHash;
        if (_atomPatternHash == bytes32(0)) {
            isHashEmpty = true;
        }

        return (_atomPatternHash, lastPatternAtom, isHashEmpty);
    }

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

        console2.log("-------------");
        console2.log("pattern char: ", string(abi.encodePacked(_pattern[_singleBoundIndex])));
        console2.log("target char : ", string(abi.encodePacked(_targetChar)));
        console2.log("------END-------");

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
        console2.log("_string: ", string(_string));
        console2.log("foundCharIndex: ", foundCharIndex);
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
