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
        bytes mainTargetString;
        bytes mainPatternString;
        bytes orgPatternString;
        bytes remainingMainString;
        bytes remainingPatternString;
        int256 lastPatternStartingSpecialSeqIndex;
        int256 lastPatternEndingSpecialSeqIndex;
        int256 secondLastPatternStartingSpecialSeqIndex;
        int256 secondLastPatternEndingSpecialSeqIndex;
        bytes32 lastPatternHash;
        bytes32 secondlastPatternHash;
        bytes lastPatternAtom;
        bytes secondLastPatternAtom;
        int256 lastPatternAtomStartingIndex;
        int256 lastPatternAtomEndingIndex;
        int256 secondLastPatternAtomStartingIndex;
        int256 secondLastPatternAtomEndingIndex;
        int256 targetStringFirstMatchedCharIndex;
        int256 targetStringLastMatchedCharIndex;
        bytes1 targetStringFirstMatchedChar;
        bytes1 targetStringLasttMatchedChar;
        uint256 trimmedStringLength;
        bool isMatchedWithPreceedingAtom;
        bool isPatternFullMatch;
    }

    function regex(string memory _proposedString, string memory _pattern)
        internal
        pure
        returns (PatternMatchedData memory patternMatchedData)
    {
        bytes memory stringInBytes = bytes(_proposedString);
        bytes memory patternInBytes = bytes(_pattern);

        if (patternInBytes.length <= 2) {
            string memory errorMsg = string(abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern));
            revert(errorMsg);
        }

        uint8 patternFirstChar = uint8(patternInBytes[0]);
        uint8 patternLastChar = uint8(patternInBytes[patternInBytes.length - 1]);

        if (patternFirstChar != FORWARD_SLASH || patternLastChar != FORWARD_SLASH) {
            string memory errorMsg = string(
                abi.encodePacked(
                    "SyntaxError: Invalid regular expression: ",
                    _pattern,
                    ": missing ",
                    string(abi.encodePacked(FORWARD_SLASH))
                )
            );
            revert(errorMsg);
        }

        patternMatchedData = initializePatternMatchedData(stringInBytes, patternInBytes);

        if (stringInBytes.length == 0) {
            return patternMatchedData;
        }

        printPatternMatchedData(patternMatchedData);

        patternMatchedData = processPatternMatching(patternMatchedData);
    }

    function processPatternMatching(PatternMatchedData memory patternMatchedData)
        private
        pure
        returns (PatternMatchedData memory _patternMatchedData)
    {
        bytes memory pattern = patternMatchedData.mainPatternString;

        for (uint256 patternCurrentCharIndex = 0; patternCurrentCharIndex < pattern.length;) {
            patternMatchedData = identifyPatternSequence(patternMatchedData, patternCurrentCharIndex);

            if (patternMatchedData.lastPatternHash == bytes32(0)) {
                bytes memory leftmostPatternString = trimString(
                    patternMatchedData.orgPatternString, 0, patternMatchedData.lastPatternStartingSpecialSeqIndex + 1
                );

                bytes memory errorInPattern = trimString(
                    patternMatchedData.orgPatternString,
                    uint256(patternMatchedData.lastPatternStartingSpecialSeqIndex + 2),
                    patternMatchedData.lastPatternEndingSpecialSeqIndex + 2
                );

                bytes memory rightmostPatternString = trimString(
                    patternMatchedData.orgPatternString,
                    uint256(patternMatchedData.lastPatternStartingSpecialSeqIndex + 3),
                    -1
                );

                errorInPattern =
                    abi.encodePacked(leftmostPatternString, "->", errorInPattern, "<-", rightmostPatternString);
                string memory errorMsg =
                    string(abi.encodePacked("PatternError: Invalid pattern sequence: ", string(errorInPattern)));
                revert(errorMsg);
            }
        }
    }

    function identifyPatternSequence(PatternMatchedData memory patternMatchedData, uint256 patternCurrentCharIndex)
        private
        pure
        returns (PatternMatchedData memory _patternMatchedData)
    {
        uint256 patternMaxIndex = patternMatchedData.mainPatternString.length - 1;
        uint8 currentPatternChar;
        if (patternCurrentCharIndex < patternMaxIndex) {
            currentPatternChar = uint8(patternMatchedData.mainPatternString[patternCurrentCharIndex + 1]);
        }

        // @note: start implementing from here...
        if (currentPatternChar == QUESTION_MARK) {}
    }

    function initializePatternMatchedData(bytes memory _string, bytes memory _pattern)
        private
        pure
        returns (PatternMatchedData memory patternMatchedData)
    {
        bytes memory trimmedPattern = trimString(_pattern, 1, int256(_pattern.length - 2));
        patternMatchedData.mainTargetString = _string;
        patternMatchedData.mainPatternString = trimmedPattern;
        patternMatchedData.orgPatternString = _pattern;
        patternMatchedData.remainingMainString = _string;
        patternMatchedData.remainingPatternString = trimmedPattern;
        patternMatchedData.lastPatternStartingSpecialSeqIndex = -1;
        patternMatchedData.lastPatternEndingSpecialSeqIndex = -1;
        patternMatchedData.secondLastPatternStartingSpecialSeqIndex = -1;
        patternMatchedData.secondLastPatternEndingSpecialSeqIndex = -1;
        patternMatchedData.lastPatternAtomStartingIndex = -1;
        patternMatchedData.lastPatternAtomEndingIndex = -1;
        patternMatchedData.secondLastPatternAtomStartingIndex = -1;
        patternMatchedData.secondLastPatternAtomEndingIndex = -1;
        patternMatchedData.targetStringFirstMatchedCharIndex = -1;
        patternMatchedData.targetStringLastMatchedCharIndex = -1;

        // @note: members below are set to their default values
        // patternMatchedData.lastPatternHash = bytes32("");
        // patternMatchedData.secondlastPatternHash = bytes32("");
        // patternMatchedData.lastPatternAtom = bytes("");
        // patternMatchedData.secondLastPatternAtom = bytes("");
        // patternMatchedData.targetStringFirstMatchedChar = bytes1("");
        // patternMatchedData.targetStringLasttMatchedChar = bytes1("");
        // patternMatchedData.trimmedStringLength = 0;
        // patternMatchedData.isMatchedWithPreceedingAtom = false;
        // patternMatchedData.isPatternFullMatch = false;
    }

    function printPatternMatchedData(PatternMatchedData memory patternMatchedData) private pure {
        console2.log("patternMatchedData.mainTargetString      : ", string(patternMatchedData.mainTargetString));
        console2.log("patternMatchedData.mainPatternString     : ", string(patternMatchedData.mainPatternString));
        console2.log("patternMatchedData.orgPatternString      : ", string(patternMatchedData.orgPatternString));
        console2.log("patternMatchedData.remainingMainString   : ", string(patternMatchedData.remainingMainString));
        console2.log("patternMatchedData.remainingPatternString: ", string(patternMatchedData.remainingPatternString));
        console2.log(
            "patternMatchedData.lastPatternStartingSpecialSeqIndex: ",
            patternMatchedData.lastPatternStartingSpecialSeqIndex
        );
        console2.log(
            "patternMatchedData.lastPatternEndingSpecialSeqIndex: ", patternMatchedData.lastPatternEndingSpecialSeqIndex
        );
        console2.log(
            "patternMatchedData.secondLastPatternStartingSpecialSeqIndex: ",
            patternMatchedData.secondLastPatternStartingSpecialSeqIndex
        );
        console2.log(
            "patternMatchedData.secondLastPatternEndingSpecialSeqIndex: ",
            patternMatchedData.secondLastPatternEndingSpecialSeqIndex
        );
        console2.log(
            "patternMatchedData.lastPatternAtomStartingIndex: ", patternMatchedData.lastPatternAtomStartingIndex
        );
        console2.log("patternMatchedData.lastPatternAtomEndingIndex: ", patternMatchedData.lastPatternAtomEndingIndex);
        console2.log(
            "patternMatchedData.secondLastPatternAtomStartingIndex: ",
            patternMatchedData.secondLastPatternAtomStartingIndex
        );
        console2.log(
            "patternMatchedData.secondLastPatternAtomEndingIndex: ", patternMatchedData.secondLastPatternAtomEndingIndex
        );
        console2.log(
            "patternMatchedData.targetStringFirstMatchedCharIndex: ",
            patternMatchedData.targetStringFirstMatchedCharIndex
        );
        console2.log(
            "patternMatchedData.targetStringLastMatchedCharIndex: ", patternMatchedData.targetStringLastMatchedCharIndex
        );
        console2.log(
            "patternMatchedData.lastPatternHash: ", string(abi.encodePacked(patternMatchedData.lastPatternHash))
        );
        console2.log(
            "patternMatchedData.secondlastPatternHash: ",
            string(abi.encodePacked(patternMatchedData.secondlastPatternHash))
        );
        console2.log("patternMatchedData.lastPatternAtom: ", string(patternMatchedData.lastPatternAtom));
        console2.log("patternMatchedData.secondLastPatternAtom: ", string(patternMatchedData.secondLastPatternAtom));
        console2.log(
            "patternMatchedData.targetStringFirstMatchedChar: ",
            string(abi.encodePacked(patternMatchedData.targetStringFirstMatchedChar))
        );
        console2.log(
            "patternMatchedData.targetStringLasttMatchedChar: ",
            string(abi.encodePacked(patternMatchedData.targetStringLasttMatchedChar))
        );
        console2.log("patternMatchedData.trimmedStringLength: ", patternMatchedData.trimmedStringLength);
        console2.log("patternMatchedData.isMatchedWithPreceedingAtom: ", patternMatchedData.isMatchedWithPreceedingAtom);
        console2.log("patternMatchedData.isPatternFullMatch: ", patternMatchedData.isPatternFullMatch);
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
