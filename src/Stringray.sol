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

    bytes32 private constant INVALID_ATOM = "INVALID_ATOM";
    bytes32 private constant LITERAL_ATOM = "LITERAL_ATOM";
    bytes32 private constant WORD_BOUNDARY = "WORD_BOUNDARY";
    bytes32 private constant CONTROL_PREFIX = "CONTROL_PREFIX";
    bytes32 private constant DIGIT = "DIGIT";
    bytes32 private constant FORMFEED = "FORMFEED";
    bytes32 private constant NAMED_BACKREFERENCE_PREFIX = "NAMED_BACKREFERENCE_PREFIX";
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
    bytes32 private constant PLUS_GREEDY_QUANTIFIER_ATOM = "*_GREEDY_QUANTIFIER_ATOM";
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
        console2.log("ORIGINAL TARGET STRING: ", _proposedString);
        console2.log("ORIGINAL PATTERN STRING: ", _pattern);
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

        if (flag) {
            if (
                _currentParticleIdx + 3 == lastMatchedParticleIndex
                    && (
                        uint8(_pattern[_currentParticleIdx + 1]) == uint8(abi.encodePacked("x")[0])
                            || uint8(_pattern[_currentParticleIdx + 1]) == uint8(abi.encodePacked("X")[0])
                    )
            ) {
                atomType = HEX_ESCAPE;
            } else if (
                _currentParticleIdx + 1 == lastMatchedParticleIndex
                    && uint8(_pattern[_currentParticleIdx]) == BACK_SLASH
            ) {
                uint8 lastMatchedParticle = uint8(_pattern[lastMatchedParticleIndex]);

                if (lastMatchedParticle == uint8(abi.encodePacked("b")[0])) {
                    atomType = WORD_BOUNDARY;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("c")[0])) {
                    atomType = CONTROL_PREFIX;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("d")[0])) {
                    atomType = DIGIT;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("f")[0])) {
                    atomType = FORMFEED;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("k")[0])) {
                    atomType = NAMED_BACKREFERENCE_PREFIX;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("n")[0])) {
                    atomType = NEWLINE;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("p")[0])) {
                    atomType = UNICODE_PROPERTY;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("r")[0])) {
                    atomType = CARRIAGE_RETURN;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("s")[0])) {
                    atomType = WHITESPACE;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("t")[0])) {
                    atomType = TAB;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("u")[0])) {
                    atomType = UNICODE_ESCAPE;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("v")[0])) {
                    atomType = VERTICAL_TAB;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("w")[0])) {
                    atomType = WORD_CHARACTER;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("B")[0])) {
                    atomType = NOT_WORD_BOUNDARY;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("D")[0])) {
                    atomType = NOT_DIGIT;
                } else if (lastMatchedParticle == uint8(abi.encodePacked("P")[0])) {
                    atomType = UNICODE_PROPERTY_NEGATION;
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

        console2.log("---In isLiteralAtom---");
        console2.log("flag: ", flag);
        console2.log("lastMatchedParticleIndex: ", lastMatchedParticleIndex);
        console2.log("---");

        return (flag, atomType, lastMatchedParticleIndex);
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
                    isDigit(_pattern[_currentParticleIdx + 1])
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
                    isDigit(_pattern[_currentParticleIdx + 1]) && uint8(_pattern[_currentParticleIdx + 2]) == COMMA_SIGN
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
                    isDigit(_pattern[_currentParticleIdx + 1]) && uint8(_pattern[_currentParticleIdx + 2]) == COMMA_SIGN
                        && isDigit(_pattern[_currentParticleIdx + 3])
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

    function isDigit(bytes1 _targetChar) private pure returns (bool) {
        uint8 lowerBoundUnicode = 48;
        uint8 upperBoundUnicode = 57;
        return findPatternStringInRangeBounds(lowerBoundUnicode, upperBoundUnicode, _targetChar, false);
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

    function isRangeLiteral(bytes memory _pattern, uint256 _currentParticleIndex)
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
                if (!isDigit(_pattern[nextParticleIndex])) {
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
                            !isDigit(_pattern[patternNAndInfinityRangeMaxIndex])
                                && uint8(_pattern[patternNAndInfinityRangeMaxIndex]) != CLOSE_CURLY_BRACE
                        ) {
                            return (true, _currentParticleIndex);
                        }

                        if (uint8(_pattern[patternNAndInfinityRangeMaxIndex]) == CLOSE_CURLY_BRACE) {
                            return (false, 0);
                        }

                        if (isDigit(_pattern[patternNAndInfinityRangeMaxIndex])) {
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

        console2.log("traversed through range open curly bracket check!");

        if (isDigit(_pattern[_currentParticleIndex])) {
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
                                    !isDigit(_pattern[_currentParticleIndex + 2])
                                        && uint8(_pattern[_currentParticleIndex + 2]) != CLOSE_CURLY_BRACE
                                ) {
                                    return (true, _currentParticleIndex);
                                }

                                if (uint8(_pattern[_currentParticleIndex + 2]) == CLOSE_CURLY_BRACE) {
                                    return (false, 0);
                                }

                                if (isDigit(_pattern[_currentParticleIndex + 2])) {
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
                        && (
                            _currentParticleIndex + 1 <= patternLastIndex
                                && uint8(_pattern[_currentParticleIndex + 1]) == CLOSE_CURLY_BRACE
                        )
                ) {
                    if (_currentParticleIndex > 1) {
                        if (!isDigit(_pattern[_currentParticleIndex - 2])) {
                            return (true, _currentParticleIndex);
                        }

                        if (isDigit(_pattern[_currentParticleIndex - 2])) {
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

        if (_targetChar == COMMA_SIGN) {
            if (_currentParticleIndex == 0 || _currentParticleIndex == patternLastIndex) {
                return (true, _currentParticleIndex);
            }

            if (_currentParticleIndex > 0) {
                if (!isDigit(_pattern[_currentParticleIndex - 1])) {
                    return (true, _currentParticleIndex);
                }

                if (isDigit(_pattern[_currentParticleIndex - 1])) {
                    if (_currentParticleIndex > 1) {
                        if (uint8(_pattern[_currentParticleIndex - 2]) != OPEN_CURLY_BRACE) {
                            return (true, _currentParticleIndex);
                        }
                    } else {
                        return (true, _currentParticleIndex);
                    }

                    if (_currentParticleIndex + 1 <= patternLastIndex) {
                        if (
                            !isDigit(_pattern[_currentParticleIndex + 1])
                                && uint8(_pattern[_currentParticleIndex + 1]) != CLOSE_CURLY_BRACE
                        ) {
                            return (true, _currentParticleIndex);
                        }

                        if (uint8(_pattern[_currentParticleIndex + 1]) == CLOSE_CURLY_BRACE) {
                            return (false, 0);
                        }

                        if (isDigit(_pattern[_currentParticleIndex + 1])) {
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
        console2.log("passed upto comma check: ");
        if (_targetChar == CLOSE_CURLY_BRACE) {
            console2.log("into CLOSE CURLY BRACE: ");
            if (_currentParticleIndex == 0) {
                return (true, _currentParticleIndex);
            }

            if (_currentParticleIndex > 0) {
                if (
                    !isDigit(_pattern[_currentParticleIndex - 1])
                        && uint8(_pattern[_currentParticleIndex - 1]) != COMMA_SIGN
                ) {
                    return (true, _currentParticleIndex);
                }

                if (_currentParticleIndex > 1) {
                    if (isDigit(_pattern[_currentParticleIndex - 1])) {
                        console2.log("inside last particle is a digit...");
                        if (
                            uint8(_pattern[_currentParticleIndex - 2]) != COMMA_SIGN
                                && uint8(_pattern[_currentParticleIndex - 2]) != OPEN_CURLY_BRACE
                        ) {
                            return (true, _currentParticleIndex);
                        }

                        if (uint8(_pattern[_currentParticleIndex - 2]) == OPEN_CURLY_BRACE) {
                            return (false, 0);
                        }

                        console2.log("Passed last particle is digit and second last is not comma");

                        if (uint8(_pattern[_currentParticleIndex - 2]) == COMMA_SIGN) {
                            if (_currentParticleIndex > 2) {
                                if (!isDigit(_pattern[_currentParticleIndex - 3])) {
                                    return (true, _currentParticleIndex);
                                }

                                if (isDigit(_pattern[_currentParticleIndex - 3])) {
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
                        if (!isDigit(_pattern[_currentParticleIndex - 2])) {
                            return (true, _currentParticleIndex);
                        }

                        if (isDigit(_pattern[_currentParticleIndex - 2])) {
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
        console2.log("---");
        console2.log("---In isEscapeLiteral---");
        uint8 _targetChar = uint8(_pattern[_currentParticleIndex]);
        uint256 patternLastIndex = _pattern.length - 1;

        if (_targetChar == BACK_SLASH && _currentParticleIndex < patternLastIndex) {
            uint8 _nextChar = uint8(_pattern[_currentParticleIndex + 1]);
            uint8 smalluASCIICode = uint8(abi.encodePacked("u")[0]);
            uint8 smallxASCIICode = uint8(abi.encodePacked("x")[0]);
            uint8 smallcASCIICode = uint8(abi.encodePacked("c")[0]);
            uint8 smallkASCIICode = uint8(abi.encodePacked("k")[0]);

            if (_nextChar == smalluASCIICode) {
                if (uint8(_pattern[_currentParticleIndex + 2]) == OPEN_CURLY_BRACE) {
                    if (
                        _currentParticleIndex + 4 <= patternLastIndex
                            && uint8(_pattern[_currentParticleIndex + 4]) == CLOSE_CURLY_BRACE
                    ) {
                        if (isHexadecimal(uint8(_pattern[_currentParticleIndex + 3]))) {
                            return (true, _currentParticleIndex + 4);
                        }
                    } else if (
                        _currentParticleIndex + 5 <= patternLastIndex
                            && uint8(_pattern[_currentParticleIndex + 5]) == CLOSE_CURLY_BRACE
                    ) {
                        if (
                            isHexadecimal(uint8(_pattern[_currentParticleIndex + 3]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 4]))
                        ) {
                            return (true, _currentParticleIndex + 5);
                        }
                    } else if (
                        _currentParticleIndex + 6 <= patternLastIndex
                            && uint8(_pattern[_currentParticleIndex + 6]) == CLOSE_CURLY_BRACE
                    ) {
                        if (
                            isHexadecimal(uint8(_pattern[_currentParticleIndex + 3]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 4]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 5]))
                        ) {
                            return (true, _currentParticleIndex + 6);
                        }
                    } else if (
                        _currentParticleIndex + 7 <= patternLastIndex
                            && uint8(_pattern[_currentParticleIndex + 7]) == CLOSE_CURLY_BRACE
                    ) {
                        if (
                            isHexadecimal(uint8(_pattern[_currentParticleIndex + 3]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 4]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 5]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 6]))
                        ) {
                            return (true, _currentParticleIndex + 7);
                        }
                    } else if (
                        _currentParticleIndex + 8 <= patternLastIndex
                            && uint8(_pattern[_currentParticleIndex + 8]) == CLOSE_CURLY_BRACE
                    ) {
                        if (
                            isHexadecimal(uint8(_pattern[_currentParticleIndex + 3]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 4]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 5]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 6]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 7]))
                        ) {
                            return (true, _currentParticleIndex + 8);
                        }
                    } else if (
                        _currentParticleIndex + 9 <= patternLastIndex
                            && uint8(_pattern[_currentParticleIndex + 9]) == CLOSE_CURLY_BRACE
                    ) {
                        if (
                            isHexadecimal(uint8(_pattern[_currentParticleIndex + 3]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 4]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 5]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 6]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 7]))
                                && isHexadecimal(uint8(_pattern[_currentParticleIndex + 8]))
                        ) {
                            bytes memory hexString =
                                trimString(_pattern, _currentParticleIndex + 3, int256(_currentParticleIndex + 8));
                            uint256 decValue = hexToDec(hexString);

                            if (decValue <= 1114111) {
                                return (true, _currentParticleIndex + 9);
                            }
                        }
                    }
                }

                if (_currentParticleIndex + 5 <= patternLastIndex) {
                    uint8 _nextCharSecond = uint8(_pattern[_currentParticleIndex + 2]);
                    uint8 _nextCharThird = uint8(_pattern[_currentParticleIndex + 3]);
                    uint8 _nextCharFourth = uint8(_pattern[_currentParticleIndex + 4]);
                    uint8 _nextCharFifth = uint8(_pattern[_currentParticleIndex + 5]);
                    if (
                        isHexadecimal(_nextCharSecond) && isHexadecimal(_nextCharThird)
                            && isHexadecimal(_nextCharFourth) && isHexadecimal(_nextCharFifth)
                    ) {
                        return (true, _currentParticleIndex + 5);
                    }
                }
            }

            if (_nextChar == smallxASCIICode) {
                if (_currentParticleIndex + 3 <= patternLastIndex) {
                    uint8 _nextCharSecond = uint8(_pattern[_currentParticleIndex + 2]);
                    uint8 _nextCharThird = uint8(_pattern[_currentParticleIndex + 3]);

                    if (isHexadecimal(_nextCharSecond) && isHexadecimal(_nextCharThird)) {
                        return (true, _currentParticleIndex + 3);
                    }
                }
            }

            if (_nextChar == smallcASCIICode) {
                if (_currentParticleIndex + 2 <= patternLastIndex) {
                    return (true, _currentParticleIndex + 2);
                }
            }

            if (_nextChar == smallkASCIICode) {
                if (_currentParticleIndex + 5 <= patternLastIndex) {
                    if (
                        uint8(_pattern[_currentParticleIndex + 2]) == LESS_THAN_SIGN
                            && (
                                isSmallAlphabet(_pattern[_currentParticleIndex + 3])
                                    || isBigAlphabet(_pattern[_currentParticleIndex + 3])
                                    || uint8(_pattern[_currentParticleIndex + 3]) == uint8(abi.encodePacked("_")[0])
                                    || uint8(_pattern[_currentParticleIndex + 3]) == uint8(abi.encodePacked("$")[0])
                            )
                    ) {
                        // TODO: Complete the \k functionality
                    }
                }
            }

            return (true, _currentParticleIndex + 1);
        }

        return (false, 0);
    }

    function validateGroupName(bytes memory _pattern, uint256 _indexToStartFrom) private pure returns (bool) {
        // TODO: Complete this function
        return false;
    }

    function hexToDec(bytes memory _hexString) private pure returns (uint256) {
        uint256 hexStringLastIndex = _hexString.length - 1;
        uint256 decimal;
        uint256 exp;
        uint256 base;

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
            }

            decimal += (digit * (base ** exp));
            exp++;
        }
    }

    function isHexadecimal(uint8 _char) private pure returns (bool) {
        uint8 smallaASCIICode = uint8(abi.encodePacked("a")[0]);
        uint8 smallfASCIICode = uint8(abi.encodePacked("f")[0]);
        uint8 bigAASCIICode = uint8(abi.encodePacked("A")[0]);
        uint8 bigFASCIICode = uint8(abi.encodePacked("F")[0]);

        if (isDigit(bytes1(_char))) {
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
