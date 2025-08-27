library legacy {
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
        PatternMatchedData memory lastPatternCollectedData
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

        patternData = lastPatternCollectedData;
        uint256 z = uint256(j);
        if (uint8(patternInBytes[i]) == backSlash && i < patternInBytes.length - 2) {
            if (
                uint8(patternInBytes[i + 1]) == smallW && uint8(patternInBytes[i + 2]) != plusSign
                    && uint8(patternInBytes[i + 2]) != asterisk
            ) {
                patternData = onlySingle(stringInBytes, patternData, z, false);
            } else if (uint8(patternInBytes[i + 1]) == smallW && uint8(patternInBytes[i + 2]) == plusSign) {
                patternData = oneOrMore(stringInBytes, patternData, z, false);
            } else if (uint8(patternInBytes[i + 1]) == smallW && uint8(patternInBytes[i + 2]) == asterisk) {
                patternData = zeroOrMore(stringInBytes, patternData, z, false);
            } else if (
                uint8(patternInBytes[i + 1]) == bigW && uint8(patternInBytes[i + 2]) != plusSign
                    && uint8(patternInBytes[i + 2]) != asterisk
            ) {
                patternData = onlySingle(stringInBytes, patternData, z, true);
            } else if (uint8(patternInBytes[i + 1]) == bigW && uint8(patternInBytes[i + 2]) == plusSign) {
                patternData = oneOrMore(stringInBytes, patternData, z, true);
            } else if (uint8(patternInBytes[i + 1]) == bigW && uint8(patternInBytes[i + 2]) == asterisk) {
                patternData = zeroOrMore(stringInBytes, patternData, z, true);
            } else {
                patternData.matchedStartIndex = -1;
                patternData.matchedEndIndex = -1;
                patternData.patternMatched = false;
            }
        }
        patternData.patternLastIndex += 1;
    }

    function onlySingle(
        bytes memory stringInBytes,
        PatternMatchedData memory patternData,
        uint256 z,
        bool toggleToNegate
    ) private pure returns (PatternMatchedData memory) {
        if (!toggleToNegate) {
            for (z; z < stringInBytes.length; z++) {
                if (isWord(z, stringInBytes)) {
                    patternData = onlySingleDataUpdate(patternData, stringInBytes, z, false);
                    break;
                } else {
                    patternData = onlySingleDataUpdate(patternData, stringInBytes, z, true);
                }
            }
        }

        if (toggleToNegate) {
            for (z; z < stringInBytes.length; z++) {
                if (!isWord(z, stringInBytes)) {
                    patternData = onlySingleDataUpdate(patternData, stringInBytes, z, false);
                    break;
                } else {
                    patternData = onlySingleDataUpdate(patternData, stringInBytes, z, true);
                }
            }
        }

        return patternData;
    }

    function oneOrMore(
        bytes memory stringInBytes,
        PatternMatchedData memory patternData,
        uint256 z,
        bool toggleToNegate
    ) private pure returns (PatternMatchedData memory) {
        if (!toggleToNegate) {
            bool isFoundFirstIndex = false;
            for (z; z < stringInBytes.length; z++) {
                if (isWord(z, stringInBytes)) {
                    (patternData, isFoundFirstIndex) =
                        onlyOneOrMoreDataUpdate(patternData, stringInBytes, z, false, isFoundFirstIndex);
                } else {
                    (patternData, isFoundFirstIndex) =
                        onlyOneOrMoreDataUpdate(patternData, stringInBytes, z, true, isFoundFirstIndex);

                    if (isFoundFirstIndex) {
                        break;
                    }
                }
            }
        }

        if (toggleToNegate) {
            bool isFoundFirstIndex = false;
            for (z; z < stringInBytes.length; z++) {
                if (!isWord(z, stringInBytes)) {
                    (patternData, isFoundFirstIndex) =
                        onlyOneOrMoreDataUpdate(patternData, stringInBytes, z, false, isFoundFirstIndex);
                } else {
                    (patternData, isFoundFirstIndex) =
                        onlyOneOrMoreDataUpdate(patternData, stringInBytes, z, true, isFoundFirstIndex);

                    if (isFoundFirstIndex) {
                        break;
                    }
                }
            }
        }

        return patternData;
    }

    function zeroOrMore(
        bytes memory stringInBytes,
        PatternMatchedData memory patternData,
        uint256 z,
        bool toggleToNegate
    ) private pure returns (PatternMatchedData memory) {
        if (!toggleToNegate) {
            bool isFoundFirstIndex = false;
            for (z; z < stringInBytes.length; z++) {
                if (isWord(z, stringInBytes)) {
                    (patternData, isFoundFirstIndex) =
                        onlyZeroOrMoreDataUpdate(patternData, stringInBytes, z, false, isFoundFirstIndex);
                } else {
                    (patternData, isFoundFirstIndex) =
                        onlyZeroOrMoreDataUpdate(patternData, stringInBytes, z, true, isFoundFirstIndex);
                    break;
                }
            }
        }
        if (toggleToNegate) {
            bool isFoundFirstIndex = false;
            for (z; z < stringInBytes.length; z++) {
                if (!isWord(z, stringInBytes)) {
                    (patternData, isFoundFirstIndex) =
                        onlyZeroOrMoreDataUpdate(patternData, stringInBytes, z, false, isFoundFirstIndex);
                } else {
                    (patternData, isFoundFirstIndex) =
                        onlyZeroOrMoreDataUpdate(patternData, stringInBytes, z, true, isFoundFirstIndex);
                    break;
                }
            }
        }

        return patternData;
    }

    function onlySingleDataUpdate(
        PatternMatchedData memory patternData,
        bytes memory stringInBytes,
        uint256 z,
        bool notMatchUpdate
    ) private pure returns (PatternMatchedData memory) {
        if (!notMatchUpdate) {
            patternData.matchedStartIndex = int256(z);
            patternData.matchedEndIndex = int256(z);
            patternData.patternMatched = true;
            patternData.subStrMatched = string(abi.encodePacked(patternData.subStrMatched, stringInBytes[z]));
        }

        if (notMatchUpdate) {
            if (z == stringInBytes.length - 1) {
                patternData.matchedStartIndex = -1;
                patternData.matchedEndIndex = -1;
                patternData.patternMatched = false;
            }
        }

        return patternData;
    }

    function onlyOneOrMoreDataUpdate(
        PatternMatchedData memory patternData,
        bytes memory stringInBytes,
        uint256 z,
        bool notMatchUpdate,
        bool isFoundFirstIndex
    ) private pure returns (PatternMatchedData memory, bool) {
        if (!notMatchUpdate) {
            if (!isFoundFirstIndex) {
                isFoundFirstIndex = true;
                patternData.matchedStartIndex = int256(z);
                patternData.patternMatched = true;
            }

            patternData.matchedEndIndex = int256(z);
            patternData.subStrMatched = string(abi.encodePacked(patternData.subStrMatched, stringInBytes[z]));
        }

        if (notMatchUpdate) {
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
            }
        }

        return (patternData, isFoundFirstIndex);
    }

    function onlyZeroOrMoreDataUpdate(
        PatternMatchedData memory patternData,
        bytes memory stringInBytes,
        uint256 z,
        bool notMatchUpdate,
        bool isFoundFirstIndex
    ) private pure returns (PatternMatchedData memory, bool) {
        if (!notMatchUpdate) {
            if (!isFoundFirstIndex) {
                isFoundFirstIndex = true;
                patternData.matchedStartIndex = int256(z);
                patternData.patternMatched = true;
            }

            patternData.subStrMatched = string(abi.encodePacked(patternData.subStrMatched, stringInBytes[z]));
        }
        if (notMatchUpdate) {
            if (z == 0) {
                patternData.matchedStartIndex = -1;
                patternData.matchedEndIndex = -1;
                patternData.patternMatched = true;
            } else {
                patternData.matchedEndIndex = int256(z - 1);
            }
        }

        return (patternData, isFoundFirstIndex);
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
