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

    bytes32 private constant INVALID_ATOM = "INVALID_ATOM";
    bytes32 private constant LITERAL_ATOM = "LITERAL_ATOM";
    bytes32 private constant CHARACTER_CLASS_ATOM = "CHARACTER_CLASS_ATOM";
    bytes32 private constant WORD_BOUNDARY = "WORD_BOUNDARY";
    bytes32 private constant CONTROL_PREFIX = "CONTROL_PREFIX";
    bytes32 private constant DIGIT = "DIGIT";
    bytes32 private constant FORMFEED = "FORMFEED";
    bytes32 private constant NAMED_BACKREFERENCE_PREFIX = "NAMED_BACKREFERENCE_PREFIX";
    bytes32 private constant DIGIT_BACKREFERENCE_PREFIX = "DIGIT_BACKREFERENCE_PREFIX";
    bytes32 private constant NEWLINE = "NEWLINE";
    bytes32 private constant UNICODE_PROPERTY = "UNICODE_PROPERTY";
    bytes32 private constant CARRIAGE_RETURN = "CARRIAGE_RETURN";
    bytes32 private constant WHITESPACE = "WHITESPACE";
    bytes32 private constant TAB = "TAB";
    bytes32 private constant UNICODE_ESCAPE = "UNICODE_ESCAPE";
    bytes32 private constant VERTICAL_TAB = "VERTICAL_TAB";
    bytes32 private constant WORD_CHARACTER = "WORD_CHARACTER";
    bytes32 private constant HEX_ESCAPE = "HEX_ESCAPE";
    bytes32 private constant NOT_WORD_BOUNDARY = "NOT_WORD_BOUNDARY";
    bytes32 private constant NOT_DIGIT = "NOT_DIGIT";
    bytes32 private constant UNICODE_PROPERTY_NEGATION = "UNICODE_PROPERTY_NEGATION";
    bytes32 private constant NOT_WHITESPACE = "NOT_WHITESPACE";
    bytes32 private constant NOT_WORD_CHARACTER = "NOT_WORD_CHARACTER";
    bytes32 private constant NULL_CHARACTER = "NULL_CHARACTER";
    bytes32 private constant OCTAL = "OCTAL";
    bytes32 private constant ASTERISK_GREEDY_QUANTIFIER_ATOM = "*_GREEDY_QUANTIFIER_ATOM";
    // @info: BUG: bytes32 private constant PLUS_GREEDY_QUANTIFIER_ATOM = "*_GREEDY_QUANTIFIER_ATOM";
    // @status: resolved!
    bytes32 private constant PLUS_GREEDY_QUANTIFIER_ATOM = "+_GREEDY_QUANTIFIER_ATOM";
    bytes32 private constant QUESTION_MARK_GREEDY_QUANTIFIER_ATOM = "?_GREEDY_QUANTIFIER_ATOM";
    bytes32 private constant N_RANGE_GREEDY_QUANTIFIER_ATOM = "{N}_GREEDY_QUANTIFIER_ATOM";
    bytes32 private constant N_AND_INFINITE_RANGE_GREEDY_QUANTIFIER_ATOM = "{N,}_GREEDY_QUANTIFIER_ATOM";
    bytes32 private constant N_AND_M_RANGE_GREEDY_QUANTIFIER_ATOM = "{N,M}_GREEDY_QUANTIFIER_ATOM";
    bytes32 private constant ASTERISK_LAZY_QUANTIFIER_ATOM = "*?_LAZY_QUANTIFIER_ATOM";
    bytes32 private constant PLUS_LAZY_QUANTIFIER_ATOM = "+?_LAZY_QUANTIFIER_ATOM";
    bytes32 private constant QUESTION_MARK_LAZY_QUANTIFIER_ATOM = "??_LAZY_QUANTIFIER_ATOM";
    bytes32 private constant N_RANGE_LAZY_QUANTIFIER_ATOM = "{N}?_LAZY_QUANTIFIER_ATOM";
    bytes32 private constant N_AND_INFINITE_RANGE_LAZY_QUANTIFIER_ATOM = "{N,}?_LAZY_QUANTIFIER_ATOM";
    bytes32 private constant N_AND_M_RANGE_LAZY_QUANTIFIER_ATOM = "{N,M}?_LAZY_QUANTIFIER_ATOM";

    function regex(string memory _proposedString, string memory _pattern) internal pure {
        validateRegex(_pattern);
        bytes memory stringInBytes = bytes(_proposedString);
        bytes memory patternInBytes = bytes(_pattern);
        console2.log("----------------");
        console2.log("ORIGINAL TARGET STRING: ", _proposedString);
        console2.log("ORIGINAL PATTERN STRING: ", _pattern);
        console2.log("string in bytes: ");
        console2.logBytes(stringInBytes);
        console2.log("pattern in bytes: ");
        console2.logBytes(patternInBytes);
        console2.log("----------------");
        bytes memory filteredPatternInBytes = trimString(patternInBytes, 1, int256(patternInBytes.length - 2));
        nuclearFission(filteredPatternInBytes);
    }

    function nuclearFission(bytes memory _pattern) private pure {
        int256 patternLength = int256(_pattern.length);
        for (int256 particleIdx = 0; particleIdx < patternLength;) {
            (bytes memory atom, bytes32 atomType, int256 atomEndIdx) = classifyAtom(_pattern, uint256(particleIdx));

            console2.log("---In nuclearFission---");
            console2.log("Iteration no: ", particleIdx + 1);
            console2.log("atom bytes form: ");
            console2.logBytes(atom);
            console2.log("atom: ", string(atom));

            console2.log("ATOM TYPE HASH: ");
            console2.logBytes32(atomType);
            printAtomType(atomType);
            console2.log("atomEndIdx: ", atomEndIdx);
            console2.log("---");

            particleIdx = atomEndIdx + 1;
        }
    }

    function classifyAtom(bytes memory _pattern, uint256 _currentParticleIdx)
        private
        pure
        returns (bytes memory, bytes32, int256)
    {
        bytes memory atom;
        bool isTrue;
        uint256 atomLastIdx;
        bytes32 atomType;

        (isTrue, atomType, atomLastIdx) = atomIdClassifier(_pattern, _currentParticleIdx);

        if (isTrue) {
            atom = trimString(_pattern, _currentParticleIdx, int256(atomLastIdx));
            console2.log("---In classifyAtom---");
            console2.log("atom: ", string(atom));
            console2.log("atomLastIdx: ", atomLastIdx);
            console2.log("atomLastIdx cast: ", int256(atomLastIdx));
            console2.log("---");
            return (atom, atomType, int256(atomLastIdx));
        }

        return (atom, atomType, int256(atomLastIdx));
    }

    function atomIdClassifier(bytes memory _pattern, uint256 _currentParticleIdx)
        private
        pure
        returns (bool, bytes32, uint256)
    {
        (bool flag, bytes32 atomType, uint256 lastMatchedParticleIndex) = isLiteralAtom(_pattern, _currentParticleIdx);

        if (!flag) {
            (flag, atomType, lastMatchedParticleIndex) = isCharacterClass(_pattern, _currentParticleIdx);
        }

        if (flag && _pattern.length - 1 >= lastMatchedParticleIndex + 1) {
            (flag, atomType, lastMatchedParticleIndex) =
                isGreedyQuantifierAtom(_pattern, lastMatchedParticleIndex + 1, atomType);
            if (flag && _pattern.length - 1 >= lastMatchedParticleIndex + 1) {
                console2.log("Yes it has a greedy quantifier atom");
                (flag, atomType, lastMatchedParticleIndex) =
                    isLazyQuantifierAtom(_pattern, atomType, lastMatchedParticleIndex + 1);
                if (flag && _pattern.length - 1 >= lastMatchedParticleIndex + 1) {
                    // @question: is it irrelevent??
                    // @answer: No, Actually it saves GAS by eliminating one more big iteration
                    (flag, atomType, lastMatchedParticleIndex) =
                        isLazyQuantifierAtom(_pattern, atomType, lastMatchedParticleIndex + 1);
                    if (flag) {
                        string memory errorMsg = string(
                            abi.encodePacked(
                                "SyntaxError: Invalid regular expression: ", _pattern, ": Nothing to repeat"
                            )
                        );
                        revert(errorMsg);
                    } else if (!flag && _pattern.length - 1 >= lastMatchedParticleIndex) {
                        (flag, atomType, lastMatchedParticleIndex) =
                            isGreedyQuantifierAtom(_pattern, lastMatchedParticleIndex, atomType);
                        console2.log("Flag under lazy: ", flag);
                        if (flag) {
                            console2.log("Yes flag is true under lazy, expecting a revert...");
                            string memory errorMsg = string(
                                abi.encodePacked(
                                    "SyntaxError: Invalid regular expression: ", _pattern, ": Nothing to repeat"
                                )
                            );
                            revert(errorMsg);
                        }
                    }
                } else if (!flag && _pattern.length - 1 >= lastMatchedParticleIndex) {
                    (flag, atomType, lastMatchedParticleIndex) =
                        isGreedyQuantifierAtom(_pattern, lastMatchedParticleIndex, atomType);
                    console2.log("Flag: ", flag);
                    if (flag) {
                        console2.log("Yes flag is true, expecting a revert...");
                        string memory errorMsg = string(
                            abi.encodePacked(
                                "SyntaxError: Invalid regular expression: ", _pattern, ": Nothing to repeat"
                            )
                        );
                        revert(errorMsg);
                    }
                }
            }

            if (!flag) {
                flag = true;
                lastMatchedParticleIndex--;
            }

            return (flag, atomType, lastMatchedParticleIndex);
        }

        if (!flag) {
            (flag, atomType, lastMatchedParticleIndex) = isGreedyQuantifierAtom(_pattern, _currentParticleIdx, atomType);
            console2.log("flag for jackless greedy quantifier atom.............");
            console2.log("flag: ", flag);
            console2.log("lastMatchedParticleIndex: ", lastMatchedParticleIndex);
            console2.log("---");
            if (flag) {
                string memory errorMsg = string(
                    abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern, ": Nothing to repeat")
                );
                revert(errorMsg);
            }
        }

        return (flag, atomType, lastMatchedParticleIndex);
    }

    function isLiteralAtom(bytes memory _pattern, uint256 _currentParticleIdx)
        private
        pure
        returns (bool, bytes32, uint256)
    {
        bytes32 atomType = INVALID_ATOM;
        uint256 lastMatchedParticleIndex = _currentParticleIdx;
        bytes1 targetChar = _pattern[_currentParticleIdx];

        bool flag = isBigAlphabet(targetChar);

        if (!flag) {
            flag = isSmallAlphabet(targetChar);
        }

        if (!flag) {
            flag = isPunctuation(targetChar);
        }

        if (!flag) {
            (flag, lastMatchedParticleIndex) = isEscapeLiteral(_pattern, _currentParticleIdx);
        }

        console2.log("flag: ", flag);
        console2.log("lastMatchedParticleIndex: ", lastMatchedParticleIndex);

        if (flag) {
            if (
                _currentParticleIdx + 1 < lastMatchedParticleIndex
                    && uint8(_pattern[_currentParticleIdx + 1]) == uint8(abi.encodePacked("x")[0])
            ) {
                atomType = HEX_ESCAPE;
            } else if (
                _currentParticleIdx + 1 < lastMatchedParticleIndex
                    && uint8(_pattern[_currentParticleIdx + 1]) == uint8(abi.encodePacked("u")[0])
            ) {
                atomType = UNICODE_ESCAPE;
            } else if (
                _currentParticleIdx + 1 < lastMatchedParticleIndex
                    && uint8(_pattern[_currentParticleIdx + 1]) == uint8(abi.encodePacked("K")[0])
            ) {
                atomType = NAMED_BACKREFERENCE_PREFIX;
            } else if (
                _currentParticleIdx + 1 < lastMatchedParticleIndex
                    && uint8(_pattern[_currentParticleIdx + 1]) == uint8(abi.encodePacked("p")[0])
            ) {
                atomType = UNICODE_PROPERTY;
            } else if (
                _currentParticleIdx + 1 < lastMatchedParticleIndex
                    && uint8(_pattern[_currentParticleIdx + 1]) == uint8(abi.encodePacked("P")[0])
            ) {
                atomType = UNICODE_PROPERTY_NEGATION;
            } else if (
                _currentParticleIdx + 1 < lastMatchedParticleIndex
                    && uint8(_pattern[_currentParticleIdx + 1]) == uint8(abi.encodePacked("c")[0])
            ) {
                atomType = CONTROL_PREFIX;
            } else if (
                _currentParticleIdx + 1 <= lastMatchedParticleIndex && isDigit(_pattern[_currentParticleIdx + 1], false)
                    && isDigit(_pattern[lastMatchedParticleIndex], false)
            ) {
                atomType = DIGIT_BACKREFERENCE_PREFIX;
            } else if (
                _currentParticleIdx + 1 == lastMatchedParticleIndex
                    && uint8(_pattern[_currentParticleIdx]) == BACK_SLASH
            ) {
                uint8 lastMatchedParticle = uint8(_pattern[lastMatchedParticleIndex]);

                if (lastMatchedParticle == uint8(abi.encodePacked("b")[0])) {
                    atomType = WORD_BOUNDARY;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("d")[0])) {
                    atomType = DIGIT;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("f")[0])) {
                    atomType = FORMFEED;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("n")[0])) {
                    atomType = NEWLINE;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("r")[0])) {
                    atomType = CARRIAGE_RETURN;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("s")[0])) {
                    atomType = WHITESPACE;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("t")[0])) {
                    atomType = TAB;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("v")[0])) {
                    atomType = VERTICAL_TAB;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("w")[0])) {
                    atomType = WORD_CHARACTER;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("B")[0])) {
                    atomType = NOT_WORD_BOUNDARY;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("D")[0])) {
                    atomType = NOT_DIGIT;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("S")[0])) {
                    atomType = NOT_WHITESPACE;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("W")[0])) {
                    atomType = NOT_WORD_CHARACTER;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("0")[0])) {
                    atomType = NULL_CHARACTER;
                } else if (
                    lastMatchedParticle >= uint8(abi.encodePacked("1")[0])
                        && lastMatchedParticle <= uint8(abi.encodePacked("7")[0])
                ) {
                    atomType = OCTAL;
                } else {
                    atomType = LITERAL_ATOM;
                }
            } else {
                atomType = LITERAL_ATOM;
            }
        }

        if (!flag) {
            (flag, lastMatchedParticleIndex) = isRangeLiteral(_pattern, _currentParticleIdx);

            if (flag) {
                atomType = LITERAL_ATOM;
            }
        }

        if (!flag) {
            (flag, lastMatchedParticleIndex) = isUnicodeLiteral(_pattern, _currentParticleIdx);

            if (flag) {
                atomType = LITERAL_ATOM;
            }
        }

        console2.log("---In isLiteralAtom---");
        console2.log("flag: ", flag);
        console2.log("lastMatchedParticleIndex: ", lastMatchedParticleIndex);
        console2.log("---");

        return (flag, atomType, lastMatchedParticleIndex);
    }

    function isCharacterClass(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, bytes32, uint256)
    {
        // @TODO: Complete the character class detection implementation.
        // @status: Implementation finished ~ Jan 22, 2026 03:54 PM IST
        uint256 lastMatchedParticleIndex;
        bool flag;

        if (uint8(_pattern[_currentParticleIndex]) == OPEN_SQUARE_BRACKET) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (uint8(_pattern[_currentParticleIndex + 1]) == CLOSE_SQUARE_BRACKET) {
                    string memory errorMsg = string(
                        abi.encodePacked(
                            "SyntaxError: Invalid regular expression: ", _pattern, ": Empty Character class"
                        )
                    );
                    revert(errorMsg);
                }
            }

            if (_currentParticleIndex == 1 && uint8(_pattern[_currentParticleIndex - 1]) == BACK_SLASH) {
                return (false, INVALID_ATOM, 0);
            }

            if (
                _currentParticleIndex > 1 && uint8(_pattern[_currentParticleIndex - 1]) == BACK_SLASH
                    && uint8(_pattern[_currentParticleIndex - 2]) != BACK_SLASH
            ) {
                return (false, INVALID_ATOM, 0);
            }

            if (_currentParticleIndex + 2 < _pattern.length) {
                for (uint256 i = _currentParticleIndex + 2; i < _pattern.length; i++) {
                    if (
                        uint8(_pattern[i]) == CLOSE_SQUARE_BRACKET
                            && (uint8(_pattern[i - 1]) != BACK_SLASH || uint8(_pattern[i - 2]) == BACK_SLASH)
                    ) {
                        flag = true;
                        lastMatchedParticleIndex = i;
                        break;
                    }
                }

                if (!flag) {
                    string memory errorMsg = string(
                        abi.encodePacked(
                            "SyntaxError: Invalid regular expression: ", _pattern, ": Unterminated Character class"
                        )
                    );
                    revert(errorMsg);
                }
            }
        }

        if (flag && lastMatchedParticleIndex > _currentParticleIndex) {
            for (uint256 i = _currentParticleIndex + 2; i < lastMatchedParticleIndex - 1; i++) {
                if (uint8(_pattern[i]) == MINUS_SIGN) {
                    // @BUG: Actually a character could be a unicode codepoint of more than one byte
                    // In that case the below logic would fail to validate a range set
                    // @status: not fixed
                    if (uint8(_pattern[i - 1]) <= 127 && uint8(_pattern[i + 1]) <= 127) {
                        if (uint8(_pattern[i - 1]) != BACK_SLASH || uint8(_pattern[i - 2]) == BACK_SLASH) {
                            if (
                                (uint8(_pattern[i + 1]) != BACK_SLASH || uint8(_pattern[i + 2]) == BACK_SLASH)
                                    && uint8(_pattern[i - 1]) > uint8(_pattern[i + 1])
                            ) {
                                string memory errorMsg = string(
                                    abi.encodePacked(
                                        "SyntaxError: Invalid regular expression: ",
                                        _pattern,
                                        ": Range out of order in character class"
                                    )
                                );
                                revert(errorMsg);
                            }
                        }
                    }
                }
            }

            for (uint256 i = _currentParticleIndex + 1; i < lastMatchedParticleIndex; i++) {
                if (uint8(_pattern[i]) == BACK_SLASH) {
                    if (
                        uint8(_pattern[i + 1]) == uint8(abi.encodePacked("p")[0])
                            || uint8(_pattern[i + 1]) == uint8(abi.encodePacked("P")[0])
                    ) {
                        (bool isValid,) = validateBackslash_p_propertyNameEscape(_pattern, i);
                        console2.log("passing through here...");

                        if (!isValid) {
                            string memory errorMsg = string(
                                abi.encodePacked(
                                    "SyntaxError: Invalid regular expression: ",
                                    _pattern,
                                    ": Invalid property name in character class"
                                )
                            );
                            revert(errorMsg);
                        }
                    }
                }
            }

            return (true, CHARACTER_CLASS_ATOM, lastMatchedParticleIndex);
        }

        return (false, INVALID_ATOM, 0);
    }

    function printAtomType(bytes32 atomType) private pure {
        if (atomType == LITERAL_ATOM) {
            console2.log("Atom Type: LITERAL_ATOM");
        } else if (atomType == WORD_BOUNDARY) {
            console2.log("Atom Type: WORD_BOUNDARY");
        } else if (atomType == CONTROL_PREFIX) {
            console2.log("Atom Type: CONTROL_PREFIX");
        } else if (atomType == DIGIT) {
            console2.log("Atom Type: DIGIT");
        } else if (atomType == FORMFEED) {
            console2.log("Atom Type: FORMFEED");
        } else if (atomType == NAMED_BACKREFERENCE_PREFIX) {
            console2.log("Atom Type: NAMED_BACKREFERENCE_PREFIX");
        } else if (atomType == DIGIT_BACKREFERENCE_PREFIX) {
            console2.log("Atom Type: DIGIT_BACKREFERENCE_PREFIX");
        } else if (atomType == NEWLINE) {
            console2.log("Atom Type: NEWLINE");
        } else if (atomType == UNICODE_PROPERTY) {
            console2.log("Atom Type: UNICODE_PROPERTY");
        } else if (atomType == CARRIAGE_RETURN) {
            console2.log("Atom Type: CARRIAGE_RETURN");
        } else if (atomType == WHITESPACE) {
            console2.log("Atom Type: WHITESPACE");
        } else if (atomType == TAB) {
            console2.log("Atom Type: TAB");
        } else if (atomType == UNICODE_ESCAPE) {
            console2.log("Atom Type: UNICODE_ESCAPE");
        } else if (atomType == VERTICAL_TAB) {
            console2.log("Atom Type: VERTICAL_TAB");
        } else if (atomType == WORD_CHARACTER) {
            console2.log("Atom Type: WORD_CHARACTER");
        } else if (atomType == HEX_ESCAPE) {
            console2.log("Atom Type: HEX_ESCAPE");
        } else if (atomType == NOT_WORD_BOUNDARY) {
            console2.log("Atom Type: NOT_WORD_BOUNDARY");
        } else if (atomType == NOT_DIGIT) {
            console2.log("Atom Type: NOT_DIGIT");
        } else if (atomType == UNICODE_PROPERTY_NEGATION) {
            console2.log("Atom Type: UNICODE_PROPERTY_NEGATION");
        } else if (atomType == NOT_WHITESPACE) {
            console2.log("Atom Type: NOT_WHITESPACE");
        } else if (atomType == NOT_WORD_CHARACTER) {
            console2.log("Atom Type: NOT_WORD_CHARACTER");
        } else if (atomType == NULL_CHARACTER) {
            console2.log("Atom Type: NULL_CHARACTER");
        } else if (atomType == OCTAL) {
            console2.log("Atom Type: OCTAL");
        } else if (atomType == ASTERISK_GREEDY_QUANTIFIER_ATOM) {
            console2.log("Atom Type: ASTERISK_GREEDY_QUANTIFIER_ATOM");
        } else if (atomType == PLUS_GREEDY_QUANTIFIER_ATOM) {
            console2.log("Atom Type: PLUS_GREEDY_QUANTIFIER_ATOM");
        } else if (atomType == QUESTION_MARK_GREEDY_QUANTIFIER_ATOM) {
            console2.log("Atom Type: QUESTION_MARK_GREEDY_QUANTIFIER_ATOM");
        } else if (atomType == N_RANGE_GREEDY_QUANTIFIER_ATOM) {
            console2.log("Atom Type: N_RANGE_GREEDY_QUANTIFIER_ATOM");
        } else if (atomType == N_AND_INFINITE_RANGE_GREEDY_QUANTIFIER_ATOM) {
            console2.log("Atom Type: N_AND_INFINITE_RANGE_GREEDY_QUANTIFIER_ATOM");
        } else if (atomType == N_AND_M_RANGE_GREEDY_QUANTIFIER_ATOM) {
            console2.log("Atom Type: N_AND_M_RANGE_GREEDY_QUANTIFIER_ATOM");
        } else if (atomType == ASTERISK_LAZY_QUANTIFIER_ATOM) {
            console2.log("Atom Type: ASTERISK_LAZY_QUANTIFIER_ATOM");
        } else if (atomType == PLUS_LAZY_QUANTIFIER_ATOM) {
            console2.log("Atom Type: PLUS_LAZY_QUANTIFIER_ATOM");
        } else if (atomType == QUESTION_MARK_LAZY_QUANTIFIER_ATOM) {
            console2.log("Atom Type: QUESTION_MARK_LAZY_QUANTIFIER_ATOM");
        } else if (atomType == N_RANGE_LAZY_QUANTIFIER_ATOM) {
            console2.log("Atom Type: N_RANGE_LAZY_QUANTIFIER_ATOM");
        } else if (atomType == N_AND_INFINITE_RANGE_LAZY_QUANTIFIER_ATOM) {
            console2.log("Atom Type: N_AND_INFINITE_RANGE_LAZY_QUANTIFIER_ATOM");
        } else if (atomType == N_AND_M_RANGE_LAZY_QUANTIFIER_ATOM) {
            console2.log("Atom Type: N_AND_M_RANGE_LAZY_QUANTIFIER_ATOM");
        } else {
            console2.log("Atom Type: INVALID_ATOM");
        }
    }

    function isLazyQuantifierAtom(
        bytes memory _pattern,
        bytes32 _lastGreedyQuantifierAtomType,
        uint256 _currentParticleIdx
    ) private pure returns (bool, bytes32, uint256) {
        bytes32 lazyQuantifierAtomType;
        bool flag;
        if (uint8(_pattern[_currentParticleIdx]) == QUESTION_MARK) {
            if (_lastGreedyQuantifierAtomType == ASTERISK_GREEDY_QUANTIFIER_ATOM) {
                lazyQuantifierAtomType = ASTERISK_LAZY_QUANTIFIER_ATOM;
            } else if (_lastGreedyQuantifierAtomType == PLUS_GREEDY_QUANTIFIER_ATOM) {
                lazyQuantifierAtomType = PLUS_LAZY_QUANTIFIER_ATOM;
            } else if (_lastGreedyQuantifierAtomType == QUESTION_MARK_GREEDY_QUANTIFIER_ATOM) {
                lazyQuantifierAtomType = QUESTION_MARK_LAZY_QUANTIFIER_ATOM;
            } else if (_lastGreedyQuantifierAtomType == N_RANGE_GREEDY_QUANTIFIER_ATOM) {
                lazyQuantifierAtomType = N_RANGE_LAZY_QUANTIFIER_ATOM;
            } else if (_lastGreedyQuantifierAtomType == N_AND_INFINITE_RANGE_GREEDY_QUANTIFIER_ATOM) {
                lazyQuantifierAtomType = N_AND_INFINITE_RANGE_LAZY_QUANTIFIER_ATOM;
            } else if (_lastGreedyQuantifierAtomType == N_AND_M_RANGE_GREEDY_QUANTIFIER_ATOM) {
                lazyQuantifierAtomType = N_AND_M_RANGE_LAZY_QUANTIFIER_ATOM;
            }
            flag = true;
        } else {
            lazyQuantifierAtomType = _lastGreedyQuantifierAtomType;
        }
        return (flag, lazyQuantifierAtomType, _currentParticleIdx);
    }

    function isGreedyQuantifierAtom(bytes memory _pattern, uint256 _currentParticleIdx, bytes32 _lastAtomType)
        private
        pure
        returns (bool, bytes32, uint256)
    {
        uint8 currentParticle = uint8(_pattern[_currentParticleIdx]);
        bool greedyQuantifier;
        bytes32 quantifierType = _lastAtomType;
        uint256 lastIndex = _currentParticleIdx;

        if (currentParticle == ASTERISK) {
            greedyQuantifier = true;
            quantifierType = ASTERISK_GREEDY_QUANTIFIER_ATOM;
            lastIndex = _currentParticleIdx;
            return (greedyQuantifier, quantifierType, lastIndex);
        }

        if (!greedyQuantifier && currentParticle == PLUS_SIGN) {
            greedyQuantifier = true;
            quantifierType = PLUS_GREEDY_QUANTIFIER_ATOM;
            lastIndex = _currentParticleIdx;
            return (greedyQuantifier, quantifierType, lastIndex);
        }

        if (!greedyQuantifier && currentParticle == QUESTION_MARK) {
            greedyQuantifier = true;
            quantifierType = QUESTION_MARK_GREEDY_QUANTIFIER_ATOM;
            lastIndex = _currentParticleIdx;
            return (greedyQuantifier, quantifierType, lastIndex);
        }

        if (!greedyQuantifier && currentParticle == OPEN_CURLY_BRACE) {
            if (_pattern.length - 1 >= _currentParticleIdx + 2) {
                if (
                    isDigit(_pattern[_currentParticleIdx + 1], false)
                        && uint8(_pattern[_currentParticleIdx + 2]) == CLOSE_CURLY_BRACE
                ) {
                    greedyQuantifier = true;
                    quantifierType = N_RANGE_GREEDY_QUANTIFIER_ATOM;
                    lastIndex = _currentParticleIdx + 2;
                    return (greedyQuantifier, quantifierType, lastIndex);
                }
            }
        }

        if (!greedyQuantifier && currentParticle == OPEN_CURLY_BRACE) {
            if (_pattern.length - 1 >= _currentParticleIdx + 3) {
                if (
                    isDigit(_pattern[_currentParticleIdx + 1], false)
                        && uint8(_pattern[_currentParticleIdx + 2]) == COMMA_SIGN
                        && uint8(_pattern[_currentParticleIdx + 3]) == CLOSE_CURLY_BRACE
                ) {
                    greedyQuantifier = true;
                    quantifierType = N_AND_INFINITE_RANGE_GREEDY_QUANTIFIER_ATOM;
                    lastIndex = _currentParticleIdx + 3;
                    return (greedyQuantifier, quantifierType, lastIndex);
                }
            }
        }

        // BUG: Ghost|Phantom, vars yields issue (let's find it using console log)
        // @status: resolved!
        if (!greedyQuantifier && currentParticle == OPEN_CURLY_BRACE) {
            if (_pattern.length - 1 >= _currentParticleIdx + 4) {
                if (
                    isDigit(_pattern[_currentParticleIdx + 1], false)
                        && uint8(_pattern[_currentParticleIdx + 2]) == COMMA_SIGN
                        && isDigit(_pattern[_currentParticleIdx + 3], false)
                        && uint8(_pattern[_currentParticleIdx + 4]) == CLOSE_CURLY_BRACE
                ) {
                    // @BUG: there was a bug: uint8(_pattern[_currentParticleIdx + 4]) however it should be
                    // uint8(_pattern[_currentParticleIdx + 3])
                    // @status: resolved!
                    if (uint8(_pattern[_currentParticleIdx + 1]) > uint8(_pattern[_currentParticleIdx + 3])) {
                        string memory errorMsg = string(
                            abi.encodePacked(
                                "SyntaxError: Invalid regular expression: ",
                                _pattern,
                                ": numbers out of order in {} quantifier"
                            )
                        );
                        revert(errorMsg);
                    }

                    greedyQuantifier = true;
                    quantifierType = N_AND_M_RANGE_GREEDY_QUANTIFIER_ATOM;
                    lastIndex = _currentParticleIdx + 4;
                    console2.log("yes it was a n and m range greedy quantifier atom");
                }
            }
        }

        return (greedyQuantifier, quantifierType, lastIndex);
    }

    function validateRegex(string memory _pattern) private pure {
        bytes memory patternInBytes = bytes(_pattern);
        if (patternInBytes.length <= 2) {
            string memory errorMsg = string(
                abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern, " , required: /valid_seq/")
            );
            revert(errorMsg);
        }

        uint8 patternFirstChar = uint8(patternInBytes[0]);
        uint8 patternLastChar = uint8(patternInBytes[patternInBytes.length - 1]);
        uint8 patternSecondLastChar = uint8(patternInBytes[patternInBytes.length - 2]);
        uint8 patternThirdLastChar = uint8(patternInBytes[patternInBytes.length - 3]);

        if (patternFirstChar != FORWARD_SLASH || patternLastChar != FORWARD_SLASH) {
            string memory errorMsg = string(
                abi.encodePacked(
                    "SyntaxError: Invalid regular expression: ",
                    _pattern,
                    ": missing ",
                    string(abi.encodePacked(FORWARD_SLASH)),
                    " , required: /valid_seq/"
                )
            );
            revert(errorMsg);
        }

        if (
            patternLastChar == FORWARD_SLASH
                && (patternSecondLastChar == BACK_SLASH && patternThirdLastChar != BACK_SLASH)
        ) {
            string memory errorMsg = string(
                abi.encodePacked(
                    "SyntaxError: Invalid regular expression: ",
                    _pattern,
                    ": missing ",
                    string(abi.encodePacked(FORWARD_SLASH)),
                    " , required: /valid_seq/"
                )
            );
            revert(errorMsg);
        }
    }

    function isBigAlphabet(bytes1 _targetChar) private pure returns (bool) {
        uint8 lowerBoundUnicode = 65;
        uint8 upperBoundUnicode = 90;
        return findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, false);
    }

    function isSmallAlphabet(bytes1 _targetChar) private pure returns (bool) {
        uint8 lowerBoundUnicode = 97;
        uint8 upperBoundUnicode = 122;
        return findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, false);
    }

    function isDigit(bytes1 _targetChar, bool _negation) private pure returns (bool) {
        uint8 lowerBoundUnicode = 48;
        uint8 upperBoundUnicode = 57;
        return findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, _negation);
    }

    function isPunctuation(bytes1 _targetChar) private pure returns (bool) {
        uint8 lowerBoundUnicode = 0;
        uint8 upperBoundUnicode = 35;
        bool flag = findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, false);

        if (!flag) {
            lowerBoundUnicode = 37;
            upperBoundUnicode = 39;
            flag = findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, false);
        }

        if (!flag) {
            lowerBoundUnicode = 44;
            upperBoundUnicode = 45;
            flag = findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, false);
        }

        if (!flag) {
            lowerBoundUnicode = 47;
            upperBoundUnicode = 47;
            flag = findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, false);
        }

        if (!flag) {
            lowerBoundUnicode = 58;
            upperBoundUnicode = 62;
            flag = findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, false);
        }

        if (!flag) {
            lowerBoundUnicode = 64;
            upperBoundUnicode = 64;
            flag = findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, false);
        }

        if (!flag) {
            lowerBoundUnicode = 95;
            upperBoundUnicode = 96;
            flag = findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, false);
        }

        if (!flag) {
            lowerBoundUnicode = 126;
            upperBoundUnicode = 127;
            flag = findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, false);
        }

        return flag;
    }

    function isWord(bytes1 _targetChar, bool _negation) private pure returns (bool) {
        if (
            isSmallAlphabet(_targetChar) || isBigAlphabet(_targetChar) || isDigit(_targetChar, false)
                || uint8(_targetChar) == uint8(abi.encodePacked("_")[0])
        ) {
            return _negation ? false : true;
        } else {
            return _negation ? true : false;
        }
    }

    function isWhitespace(bytes memory _pattern, uint256 _currentParticleIndex, bool _negation)
        private
        pure
        returns (bool, uint256)
    {
        // @info: this function is still inaccurate
        // @TODO: implement some logic to interpolate whitespace hex strings to identify them
        // @status: just explored and got the idea, now about to begin the implementation...🚀
        // @status: completed!

        // @info: Please Note-1: These lower and upper bounds also have bitmask applied however they all are 1 byte
        // and as we know 1-byte atoms masking is also zero(0) bits manipulation so that would have no effect at all.
        // that's why we're directly converting things like \t, \n, \v, etc, to 1-byte atoms and validating them to.
        uint8 lowerBoundUnicode = 9;
        uint8 upperBoundUnicode = 13;
        uint256 lastIndex = _currentParticleIndex;
        bytes1 _targetChar = _pattern[lastIndex];
        bool flag = findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, false);

        if (!flag) {
            // @ref: #Note-1: just like below...
            if (_targetChar == abi.encodePacked(" ")[0]) {
                flag = true;
            }
        }

        if (!flag) {
            if (_targetChar == 0xc2) {
                if (_currentParticleIndex + 1 < _pattern.length && _pattern[_currentParticleIndex + 1] == 0xa0) {
                    flag = true;
                    lastIndex = _currentParticleIndex + 1;
                }
            }
        }

        if (!flag) {
            if (_targetChar == 0xe2) {
                if (
                    _currentParticleIndex + 2 < _pattern.length && _pattern[_currentParticleIndex + 1] == 0x80
                        && (_pattern[_currentParticleIndex + 2] == 0xa8 || _pattern[_currentParticleIndex + 2] == 0xa9)
                ) {
                    flag = true;
                    lastIndex = _currentParticleIndex + 2;
                }
            }
        }

        if (_negation && !flag) {
            return (true, lastIndex);
        }

        if (!_negation && flag) {
            return (true, lastIndex);
        }

        return (false, 0);
    }

    function utf8HexToUnicodeHex(bytes memory _utf8Hex) private pure returns (bytes memory) {
        // @TODO: Implement utf8 hexadecimal to unicode hexadecimal conversion logic
        uint256 numBytes = _utf8Hex.length;
        bytes memory unicodeHex;

        if (numBytes == 1) {
            unicodeHex = oneByteUtf8HexDecode(_utf8Hex);
        }

        if (numBytes == 2) {
            unicodeHex = twoBytesUtf8HexDecode(_utf8Hex);
        }

        if (numBytes == 3) {
            unicodeHex = threeBytesUtf8HexDecode(_utf8Hex);
        }

        if (numBytes == 4) {
            unicodeHex = fourBytesUtf8HexDecode(_utf8Hex);
        }
        return unicodeHex;
    }

    function oneByteUtf8HexDecode(bytes memory _utf8Hex) private pure returns (bytes memory) {
        return _utf8Hex;
    }

    function twoBytesUtf8HexDecode(bytes memory _utf8Hex) private pure returns (bytes memory) {
        uint128 binary;
        for (uint256 i = 0; i < _utf8Hex.length; i++) {
            binary = stripPrefixCodesAndConcatenateBinary(binary, hexToBinary(_utf8Hex[i]), 2, i == 0 ? true : false);
        }
    }

    function threeBytesUtf8HexDecode(bytes memory _utf8Hex) private pure returns (bytes memory) {}

    function fourBytesUtf8HexDecode(bytes memory _utf8Hex) private pure returns (bytes memory) {}

    function stripPrefixCodesAndConcatenateBinary(
        uint128 oldBinary,
        uint128 newBinary,
        uint8 markerBytes,
        bool isLeadingByte
    ) private pure returns (uint128) {
        if (markerBytes == 2 && isLeadingByte) {}
    }

    function stripPrefixCodes(uint128 binary, uint8 usableBits) private pure returns (uint128) {
        uint256 strippedBinary;
        uint8 expCounter;
        for (uint8 i = 0; i < usableBits; i++) {
            strippedBinary += (binary % 2) * (10 ** expCounter);
            binary = binary >> 1;
            expCounter++;
        }
    }

    function hexToBinary(bytes1 _hex) private pure returns (uint128) {
        uint8 decimal = uint8(_hex);
        uint128 binary = decimalToBinary(decimal);
    }

    function decimalToBinary(uint8 decimal) private pure returns (uint128) {
        uint256 binary;
        uint8 expCounter;
        while (true) {
            binary += (decimal % 2) * (10 ** expCounter);
            if (decimal == 1) {
                break;
            }
            decimal = decimal / 2;
            expCounter++;
        }
    }

    function isUnicodeLiteral(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        bool flag;
        uint256 lastMatchedIndex;

        (flag, lastMatchedIndex) = cUnicodeRange(_pattern, _currentParticleIndex);

        if (!flag) {
            // TODO: Implement d unicode range detection logic...
            // @status: done
            (flag, lastMatchedIndex) = dUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            // TODO: Implement e unicode range detection logic...
            (flag, lastMatchedIndex) = eUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            // TODO: Implement f unicode range detection logic...
            console2.log("departed through here...");
            (flag, lastMatchedIndex) = fUnicodeRange(_pattern, _currentParticleIndex);
        }

        // @info: BUG: (false, 0)
        // @status: resolved!
        // return (false, 0);
        return (flag, lastMatchedIndex);
    }

    function fUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        bool flag;
        uint256 lastMatchedIndex;

        (flag, lastMatchedIndex) = f0UnicodeRange(_pattern, _currentParticleIndex);

        if (!flag) {
            (flag, lastMatchedIndex) = f1UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = f2UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = f3UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = f4UnicodeRange(_pattern, _currentParticleIndex);
        }

        return (flag, lastMatchedIndex);
    }

    function f0UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // f0 90 80 80 - f0 bf bf bf
        console2.log("departed through here also...");
        if (_pattern[_currentParticleIndex] == 0xf0) {
            console2.log("yeah that's came true: ", _pattern[_currentParticleIndex] == 0xf0);
            console2.logBytes1(_pattern[_currentParticleIndex]);
            (bool flag, uint256 lastMatchedParticleIndex) = secondByte90bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                    if (flag) {
                        console2.log("fulfilling all requirements...!");
                        return (true, lastMatchedParticleIndex);
                    }
                }
            }
        }

        return (false, 0);
    }

    function f1UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // f1 80 80 80 - f1 bf bf bf
        if (_pattern[_currentParticleIndex] == 0xf1) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                    if (flag) {
                        return (true, lastMatchedParticleIndex);
                    }
                }
            }
        }

        return (false, 0);
    }

    function f2UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // f2 80 80 80 - f2 bf bf bf
        if (_pattern[_currentParticleIndex] == 0xf2) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                    if (flag) {
                        return (true, lastMatchedParticleIndex);
                    }
                }
            }
        }

        return (false, 0);
    }

    function f3UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // f3 80 80 80 - f3 bf bf bf
        if (_pattern[_currentParticleIndex] == 0xf3) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                    if (flag) {
                        return (true, lastMatchedParticleIndex);
                    }
                }
            }
        }

        return (false, 0);
    }

    function f4UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // f4 80 80 80 - f4 8f bf bf
        if (_pattern[_currentParticleIndex] == 0xf4) {
            (bool flag, uint256 lastMatchedParticleIndex) = secondByte808fValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                    if (flag) {
                        return (true, lastMatchedParticleIndex);
                    }
                }
            }
        }

        return (false, 0);
    }

    function eUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        bool flag;
        uint256 lastMatchedIndex;

        (flag, lastMatchedIndex) = e0UnicodeRange(_pattern, _currentParticleIndex);

        if (!flag) {
            (flag, lastMatchedIndex) = e1UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = e2UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = e3UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = e4UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = e5UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = e6UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = e7UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = e8UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = e9UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = eaUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = ebUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = ecUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = edUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = eeUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = efUnicodeRange(_pattern, _currentParticleIndex);
        }

        return (flag, lastMatchedIndex);
    }

    function e0UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // e0 a0 80 - e0 bf bf
        if (_pattern[_currentParticleIndex] == 0xe0) {
            (bool flag, uint256 lastMatchedParticleIndex) = secondLastBytea0bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function e1UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // e1 80 80 - e1 bf bf
        if (_pattern[_currentParticleIndex] == 0xe1) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function e2UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // e2 80 80 - e2 bf bf
        if (_pattern[_currentParticleIndex] == 0xe2) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function e3UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // e3 80 80 - e3 bf bf
        if (_pattern[_currentParticleIndex] == 0xe3) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function e4UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // e4 80 80 - e4 bf bf
        if (_pattern[_currentParticleIndex] == 0xe4) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function e5UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // e5 80 80 - e5 bf bf
        if (_pattern[_currentParticleIndex] == 0xe5) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function e6UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // e6 80 80 - e6 bf bf
        if (_pattern[_currentParticleIndex] == 0xe6) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function e7UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // e7 80 80 - e7 bf bf
        if (_pattern[_currentParticleIndex] == 0xe7) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function e8UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // e8 80 80 - e8 bf bf
        if (_pattern[_currentParticleIndex] == 0xe8) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function e9UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // e9 80 80 - e9 bf bf
        if (_pattern[_currentParticleIndex] == 0xe9) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function eaUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // ea 80 80 - ea bf bf
        if (_pattern[_currentParticleIndex] == 0xea) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function ebUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // eb 80 80 - eb bf bf
        if (_pattern[_currentParticleIndex] == 0xeb) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function ecUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // ec 80 80 - ec bf bf
        if (_pattern[_currentParticleIndex] == 0xec) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function edUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // ed 80 80 - ed 9f bf
        if (_pattern[_currentParticleIndex] == 0xed) {
            (bool flag, uint256 lastMatchedParticleIndex) = secondLastByte809fValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function eeUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // ee 80 80 - ee bf bf
        if (_pattern[_currentParticleIndex] == 0xee) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function efUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // ef 80 80 - ef bf bf
        if (_pattern[_currentParticleIndex] == 0xef) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    return (true, lastMatchedParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function dUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        bool flag;
        uint256 lastMatchedIndex;

        (flag, lastMatchedIndex) = d0UnicodeRange(_pattern, _currentParticleIndex);

        if (!flag) {
            (flag, lastMatchedIndex) = d1UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = d2UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = d3UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = d4UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = d5UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = d6UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = d7UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = d8UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = d9UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = daUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = dbUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = dcUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = ddUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = deUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = dfUnicodeRange(_pattern, _currentParticleIndex);
        }

        return (flag, lastMatchedIndex);
    }

    function d0UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xd0) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function d1UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xd1) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function d2UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xd2) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function d3UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xd3) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function d4UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xd4) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function d5UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xd5) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function d6UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xd6) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function d7UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xd7) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function d8UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xd8) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function d9UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xd9) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function daUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xda) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function dbUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xdb) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function dcUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xdc) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function ddUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xdd) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function deUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xde) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function dfUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xdf) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function cUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        bool flag;
        uint256 lastMatchedIndex;

        (flag, lastMatchedIndex) = c2UnicodeRange(_pattern, _currentParticleIndex);

        if (!flag) {
            (flag, lastMatchedIndex) = c3UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = c4UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = c5UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = c6UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = c7UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = c8UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = c9UnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = caUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = cbUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = ccUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = cdUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = ceUnicodeRange(_pattern, _currentParticleIndex);
        }

        if (!flag) {
            (flag, lastMatchedIndex) = cfUnicodeRange(_pattern, _currentParticleIndex);
        }

        return (flag, lastMatchedIndex);
    }

    function c2UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xc2) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function c3UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xc3) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function c4UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xc4) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function c5UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xc5) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function c6UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xc6) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function c7UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xc7) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function c8UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xc8) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function c9UnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xc9) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function caUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xca) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function cbUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xcb) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function ccUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xcc) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function cdUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xcd) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function ceUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xce) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function cfUnicodeRange(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (_pattern[_currentParticleIndex] == 0xcf) {
            (bool flag, uint256 lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                return (true, lastMatchedParticleIndex);
            }
        }

        return (false, 0);
    }

    function secondLastBytea0bfValidator(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_currentParticleIndex + 1 < _pattern.length) {
            // 0xa0 = 160
            // 0xbf = 191
            if (uint8(_pattern[_currentParticleIndex + 1]) >= 160 && uint8(_pattern[_currentParticleIndex + 1]) <= 191)
            {
                return lastByte80bfValidator(_pattern, _currentParticleIndex + 1);
            }
        }
        return (false, 0);
    }

    function secondLastByte809fValidator(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_currentParticleIndex + 1 < _pattern.length) {
            // 0x80 = 128
            // 0x9f = 159
            if (uint8(_pattern[_currentParticleIndex + 1]) >= 128 && uint8(_pattern[_currentParticleIndex + 1]) <= 159)
            {
                return (true, _currentParticleIndex + 1);
            }
        }
        return (false, 0);
    }

    function secondByte808fValidator(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_currentParticleIndex + 1 < _pattern.length) {
            // 0x80 = 128
            // 0x8f = 143
            if (uint8(_pattern[_currentParticleIndex + 1]) >= 128 && uint8(_pattern[_currentParticleIndex + 1]) <= 143)
            {
                return (true, _currentParticleIndex + 1);
            }
        }
        return (false, 0);
    }

    function secondByte90bfValidator(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_currentParticleIndex + 1 < _pattern.length) {
            // 0x90 = 144
            // 0xbf = 191
            if (uint8(_pattern[_currentParticleIndex + 1]) >= 144 && uint8(_pattern[_currentParticleIndex + 1]) <= 191)
            {
                return (true, _currentParticleIndex + 1);
            }
        }
        return (false, 0);
    }

    function lastByte80bfValidator(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_currentParticleIndex + 1 < _pattern.length) {
            // 0x80 = 128
            // 0xbf = 191
            if (uint8(_pattern[_currentParticleIndex + 1]) >= 128 && uint8(_pattern[_currentParticleIndex + 1]) <= 191)
            {
                return (true, _currentParticleIndex + 1);
            }
        }
        return (false, 0);
    }

    function isRangeLiteral(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        bool isValid;
        uint256 lastMatchedIndex;

        (isValid, lastMatchedIndex) = isOpenCurlyBraceOfRangeEscape(_pattern, _currentParticleIndex);

        if (isValid) {
            return (true, lastMatchedIndex);
        }

        (isValid, lastMatchedIndex) = isDigitOfRangeEscape(_pattern, _currentParticleIndex);

        if (isValid) {
            return (true, lastMatchedIndex);
        }

        (isValid, lastMatchedIndex) = isCommaOfRangeEscape(_pattern, _currentParticleIndex);

        if (isValid) {
            return (true, lastMatchedIndex);
        }

        (isValid, lastMatchedIndex) = isCloseCurlyBraceOfRangeEscape(_pattern, _currentParticleIndex);

        if (isValid) {
            return (true, lastMatchedIndex);
        }

        return (false, 0);
    }

    function isOpenCurlyBraceOfRangeEscape(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        uint8 _targetChar = uint8(_pattern[_currentParticleIndex]);
        uint256 patternLastIndex = _pattern.length - 1;

        if (_targetChar == OPEN_CURLY_BRACE) {
            uint256 patternNAndMRangeMaxIndex = _currentParticleIndex + 4;
            uint256 patternNAndInfinityRangeMaxIndex = _currentParticleIndex + 3;
            uint256 patternNRangeMaxIndex = _currentParticleIndex + 2;
            uint256 nextParticleIndex = _currentParticleIndex + 1;

            if (_currentParticleIndex == patternLastIndex) {
                return (true, _currentParticleIndex);
            }

            console2.log("passed first if check!");

            if (patternNRangeMaxIndex <= patternLastIndex) {
                if (!isDigit(_pattern[nextParticleIndex], false)) {
                    return (true, _currentParticleIndex);
                }

                console2.log("passed second if check!");

                if (
                    uint8(_pattern[patternNRangeMaxIndex]) != CLOSE_CURLY_BRACE
                        && uint8(_pattern[patternNRangeMaxIndex]) != COMMA_SIGN
                ) {
                    return (true, _currentParticleIndex);
                }

                if (uint8(_pattern[patternNRangeMaxIndex]) == CLOSE_CURLY_BRACE) {
                    return (false, 0);
                }

                console2.log("passed third if check!");

                if (uint8(_pattern[patternNRangeMaxIndex]) == COMMA_SIGN) {
                    if (patternNAndInfinityRangeMaxIndex <= patternLastIndex) {
                        if (
                            !isDigit(_pattern[patternNAndInfinityRangeMaxIndex], false)
                                && uint8(_pattern[patternNAndInfinityRangeMaxIndex]) != CLOSE_CURLY_BRACE
                        ) {
                            return (true, _currentParticleIndex);
                        }

                        if (uint8(_pattern[patternNAndInfinityRangeMaxIndex]) == CLOSE_CURLY_BRACE) {
                            return (false, 0);
                        }

                        if (isDigit(_pattern[patternNAndInfinityRangeMaxIndex], false)) {
                            if (patternNAndMRangeMaxIndex <= patternLastIndex) {
                                if (uint8(_pattern[patternNAndMRangeMaxIndex]) != CLOSE_CURLY_BRACE) {
                                    return (true, _currentParticleIndex);
                                } else {
                                    return (false, 0);
                                }
                            } else {
                                return (true, _currentParticleIndex);
                            }
                        }
                    } else {
                        return (true, _currentParticleIndex);
                    }
                }

                console2.log("passed fourth if check!");
            } else {
                return (true, _currentParticleIndex);
            }
        }

        return (false, 0);
    }

    function isDigitOfRangeEscape(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        uint256 patternLastIndex = _pattern.length - 1;

        if (isDigit(_pattern[_currentParticleIndex], false)) {
            if (_currentParticleIndex == 0 || _currentParticleIndex == patternLastIndex) {
                return (true, _currentParticleIndex);
            }

            if (_currentParticleIndex > 0 && _currentParticleIndex < patternLastIndex) {
                if (
                    uint8(_pattern[_currentParticleIndex - 1]) != OPEN_CURLY_BRACE
                        && uint8(_pattern[_currentParticleIndex - 1]) != COMMA_SIGN
                ) {
                    return (true, _currentParticleIndex);
                }

                if (uint8(_pattern[_currentParticleIndex - 1]) == OPEN_CURLY_BRACE) {
                    if (_currentParticleIndex + 1 <= patternLastIndex) {
                        if (
                            uint8(_pattern[_currentParticleIndex + 1]) != COMMA_SIGN
                                && uint8(_pattern[_currentParticleIndex + 1]) != CLOSE_CURLY_BRACE
                        ) {
                            return (true, _currentParticleIndex);
                        }

                        if (uint8(_pattern[_currentParticleIndex + 1]) == CLOSE_CURLY_BRACE) {
                            return (false, 0);
                        }

                        if (uint8(_pattern[_currentParticleIndex + 1]) == COMMA_SIGN) {
                            if (_currentParticleIndex + 2 <= patternLastIndex) {
                                if (
                                    !isDigit(_pattern[_currentParticleIndex + 2], false)
                                        && uint8(_pattern[_currentParticleIndex + 2]) != CLOSE_CURLY_BRACE
                                ) {
                                    return (true, _currentParticleIndex);
                                }

                                if (uint8(_pattern[_currentParticleIndex + 2]) == CLOSE_CURLY_BRACE) {
                                    return (false, 0);
                                }

                                if (isDigit(_pattern[_currentParticleIndex + 2], false)) {
                                    if (_currentParticleIndex + 3 <= patternLastIndex) {
                                        if (uint8(_pattern[_currentParticleIndex + 3]) != CLOSE_CURLY_BRACE) {
                                            return (true, _currentParticleIndex);
                                        } else {
                                            return (false, 0);
                                        }
                                    } else {
                                        return (true, _currentParticleIndex);
                                    }
                                }
                            } else {
                                return (true, _currentParticleIndex);
                            }
                        }
                    } else {
                        return (true, _currentParticleIndex);
                    }
                }

                if (
                    uint8(_pattern[_currentParticleIndex - 1]) == COMMA_SIGN
                        && (_currentParticleIndex + 1 <= patternLastIndex
                            && uint8(_pattern[_currentParticleIndex + 1]) == CLOSE_CURLY_BRACE)
                ) {
                    if (_currentParticleIndex > 1) {
                        if (!isDigit(_pattern[_currentParticleIndex - 2], false)) {
                            return (true, _currentParticleIndex);
                        }

                        if (isDigit(_pattern[_currentParticleIndex - 2], false)) {
                            if (_currentParticleIndex > 2) {
                                if (uint8(_pattern[_currentParticleIndex - 3]) != OPEN_CURLY_BRACE) {
                                    return (true, _currentParticleIndex);
                                } else {
                                    return (false, 0);
                                }
                            } else {
                                return (true, _currentParticleIndex);
                            }
                        }
                    } else {
                        return (true, _currentParticleIndex);
                    }
                } else {
                    return (true, _currentParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function isCommaOfRangeEscape(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        uint8 _targetChar = uint8(_pattern[_currentParticleIndex]);
        uint256 patternLastIndex = _pattern.length - 1;

        if (_targetChar == COMMA_SIGN) {
            if (_currentParticleIndex == 0 || _currentParticleIndex == patternLastIndex) {
                return (true, _currentParticleIndex);
            }

            if (_currentParticleIndex > 0) {
                if (!isDigit(_pattern[_currentParticleIndex - 1], false)) {
                    return (true, _currentParticleIndex);
                }

                if (isDigit(_pattern[_currentParticleIndex - 1], false)) {
                    if (_currentParticleIndex > 1) {
                        if (uint8(_pattern[_currentParticleIndex - 2]) != OPEN_CURLY_BRACE) {
                            return (true, _currentParticleIndex);
                        }
                    } else {
                        return (true, _currentParticleIndex);
                    }

                    if (_currentParticleIndex + 1 <= patternLastIndex) {
                        if (
                            !isDigit(_pattern[_currentParticleIndex + 1], false)
                                && uint8(_pattern[_currentParticleIndex + 1]) != CLOSE_CURLY_BRACE
                        ) {
                            return (true, _currentParticleIndex);
                        }

                        if (uint8(_pattern[_currentParticleIndex + 1]) == CLOSE_CURLY_BRACE) {
                            return (false, 0);
                        }

                        if (isDigit(_pattern[_currentParticleIndex + 1], false)) {
                            if (_currentParticleIndex + 2 <= patternLastIndex) {
                                if (uint8(_pattern[_currentParticleIndex + 2]) != CLOSE_CURLY_BRACE) {
                                    return (true, _currentParticleIndex);
                                } else {
                                    return (false, 0);
                                }
                            } else {
                                return (true, _currentParticleIndex);
                            }
                        }
                    } else {
                        return (true, _currentParticleIndex);
                    }
                }
            }
        }
        return (false, 0);
    }

    function isCloseCurlyBraceOfRangeEscape(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        uint8 _targetChar = uint8(_pattern[_currentParticleIndex]);

        if (_targetChar == CLOSE_CURLY_BRACE) {
            if (_currentParticleIndex == 0) {
                return (true, _currentParticleIndex);
            }

            if (_currentParticleIndex > 0) {
                if (
                    !isDigit(_pattern[_currentParticleIndex - 1], false)
                        && uint8(_pattern[_currentParticleIndex - 1]) != COMMA_SIGN
                ) {
                    return (true, _currentParticleIndex);
                }

                if (_currentParticleIndex > 1) {
                    if (isDigit(_pattern[_currentParticleIndex - 1], false)) {
                        if (
                            uint8(_pattern[_currentParticleIndex - 2]) != COMMA_SIGN
                                && uint8(_pattern[_currentParticleIndex - 2]) != OPEN_CURLY_BRACE
                        ) {
                            return (true, _currentParticleIndex);
                        }

                        if (uint8(_pattern[_currentParticleIndex - 2]) == OPEN_CURLY_BRACE) {
                            return (false, 0);
                        }

                        if (uint8(_pattern[_currentParticleIndex - 2]) == COMMA_SIGN) {
                            if (_currentParticleIndex > 2) {
                                if (!isDigit(_pattern[_currentParticleIndex - 3], false)) {
                                    return (true, _currentParticleIndex);
                                }

                                if (isDigit(_pattern[_currentParticleIndex - 3], false)) {
                                    if (_currentParticleIndex > 3) {
                                        if (uint8(_pattern[_currentParticleIndex - 4]) != OPEN_CURLY_BRACE) {
                                            return (true, _currentParticleIndex);
                                        } else {
                                            return (false, 0);
                                        }
                                    } else {
                                        return (true, _currentParticleIndex);
                                    }
                                }
                            } else {
                                return (true, _currentParticleIndex);
                            }
                        }
                    }

                    if (uint8(_pattern[_currentParticleIndex - 1]) == COMMA_SIGN) {
                        if (!isDigit(_pattern[_currentParticleIndex - 2], false)) {
                            return (true, _currentParticleIndex);
                        }

                        if (isDigit(_pattern[_currentParticleIndex - 2], false)) {
                            if (_currentParticleIndex > 2) {
                                if (uint8(_pattern[_currentParticleIndex - 3]) != OPEN_CURLY_BRACE) {
                                    return (true, _currentParticleIndex);
                                }
                            } else {
                                return (true, _currentParticleIndex);
                            }
                        }
                    }
                } else {
                    return (true, _currentParticleIndex);
                }
            }
        }

        return (false, 0);
    }

    function isEscapeLiteral(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (uint8(_pattern[_currentParticleIndex]) == BACK_SLASH && _currentParticleIndex < _pattern.length - 1) {
            uint8 _nextChar = uint8(_pattern[_currentParticleIndex + 1]);
            bool isValid;
            uint256 lastMatchedIndex;

            if (_nextChar == uint8(abi.encodePacked("u")[0])) {
                (isValid, lastMatchedIndex) = validateBackslash_u_UnicodeEscape(_pattern, _currentParticleIndex);

                if (isValid) {
                    return (true, lastMatchedIndex);
                }
            }

            if (_nextChar == uint8(abi.encodePacked("x")[0])) {
                (isValid, lastMatchedIndex) = validateBackslash_x_UnicodeEscape(_pattern, _currentParticleIndex);

                if (isValid) {
                    return (true, lastMatchedIndex);
                }
            }

            if (_nextChar == uint8(abi.encodePacked("c")[0])) {
                (isValid, lastMatchedIndex) = validateBackslash_c_controlEscape(_pattern, _currentParticleIndex);

                if (isValid) {
                    return (true, lastMatchedIndex);
                } else {
                    return (true, _currentParticleIndex);
                }
            }

            if (_nextChar == uint8(abi.encodePacked("k")[0])) {
                (isValid, lastMatchedIndex) = validateBackslash_k_groupEscape(_pattern, _currentParticleIndex);

                if (isValid) {
                    return (true, lastMatchedIndex);
                }
            }

            if (_nextChar == uint8(abi.encodePacked("p")[0]) || _nextChar == uint8(abi.encodePacked("P")[0])) {
                (isValid, lastMatchedIndex) = validateBackslash_p_propertyNameEscape(_pattern, _currentParticleIndex);

                if (isValid) {
                    return (true, lastMatchedIndex);
                }
            }

            if (isDigit(_pattern[_currentParticleIndex + 1], false)) {
                (isValid, lastMatchedIndex) =
                    validateBackslash_digit_backreferenceEscape(_pattern, _currentParticleIndex + 1);

                if (isValid) {
                    return (true, lastMatchedIndex);
                }
            }

            return (true, _currentParticleIndex + 1);
        }

        return (false, 0);
    }

    function validateBackslash_digit_backreferenceEscape(bytes memory _pattern, uint256 _indexToStartFrom)
        private
        pure
        returns (bool, uint256)
    {
        uint256 patternLastIndex = _pattern.length - 1;
        // @info: BUG: for (uint256 i = _indexToStartFrom; i < patternLastIndex; i++)
        // @status: resolved!
        for (uint256 i = _indexToStartFrom; i <= patternLastIndex; i++) {
            // @info: BUG: no return statement for the end itertion if last character is also a digit
            // @info: function will conclude by returning (false, 0) tuple even if there's a correct sequence of digits
            // @status: resolved

            // @path: below LoC
            if (i == patternLastIndex && isDigit(_pattern[i], false)) {
                return (true, i);
            }

            if (!isDigit(_pattern[i], false)) {
                return (true, i - 1);
            }
        }

        // TODO: Add functionality to verify whether specific number of groups exist
        // if they don't exist then try to interpolate numbers into octal and iff both of that not possible
        // then read digits as plain literals
        // note: Lastly, please care about 0s sequence i.e., \0, \00, \000, \000..., or \0000000000007
        // because in all cases \0, \00, \000, ..., all are null characters

        return (false, 0);
    }

    function validateBackslash_p_propertyNameEscape(bytes memory _pattern, uint256 _indexToStartFrom)
        private
        pure
        returns (bool, uint256)
    {
        uint256 patternLastIndex = _pattern.length - 1;

        if (_indexToStartFrom + 3 <= patternLastIndex) {
            if (
                uint8(_pattern[_indexToStartFrom + 2]) == OPEN_CURLY_BRACE
                    && uint8(_pattern[_indexToStartFrom + 3]) == CLOSE_CURLY_BRACE
            ) {
                string memory errorMsg = string(
                    abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern, ": Invalid property name")
                );
                revert(errorMsg);
            }

            if (uint8(_pattern[_indexToStartFrom + 2]) == OPEN_CURLY_BRACE) {
                (bool isValidPropertyName, uint256 lastMatchedIndex) =
                    validatePropertyNameAndSyntax(_pattern, _indexToStartFrom + 3);

                if (isValidPropertyName) {
                    return (true, lastMatchedIndex);
                }
            }
        }

        return (false, 0);
    }

    function validateBackslash_k_groupEscape(bytes memory _pattern, uint256 _indexToStartFrom)
        private
        pure
        returns (bool, uint256)
    {
        uint256 patternLastIndex = _pattern.length - 1;

        // @info: BUG: if (_indexToStartFrom + 5 <= patternLastIndex)
        // @status: resolved!
        if (_indexToStartFrom + 4 <= patternLastIndex) {
            if (uint8(_pattern[_indexToStartFrom + 2]) == LESS_THAN_SIGN) {
                if (
                    isSmallAlphabet(_pattern[_indexToStartFrom + 3]) || isBigAlphabet(_pattern[_indexToStartFrom + 3])
                        || uint8(_pattern[_indexToStartFrom + 3]) == uint8(abi.encodePacked("_")[0])
                        || uint8(_pattern[_indexToStartFrom + 3]) == uint8(abi.encodePacked("$")[0])
                ) {
                    // @info: BUG: for (uint256 i = _indexToStartFrom + 4; i < patternLastIndex; i++)
                    // @status: resolved!
                    for (uint256 i = _indexToStartFrom + 4; i <= patternLastIndex; i++) {
                        if (uint8(_pattern[i]) == GREATER_THAN_SIGN) {
                            // TODO: be sure group name exist to its left
                            return (true, i);
                        }

                        if (
                            !isSmallAlphabet(_pattern[i]) && !isBigAlphabet(_pattern[i])
                                && !(uint8(_pattern[i]) == uint8(abi.encodePacked("_")[0]))
                                && !(uint8(_pattern[i]) == uint8(abi.encodePacked("$")[0]))
                                && !isDigit(_pattern[i], false)
                        ) {
                            string memory errorMsg = string(
                                abi.encodePacked(
                                    "SyntaxError: Invalid regular expression: ",
                                    _pattern,
                                    ": Invalid capture group name"
                                )
                            );
                            revert(errorMsg);
                        }
                    }
                } else {
                    string memory errorMsg = string(
                        abi.encodePacked(
                            "SyntaxError: Invalid regular expression: ", _pattern, ": Invalid capture group name"
                        )
                    );
                    revert(errorMsg);
                }
            }
        }
        return (false, 0);
    }

    function validateBackslash_c_controlEscape(bytes memory _pattern, uint256 _indexToStartFrom)
        private
        pure
        returns (bool, uint256)
    {
        uint256 patternLastIndex = _pattern.length - 1;
        if (_indexToStartFrom + 2 <= patternLastIndex) {
            if (isBigAlphabet(_pattern[_indexToStartFrom + 2]) || isSmallAlphabet(_pattern[_indexToStartFrom + 2])) {
                return (true, _indexToStartFrom + 2);
            }
        }

        return (false, 0);
    }

    function validateBackslash_x_UnicodeEscape(bytes memory _pattern, uint256 _indexToStartFrom)
        private
        pure
        returns (bool, uint256)
    {
        uint256 patternLastIndex = _pattern.length - 1;

        if (_indexToStartFrom + 3 <= patternLastIndex) {
            uint8 _nextCharSecond = uint8(_pattern[_indexToStartFrom + 2]);
            uint8 _nextCharThird = uint8(_pattern[_indexToStartFrom + 3]);

            if (isHexadecimal(_nextCharSecond) && isHexadecimal(_nextCharThird)) {
                return (true, _indexToStartFrom + 3);
            }
        }

        return (false, 0);
    }

    function validateBackslash_u_UnicodeEscape(bytes memory _pattern, uint256 _indexToStartFrom)
        private
        pure
        returns (bool, uint256)
    {
        uint256 patternLastIndex = _pattern.length - 1;

        if (uint8(_pattern[_indexToStartFrom + 2]) == OPEN_CURLY_BRACE) {
            // @info: BUG: OVERFLOW BUG resides in this function.
            // @status: Resolved!
            if (
                _indexToStartFrom + 4 <= patternLastIndex && uint8(_pattern[_indexToStartFrom + 4]) == CLOSE_CURLY_BRACE
            ) {
                if (isHexadecimal(uint8(_pattern[_indexToStartFrom + 3]))) {
                    return (true, _indexToStartFrom + 4);
                }
            } else if (
                _indexToStartFrom + 5 <= patternLastIndex && uint8(_pattern[_indexToStartFrom + 5]) == CLOSE_CURLY_BRACE
            ) {
                if (
                    isHexadecimal(uint8(_pattern[_indexToStartFrom + 3]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 4]))
                ) {
                    return (true, _indexToStartFrom + 5);
                }
            } else if (
                _indexToStartFrom + 6 <= patternLastIndex && uint8(_pattern[_indexToStartFrom + 6]) == CLOSE_CURLY_BRACE
            ) {
                if (
                    isHexadecimal(uint8(_pattern[_indexToStartFrom + 3]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 4]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 5]))
                ) {
                    return (true, _indexToStartFrom + 6);
                }
            } else if (
                _indexToStartFrom + 7 <= patternLastIndex && uint8(_pattern[_indexToStartFrom + 7]) == CLOSE_CURLY_BRACE
            ) {
                if (
                    isHexadecimal(uint8(_pattern[_indexToStartFrom + 3]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 4]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 5]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 6]))
                ) {
                    return (true, _indexToStartFrom + 7);
                }
            } else if (
                _indexToStartFrom + 8 <= patternLastIndex && uint8(_pattern[_indexToStartFrom + 8]) == CLOSE_CURLY_BRACE
            ) {
                if (
                    isHexadecimal(uint8(_pattern[_indexToStartFrom + 3]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 4]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 5]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 6]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 7]))
                ) {
                    return (true, _indexToStartFrom + 8);
                }
            } else if (
                _indexToStartFrom + 9 <= patternLastIndex && uint8(_pattern[_indexToStartFrom + 9]) == CLOSE_CURLY_BRACE
            ) {
                if (
                    isHexadecimal(uint8(_pattern[_indexToStartFrom + 3]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 4]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 5]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 6]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 7]))
                        && isHexadecimal(uint8(_pattern[_indexToStartFrom + 8]))
                ) {
                    bytes memory hexString = trimString(_pattern, _indexToStartFrom + 3, int256(_indexToStartFrom + 8));
                    uint256 decValue = hexToDec(hexString);
                    console2.log("decimal of hexString: ", string(hexString), " is: ", decValue);

                    if (decValue <= 1114111) {
                        return (true, _indexToStartFrom + 9);
                    } else {
                        string memory errorMsg = string(
                            abi.encodePacked(
                                "SyntaxError: Invalid regular expression: ", _pattern, ": Invalid Unicode escape"
                            )
                        );
                        revert(errorMsg);
                    }
                }
            }
        }

        if (_indexToStartFrom + 5 <= patternLastIndex) {
            uint8 _nextCharSecond = uint8(_pattern[_indexToStartFrom + 2]);
            uint8 _nextCharThird = uint8(_pattern[_indexToStartFrom + 3]);
            uint8 _nextCharFourth = uint8(_pattern[_indexToStartFrom + 4]);
            uint8 _nextCharFifth = uint8(_pattern[_indexToStartFrom + 5]);
            if (
                isHexadecimal(_nextCharSecond) && isHexadecimal(_nextCharThird) && isHexadecimal(_nextCharFourth)
                    && isHexadecimal(_nextCharFifth)
            ) {
                return (true, _indexToStartFrom + 5);
            }
        }

        return (false, 0);
    }

    function validatePropertyNameAndSyntax(bytes memory _pattern, uint256 _indexToStartFrom)
        private
        pure
        returns (bool, uint256)
    {
        uint256 propertyNameEndIdx;
        for (uint256 i = _indexToStartFrom; i < _pattern.length; i++) {
            // @info: BUG: if (uint8(_pattern[_indexToStartFrom]) == CLOSE_CURLY_BRACE) and missing a break keyword.
            // @status: resolved!
            if (uint8(_pattern[i]) == CLOSE_CURLY_BRACE) {
                propertyNameEndIdx = i - 1;
                break;
            }
        }

        console2.log("property name end index: ", propertyNameEndIdx);

        if (propertyNameEndIdx == 0) {
            string memory errorMsg = string(
                abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern, ": Invalid property name")
            );
            revert(errorMsg);
        }

        bytes memory propertyName = trimString(_pattern, _indexToStartFrom, int256(propertyNameEndIdx));

        bool isValidProperty = validatePropertyName(propertyName);

        if (isValidProperty) {
            return (true, propertyNameEndIdx + 1);
        }

        return (false, 0);
    }

    function validatePropertyName(bytes memory propertyName) private pure returns (bool) {
        console2.log("property name: ", string(propertyName));
        return true;
    }

    function validateGroupName(bytes memory _pattern, uint256 _indexToStartFrom) private pure returns (bool, uint256) {
        if (uint8(_pattern[_indexToStartFrom]) == LESS_THAN_SIGN) {
            if (
                isSmallAlphabet(_pattern[_indexToStartFrom + 1]) || isBigAlphabet(_pattern[_indexToStartFrom + 1])
                    || uint8(_pattern[_indexToStartFrom + 1]) == uint8(abi.encodePacked("_")[0])
                    || uint8(_pattern[_indexToStartFrom + 1]) == uint8(abi.encodePacked("$")[0])
            ) {
                for (uint256 i = _indexToStartFrom + 2; i < _pattern.length; i++) {
                    if (uint8(_pattern[i]) == GREATER_THAN_SIGN) {
                        return (true, i);
                    }

                    if (
                        !isSmallAlphabet(_pattern[i]) && !isBigAlphabet(_pattern[i])
                            && !(uint8(_pattern[i]) == uint8(abi.encodePacked("_")[0]))
                            && !(uint8(_pattern[i]) == uint8(abi.encodePacked("$")[0])) && !isDigit(_pattern[i], false)
                    ) {
                        return (false, 0);
                    }
                }
            }
        }
        return (false, 0);
    }

    function hexToDec(bytes memory _hexString) private pure returns (uint256) {
        uint256 hexStringLastIndex = _hexString.length - 1;
        uint256 decimal;
        uint256 exp;
        uint256 base = 16;

        // @BUG: Reinvented the wheel too verbose
        for (uint256 hi = hexStringLastIndex; hi >= 0; hi--) {
            uint256 digit;
            if (
                uint8(_hexString[hi]) == uint8(abi.encodePacked("a")[0])
                    || uint8(_hexString[hi]) == uint8(abi.encodePacked("A")[0])
            ) {
                digit = 10;
            } else if (
                uint8(_hexString[hi]) == uint8(abi.encodePacked("b")[0])
                    || uint8(_hexString[hi]) == uint8(abi.encodePacked("B")[0])
            ) {
                digit = 11;
            } else if (
                uint8(_hexString[hi]) == uint8(abi.encodePacked("c")[0])
                    || uint8(_hexString[hi]) == uint8(abi.encodePacked("C")[0])
            ) {
                digit = 12;
            } else if (
                uint8(_hexString[hi]) == uint8(abi.encodePacked("d")[0])
                    || uint8(_hexString[hi]) == uint8(abi.encodePacked("D")[0])
            ) {
                digit = 13;
            } else if (
                uint8(_hexString[hi]) == uint8(abi.encodePacked("e")[0])
                    || uint8(_hexString[hi]) == uint8(abi.encodePacked("E")[0])
            ) {
                digit = 14;
            } else if (
                uint8(_hexString[hi]) == uint8(abi.encodePacked("f")[0])
                    || uint8(_hexString[hi]) == uint8(abi.encodePacked("F")[0])
            ) {
                digit = 15;
            } else if (isDigit(_hexString[hi], false)) {
                digit = asciiToDigit(uint8(_hexString[hi]));
            }

            decimal += (digit * (base ** exp));
            console2.log("-----------");
            console2.log("digit: ", digit);
            console2.log("exp: ", exp);
            console2.log("base: ", base);
            console2.log("decimal: ", decimal);
            console2.log("-----------");
            exp++;

            if (hi == 0) break;
        }

        return decimal;
    }

    function asciiToDigit(uint8 _asciiCode) private pure returns (uint256) {
        if (_asciiCode == uint8(abi.encodePacked("0")[0])) {
            return 0;
        }
        if (_asciiCode == uint8(abi.encodePacked("1")[0])) {
            return 1;
        }
        if (_asciiCode == uint8(abi.encodePacked("2")[0])) {
            return 2;
        }
        if (_asciiCode == uint8(abi.encodePacked("3")[0])) {
            return 3;
        }
        if (_asciiCode == uint8(abi.encodePacked("4")[0])) {
            return 4;
        }
        if (_asciiCode == uint8(abi.encodePacked("5")[0])) {
            return 5;
        }
        if (_asciiCode == uint8(abi.encodePacked("6")[0])) {
            return 6;
        }
        if (_asciiCode == uint8(abi.encodePacked("7")[0])) {
            return 7;
        }
        if (_asciiCode == uint8(abi.encodePacked("8")[0])) {
            return 8;
        }
        if (_asciiCode == uint8(abi.encodePacked("9")[0])) {
            return 9;
        }
        return type(uint256).max;
    }

    function isHexadecimal(uint8 _char) private pure returns (bool) {
        uint8 smallaASCIICode = uint8(abi.encodePacked("a")[0]);
        uint8 smallfASCIICode = uint8(abi.encodePacked("f")[0]);
        uint8 bigAASCIICode = uint8(abi.encodePacked("A")[0]);
        uint8 bigFASCIICode = uint8(abi.encodePacked("F")[0]);

        if (isDigit(bytes1(_char), false)) {
            return true;
        }

        if (
            (_char >= smallaASCIICode && _char <= smallfASCIICode) || (_char >= bigAASCIICode && _char <= bigFASCIICode)
        ) {
            return true;
        }

        return false;
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

        console2.log("---In findPatternStringInRangeBounds---");
        console2.log("targetChar: ", string(abi.encodePacked(_targetChar)));
        console2.log("targetChar ascii code: ", uint8(_targetChar));
        console2.log("lowerBoundUnicode: ", lowerBoundUnicode);
        console2.log("upperBoundUnicode: ", upperBoundUnicode);
        console2.log("---");

        if (uint8(_targetChar) >= lowerBoundUnicode && uint8(_targetChar) <= upperBoundUnicode) {
            return true;
        }
        return false;
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
