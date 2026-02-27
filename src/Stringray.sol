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
    uint8 private constant SMALL_i = 105;
    uint8 private constant SMALL_m = 109;
    uint8 private constant SMALL_u = 117;
    uint8 private constant SMALL_y = 121;
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
    bytes32 private constant DOT_ATOM = "DOT_ATOM";
    bytes32 private constant CHARACTER_CLASS_ATOM = "CHARACTER_CLASS_ATOM";
    bytes32 private constant GROUP_ATOM = "GROUP_ATOM";
    bytes32 private constant DOLLAR_ANCHOR = "DOLLAR_ANCHOR";
    bytes32 private constant CARET_ANCHOR = "CARET_ANCHOR";
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
    bytes32 private constant ALTERNATION_OPERATOR = "ALTERNATION_OPERATOR";
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

    // PROPERTY ESCAPE NAMES...
    // General Category: 30
    bytes32 private constant LETTER = keccak256(abi.encodePacked("Letter"));
    bytes32 private constant UPPERCASE_LETTER = keccak256(abi.encodePacked("Uppercase_Letter"));
    bytes32 private constant LOWERCASE_LETTER = keccak256(abi.encodePacked("Lowercase_Letter"));
    bytes32 private constant TITLECASE_LETTER = keccak256(abi.encodePacked("Titlecase_Letter"));
    bytes32 private constant MODIFIER_LETTER = keccak256(abi.encodePacked("Modifier_Letter"));
    bytes32 private constant OTHER_LETTER = keccak256(abi.encodePacked("Other_Letter"));
    bytes32 private constant SH_LETTER = keccak256(abi.encodePacked("L"));
    bytes32 private constant SH_UPPERCASE_LETTER = keccak256(abi.encodePacked("Lu"));
    bytes32 private constant SH_LOWERCASE_LETTER = keccak256(abi.encodePacked("Ll"));
    bytes32 private constant SH_TITLECASE_LETTER = keccak256(abi.encodePacked("Lt"));
    bytes32 private constant SH_MODIFIER_LETTER = keccak256(abi.encodePacked("Lm"));
    bytes32 private constant SH_OTHER_LETTER = keccak256(abi.encodePacked("Lo"));
    bytes32 private constant MARK = keccak256(abi.encodePacked("Mark"));
    bytes32 private constant NONSPACING_MARK = keccak256(abi.encodePacked("Nonspacing_Mark"));
    bytes32 private constant SPACING_MARK = keccak256(abi.encodePacked("Spacing_Mark"));
    bytes32 private constant ENCLOSING_MARK = keccak256(abi.encodePacked("Enclosing_Mark"));
    bytes32 private constant SH_MARK = keccak256(abi.encodePacked("M"));
    bytes32 private constant SH_NONSPACING_MARK = keccak256(abi.encodePacked("Mn"));
    bytes32 private constant SH_SPACING_MARK = keccak256(abi.encodePacked("Mc"));
    bytes32 private constant SH_ENCLOSING_MARK = keccak256(abi.encodePacked("Me"));
    bytes32 private constant NUMBER = keccak256(abi.encodePacked("Number"));
    bytes32 private constant DECIMAL_NUMBER = keccak256(abi.encodePacked("Decimal_Number"));
    bytes32 private constant LETTER_NUMBER = keccak256(abi.encodePacked("Letter_Number"));
    bytes32 private constant OTHER_NUMBER = keccak256(abi.encodePacked("Other_Number"));
    bytes32 private constant SH_NUMBER = keccak256(abi.encodePacked("N"));
    bytes32 private constant SH_DECIMAL_NUMBER = keccak256(abi.encodePacked("Nd"));
    bytes32 private constant SH_LETTER_NUMBER = keccak256(abi.encodePacked("Nl"));
    bytes32 private constant SH_OTHER_NUMBER = keccak256(abi.encodePacked("No"));
    bytes32 private constant PUNCTUATION = keccak256(abi.encodePacked("Punctuation"));
    bytes32 private constant CONNECTOR_PUNCTUATION = keccak256(abi.encodePacked("Connector_Punctuation"));
    bytes32 private constant DASH_PUNCTUATION = keccak256(abi.encodePacked("Dash_Punctuation"));
    bytes32 private constant OPEN_PUNCTUATION = keccak256(abi.encodePacked("Open_Punctuation"));
    bytes32 private constant CLOSE_PUNCTUATION = keccak256(abi.encodePacked("Close_Punctuation"));
    bytes32 private constant INITIAL_PUNCTUATION = keccak256(abi.encodePacked("Initial_Punctuation"));
    bytes32 private constant FINAL_PUNCTUATION = keccak256(abi.encodePacked("Final_Punctuation"));
    bytes32 private constant OTHER_PUNCTUATION = keccak256(abi.encodePacked("Other_Punctuation"));
    bytes32 private constant SH_PUNCTUATION = keccak256(abi.encodePacked("P"));
    bytes32 private constant SH_CONNECTOR_PUNCTUATION = keccak256(abi.encodePacked("Pc"));
    bytes32 private constant SH_DASH_PUNCTUATION = keccak256(abi.encodePacked("Pd"));
    bytes32 private constant SH_OPEN_PUNCTUATION = keccak256(abi.encodePacked("Ps"));
    bytes32 private constant SH_CLOSE_PUNCTUATION = keccak256(abi.encodePacked("Pe"));
    bytes32 private constant SH_INITIAL_PUNCTUATION = keccak256(abi.encodePacked("Pi"));
    bytes32 private constant SH_FINAL_PUNCTUATION = keccak256(abi.encodePacked("Pf"));
    bytes32 private constant SH_OTHER_PUNCTUATION = keccak256(abi.encodePacked("Po"));
    bytes32 private constant SYMBOL = keccak256(abi.encodePacked("Symbol"));
    bytes32 private constant MATH_SYMBOL = keccak256(abi.encodePacked("Math_Symbol"));
    bytes32 private constant CURRENCY_SYMBOL = keccak256(abi.encodePacked("Currency_Symbol"));
    bytes32 private constant MODIFIER_SYMBOL = keccak256(abi.encodePacked("Modifier_Symbol"));
    bytes32 private constant OTHER_SYMBOL = keccak256(abi.encodePacked("Other_Symbol"));
    bytes32 private constant SH_SYMBOL = keccak256(abi.encodePacked("S"));
    bytes32 private constant SH_MATH_SYMBOL = keccak256(abi.encodePacked("Sm"));
    bytes32 private constant SH_CURRENCY_SYMBOL = keccak256(abi.encodePacked("Sc"));
    bytes32 private constant SH_MODIFIER_SYMBOL = keccak256(abi.encodePacked("Sk"));
    bytes32 private constant SH_OTHER_SYMBOL = keccak256(abi.encodePacked("So"));
    bytes32 private constant SEPARATOR = keccak256(abi.encodePacked("Separator"));
    bytes32 private constant SPACE_SEPARATOR = keccak256(abi.encodePacked("Space_Separator"));
    bytes32 private constant LINE_SEPARATOR = keccak256(abi.encodePacked("Line_Separator"));
    bytes32 private constant PARAGRAPH_SEPARATOR = keccak256(abi.encodePacked("Paragraph_Separator"));
    bytes32 private constant SH_SEPARATOR = keccak256(abi.encodePacked("Z"));
    bytes32 private constant SH_SPACE_SEPARATOR = keccak256(abi.encodePacked("Zs"));
    bytes32 private constant SH_LINE_SEPARATOR = keccak256(abi.encodePacked("Zl"));
    bytes32 private constant SH_PARAGRAPH_SEPARATOR = keccak256(abi.encodePacked("Zp"));
    bytes32 private constant OTHER = keccak256(abi.encodePacked("Other"));
    bytes32 private constant CONTROL = keccak256(abi.encodePacked("Control"));
    bytes32 private constant FORMAT = keccak256(abi.encodePacked("Format"));
    bytes32 private constant SURROGATE = keccak256(abi.encodePacked("Surrogate"));
    bytes32 private constant PRIVATE_USE = keccak256(abi.encodePacked("Private_Use"));
    bytes32 private constant UNASSIGNED = keccak256(abi.encodePacked("Unassigned"));
    bytes32 private constant SH_OTHER = keccak256(abi.encodePacked("C"));
    bytes32 private constant SH_CONTROL = keccak256(abi.encodePacked("Cc"));
    bytes32 private constant SH_FORMAT = keccak256(abi.encodePacked("Cf"));
    bytes32 private constant SH_SURROGATE = keccak256(abi.encodePacked("Cs"));
    bytes32 private constant SH_PRIVATE_USE = keccak256(abi.encodePacked("Co"));
    bytes32 private constant SH_UNASSIGNED = keccak256(abi.encodePacked("Cn"));

    // Script: 176
    bytes32 private constant Adlam = keccak256(abi.encodePacked("Adlam"));
    bytes32 private constant Caucasian_Albanian = keccak256(abi.encodePacked("Caucasian_Albanian"));
    bytes32 private constant Ahom = keccak256(abi.encodePacked("Ahom"));
    bytes32 private constant Arabic = keccak256(abi.encodePacked("Arabic"));
    bytes32 private constant Imperial_Aramaic = keccak256(abi.encodePacked("Imperial_Aramaic"));
    bytes32 private constant Armenian = keccak256(abi.encodePacked("Armenian"));
    bytes32 private constant Avestan = keccak256(abi.encodePacked("Avestan"));
    bytes32 private constant Balinese = keccak256(abi.encodePacked("Balinese"));
    bytes32 private constant Bamum = keccak256(abi.encodePacked("Bamum"));
    bytes32 private constant Bassa_Vah = keccak256(abi.encodePacked("Bassa_Vah"));
    bytes32 private constant Batak = keccak256(abi.encodePacked("Batak"));
    bytes32 private constant Bengali = keccak256(abi.encodePacked("Bengali"));
    bytes32 private constant Beria_Erfe = keccak256(abi.encodePacked("Beria_Erfe"));
    bytes32 private constant Bhaiksuki = keccak256(abi.encodePacked("Bhaiksuki"));
    bytes32 private constant Bopomofo = keccak256(abi.encodePacked("Bopomofo"));
    bytes32 private constant Brahmi = keccak256(abi.encodePacked("Brahmi"));
    bytes32 private constant Braille = keccak256(abi.encodePacked("Braille"));
    bytes32 private constant Buginese = keccak256(abi.encodePacked("Buginese"));
    bytes32 private constant Buhid = keccak256(abi.encodePacked("Buhid"));
    bytes32 private constant Chakma = keccak256(abi.encodePacked("Chakma"));
    bytes32 private constant Canadian_Aboriginal = keccak256(abi.encodePacked("Canadian_Aboriginal"));
    bytes32 private constant Carian = keccak256(abi.encodePacked("Carian"));
    bytes32 private constant Cham = keccak256(abi.encodePacked("Cham"));
    bytes32 private constant Cherokee = keccak256(abi.encodePacked("Cherokee"));
    bytes32 private constant Chorasmian = keccak256(abi.encodePacked("Chorasmian"));
    bytes32 private constant Coptic = keccak256(abi.encodePacked("Coptic"));
    bytes32 private constant Cypro_Minoan = keccak256(abi.encodePacked("Cypro_Minoan"));
    bytes32 private constant Cypriot = keccak256(abi.encodePacked("Cypriot"));
    bytes32 private constant Cyrillic = keccak256(abi.encodePacked("Cyrillic"));
    bytes32 private constant Devanagari = keccak256(abi.encodePacked("Devanagari"));
    bytes32 private constant Dives_Akuru = keccak256(abi.encodePacked("Dives_Akuru"));
    bytes32 private constant Dogra = keccak256(abi.encodePacked("Dogra"));
    bytes32 private constant Deseret = keccak256(abi.encodePacked("Deseret"));
    bytes32 private constant Duployan = keccak256(abi.encodePacked("Duployan"));
    bytes32 private constant Egyptian_Hieroglyphs = keccak256(abi.encodePacked("Egyptian_Hieroglyphs"));
    bytes32 private constant Elbasan = keccak256(abi.encodePacked("Elbasan"));
    bytes32 private constant Elymaic = keccak256(abi.encodePacked("Elymaic"));
    bytes32 private constant Ethiopic = keccak256(abi.encodePacked("Ethiopic"));
    bytes32 private constant Garay = keccak256(abi.encodePacked("Garay"));
    bytes32 private constant Georgian = keccak256(abi.encodePacked("Georgian"));
    bytes32 private constant Glagolitic = keccak256(abi.encodePacked("Glagolitic"));
    bytes32 private constant Gunjala_Gondi = keccak256(abi.encodePacked("Gunjala_Gondi"));
    bytes32 private constant Masaram_Gondi = keccak256(abi.encodePacked("Masaram_Gondi"));
    bytes32 private constant Gothic = keccak256(abi.encodePacked("Gothic"));
    bytes32 private constant Grantha = keccak256(abi.encodePacked("Grantha"));
    bytes32 private constant Greek = keccak256(abi.encodePacked("Greek"));
    bytes32 private constant Gujarati = keccak256(abi.encodePacked("Gujarati"));
    bytes32 private constant Gurung_Khema = keccak256(abi.encodePacked("Gurung_Khema"));
    bytes32 private constant Gurmukhi = keccak256(abi.encodePacked("Gurmukhi"));
    bytes32 private constant Hangul = keccak256(abi.encodePacked("Hangul"));
    bytes32 private constant Han = keccak256(abi.encodePacked("Han"));
    bytes32 private constant Hanunoo = keccak256(abi.encodePacked("Hanunoo"));
    bytes32 private constant Hatran = keccak256(abi.encodePacked("Hatran"));
    bytes32 private constant Hebrew = keccak256(abi.encodePacked("Hebrew"));
    bytes32 private constant Hiragana = keccak256(abi.encodePacked("Hiragana"));
    bytes32 private constant Anatolian_Hieroglyphs = keccak256(abi.encodePacked("Anatolian_Hieroglyphs"));
    bytes32 private constant Pahawh_Hmong = keccak256(abi.encodePacked("Pahawh_Hmong"));
    bytes32 private constant Nyiakeng_Puachue_Hmong = keccak256(abi.encodePacked("Nyiakeng_Puachue_Hmong"));
    bytes32 private constant Katakana_Or_Hiragana = keccak256(abi.encodePacked("Katakana_Or_Hiragana"));
    bytes32 private constant Old_Hungarian = keccak256(abi.encodePacked("Old_Hungarian"));
    bytes32 private constant Old_Italic = keccak256(abi.encodePacked("Old_Italic"));
    bytes32 private constant Javanese = keccak256(abi.encodePacked("Javanese"));
    bytes32 private constant Kayah_Li = keccak256(abi.encodePacked("Kayah_Li"));
    bytes32 private constant Katakana = keccak256(abi.encodePacked("Katakana"));
    bytes32 private constant Kawi = keccak256(abi.encodePacked("Kawi"));
    bytes32 private constant Kharoshthi = keccak256(abi.encodePacked("Kharoshthi"));
    bytes32 private constant Khmer = keccak256(abi.encodePacked("Khmer"));
    bytes32 private constant Khojki = keccak256(abi.encodePacked("Khojki"));
    bytes32 private constant Khitan_Small_Script = keccak256(abi.encodePacked("Khitan_Small_Script"));
    bytes32 private constant Kannada = keccak256(abi.encodePacked("Kannada"));
    bytes32 private constant Kirat_Rai = keccak256(abi.encodePacked("Kirat_Rai"));
    bytes32 private constant Kaithi = keccak256(abi.encodePacked("Kaithi"));
    bytes32 private constant Tai_Tham = keccak256(abi.encodePacked("Tai_Tham"));
    bytes32 private constant Lao = keccak256(abi.encodePacked("Lao"));
    bytes32 private constant Latin = keccak256(abi.encodePacked("Latin"));
    bytes32 private constant Lepcha = keccak256(abi.encodePacked("Lepcha"));
    bytes32 private constant Limbu = keccak256(abi.encodePacked("Limbu"));
    bytes32 private constant Linear_A = keccak256(abi.encodePacked("Linear_A"));
    bytes32 private constant Linear_B = keccak256(abi.encodePacked("Linear_B"));
    bytes32 private constant Lisu = keccak256(abi.encodePacked("Lisu"));
    bytes32 private constant Lycian = keccak256(abi.encodePacked("Lycian"));
    bytes32 private constant Lydian = keccak256(abi.encodePacked("Lydian"));
    bytes32 private constant Mahajani = keccak256(abi.encodePacked("Mahajani"));
    bytes32 private constant Makasar = keccak256(abi.encodePacked("Makasar"));
    bytes32 private constant Mandaic = keccak256(abi.encodePacked("Mandaic"));
    bytes32 private constant Manichaean = keccak256(abi.encodePacked("Manichaean"));
    bytes32 private constant Marchen = keccak256(abi.encodePacked("Marchen"));
    bytes32 private constant Medefaidrin = keccak256(abi.encodePacked("Medefaidrin"));
    bytes32 private constant Mende_Kikakui = keccak256(abi.encodePacked("Mende_Kikakui"));
    bytes32 private constant Meroitic_Cursive = keccak256(abi.encodePacked("Meroitic_Cursive"));
    bytes32 private constant Meroitic_Hieroglyphs = keccak256(abi.encodePacked("Meroitic_Hieroglyphs"));
    bytes32 private constant Malayalam = keccak256(abi.encodePacked("Malayalam"));
    bytes32 private constant Modi = keccak256(abi.encodePacked("Modi"));
    bytes32 private constant Mongolian = keccak256(abi.encodePacked("Mongolian"));
    bytes32 private constant Mro = keccak256(abi.encodePacked("Mro"));
    bytes32 private constant Meetei_Mayek = keccak256(abi.encodePacked("Meetei_Mayek"));
    bytes32 private constant Multani = keccak256(abi.encodePacked("Multani"));
    bytes32 private constant Myanmar = keccak256(abi.encodePacked("Myanmar"));
    bytes32 private constant Nag_Mundari = keccak256(abi.encodePacked("Nag_Mundari"));
    bytes32 private constant Nandinagari = keccak256(abi.encodePacked("Nandinagari"));
    bytes32 private constant Old_North_Arabian = keccak256(abi.encodePacked("Old_North_Arabian"));
    bytes32 private constant Nabataean = keccak256(abi.encodePacked("Nabataean"));
    bytes32 private constant Newa = keccak256(abi.encodePacked("Newa"));
    bytes32 private constant Nko = keccak256(abi.encodePacked("Nko"));
    bytes32 private constant Nushu = keccak256(abi.encodePacked("Nushu"));
    bytes32 private constant Ogham = keccak256(abi.encodePacked("Ogham"));
    bytes32 private constant Ol_Chiki = keccak256(abi.encodePacked("Ol_Chiki"));
    bytes32 private constant Ol_Onal = keccak256(abi.encodePacked("Ol_Onal"));
    bytes32 private constant Old_Turkic = keccak256(abi.encodePacked("Old_Turkic"));
    bytes32 private constant Oriya = keccak256(abi.encodePacked("Oriya"));
    bytes32 private constant Osage = keccak256(abi.encodePacked("Osage"));
    bytes32 private constant Osmanya = keccak256(abi.encodePacked("Osmanya"));
    bytes32 private constant Old_Uyghur = keccak256(abi.encodePacked("Old_Uyghur"));
    bytes32 private constant Palmyrene = keccak256(abi.encodePacked("Palmyrene"));
    bytes32 private constant Pau_Cin_Hau = keccak256(abi.encodePacked("Pau_Cin_Hau"));
    bytes32 private constant Old_Permic = keccak256(abi.encodePacked("Old_Permic"));
    bytes32 private constant Phags_Pa = keccak256(abi.encodePacked("Phags_Pa"));
    bytes32 private constant Inscriptional_Pahlavi = keccak256(abi.encodePacked("Inscriptional_Pahlavi"));
    bytes32 private constant Psalter_Pahlavi = keccak256(abi.encodePacked("Psalter_Pahlavi"));
    bytes32 private constant Phoenician = keccak256(abi.encodePacked("Phoenician"));
    bytes32 private constant Miao = keccak256(abi.encodePacked("Miao"));
    bytes32 private constant Inscriptional_Parthian = keccak256(abi.encodePacked("Inscriptional_Parthian"));
    bytes32 private constant Rejang = keccak256(abi.encodePacked("Rejang"));
    bytes32 private constant Hanifi_Rohingya = keccak256(abi.encodePacked("Hanifi_Rohingya"));
    bytes32 private constant Runic = keccak256(abi.encodePacked("Runic"));
    bytes32 private constant Samaritan = keccak256(abi.encodePacked("Samaritan"));
    bytes32 private constant Old_South_Arabian = keccak256(abi.encodePacked("Old_South_Arabian"));
    bytes32 private constant Saurashtra = keccak256(abi.encodePacked("Saurashtra"));
    bytes32 private constant SignWriting = keccak256(abi.encodePacked("SignWriting"));
    bytes32 private constant Shavian = keccak256(abi.encodePacked("Shavian"));
    bytes32 private constant Sharada = keccak256(abi.encodePacked("Sharada"));
    bytes32 private constant Siddham = keccak256(abi.encodePacked("Siddham"));
    bytes32 private constant Sidetic = keccak256(abi.encodePacked("Sidetic"));
    bytes32 private constant Khudawadi = keccak256(abi.encodePacked("Khudawadi"));
    bytes32 private constant Sinhala = keccak256(abi.encodePacked("Sinhala"));
    bytes32 private constant Sogdian = keccak256(abi.encodePacked("Sogdian"));
    bytes32 private constant Old_Sogdian = keccak256(abi.encodePacked("Old_Sogdian"));
    bytes32 private constant Sora_Sompeng = keccak256(abi.encodePacked("Sora_Sompeng"));
    bytes32 private constant Soyombo = keccak256(abi.encodePacked("Soyombo"));
    bytes32 private constant Sundanese = keccak256(abi.encodePacked("Sundanese"));
    bytes32 private constant Sunuwar = keccak256(abi.encodePacked("Sunuwar"));
    bytes32 private constant Syloti_Nagri = keccak256(abi.encodePacked("Syloti_Nagri"));
    bytes32 private constant Syriac = keccak256(abi.encodePacked("Syriac"));
    bytes32 private constant Tagbanwa = keccak256(abi.encodePacked("Tagbanwa"));
    bytes32 private constant Takri = keccak256(abi.encodePacked("Takri"));
    bytes32 private constant Tai_Le = keccak256(abi.encodePacked("Tai_Le"));
    bytes32 private constant New_Tai_Lue = keccak256(abi.encodePacked("New_Tai_Lue"));
    bytes32 private constant Tamil = keccak256(abi.encodePacked("Tamil"));
    bytes32 private constant Tangut = keccak256(abi.encodePacked("Tangut"));
    bytes32 private constant Tai_Viet = keccak256(abi.encodePacked("Tai_Viet"));
    bytes32 private constant Tai_Yo = keccak256(abi.encodePacked("Tai_Yo"));
    bytes32 private constant Telugu = keccak256(abi.encodePacked("Telugu"));
    bytes32 private constant Tifinagh = keccak256(abi.encodePacked("Tifinagh"));
    bytes32 private constant Tagalog = keccak256(abi.encodePacked("Tagalog"));
    bytes32 private constant Thaana = keccak256(abi.encodePacked("Thaana"));
    bytes32 private constant Thai = keccak256(abi.encodePacked("Thai"));
    bytes32 private constant Tibetan = keccak256(abi.encodePacked("Tibetan"));
    bytes32 private constant Tirhuta = keccak256(abi.encodePacked("Tirhuta"));
    bytes32 private constant Tangsa = keccak256(abi.encodePacked("Tangsa"));
    bytes32 private constant Todhri = keccak256(abi.encodePacked("Todhri"));
    bytes32 private constant Tolong_Siki = keccak256(abi.encodePacked("Tolong_Siki"));
    bytes32 private constant Toto = keccak256(abi.encodePacked("Toto"));
    bytes32 private constant Tulu_Tigalari = keccak256(abi.encodePacked("Tulu_Tigalari"));
    bytes32 private constant Ugaritic = keccak256(abi.encodePacked("Ugaritic"));
    bytes32 private constant Vai = keccak256(abi.encodePacked("Vai"));
    bytes32 private constant Vithkuqi = keccak256(abi.encodePacked("Vithkuqi"));
    bytes32 private constant Warang_Citi = keccak256(abi.encodePacked("Warang_Citi"));
    bytes32 private constant Wancho = keccak256(abi.encodePacked("Wancho"));
    bytes32 private constant Old_Persian = keccak256(abi.encodePacked("Old_Persian"));
    bytes32 private constant Cuneiform = keccak256(abi.encodePacked("Cuneiform"));
    bytes32 private constant Yezidi = keccak256(abi.encodePacked("Yezidi"));
    bytes32 private constant Yi = keccak256(abi.encodePacked("Yi"));
    bytes32 private constant Zanabazar_Square = keccak256(abi.encodePacked("Zanabazar_Square"));
    bytes32 private constant Inherited = keccak256(abi.encodePacked("Inherited"));
    bytes32 private constant Common = keccak256(abi.encodePacked("Common"));
    bytes32 private constant Unknown = keccak256(abi.encodePacked("Unknown"));

    // Script-aliases: 175
    bytes32 private constant Adlm = keccak256(abi.encodePacked("Adlm"));
    bytes32 private constant Aghb = keccak256(abi.encodePacked("Aghb"));
    bytes32 private constant Arab = keccak256(abi.encodePacked("Arab"));
    bytes32 private constant Armi = keccak256(abi.encodePacked("Armi"));
    bytes32 private constant Armn = keccak256(abi.encodePacked("Armn"));
    bytes32 private constant Avst = keccak256(abi.encodePacked("Avst"));
    bytes32 private constant Bali = keccak256(abi.encodePacked("Bali"));
    bytes32 private constant Bamu = keccak256(abi.encodePacked("Bamu"));
    bytes32 private constant Bass = keccak256(abi.encodePacked("Bass"));
    bytes32 private constant Batk = keccak256(abi.encodePacked("Batk"));
    bytes32 private constant Beng = keccak256(abi.encodePacked("Beng"));
    bytes32 private constant Berf = keccak256(abi.encodePacked("Berf"));
    bytes32 private constant Bhks = keccak256(abi.encodePacked("Bhks"));
    bytes32 private constant Bopo = keccak256(abi.encodePacked("Bopo"));
    bytes32 private constant Brah = keccak256(abi.encodePacked("Brah"));
    bytes32 private constant Brai = keccak256(abi.encodePacked("Brai"));
    bytes32 private constant Bugi = keccak256(abi.encodePacked("Bugi"));
    bytes32 private constant Buhd = keccak256(abi.encodePacked("Buhd"));
    bytes32 private constant Cakm = keccak256(abi.encodePacked("Cakm"));
    bytes32 private constant Cans = keccak256(abi.encodePacked("Cans"));
    bytes32 private constant Cari = keccak256(abi.encodePacked("Cari"));
    bytes32 private constant Cher = keccak256(abi.encodePacked("Cher"));
    bytes32 private constant Chrs = keccak256(abi.encodePacked("Chrs"));
    bytes32 private constant Copt = keccak256(abi.encodePacked("Copt"));
    bytes32 private constant Cpmn = keccak256(abi.encodePacked("Cpmn"));
    bytes32 private constant Cprt = keccak256(abi.encodePacked("Cprt"));
    bytes32 private constant Cyrl = keccak256(abi.encodePacked("Cyrl"));
    bytes32 private constant Deva = keccak256(abi.encodePacked("Deva"));
    bytes32 private constant Diak = keccak256(abi.encodePacked("Diak"));
    bytes32 private constant Dogr = keccak256(abi.encodePacked("Dogr"));
    bytes32 private constant Dsrt = keccak256(abi.encodePacked("Dsrt"));
    bytes32 private constant Dupl = keccak256(abi.encodePacked("Dupl"));
    bytes32 private constant Egyp = keccak256(abi.encodePacked("Egyp"));
    bytes32 private constant Elba = keccak256(abi.encodePacked("Elba"));
    bytes32 private constant Elym = keccak256(abi.encodePacked("Elym"));
    bytes32 private constant Ethi = keccak256(abi.encodePacked("Ethi"));
    bytes32 private constant Gara = keccak256(abi.encodePacked("Gara"));
    bytes32 private constant Geor = keccak256(abi.encodePacked("Geor"));
    bytes32 private constant Glag = keccak256(abi.encodePacked("Glag"));
    bytes32 private constant Gong = keccak256(abi.encodePacked("Gong"));
    bytes32 private constant Gonm = keccak256(abi.encodePacked("Gonm"));
    bytes32 private constant Goth = keccak256(abi.encodePacked("Goth"));
    bytes32 private constant Gran = keccak256(abi.encodePacked("Gran"));
    bytes32 private constant Grek = keccak256(abi.encodePacked("Grek"));
    bytes32 private constant Gujr = keccak256(abi.encodePacked("Gujr"));
    bytes32 private constant Gukh = keccak256(abi.encodePacked("Gukh"));
    bytes32 private constant Guru = keccak256(abi.encodePacked("Guru"));
    bytes32 private constant Hang = keccak256(abi.encodePacked("Hang"));
    bytes32 private constant Hani = keccak256(abi.encodePacked("Hani"));
    bytes32 private constant Hano = keccak256(abi.encodePacked("Hano"));
    bytes32 private constant Hatr = keccak256(abi.encodePacked("Hatr"));
    bytes32 private constant Hebr = keccak256(abi.encodePacked("Hebr"));
    bytes32 private constant Hira = keccak256(abi.encodePacked("Hira"));
    bytes32 private constant Hluw = keccak256(abi.encodePacked("Hluw"));
    bytes32 private constant Hmng = keccak256(abi.encodePacked("Hmng"));
    bytes32 private constant Hmnp = keccak256(abi.encodePacked("Hmnp"));
    bytes32 private constant Hrkt = keccak256(abi.encodePacked("Hrkt"));
    bytes32 private constant Hung = keccak256(abi.encodePacked("Hung"));
    bytes32 private constant Ital = keccak256(abi.encodePacked("Ital"));
    bytes32 private constant Java = keccak256(abi.encodePacked("Java"));
    bytes32 private constant Kali = keccak256(abi.encodePacked("Kali"));
    bytes32 private constant Kana = keccak256(abi.encodePacked("Kana"));
    bytes32 private constant Khar = keccak256(abi.encodePacked("Khar"));
    bytes32 private constant Khmr = keccak256(abi.encodePacked("Khmr"));
    bytes32 private constant Khoj = keccak256(abi.encodePacked("Khoj"));
    bytes32 private constant Kits = keccak256(abi.encodePacked("Kits"));
    bytes32 private constant Knda = keccak256(abi.encodePacked("Knda"));
    bytes32 private constant Krai = keccak256(abi.encodePacked("Krai"));
    bytes32 private constant Kthi = keccak256(abi.encodePacked("Kthi"));
    bytes32 private constant Lana = keccak256(abi.encodePacked("Lana"));
    bytes32 private constant Laoo = keccak256(abi.encodePacked("Laoo"));
    bytes32 private constant Latn = keccak256(abi.encodePacked("Latn"));
    bytes32 private constant Lepc = keccak256(abi.encodePacked("Lepc"));
    bytes32 private constant Limb = keccak256(abi.encodePacked("Limb"));
    bytes32 private constant Lina = keccak256(abi.encodePacked("Lina"));
    bytes32 private constant Linb = keccak256(abi.encodePacked("Linb"));
    bytes32 private constant Lyci = keccak256(abi.encodePacked("Lyci"));
    bytes32 private constant Lydi = keccak256(abi.encodePacked("Lydi"));
    bytes32 private constant Mahj = keccak256(abi.encodePacked("Mahj"));
    bytes32 private constant Maka = keccak256(abi.encodePacked("Maka"));
    bytes32 private constant Mand = keccak256(abi.encodePacked("Mand"));
    // @typo-fix: sc ; Mani                             ; Manichaean
    bytes32 private constant Mansi = keccak256(abi.encodePacked("Mansi"));
    bytes32 private constant Marc = keccak256(abi.encodePacked("Marc"));
    bytes32 private constant Medf = keccak256(abi.encodePacked("Medf"));
    bytes32 private constant Mend = keccak256(abi.encodePacked("Mend"));
    bytes32 private constant Merc = keccak256(abi.encodePacked("Merc"));
    bytes32 private constant Mero = keccak256(abi.encodePacked("Mero"));
    bytes32 private constant Mlym = keccak256(abi.encodePacked("Mlym"));
    bytes32 private constant Mong = keccak256(abi.encodePacked("Mong"));
    bytes32 private constant Mroo = keccak256(abi.encodePacked("Mroo"));
    bytes32 private constant Mtei = keccak256(abi.encodePacked("Mtei"));
    bytes32 private constant Mult = keccak256(abi.encodePacked("Mult"));
    bytes32 private constant Mymr = keccak256(abi.encodePacked("Mymr"));
    bytes32 private constant Nagm = keccak256(abi.encodePacked("Nagm"));
    bytes32 private constant Nand = keccak256(abi.encodePacked("Nand"));
    bytes32 private constant Narb = keccak256(abi.encodePacked("Narb"));
    bytes32 private constant Nbat = keccak256(abi.encodePacked("Nbat"));
    bytes32 private constant Nkoo = keccak256(abi.encodePacked("Nkoo"));
    bytes32 private constant Nshu = keccak256(abi.encodePacked("Nshu"));
    bytes32 private constant Ogam = keccak256(abi.encodePacked("Ogam"));
    bytes32 private constant Olck = keccak256(abi.encodePacked("Olck"));
    bytes32 private constant Onao = keccak256(abi.encodePacked("Onao"));
    bytes32 private constant Orkh = keccak256(abi.encodePacked("Orkh"));
    bytes32 private constant Orya = keccak256(abi.encodePacked("Orya"));
    bytes32 private constant Osge = keccak256(abi.encodePacked("Osge"));
    bytes32 private constant Osma = keccak256(abi.encodePacked("Osma"));
    bytes32 private constant Ougr = keccak256(abi.encodePacked("Ougr"));
    bytes32 private constant Palm = keccak256(abi.encodePacked("Palm"));
    bytes32 private constant Pauc = keccak256(abi.encodePacked("Pauc"));
    bytes32 private constant Perm = keccak256(abi.encodePacked("Perm"));
    bytes32 private constant Phag = keccak256(abi.encodePacked("Phag"));
    bytes32 private constant Phli = keccak256(abi.encodePacked("Phli"));
    bytes32 private constant Phlp = keccak256(abi.encodePacked("Phlp"));
    bytes32 private constant Phnx = keccak256(abi.encodePacked("Phnx"));
    bytes32 private constant Plrd = keccak256(abi.encodePacked("Plrd"));
    bytes32 private constant Prti = keccak256(abi.encodePacked("Prti"));
    bytes32 private constant Rjng = keccak256(abi.encodePacked("Rjng"));
    bytes32 private constant Rohg = keccak256(abi.encodePacked("Rohg"));
    bytes32 private constant Runr = keccak256(abi.encodePacked("Runr"));
    bytes32 private constant Samr = keccak256(abi.encodePacked("Samr"));
    bytes32 private constant Sarb = keccak256(abi.encodePacked("Sarb"));
    bytes32 private constant Saur = keccak256(abi.encodePacked("Saur"));
    bytes32 private constant Sgnw = keccak256(abi.encodePacked("Sgnw"));
    bytes32 private constant Shaw = keccak256(abi.encodePacked("Shaw"));
    bytes32 private constant Shrd = keccak256(abi.encodePacked("Shrd"));
    bytes32 private constant Sidd = keccak256(abi.encodePacked("Sidd"));
    bytes32 private constant Sidt = keccak256(abi.encodePacked("Sidt"));
    bytes32 private constant Sind = keccak256(abi.encodePacked("Sind"));
    bytes32 private constant Sinh = keccak256(abi.encodePacked("Sinh"));
    bytes32 private constant Sogd = keccak256(abi.encodePacked("Sogd"));
    bytes32 private constant Sogo = keccak256(abi.encodePacked("Sogo"));
    bytes32 private constant Sora = keccak256(abi.encodePacked("Sora"));
    bytes32 private constant Soyo = keccak256(abi.encodePacked("Soyo"));
    bytes32 private constant Sund = keccak256(abi.encodePacked("Sund"));
    bytes32 private constant Sunu = keccak256(abi.encodePacked("Sunu"));
    bytes32 private constant Sylo = keccak256(abi.encodePacked("Sylo"));
    bytes32 private constant Syrc = keccak256(abi.encodePacked("Syrc"));
    bytes32 private constant Tagb = keccak256(abi.encodePacked("Tagb"));
    bytes32 private constant Takr = keccak256(abi.encodePacked("Takr"));
    bytes32 private constant Tale = keccak256(abi.encodePacked("Tale"));
    bytes32 private constant Talu = keccak256(abi.encodePacked("Talu"));
    bytes32 private constant Taml = keccak256(abi.encodePacked("Taml"));
    bytes32 private constant Tang = keccak256(abi.encodePacked("Tang"));
    bytes32 private constant Tavt = keccak256(abi.encodePacked("Tavt"));
    bytes32 private constant Tayo = keccak256(abi.encodePacked("Tayo"));
    bytes32 private constant Telu = keccak256(abi.encodePacked("Telu"));
    bytes32 private constant Tfng = keccak256(abi.encodePacked("Tfng"));
    bytes32 private constant Tglg = keccak256(abi.encodePacked("Tglg"));
    bytes32 private constant Thaa = keccak256(abi.encodePacked("Thaa"));
    bytes32 private constant Tibt = keccak256(abi.encodePacked("Tibt"));
    bytes32 private constant Tirh = keccak256(abi.encodePacked("Tirh"));
    bytes32 private constant Tnsa = keccak256(abi.encodePacked("Tnsa"));
    bytes32 private constant Todr = keccak256(abi.encodePacked("Todr"));
    bytes32 private constant Tols = keccak256(abi.encodePacked("Tols"));
    bytes32 private constant Tutg = keccak256(abi.encodePacked("Tutg"));
    bytes32 private constant Ugar = keccak256(abi.encodePacked("Ugar"));
    bytes32 private constant Vaii = keccak256(abi.encodePacked("Vaii"));
    bytes32 private constant Vith = keccak256(abi.encodePacked("Vith"));
    bytes32 private constant Wara = keccak256(abi.encodePacked("Wara"));
    bytes32 private constant Wcho = keccak256(abi.encodePacked("Wcho"));
    bytes32 private constant Xpeo = keccak256(abi.encodePacked("Xpeo"));
    bytes32 private constant Xsux = keccak256(abi.encodePacked("Xsux"));
    bytes32 private constant Yezi = keccak256(abi.encodePacked("Yezi"));
    bytes32 private constant Yiii = keccak256(abi.encodePacked("Yiii"));
    bytes32 private constant Zanb = keccak256(abi.encodePacked("Zanb"));
    bytes32 private constant Zinh = keccak256(abi.encodePacked("Zinh"));
    bytes32 private constant Zyyy = keccak256(abi.encodePacked("Zyyy"));
    bytes32 private constant Zzzz = keccak256(abi.encodePacked("Zzzz"));

    // Binary: 59
    bytes32 private constant Alphabetic = keccak256(abi.encodePacked("Alphabetic"));
    bytes32 private constant Alpha = keccak256(abi.encodePacked("Alpha"));
    bytes32 private constant ASCII_Hex_Digit = keccak256(abi.encodePacked("ASCII_Hex_Digit"));
    bytes32 private constant AHex = keccak256(abi.encodePacked("AHex"));
    bytes32 private constant Bidi_Control = keccak256(abi.encodePacked("Bidi_Control"));
    bytes32 private constant Bidi_C = keccak256(abi.encodePacked("Bidi_C"));
    bytes32 private constant Case_Ignorable = keccak256(abi.encodePacked("Case_Ignorable"));
    bytes32 private constant CI = keccak256(abi.encodePacked("CI"));
    bytes32 private constant Cased = keccak256(abi.encodePacked("Cased"));
    bytes32 private constant Changes_When_Casefolded = keccak256(abi.encodePacked("Changes_When_Casefolded"));
    bytes32 private constant CWCF = keccak256(abi.encodePacked("CWCF"));
    bytes32 private constant Changes_When_Casemapped = keccak256(abi.encodePacked("Changes_When_Casemapped"));
    bytes32 private constant CWCM = keccak256(abi.encodePacked("CWCM"));
    bytes32 private constant Changes_When_Lowercased = keccak256(abi.encodePacked("Changes_When_Lowercased"));
    bytes32 private constant CWL = keccak256(abi.encodePacked("CWL"));
    bytes32 private constant Changes_When_NFKC_Casefolded = keccak256(abi.encodePacked("Changes_When_NFKC_Casefolded"));
    bytes32 private constant CWKCF = keccak256(abi.encodePacked("CWKCF"));
    bytes32 private constant Changes_When_Titlecased = keccak256(abi.encodePacked("Changes_When_Titlecased"));
    bytes32 private constant CWT = keccak256(abi.encodePacked("CWT"));
    bytes32 private constant Changes_When_Uppercased = keccak256(abi.encodePacked("Changes_When_Uppercased"));
    bytes32 private constant CWU = keccak256(abi.encodePacked("CWU"));
    bytes32 private constant Dash = keccak256(abi.encodePacked("Dash"));
    bytes32 private constant Default_Ignorable_Code_Point = keccak256(abi.encodePacked("Default_Ignorable_Code_Point"));
    bytes32 private constant DI = keccak256(abi.encodePacked("DI"));
    bytes32 private constant Default_Ignorable = keccak256(abi.encodePacked("Default_Ignorable"));
    bytes32 private constant Deprecated = keccak256(abi.encodePacked("Deprecated"));
    bytes32 private constant Dep = keccak256(abi.encodePacked("Dep"));
    bytes32 private constant Diacritic = keccak256(abi.encodePacked("Diacritic"));
    bytes32 private constant Dia = keccak256(abi.encodePacked("Dia"));
    bytes32 private constant Emoji = keccak256(abi.encodePacked("Emoji"));
    bytes32 private constant Emoji_Component = keccak256(abi.encodePacked("Emoji_Component"));
    bytes32 private constant Emoji_Modifier = keccak256(abi.encodePacked("Emoji_Modifier"));
    bytes32 private constant Emoji_Modifier_Base = keccak256(abi.encodePacked("Emoji_Modifier_Base"));
    bytes32 private constant Emoji_Presentation = keccak256(abi.encodePacked("Emoji_Presentation"));
    bytes32 private constant Extended_Pictographic = keccak256(abi.encodePacked("Extended_Pictographic"));
    bytes32 private constant ExtPict = keccak256(abi.encodePacked("ExtPict"));
    bytes32 private constant Extender = keccak256(abi.encodePacked("Extender"));
    bytes32 private constant Ext = keccak256(abi.encodePacked("Ext"));
    bytes32 private constant Full_Composition_Exclusion = keccak256(abi.encodePacked("Full_Composition_Exclusion"));
    bytes32 private constant Comp_Ex = keccak256(abi.encodePacked("Comp_Ex"));
    bytes32 private constant Grapheme_Base = keccak256(abi.encodePacked("Grapheme_Base"));
    bytes32 private constant Gr_Base = keccak256(abi.encodePacked("Gr_Base"));
    bytes32 private constant Grapheme_Extend = keccak256(abi.encodePacked("Grapheme_Extend"));
    bytes32 private constant Gr_Ext = keccak256(abi.encodePacked("Gr_Ext"));
    bytes32 private constant Grapheme_Link = keccak256(abi.encodePacked("Grapheme_Link"));
    bytes32 private constant Gr_Link = keccak256(abi.encodePacked("Gr_Link"));
    bytes32 private constant Hex_Digit = keccak256(abi.encodePacked("Hex_Digit"));
    bytes32 private constant Hex = keccak256(abi.encodePacked("Hex"));
    bytes32 private constant Hyphen = keccak256(abi.encodePacked("Hyphen"));
    bytes32 private constant ID_Continue = keccak256(abi.encodePacked("ID_Continue"));
    bytes32 private constant IDC = keccak256(abi.encodePacked("IDC"));
    bytes32 private constant ID_Start = keccak256(abi.encodePacked("ID_Start"));
    bytes32 private constant IDS = keccak256(abi.encodePacked("IDS"));
    bytes32 private constant Ideographic = keccak256(abi.encodePacked("Ideographic"));
    bytes32 private constant Ideo = keccak256(abi.encodePacked("Ideo"));
    bytes32 private constant IDS_Binary_Operator = keccak256(abi.encodePacked("IDS_Binary_Operator"));
    bytes32 private constant IDS_BinOp = keccak256(abi.encodePacked("IDS_BinOp"));
    bytes32 private constant IDS_Trinary_Operator = keccak256(abi.encodePacked("IDS_Trinary_Operator"));
    bytes32 private constant IDS_TrinOp = keccak256(abi.encodePacked("IDS_TrinOp"));
    bytes32 private constant Join_Control = keccak256(abi.encodePacked("Join_Control"));
    bytes32 private constant Join_C = keccak256(abi.encodePacked("Join_C"));
    bytes32 private constant Logical_Order_Exception = keccak256(abi.encodePacked("Logical_Order_Exception"));
    bytes32 private constant LOE = keccak256(abi.encodePacked("LOE"));
    bytes32 private constant Lowercase = keccak256(abi.encodePacked("Lowercase"));
    bytes32 private constant Lower = keccak256(abi.encodePacked("Lower"));
    bytes32 private constant Math = keccak256(abi.encodePacked("Math"));
    bytes32 private constant Noncharacter_Code_Point = keccak256(abi.encodePacked("Noncharacter_Code_Point"));
    bytes32 private constant NChar = keccak256(abi.encodePacked("NChar"));
    bytes32 private constant Other_Alphabetic = keccak256(abi.encodePacked("Other_Alphabetic"));
    bytes32 private constant OAlpha = keccak256(abi.encodePacked("OAlpha"));
    bytes32 private constant Other_Default_Ignorable_Code_Point =
        keccak256(abi.encodePacked("Other_Default_Ignorable_Code_Point"));
    bytes32 private constant ODI = keccak256(abi.encodePacked("ODI"));
    bytes32 private constant Other_Grapheme_Extend = keccak256(abi.encodePacked("Other_Grapheme_Extend"));
    bytes32 private constant OGr_Ext = keccak256(abi.encodePacked("OGr_Ext"));
    bytes32 private constant Other_ID_Continue = keccak256(abi.encodePacked("Other_ID_Continue"));
    bytes32 private constant OIDC = keccak256(abi.encodePacked("OIDC"));
    bytes32 private constant Other_ID_Start = keccak256(abi.encodePacked("Other_ID_Start"));
    bytes32 private constant OIDS = keccak256(abi.encodePacked("OIDS"));
    bytes32 private constant Other_Lowercase = keccak256(abi.encodePacked("Other_Lowercase"));
    bytes32 private constant OLower = keccak256(abi.encodePacked("OLower"));
    bytes32 private constant Other_Math = keccak256(abi.encodePacked("Other_Math"));
    bytes32 private constant OMath = keccak256(abi.encodePacked("OMath"));
    bytes32 private constant Other_Uppercase = keccak256(abi.encodePacked("Other_Uppercase"));
    bytes32 private constant OUpper = keccak256(abi.encodePacked("OUpper"));
    bytes32 private constant Pattern_Syntax = keccak256(abi.encodePacked("Pattern_Syntax"));
    bytes32 private constant Pat_Syn = keccak256(abi.encodePacked("Pat_Syn"));
    bytes32 private constant Pattern_White_Space = keccak256(abi.encodePacked("Pattern_White_Space"));
    bytes32 private constant Pat_WS = keccak256(abi.encodePacked("Pat_WS"));
    bytes32 private constant Prepended_Concatenation_Mark = keccak256(abi.encodePacked("Prepended_Concatenation_Mark"));
    bytes32 private constant PCM = keccak256(abi.encodePacked("PCM"));
    bytes32 private constant Quotation_Mark = keccak256(abi.encodePacked("Quotation_Mark"));
    bytes32 private constant QMark = keccak256(abi.encodePacked("QMark"));
    bytes32 private constant Radical = keccak256(abi.encodePacked("Radical"));
    bytes32 private constant Regional_Indicator = keccak256(abi.encodePacked("Regional_Indicator"));
    bytes32 private constant RI = keccak256(abi.encodePacked("RI"));
    bytes32 private constant Sentence_Terminal = keccak256(abi.encodePacked("Sentence_Terminal"));
    bytes32 private constant STerm = keccak256(abi.encodePacked("STerm"));
    bytes32 private constant Soft_Dotted = keccak256(abi.encodePacked("Soft_Dotted"));
    bytes32 private constant SD = keccak256(abi.encodePacked("SD"));
    bytes32 private constant Terminal_Punctuation = keccak256(abi.encodePacked("Terminal_Punctuation"));
    bytes32 private constant Term = keccak256(abi.encodePacked("Term"));
    bytes32 private constant Unified_Ideograph = keccak256(abi.encodePacked("Unified_Ideograph"));
    bytes32 private constant UIdeo = keccak256(abi.encodePacked("UIdeo"));
    bytes32 private constant Uppercase = keccak256(abi.encodePacked("Uppercase"));
    bytes32 private constant Upper = keccak256(abi.encodePacked("Upper"));
    bytes32 private constant Variation_Selector = keccak256(abi.encodePacked("Variation_Selector"));
    bytes32 private constant VS = keccak256(abi.encodePacked("VS"));
    bytes32 private constant White_Space = keccak256(abi.encodePacked("White_Space"));
    bytes32 private constant WS = keccak256(abi.encodePacked("WS"));
    bytes32 private constant space = keccak256(abi.encodePacked("space"));

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
        bytes1 patternFlag = patternInBytes[patternInBytes.length - 1];
        bytes memory filteredPatternInBytes =
            trimString(patternInBytes, 1, int256(patternInBytes.length - (patternFlag != 0x2f ? 3 : 2)));

        nuclearFission(filteredPatternInBytes, patternFlag);
    }

    function nuclearFission(bytes memory _pattern, bytes1 _patternFlag) private pure {
        int256 patternLength = int256(_pattern.length);
        for (int256 particleIdx = 0; particleIdx < patternLength;) {
            (bytes memory atom, bytes32 atomType, int256 atomEndIdx) =
                classifyAtom(_pattern, uint256(particleIdx), _patternFlag);

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

    function classifyAtom(bytes memory _pattern, uint256 _currentParticleIdx, bytes1 _patternFlag)
        private
        pure
        returns (bytes memory, bytes32, int256)
    {
        bytes memory atom;
        bool isTrue;
        uint256 atomLastIdx;
        bytes32 atomType;

        (isTrue, atomType, atomLastIdx) = atomIdClassifier(_pattern, _currentParticleIdx, _patternFlag);

        if (isTrue) {
            atom = trimString(_pattern, _currentParticleIdx, int256(atomLastIdx));
            // console2.log("---In classifyAtom---");
            // console2.log("atom: ", string(atom));
            // console2.log("atomLastIdx: ", atomLastIdx);
            // console2.log("atomLastIdx cast: ", int256(atomLastIdx));
            // console2.log("---");
            return (atom, atomType, int256(atomLastIdx));
        }

        return (atom, atomType, int256(atomLastIdx));
    }

    function atomIdClassifier(bytes memory _pattern, uint256 _currentParticleIdx, bytes1 _patternFlag)
        private
        pure
        returns (bool, bytes32, uint256)
    {
        (bool flag, bytes32 atomType, uint256 lastMatchedParticleIndex) =
            isLiteralAtom(_pattern, _currentParticleIdx, _patternFlag, false);

        if (!flag) {
            (flag, atomType, lastMatchedParticleIndex) = isCharacterClass(_pattern, _currentParticleIdx, _patternFlag);
        }

        if (!flag) {
            (flag, atomType, lastMatchedParticleIndex) = isGroup(_pattern, _currentParticleIdx, _patternFlag);
        }

        if (flag && _pattern.length - 1 >= lastMatchedParticleIndex + 1) {
            (flag, atomType, lastMatchedParticleIndex) =
                isGreedyQuantifierAtom(_pattern, lastMatchedParticleIndex + 1, atomType);
            if (flag && _pattern.length - 1 >= lastMatchedParticleIndex + 1) {
                // console2.log("Yes it has a greedy quantifier atom");
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
                        // console2.log("Flag under lazy: ", flag);
                        if (flag) {
                            // console2.log("Yes flag is true under lazy, expecting a revert...");
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
                    // console2.log("Flag: ", flag);
                    if (flag) {
                        // console2.log("Yes flag is true, expecting a revert...");
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
            // console2.log("flag for jackless greedy quantifier atom.............");
            // console2.log("flag: ", flag);
            // console2.log("lastMatchedParticleIndex: ", lastMatchedParticleIndex);
            // console2.log("---");
            if (flag) {
                string memory errorMsg = string(
                    abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern, ": Nothing to repeat")
                );
                revert(errorMsg);
            }
        }

        return (flag, atomType, lastMatchedParticleIndex);
    }

    function isLiteralAtom(
        bytes memory _pattern,
        uint256 _currentParticleIdx,
        bytes1 _patternFlag,
        bool fromCharacterClass
    ) private pure returns (bool, bytes32, uint256) {
        bytes32 atomType = INVALID_ATOM;
        uint256 lastMatchedParticleIndex = _currentParticleIdx;
        bytes1 targetChar = _pattern[_currentParticleIdx];

        bool flag = isSmallAlphabet(targetChar);

        if (!flag) {
            flag = isPunctuation(targetChar);
        }

        if (!flag) {
            flag = isBigAlphabet(targetChar);
        }

        if (!flag) {
            (flag, lastMatchedParticleIndex) =
                isEscapeLiteral(_pattern, _currentParticleIdx, _patternFlag, fromCharacterClass);

            if (flag) {
                atomType = isCommonEscapes(_pattern, _currentParticleIdx, lastMatchedParticleIndex, _patternFlag);
                if (atomType == INVALID_ATOM) {
                    atomType = nullOctalOrDigitBackReference(
                        _pattern, _currentParticleIdx, lastMatchedParticleIndex, _patternFlag
                    );
                }
            }
        }

        if (!flag) {
            if (uint8(targetChar) == DOT) {
                flag = true;
                atomType = DOT_ATOM;
                lastMatchedParticleIndex = _currentParticleIdx;
            }
        }

        if (!flag) {
            (flag, atomType, lastMatchedParticleIndex) = isDollarOrCaretAnchor(_pattern, _currentParticleIdx);
        }

        if (!flag) {
            if (uint8(targetChar) == VERTICAL_BAR) {
                flag = true;
                atomType = ALTERNATION_OPERATOR;
                lastMatchedParticleIndex = _currentParticleIdx;
            }
        }

        if (!flag) {
            if (uint8(targetChar) == CLOSE_SQUARE_BRACKET) {
                if (uint8(_patternFlag) == SMALL_u) {
                    string memory errorMsg = string(
                        abi.encodePacked(
                            "SyntaxError: Invalid regular expression: /", _pattern, "/u: Lone Character class brackets"
                        )
                    );
                    revert(errorMsg);
                }
                flag = true;
                atomType = LITERAL_ATOM;
                lastMatchedParticleIndex = _currentParticleIdx;
            }
        }

        if (!flag) {
            (flag, lastMatchedParticleIndex) = isRangeLiteral(_pattern, _currentParticleIdx, _patternFlag);

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

        if (!flag) {
            if (isDigit(targetChar, false)) {
                flag = true;
                atomType = LITERAL_ATOM;
                lastMatchedParticleIndex = _currentParticleIdx;
            }
        }

        // console2.log("---In isLiteralAtom---");
        // console2.log("flag: ", flag);
        // console2.log("lastMatchedParticleIndex: ", lastMatchedParticleIndex);
        // console2.log("---");

        return (flag, atomType, lastMatchedParticleIndex);
    }

    function nullOctalOrDigitBackReference(
        bytes memory _pattern,
        uint256 _currentParticleIdx,
        uint256 lastMatchedParticleIndex,
        bytes1 _patternFlag
    ) private pure returns (bytes32) {
        bytes32 atomType = LITERAL_ATOM;

        // @note: bad design choice
        if (
            _currentParticleIdx + 1 <= lastMatchedParticleIndex && isDigit(_pattern[_currentParticleIdx + 1], false)
                && isDigit(_pattern[lastMatchedParticleIndex], false)
        ) {
            bool isOctal = true;

            (isOctal, lastMatchedParticleIndex) = validateBackslash_octal_digit(_pattern, _currentParticleIdx + 1);

            if (!isOctal) {
                if (uint8(_patternFlag) != SMALL_u) {
                    if (
                        _currentParticleIdx + 1 <= lastMatchedParticleIndex
                            && ((_pattern[_currentParticleIdx + 1] == 0x00
                                    && _pattern[lastMatchedParticleIndex] == 0x00)
                                || (_pattern[_currentParticleIdx + 1] == 0x30
                                    && _pattern[lastMatchedParticleIndex] == 0x30))
                    ) {
                        atomType = NULL_CHARACTER;
                    } else {
                        atomType = DIGIT_BACKREFERENCE_PREFIX;
                    }
                } else if (
                    uint8(_patternFlag) == SMALL_u
                        && uint8(_pattern[_currentParticleIdx + 1]) == uint8(abi.encodePacked("0")[0])
                ) {
                    string memory errorMsg = string(
                        abi.encodePacked(
                            "SyntaxError: Invalid regular expression: /", _pattern, "/u: Invalid decimal escape"
                        )
                    );
                    revert(errorMsg);
                } else if (
                    uint8(_patternFlag) == SMALL_u
                        && uint8(_pattern[_currentParticleIdx + 1]) >= uint8(abi.encodePacked("1")[0])
                        && uint8(_pattern[_currentParticleIdx + 1]) <= uint8(abi.encodePacked("9")[0])
                ) {
                    // @TODO: backreference check and validation remains
                    string memory errorMsg = string(
                        abi.encodePacked("SyntaxError: Invalid regular expression: /", _pattern, "/u: Invalid escape")
                    );
                    revert(errorMsg);
                }
            } else {
                if (uint8(_patternFlag) != SMALL_u) {
                    atomType = OCTAL;
                } else if (
                    uint8(_patternFlag) == SMALL_u
                        && uint8(_pattern[_currentParticleIdx + 1]) == uint8(abi.encodePacked("0")[0])
                ) {
                    string memory errorMsg = string(
                        abi.encodePacked(
                            "SyntaxError: Invalid regular expression: /", _pattern, "/u: Invalid decimal escape"
                        )
                    );
                    revert(errorMsg);
                } else if (
                    uint8(_patternFlag) == SMALL_u
                        && uint8(_pattern[_currentParticleIdx + 1]) >= uint8(abi.encodePacked("1")[0])
                        && uint8(_pattern[_currentParticleIdx + 1]) <= uint8(abi.encodePacked("9")[0])
                ) {
                    // @TODO: backreference check and validation remains
                    string memory errorMsg = string(
                        abi.encodePacked("SyntaxError: Invalid regular expression: /", _pattern, "/u: Invalid escape")
                    );
                    revert(errorMsg);
                }
            }
        }

        return atomType;
    }

    function isCommonEscapes(
        bytes memory _pattern,
        uint256 _currentParticleIdx,
        uint256 lastMatchedParticleIndex,
        bytes1 _patternFlag
    ) private pure returns (bytes32) {
        bytes32 atomType = INVALID_ATOM;
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
            _currentParticleIdx + 1 == lastMatchedParticleIndex && uint8(_pattern[_currentParticleIdx]) == BACK_SLASH
                && !isDigit(_pattern[_currentParticleIdx + 1], false)
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
            } else {
                if (
                    uint8(_patternFlag) == SMALL_u
                        && (lastMatchedParticle != CARET_SIGN
                            || lastMatchedParticle != DOLLAR_SIGN
                            || lastMatchedParticle != BACK_SLASH
                            || lastMatchedParticle != DOT
                            || lastMatchedParticle != ASTERISK
                            || lastMatchedParticle != PLUS_SIGN
                            || lastMatchedParticle != QUESTION_MARK
                            || lastMatchedParticle != OPEN_PARANTHESIS
                            || lastMatchedParticle != CLOSE_PARANTHESIS
                            || lastMatchedParticle != OPEN_SQUARE_BRACKET
                            || lastMatchedParticle != CLOSE_SQUARE_BRACKET
                            || lastMatchedParticle != OPEN_CURLY_BRACE
                            || lastMatchedParticle != VERTICAL_BAR
                            || lastMatchedParticle != FORWARD_SLASH)
                ) {
                    string memory errorMsg = string(
                        abi.encodePacked("SyntaxError: Invalid regular expression: /", _pattern, "/u: Invalid escape")
                    );
                    revert(errorMsg);
                }
                atomType = LITERAL_ATOM;
            }
        }

        return atomType;
    }

    function isCharacterClass(bytes memory _pattern, uint256 _currentParticleIndex, bytes1 _patternFlag)
        internal
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
                            "SyntaxError: Invalid regular expression: /",
                            _pattern,
                            "/",
                            _patternFlag == 0x2f ? bytes1(0) : _patternFlag,
                            ": Empty Character class"
                        )
                    );
                    revert(errorMsg);
                }
            }

            if (_pattern.length < 3 && uint8(_pattern[1]) != CLOSE_SQUARE_BRACKET) {
                string memory errorMsg = string(
                    abi.encodePacked(
                        "SyntaxError: Invalid regular expression: /",
                        _pattern,
                        "/",
                        _patternFlag == 0x2f ? bytes1(0) : _patternFlag,
                        ": Unterminated Character class"
                    )
                );
                revert(errorMsg);
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
                            "SyntaxError: Invalid regular expression: /",
                            _pattern,
                            "/",
                            _patternFlag == 0x2f ? bytes1(0) : _patternFlag,
                            ": Unterminated Character class"
                        )
                    );
                    revert(errorMsg);
                }
            }
        }

        if (flag && lastMatchedParticleIndex > _currentParticleIndex) {
            flag = characterClassValidator(_pattern, _currentParticleIndex, lastMatchedParticleIndex, _patternFlag);
            if (flag) {
                return (true, CHARACTER_CLASS_ATOM, lastMatchedParticleIndex);
            }
        }

        return (false, INVALID_ATOM, 0);
    }

    function characterClassValidator(
        bytes memory _pattern,
        uint256 _currentParticleIndex,
        uint256 lastMatchedParticleIndex,
        bytes1 _patternFlag
    ) private pure returns (bool) {
        // bool isValid = isValidCharacterClass(_pattern, _currentParticleIndex, lastMatchedParticleIndex, _patternFlag);
        isValidCharacterClassLiteral(_pattern, _currentParticleIndex, lastMatchedParticleIndex, _patternFlag);

        // bool rangeFlag;
        // for (uint256 i = _currentParticleIndex + 2; i < lastMatchedParticleIndex - 1; i++) {
        //     if (uint8(_pattern[i]) == MINUS_SIGN && !rangeFlag) {
        //         if (uint8(_pattern[i - 1]) != BACK_SLASH || uint8(_pattern[i - 2]) == BACK_SLASH) {
        //             if ((uint8(_pattern[i + 1]) != BACK_SLASH || uint8(_pattern[i + 2]) == BACK_SLASH)) {
        //                 bool flag;
        //                 uint256 firstUnicodeIndex;
        //                 uint256 lastUnicodeIndex;
        //                 if (uint8(_pattern[i - 1]) != BACK_SLASH) {
        //                     if (i >= 5 && _currentParticleIndex < i - 5) {
        //                         firstUnicodeIndex = i - 5;
        //                         (flag, lastUnicodeIndex) = fUnicodeRange(_pattern, firstUnicodeIndex);
        //                     } else if (i >= 4 && _currentParticleIndex < i - 4) {
        //                         firstUnicodeIndex = i - 4;
        //                         (flag, lastUnicodeIndex) = eUnicodeRange(_pattern, firstUnicodeIndex);
        //                     } else if (i >= 3 && _currentParticleIndex < i - 3) {
        //                         firstUnicodeIndex = i - 3;
        //                         (flag, lastUnicodeIndex) = cUnicodeRange(_pattern, firstUnicodeIndex);
        //                         if (!flag) {
        //                             (flag, lastUnicodeIndex) = dUnicodeRange(_pattern, firstUnicodeIndex);
        //                         }
        //                     }
        //                 }

        //                 uint256 leftAtomDecimal;
        //                 if (flag) {
        //                     bytes memory unicodeHex =
        //                         utf8HexToUnicodeHex(trimString(_pattern, firstUnicodeIndex, int256(lastUnicodeIndex)));
        //                     leftAtomDecimal = hexToDec(unicodeHex, 8, false);
        //                 } else {
        //                     leftAtomDecimal = uint8(_pattern[i - 1]);
        //                 }

        //                 if (uint8(_pattern[i + 1]) != BACK_SLASH) {
        //                     firstUnicodeIndex = i + 1;
        //                     flag = false;
        //                     if (i + 5 < lastMatchedParticleIndex) {
        //                         (flag, lastUnicodeIndex) = fUnicodeRange(_pattern, firstUnicodeIndex);
        //                     } else if (i + 4 < lastMatchedParticleIndex) {
        //                         (flag, lastUnicodeIndex) = eUnicodeRange(_pattern, firstUnicodeIndex);
        //                     } else if (i + 3 < lastMatchedParticleIndex) {
        //                         (flag, lastUnicodeIndex) = cUnicodeRange(_pattern, firstUnicodeIndex);
        //                         if (!flag) {
        //                             (flag, lastUnicodeIndex) = dUnicodeRange(_pattern, firstUnicodeIndex);
        //                         }
        //                     }
        //                 }

        //                 uint256 rightAtomDecimal;
        //                 if (flag) {
        //                     bytes memory unicodeHex =
        //                         utf8HexToUnicodeHex(trimString(_pattern, firstUnicodeIndex, int256(lastUnicodeIndex)));
        //                     rightAtomDecimal = hexToDec(unicodeHex, 8, false);
        //                 } else {
        //                     rightAtomDecimal = uint8(_pattern[i + 1]);
        //                 }

        //                 if (leftAtomDecimal > rightAtomDecimal) {
        //                     string memory errorMsg = string(
        //                         abi.encodePacked(
        //                             "SyntaxError: Invalid regular expression: /",
        //                             _pattern,
        //                             "/",
        //                             _patternFlag == 0x2f ? bytes1(0) : _patternFlag,
        //                             ": Range out of order in character class"
        //                         )
        //                     );
        //                     revert(errorMsg);
        //                 }
        //             }
        //         }
        //         i += 1;
        //         rangeFlag = true;
        //     } else {
        //         rangeFlag = false;
        //     }
        // }

        // for (uint256 i = _currentParticleIndex + 1; i < lastMatchedParticleIndex; i++) {
        //     if (uint8(_pattern[i]) == BACK_SLASH) {
        //         if (
        //             uint8(_pattern[i + 1]) == uint8(abi.encodePacked("p")[0])
        //                 || uint8(_pattern[i + 1]) == uint8(abi.encodePacked("P")[0])
        //         ) {
        //             (bool isValid,) = validateBackslash_p_propertyNameEscape(_pattern, i);
        //             // console2.log("passing through here...");

        //             if (!isValid) {
        //                 string memory errorMsg = string(
        //                     abi.encodePacked(
        //                         "SyntaxError: Invalid regular expression: /",
        //                         _pattern,
        //                         "/",
        //                         _patternFlag == 0x2f ? bytes1(0) : _patternFlag,
        //                         ": Invalid property name in character class"
        //                     )
        //                 );
        //                 revert(errorMsg);
        //             }
        //         }
        //     }
        // }

        return true;
    }

    function isValidCharacterClassLiteral(
        bytes memory _pattern,
        uint256 _currentParticleIndex,
        uint256 lastMatchedParticleIndex,
        bytes1 _patternFlag
    ) private pure returns (bool) {
        for (uint256 i = _currentParticleIndex + 1; i < lastMatchedParticleIndex;) {
            (bool flag,, uint256 lastParticleIndex) = isLiteralAtom(_pattern, i, _patternFlag, true);
            if (flag) {
                i = lastParticleIndex + 1;
            } else {
                i++;
            }
        }
    }

    function isValidCharacterClass(
        bytes memory _pattern,
        uint256 _currentParticleIndex,
        uint256 lastMatchedParticleIndex,
        bytes1 _patternFlag
    ) private pure returns (bool) {
        for (uint256 i = _currentParticleIndex + 1; i < lastMatchedParticleIndex; i++) {
            if (
                uint8(_pattern[i]) == MINUS_SIGN
                    && (uint8(_pattern[i - 1]) != BACK_SLASH
                        || (i - 2 > _currentParticleIndex && uint8(_pattern[i - 2]) == BACK_SLASH))
            ) {
                if (
                    (uint8(_pattern[i - 1]) == OPEN_SQUARE_BRACKET && i - 1 == _currentParticleIndex)
                        || (uint8(_pattern[i + 1]) == CLOSE_SQUARE_BRACKET && i + 1 == lastMatchedParticleIndex)
                ) {
                    continue;
                }

                if (i - 2 > _currentParticleIndex && uint8(_pattern[i - 2]) == BACK_SLASH) {
                    // if (uint8(_pattern[i - 1]) != ) {}
                }

                if (i + 2 < lastMatchedParticleIndex && uint8(_pattern[i + 2]) == BACK_SLASH) {
                    // if (uint8(_pattern[i - 2])) {}
                }
            }
        }
    }

    function isGroup(bytes memory _pattern, uint256 _currentParticleIndex, bytes1 _patternFlag)
        private
        pure
        returns (bool, bytes32, uint256)
    {
        bool flag;
        uint256 lastMatchedParticleIndex;

        if (uint8(_pattern[_currentParticleIndex]) == CLOSE_PARANTHESIS) {
            string memory errorMsg =
                string(abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern, ": Unmatched ')'"));
            revert(errorMsg);
        }

        if (_currentParticleIndex == _pattern.length - 1 && uint8(_pattern[_currentParticleIndex]) == OPEN_PARANTHESIS)
        {
            if (
                (_pattern.length > 1 && uint8(_pattern[_currentParticleIndex - 1]) != BACK_SLASH)
                    || (_pattern.length > 2
                        && (uint8(_pattern[_currentParticleIndex - 1]) != BACK_SLASH
                            || uint8(_pattern[_currentParticleIndex - 2]) == BACK_SLASH))
                    || (uint8(_pattern[_currentParticleIndex]) == OPEN_PARANTHESIS && _pattern.length == 1)
            ) {
                string memory errorMsg = string(
                    abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern, ": Unterminated group")
                );
                revert(errorMsg);
            }
        }

        if (
            (_currentParticleIndex == 0
                    && uint8(_pattern[_currentParticleIndex]) == OPEN_PARANTHESIS
                    && _pattern.length > 1)
                || ((_currentParticleIndex > 0
                        && _currentParticleIndex < _pattern.length - 1
                        && uint8(_pattern[_currentParticleIndex]) == OPEN_PARANTHESIS)
                    && (uint8(_pattern[_currentParticleIndex - 1]) != BACK_SLASH
                        || (_currentParticleIndex > 1 && uint8(_pattern[_currentParticleIndex - 2]) == BACK_SLASH)))
        ) {
            uint256 stripFromIndex;
            (flag, stripFromIndex, lastMatchedParticleIndex) = validateGroup(_pattern, _currentParticleIndex + 1);
            if (lastMatchedParticleIndex > stripFromIndex) {
                bytes memory subPattern = trimString(_pattern, stripFromIndex, int256(lastMatchedParticleIndex - 1));
                // console2.log(
                //     "----------------------------------------sub pattern fission----------------------------------------"
                // );
                // console2.log("sub pattern string: ", string(subPattern));
                nuclearFission(subPattern, _patternFlag);
                // console2.log("----------------------------------------END----------------------------------------");
            }
        }

        if (flag) {
            return (true, GROUP_ATOM, lastMatchedParticleIndex);
        }
        return (false, INVALID_ATOM, 0);
    }

    function validateGroup(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256, uint256)
    {
        // @info: BUG: Currently don't validate literals, character classes, quantifiers, escapes, etc, inside a group
        // @status: not fixed, needs a better validation implementation
        // @status: Fixed ✅, this is the fix status in response of above status, meaning current acklgd bug has been fixed now
        if (uint8(_pattern[_currentParticleIndex]) == CLOSE_PARANTHESIS) {
            return (true, _currentParticleIndex, _currentParticleIndex);
        }

        (, uint256 stripFromIndex) = validateGroupBody(_pattern, _currentParticleIndex);

        uint256 numOpenParanthesis = 1;
        uint256 numCloseParanthesis;

        for (uint256 i = _currentParticleIndex + 1; i < _pattern.length; i++) {
            if (
                uint8(_pattern[i]) == OPEN_PARANTHESIS
                    && (uint8(_pattern[i - 1]) != BACK_SLASH || i > 1 && uint8(_pattern[i - 2]) == BACK_SLASH)
            ) {
                numOpenParanthesis++;
                validateGroupBody(_pattern, i + 1);
            }

            if (
                uint8(_pattern[i]) == CLOSE_PARANTHESIS
                    && (uint8(_pattern[i - 1]) != BACK_SLASH || i > 1 && uint8(_pattern[i - 2]) == BACK_SLASH)
            ) {
                numCloseParanthesis++;
            }

            if (numOpenParanthesis == numCloseParanthesis) {
                if (stripFromIndex == _currentParticleIndex + 3) {
                    if (i + 1 < _pattern.length) {
                        (bool isQuantifier,,) = isGreedyQuantifierAtom(_pattern, i + 1, GROUP_ATOM);
                        if (isQuantifier) {
                            string memory errorMsg = string(
                                abi.encodePacked(
                                    "SyntaxError: Invalid regular expression: ", _pattern, ": Invalid quantifier"
                                )
                            );
                            revert(errorMsg);
                        }
                    }
                }

                return (true, stripFromIndex, i);
            }
        }

        string memory errorMsg =
            string(abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern, ": Unterminated group"));
        revert(errorMsg);
    }

    function validateGroupBody(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        uint256 stripFrom = _currentParticleIndex;
        if (uint8(_pattern[_currentParticleIndex]) == QUESTION_MARK) {
            if (
                !(_currentParticleIndex + 1 <= _pattern.length - 1)
                    || (uint8(_pattern[_currentParticleIndex + 1]) != COLON
                        && uint8(_pattern[_currentParticleIndex + 1]) != ASSIGNMENT_SIGN
                        && uint8(_pattern[_currentParticleIndex + 1]) != EXCLAMATION_MARK
                        && uint8(_pattern[_currentParticleIndex + 1]) != LESS_THAN_SIGN)
            ) {
                string memory errorMsg = string(
                    abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern, ": Invalid group")
                );
                revert(errorMsg);
            }

            if (uint8(_pattern[_currentParticleIndex + 1]) == LESS_THAN_SIGN) {
                if (
                    !(_currentParticleIndex + 2 <= _pattern.length - 1)
                        || uint8(_pattern[_currentParticleIndex + 2]) == GREATER_THAN_SIGN
                        || (uint8(_pattern[_currentParticleIndex + 2]) != ASSIGNMENT_SIGN
                            && uint8(_pattern[_currentParticleIndex + 2]) != EXCLAMATION_MARK
                            && uint8(_pattern[_currentParticleIndex + 2]) != uint8(abi.encodePacked("_")[0])
                            && uint8(_pattern[_currentParticleIndex + 2]) != uint8(abi.encodePacked("$")[0])
                            && !isSmallAlphabet(_pattern[_currentParticleIndex + 2])
                            && !isBigAlphabet(_pattern[_currentParticleIndex + 2]))
                ) {
                    string memory errorMsg = string(
                        abi.encodePacked(
                            "SyntaxError: Invalid regular expression: ", _pattern, ": Invalid capture group name"
                        )
                    );
                    revert(errorMsg);
                }

                if (
                    uint8(_pattern[_currentParticleIndex + 2]) == uint8(abi.encodePacked("_")[0])
                        || uint8(_pattern[_currentParticleIndex + 2]) == uint8(abi.encodePacked("$")[0])
                        || isSmallAlphabet(_pattern[_currentParticleIndex + 2])
                        || isBigAlphabet(_pattern[_currentParticleIndex + 2])
                ) {
                    // @info: Still not accurate, according to js or ecmascript, chars lies ID_Start, and ID_Continue
                    // also the valid ones.
                    // @status: not implemented
                    for (uint256 i = _currentParticleIndex + 3; i <= _pattern.length - 1; i++) {
                        if (uint8(_pattern[i]) == GREATER_THAN_SIGN) {
                            stripFrom = i + 1;
                            break;
                        }

                        if (
                            (!isSmallAlphabet(_pattern[i])
                                    && !isBigAlphabet(_pattern[i])
                                    && !(uint8(_pattern[i]) == uint8(abi.encodePacked("_")[0]))
                                    && !(uint8(_pattern[i]) == uint8(abi.encodePacked("$")[0]))
                                    && !isDigit(_pattern[i], false))
                                || (i == _pattern.length - 1 && uint8(_pattern[i]) != GREATER_THAN_SIGN)
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
                    stripFrom = _currentParticleIndex + 3;
                }
            } else {
                stripFrom = _currentParticleIndex + 2;
            }
        }

        return (true, stripFrom);
    }

    function isDollarOrCaretAnchor(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, bytes32, uint256)
    {
        if (
            (_currentParticleIndex == 0)
                || (_currentParticleIndex > 0 && uint8(_pattern[_currentParticleIndex - 1]) != BACK_SLASH)
                || (_currentParticleIndex > 1
                    && (uint8(_pattern[_currentParticleIndex - 1]) != BACK_SLASH
                        || uint8(_pattern[_currentParticleIndex - 2]) == BACK_SLASH))
        ) {
            if (uint8(_pattern[_currentParticleIndex]) == DOLLAR_SIGN) {
                return (true, DOLLAR_ANCHOR, _currentParticleIndex);
            }

            if (uint8(_pattern[_currentParticleIndex]) == CARET_SIGN) {
                return (true, CARET_ANCHOR, _currentParticleIndex);
            }
        }

        return (false, INVALID_ATOM, 0);
    }

    function printAtomType(bytes32 atomType) private pure {
        if (atomType == LITERAL_ATOM) {
            console2.log("Atom Type: LITERAL_ATOM");
        } else if (atomType == DOT_ATOM) {
            console2.log("Atom Type: DOT_ATOM");
        } else if (atomType == CARET_ANCHOR) {
            console2.log("Atom Type: CARET_ANCHOR");
        } else if (atomType == DOLLAR_ANCHOR) {
            console2.log("Atom Type: DOLLAR_ANCHOR");
        } else if (atomType == ALTERNATION_OPERATOR) {
            console2.log("Atom Type: ALTERNATION_OPERATOR");
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
        } else if (atomType == CHARACTER_CLASS_ATOM) {
            console2.log("Atom Type: CHARACTER_CLASS_ATOM");
        } else if (atomType == GROUP_ATOM) {
            console2.log("Atom Type: GROUP_ATOM");
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
        if (uint8(_pattern[_currentParticleIdx]) == ASTERISK) {
            return (true, ASTERISK_GREEDY_QUANTIFIER_ATOM, _currentParticleIdx);
        }

        if (uint8(_pattern[_currentParticleIdx]) == PLUS_SIGN) {
            return (true, PLUS_GREEDY_QUANTIFIER_ATOM, _currentParticleIdx);
        }

        if (uint8(_pattern[_currentParticleIdx]) == QUESTION_MARK) {
            return (true, QUESTION_MARK_GREEDY_QUANTIFIER_ATOM, _currentParticleIdx);
        }

        if (
            uint8(_pattern[_currentParticleIdx]) == OPEN_CURLY_BRACE
                && (_currentParticleIdx + 1 <= _pattern.length - 1
                    && uint8(_pattern[_currentParticleIdx + 1]) != CLOSE_CURLY_BRACE)
        ) {
            (bool isValid, bytes32 atomType, uint256 lastMatchedParticleIndex) =
                isValidRangeQuantifier(_pattern, _currentParticleIdx);

            if (isValid) {
                return (true, atomType, lastMatchedParticleIndex);
            }
        }

        return (false, _lastAtomType, _currentParticleIdx);
    }

    function isValidRangeQuantifier(bytes memory _pattern, uint256 _currentParticleIdx)
        private
        pure
        returns (bool, bytes32, uint256)
    {
        bool commaFlag;
        uint256 commaIndex;

        for (uint256 i = _currentParticleIdx + 1; i <= _pattern.length - 1; i++) {
            if (
                !isDigit(_pattern[i], false) && uint8(_pattern[i]) != COMMA_SIGN
                    && uint8(_pattern[i]) != CLOSE_CURLY_BRACE
            ) {
                return (false, bytes32(0), 0);
            }

            if (isDigit(_pattern[i], false)) {
                continue;
            }

            if (uint8(_pattern[i]) == COMMA_SIGN) {
                if (uint8(_pattern[i - 1]) == OPEN_CURLY_BRACE) {
                    return (false, bytes32(0), 0);
                }

                commaFlag = true;
                commaIndex = i;
            }

            if (uint8(_pattern[i]) == CLOSE_CURLY_BRACE && !commaFlag) {
                return (true, N_RANGE_GREEDY_QUANTIFIER_ATOM, i);
            }

            if (uint8(_pattern[i]) == CLOSE_CURLY_BRACE && commaFlag && uint8(_pattern[i - 1]) == COMMA_SIGN) {
                return (true, N_AND_INFINITE_RANGE_GREEDY_QUANTIFIER_ATOM, i);
            }

            if (uint8(_pattern[i]) == CLOSE_CURLY_BRACE && commaFlag && uint8(_pattern[i - 1]) != COMMA_SIGN) {
                bytes memory commaLeft = trimString(_pattern, _currentParticleIdx + 1, int256(commaIndex - 1));
                bytes memory commaRight = trimString(_pattern, commaIndex + 1, int256(i - 1));

                console2.log("commaLeft: ", string(commaLeft));
                console2.log("commaRight: ", string(commaRight));

                uint256 leftRange = stringDigitToDecDigit(commaLeft);
                uint256 rightRange = stringDigitToDecDigit(commaRight);

                console2.log("leftRange: ", leftRange);
                console2.log("rightRange: ", rightRange);

                if (leftRange > rightRange) {
                    string memory errorMsg = string(
                        abi.encodePacked(
                            "SyntaxError: Invalid regular expression: ",
                            _pattern,
                            ": numbers out of order in {} quantifier"
                        )
                    );
                    revert(errorMsg);
                }

                return (true, N_AND_M_RANGE_GREEDY_QUANTIFIER_ATOM, i);
            }
        }

        return (false, bytes32(0), 0);
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

        if (patternFirstChar != FORWARD_SLASH) {
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
            patternLastChar != FORWARD_SLASH
                && (patternSecondLastChar == FORWARD_SLASH
                    && (patternThirdLastChar != BACK_SLASH
                        || (patternInBytes.length > 3
                            && uint8(patternInBytes[patternInBytes.length - 4]) == BACK_SLASH)))
        ) {
            if (
                patternLastChar != SMALL_d && patternLastChar != SMALL_i && patternLastChar != SMALL_g
                    && patternLastChar != SMALL_m && patternLastChar != SMALL_s && patternLastChar != SMALL_u
                    && patternLastChar != SMALL_y
            ) {
                string memory errorMsg =
                    string(abi.encodePacked("SyntaxError: Invalid regular expression flags: ", _pattern));
                revert(errorMsg);
            }
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

        if (
            patternLastChar == FORWARD_SLASH
                && ((patternSecondLastChar == BACK_SLASH && patternThirdLastChar == BACK_SLASH)
                    || (patternSecondLastChar != BACK_SLASH))
        ) {
            for (uint256 i = 1; i < patternInBytes.length - 1; i++) {
                if (
                    uint8(patternInBytes[i]) == FORWARD_SLASH
                        && ((i > 1
                                && (uint8(patternInBytes[i - 1]) != BACK_SLASH
                                    || uint8(patternInBytes[i - 2]) == BACK_SLASH))
                            || (uint8(patternInBytes[i - 1]) != BACK_SLASH))
                ) {
                    string memory errorMsg = string(
                        abi.encodePacked("SyntaxError: Invalid regular expression flags: ", _pattern)
                    );
                    revert(errorMsg);
                }
            }
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

    function isPropertyModifierCombiningMark(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0654: 0xd994 ... 0655: 0xd995
        // 0658: 0xd998
        if (_pattern[_currentParticleIndex] == 0xd9) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    _pattern[_currentParticleIndex + 1] == 0x94 || _pattern[_currentParticleIndex + 1] == 0x95
                        || _pattern[_currentParticleIndex + 1] == 0x98
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 06DC: 0xdb9c
        // 06E3: 0xdba3
        // 06E7: 0xdba7 ... 06E8: 0xdba8 [2]
        if (_pattern[_currentParticleIndex] == 0xdb) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    _pattern[_currentParticleIndex + 1] == 0x9c || _pattern[_currentParticleIndex + 1] == 0xa3
                        || _pattern[_currentParticleIndex + 1] == 0xa7 || _pattern[_currentParticleIndex + 1] == 0xa8
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 08CA: 0xe0a38a ... 08CB: 0xe0a38b [2]
                // 08CD: 0xe0a38d ... 08CF: 0xe0a38f [3]
                // 08D3: 0xe0a393
                // 08F3: 0xe0a3b3
                if (_pattern[_currentParticleIndex + 1] == 0xa3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x8a || _pattern[_currentParticleIndex + 2] == 0x8b
                                || (_pattern[_currentParticleIndex + 2] >= 0x8d
                                    && _pattern[_currentParticleIndex + 2] <= 0x8f)
                                || _pattern[_currentParticleIndex + 2] == 0x93
                                || _pattern[_currentParticleIndex + 2] == 0xb3
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyRegionalIndicator(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1F1E6: 0xf09f87a6 ... 1F1FF: 0xf09f87bf
                        if (_pattern[_currentParticleIndex + 2] == 0x87) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xa6
                                        || _pattern[_currentParticleIndex + 3] == 0xa7
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyPrependedConcatenationMark(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0600: 0xd880 ... 0605: 0xd885 [6]
        if (_pattern[_currentParticleIndex] == 0xd8) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0x80 && _pattern[_currentParticleIndex + 1] <= 0x85) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 06DD: 0xdb9d
        if (_pattern[_currentParticleIndex] == 0xdb) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x9d) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 070F: 0xdc8f
        if (_pattern[_currentParticleIndex] == 0xdc) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x8f) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 0890: 0xe0a290 ... 0891: 0xe0a291
                if (_pattern[_currentParticleIndex + 1] == 0xa2) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x90 || _pattern[_currentParticleIndex + 2] == 0x91)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 08E2: 0xe0a3a2
                if (_pattern[_currentParticleIndex + 1] == 0xa3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa2) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x91) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 110BD: 0xf09182bd
                        if (_pattern[_currentParticleIndex + 2] == 0x82) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xbd) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 110CD: 0xf091838d
                        if (_pattern[_currentParticleIndex + 2] == 0x83) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xbd) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyPatternWhiteSpace(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0009: 0x09 ... 000D: 0x0d [5]
        // 0020: 0x20
        if (
            (_pattern[_currentParticleIndex] >= 0x09 && _pattern[_currentParticleIndex] <= 0x0d)
                || _pattern[_currentParticleIndex] == 0x20
        ) {
            return (true, _currentParticleIndex);
        }

        // 0085: 0xc285
        if (_pattern[_currentParticleIndex] == 0xc2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x85) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 200E: 0xe2808e ... 200F: 0xe2808f [2]
                // 2028: 0xe280a8
                // 2029: 0xe280a9
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x8e || _pattern[_currentParticleIndex + 2] == 0x8f
                                || _pattern[_currentParticleIndex + 2] == 0xa8
                                || _pattern[_currentParticleIndex + 2] == 0xa9
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyVariationSelector(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 180B: 0xe1a08b ... 180D: 0xe1a08d [3]
                // 180F: 0xe1a08f
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x8b || _pattern[_currentParticleIndex + 2] == 0x8d
                                || _pattern[_currentParticleIndex + 2] == 0x8f
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // FE00: 0xefb880 ... FE0F: 0xefb88f [16]
                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x8f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // E0100: 0xf3a08480 ... E01EF: 0xf3a087af [(64*3=192) + 48 = 240]
                        if (_pattern[_currentParticleIndex + 2] >= 0x84 && _pattern[_currentParticleIndex + 2] >= 0x86)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 0xf3a08780 ... 0xf3a087af [48]
                        if (_pattern[_currentParticleIndex + 2] == 0x87) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xaf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertySentenceTerminal(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0021: 0x21
        // 002E: 0x2e
        // 003F: 0x3f
        if (
            _pattern[_currentParticleIndex] == 0x21 || _pattern[_currentParticleIndex] == 0x2e
                || _pattern[_currentParticleIndex] == 0x3f
        ) {
            return (true, _currentParticleIndex);
        }

        if (_pattern[_currentParticleIndex] == 0xd6) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 0589: 0xd689
                if (_pattern[_currentParticleIndex + 1] == 0x89) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xd8) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 061D: 0xd89d ... 061F: 0xd89f [3]
                if (_pattern[_currentParticleIndex + 1] >= 0x9d && _pattern[_currentParticleIndex + 1] <= 0x9f) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xdb) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 06D4: 0xdb94
                if (_pattern[_currentParticleIndex + 1] == 0x94) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xdc) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 0700: 0xdc80 ... 0702: 0xdc82 [3]
                if (_pattern[_currentParticleIndex + 1] >= 0x80 && _pattern[_currentParticleIndex + 1] <= 0x82) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xdf) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 07F9: 0xdfb9
                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 0837: 0xe0a0b7
                // 0839: 0xe0a0b9
                // 083D: 0xe0a0bd ... 083E: 0xe0a0be [2]
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xb7 || _pattern[_currentParticleIndex + 2] == 0xb9
                                || _pattern[_currentParticleIndex + 2] == 0xbd
                                || _pattern[_currentParticleIndex + 2] == 0xbe
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0964: 0xe0a5a4 ... 0965: 0xe0a5a5 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xa5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa4 || _pattern[_currentParticleIndex + 2] == 0xa5)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 104A: 0xe1818a ... 104B: 0xe1818b [2]
                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8a || _pattern[_currentParticleIndex + 2] == 0x8b)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1362: 0xe18da2
                // 1367: 0xe18da7 ... 1368: 0xe18da8 [2]
                if (_pattern[_currentParticleIndex + 1] == 0x8d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xa2 || _pattern[_currentParticleIndex + 2] == 0xa7
                                || _pattern[_currentParticleIndex + 2] == 0xa8
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 166E: 0xe199ae
                if (_pattern[_currentParticleIndex + 1] == 0x99) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xae) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1735: 0xe19cb5 ... 1736: 0xe19cb6 [2]
                if (_pattern[_currentParticleIndex + 1] == 0x9c) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb5 || _pattern[_currentParticleIndex + 2] == 0xb6)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 17D4: 0xe19f94 ... 17D5: 0xe19f95 [2]
                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x94 || _pattern[_currentParticleIndex + 2] == 0xa5)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1803: 0xe1a083
                // 1809: 0xe1a089
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x83 || _pattern[_currentParticleIndex + 2] == 0x89)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1944: 0xe1a584 ... 1945: 0xe1a585
                if (_pattern[_currentParticleIndex + 1] == 0xa5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x85) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1AA8: 0xe1aaa8 ... 1AAB: 0xe1aaab [4]
                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa8 && _pattern[_currentParticleIndex + 2] <= 0xab)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1B4E: 0xe1ad8e ... 1B4F: 0xe1ad8f [2]
                // 1B5A: 0xe1ad9a ... 1B5B: 0xe1ad9b [2]
                // 1B5E: 0xe1ad9e ... 1B5F: 0xe1ad9f [2]
                // 1B7D: 0xe1adbd ... 1B7F: 0xe1adbf [3]
                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x8e || _pattern[_currentParticleIndex + 2] == 0x8f
                                || _pattern[_currentParticleIndex + 2] == 0x9a
                                || _pattern[_currentParticleIndex + 2] == 0x9b
                                || _pattern[_currentParticleIndex + 2] == 0x9e
                                || _pattern[_currentParticleIndex + 2] == 0x9f
                                || (_pattern[_currentParticleIndex + 2] >= 0xbd
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1C3B: 0xe1b0bb ... 1C3C: 0xe1b0bc [2]
                if (_pattern[_currentParticleIndex + 1] == 0xb0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbb || _pattern[_currentParticleIndex + 2] == 0xbc)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1C7E: 0xe1b1be ... 1C7F: 0xe1b1bf [2]
                if (_pattern[_currentParticleIndex + 1] == 0xb1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbe || _pattern[_currentParticleIndex + 2] == 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2024: 0xe280a4
                // 203C: 0xe280bc ... 203D: 0xe280bd [2]
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xa4 || _pattern[_currentParticleIndex + 2] == 0xbc
                                || _pattern[_currentParticleIndex + 2] == 0xbd
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2047: 0xe28187 ... 2049: 0xe28189 [3]
                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x87 && _pattern[_currentParticleIndex + 2] <= 0x89)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2CF9: 0xe2b3b9 ... 2CFB: 0xe2b3bb [3]
                if (_pattern[_currentParticleIndex + 1] == 0xb3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb9 && _pattern[_currentParticleIndex + 2] <= 0xbb)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2E2E: 0xe2b8ae
                // 2E3C: 0xe2b8bc
                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xae || _pattern[_currentParticleIndex + 2] == 0xbc)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2E53: 0xe2b993 ... 2E54: 0xe2b994 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x93 || _pattern[_currentParticleIndex + 2] == 0x94)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 3002: 0xe38082
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x82) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xea) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // A4FF: 0xea93bf
                if (_pattern[_currentParticleIndex + 1] == 0x93) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A60E: 0xea988e ... A60F: 0xea988f
                if (_pattern[_currentParticleIndex + 1] == 0x98) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8e || _pattern[_currentParticleIndex + 2] == 0x8f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A6F3: 0xea9bb3
                // A6F7: 0xea9bb7
                if (_pattern[_currentParticleIndex + 1] == 0x9b) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb3 || _pattern[_currentParticleIndex + 2] == 0xb7)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A876: 0xeaa1b6 ... A877: 0xeaa1b7 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xa1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb6 || _pattern[_currentParticleIndex + 2] == 0xb7)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A8CE: 0xeaa38e ... A8CF: 0xeaa38f [2]
                if (_pattern[_currentParticleIndex + 1] == 0xa3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8e || _pattern[_currentParticleIndex + 2] == 0x8f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A92F: 0xeaa4af
                if (_pattern[_currentParticleIndex + 1] == 0xa4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xaf) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A9C8: 0xeaa788 ... A9C9: 0xeaa789 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xa7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x88 || _pattern[_currentParticleIndex + 2] == 0x89)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AA5D: 0xeaa99d ... AA5F: 0xeaa99f [3]
                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x9d && _pattern[_currentParticleIndex + 2] <= 0x9f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AAF0: 0xeaabb0 ... AAF1: 0xeaabb1 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb0 || _pattern[_currentParticleIndex + 2] == 0xb1)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // ABEB: 0xeaafab
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xab) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // FE12: 0xefb892
                // FE15: 0xefb895 ... FE16: 0xefb896 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x92 || _pattern[_currentParticleIndex + 2] == 0x95
                                || _pattern[_currentParticleIndex + 2] == 0x96
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FE52: 0xefb992
                // FE56: 0xefb996 ... FE57: 0xefb997 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x92 || _pattern[_currentParticleIndex + 2] == 0x96
                                || _pattern[_currentParticleIndex + 2] == 0x97
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FF01: 0xefbc81
                // FF0E: 0xefbc8e
                // FF1F: 0xefbc9f
                if (_pattern[_currentParticleIndex + 1] == 0xbc) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x81 || _pattern[_currentParticleIndex + 2] == 0x8e
                                || _pattern[_currentParticleIndex + 2] == 0x9f
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FF61: 0xefbda1
                if (_pattern[_currentParticleIndex + 1] == 0xbd) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa1) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x90) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 10A56: 0xf090a996 ... 10A57: 0xf090a997 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xa9) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x96
                                        || _pattern[_currentParticleIndex + 3] == 0x97
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10F55: 0xf090bd95 ... 10F59: 0xf090bd99 [5]
                        if (_pattern[_currentParticleIndex + 2] == 0xbd) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x95
                                        && _pattern[_currentParticleIndex + 3] <= 0x99
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10F86: 0xf090be86 ... 10F89: 0xf090be89 [4]
                        if (_pattern[_currentParticleIndex + 2] == 0xbe) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x86
                                        && _pattern[_currentParticleIndex + 3] <= 0x89
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x91) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 11047: 0xf0918187 ... 11048: 0xf0918188 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x81) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x87
                                        || _pattern[_currentParticleIndex + 3] == 0x88
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 110BE: 0xf09182be ... 110C1: 0xf0918381 [4]
                        if (_pattern[_currentParticleIndex + 2] == 0x82) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x83) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x80
                                        || _pattern[_currentParticleIndex + 3] == 0x81
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11141: 0xf0918581 ... 11143: 0xf0918583 [3]
                        if (_pattern[_currentParticleIndex + 2] == 0x85) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x81
                                        && _pattern[_currentParticleIndex + 3] <= 0x83
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 111C5: 0xf0918785 ... 111C6: 0xf0918786 [2]
                        // 111CD: 0xf091878d
                        // 111DE: 0xf091879e ... 111DF: 0xf091879f [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x87) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x85
                                        || _pattern[_currentParticleIndex + 3] == 0x86
                                        || _pattern[_currentParticleIndex + 3] == 0x8d
                                        || _pattern[_currentParticleIndex + 3] == 0x9e
                                        || _pattern[_currentParticleIndex + 3] == 0x9f
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11238: 0xf09188b8 ... 11239: 0xf09188b9 [2]
                        // 1123B: 0xf09188bb ... 1123C: 0xf09188bc [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x88) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb8
                                        || _pattern[_currentParticleIndex + 3] == 0xb9
                                        || _pattern[_currentParticleIndex + 3] == 0xbb
                                        || _pattern[_currentParticleIndex + 3] == 0xbc
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 112A9: 0xf0918aa9
                        if (_pattern[_currentParticleIndex + 2] == 0x8a) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xa9) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 113D4: 0xf0918f94 ... 113D5: 0xf0918f95 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x8f) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x94
                                        || _pattern[_currentParticleIndex + 3] == 0x95
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1144B: 0xf091918b ... 1144C: 0xf091918c [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x91) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x8b
                                        || _pattern[_currentParticleIndex + 3] == 0x8c
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 115C2: 0xf0919782 ... 115C3: 0xf0919783 [2]
                        // 115C9: 0xf0919789 ... 115D7: 0xf0919797 [15]
                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x82
                                        || _pattern[_currentParticleIndex + 3] == 0x83
                                        || (_pattern[_currentParticleIndex + 3] >= 0x89
                                            && _pattern[_currentParticleIndex + 3] <= 0x97)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11641: 0xf0919981 ... 11642: 0xf0919982 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x99) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x81
                                        || _pattern[_currentParticleIndex + 3] == 0x82
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1173C: 0xf0919cbc ... 1173E: 0xf0919cbe [3]
                        if (_pattern[_currentParticleIndex + 2] == 0x9c) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xbc
                                        && _pattern[_currentParticleIndex + 3] <= 0xbe
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11944: 0xf091a584
                        // 11946: 0xf091a586
                        if (_pattern[_currentParticleIndex + 2] == 0xa5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x84
                                        || _pattern[_currentParticleIndex + 3] == 0x86
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11A42: 0xf091a982 ... 11A43: 0xf091a983 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xa9) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x82
                                        || _pattern[_currentParticleIndex + 3] == 0x83
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11A9B: 0xf091aa9b ... 11A9C: 0xf091aa9c [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xaa) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x9b
                                        || _pattern[_currentParticleIndex + 3] == 0x9c
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11C41: 0xf091b181 ... 11C42: 0xf091b182 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xb1) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x81
                                        || _pattern[_currentParticleIndex + 3] == 0x82
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11EF7: 0xf091bbb7 ... 11EF8: 0xf091bbb8 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbb) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb7
                                        || _pattern[_currentParticleIndex + 3] == 0xb8
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11F43: 0xf091bd83 ... 11F44: 0xf091bd84 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbd) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x83
                                        || _pattern[_currentParticleIndex + 3] == 0x84
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x96) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 16A6E: 0xf096a9ae ... 16A6F: 0xf096a9af [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xa9) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xae
                                        || _pattern[_currentParticleIndex + 3] == 0xaf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16AF5: 0xf096abb5
                        if (_pattern[_currentParticleIndex + 2] == 0xab) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xb5) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16B37: 0xf096acb7 ... 16B38: 0xf096acb8 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xac) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb7
                                        || _pattern[_currentParticleIndex + 3] == 0xb8
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16B44: 0xf096ad84
                        if (_pattern[_currentParticleIndex + 2] == 0xad) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x84) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16D6E: 0xf096b5ae ... 16D6F: 0xf096b5af [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xb5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xae
                                        || _pattern[_currentParticleIndex + 3] == 0xaf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16E98: 0xf096ba98
                        if (_pattern[_currentParticleIndex + 2] == 0xba) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x98) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9b) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1BC9F: 0xf09bb29f
                        if (_pattern[_currentParticleIndex + 2] == 0xb2) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x9f) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1DA88: 0xf09daa88
                        if (_pattern[_currentParticleIndex + 2] == 0xaa) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x88) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyIDCompatMathStart(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2202: 0xe28882
                // 2207: 0xe28887
                // 221E: 0xe2889e
                if (_pattern[_currentParticleIndex + 1] == 0x88) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x82 || _pattern[_currentParticleIndex + 2] == 0x87
                                || _pattern[_currentParticleIndex + 2] == 0x9e
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x9d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1D6C1: 0xf09d9b81
                        // 1D6DB: 0xf09d9b9b
                        // 1D6FB: 0xf09d9bbb
                        if (_pattern[_currentParticleIndex + 2] == 0x9b) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x81
                                        || _pattern[_currentParticleIndex + 3] == 0x9b
                                        || _pattern[_currentParticleIndex + 3] == 0xbb
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D715: 0xf09d9c95
                        // 1D735: 0xf09d9cb5
                        if (_pattern[_currentParticleIndex + 2] == 0x9c) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x95
                                        || _pattern[_currentParticleIndex + 3] == 0xb5
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D74F: 0xf09d9d8f
                        // 1D76F: 0xf09d9daf
                        if (_pattern[_currentParticleIndex + 2] == 0x9d) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x8f
                                        || _pattern[_currentParticleIndex + 3] == 0xaf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D789: 0xf09d9e89
                        // 1D7A9: 0xf09d9ea9
                        if (_pattern[_currentParticleIndex + 2] == 0x9e) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x89
                                        || _pattern[_currentParticleIndex + 3] == 0xa9
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D7C3: 0xf09d9f83
                        if (_pattern[_currentParticleIndex + 2] == 0x9f) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x83) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyIDCompatMathContinue(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 00B2: 0xc2b2 ... 00B3: 0xc2b3 [2]
        // 00B9: 0xc2b9
        if (_pattern[_currentParticleIndex] == 0xc2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    _pattern[_currentParticleIndex + 1] == 0xb2 || _pattern[_currentParticleIndex + 1] == 0xb3
                        || _pattern[_currentParticleIndex + 1] == 0xb9
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2070: 0xe281b0
                // 2074: 0xe281b4 ... 2079: 0xe281b9 [6]
                // 207A: 0xe281ba ... 207C: 0xe281bc [3]
                // 207D: 0xe281bd
                // 207E: 0xe281be
                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xb0
                                || (_pattern[_currentParticleIndex + 2] >= 0xb4
                                    && _pattern[_currentParticleIndex + 2] <= 0xb9)
                                || (_pattern[_currentParticleIndex + 2] >= 0xba
                                    && _pattern[_currentParticleIndex + 2] <= 0xbe)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2080: 0xe28280 ... 2089: 0xe28289 [10]
                // 208A: 0xe2828a ... 208C: 0xe2828c [3]
                // 208D: 0xe2828d
                // 208E: 0xe2828e
                if (_pattern[_currentParticleIndex + 1] == 0x82) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x89)
                                || _pattern[_currentParticleIndex + 2] >= 0x8a
                                && _pattern[_currentParticleIndex + 2] <= 0x8e
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2202: 0xe28882
                // 2207: 0xe28887
                // 221E: 0xe2889e
                if (_pattern[_currentParticleIndex + 1] == 0x88) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x82 && _pattern[_currentParticleIndex + 2] == 0x87
                                || _pattern[_currentParticleIndex + 2] == 0x9e
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x9d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1D6C1: 0xf09d9b81
                        // 1D6DB: 0xf09d9b9b
                        // 1D6FB: 0xf09d9bbb
                        if (_pattern[_currentParticleIndex + 2] == 0x9b) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x81
                                        || _pattern[_currentParticleIndex + 3] == 0x9b
                                        || _pattern[_currentParticleIndex + 3] == 0xbb
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D715: 0xf09d9c95
                        // 1D735: 0xf09d9cb5
                        if (_pattern[_currentParticleIndex + 2] == 0x9c) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x95
                                        || _pattern[_currentParticleIndex + 3] == 0xb5
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D74F: 0xf09d9d8f
                        // 1D76F: 0xf09d9daf
                        if (_pattern[_currentParticleIndex + 2] == 0x9d) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x8f
                                        || _pattern[_currentParticleIndex + 3] == 0xaf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D789: 0xf09d9e89
                        // 1D7A9: 0xf09d9ea9
                        if (_pattern[_currentParticleIndex + 2] == 0x9e) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x89
                                        || _pattern[_currentParticleIndex + 3] == 0xa9
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D7C3: 0xf09d9f83
                        if (_pattern[_currentParticleIndex + 2] == 0x9f) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x83) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyOtherIDContinue(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 00B7: 0xc2b7
        if (_pattern[_currentParticleIndex] == 0xc2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xb7) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0387: 0xce87
        if (_pattern[_currentParticleIndex] == 0xce) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x87) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 1369: 0xe18da9 ... 1371: 0xe18db1 [9]
                if (_pattern[_currentParticleIndex + 1] == 0x8d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa9 && _pattern[_currentParticleIndex + 2] <= 0xb1)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 19DA: 0xe1a79a
                if (_pattern[_currentParticleIndex + 1] == 0xa7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9a) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 200C: 0xe2808c ... 200D: 0xe2808d [2]
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8c || _pattern[_currentParticleIndex + 2] == 0x8d)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 30FB: 0xe383bb
                if (_pattern[_currentParticleIndex + 1] == 0x83) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbb) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // FF65: 0xefbda5
                if (_pattern[_currentParticleIndex + 1] == 0xbd) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa5) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyOtherIDStart(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 1885: 0xe1a285 ... 1886: 0xe1a286 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xa2) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x85 || _pattern[_currentParticleIndex + 2] == 0x86)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2118: 0xe28498
                // 212E: 0xe284ae
                if (_pattern[_currentParticleIndex + 1] == 0x84) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x98 || _pattern[_currentParticleIndex + 2] == 0xae)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 309B: 0xe3829b ... 309C: 0xe3829c
                if (_pattern[_currentParticleIndex + 1] == 0x82) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9b || _pattern[_currentParticleIndex + 2] == 0x9c)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyLogicalOrderException(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xe0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 0E40: 0xe0b980 ... 0E44: 0xe0b984 [5]
                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x84)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0EC0: 0xe0bb80 ... 0EC4: 0xe0bb84 [5]
                if (_pattern[_currentParticleIndex + 1] == 0xbb) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x84)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 19B5: 0xe1a6b5 ... 19B7: 0xe1a6b7 [3]
                // 19BA: 0xe1a6ba
                if (_pattern[_currentParticleIndex + 1] == 0xa6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0xb5 && _pattern[_currentParticleIndex + 2] <= 0xb7)
                                || _pattern[_currentParticleIndex + 2] == 0xba
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // AAB5: 0xeaaab5 ... AAB6: 0xeaaab6 [2]
                // AAB9: 0xeaaab9
                // AABB: 0xeaaabb ... AABC: 0xeaaabc [2]
                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xb5 || _pattern[_currentParticleIndex + 2] == 0xb6
                                || _pattern[_currentParticleIndex + 2] == 0xb9
                                || _pattern[_currentParticleIndex + 2] == 0xbb
                                || _pattern[_currentParticleIndex + 2] == 0xbc
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertySoftDotted(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0069: 0x69 ... 006A: 0x6a [2]
        if (_pattern[_currentParticleIndex] == 0x69 || _pattern[_currentParticleIndex] == 0x6a) {
            return (true, _currentParticleIndex);
        }

        // 012F: 0xc4af
        if (_pattern[_currentParticleIndex] == 0xc4) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0249: 0xc989
        // 0268: 0xc9a8
        if (_pattern[_currentParticleIndex] == 0xc9) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x89 || _pattern[_currentParticleIndex + 1] == 0xa8) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 029D: 0xca9d
        // 02B2: 0xcab2
        if (_pattern[_currentParticleIndex] == 0xca) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x9d || _pattern[_currentParticleIndex + 1] == 0xb2) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 03F3: 0xcfb3
        if (_pattern[_currentParticleIndex] == 0xcf) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xb3) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0456: 0xd196
        // 0458: 0xd198
        if (_pattern[_currentParticleIndex] == 0xd1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x96 || _pattern[_currentParticleIndex + 1] == 0x98) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 1D62: 0xe1b5a2
                if (_pattern[_currentParticleIndex + 1] == 0xb5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa2) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1D96: 0xe1b696
                // 1DA4: 0xe1b6a4
                // 1DA8: 0xe1b6a8
                if (_pattern[_currentParticleIndex + 1] == 0xb6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x96 || _pattern[_currentParticleIndex + 2] == 0xa4
                                || _pattern[_currentParticleIndex + 2] == 0xa8
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1E2D: 0xe1b8ad
                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xad) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1ECB: 0xe1bb8b
                if (_pattern[_currentParticleIndex + 1] == 0xbb) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8b) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2071: 0xe281b1
                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb1) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2148: 0xe28588 ... 2149: 0xe28589 [2]
                if (_pattern[_currentParticleIndex + 1] == 0x85) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x88 || _pattern[_currentParticleIndex + 2] == 0x89)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2C7C: 0xe2b1bc
                if (_pattern[_currentParticleIndex + 1] == 0xb1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x9d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1D422: 0xf09d90a2 ... 1D423: 0xf09d90a3 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x90) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xa2
                                        || _pattern[_currentParticleIndex + 3] == 0xa3
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D456: 0xf09d9196 ... 1D457: 0xf09d9197 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x91) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x96
                                        || _pattern[_currentParticleIndex + 3] == 0x97
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D48A: 0xf09d928a ... 1D48B: 0xf09d928b [2]
                        // 1D4BE: 0xf09d92be ... 1D4BF: 0xf09d92bf [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x92) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x8a
                                        || _pattern[_currentParticleIndex + 3] == 0x8b
                                        || _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D4F2: 0xf09d93b2 ... 1D4F3: 0xf09d93b3
                        if (_pattern[_currentParticleIndex + 2] == 0x93) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb2
                                        || _pattern[_currentParticleIndex + 3] == 0xb3
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D526: 0xf09d94a6 ... 1D527: 0xf09d94a7 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x94) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xa6
                                        || _pattern[_currentParticleIndex + 3] == 0xa7
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D55A: 0xf09d959a ... 1D55B: 0xf09d959b [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x95) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x9a
                                        || _pattern[_currentParticleIndex + 3] == 0x9b
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D58E: 0xf09d968e ... 1D58F: 0xf09d968f [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x96) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x8e
                                        || _pattern[_currentParticleIndex + 3] == 0x8f
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D5C2: 0xf09d9782 ... 1D5C3: 0xf09d9783 [2]
                        // 1D5F6: 0xf09d97b6 ... 1D5F7: 0xf09d97b7 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x82
                                        || _pattern[_currentParticleIndex + 3] == 0x83
                                        || _pattern[_currentParticleIndex + 3] == 0xb6
                                        || _pattern[_currentParticleIndex + 3] == 0xb7
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D62A: 0xf09d98aa ... 1D62B: 0xf09d98ab [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x98) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xaa
                                        || _pattern[_currentParticleIndex + 3] == 0xab
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D65E: 0xf09d999e ... 1D65F: 0xf09d999f [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x99) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x9e
                                        || _pattern[_currentParticleIndex + 3] == 0x9f
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D692: 0xf09d9a92 ... 1D693: 0xf09d9a93 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x9a) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x92
                                        || _pattern[_currentParticleIndex + 3] == 0x93
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1DF1A: 0xf09dbc9a
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x9a) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9e) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1E04C: 0xf09e818c ... 1E04D: 0xf09e818d [2]
                        // 1E068: 0xf09e81a8
                        if (_pattern[_currentParticleIndex + 2] == 0x81) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x8c
                                        || _pattern[_currentParticleIndex + 3] == 0x8d
                                        || _pattern[_currentParticleIndex + 3] == 0xa8
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyDeprecated(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0149: 0xc589
        if (_pattern[_currentParticleIndex] == 0xc5) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x89) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0673: 0xd9b3
        if (_pattern[_currentParticleIndex] == 0xd9) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xb3) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 0F77: 0xe0bdb7
                // 0F79: 0xe0bdb9
                if (_pattern[_currentParticleIndex + 1] == 0xbd) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb7 || _pattern[_currentParticleIndex + 2] == 0xb9)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 17A3: 0xe19ea3 ... 17A4: 0xe19ea4 [2]
                if (_pattern[_currentParticleIndex + 1] == 0x9e) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa3 || _pattern[_currentParticleIndex + 2] == 0xa4)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 206A: 0xe281aa ... 206F: 0xe281af [6]
                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xaa && _pattern[_currentParticleIndex + 2] <= 0xaf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2329: 0xe28ca9
                // 232A: 0xe28caa
                if (_pattern[_currentParticleIndex + 1] == 0x8c) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa9 || _pattern[_currentParticleIndex + 2] == 0xaa)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // E0001: 0xf3a08081
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x80) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x81) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyOtherDefaultIgnorableCodePoint(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 034F: 0xcd8f
        if (_pattern[_currentParticleIndex] == 0xcd) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x8f) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 115F: 0xe1859f ... 1160: 0xe185a0 [2]
                if (_pattern[_currentParticleIndex + 1] == 0x85) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9f || _pattern[_currentParticleIndex + 2] == 0xa0)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 17B4: 0xe19eb4 ... 17B5: 0xe19eb5 [2]
                if (_pattern[_currentParticleIndex + 1] == 0x9e) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb4 || _pattern[_currentParticleIndex + 2] == 0xb5)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2065: 0xe281a5
                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa5) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 3164: 0xe385a4
                if (_pattern[_currentParticleIndex + 1] == 0x85) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa4) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // FFA0: 0xefbea0
                if (_pattern[_currentParticleIndex + 1] == 0xbe) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa0) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FFF0: 0xefbfb0 ... FFF8: 0xefbfb8 [9]
                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb0 && _pattern[_currentParticleIndex + 2] >= 0xb8)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // E0000: 0xf3a08080
                        // E0002: 0xf3a08082 ... E001F: 0xf3a0809f [30]
                        if (_pattern[_currentParticleIndex + 2] == 0x80) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x80
                                        || (_pattern[_currentParticleIndex + 3] >= 0x82
                                            && _pattern[_currentParticleIndex + 3] <= 0x9f)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // E0080: 0xf3a08280 ... E00FF: 0xf3a083bf [128]
                        // - 0xf3a08280 ... 0xf3a082bf [64]
                        // - 0xf3a08380 ... 0xf3a083bf [64]
                        if (_pattern[_currentParticleIndex + 2] == 0x82 || _pattern[_currentParticleIndex + 2] == 0x83)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // E01F0: 0xf3a087b0 ... E0FFF: 0xf3a0bfbf [16 + 3584 = 3600]
                        // - 0xf3a087b0 ... 0xf3a087bf [16]
                        if (_pattern[_currentParticleIndex + 2] == 0x87) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb0
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 0xf3a08880 ... 0xf3a0bfbf [64*56=3584]
                        if (_pattern[_currentParticleIndex + 2] >= 0x88 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyUnifiedIdeograph(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 3400: 0xe39080 ... 4DBF: 0xe4b6bf [103*64=6592]
                // 0xe39080 ... 0xe390bf [64]
                // 0xe39180 ... 0xe391bf [64]
                // 0xe39280 ... 0xe392bf [64]
                // 0xe39380 ... 0xe393bf [64]
                // 0xe39480 ... 0xe394bf [64]
                // 0xe39580 ... 0xe395bf [64]
                // 0xe39680 ... 0xe396bf [64]
                // 0xe39780 ... 0xe397bf [64]
                // 0xe39880 ... 0xe398bf [64]
                // 0xe39980 ... 0xe399bf [64]
                // 0xe39a80 ... 0xe39abf [64]
                // 0xe39b80 ... 0xe39bbf [64]
                // 0xe39c80 ... 0xe39cbf [64]
                // 0xe39d80 ... 0xe39dbf [64]
                // 0xe39e80 ... 0xe39ebf [64]
                // 0xe39f80 ... 0xe39fbf [64]
                // 0xe3a080 ... 0xe3a0bf [64]
                // 0xe3a180 ... 0xe3a1bf [64]
                // 0xe3a280 ... 0xe3a2bf [64]
                // 0xe3a380 ... 0xe3a3bf [64]
                // 0xe3a480 ... 0xe3a4bf [64]
                // 0xe3a580 ... 0xe3a5bf [64]
                // 0xe3a680 ... 0xe3a6bf [64]
                // 0xe3a780 ... 0xe3a7bf [64]
                // 0xe3a880 ... 0xe3a8bf [64]
                // 0xe3a980 ... 0xe3a9bf [64]
                // 0xe3aa80 ... 0xe3aabf [64]
                // 0xe3ab80 ... 0xe3abbf [64]
                // 0xe3ac80 ... 0xe3acbf [64]
                // 0xe3ad80 ... 0xe3adbf [64]
                // 0xe3ae80 ... 0xe3aebf [64]
                // 0xe3af80 ... 0xe3afbf [64]
                // 0xe3b080 ... 0xe3b0bf [64]
                // 0xe3b180 ... 0xe3b1bf [64]
                // 0xe3b280 ... 0xe3b2bf [64]
                // 0xe3b380 ... 0xe3b3bf [64]
                // 0xe3b480 ... 0xe3b4bf [64]
                // 0xe3b580 ... 0xe3b5bf [64]
                // 0xe3b680 ... 0xe3b6bf [64]
                // 0xe3b780 ... 0xe3b7bf [64]
                // 0xe3b880 ... 0xe3b8bf [64]
                // 0xe3b980 ... 0xe3b9bf [64]
                // 0xe3ba80 ... 0xe3babf [64]
                // 0xe3bb80 ... 0xe3bbbf [64]
                // 0xe3bc80 ... 0xe3bcbf [64]
                // 0xe3bd80 ... 0xe3bdbf [64]
                // 0xe3be80 ... 0xe3bebf [64]
                // 0xe3bf80 ... 0xe3bfbf [64]
                if (_pattern[_currentParticleIndex + 1] >= 0x90 && _pattern[_currentParticleIndex + 1] <= 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe4) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 0xe48080 ... 0xe480bf [64]
                // 0xe48180 ... 0xe481bf [64]
                // 0xe48280 ... 0xe482bf [64]
                // 0xe48380 ... 0xe483bf [64]
                // 0xe48480 ... 0xe484bf [64]
                // 0xe48580 ... 0xe485bf [64]
                // 0xe48680 ... 0xe486bf [64]
                // 0xe48780 ... 0xe487bf [64]
                // 0xe48880 ... 0xe488bf [64]
                // 0xe48980 ... 0xe489bf [64]
                // 0xe48a80 ... 0xe48abf [64]
                // 0xe48b80 ... 0xe48bbf [64]
                // 0xe48c80 ... 0xe48cbf [64]
                // 0xe48d80 ... 0xe48dbf [64]
                // 0xe48e80 ... 0xe48ebf [64]
                // 0xe48f80 ... 0xe48fbf [64]
                // 0xe49080 ... 0xe490bf [64]
                // 0xe49180 ... 0xe491bf [64]
                // 0xe49280 ... 0xe492bf [64]
                // 0xe49380 ... 0xe493bf [64]
                // 0xe49480 ... 0xe494bf [64]
                // 0xe49580 ... 0xe495bf [64]
                // 0xe49680 ... 0xe496bf [64]
                // 0xe49780 ... 0xe497bf [64]
                // 0xe49880 ... 0xe498bf [64]
                // 0xe49980 ... 0xe499bf [64]
                // 0xe49a80 ... 0xe49abf [64]
                // 0xe49b80 ... 0xe49bbf [64]
                // 0xe49c80 ... 0xe49cbf [64]
                // 0xe49d80 ... 0xe49dbf [64]
                // 0xe49e80 ... 0xe49ebf [64]
                // 0xe49f80 ... 0xe49fbf [64]
                // 0xe4a080 ... 0xe4a0bf [64]
                // 0xe4a180 ... 0xe4a1bf [64]
                // 0xe4a280 ... 0xe4a2bf [64]
                // 0xe4a380 ... 0xe4a3bf [64]
                // 0xe4a480 ... 0xe4a4bf [64]
                // 0xe4a580 ... 0xe4a5bf [64]
                // 0xe4a680 ... 0xe4a6bf [64]
                // 0xe4a780 ... 0xe4a7bf [64]
                // 0xe4a880 ... 0xe4a8bf [64]
                // 0xe4a980 ... 0xe4a9bf [64]
                // 0xe4aa80 ... 0xe4aabf [64]
                // 0xe4ab80 ... 0xe4abbf [64]
                // 0xe4ac80 ... 0xe4acbf [64]
                // 0xe4ad80 ... 0xe4adbf [64]
                // 0xe4ae80 ... 0xe4aebf [64]
                // 0xe4af80 ... 0xe4afbf [64]
                // 0xe4b080 ... 0xe4b0bf [64]
                // 0xe4b180 ... 0xe4b1bf [64]
                // 0xe4b280 ... 0xe4b2bf [64]
                // 0xe4b380 ... 0xe4b3bf [64]
                // 0xe4b480 ... 0xe4b4bf [64]
                // 0xe4b580 ... 0xe4b5bf [64]
                // 0xe4b680 ... 0xe4b6bf [64]
                if (_pattern[_currentParticleIndex + 1] >= 0x80 && _pattern[_currentParticleIndex + 1] <= 0xb6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 4E00: 0xe4b880 ... 9FFF: 0xe9bfbf [20480 + 512 = 20992]
                // 0xe4b880 ... 0xe4b8bf [64]
                // 0xe4b980 ... 0xe4b9bf [64]
                // 0xe4ba80 ... 0xe4babf [64]
                // 0xe4bb80 ... 0xe4bbbf [64]
                // 0xe4bc80 ... 0xe4bcbf [64]
                // 0xe4bd80 ... 0xe4bdbf [64]
                // 0xe4be80 ... 0xe4bebf [64]
                // 0xe4bf80 ... 0xe4bfbf [64] = [8*64=512]
                if (_pattern[_currentParticleIndex + 1] >= 0xb8 && _pattern[_currentParticleIndex + 1] <= 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 0xe58080 ... e9bfbf [64*64*5 = 20480]
        if (_pattern[_currentParticleIndex] >= 0xe5 && _pattern[_currentParticleIndex] <= 0xe9) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0x80 && _pattern[_currentParticleIndex + 1] <= 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] >= 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // FA0E: 0xefa88e ... FA0F: 0xefa88f [2]
                // FA11: 0xefa891
                // FA13: 0xefa893 ... FA14: 0xefa894 [2]
                // FA1F: 0xefa89f
                // FA21: 0xefa8a1
                // FA23: 0xefa8a3 ... FA24: 0xefa8a4 [2]
                // FA27: 0xefa8a7 ... FA29: 0xefa8a9 [3]
                if (_pattern[_currentParticleIndex + 1] == 0xa8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x8e || _pattern[_currentParticleIndex + 2] == 0x8f
                                || _pattern[_currentParticleIndex + 2] == 0x91
                                || _pattern[_currentParticleIndex + 2] == 0x93
                                || _pattern[_currentParticleIndex + 2] == 0x94
                                || _pattern[_currentParticleIndex + 2] == 0x9f
                                || _pattern[_currentParticleIndex + 2] == 0xa1
                                || _pattern[_currentParticleIndex + 2] == 0xa3
                                || _pattern[_currentParticleIndex + 2] == 0xa4
                                || (_pattern[_currentParticleIndex + 2] >= 0xa7
                                    && _pattern[_currentParticleIndex + 2] <= 0xa9)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 20000: 0xf0a08080 ... 2A6DF: 0xf0aa9b9f [40960 + 1728 + 32 = 42720]
                // - 0xf0a08080 ... 0xf0a9bfbf [64*64*10=40960]
                if (_pattern[_currentParticleIndex + 1] >= 0xa0 && _pattern[_currentParticleIndex + 1] <= 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 0xf0aa8080 ... 0xf0aa9abf [64*27=1728]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x9a)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0aa9b80 .... 0xf0aa9b9f [32]
                        if (_pattern[_currentParticleIndex + 2] == 0x9b) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0x9f
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 2A700: 0xf0aa9c80 ... 2B81D: 0xf0aba09d [2304 + 2048 + 30 = 4382]
                        // - 0xf0aa9c80 ... 0xf0aabfbf [64*36=2304]
                        if (_pattern[_currentParticleIndex + 2] >= 0x9c && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0ab8080 ... 0xf0ab9fbf [64*32=2048]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x9f)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0aba080 ... 0xf0aba09d [30]
                        // 2B820: 0xf0aba0a0 ... 2CEAD: 0xf0acbaad [32 + 1984 + 3712 + 46 = 5774]
                        // - 0xf0aba0a0 ... 0xf0aba0bf [32]
                        if (_pattern[_currentParticleIndex + 2] == 0xa0) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x9d)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xa0
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                        // 0xf0aba180 ... 0xf0abbfbf [64*31=1984]
                        if (_pattern[_currentParticleIndex + 2] >= 0xa1 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xac) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0ac8080 ... 0xf0acb9bf [64*58=3712]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xb9)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 0xf0acba80 ...0xf0acbaad [46]
                        // 2CEB0: 0xf0acbab0 ... 2EBE0: 0xf0aeafa0 [16 + 320 + 4096 + 3008 + 33 = 7473]
                        // - 0xf0acbab0 ... 0xf0acbabf [16]
                        if (_pattern[_currentParticleIndex + 2] == 0xba) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0xad)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0acbb80 ... 0xf0acbfbf [64*5=320]
                        if (_pattern[_currentParticleIndex + 2] >= 0xbb && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 0xf0ad8080 ... 0xf0adbfbf [64*64=4096]
                        // - last: 0xf0aeafa0
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xae) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 0xf0ae8080 ... 0xf0aeaebf [64*47=3008]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xae)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 0xf0aeaf80 ... 0xf0aeafa0 [33]
                        // 2EBF0: 0xf0aeafb0 ... 2EE5D: 0xf0aeb99d [16 + 576 + 30 = 622]
                        // - 0xf0aeafb0 ... 0xf0aeafbf [16]
                        if (_pattern[_currentParticleIndex + 2] == 0xaf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0xa0)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0aeb080 ... 0xf0aeb8bf [64*9=576]
                        if (_pattern[_currentParticleIndex + 2] >= 0xb0 && _pattern[_currentParticleIndex + 2] <= 0xb8)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0aeb980 ... 0xf0aeb99d [30]
                        if (_pattern[_currentParticleIndex + 2] == 0xb9) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0x9d
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 30000: 0xf0b08080 ... 3134A: 0xf0b18d8a [4096 + 832 + 11 = 4939]
                        // - 0xf0b08080 ... 0xf0b0bfbf [64*64=4096]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0b18080 ... 0xf0b18cbf [64*13=832]
                        // - last: 0xf0b18d8a
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x8c)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0b18d80 ... 0xf0b18d8a [11]
                        // 31350: 0xf0b18d90 ... 33479: 0xf0b391b9 [48 + 3200 + 4096 + 1088 + 58 = 8490]
                        // - 0xf0b18d90 ... 0xf0b18dbf [48]
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x8a)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x90
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0b18e80 ... 0xf0b1bfbf [64*50=3200]
                        if (_pattern[_currentParticleIndex + 2] >= 0x8e && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb2) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0b28080 ... 0xf0b2bfbf [64*64=4096]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0b38080 ... 0xf0b390bf [64*17=1088]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x90)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0b39180 ... 0xf0b391b9 [58]
                        if (_pattern[_currentParticleIndex + 2] == 0x91) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xb9
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyRadical(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2E80: 0xe2ba80 ... 2E99: 0xe2ba99 [26]
                // 2E9B: 0xe2ba9b ... 2EF3: 0xe2bbb3 [89]
                // - 0xe2ba9b ... 0xe2babf [37]
                if (_pattern[_currentParticleIndex + 1] == 0xba) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x99)
                                || (_pattern[_currentParticleIndex + 2] >= 0x9b
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // - 0xe2bb80 ... 0xe2bbb3 [52]
                if (_pattern[_currentParticleIndex + 1] == 0xbb) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xb3)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2F00: 0xe2bc80 ... 2FD5: 0xe2bf95 [214]
                // - 0xe2bc80 ... 0xe2bcbf [64]
                if (_pattern[_currentParticleIndex + 1] == 0xbc) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // - 0xe2bd80 ... 0xe2bdbf [64]
                if (_pattern[_currentParticleIndex + 1] == 0xbd) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // - 0xe2be80 ... 0xe2bebf [64]
                if (_pattern[_currentParticleIndex + 1] == 0xbe) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // - 0xe2bf80 ... 0xe2bf95 [22]
                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x95)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyIDSUnaryOperator(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2FFE: 0xe2bfbe ... 2FFF: 0xe2bfbf [2]
                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbe || _pattern[_currentParticleIndex + 2] == 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyIDSTrinaryOperator(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2FF2: 0xe2bfb2 ... 2FF3: 0xe2bfb3 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb2 || _pattern[_currentParticleIndex + 2] == 0xb3)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyIDSBinaryOperator(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2FF0: 0xe2bfb0 ... 2FF1: 0xe2bfb1 [2]
                // 2FF4: 0xe2bfb4 ... 2FFD: 0xe2bfbd [10]
                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xb0 || _pattern[_currentParticleIndex + 2] == 0xb1
                                || (_pattern[_currentParticleIndex + 2] >= 0xb4
                                    && _pattern[_currentParticleIndex + 2] <= 0xbd)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 31EF: 0xe387af
                if (_pattern[_currentParticleIndex + 1] == 0x87) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xaf) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyOtherGraphemeExtend(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xe0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 09BE: 0xe0a6be
                if (_pattern[_currentParticleIndex + 1] == 0xa6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbe) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 09D7: 0xe0a797
                if (_pattern[_currentParticleIndex + 1] == 0xa7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0B3E: 0xe0acbe
                if (_pattern[_currentParticleIndex + 1] == 0xac) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbe) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0B57: 0xe0ad97
                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0BBE: 0xe0aebe
                if (_pattern[_currentParticleIndex + 1] == 0xae) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbe) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0BD7: 0xe0af97
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0CC0: 0xe0b380
                // 0CC2: 0xe0b382
                // 0CC7: 0xe0b387 ... 0CC8: 0xe0b388 [2]
                // 0CCA: 0xe0b38a ... 0CCB: 0xe0b38b [2]
                // 0CD5: 0xe0b395 ... 0CD6: 0xe0b396 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xb3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80 || _pattern[_currentParticleIndex + 2] == 0x82
                                || _pattern[_currentParticleIndex + 2] == 0x87
                                || _pattern[_currentParticleIndex + 2] == 0x88
                                || _pattern[_currentParticleIndex + 2] == 0x8a
                                || _pattern[_currentParticleIndex + 2] == 0x8b
                                || _pattern[_currentParticleIndex + 2] == 0x95
                                || _pattern[_currentParticleIndex + 2] == 0x96
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0D3E: 0xe0b4be
                if (_pattern[_currentParticleIndex + 1] == 0xb4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbe) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0D57: 0xe0b597
                if (_pattern[_currentParticleIndex + 1] == 0xb5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0DCF: 0xe0b78f
                // 0DDF: 0xe0b79f
                if (_pattern[_currentParticleIndex + 1] == 0xb7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8f || _pattern[_currentParticleIndex + 2] == 0x9f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 1715: 0xe19c95
                // 1734: 0xe19cb4
                if (_pattern[_currentParticleIndex + 1] == 0x9c) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x95 || _pattern[_currentParticleIndex + 2] == 0xb4)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1B35: 0xe1acb5
                // 1B3B: 0xe1acbb
                // 1B3D: 0xe1acbd
                if (_pattern[_currentParticleIndex + 1] == 0xac) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xb5 || _pattern[_currentParticleIndex + 2] == 0xbb
                                || _pattern[_currentParticleIndex + 2] == 0xbd
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1B43: 0xe1ad83 ... 1B44: 0xe1ad84 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x83 || _pattern[_currentParticleIndex + 2] == 0x84)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1BAA: 0xe1aeaa
                if (_pattern[_currentParticleIndex + 1] == 0xae) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xaa) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1BF2: 0xe1afb2 ... 1BF3: 0xe1afb3 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb2 || _pattern[_currentParticleIndex + 2] == 0xb3)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 200C: 0xe2808c
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8c) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 302E: 0xe380ae ... 302F: 0xe380af [2]
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xae || _pattern[_currentParticleIndex + 2] == 0xaf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xea) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // A953: 0xeaa593
                if (_pattern[_currentParticleIndex + 1] == 0xa5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x93) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A9C0: 0xeaa780
                if (_pattern[_currentParticleIndex + 1] == 0xa7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x80) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // FF9E: 0xefbe9e ... FF9F: 0xefbe9f [2]
                if (_pattern[_currentParticleIndex + 1] == 0xbe) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9e || _pattern[_currentParticleIndex + 2] == 0x9f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x91) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 111C0: 0xf0918780
                        if (_pattern[_currentParticleIndex + 2] == 0x87) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x80) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11235: 0xf09188b5
                        if (_pattern[_currentParticleIndex + 2] == 0x88) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xb5) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1133E: 0xf0918cbe
                        if (_pattern[_currentParticleIndex + 2] == 0x8c) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xbe) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1134D: 0xf0918d8d
                        // 11357: 0xf0918d97
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x8d
                                        || _pattern[_currentParticleIndex + 3] == 0x97
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 113B8: 0xf0918eb8
                        if (_pattern[_currentParticleIndex + 2] == 0x8e) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xb8) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 113C2: 0xf0918f82
                        // 113C5: 0xf0918f85
                        // 113C7: 0xf0918f87 ... 113C9: 0xf0918f89 [3]
                        // 113CF: 0xf0918f8f
                        if (_pattern[_currentParticleIndex + 2] == 0x8f) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x82
                                        || _pattern[_currentParticleIndex + 3] == 0x85
                                        || (_pattern[_currentParticleIndex + 3] >= 0x87
                                            && _pattern[_currentParticleIndex + 3] <= 0x89)
                                        || _pattern[_currentParticleIndex + 3] == 0x8f
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 114B0: 0xf09192b0
                        // 114BD: 0xf09192bd
                        if (_pattern[_currentParticleIndex + 2] == 0x92) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb0
                                        || _pattern[_currentParticleIndex + 3] == 0xbd
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 115AF: 0xf09196af
                        if (_pattern[_currentParticleIndex + 2] == 0x96) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xaf) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 116B6: 0xf0919ab6
                        if (_pattern[_currentParticleIndex + 2] == 0x9a) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xb6) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11930: 0xf091a4b0
                        // 1193D: 0xf091a4bd
                        if (_pattern[_currentParticleIndex + 2] == 0xa4) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb0
                                        || _pattern[_currentParticleIndex + 3] == 0xbd
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11F41: 0xf091bd81
                        if (_pattern[_currentParticleIndex + 2] == 0xbd) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x81) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x96) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 16FF0: 0xf096bfb0 ... 16FF1: 0xf096bfb1 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb0
                                        || _pattern[_currentParticleIndex + 3] == 0xb1
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1D165: 0xf09d85a5 ... 1D166: 0xf09d85a6 [2]
                        // 1D16D: 0xf09d85ad ... 1D172: 0xf09d85b2 [6]
                        if (_pattern[_currentParticleIndex + 2] == 0x85) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xa5
                                        || _pattern[_currentParticleIndex + 3] == 0xa6
                                        || (_pattern[_currentParticleIndex + 3] >= 0xad
                                            && _pattern[_currentParticleIndex + 3] <= 0xb2)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // E0020: 0xf3a080a0 ... E007F: 0xf3a081bf [96]
                        // - 0xf3a080a0 ... 0xf3a080bf [32]
                        if (_pattern[_currentParticleIndex + 2] == 0x80) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xa0
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf3a08180 ... 0xf3a081bf [64]
                        if (_pattern[_currentParticleIndex + 2] == 0x81) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyNoncharacterCodePoint(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // FDD0: 0xefb790 ... FDEF: 0xefb7af [32]
                if (_pattern[_currentParticleIndex + 1] == 0xb7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x90 && _pattern[_currentParticleIndex + 2] <= 0xaf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FFFE: 0xefbfbe ... FFFF: 0xefbfbf [2]
                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbe || _pattern[_currentParticleIndex + 2] == 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1FFFE: 0xf09fbfbe ... 1FFFF: 0xf09fbfbf [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 2FFFE: 0xf0afbfbe ... 2FFFF: 0xf0afbfbf [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 3FFFE: 0xf0bfbfbe ... 3FFFF: 0xf0bfbfbf [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 4FFFE: 0xf18fbfbe ... 4FFFF: 0xf18fbfbf [2]
                if (_pattern[_currentParticleIndex + 1] == 0x8f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // 5FFFE: 0xf19fbfbe ... 5FFFF: 0xf19fbfbf [2]
                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // 6FFFE: 0xf1afbfbe ... 6FFFF: 0xf1afbfbf [2]
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // 7FFFE: 0xf1bfbfbe ... 7FFFF: 0xf1bfbfbf [2]
                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 8FFFE: 0xf28fbfbe ... 8FFFF: 0xf28fbfbf [2]
                if (_pattern[_currentParticleIndex + 1] == 0x8f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
                // 9FFFE: 0xf29fbfbe ... 9FFFF: 0xf29fbfbf [2]
                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // AFFFE: 0xf2afbfbe ... AFFFF: 0xf2afbfbf [2]
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // BFFFE: 0xf2bfbfbe ... BFFFF: 0xf2bfbfbf [2]
                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x8f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // CFFFE: 0xf38fbfbe ... CFFFF: 0xf38fbfbf [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // DFFFE: 0xf39fbfbe ... DFFFF: 0xf39fbfbf [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // EFFFE: 0xf3afbfbe ... EFFFF: 0xf3afbfbf [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // FFFFE: 0xf3bfbfbe ... FFFFF: 0xf3bfbfbf [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf4) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x8f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 10FFFE: 0xf48fbfbe ... 10FFFF: 0xf48fbfbf [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyOtherUppercase(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2160: 0xe285a0 ... 216F: 0xe285af [16]
                if (_pattern[_currentParticleIndex + 1] == 0x85) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa0 && _pattern[_currentParticleIndex + 2] <= 0xaf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 24B6: 0xe292b6 ... 24CF: 0xe2938f [26]
                // - 0xe292b6 ... 0xe292bf [10]
                if (_pattern[_currentParticleIndex + 1] == 0x92) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb6 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // - 0xe29380 ... 0xe2938f [16]
                if (_pattern[_currentParticleIndex + 1] == 0x93) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x8f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1F130: 0xf09f84b0 ... 1F149: 0xf09f8589 [26]
                        //  - 0xf09f84b0 ... 0xf09f84bf [16]
                        if (_pattern[_currentParticleIndex + 2] == 0x84) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb0
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf09f8580 ... 0xf09f8589 [10]
                        // 1F150: 0xf09f8590 ... 1F169: 0xf09f85a9 [26]
                        // 1F170: 0xf09f85b0 ... 1F189: 0xf09f8689 [26]
                        // - 0xf09f85b0 ... 0xf09f85bf [16]
                        if (_pattern[_currentParticleIndex + 2] == 0x85) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x89)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x90
                                            && _pattern[_currentParticleIndex + 3] <= 0xa9)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf09f8680 ... 0xf09f8689 [10]
                        if (_pattern[_currentParticleIndex + 2] == 0x86) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0x89
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyOtherLowercase(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 00AA: 0xc2aa
        // 00BA: 0xc2ba
        if (_pattern[_currentParticleIndex] == 0xc2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xaa || _pattern[_currentParticleIndex + 1] == 0xba) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 02B0: 0xcab0 ... 02B8: 0xcab8 [9]
        if (_pattern[_currentParticleIndex] == 0xca) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0xb0 && _pattern[_currentParticleIndex + 1] <= 0xb8) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 02C0: 0xcb80 ... 02C1: 0xcb81 [2]
        // 02E0: 0xcba0 ... 02E4: 0xcba4 [5]
        if (_pattern[_currentParticleIndex] == 0xcb) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    _pattern[_currentParticleIndex + 1] == 0x80 || _pattern[_currentParticleIndex + 1] == 0x81
                        || (_pattern[_currentParticleIndex + 1] >= 0xa0 && _pattern[_currentParticleIndex + 1] <= 0xa4)
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0345: 0xcd85
        // 037A: 0xcdba
        if (_pattern[_currentParticleIndex] == 0xcd) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x85 || _pattern[_currentParticleIndex + 1] == 0xba) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 10FC: 0xe183bc
                if (_pattern[_currentParticleIndex + 1] == 0x83) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1D2C: 0xe1b4ac ... 1D6A: 0xe1b5aa [63]
                // - 0xe1b4ac ... 0xe1b4bf
                if (_pattern[_currentParticleIndex + 1] == 0xb4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xac && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // - 0xe1b580 ... 0xe1b5aa
                // 1D78: 0xe1b5b8
                if (_pattern[_currentParticleIndex + 1] == 0xb5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xaa)
                                || _pattern[_currentParticleIndex + 2] == 0xb8
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1D9B: 0xe1b69b ... 1DBF: 0xe1b6bf [37]
                if (_pattern[_currentParticleIndex + 1] == 0xb6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x9b && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2071: 0xe281b1
                // 207F: 0xe281bf
                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb1 || _pattern[_currentParticleIndex + 2] == 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2090: 0xe28290 ... 209C: 0xe2829c [13]
                if (_pattern[_currentParticleIndex + 1] == 0x82) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x90 && _pattern[_currentParticleIndex + 2] <= 0x9c)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2170: 0xe285b0 ... 217F: 0xe285bf [16]
                if (_pattern[_currentParticleIndex + 1] == 0x85) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb0 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 24D0: 0xe29390 ... 24E9: 0xe293a9 [26]
                if (_pattern[_currentParticleIndex + 1] == 0x93) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x90 && _pattern[_currentParticleIndex + 2] <= 0xa9)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2C7C: 0xe2b1bc ... 2C7D: 0xe2b1bd [2]
                if (_pattern[_currentParticleIndex + 1] == 0xb1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbc || _pattern[_currentParticleIndex + 2] == 0xbd)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xea) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // A69C: 0xea9a9c ... A69D: 0xea9a9d [2]
                if (_pattern[_currentParticleIndex + 1] == 0x9a) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9c || _pattern[_currentParticleIndex + 2] == 0x9d)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A770: 0xea9db0
                if (_pattern[_currentParticleIndex + 1] == 0x9d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb0) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A7F1: 0xea9fb1 ... A7F4: 0xea9fb4 [4]
                // A7F8: 0xea9fb8 ... A7F9: 0xea9fb9 [2]
                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0xb1 && _pattern[_currentParticleIndex + 2] <= 0xb4)
                                || _pattern[_currentParticleIndex + 2] == 0xb8
                                || _pattern[_currentParticleIndex + 2] == 0xb9
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AB5C: 0xeaad9c ... AB5F: 0xeaad9f [4]
                // AB69: 0xeaada9
                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x9c && _pattern[_currentParticleIndex + 2] <= 0x9f)
                                || _pattern[_currentParticleIndex + 2] == 0xa9
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x90) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 10780: 0xf0909e80
                        // 10783: 0xf0909e83 ... 10785: 0xf0909e85 [3]
                        // 10787: 0xf0909e87 ... 107B0: 0xf0909eb0 [42]
                        // 107B2: 0xf0909eb2 ... 107BA: 0xf0909eba [9]
                        if (_pattern[_currentParticleIndex + 2] == 0x9e) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x80
                                        || (_pattern[_currentParticleIndex + 3] >= 0x83
                                            && _pattern[_currentParticleIndex + 3] <= 0x85)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x87
                                            && _pattern[_currentParticleIndex + 3] <= 0xb0)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb2
                                            && _pattern[_currentParticleIndex + 3] <= 0xba)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9e) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1E030: 0xf09e80b0 ... 1E06D: 0xf09e81ad [62]
                        if (_pattern[_currentParticleIndex + 2] == 0x80) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb0
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x81) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xad
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyExtender(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 00B7: 0xc2b7
        if (_pattern[_currentParticleIndex] == 0xc2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xb7) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 02D0: 0xcb90 ... 02D1: 0xcb91 [2]
        if (_pattern[_currentParticleIndex] == 0xcb) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x90 || _pattern[_currentParticleIndex + 1] == 0x91) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0640: 0xd980
        if (_pattern[_currentParticleIndex] == 0xd9) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 07FA: 0xdfba
        if (_pattern[_currentParticleIndex] == 0xdf) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xba) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 0A71: 0xe0a9b1
                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb1) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0AFB: 0xe0abbb
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbb) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0B55: 0xe0ad95
                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x95) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0E46: 0xe0b986
                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x86) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0EC6: 0xe0bb86
                if (_pattern[_currentParticleIndex + 1] == 0xbb) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x86) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 180A: 0xe1a08a
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8a) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1843: 0xe1a183
                if (_pattern[_currentParticleIndex + 1] == 0xa1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x83) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1AA7: 0xe1aaa7
                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa7) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1C36: 0xe1b0b6
                if (_pattern[_currentParticleIndex + 1] == 0xb0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb6) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1C7B: 0xe1b1bb
                if (_pattern[_currentParticleIndex + 1] == 0xb1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbb) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 3005: 0xe38085
                // 3031: 0xe380b1 ... 3035: 0xe380b5 [5]
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x85
                                || (_pattern[_currentParticleIndex + 2] >= 0xb1
                                    && _pattern[_currentParticleIndex + 2] <= 0xb5)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 309D: 0xe3829d ... 309E: 0xe3829e [2]
                if (_pattern[_currentParticleIndex + 1] == 0x82) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9d || _pattern[_currentParticleIndex + 2] == 0x9e)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 30FC: 0xe383bc ... 30FE: 0xe383be [3]
                if (_pattern[_currentParticleIndex + 1] == 0x83) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xbc && _pattern[_currentParticleIndex + 2] <= 0xbe)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xea) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // A015: 0xea8095
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x95) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A60C: 0xea988c
                if (_pattern[_currentParticleIndex + 1] == 0x98) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8c) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A9CF: 0xeaa78f
                // A9E6: 0xeaa7a6
                if (_pattern[_currentParticleIndex + 1] == 0xa7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8f || _pattern[_currentParticleIndex + 2] == 0xa6)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AA70: 0xeaa9b0
                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb0) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AADD: 0xeaab9d
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9d) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AAF3: 0xeaabb3 ... AAF4: 0xeaabb4 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb3 || _pattern[_currentParticleIndex + 2] == 0xb4)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // FF70: 0xefbdb0
                if (_pattern[_currentParticleIndex + 1] == 0xbd) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb0) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x90) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 10781: 0xf0909e81 ... 10782: 0xf0909e82 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x9e) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x81
                                        || _pattern[_currentParticleIndex + 3] == 0x82
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10D4E: 0xf090b58e
                        // 10D6A: 0xf090b5aa
                        // 10D6F: 0xf090b5af
                        if (_pattern[_currentParticleIndex + 2] == 0xb5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x8e
                                        || _pattern[_currentParticleIndex + 3] == 0xaa
                                        || _pattern[_currentParticleIndex + 3] == 0xaf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x91) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 11237: 0xf09188b7
                        if (_pattern[_currentParticleIndex + 2] == 0x88) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xb7) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1135D: 0xf0918d9d
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x9d) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 113D2: 0xf0918f92
                        // 113D3: 0xf0918f93
                        if (_pattern[_currentParticleIndex + 2] == 0x8f) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x92
                                        || _pattern[_currentParticleIndex + 3] == 0x93
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 115C6: 0xf0919786 ... 115C8: 0xf0919788 [3]
                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x86
                                        && _pattern[_currentParticleIndex + 3] <= 0x88
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11A98: 0xf091aa98
                        // 11DD9: 0xf091b799
                        if (_pattern[_currentParticleIndex + 2] == 0xaa) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x98) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xb7) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x99) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x96) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 16B42: 0xf096ad82 ... 16B43: 0xf096ad83 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xad) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xa4
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb2
                                            && _pattern[_currentParticleIndex + 3] <= 0xb6)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16FE0: 0xf096bfa0 ... 16FE1: 0xf096bfa1 [2]
                        // 16FE3: 0xf096bfa3
                        // 16FF2: 0xf096bfb2 ... 16FF3: 0xf096bfb3 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xa0
                                        || _pattern[_currentParticleIndex + 3] == 0xa1
                                        || _pattern[_currentParticleIndex + 3] == 0xa3
                                        || _pattern[_currentParticleIndex + 3] == 0xb2
                                        || _pattern[_currentParticleIndex + 3] == 0xb3
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9e) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1E13C: 0xf09e84bc ... 1E13D: 0xf09e84bd [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x84) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbc
                                        || _pattern[_currentParticleIndex + 3] == 0xbd
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1E5EF: 0xf09e97af
                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xaf) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1E944: 0xf09ea584 ... 1E946: 0xf09ea586 [3]
                        if (_pattern[_currentParticleIndex + 2] == 0xa5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x84
                                        && _pattern[_currentParticleIndex + 3] <= 0x86
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyIdeographic(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 3006: 0xe38086
                // 3007: 0xe38087
                // 3021: 0xe380a1 ... 3029: 0xe380a9 [9]
                // 3038: 0xe380b8 ... 303A: 0xe380ba [3]
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x86 || _pattern[_currentParticleIndex + 2] == 0x87
                                || (_pattern[_currentParticleIndex + 2] >= 0xa1
                                    && _pattern[_currentParticleIndex + 2] <= 0xa9)
                                || (_pattern[_currentParticleIndex + 2] >= 0xb8
                                    && _pattern[_currentParticleIndex + 2] <= 0xba)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 3400: 0xe39080 ... 4DBF: 0xe4b6bf [6592] - ORIGINAL
                // - 0xe39080 ... 0xe390bf [64]
                // - 0xe39180 ... 0xe391bf [64]
                // - 0xe39280 ... 0xe392bf [64]
                // - 0xe39380 ... 0xe393bf [64]
                // - 0xe39480 ... 0xe394bf [64]
                // - 0xe39580 ... 0xe395bf [64]
                // - 0xe39680 ... 0xe396bf [64]
                // - 0xe39780 ... 0xe397bf [64]
                // - 0xe39880 ... 0xe398bf [64]
                // - 0xe39980 ... 0xe399bf [64]
                // - 0xe39a80 ... 0xe39abf [64]
                // - 0xe39b80 ... 0xe39bbf [64]
                // - 0xe39c80 ... 0xe39cbf [64]
                // - 0xe39d80 ... 0xe39dbf [64]
                // - 0xe39e80 ... 0xe39ebf [64]
                // - 0xe39f80 ... 0xe39fbf [64]
                // - 0xe3a080 ... 0xe3a0bf [64]
                // - 0xe3a180 ... 0xe3a1bf [64]
                // - 0xe3a280 ... 0xe3a2bf [64]
                // - 0xe3a380 ... 0xe3a3bf [64]
                // - 0xe3a480 ... 0xe3a4bf [64]
                // - 0xe3a580 ... 0xe3a5bf [64]
                // - 0xe3a680 ... 0xe3a6bf [64]
                // - 0xe3a780 ... 0xe3a7bf [64]
                // - 0xe3a880 ... 0xe3a8bf [64]
                // - 0xe3a980 ... 0xe3a9bf [64]
                // - 0xe3aa80 ... 0xe3aabf [64]
                // - 0xe3ab80 ... 0xe3abbf [64]
                // - 0xe3ac80 ... 0xe3acbf [64]
                // - 0xe3ad80 ... 0xe3adbf [64]
                // - 0xe3ae80 ... 0xe3aebf [64]
                // - 0xe3af80 ... 0xe3afbf [64]
                // - 0xe3b080 ... 0xe3b0bf [64]
                // - 0xe3b180 ... 0xe3b1bf [64]
                // - 0xe3b280 ... 0xe3b2bf [64]
                // - 0xe3b380 ... 0xe3b3bf [64]
                // - 0xe3b480 ... 0xe3b4bf [64]
                // - 0xe3b580 ... 0xe3b5bf [64]
                // - 0xe3b680 ... 0xe3b6bf [64]
                // - 0xe3b780 ... 0xe3b7bf [64]
                // - 0xe3b880 ... 0xe3b8bf [64]
                // - 0xe3b980 ... 0xe3b9bf [64]
                // - 0xe3ba80 ... 0xe3babf [64]
                // - 0xe3bb80 ... 0xe3bbbf [64]
                // - 0xe3bc80 ... 0xe3bcbf [64]
                // - 0xe3bd80 ... 0xe3bdbf [64]
                // - 0xe3be80 ... 0xe3bebf [64]
                // - 0xe3bf80 ... 0xe3bfbf [64]
                if (_pattern[_currentParticleIndex + 1] >= 0x90 && _pattern[_currentParticleIndex + 1] <= 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe4) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // - 0xe48080 ... 0xe480bf [64]
                // - 0xe48180 ... 0xe481bf [64]
                // - 0xe48280 ... 0xe482bf [64]
                // - 0xe48380 ... 0xe483bf [64]
                // - 0xe48480 ... 0xe484bf [64]
                // - 0xe48580 ... 0xe485bf [64]
                // - 0xe48680 ... 0xe486bf [64]
                // - 0xe48780 ... 0xe487bf [64]
                // - 0xe48880 ... 0xe488bf [64]
                // - 0xe48980 ... 0xe489bf [64]
                // - 0xe48a80 ... 0xe48abf [64]
                // - 0xe48b80 ... 0xe48bbf [64]
                // - 0xe48c80 ... 0xe48cbf [64]
                // - 0xe48d80 ... 0xe48dbf [64]
                // - 0xe48e80 ... 0xe48ebf [64]
                // - 0xe48f80 ... 0xe48fbf [64]
                // - 0xe49080 ... 0xe490bf [64]
                // - 0xe49180 ... 0xe491bf [64]
                // - 0xe49280 ... 0xe492bf [64]
                // - 0xe49380 ... 0xe493bf [64]
                // - 0xe49480 ... 0xe494bf [64]
                // - 0xe49580 ... 0xe495bf [64]
                // - 0xe49680 ... 0xe496bf [64]
                // - 0xe49780 ... 0xe497bf [64]
                // - 0xe49880 ... 0xe498bf [64]
                // - 0xe49980 ... 0xe499bf [64]
                // - 0xe49a80 ... 0xe49abf [64]
                // - 0xe49b80 ... 0xe49bbf [64]
                // - 0xe49c80 ... 0xe49cbf [64]
                // - 0xe49d80 ... 0xe49dbf [64]
                // - 0xe49e80 ... 0xe49ebf [64]
                // - 0xe49f80 ... 0xe49fbf [64]
                // - 0xe4a080 ... 0xe4a0bf [64]
                // - 0xe4a180 ... 0xe4a1bf [64]
                // - 0xe4a280 ... 0xe4a2bf [64]
                // - 0xe4a380 ... 0xe4a3bf [64]
                // - 0xe4a480 ... 0xe4a4bf [64]
                // - 0xe4a580 ... 0xe4a5bf [64]
                // - 0xe4a680 ... 0xe4a6bf [64]
                // - 0xe4a780 ... 0xe4a7bf [64]
                // - 0xe4a880 ... 0xe4a8bf [64]
                // - 0xe4a980 ... 0xe4a9bf [64]
                // - 0xe4aa80 ... 0xe4aabf [64]
                // - 0xe4ab80 ... 0xe4abbf [64]
                // - 0xe4ac80 ... 0xe4acbf [64]
                // - 0xe4ad80 ... 0xe4adbf [64]
                // - 0xe4ae80 ... 0xe4aebf [64]
                // - 0xe4af80 ... 0xe4afbf [64]
                // - 0xe4b080 ... 0xe4b0bf [64]
                // - 0xe4b180 ... 0xe4b1bf [64]
                // - 0xe4b280 ... 0xe4b2bf [64]
                // - 0xe4b380 ... 0xe4b3bf [64]
                // - 0xe4b480 ... 0xe4b4bf [64]
                // - 0xe4b580 ... 0xe4b5bf [64]
                // - 0xe4b680 ... 0xe4b6bf [64]
                if (_pattern[_currentParticleIndex + 1] >= 0x80 && _pattern[_currentParticleIndex + 1] <= 0xb6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 4E00: 0xe4b880 ... 9FFF: 0xe9bfbf [328*64 = 20992] - ORIGINAL
                // - 0xe4b880 ... 0xe4b8bf [64]
                // - 0xe4b980 ... 0xe4b9bf [64]
                // - 0xe4ba80 ... 0xe4babf [64]
                // - 0xe4bb80 ... 0xe4bbbf [64]
                // - 0xe4bc80 ... 0xe4bcbf [64]
                // - 0xe4bd80 ... 0xe4bdbf [64]
                // - 0xe4be80 ... 0xe4bebf [64]
                // - 0xe4bf80 ... 0xe4bfbf [64]
                if (_pattern[_currentParticleIndex + 1] >= 0xb8 && _pattern[_currentParticleIndex + 1] <= 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] >= 0xe5 && _pattern[_currentParticleIndex] <= 0xe9) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // - 0xe58080 ... 0xe580bf [64]
                // - 0xe58180 ... 0xe581bf [64]
                // - 0xe58280 ... 0xe582bf [64]
                // - 0xe58380 ... 0xe583bf [64]
                // - 0xe58480 ... 0xe584bf [64]
                // - 0xe58580 ... 0xe585bf [64]
                // - 0xe58680 ... 0xe586bf [64]
                // - 0xe58780 ... 0xe587bf [64]
                // - 0xe58880 ... 0xe588bf [64]
                // - 0xe58980 ... 0xe589bf [64]
                // - 0xe58a80 ... 0xe58abf [64]
                // - 0xe58b80 ... 0xe58bbf [64]
                // - 0xe58c80 ... 0xe58cbf [64]
                // - 0xe58d80 ... 0xe58dbf [64]
                // - 0xe58e80 ... 0xe58ebf [64]
                // - 0xe58f80 ... 0xe58fbf [64]
                // - 0xe59080 ... 0xe590bf [64]
                // - 0xe59180 ... 0xe591bf [64]
                // - 0xe59280 ... 0xe592bf [64]
                // - 0xe59380 ... 0xe593bf [64]
                // - 0xe59480 ... 0xe594bf [64]
                // - 0xe59580 ... 0xe595bf [64]
                // - 0xe59680 ... 0xe596bf [64]
                // - 0xe59780 ... 0xe597bf [64]
                // - 0xe59880 ... 0xe598bf [64]
                // - 0xe59980 ... 0xe599bf [64]
                // - 0xe59a80 ... 0xe59abf [64]
                // - 0xe59b80 ... 0xe59bbf [64]
                // - 0xe59c80 ... 0xe59cbf [64]
                // - 0xe59d80 ... 0xe59dbf [64]
                // - 0xe59e80 ... 0xe59ebf [64]
                // - 0xe59f80 ... 0xe59fbf [64]
                // - 0xe5a080 ... 0xe5a0bf [64]
                // - 0xe5a180 ... 0xe5a1bf [64]
                // - 0xe5a280 ... 0xe5a2bf [64]
                // - 0xe5a380 ... 0xe5a3bf [64]
                // - 0xe5a480 ... 0xe5a4bf [64]
                // - 0xe5a580 ... 0xe5a5bf [64]
                // - 0xe5a680 ... 0xe5a6bf [64]
                // - 0xe5a780 ... 0xe5a7bf [64]
                // - 0xe5a880 ... 0xe5a8bf [64]
                // - 0xe5a980 ... 0xe5a9bf [64]
                // - 0xe5aa80 ... 0xe5aabf [64]
                // - 0xe5ab80 ... 0xe5abbf [64]
                // - 0xe5ac80 ... 0xe5acbf [64]
                // - 0xe5ad80 ... 0xe5adbf [64]
                // - 0xe5ae80 ... 0xe5aebf [64]
                // - 0xe5af80 ... 0xe5afbf [64]
                // - 0xe5b080 ... 0xe5b0bf [64]
                // - 0xe5b180 ... 0xe5b1bf [64]
                // - 0xe5b280 ... 0xe5b2bf [64]
                // - 0xe5b380 ... 0xe5b3bf [64]
                // - 0xe5b480 ... 0xe5b4bf [64]
                // - 0xe5b580 ... 0xe5b5bf [64]
                // - 0xe5b680 ... 0xe5b6bf [64]
                // - 0xe5b780 ... 0xe5b7bf [64]
                // - 0xe5b880 ... 0xe5b8bf [64]
                // - 0xe5b980 ... 0xe5b9bf [64]
                // - 0xe5ba80 ... 0xe5babf [64]
                // - 0xe5bb80 ... 0xe5bbbf [64]
                // - 0xe5bc80 ... 0xe5bcbf [64]
                // - 0xe5bd80 ... 0xe5bdbf [64]
                // - 0xe5be80 ... 0xe5bebf [64]
                // - 0xe5bf80 ... 0xe5bfbf [64]
                // - 0xe68080 ... 0xe680bf [64]
                // - 0xe68180 ... 0xe681bf [64]
                // - 0xe68280 ... 0xe682bf [64]
                // - 0xe68380 ... 0xe683bf [64]
                // - 0xe68480 ... 0xe684bf [64]
                // - 0xe68580 ... 0xe685bf [64]
                // - 0xe68680 ... 0xe686bf [64]
                // - 0xe68780 ... 0xe687bf [64]
                // - 0xe68880 ... 0xe688bf [64]
                // - 0xe68980 ... 0xe689bf [64]
                // - 0xe68a80 ... 0xe68abf [64]
                // - 0xe68b80 ... 0xe68bbf [64]
                // - 0xe68c80 ... 0xe68cbf [64]
                // - 0xe68d80 ... 0xe68dbf [64]
                // - 0xe68e80 ... 0xe68ebf [64]
                // - 0xe68f80 ... 0xe68fbf [64]
                // - 0xe69080 ... 0xe690bf [64]
                // - 0xe69180 ... 0xe691bf [64]
                // - 0xe69280 ... 0xe692bf [64]
                // - 0xe69380 ... 0xe693bf [64]
                // - 0xe69480 ... 0xe694bf [64]
                // - 0xe69580 ... 0xe695bf [64]
                // - 0xe69680 ... 0xe696bf [64]
                // - 0xe69780 ... 0xe697bf [64]
                // - 0xe69880 ... 0xe698bf [64]
                // - 0xe69980 ... 0xe699bf [64]
                // - 0xe69a80 ... 0xe69abf [64]
                // - 0xe69b80 ... 0xe69bbf [64]
                // - 0xe69c80 ... 0xe69cbf [64]
                // - 0xe69d80 ... 0xe69dbf [64]
                // - 0xe69e80 ... 0xe69ebf [64]
                // - 0xe69f80 ... 0xe69fbf [64]
                // - 0xe6a080 ... 0xe6a0bf [64]
                // - 0xe6a180 ... 0xe6a1bf [64]
                // - 0xe6a280 ... 0xe6a2bf [64]
                // - 0xe6a380 ... 0xe6a3bf [64]
                // - 0xe6a480 ... 0xe6a4bf [64]
                // - 0xe6a580 ... 0xe6a5bf [64]
                // - 0xe6a680 ... 0xe6a6bf [64]
                // - 0xe6a780 ... 0xe6a7bf [64]
                // - 0xe6a880 ... 0xe6a8bf [64]
                // - 0xe6a980 ... 0xe6a9bf [64]
                // - 0xe6aa80 ... 0xe6aabf [64]
                // - 0xe6ab80 ... 0xe6abbf [64]
                // - 0xe6ac80 ... 0xe6acbf [64]
                // - 0xe6ad80 ... 0xe6adbf [64]
                // - 0xe6ae80 ... 0xe6aebf [64]
                // - 0xe6af80 ... 0xe6afbf [64]
                // - 0xe6b080 ... 0xe6b0bf [64]
                // - 0xe6b180 ... 0xe6b1bf [64]
                // - 0xe6b280 ... 0xe6b2bf [64]
                // - 0xe6b380 ... 0xe6b3bf [64]
                // - 0xe6b480 ... 0xe6b4bf [64]
                // - 0xe6b580 ... 0xe6b5bf [64]
                // - 0xe6b680 ... 0xe6b6bf [64]
                // - 0xe6b780 ... 0xe6b7bf [64]
                // - 0xe6b880 ... 0xe6b8bf [64]
                // - 0xe6b980 ... 0xe6b9bf [64]
                // - 0xe6ba80 ... 0xe6babf [64]
                // - 0xe6bb80 ... 0xe6bbbf [64]
                // - 0xe6bc80 ... 0xe6bcbf [64]
                // - 0xe6bd80 ... 0xe6bdbf [64]
                // - 0xe6be80 ... 0xe6bebf [64]
                // - 0xe6bf80 ... 0xe6bfbf [64]
                // - 0xe78080 ... 0xe780bf [64]
                // - 0xe78180 ... 0xe781bf [64]
                // - 0xe78280 ... 0xe782bf [64]
                // - 0xe78380 ... 0xe783bf [64]
                // - 0xe78480 ... 0xe784bf [64]
                // - 0xe78580 ... 0xe785bf [64]
                // - 0xe78680 ... 0xe786bf [64]
                // - 0xe78780 ... 0xe787bf [64]
                // - 0xe78880 ... 0xe788bf [64]
                // - 0xe78980 ... 0xe789bf [64]
                // - 0xe78a80 ... 0xe78abf [64]
                // - 0xe78b80 ... 0xe78bbf [64]
                // - 0xe78c80 ... 0xe78cbf [64]
                // - 0xe78d80 ... 0xe78dbf [64]
                // - 0xe78e80 ... 0xe78ebf [64]
                // - 0xe78f80 ... 0xe78fbf [64]
                // - 0xe79080 ... 0xe790bf [64]
                // - 0xe79180 ... 0xe791bf [64]
                // - 0xe79280 ... 0xe792bf [64]
                // - 0xe79380 ... 0xe793bf [64]
                // - 0xe79480 ... 0xe794bf [64]
                // - 0xe79580 ... 0xe795bf [64]
                // - 0xe79680 ... 0xe796bf [64]
                // - 0xe79780 ... 0xe797bf [64]
                // - 0xe79880 ... 0xe798bf [64]
                // - 0xe79980 ... 0xe799bf [64]
                // - 0xe79a80 ... 0xe79abf [64]
                // - 0xe79b80 ... 0xe79bbf [64]
                // - 0xe79c80 ... 0xe79cbf [64]
                // - 0xe79d80 ... 0xe79dbf [64]
                // - 0xe79e80 ... 0xe79ebf [64]
                // - 0xe79f80 ... 0xe79fbf [64]
                // - 0xe7a080 ... 0xe7a0bf [64]
                // - 0xe7a180 ... 0xe7a1bf [64]
                // - 0xe7a280 ... 0xe7a2bf [64]
                // - 0xe7a380 ... 0xe7a3bf [64]
                // - 0xe7a480 ... 0xe7a4bf [64]
                // - 0xe7a580 ... 0xe7a5bf [64]
                // - 0xe7a680 ... 0xe7a6bf [64]
                // - 0xe7a780 ... 0xe7a7bf [64]
                // - 0xe7a880 ... 0xe7a8bf [64]
                // - 0xe7a980 ... 0xe7a9bf [64]
                // - 0xe7aa80 ... 0xe7aabf [64]
                // - 0xe7ab80 ... 0xe7abbf [64]
                // - 0xe7ac80 ... 0xe7acbf [64]
                // - 0xe7ad80 ... 0xe7adbf [64]
                // - 0xe7ae80 ... 0xe7aebf [64]
                // - 0xe7af80 ... 0xe7afbf [64]
                // - 0xe7b080 ... 0xe7b0bf [64]
                // - 0xe7b180 ... 0xe7b1bf [64]
                // - 0xe7b280 ... 0xe7b2bf [64]
                // - 0xe7b380 ... 0xe7b3bf [64]
                // - 0xe7b480 ... 0xe7b4bf [64]
                // - 0xe7b580 ... 0xe7b5bf [64]
                // - 0xe7b680 ... 0xe7b6bf [64]
                // - 0xe7b780 ... 0xe7b7bf [64]
                // - 0xe7b880 ... 0xe7b8bf [64]
                // - 0xe7b980 ... 0xe7b9bf [64]
                // - 0xe7ba80 ... 0xe7babf [64]
                // - 0xe7bb80 ... 0xe7bbbf [64]
                // - 0xe7bc80 ... 0xe7bcbf [64]
                // - 0xe7bd80 ... 0xe7bdbf [64]
                // - 0xe7be80 ... 0xe7bebf [64]
                // - 0xe7bf80 ... 0xe7bfbf [64]
                // - 0xe88080 ... 0xe880bf [64]
                // - 0xe88180 ... 0xe881bf [64]
                // - 0xe88280 ... 0xe882bf [64]
                // - 0xe88380 ... 0xe883bf [64]
                // - 0xe88480 ... 0xe884bf [64]
                // - 0xe88580 ... 0xe885bf [64]
                // - 0xe88680 ... 0xe886bf [64]
                // - 0xe88780 ... 0xe887bf [64]
                // - 0xe88880 ... 0xe888bf [64]
                // - 0xe88980 ... 0xe889bf [64]
                // - 0xe88a80 ... 0xe88abf [64]
                // - 0xe88b80 ... 0xe88bbf [64]
                // - 0xe88c80 ... 0xe88cbf [64]
                // - 0xe88d80 ... 0xe88dbf [64]
                // - 0xe88e80 ... 0xe88ebf [64]
                // - 0xe88f80 ... 0xe88fbf [64]
                // - 0xe89080 ... 0xe890bf [64]
                // - 0xe89180 ... 0xe891bf [64]
                // - 0xe89280 ... 0xe892bf [64]
                // - 0xe89380 ... 0xe893bf [64]
                // - 0xe89480 ... 0xe894bf [64]
                // - 0xe89580 ... 0xe895bf [64]
                // - 0xe89680 ... 0xe896bf [64]
                // - 0xe89780 ... 0xe897bf [64]
                // - 0xe89880 ... 0xe898bf [64]
                // - 0xe89980 ... 0xe899bf [64]
                // - 0xe89a80 ... 0xe89abf [64]
                // - 0xe89b80 ... 0xe89bbf [64]
                // - 0xe89c80 ... 0xe89cbf [64]
                // - 0xe89d80 ... 0xe89dbf [64]
                // - 0xe89e80 ... 0xe89ebf [64]
                // - 0xe89f80 ... 0xe89fbf [64]
                // - 0xe8a080 ... 0xe8a0bf [64]
                // - 0xe8a180 ... 0xe8a1bf [64]
                // - 0xe8a280 ... 0xe8a2bf [64]
                // - 0xe8a380 ... 0xe8a3bf [64]
                // - 0xe8a480 ... 0xe8a4bf [64]
                // - 0xe8a580 ... 0xe8a5bf [64]
                // - 0xe8a680 ... 0xe8a6bf [64]
                // - 0xe8a780 ... 0xe8a7bf [64]
                // - 0xe8a880 ... 0xe8a8bf [64]
                // - 0xe8a980 ... 0xe8a9bf [64]
                // - 0xe8aa80 ... 0xe8aabf [64]
                // - 0xe8ab80 ... 0xe8abbf [64]
                // - 0xe8ac80 ... 0xe8acbf [64]
                // - 0xe8ad80 ... 0xe8adbf [64]
                // - 0xe8ae80 ... 0xe8aebf [64]
                // - 0xe8af80 ... 0xe8afbf [64]
                // - 0xe8b080 ... 0xe8b0bf [64]
                // - 0xe8b180 ... 0xe8b1bf [64]
                // - 0xe8b280 ... 0xe8b2bf [64]
                // - 0xe8b380 ... 0xe8b3bf [64]
                // - 0xe8b480 ... 0xe8b4bf [64]
                // - 0xe8b580 ... 0xe8b5bf [64]
                // - 0xe8b680 ... 0xe8b6bf [64]
                // - 0xe8b780 ... 0xe8b7bf [64]
                // - 0xe8b880 ... 0xe8b8bf [64]
                // - 0xe8b980 ... 0xe8b9bf [64]
                // - 0xe8ba80 ... 0xe8babf [64]
                // - 0xe8bb80 ... 0xe8bbbf [64]
                // - 0xe8bc80 ... 0xe8bcbf [64]
                // - 0xe8bd80 ... 0xe8bdbf [64]
                // - 0xe8be80 ... 0xe8bebf [64]
                // - 0xe8bf80 ... 0xe8bfbf [64]
                // - 0xe98080 ... 0xe980bf [64]
                // - 0xe98180 ... 0xe981bf [64]
                // - 0xe98280 ... 0xe982bf [64]
                // - 0xe98380 ... 0xe983bf [64]
                // - 0xe98480 ... 0xe984bf [64]
                // - 0xe98580 ... 0xe985bf [64]
                // - 0xe98680 ... 0xe986bf [64]
                // - 0xe98780 ... 0xe987bf [64]
                // - 0xe98880 ... 0xe988bf [64]
                // - 0xe98980 ... 0xe989bf [64]
                // - 0xe98a80 ... 0xe98abf [64]
                // - 0xe98b80 ... 0xe98bbf [64]
                // - 0xe98c80 ... 0xe98cbf [64]
                // - 0xe98d80 ... 0xe98dbf [64]
                // - 0xe98e80 ... 0xe98ebf [64]
                // - 0xe98f80 ... 0xe98fbf [64]
                // - 0xe99080 ... 0xe990bf [64]
                // - 0xe99180 ... 0xe991bf [64]
                // - 0xe99280 ... 0xe992bf [64]
                // - 0xe99380 ... 0xe993bf [64]
                // - 0xe99480 ... 0xe994bf [64]
                // - 0xe99580 ... 0xe995bf [64]
                // - 0xe99680 ... 0xe996bf [64]
                // - 0xe99780 ... 0xe997bf [64]
                // - 0xe99880 ... 0xe998bf [64]
                // - 0xe99980 ... 0xe999bf [64]
                // - 0xe99a80 ... 0xe99abf [64]
                // - 0xe99b80 ... 0xe99bbf [64]
                // - 0xe99c80 ... 0xe99cbf [64]
                // - 0xe99d80 ... 0xe99dbf [64]
                // - 0xe99e80 ... 0xe99ebf [64]
                // - 0xe99f80 ... 0xe99fbf [64]
                // - 0xe9a080 ... 0xe9a0bf [64]
                // - 0xe9a180 ... 0xe9a1bf [64]
                // - 0xe9a280 ... 0xe9a2bf [64]
                // - 0xe9a380 ... 0xe9a3bf [64]
                // - 0xe9a480 ... 0xe9a4bf [64]
                // - 0xe9a580 ... 0xe9a5bf [64]
                // - 0xe9a680 ... 0xe9a6bf [64]
                // - 0xe9a780 ... 0xe9a7bf [64]
                // - 0xe9a880 ... 0xe9a8bf [64]
                // - 0xe9a980 ... 0xe9a9bf [64]
                // - 0xe9aa80 ... 0xe9aabf [64]
                // - 0xe9ab80 ... 0xe9abbf [64]
                // - 0xe9ac80 ... 0xe9acbf [64]
                // - 0xe9ad80 ... 0xe9adbf [64]
                // - 0xe9ae80 ... 0xe9aebf [64]
                // - 0xe9af80 ... 0xe9afbf [64]
                // - 0xe9b080 ... 0xe9b0bf [64]
                // - 0xe9b180 ... 0xe9b1bf [64]
                // - 0xe9b280 ... 0xe9b2bf [64]
                // - 0xe9b380 ... 0xe9b3bf [64]
                // - 0xe9b480 ... 0xe9b4bf [64]
                // - 0xe9b580 ... 0xe9b5bf [64]
                // - 0xe9b680 ... 0xe9b6bf [64]
                // - 0xe9b780 ... 0xe9b7bf [64]
                // - 0xe9b880 ... 0xe9b8bf [64]
                // - 0xe9b980 ... 0xe9b9bf [64]
                // - 0xe9ba80 ... 0xe9babf [64]
                // - 0xe9bb80 ... 0xe9bbbf [64]
                // - 0xe9bc80 ... 0xe9bcbf [64]
                // - 0xe9bd80 ... 0xe9bdbf [64]
                // - 0xe9be80 ... 0xe9bebf [64]
                // - 0xe9bf80 ... 0xe9bfbf [64]
                if (_pattern[_currentParticleIndex + 1] >= 0x80 && _pattern[_currentParticleIndex + 1] <= 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // F900: 0xefa480 ... FA6D: 0xefa9ad [366] - ORIGINAL
                // - 0xefa480 ... 0xefa4bf [64]
                // - 0xefa580 ... 0xefa5bf [64]
                // - 0xefa680 ... 0xefa6bf [64]
                // - 0xefa780 ... 0xefa7bf [64]
                // - 0xefa880 ... 0xefa8bf [64]
                if (_pattern[_currentParticleIndex + 1] >= 0xa4 && _pattern[_currentParticleIndex + 1] <= 0xa8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // - 0xefa980 ... 0xefa9ad [46]
                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xad)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FA70: 0xefa9b0 ... FAD9: 0xefab99 [106] - ORIGINAL
                // - 0xefa9b0 ... 0xefa9bf [16]
                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb0 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // - 0xefaa80 ... 0xefaabf [64]
                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // - 0xefab80 ... 0xefab99 [26]
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x99)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 16FE4: 0xf096bfa4
                // 16FF2: 0xf096bfb2 ... 16FF3: 0xf096bfb3 [2]
                // 16FF4: 0xf096bfb4 ... 16FF6: 0xf096bfb6 [3]
                if (_pattern[_currentParticleIndex + 1] == 0x96) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xa4
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb2
                                            && _pattern[_currentParticleIndex + 3] <= 0xb6)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // 17000: 0xf0978080 ... 18CD5: 0xf098b395 [7282] - ORIGINAL
                // - 0xf0978080 ... 0xf09780bf [64]
                // - 0xf0978180 ... 0xf09781bf [64]
                // - 0xf0978280 ... 0xf09782bf [64]
                // - 0xf0978380 ... 0xf09783bf [64]
                // - 0xf0978480 ... 0xf09784bf [64]
                // - 0xf0978580 ... 0xf09785bf [64]
                // - 0xf0978680 ... 0xf09786bf [64]
                // - 0xf0978780 ... 0xf09787bf [64]
                // - 0xf0978880 ... 0xf09788bf [64]
                // - 0xf0978980 ... 0xf09789bf [64]
                // - 0xf0978a80 ... 0xf0978abf [64]
                // - 0xf0978b80 ... 0xf0978bbf [64]
                // - 0xf0978c80 ... 0xf0978cbf [64]
                // - 0xf0978d80 ... 0xf0978dbf [64]
                // - 0xf0978e80 ... 0xf0978ebf [64]
                // - 0xf0978f80 ... 0xf0978fbf [64]
                // - 0xf0979080 ... 0xf09790bf [64]
                // - 0xf0979180 ... 0xf09791bf [64]
                // - 0xf0979280 ... 0xf09792bf [64]
                // - 0xf0979380 ... 0xf09793bf [64]
                // - 0xf0979480 ... 0xf09794bf [64]
                // - 0xf0979580 ... 0xf09795bf [64]
                // - 0xf0979680 ... 0xf09796bf [64]
                // - 0xf0979780 ... 0xf09797bf [64]
                // - 0xf0979880 ... 0xf09798bf [64]
                // - 0xf0979980 ... 0xf09799bf [64]
                // - 0xf0979a80 ... 0xf0979abf [64]
                // - 0xf0979b80 ... 0xf0979bbf [64]
                // - 0xf0979c80 ... 0xf0979cbf [64]
                // - 0xf0979d80 ... 0xf0979dbf [64]
                // - 0xf0979e80 ... 0xf0979ebf [64]
                // - 0xf0979f80 ... 0xf0979fbf [64]
                // - 0xf097a080 ... 0xf097a0bf [64]
                // - 0xf097a180 ... 0xf097a1bf [64]
                // - 0xf097a280 ... 0xf097a2bf [64]
                // - 0xf097a380 ... 0xf097a3bf [64]
                // - 0xf097a480 ... 0xf097a4bf [64]
                // - 0xf097a580 ... 0xf097a5bf [64]
                // - 0xf097a680 ... 0xf097a6bf [64]
                // - 0xf097a780 ... 0xf097a7bf [64]
                // - 0xf097a880 ... 0xf097a8bf [64]
                // - 0xf097a980 ... 0xf097a9bf [64]
                // - 0xf097aa80 ... 0xf097aabf [64]
                // - 0xf097ab80 ... 0xf097abbf [64]
                // - 0xf097ac80 ... 0xf097acbf [64]
                // - 0xf097ad80 ... 0xf097adbf [64]
                // - 0xf097ae80 ... 0xf097aebf [64]
                // - 0xf097af80 ... 0xf097afbf [64]
                // - 0xf097b080 ... 0xf097b0bf [64]
                // - 0xf097b180 ... 0xf097b1bf [64]
                // - 0xf097b280 ... 0xf097b2bf [64]
                // - 0xf097b380 ... 0xf097b3bf [64]
                // - 0xf097b480 ... 0xf097b4bf [64]
                // - 0xf097b580 ... 0xf097b5bf [64]
                // - 0xf097b680 ... 0xf097b6bf [64]
                // - 0xf097b780 ... 0xf097b7bf [64]
                // - 0xf097b880 ... 0xf097b8bf [64]
                // - 0xf097b980 ... 0xf097b9bf [64]
                // - 0xf097ba80 ... 0xf097babf [64]
                // - 0xf097bb80 ... 0xf097bbbf [64]
                // - 0xf097bc80 ... 0xf097bcbf [64]
                // - 0xf097bd80 ... 0xf097bdbf [64]
                // - 0xf097be80 ... 0xf097bebf [64]
                // - 0xf097bf80 ... 0xf097bfbf [64]
                if (_pattern[_currentParticleIndex + 1] == 0x97) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // - 0xf0988080 ... 0xf09880bf [64]
                // - 0xf0988180 ... 0xf09881bf [64]
                // - 0xf0988280 ... 0xf09882bf [64]
                // - 0xf0988380 ... 0xf09883bf [64]
                // - 0xf0988480 ... 0xf09884bf [64]
                // - 0xf0988580 ... 0xf09885bf [64]
                // - 0xf0988680 ... 0xf09886bf [64]
                // - 0xf0988780 ... 0xf09887bf [64]
                // - 0xf0988880 ... 0xf09888bf [64]
                // - 0xf0988980 ... 0xf09889bf [64]
                // - 0xf0988a80 ... 0xf0988abf [64]
                // - 0xf0988b80 ... 0xf0988bbf [64]
                // - 0xf0988c80 ... 0xf0988cbf [64]
                // - 0xf0988d80 ... 0xf0988dbf [64]
                // - 0xf0988e80 ... 0xf0988ebf [64]
                // - 0xf0988f80 ... 0xf0988fbf [64]
                // - 0xf0989080 ... 0xf09890bf [64]
                // - 0xf0989180 ... 0xf09891bf [64]
                // - 0xf0989280 ... 0xf09892bf [64]
                // - 0xf0989380 ... 0xf09893bf [64]
                // - 0xf0989480 ... 0xf09894bf [64]
                // - 0xf0989580 ... 0xf09895bf [64]
                // - 0xf0989680 ... 0xf09896bf [64]
                // - 0xf0989780 ... 0xf09897bf [64]
                // - 0xf0989880 ... 0xf09898bf [64]
                // - 0xf0989980 ... 0xf09899bf [64]
                // - 0xf0989a80 ... 0xf0989abf [64]
                // - 0xf0989b80 ... 0xf0989bbf [64]
                // - 0xf0989c80 ... 0xf0989cbf [64]
                // - 0xf0989d80 ... 0xf0989dbf [64]
                // - 0xf0989e80 ... 0xf0989ebf [64]
                // - 0xf0989f80 ... 0xf0989fbf [64]
                // - 0xf098a080 ... 0xf098a0bf [64]
                // - 0xf098a180 ... 0xf098a1bf [64]
                // - 0xf098a280 ... 0xf098a2bf [64]
                // - 0xf098a380 ... 0xf098a3bf [64]
                // - 0xf098a480 ... 0xf098a4bf [64]
                // - 0xf098a580 ... 0xf098a5bf [64]
                // - 0xf098a680 ... 0xf098a6bf [64]
                // - 0xf098a780 ... 0xf098a7bf [64]
                // - 0xf098a880 ... 0xf098a8bf [64]
                // - 0xf098a980 ... 0xf098a9bf [64]
                // - 0xf098aa80 ... 0xf098aabf [64]
                // - 0xf098ab80 ... 0xf098abbf [64]
                // - 0xf098ac80 ... 0xf098acbf [64]
                // - 0xf098ad80 ... 0xf098adbf [64]
                // - 0xf098ae80 ... 0xf098aebf [64]
                // - 0xf098af80 ... 0xf098afbf [64]
                // - 0xf098b080 ... 0xf098b0bf [64]
                // - 0xf098b180 ... 0xf098b1bf [64]
                // - 0xf098b280 ... 0xf098b2bf [64]
                if (_pattern[_currentParticleIndex + 1] == 0x98) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xb2)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf098b380 ... 0xf098b395 [22]
                        // 18CFF: 0xf098b3bf ... 18D1E: 0xf098b49e [32]
                        // - 0xf098b3bf [1]
                        if (_pattern[_currentParticleIndex + 2] == 0xb3) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x95)
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf098b480 ... 0xf098b49e [31]
                        if (_pattern[_currentParticleIndex + 2] == 0xb4) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0x9e
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 18D80: 0xf098b680 ... 18DF2: 0xf098b7b2 [115]
                        // - 0xf098b680 ... 0xf098b6bf [64]
                        if (_pattern[_currentParticleIndex + 2] == 0xb6) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf098b780 ... 0xf098b7b2 [51]
                        if (_pattern[_currentParticleIndex + 2] == 0xb7) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xb2
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // 1B170: 0xf09b85b0 ... 1B2FB: 0xf09b8bbb [396]
                if (_pattern[_currentParticleIndex + 1] == 0x9b) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf09b85b0 ... 0xf09b85bf [16]
                        if (_pattern[_currentParticleIndex + 2] == 0x85) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb0
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf09b8680 ... 0xf09b86bf [64]
                        // - 0xf09b8780 ... 0xf09b87bf [64]
                        // - 0xf09b8880 ... 0xf09b88bf [64]
                        // - 0xf09b8980 ... 0xf09b89bf [64]
                        // - 0xf09b8a80 ... 0xf09b8abf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0x86 && _pattern[_currentParticleIndex + 2] <= 0x8a)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf09b8b80 ... 0xf09b8bbb [60]
                        if (_pattern[_currentParticleIndex + 2] == 0x8b) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbb
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // 20000: 0xf0a08080 ... 2A6DF: 0xf0aa9b9f [42720]
                // - 0xf0a08080 ... 0xf0a080bf [64]
                // - 0xf0a08180 ... 0xf0a081bf [64]
                // - 0xf0a08280 ... 0xf0a082bf [64]
                // - 0xf0a08380 ... 0xf0a083bf [64]
                // - 0xf0a08480 ... 0xf0a084bf [64]
                // - 0xf0a08580 ... 0xf0a085bf [64]
                // - 0xf0a08680 ... 0xf0a086bf [64]
                // - 0xf0a08780 ... 0xf0a087bf [64]
                // - 0xf0a08880 ... 0xf0a088bf [64]
                // - 0xf0a08980 ... 0xf0a089bf [64]
                // - 0xf0a08a80 ... 0xf0a08abf [64]
                // - 0xf0a08b80 ... 0xf0a08bbf [64]
                // - 0xf0a08c80 ... 0xf0a08cbf [64]
                // - 0xf0a08d80 ... 0xf0a08dbf [64]
                // - 0xf0a08e80 ... 0xf0a08ebf [64]
                // - 0xf0a08f80 ... 0xf0a08fbf [64]
                // - 0xf0a09080 ... 0xf0a090bf [64]
                // - 0xf0a09180 ... 0xf0a091bf [64]
                // - 0xf0a09280 ... 0xf0a092bf [64]
                // - 0xf0a09380 ... 0xf0a093bf [64]
                // - 0xf0a09480 ... 0xf0a094bf [64]
                // - 0xf0a09580 ... 0xf0a095bf [64]
                // - 0xf0a09680 ... 0xf0a096bf [64]
                // - 0xf0a09780 ... 0xf0a097bf [64]
                // - 0xf0a09880 ... 0xf0a098bf [64]
                // - 0xf0a09980 ... 0xf0a099bf [64]
                // - 0xf0a09a80 ... 0xf0a09abf [64]
                // - 0xf0a09b80 ... 0xf0a09bbf [64]
                // - 0xf0a09c80 ... 0xf0a09cbf [64]
                // - 0xf0a09d80 ... 0xf0a09dbf [64]
                // - 0xf0a09e80 ... 0xf0a09ebf [64]
                // - 0xf0a09f80 ... 0xf0a09fbf [64]
                // - 0xf0a0a080 ... 0xf0a0a0bf [64]
                // - 0xf0a0a180 ... 0xf0a0a1bf [64]
                // - 0xf0a0a280 ... 0xf0a0a2bf [64]
                // - 0xf0a0a380 ... 0xf0a0a3bf [64]
                // - 0xf0a0a480 ... 0xf0a0a4bf [64]
                // - 0xf0a0a580 ... 0xf0a0a5bf [64]
                // - 0xf0a0a680 ... 0xf0a0a6bf [64]
                // - 0xf0a0a780 ... 0xf0a0a7bf [64]
                // - 0xf0a0a880 ... 0xf0a0a8bf [64]
                // - 0xf0a0a980 ... 0xf0a0a9bf [64]
                // - 0xf0a0aa80 ... 0xf0a0aabf [64]
                // - 0xf0a0ab80 ... 0xf0a0abbf [64]
                // - 0xf0a0ac80 ... 0xf0a0acbf [64]
                // - 0xf0a0ad80 ... 0xf0a0adbf [64]
                // - 0xf0a0ae80 ... 0xf0a0aebf [64]
                // - 0xf0a0af80 ... 0xf0a0afbf [64]
                // - 0xf0a0b080 ... 0xf0a0b0bf [64]
                // - 0xf0a0b180 ... 0xf0a0b1bf [64]
                // - 0xf0a0b280 ... 0xf0a0b2bf [64]
                // - 0xf0a0b380 ... 0xf0a0b3bf [64]
                // - 0xf0a0b480 ... 0xf0a0b4bf [64]
                // - 0xf0a0b580 ... 0xf0a0b5bf [64]
                // - 0xf0a0b680 ... 0xf0a0b6bf [64]
                // - 0xf0a0b780 ... 0xf0a0b7bf [64]
                // - 0xf0a0b880 ... 0xf0a0b8bf [64]
                // - 0xf0a0b980 ... 0xf0a0b9bf [64]
                // - 0xf0a0ba80 ... 0xf0a0babf [64]
                // - 0xf0a0bb80 ... 0xf0a0bbbf [64]
                // - 0xf0a0bc80 ... 0xf0a0bcbf [64]
                // - 0xf0a0bd80 ... 0xf0a0bdbf [64]
                // - 0xf0a0be80 ... 0xf0a0bebf [64]
                // - 0xf0a0bf80 ... 0xf0a0bfbf [64]
                // - 0xf0a18080 ... 0xf0a180bf [64]
                // - 0xf0a18180 ... 0xf0a181bf [64]
                // - 0xf0a18280 ... 0xf0a182bf [64]
                // - 0xf0a18380 ... 0xf0a183bf [64]
                // - 0xf0a18480 ... 0xf0a184bf [64]
                // - 0xf0a18580 ... 0xf0a185bf [64]
                // - 0xf0a18680 ... 0xf0a186bf [64]
                // - 0xf0a18780 ... 0xf0a187bf [64]
                // - 0xf0a18880 ... 0xf0a188bf [64]
                // - 0xf0a18980 ... 0xf0a189bf [64]
                // - 0xf0a18a80 ... 0xf0a18abf [64]
                // - 0xf0a18b80 ... 0xf0a18bbf [64]
                // - 0xf0a18c80 ... 0xf0a18cbf [64]
                // - 0xf0a18d80 ... 0xf0a18dbf [64]
                // - 0xf0a18e80 ... 0xf0a18ebf [64]
                // - 0xf0a18f80 ... 0xf0a18fbf [64]
                // - 0xf0a19080 ... 0xf0a190bf [64]
                // - 0xf0a19180 ... 0xf0a191bf [64]
                // - 0xf0a19280 ... 0xf0a192bf [64]
                // - 0xf0a19380 ... 0xf0a193bf [64]
                // - 0xf0a19480 ... 0xf0a194bf [64]
                // - 0xf0a19580 ... 0xf0a195bf [64]
                // - 0xf0a19680 ... 0xf0a196bf [64]
                // - 0xf0a19780 ... 0xf0a197bf [64]
                // - 0xf0a19880 ... 0xf0a198bf [64]
                // - 0xf0a19980 ... 0xf0a199bf [64]
                // - 0xf0a19a80 ... 0xf0a19abf [64]
                // - 0xf0a19b80 ... 0xf0a19bbf [64]
                // - 0xf0a19c80 ... 0xf0a19cbf [64]
                // - 0xf0a19d80 ... 0xf0a19dbf [64]
                // - 0xf0a19e80 ... 0xf0a19ebf [64]
                // - 0xf0a19f80 ... 0xf0a19fbf [64]
                // - 0xf0a1a080 ... 0xf0a1a0bf [64]
                // - 0xf0a1a180 ... 0xf0a1a1bf [64]
                // - 0xf0a1a280 ... 0xf0a1a2bf [64]
                // - 0xf0a1a380 ... 0xf0a1a3bf [64]
                // - 0xf0a1a480 ... 0xf0a1a4bf [64]
                // - 0xf0a1a580 ... 0xf0a1a5bf [64]
                // - 0xf0a1a680 ... 0xf0a1a6bf [64]
                // - 0xf0a1a780 ... 0xf0a1a7bf [64]
                // - 0xf0a1a880 ... 0xf0a1a8bf [64]
                // - 0xf0a1a980 ... 0xf0a1a9bf [64]
                // - 0xf0a1aa80 ... 0xf0a1aabf [64]
                // - 0xf0a1ab80 ... 0xf0a1abbf [64]
                // - 0xf0a1ac80 ... 0xf0a1acbf [64]
                // - 0xf0a1ad80 ... 0xf0a1adbf [64]
                // - 0xf0a1ae80 ... 0xf0a1aebf [64]
                // - 0xf0a1af80 ... 0xf0a1afbf [64]
                // - 0xf0a1b080 ... 0xf0a1b0bf [64]
                // - 0xf0a1b180 ... 0xf0a1b1bf [64]
                // - 0xf0a1b280 ... 0xf0a1b2bf [64]
                // - 0xf0a1b380 ... 0xf0a1b3bf [64]
                // - 0xf0a1b480 ... 0xf0a1b4bf [64]
                // - 0xf0a1b580 ... 0xf0a1b5bf [64]
                // - 0xf0a1b680 ... 0xf0a1b6bf [64]
                // - 0xf0a1b780 ... 0xf0a1b7bf [64]
                // - 0xf0a1b880 ... 0xf0a1b8bf [64]
                // - 0xf0a1b980 ... 0xf0a1b9bf [64]
                // - 0xf0a1ba80 ... 0xf0a1babf [64]
                // - 0xf0a1bb80 ... 0xf0a1bbbf [64]
                // - 0xf0a1bc80 ... 0xf0a1bcbf [64]
                // - 0xf0a1bd80 ... 0xf0a1bdbf [64]
                // - 0xf0a1be80 ... 0xf0a1bebf [64]
                // - 0xf0a1bf80 ... 0xf0a1bfbf [64]
                // - 0xf0a28080 ... 0xf0a280bf [64]
                // - 0xf0a28180 ... 0xf0a281bf [64]
                // - 0xf0a28280 ... 0xf0a282bf [64]
                // - 0xf0a28380 ... 0xf0a283bf [64]
                // - 0xf0a28480 ... 0xf0a284bf [64]
                // - 0xf0a28580 ... 0xf0a285bf [64]
                // - 0xf0a28680 ... 0xf0a286bf [64]
                // - 0xf0a28780 ... 0xf0a287bf [64]
                // - 0xf0a28880 ... 0xf0a288bf [64]
                // - 0xf0a28980 ... 0xf0a289bf [64]
                // - 0xf0a28a80 ... 0xf0a28abf [64]
                // - 0xf0a28b80 ... 0xf0a28bbf [64]
                // - 0xf0a28c80 ... 0xf0a28cbf [64]
                // - 0xf0a28d80 ... 0xf0a28dbf [64]
                // - 0xf0a28e80 ... 0xf0a28ebf [64]
                // - 0xf0a28f80 ... 0xf0a28fbf [64]
                // - 0xf0a29080 ... 0xf0a290bf [64]
                // - 0xf0a29180 ... 0xf0a291bf [64]
                // - 0xf0a29280 ... 0xf0a292bf [64]
                // - 0xf0a29380 ... 0xf0a293bf [64]
                // - 0xf0a29480 ... 0xf0a294bf [64]
                // - 0xf0a29580 ... 0xf0a295bf [64]
                // - 0xf0a29680 ... 0xf0a296bf [64]
                // - 0xf0a29780 ... 0xf0a297bf [64]
                // - 0xf0a29880 ... 0xf0a298bf [64]
                // - 0xf0a29980 ... 0xf0a299bf [64]
                // - 0xf0a29a80 ... 0xf0a29abf [64]
                // - 0xf0a29b80 ... 0xf0a29bbf [64]
                // - 0xf0a29c80 ... 0xf0a29cbf [64]
                // - 0xf0a29d80 ... 0xf0a29dbf [64]
                // - 0xf0a29e80 ... 0xf0a29ebf [64]
                // - 0xf0a29f80 ... 0xf0a29fbf [64]
                // - 0xf0a2a080 ... 0xf0a2a0bf [64]
                // - 0xf0a2a180 ... 0xf0a2a1bf [64]
                // - 0xf0a2a280 ... 0xf0a2a2bf [64]
                // - 0xf0a2a380 ... 0xf0a2a3bf [64]
                // - 0xf0a2a480 ... 0xf0a2a4bf [64]
                // - 0xf0a2a580 ... 0xf0a2a5bf [64]
                // - 0xf0a2a680 ... 0xf0a2a6bf [64]
                // - 0xf0a2a780 ... 0xf0a2a7bf [64]
                // - 0xf0a2a880 ... 0xf0a2a8bf [64]
                // - 0xf0a2a980 ... 0xf0a2a9bf [64]
                // - 0xf0a2aa80 ... 0xf0a2aabf [64]
                // - 0xf0a2ab80 ... 0xf0a2abbf [64]
                // - 0xf0a2ac80 ... 0xf0a2acbf [64]
                // - 0xf0a2ad80 ... 0xf0a2adbf [64]
                // - 0xf0a2ae80 ... 0xf0a2aebf [64]
                // - 0xf0a2af80 ... 0xf0a2afbf [64]
                // - 0xf0a2b080 ... 0xf0a2b0bf [64]
                // - 0xf0a2b180 ... 0xf0a2b1bf [64]
                // - 0xf0a2b280 ... 0xf0a2b2bf [64]
                // - 0xf0a2b380 ... 0xf0a2b3bf [64]
                // - 0xf0a2b480 ... 0xf0a2b4bf [64]
                // - 0xf0a2b580 ... 0xf0a2b5bf [64]
                // - 0xf0a2b680 ... 0xf0a2b6bf [64]
                // - 0xf0a2b780 ... 0xf0a2b7bf [64]
                // - 0xf0a2b880 ... 0xf0a2b8bf [64]
                // - 0xf0a2b980 ... 0xf0a2b9bf [64]
                // - 0xf0a2ba80 ... 0xf0a2babf [64]
                // - 0xf0a2bb80 ... 0xf0a2bbbf [64]
                // - 0xf0a2bc80 ... 0xf0a2bcbf [64]
                // - 0xf0a2bd80 ... 0xf0a2bdbf [64]
                // - 0xf0a2be80 ... 0xf0a2bebf [64]
                // - 0xf0a2bf80 ... 0xf0a2bfbf [64]
                // - 0xf0a38080 ... 0xf0a380bf [64]
                // - 0xf0a38180 ... 0xf0a381bf [64]
                // - 0xf0a38280 ... 0xf0a382bf [64]
                // - 0xf0a38380 ... 0xf0a383bf [64]
                // - 0xf0a38480 ... 0xf0a384bf [64]
                // - 0xf0a38580 ... 0xf0a385bf [64]
                // - 0xf0a38680 ... 0xf0a386bf [64]
                // - 0xf0a38780 ... 0xf0a387bf [64]
                // - 0xf0a38880 ... 0xf0a388bf [64]
                // - 0xf0a38980 ... 0xf0a389bf [64]
                // - 0xf0a38a80 ... 0xf0a38abf [64]
                // - 0xf0a38b80 ... 0xf0a38bbf [64]
                // - 0xf0a38c80 ... 0xf0a38cbf [64]
                // - 0xf0a38d80 ... 0xf0a38dbf [64]
                // - 0xf0a38e80 ... 0xf0a38ebf [64]
                // - 0xf0a38f80 ... 0xf0a38fbf [64]
                // - 0xf0a39080 ... 0xf0a390bf [64]
                // - 0xf0a39180 ... 0xf0a391bf [64]
                // - 0xf0a39280 ... 0xf0a392bf [64]
                // - 0xf0a39380 ... 0xf0a393bf [64]
                // - 0xf0a39480 ... 0xf0a394bf [64]
                // - 0xf0a39580 ... 0xf0a395bf [64]
                // - 0xf0a39680 ... 0xf0a396bf [64]
                // - 0xf0a39780 ... 0xf0a397bf [64]
                // - 0xf0a39880 ... 0xf0a398bf [64]
                // - 0xf0a39980 ... 0xf0a399bf [64]
                // - 0xf0a39a80 ... 0xf0a39abf [64]
                // - 0xf0a39b80 ... 0xf0a39bbf [64]
                // - 0xf0a39c80 ... 0xf0a39cbf [64]
                // - 0xf0a39d80 ... 0xf0a39dbf [64]
                // - 0xf0a39e80 ... 0xf0a39ebf [64]
                // - 0xf0a39f80 ... 0xf0a39fbf [64]
                // - 0xf0a3a080 ... 0xf0a3a0bf [64]
                // - 0xf0a3a180 ... 0xf0a3a1bf [64]
                // - 0xf0a3a280 ... 0xf0a3a2bf [64]
                // - 0xf0a3a380 ... 0xf0a3a3bf [64]
                // - 0xf0a3a480 ... 0xf0a3a4bf [64]
                // - 0xf0a3a580 ... 0xf0a3a5bf [64]
                // - 0xf0a3a680 ... 0xf0a3a6bf [64]
                // - 0xf0a3a780 ... 0xf0a3a7bf [64]
                // - 0xf0a3a880 ... 0xf0a3a8bf [64]
                // - 0xf0a3a980 ... 0xf0a3a9bf [64]
                // - 0xf0a3aa80 ... 0xf0a3aabf [64]
                // - 0xf0a3ab80 ... 0xf0a3abbf [64]
                // - 0xf0a3ac80 ... 0xf0a3acbf [64]
                // - 0xf0a3ad80 ... 0xf0a3adbf [64]
                // - 0xf0a3ae80 ... 0xf0a3aebf [64]
                // - 0xf0a3af80 ... 0xf0a3afbf [64]
                // - 0xf0a3b080 ... 0xf0a3b0bf [64]
                // - 0xf0a3b180 ... 0xf0a3b1bf [64]
                // - 0xf0a3b280 ... 0xf0a3b2bf [64]
                // - 0xf0a3b380 ... 0xf0a3b3bf [64]
                // - 0xf0a3b480 ... 0xf0a3b4bf [64]
                // - 0xf0a3b580 ... 0xf0a3b5bf [64]
                // - 0xf0a3b680 ... 0xf0a3b6bf [64]
                // - 0xf0a3b780 ... 0xf0a3b7bf [64]
                // - 0xf0a3b880 ... 0xf0a3b8bf [64]
                // - 0xf0a3b980 ... 0xf0a3b9bf [64]
                // - 0xf0a3ba80 ... 0xf0a3babf [64]
                // - 0xf0a3bb80 ... 0xf0a3bbbf [64]
                // - 0xf0a3bc80 ... 0xf0a3bcbf [64]
                // - 0xf0a3bd80 ... 0xf0a3bdbf [64]
                // - 0xf0a3be80 ... 0xf0a3bebf [64]
                // - 0xf0a3bf80 ... 0xf0a3bfbf [64]
                // - 0xf0a48080 ... 0xf0a480bf [64]
                // - 0xf0a48180 ... 0xf0a481bf [64]
                // - 0xf0a48280 ... 0xf0a482bf [64]
                // - 0xf0a48380 ... 0xf0a483bf [64]
                // - 0xf0a48480 ... 0xf0a484bf [64]
                // - 0xf0a48580 ... 0xf0a485bf [64]
                // - 0xf0a48680 ... 0xf0a486bf [64]
                // - 0xf0a48780 ... 0xf0a487bf [64]
                // - 0xf0a48880 ... 0xf0a488bf [64]
                // - 0xf0a48980 ... 0xf0a489bf [64]
                // - 0xf0a48a80 ... 0xf0a48abf [64]
                // - 0xf0a48b80 ... 0xf0a48bbf [64]
                // - 0xf0a48c80 ... 0xf0a48cbf [64]
                // - 0xf0a48d80 ... 0xf0a48dbf [64]
                // - 0xf0a48e80 ... 0xf0a48ebf [64]
                // - 0xf0a48f80 ... 0xf0a48fbf [64]
                // - 0xf0a49080 ... 0xf0a490bf [64]
                // - 0xf0a49180 ... 0xf0a491bf [64]
                // - 0xf0a49280 ... 0xf0a492bf [64]
                // - 0xf0a49380 ... 0xf0a493bf [64]
                // - 0xf0a49480 ... 0xf0a494bf [64]
                // - 0xf0a49580 ... 0xf0a495bf [64]
                // - 0xf0a49680 ... 0xf0a496bf [64]
                // - 0xf0a49780 ... 0xf0a497bf [64]
                // - 0xf0a49880 ... 0xf0a498bf [64]
                // - 0xf0a49980 ... 0xf0a499bf [64]
                // - 0xf0a49a80 ... 0xf0a49abf [64]
                // - 0xf0a49b80 ... 0xf0a49bbf [64]
                // - 0xf0a49c80 ... 0xf0a49cbf [64]
                // - 0xf0a49d80 ... 0xf0a49dbf [64]
                // - 0xf0a49e80 ... 0xf0a49ebf [64]
                // - 0xf0a49f80 ... 0xf0a49fbf [64]
                // - 0xf0a4a080 ... 0xf0a4a0bf [64]
                // - 0xf0a4a180 ... 0xf0a4a1bf [64]
                // - 0xf0a4a280 ... 0xf0a4a2bf [64]
                // - 0xf0a4a380 ... 0xf0a4a3bf [64]
                // - 0xf0a4a480 ... 0xf0a4a4bf [64]
                // - 0xf0a4a580 ... 0xf0a4a5bf [64]
                // - 0xf0a4a680 ... 0xf0a4a6bf [64]
                // - 0xf0a4a780 ... 0xf0a4a7bf [64]
                // - 0xf0a4a880 ... 0xf0a4a8bf [64]
                // - 0xf0a4a980 ... 0xf0a4a9bf [64]
                // - 0xf0a4aa80 ... 0xf0a4aabf [64]
                // - 0xf0a4ab80 ... 0xf0a4abbf [64]
                // - 0xf0a4ac80 ... 0xf0a4acbf [64]
                // - 0xf0a4ad80 ... 0xf0a4adbf [64]
                // - 0xf0a4ae80 ... 0xf0a4aebf [64]
                // - 0xf0a4af80 ... 0xf0a4afbf [64]
                // - 0xf0a4b080 ... 0xf0a4b0bf [64]
                // - 0xf0a4b180 ... 0xf0a4b1bf [64]
                // - 0xf0a4b280 ... 0xf0a4b2bf [64]
                // - 0xf0a4b380 ... 0xf0a4b3bf [64]
                // - 0xf0a4b480 ... 0xf0a4b4bf [64]
                // - 0xf0a4b580 ... 0xf0a4b5bf [64]
                // - 0xf0a4b680 ... 0xf0a4b6bf [64]
                // - 0xf0a4b780 ... 0xf0a4b7bf [64]
                // - 0xf0a4b880 ... 0xf0a4b8bf [64]
                // - 0xf0a4b980 ... 0xf0a4b9bf [64]
                // - 0xf0a4ba80 ... 0xf0a4babf [64]
                // - 0xf0a4bb80 ... 0xf0a4bbbf [64]
                // - 0xf0a4bc80 ... 0xf0a4bcbf [64]
                // - 0xf0a4bd80 ... 0xf0a4bdbf [64]
                // - 0xf0a4be80 ... 0xf0a4bebf [64]
                // - 0xf0a4bf80 ... 0xf0a4bfbf [64]
                // - 0xf0a58080 ... 0xf0a580bf [64]
                // - 0xf0a58180 ... 0xf0a581bf [64]
                // - 0xf0a58280 ... 0xf0a582bf [64]
                // - 0xf0a58380 ... 0xf0a583bf [64]
                // - 0xf0a58480 ... 0xf0a584bf [64]
                // - 0xf0a58580 ... 0xf0a585bf [64]
                // - 0xf0a58680 ... 0xf0a586bf [64]
                // - 0xf0a58780 ... 0xf0a587bf [64]
                // - 0xf0a58880 ... 0xf0a588bf [64]
                // - 0xf0a58980 ... 0xf0a589bf [64]
                // - 0xf0a58a80 ... 0xf0a58abf [64]
                // - 0xf0a58b80 ... 0xf0a58bbf [64]
                // - 0xf0a58c80 ... 0xf0a58cbf [64]
                // - 0xf0a58d80 ... 0xf0a58dbf [64]
                // - 0xf0a58e80 ... 0xf0a58ebf [64]
                // - 0xf0a58f80 ... 0xf0a58fbf [64]
                // - 0xf0a59080 ... 0xf0a590bf [64]
                // - 0xf0a59180 ... 0xf0a591bf [64]
                // - 0xf0a59280 ... 0xf0a592bf [64]
                // - 0xf0a59380 ... 0xf0a593bf [64]
                // - 0xf0a59480 ... 0xf0a594bf [64]
                // - 0xf0a59580 ... 0xf0a595bf [64]
                // - 0xf0a59680 ... 0xf0a596bf [64]
                // - 0xf0a59780 ... 0xf0a597bf [64]
                // - 0xf0a59880 ... 0xf0a598bf [64]
                // - 0xf0a59980 ... 0xf0a599bf [64]
                // - 0xf0a59a80 ... 0xf0a59abf [64]
                // - 0xf0a59b80 ... 0xf0a59bbf [64]
                // - 0xf0a59c80 ... 0xf0a59cbf [64]
                // - 0xf0a59d80 ... 0xf0a59dbf [64]
                // - 0xf0a59e80 ... 0xf0a59ebf [64]
                // - 0xf0a59f80 ... 0xf0a59fbf [64]
                // - 0xf0a5a080 ... 0xf0a5a0bf [64]
                // - 0xf0a5a180 ... 0xf0a5a1bf [64]
                // - 0xf0a5a280 ... 0xf0a5a2bf [64]
                // - 0xf0a5a380 ... 0xf0a5a3bf [64]
                // - 0xf0a5a480 ... 0xf0a5a4bf [64]
                // - 0xf0a5a580 ... 0xf0a5a5bf [64]
                // - 0xf0a5a680 ... 0xf0a5a6bf [64]
                // - 0xf0a5a780 ... 0xf0a5a7bf [64]
                // - 0xf0a5a880 ... 0xf0a5a8bf [64]
                // - 0xf0a5a980 ... 0xf0a5a9bf [64]
                // - 0xf0a5aa80 ... 0xf0a5aabf [64]
                // - 0xf0a5ab80 ... 0xf0a5abbf [64]
                // - 0xf0a5ac80 ... 0xf0a5acbf [64]
                // - 0xf0a5ad80 ... 0xf0a5adbf [64]
                // - 0xf0a5ae80 ... 0xf0a5aebf [64]
                // - 0xf0a5af80 ... 0xf0a5afbf [64]
                // - 0xf0a5b080 ... 0xf0a5b0bf [64]
                // - 0xf0a5b180 ... 0xf0a5b1bf [64]
                // - 0xf0a5b280 ... 0xf0a5b2bf [64]
                // - 0xf0a5b380 ... 0xf0a5b3bf [64]
                // - 0xf0a5b480 ... 0xf0a5b4bf [64]
                // - 0xf0a5b580 ... 0xf0a5b5bf [64]
                // - 0xf0a5b680 ... 0xf0a5b6bf [64]
                // - 0xf0a5b780 ... 0xf0a5b7bf [64]
                // - 0xf0a5b880 ... 0xf0a5b8bf [64]
                // - 0xf0a5b980 ... 0xf0a5b9bf [64]
                // - 0xf0a5ba80 ... 0xf0a5babf [64]
                // - 0xf0a5bb80 ... 0xf0a5bbbf [64]
                // - 0xf0a5bc80 ... 0xf0a5bcbf [64]
                // - 0xf0a5bd80 ... 0xf0a5bdbf [64]
                // - 0xf0a5be80 ... 0xf0a5bebf [64]
                // - 0xf0a5bf80 ... 0xf0a5bfbf [64]
                // - 0xf0a68080 ... 0xf0a680bf [64]
                // - 0xf0a68180 ... 0xf0a681bf [64]
                // - 0xf0a68280 ... 0xf0a682bf [64]
                // - 0xf0a68380 ... 0xf0a683bf [64]
                // - 0xf0a68480 ... 0xf0a684bf [64]
                // - 0xf0a68580 ... 0xf0a685bf [64]
                // - 0xf0a68680 ... 0xf0a686bf [64]
                // - 0xf0a68780 ... 0xf0a687bf [64]
                // - 0xf0a68880 ... 0xf0a688bf [64]
                // - 0xf0a68980 ... 0xf0a689bf [64]
                // - 0xf0a68a80 ... 0xf0a68abf [64]
                // - 0xf0a68b80 ... 0xf0a68bbf [64]
                // - 0xf0a68c80 ... 0xf0a68cbf [64]
                // - 0xf0a68d80 ... 0xf0a68dbf [64]
                // - 0xf0a68e80 ... 0xf0a68ebf [64]
                // - 0xf0a68f80 ... 0xf0a68fbf [64]
                // - 0xf0a69080 ... 0xf0a690bf [64]
                // - 0xf0a69180 ... 0xf0a691bf [64]
                // - 0xf0a69280 ... 0xf0a692bf [64]
                // - 0xf0a69380 ... 0xf0a693bf [64]
                // - 0xf0a69480 ... 0xf0a694bf [64]
                // - 0xf0a69580 ... 0xf0a695bf [64]
                // - 0xf0a69680 ... 0xf0a696bf [64]
                // - 0xf0a69780 ... 0xf0a697bf [64]
                // - 0xf0a69880 ... 0xf0a698bf [64]
                // - 0xf0a69980 ... 0xf0a699bf [64]
                // - 0xf0a69a80 ... 0xf0a69abf [64]
                // - 0xf0a69b80 ... 0xf0a69bbf [64]
                // - 0xf0a69c80 ... 0xf0a69cbf [64]
                // - 0xf0a69d80 ... 0xf0a69dbf [64]
                // - 0xf0a69e80 ... 0xf0a69ebf [64]
                // - 0xf0a69f80 ... 0xf0a69fbf [64]
                // - 0xf0a6a080 ... 0xf0a6a0bf [64]
                // - 0xf0a6a180 ... 0xf0a6a1bf [64]
                // - 0xf0a6a280 ... 0xf0a6a2bf [64]
                // - 0xf0a6a380 ... 0xf0a6a3bf [64]
                // - 0xf0a6a480 ... 0xf0a6a4bf [64]
                // - 0xf0a6a580 ... 0xf0a6a5bf [64]
                // - 0xf0a6a680 ... 0xf0a6a6bf [64]
                // - 0xf0a6a780 ... 0xf0a6a7bf [64]
                // - 0xf0a6a880 ... 0xf0a6a8bf [64]
                // - 0xf0a6a980 ... 0xf0a6a9bf [64]
                // - 0xf0a6aa80 ... 0xf0a6aabf [64]
                // - 0xf0a6ab80 ... 0xf0a6abbf [64]
                // - 0xf0a6ac80 ... 0xf0a6acbf [64]
                // - 0xf0a6ad80 ... 0xf0a6adbf [64]
                // - 0xf0a6ae80 ... 0xf0a6aebf [64]
                // - 0xf0a6af80 ... 0xf0a6afbf [64]
                // - 0xf0a6b080 ... 0xf0a6b0bf [64]
                // - 0xf0a6b180 ... 0xf0a6b1bf [64]
                // - 0xf0a6b280 ... 0xf0a6b2bf [64]
                // - 0xf0a6b380 ... 0xf0a6b3bf [64]
                // - 0xf0a6b480 ... 0xf0a6b4bf [64]
                // - 0xf0a6b580 ... 0xf0a6b5bf [64]
                // - 0xf0a6b680 ... 0xf0a6b6bf [64]
                // - 0xf0a6b780 ... 0xf0a6b7bf [64]
                // - 0xf0a6b880 ... 0xf0a6b8bf [64]
                // - 0xf0a6b980 ... 0xf0a6b9bf [64]
                // - 0xf0a6ba80 ... 0xf0a6babf [64]
                // - 0xf0a6bb80 ... 0xf0a6bbbf [64]
                // - 0xf0a6bc80 ... 0xf0a6bcbf [64]
                // - 0xf0a6bd80 ... 0xf0a6bdbf [64]
                // - 0xf0a6be80 ... 0xf0a6bebf [64]
                // - 0xf0a6bf80 ... 0xf0a6bfbf [64]
                // - 0xf0a78080 ... 0xf0a780bf [64]
                // - 0xf0a78180 ... 0xf0a781bf [64]
                // - 0xf0a78280 ... 0xf0a782bf [64]
                // - 0xf0a78380 ... 0xf0a783bf [64]
                // - 0xf0a78480 ... 0xf0a784bf [64]
                // - 0xf0a78580 ... 0xf0a785bf [64]
                // - 0xf0a78680 ... 0xf0a786bf [64]
                // - 0xf0a78780 ... 0xf0a787bf [64]
                // - 0xf0a78880 ... 0xf0a788bf [64]
                // - 0xf0a78980 ... 0xf0a789bf [64]
                // - 0xf0a78a80 ... 0xf0a78abf [64]
                // - 0xf0a78b80 ... 0xf0a78bbf [64]
                // - 0xf0a78c80 ... 0xf0a78cbf [64]
                // - 0xf0a78d80 ... 0xf0a78dbf [64]
                // - 0xf0a78e80 ... 0xf0a78ebf [64]
                // - 0xf0a78f80 ... 0xf0a78fbf [64]
                // - 0xf0a79080 ... 0xf0a790bf [64]
                // - 0xf0a79180 ... 0xf0a791bf [64]
                // - 0xf0a79280 ... 0xf0a792bf [64]
                // - 0xf0a79380 ... 0xf0a793bf [64]
                // - 0xf0a79480 ... 0xf0a794bf [64]
                // - 0xf0a79580 ... 0xf0a795bf [64]
                // - 0xf0a79680 ... 0xf0a796bf [64]
                // - 0xf0a79780 ... 0xf0a797bf [64]
                // - 0xf0a79880 ... 0xf0a798bf [64]
                // - 0xf0a79980 ... 0xf0a799bf [64]
                // - 0xf0a79a80 ... 0xf0a79abf [64]
                // - 0xf0a79b80 ... 0xf0a79bbf [64]
                // - 0xf0a79c80 ... 0xf0a79cbf [64]
                // - 0xf0a79d80 ... 0xf0a79dbf [64]
                // - 0xf0a79e80 ... 0xf0a79ebf [64]
                // - 0xf0a79f80 ... 0xf0a79fbf [64]
                // - 0xf0a7a080 ... 0xf0a7a0bf [64]
                // - 0xf0a7a180 ... 0xf0a7a1bf [64]
                // - 0xf0a7a280 ... 0xf0a7a2bf [64]
                // - 0xf0a7a380 ... 0xf0a7a3bf [64]
                // - 0xf0a7a480 ... 0xf0a7a4bf [64]
                // - 0xf0a7a580 ... 0xf0a7a5bf [64]
                // - 0xf0a7a680 ... 0xf0a7a6bf [64]
                // - 0xf0a7a780 ... 0xf0a7a7bf [64]
                // - 0xf0a7a880 ... 0xf0a7a8bf [64]
                // - 0xf0a7a980 ... 0xf0a7a9bf [64]
                // - 0xf0a7aa80 ... 0xf0a7aabf [64]
                // - 0xf0a7ab80 ... 0xf0a7abbf [64]
                // - 0xf0a7ac80 ... 0xf0a7acbf [64]
                // - 0xf0a7ad80 ... 0xf0a7adbf [64]
                // - 0xf0a7ae80 ... 0xf0a7aebf [64]
                // - 0xf0a7af80 ... 0xf0a7afbf [64]
                // - 0xf0a7b080 ... 0xf0a7b0bf [64]
                // - 0xf0a7b180 ... 0xf0a7b1bf [64]
                // - 0xf0a7b280 ... 0xf0a7b2bf [64]
                // - 0xf0a7b380 ... 0xf0a7b3bf [64]
                // - 0xf0a7b480 ... 0xf0a7b4bf [64]
                // - 0xf0a7b580 ... 0xf0a7b5bf [64]
                // - 0xf0a7b680 ... 0xf0a7b6bf [64]
                // - 0xf0a7b780 ... 0xf0a7b7bf [64]
                // - 0xf0a7b880 ... 0xf0a7b8bf [64]
                // - 0xf0a7b980 ... 0xf0a7b9bf [64]
                // - 0xf0a7ba80 ... 0xf0a7babf [64]
                // - 0xf0a7bb80 ... 0xf0a7bbbf [64]
                // - 0xf0a7bc80 ... 0xf0a7bcbf [64]
                // - 0xf0a7bd80 ... 0xf0a7bdbf [64]
                // - 0xf0a7be80 ... 0xf0a7bebf [64]
                // - 0xf0a7bf80 ... 0xf0a7bfbf [64]
                // - 0xf0a88080 ... 0xf0a880bf [64]
                // - 0xf0a88180 ... 0xf0a881bf [64]
                // - 0xf0a88280 ... 0xf0a882bf [64]
                // - 0xf0a88380 ... 0xf0a883bf [64]
                // - 0xf0a88480 ... 0xf0a884bf [64]
                // - 0xf0a88580 ... 0xf0a885bf [64]
                // - 0xf0a88680 ... 0xf0a886bf [64]
                // - 0xf0a88780 ... 0xf0a887bf [64]
                // - 0xf0a88880 ... 0xf0a888bf [64]
                // - 0xf0a88980 ... 0xf0a889bf [64]
                // - 0xf0a88a80 ... 0xf0a88abf [64]
                // - 0xf0a88b80 ... 0xf0a88bbf [64]
                // - 0xf0a88c80 ... 0xf0a88cbf [64]
                // - 0xf0a88d80 ... 0xf0a88dbf [64]
                // - 0xf0a88e80 ... 0xf0a88ebf [64]
                // - 0xf0a88f80 ... 0xf0a88fbf [64]
                // - 0xf0a89080 ... 0xf0a890bf [64]
                // - 0xf0a89180 ... 0xf0a891bf [64]
                // - 0xf0a89280 ... 0xf0a892bf [64]
                // - 0xf0a89380 ... 0xf0a893bf [64]
                // - 0xf0a89480 ... 0xf0a894bf [64]
                // - 0xf0a89580 ... 0xf0a895bf [64]
                // - 0xf0a89680 ... 0xf0a896bf [64]
                // - 0xf0a89780 ... 0xf0a897bf [64]
                // - 0xf0a89880 ... 0xf0a898bf [64]
                // - 0xf0a89980 ... 0xf0a899bf [64]
                // - 0xf0a89a80 ... 0xf0a89abf [64]
                // - 0xf0a89b80 ... 0xf0a89bbf [64]
                // - 0xf0a89c80 ... 0xf0a89cbf [64]
                // - 0xf0a89d80 ... 0xf0a89dbf [64]
                // - 0xf0a89e80 ... 0xf0a89ebf [64]
                // - 0xf0a89f80 ... 0xf0a89fbf [64]
                // - 0xf0a8a080 ... 0xf0a8a0bf [64]
                // - 0xf0a8a180 ... 0xf0a8a1bf [64]
                // - 0xf0a8a280 ... 0xf0a8a2bf [64]
                // - 0xf0a8a380 ... 0xf0a8a3bf [64]
                // - 0xf0a8a480 ... 0xf0a8a4bf [64]
                // - 0xf0a8a580 ... 0xf0a8a5bf [64]
                // - 0xf0a8a680 ... 0xf0a8a6bf [64]
                // - 0xf0a8a780 ... 0xf0a8a7bf [64]
                // - 0xf0a8a880 ... 0xf0a8a8bf [64]
                // - 0xf0a8a980 ... 0xf0a8a9bf [64]
                // - 0xf0a8aa80 ... 0xf0a8aabf [64]
                // - 0xf0a8ab80 ... 0xf0a8abbf [64]
                // - 0xf0a8ac80 ... 0xf0a8acbf [64]
                // - 0xf0a8ad80 ... 0xf0a8adbf [64]
                // - 0xf0a8ae80 ... 0xf0a8aebf [64]
                // - 0xf0a8af80 ... 0xf0a8afbf [64]
                // - 0xf0a8b080 ... 0xf0a8b0bf [64]
                // - 0xf0a8b180 ... 0xf0a8b1bf [64]
                // - 0xf0a8b280 ... 0xf0a8b2bf [64]
                // - 0xf0a8b380 ... 0xf0a8b3bf [64]
                // - 0xf0a8b480 ... 0xf0a8b4bf [64]
                // - 0xf0a8b580 ... 0xf0a8b5bf [64]
                // - 0xf0a8b680 ... 0xf0a8b6bf [64]
                // - 0xf0a8b780 ... 0xf0a8b7bf [64]
                // - 0xf0a8b880 ... 0xf0a8b8bf [64]
                // - 0xf0a8b980 ... 0xf0a8b9bf [64]
                // - 0xf0a8ba80 ... 0xf0a8babf [64]
                // - 0xf0a8bb80 ... 0xf0a8bbbf [64]
                // - 0xf0a8bc80 ... 0xf0a8bcbf [64]
                // - 0xf0a8bd80 ... 0xf0a8bdbf [64]
                // - 0xf0a8be80 ... 0xf0a8bebf [64]
                // - 0xf0a8bf80 ... 0xf0a8bfbf [64]
                // - 0xf0a98080 ... 0xf0a980bf [64]
                // - 0xf0a98180 ... 0xf0a981bf [64]
                // - 0xf0a98280 ... 0xf0a982bf [64]
                // - 0xf0a98380 ... 0xf0a983bf [64]
                // - 0xf0a98480 ... 0xf0a984bf [64]
                // - 0xf0a98580 ... 0xf0a985bf [64]
                // - 0xf0a98680 ... 0xf0a986bf [64]
                // - 0xf0a98780 ... 0xf0a987bf [64]
                // - 0xf0a98880 ... 0xf0a988bf [64]
                // - 0xf0a98980 ... 0xf0a989bf [64]
                // - 0xf0a98a80 ... 0xf0a98abf [64]
                // - 0xf0a98b80 ... 0xf0a98bbf [64]
                // - 0xf0a98c80 ... 0xf0a98cbf [64]
                // - 0xf0a98d80 ... 0xf0a98dbf [64]
                // - 0xf0a98e80 ... 0xf0a98ebf [64]
                // - 0xf0a98f80 ... 0xf0a98fbf [64]
                // - 0xf0a99080 ... 0xf0a990bf [64]
                // - 0xf0a99180 ... 0xf0a991bf [64]
                // - 0xf0a99280 ... 0xf0a992bf [64]
                // - 0xf0a99380 ... 0xf0a993bf [64]
                // - 0xf0a99480 ... 0xf0a994bf [64]
                // - 0xf0a99580 ... 0xf0a995bf [64]
                // - 0xf0a99680 ... 0xf0a996bf [64]
                // - 0xf0a99780 ... 0xf0a997bf [64]
                // - 0xf0a99880 ... 0xf0a998bf [64]
                // - 0xf0a99980 ... 0xf0a999bf [64]
                // - 0xf0a99a80 ... 0xf0a99abf [64]
                // - 0xf0a99b80 ... 0xf0a99bbf [64]
                // - 0xf0a99c80 ... 0xf0a99cbf [64]
                // - 0xf0a99d80 ... 0xf0a99dbf [64]
                // - 0xf0a99e80 ... 0xf0a99ebf [64]
                // - 0xf0a99f80 ... 0xf0a99fbf [64]
                // - 0xf0a9a080 ... 0xf0a9a0bf [64]
                // - 0xf0a9a180 ... 0xf0a9a1bf [64]
                // - 0xf0a9a280 ... 0xf0a9a2bf [64]
                // - 0xf0a9a380 ... 0xf0a9a3bf [64]
                // - 0xf0a9a480 ... 0xf0a9a4bf [64]
                // - 0xf0a9a580 ... 0xf0a9a5bf [64]
                // - 0xf0a9a680 ... 0xf0a9a6bf [64]
                // - 0xf0a9a780 ... 0xf0a9a7bf [64]
                // - 0xf0a9a880 ... 0xf0a9a8bf [64]
                // - 0xf0a9a980 ... 0xf0a9a9bf [64]
                // - 0xf0a9aa80 ... 0xf0a9aabf [64]
                // - 0xf0a9ab80 ... 0xf0a9abbf [64]
                // - 0xf0a9ac80 ... 0xf0a9acbf [64]
                // - 0xf0a9ad80 ... 0xf0a9adbf [64]
                // - 0xf0a9ae80 ... 0xf0a9aebf [64]
                // - 0xf0a9af80 ... 0xf0a9afbf [64]
                // - 0xf0a9b080 ... 0xf0a9b0bf [64]
                // - 0xf0a9b180 ... 0xf0a9b1bf [64]
                // - 0xf0a9b280 ... 0xf0a9b2bf [64]
                // - 0xf0a9b380 ... 0xf0a9b3bf [64]
                // - 0xf0a9b480 ... 0xf0a9b4bf [64]
                // - 0xf0a9b580 ... 0xf0a9b5bf [64]
                // - 0xf0a9b680 ... 0xf0a9b6bf [64]
                // - 0xf0a9b780 ... 0xf0a9b7bf [64]
                // - 0xf0a9b880 ... 0xf0a9b8bf [64]
                // - 0xf0a9b980 ... 0xf0a9b9bf [64]
                // - 0xf0a9ba80 ... 0xf0a9babf [64]
                // - 0xf0a9bb80 ... 0xf0a9bbbf [64]
                // - 0xf0a9bc80 ... 0xf0a9bcbf [64]
                // - 0xf0a9bd80 ... 0xf0a9bdbf [64]
                // - 0xf0a9be80 ... 0xf0a9bebf [64]
                // - 0xf0a9bf80 ... 0xf0a9bfbf [64]
                if (_pattern[_currentParticleIndex + 1] >= 0xa0 && _pattern[_currentParticleIndex + 1] <= 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0aa8080 ... 0xf0aa80bf [64]
                        // - 0xf0aa8180 ... 0xf0aa81bf [64]
                        // - 0xf0aa8280 ... 0xf0aa82bf [64]
                        // - 0xf0aa8380 ... 0xf0aa83bf [64]
                        // - 0xf0aa8480 ... 0xf0aa84bf [64]
                        // - 0xf0aa8580 ... 0xf0aa85bf [64]
                        // - 0xf0aa8680 ... 0xf0aa86bf [64]
                        // - 0xf0aa8780 ... 0xf0aa87bf [64]
                        // - 0xf0aa8880 ... 0xf0aa88bf [64]
                        // - 0xf0aa8980 ... 0xf0aa89bf [64]
                        // - 0xf0aa8a80 ... 0xf0aa8abf [64]
                        // - 0xf0aa8b80 ... 0xf0aa8bbf [64]
                        // - 0xf0aa8c80 ... 0xf0aa8cbf [64]
                        // - 0xf0aa8d80 ... 0xf0aa8dbf [64]
                        // - 0xf0aa8e80 ... 0xf0aa8ebf [64]
                        // - 0xf0aa8f80 ... 0xf0aa8fbf [64]
                        // - 0xf0aa9080 ... 0xf0aa90bf [64]
                        // - 0xf0aa9180 ... 0xf0aa91bf [64]
                        // - 0xf0aa9280 ... 0xf0aa92bf [64]
                        // - 0xf0aa9380 ... 0xf0aa93bf [64]
                        // - 0xf0aa9480 ... 0xf0aa94bf [64]
                        // - 0xf0aa9580 ... 0xf0aa95bf [64]
                        // - 0xf0aa9680 ... 0xf0aa96bf [64]
                        // - 0xf0aa9780 ... 0xf0aa97bf [64]
                        // - 0xf0aa9880 ... 0xf0aa98bf [64]
                        // - 0xf0aa9980 ... 0xf0aa99bf [64]
                        // - 0xf0aa9a80 ... 0xf0aa9abf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x9a)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0aa9b80 ... 0xf0aa9b9f [32]
                        if (_pattern[_currentParticleIndex + 2] == 0x9b) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0x9f
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 2A700: 0xf0aa9c80 ... 2B81D: 0xf0aba09d [4382]
                        // - 0xf0aa9c80 ... 0xf0aa9cbf [64]
                        // - 0xf0aa9d80 ... 0xf0aa9dbf [64]
                        // - 0xf0aa9e80 ... 0xf0aa9ebf [64]
                        // - 0xf0aa9f80 ... 0xf0aa9fbf [64]
                        // - 0xf0aaa080 ... 0xf0aaa0bf [64]
                        // - 0xf0aaa180 ... 0xf0aaa1bf [64]
                        // - 0xf0aaa280 ... 0xf0aaa2bf [64]
                        // - 0xf0aaa380 ... 0xf0aaa3bf [64]
                        // - 0xf0aaa480 ... 0xf0aaa4bf [64]
                        // - 0xf0aaa580 ... 0xf0aaa5bf [64]
                        // - 0xf0aaa680 ... 0xf0aaa6bf [64]
                        // - 0xf0aaa780 ... 0xf0aaa7bf [64]
                        // - 0xf0aaa880 ... 0xf0aaa8bf [64]
                        // - 0xf0aaa980 ... 0xf0aaa9bf [64]
                        // - 0xf0aaaa80 ... 0xf0aaaabf [64]
                        // - 0xf0aaab80 ... 0xf0aaabbf [64]
                        // - 0xf0aaac80 ... 0xf0aaacbf [64]
                        // - 0xf0aaad80 ... 0xf0aaadbf [64]
                        // - 0xf0aaae80 ... 0xf0aaaebf [64]
                        // - 0xf0aaaf80 ... 0xf0aaafbf [64]
                        // - 0xf0aab080 ... 0xf0aab0bf [64]
                        // - 0xf0aab180 ... 0xf0aab1bf [64]
                        // - 0xf0aab280 ... 0xf0aab2bf [64]
                        // - 0xf0aab380 ... 0xf0aab3bf [64]
                        // - 0xf0aab480 ... 0xf0aab4bf [64]
                        // - 0xf0aab580 ... 0xf0aab5bf [64]
                        // - 0xf0aab680 ... 0xf0aab6bf [64]
                        // - 0xf0aab780 ... 0xf0aab7bf [64]
                        // - 0xf0aab880 ... 0xf0aab8bf [64]
                        // - 0xf0aab980 ... 0xf0aab9bf [64]
                        // - 0xf0aaba80 ... 0xf0aababf [64]
                        // - 0xf0aabb80 ... 0xf0aabbbf [64]
                        // - 0xf0aabc80 ... 0xf0aabcbf [64]
                        // - 0xf0aabd80 ... 0xf0aabdbf [64]
                        // - 0xf0aabe80 ... 0xf0aabebf [64]
                        // - 0xf0aabf80 ... 0xf0aabfbf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0x9c && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0x9f
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0ab8080 ... 0xf0ab80bf [64]
                        // - 0xf0ab8180 ... 0xf0ab81bf [64]
                        // - 0xf0ab8280 ... 0xf0ab82bf [64]
                        // - 0xf0ab8380 ... 0xf0ab83bf [64]
                        // - 0xf0ab8480 ... 0xf0ab84bf [64]
                        // - 0xf0ab8580 ... 0xf0ab85bf [64]
                        // - 0xf0ab8680 ... 0xf0ab86bf [64]
                        // - 0xf0ab8780 ... 0xf0ab87bf [64]
                        // - 0xf0ab8880 ... 0xf0ab88bf [64]
                        // - 0xf0ab8980 ... 0xf0ab89bf [64]
                        // - 0xf0ab8a80 ... 0xf0ab8abf [64]
                        // - 0xf0ab8b80 ... 0xf0ab8bbf [64]
                        // - 0xf0ab8c80 ... 0xf0ab8cbf [64]
                        // - 0xf0ab8d80 ... 0xf0ab8dbf [64]
                        // - 0xf0ab8e80 ... 0xf0ab8ebf [64]
                        // - 0xf0ab8f80 ... 0xf0ab8fbf [64]
                        // - 0xf0ab9080 ... 0xf0ab90bf [64]
                        // - 0xf0ab9180 ... 0xf0ab91bf [64]
                        // - 0xf0ab9280 ... 0xf0ab92bf [64]
                        // - 0xf0ab9380 ... 0xf0ab93bf [64]
                        // - 0xf0ab9480 ... 0xf0ab94bf [64]
                        // - 0xf0ab9580 ... 0xf0ab95bf [64]
                        // - 0xf0ab9680 ... 0xf0ab96bf [64]
                        // - 0xf0ab9780 ... 0xf0ab97bf [64]
                        // - 0xf0ab9880 ... 0xf0ab98bf [64]
                        // - 0xf0ab9980 ... 0xf0ab99bf [64]
                        // - 0xf0ab9a80 ... 0xf0ab9abf [64]
                        // - 0xf0ab9b80 ... 0xf0ab9bbf [64]
                        // - 0xf0ab9c80 ... 0xf0ab9cbf [64]
                        // - 0xf0ab9d80 ... 0xf0ab9dbf [64]
                        // - 0xf0ab9e80 ... 0xf0ab9ebf [64]
                        // - 0xf0ab9f80 ... 0xf0ab9fbf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x9f)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0aba080 ... 0xf0aba09d [30]
                        // 2B820: 0xf0aba0a0 ... 2CEAD: 0xf0acbaad [5774]
                        // - 0xf0aba0a0 ... 0xf0aba0bf [32]
                        if (_pattern[_currentParticleIndex + 2] == 0xa0) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x9d)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xa0
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0aba180 ... 0xf0aba1bf [64]
                        // - 0xf0aba280 ... 0xf0aba2bf [64]
                        // - 0xf0aba380 ... 0xf0aba3bf [64]
                        // - 0xf0aba480 ... 0xf0aba4bf [64]
                        // - 0xf0aba580 ... 0xf0aba5bf [64]
                        // - 0xf0aba680 ... 0xf0aba6bf [64]
                        // - 0xf0aba780 ... 0xf0aba7bf [64]
                        // - 0xf0aba880 ... 0xf0aba8bf [64]
                        // - 0xf0aba980 ... 0xf0aba9bf [64]
                        // - 0xf0abaa80 ... 0xf0abaabf [64]
                        // - 0xf0abab80 ... 0xf0ababbf [64]
                        // - 0xf0abac80 ... 0xf0abacbf [64]
                        // - 0xf0abad80 ... 0xf0abadbf [64]
                        // - 0xf0abae80 ... 0xf0abaebf [64]
                        // - 0xf0abaf80 ... 0xf0abafbf [64]
                        // - 0xf0abb080 ... 0xf0abb0bf [64]
                        // - 0xf0abb180 ... 0xf0abb1bf [64]
                        // - 0xf0abb280 ... 0xf0abb2bf [64]
                        // - 0xf0abb380 ... 0xf0abb3bf [64]
                        // - 0xf0abb480 ... 0xf0abb4bf [64]
                        // - 0xf0abb580 ... 0xf0abb5bf [64]
                        // - 0xf0abb680 ... 0xf0abb6bf [64]
                        // - 0xf0abb780 ... 0xf0abb7bf [64]
                        // - 0xf0abb880 ... 0xf0abb8bf [64]
                        // - 0xf0abb980 ... 0xf0abb9bf [64]
                        // - 0xf0abba80 ... 0xf0abbabf [64]
                        // - 0xf0abbb80 ... 0xf0abbbbf [64]
                        // - 0xf0abbc80 ... 0xf0abbcbf [64]
                        // - 0xf0abbd80 ... 0xf0abbdbf [64]
                        // - 0xf0abbe80 ... 0xf0abbebf [64]
                        // - 0xf0abbf80 ... 0xf0abbfbf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0xa1 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xac) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0ac8080 ... 0xf0ac80bf [64]
                        // - 0xf0ac8180 ... 0xf0ac81bf [64]
                        // - 0xf0ac8280 ... 0xf0ac82bf [64]
                        // - 0xf0ac8380 ... 0xf0ac83bf [64]
                        // - 0xf0ac8480 ... 0xf0ac84bf [64]
                        // - 0xf0ac8580 ... 0xf0ac85bf [64]
                        // - 0xf0ac8680 ... 0xf0ac86bf [64]
                        // - 0xf0ac8780 ... 0xf0ac87bf [64]
                        // - 0xf0ac8880 ... 0xf0ac88bf [64]
                        // - 0xf0ac8980 ... 0xf0ac89bf [64]
                        // - 0xf0ac8a80 ... 0xf0ac8abf [64]
                        // - 0xf0ac8b80 ... 0xf0ac8bbf [64]
                        // - 0xf0ac8c80 ... 0xf0ac8cbf [64]
                        // - 0xf0ac8d80 ... 0xf0ac8dbf [64]
                        // - 0xf0ac8e80 ... 0xf0ac8ebf [64]
                        // - 0xf0ac8f80 ... 0xf0ac8fbf [64]
                        // - 0xf0ac9080 ... 0xf0ac90bf [64]
                        // - 0xf0ac9180 ... 0xf0ac91bf [64]
                        // - 0xf0ac9280 ... 0xf0ac92bf [64]
                        // - 0xf0ac9380 ... 0xf0ac93bf [64]
                        // - 0xf0ac9480 ... 0xf0ac94bf [64]
                        // - 0xf0ac9580 ... 0xf0ac95bf [64]
                        // - 0xf0ac9680 ... 0xf0ac96bf [64]
                        // - 0xf0ac9780 ... 0xf0ac97bf [64]
                        // - 0xf0ac9880 ... 0xf0ac98bf [64]
                        // - 0xf0ac9980 ... 0xf0ac99bf [64]
                        // - 0xf0ac9a80 ... 0xf0ac9abf [64]
                        // - 0xf0ac9b80 ... 0xf0ac9bbf [64]
                        // - 0xf0ac9c80 ... 0xf0ac9cbf [64]
                        // - 0xf0ac9d80 ... 0xf0ac9dbf [64]
                        // - 0xf0ac9e80 ... 0xf0ac9ebf [64]
                        // - 0xf0ac9f80 ... 0xf0ac9fbf [64]
                        // - 0xf0aca080 ... 0xf0aca0bf [64]
                        // - 0xf0aca180 ... 0xf0aca1bf [64]
                        // - 0xf0aca280 ... 0xf0aca2bf [64]
                        // - 0xf0aca380 ... 0xf0aca3bf [64]
                        // - 0xf0aca480 ... 0xf0aca4bf [64]
                        // - 0xf0aca580 ... 0xf0aca5bf [64]
                        // - 0xf0aca680 ... 0xf0aca6bf [64]
                        // - 0xf0aca780 ... 0xf0aca7bf [64]
                        // - 0xf0aca880 ... 0xf0aca8bf [64]
                        // - 0xf0aca980 ... 0xf0aca9bf [64]
                        // - 0xf0acaa80 ... 0xf0acaabf [64]
                        // - 0xf0acab80 ... 0xf0acabbf [64]
                        // - 0xf0acac80 ... 0xf0acacbf [64]
                        // - 0xf0acad80 ... 0xf0acadbf [64]
                        // - 0xf0acae80 ... 0xf0acaebf [64]
                        // - 0xf0acaf80 ... 0xf0acafbf [64]
                        // - 0xf0acb080 ... 0xf0acb0bf [64]
                        // - 0xf0acb180 ... 0xf0acb1bf [64]
                        // - 0xf0acb280 ... 0xf0acb2bf [64]
                        // - 0xf0acb380 ... 0xf0acb3bf [64]
                        // - 0xf0acb480 ... 0xf0acb4bf [64]
                        // - 0xf0acb580 ... 0xf0acb5bf [64]
                        // - 0xf0acb680 ... 0xf0acb6bf [64]
                        // - 0xf0acb780 ... 0xf0acb7bf [64]
                        // - 0xf0acb880 ... 0xf0acb8bf [64]
                        // - 0xf0acb980 ... 0xf0acb9bf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xb9)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0acba80 ... 0xf0acbaad [46]
                        // 2CEB0: 0xf0acbab0 ... 2EBE0: 0xf0aeafa0 [7473]
                        // - 0xf0acbab0 ... 0xf0acbabf [16]
                        if (_pattern[_currentParticleIndex + 2] == 0xba) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0xad)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0acbb80 ... 0xf0acbbbf [64]
                        // - 0xf0acbc80 ... 0xf0acbcbf [64]
                        // - 0xf0acbd80 ... 0xf0acbdbf [64]
                        // - 0xf0acbe80 ... 0xf0acbebf [64]
                        // - 0xf0acbf80 ... 0xf0acbfbf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0xbb && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0ad8080 ... 0xf0ad80bf [64]
                        // - 0xf0ad8180 ... 0xf0ad81bf [64]
                        // - 0xf0ad8280 ... 0xf0ad82bf [64]
                        // - 0xf0ad8380 ... 0xf0ad83bf [64]
                        // - 0xf0ad8480 ... 0xf0ad84bf [64]
                        // - 0xf0ad8580 ... 0xf0ad85bf [64]
                        // - 0xf0ad8680 ... 0xf0ad86bf [64]
                        // - 0xf0ad8780 ... 0xf0ad87bf [64]
                        // - 0xf0ad8880 ... 0xf0ad88bf [64]
                        // - 0xf0ad8980 ... 0xf0ad89bf [64]
                        // - 0xf0ad8a80 ... 0xf0ad8abf [64]
                        // - 0xf0ad8b80 ... 0xf0ad8bbf [64]
                        // - 0xf0ad8c80 ... 0xf0ad8cbf [64]
                        // - 0xf0ad8d80 ... 0xf0ad8dbf [64]
                        // - 0xf0ad8e80 ... 0xf0ad8ebf [64]
                        // - 0xf0ad8f80 ... 0xf0ad8fbf [64]
                        // - 0xf0ad9080 ... 0xf0ad90bf [64]
                        // - 0xf0ad9180 ... 0xf0ad91bf [64]
                        // - 0xf0ad9280 ... 0xf0ad92bf [64]
                        // - 0xf0ad9380 ... 0xf0ad93bf [64]
                        // - 0xf0ad9480 ... 0xf0ad94bf [64]
                        // - 0xf0ad9580 ... 0xf0ad95bf [64]
                        // - 0xf0ad9680 ... 0xf0ad96bf [64]
                        // - 0xf0ad9780 ... 0xf0ad97bf [64]
                        // - 0xf0ad9880 ... 0xf0ad98bf [64]
                        // - 0xf0ad9980 ... 0xf0ad99bf [64]
                        // - 0xf0ad9a80 ... 0xf0ad9abf [64]
                        // - 0xf0ad9b80 ... 0xf0ad9bbf [64]
                        // - 0xf0ad9c80 ... 0xf0ad9cbf [64]
                        // - 0xf0ad9d80 ... 0xf0ad9dbf [64]
                        // - 0xf0ad9e80 ... 0xf0ad9ebf [64]
                        // - 0xf0ad9f80 ... 0xf0ad9fbf [64]
                        // - 0xf0ada080 ... 0xf0ada0bf [64]
                        // - 0xf0ada180 ... 0xf0ada1bf [64]
                        // - 0xf0ada280 ... 0xf0ada2bf [64]
                        // - 0xf0ada380 ... 0xf0ada3bf [64]
                        // - 0xf0ada480 ... 0xf0ada4bf [64]
                        // - 0xf0ada580 ... 0xf0ada5bf [64]
                        // - 0xf0ada680 ... 0xf0ada6bf [64]
                        // - 0xf0ada780 ... 0xf0ada7bf [64]
                        // - 0xf0ada880 ... 0xf0ada8bf [64]
                        // - 0xf0ada980 ... 0xf0ada9bf [64]
                        // - 0xf0adaa80 ... 0xf0adaabf [64]
                        // - 0xf0adab80 ... 0xf0adabbf [64]
                        // - 0xf0adac80 ... 0xf0adacbf [64]
                        // - 0xf0adad80 ... 0xf0adadbf [64]
                        // - 0xf0adae80 ... 0xf0adaebf [64]
                        // - 0xf0adaf80 ... 0xf0adafbf [64]
                        // - 0xf0adb080 ... 0xf0adb0bf [64]
                        // - 0xf0adb180 ... 0xf0adb1bf [64]
                        // - 0xf0adb280 ... 0xf0adb2bf [64]
                        // - 0xf0adb380 ... 0xf0adb3bf [64]
                        // - 0xf0adb480 ... 0xf0adb4bf [64]
                        // - 0xf0adb580 ... 0xf0adb5bf [64]
                        // - 0xf0adb680 ... 0xf0adb6bf [64]
                        // - 0xf0adb780 ... 0xf0adb7bf [64]
                        // - 0xf0adb880 ... 0xf0adb8bf [64]
                        // - 0xf0adb980 ... 0xf0adb9bf [64]
                        // - 0xf0adba80 ... 0xf0adbabf [64]
                        // - 0xf0adbb80 ... 0xf0adbbbf [64]
                        // - 0xf0adbc80 ... 0xf0adbcbf [64]
                        // - 0xf0adbd80 ... 0xf0adbdbf [64]
                        // - 0xf0adbe80 ... 0xf0adbebf [64]
                        // - 0xf0adbf80 ... 0xf0adbfbf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xae) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0ae8080 ... 0xf0ae80bf [64]
                        // - 0xf0ae8180 ... 0xf0ae81bf [64]
                        // - 0xf0ae8280 ... 0xf0ae82bf [64]
                        // - 0xf0ae8380 ... 0xf0ae83bf [64]
                        // - 0xf0ae8480 ... 0xf0ae84bf [64]
                        // - 0xf0ae8580 ... 0xf0ae85bf [64]
                        // - 0xf0ae8680 ... 0xf0ae86bf [64]
                        // - 0xf0ae8780 ... 0xf0ae87bf [64]
                        // - 0xf0ae8880 ... 0xf0ae88bf [64]
                        // - 0xf0ae8980 ... 0xf0ae89bf [64]
                        // - 0xf0ae8a80 ... 0xf0ae8abf [64]
                        // - 0xf0ae8b80 ... 0xf0ae8bbf [64]
                        // - 0xf0ae8c80 ... 0xf0ae8cbf [64]
                        // - 0xf0ae8d80 ... 0xf0ae8dbf [64]
                        // - 0xf0ae8e80 ... 0xf0ae8ebf [64]
                        // - 0xf0ae8f80 ... 0xf0ae8fbf [64]
                        // - 0xf0ae9080 ... 0xf0ae90bf [64]
                        // - 0xf0ae9180 ... 0xf0ae91bf [64]
                        // - 0xf0ae9280 ... 0xf0ae92bf [64]
                        // - 0xf0ae9380 ... 0xf0ae93bf [64]
                        // - 0xf0ae9480 ... 0xf0ae94bf [64]
                        // - 0xf0ae9580 ... 0xf0ae95bf [64]
                        // - 0xf0ae9680 ... 0xf0ae96bf [64]
                        // - 0xf0ae9780 ... 0xf0ae97bf [64]
                        // - 0xf0ae9880 ... 0xf0ae98bf [64]
                        // - 0xf0ae9980 ... 0xf0ae99bf [64]
                        // - 0xf0ae9a80 ... 0xf0ae9abf [64]
                        // - 0xf0ae9b80 ... 0xf0ae9bbf [64]
                        // - 0xf0ae9c80 ... 0xf0ae9cbf [64]
                        // - 0xf0ae9d80 ... 0xf0ae9dbf [64]
                        // - 0xf0ae9e80 ... 0xf0ae9ebf [64]
                        // - 0xf0ae9f80 ... 0xf0ae9fbf [64]
                        // - 0xf0aea080 ... 0xf0aea0bf [64]
                        // - 0xf0aea180 ... 0xf0aea1bf [64]
                        // - 0xf0aea280 ... 0xf0aea2bf [64]
                        // - 0xf0aea380 ... 0xf0aea3bf [64]
                        // - 0xf0aea480 ... 0xf0aea4bf [64]
                        // - 0xf0aea580 ... 0xf0aea5bf [64]
                        // - 0xf0aea680 ... 0xf0aea6bf [64]
                        // - 0xf0aea780 ... 0xf0aea7bf [64]
                        // - 0xf0aea880 ... 0xf0aea8bf [64]
                        // - 0xf0aea980 ... 0xf0aea9bf [64]
                        // - 0xf0aeaa80 ... 0xf0aeaabf [64]
                        // - 0xf0aeab80 ... 0xf0aeabbf [64]
                        // - 0xf0aeac80 ... 0xf0aeacbf [64]
                        // - 0xf0aead80 ... 0xf0aeadbf [64]
                        // - 0xf0aeae80 ... 0xf0aeaebf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xae)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0aeaf80 ... 0xf0aeafa0 [33]
                        // 2EBF0: 0xf0aeafb0 ... 2EE5D: 0xf0aeb99d [622]
                        // - 0xf0aeafb0 ... 0xf0aeafbf [16]
                        if (_pattern[_currentParticleIndex + 2] == 0xaf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0xa0)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0aeb080 ... 0xf0aeb0bf [64]
                        // - 0xf0aeb180 ... 0xf0aeb1bf [64]
                        // - 0xf0aeb280 ... 0xf0aeb2bf [64]
                        // - 0xf0aeb380 ... 0xf0aeb3bf [64]
                        // - 0xf0aeb480 ... 0xf0aeb4bf [64]
                        // - 0xf0aeb580 ... 0xf0aeb5bf [64]
                        // - 0xf0aeb680 ... 0xf0aeb6bf [64]
                        // - 0xf0aeb780 ... 0xf0aeb7bf [64]
                        // - 0xf0aeb880 ... 0xf0aeb8bf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0xb0 && _pattern[_currentParticleIndex + 2] <= 0xb8)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0aeb980 ... 0xf0aeb99d [30]
                        if (_pattern[_currentParticleIndex + 2] == 0xb9) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0x9d
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 2F800: 0xf0afa080 ... 2FA1D: 0xf0afa89d [542]
                        // - 0xf0afa080 ... 0xf0afa0bf [64]
                        // - 0xf0afa180 ... 0xf0afa1bf [64]
                        // - 0xf0afa280 ... 0xf0afa2bf [64]
                        // - 0xf0afa380 ... 0xf0afa3bf [64]
                        // - 0xf0afa480 ... 0xf0afa4bf [64]
                        // - 0xf0afa580 ... 0xf0afa5bf [64]
                        // - 0xf0afa680 ... 0xf0afa6bf [64]
                        // - 0xf0afa780 ... 0xf0afa7bf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0xa0 && _pattern[_currentParticleIndex + 2] <= 0xa7)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0afa880 ... 0xf0afa89d [30]
                        if (_pattern[_currentParticleIndex + 2] == 0xa8) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0x9d
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 30000: 0xf0b08080 ... 3134A: 0xf0b18d8a [4939]
                        // - 0xf0b08080 ... 0xf0b080bf [64]
                        // - 0xf0b08180 ... 0xf0b081bf [64]
                        // - 0xf0b08280 ... 0xf0b082bf [64]
                        // - 0xf0b08380 ... 0xf0b083bf [64]
                        // - 0xf0b08480 ... 0xf0b084bf [64]
                        // - 0xf0b08580 ... 0xf0b085bf [64]
                        // - 0xf0b08680 ... 0xf0b086bf [64]
                        // - 0xf0b08780 ... 0xf0b087bf [64]
                        // - 0xf0b08880 ... 0xf0b088bf [64]
                        // - 0xf0b08980 ... 0xf0b089bf [64]
                        // - 0xf0b08a80 ... 0xf0b08abf [64]
                        // - 0xf0b08b80 ... 0xf0b08bbf [64]
                        // - 0xf0b08c80 ... 0xf0b08cbf [64]
                        // - 0xf0b08d80 ... 0xf0b08dbf [64]
                        // - 0xf0b08e80 ... 0xf0b08ebf [64]
                        // - 0xf0b08f80 ... 0xf0b08fbf [64]
                        // - 0xf0b09080 ... 0xf0b090bf [64]
                        // - 0xf0b09180 ... 0xf0b091bf [64]
                        // - 0xf0b09280 ... 0xf0b092bf [64]
                        // - 0xf0b09380 ... 0xf0b093bf [64]
                        // - 0xf0b09480 ... 0xf0b094bf [64]
                        // - 0xf0b09580 ... 0xf0b095bf [64]
                        // - 0xf0b09680 ... 0xf0b096bf [64]
                        // - 0xf0b09780 ... 0xf0b097bf [64]
                        // - 0xf0b09880 ... 0xf0b098bf [64]
                        // - 0xf0b09980 ... 0xf0b099bf [64]
                        // - 0xf0b09a80 ... 0xf0b09abf [64]
                        // - 0xf0b09b80 ... 0xf0b09bbf [64]
                        // - 0xf0b09c80 ... 0xf0b09cbf [64]
                        // - 0xf0b09d80 ... 0xf0b09dbf [64]
                        // - 0xf0b09e80 ... 0xf0b09ebf [64]
                        // - 0xf0b09f80 ... 0xf0b09fbf [64]
                        // - 0xf0b0a080 ... 0xf0b0a0bf [64]
                        // - 0xf0b0a180 ... 0xf0b0a1bf [64]
                        // - 0xf0b0a280 ... 0xf0b0a2bf [64]
                        // - 0xf0b0a380 ... 0xf0b0a3bf [64]
                        // - 0xf0b0a480 ... 0xf0b0a4bf [64]
                        // - 0xf0b0a580 ... 0xf0b0a5bf [64]
                        // - 0xf0b0a680 ... 0xf0b0a6bf [64]
                        // - 0xf0b0a780 ... 0xf0b0a7bf [64]
                        // - 0xf0b0a880 ... 0xf0b0a8bf [64]
                        // - 0xf0b0a980 ... 0xf0b0a9bf [64]
                        // - 0xf0b0aa80 ... 0xf0b0aabf [64]
                        // - 0xf0b0ab80 ... 0xf0b0abbf [64]
                        // - 0xf0b0ac80 ... 0xf0b0acbf [64]
                        // - 0xf0b0ad80 ... 0xf0b0adbf [64]
                        // - 0xf0b0ae80 ... 0xf0b0aebf [64]
                        // - 0xf0b0af80 ... 0xf0b0afbf [64]
                        // - 0xf0b0b080 ... 0xf0b0b0bf [64]
                        // - 0xf0b0b180 ... 0xf0b0b1bf [64]
                        // - 0xf0b0b280 ... 0xf0b0b2bf [64]
                        // - 0xf0b0b380 ... 0xf0b0b3bf [64]
                        // - 0xf0b0b480 ... 0xf0b0b4bf [64]
                        // - 0xf0b0b580 ... 0xf0b0b5bf [64]
                        // - 0xf0b0b680 ... 0xf0b0b6bf [64]
                        // - 0xf0b0b780 ... 0xf0b0b7bf [64]
                        // - 0xf0b0b880 ... 0xf0b0b8bf [64]
                        // - 0xf0b0b980 ... 0xf0b0b9bf [64]
                        // - 0xf0b0ba80 ... 0xf0b0babf [64]
                        // - 0xf0b0bb80 ... 0xf0b0bbbf [64]
                        // - 0xf0b0bc80 ... 0xf0b0bcbf [64]
                        // - 0xf0b0bd80 ... 0xf0b0bdbf [64]
                        // - 0xf0b0be80 ... 0xf0b0bebf [64]
                        // - 0xf0b0bf80 ... 0xf0b0bfbf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0b18080 ... 0xf0b180bf [64]
                        // - 0xf0b18180 ... 0xf0b181bf [64]
                        // - 0xf0b18280 ... 0xf0b182bf [64]
                        // - 0xf0b18380 ... 0xf0b183bf [64]
                        // - 0xf0b18480 ... 0xf0b184bf [64]
                        // - 0xf0b18580 ... 0xf0b185bf [64]
                        // - 0xf0b18680 ... 0xf0b186bf [64]
                        // - 0xf0b18780 ... 0xf0b187bf [64]
                        // - 0xf0b18880 ... 0xf0b188bf [64]
                        // - 0xf0b18980 ... 0xf0b189bf [64]
                        // - 0xf0b18a80 ... 0xf0b18abf [64]
                        // - 0xf0b18b80 ... 0xf0b18bbf [64]
                        // - 0xf0b18c80 ... 0xf0b18cbf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x8c)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0b18d80 ... 0xf0b18d8a [11]
                        // 31350: 0xf0b18d90 ... 33479: 0xf0b391b9 [8490]
                        // - 0xf0b18d90 ... 0xf0b18dbf [48]
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x8a)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x90
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0b18e80 ... 0xf0b18ebf [64]
                        // - 0xf0b18f80 ... 0xf0b18fbf [64]
                        // - 0xf0b19080 ... 0xf0b190bf [64]
                        // - 0xf0b19180 ... 0xf0b191bf [64]
                        // - 0xf0b19280 ... 0xf0b192bf [64]
                        // - 0xf0b19380 ... 0xf0b193bf [64]
                        // - 0xf0b19480 ... 0xf0b194bf [64]
                        // - 0xf0b19580 ... 0xf0b195bf [64]
                        // - 0xf0b19680 ... 0xf0b196bf [64]
                        // - 0xf0b19780 ... 0xf0b197bf [64]
                        // - 0xf0b19880 ... 0xf0b198bf [64]
                        // - 0xf0b19980 ... 0xf0b199bf [64]
                        // - 0xf0b19a80 ... 0xf0b19abf [64]
                        // - 0xf0b19b80 ... 0xf0b19bbf [64]
                        // - 0xf0b19c80 ... 0xf0b19cbf [64]
                        // - 0xf0b19d80 ... 0xf0b19dbf [64]
                        // - 0xf0b19e80 ... 0xf0b19ebf [64]
                        // - 0xf0b19f80 ... 0xf0b19fbf [64]
                        // - 0xf0b1a080 ... 0xf0b1a0bf [64]
                        // - 0xf0b1a180 ... 0xf0b1a1bf [64]
                        // - 0xf0b1a280 ... 0xf0b1a2bf [64]
                        // - 0xf0b1a380 ... 0xf0b1a3bf [64]
                        // - 0xf0b1a480 ... 0xf0b1a4bf [64]
                        // - 0xf0b1a580 ... 0xf0b1a5bf [64]
                        // - 0xf0b1a680 ... 0xf0b1a6bf [64]
                        // - 0xf0b1a780 ... 0xf0b1a7bf [64]
                        // - 0xf0b1a880 ... 0xf0b1a8bf [64]
                        // - 0xf0b1a980 ... 0xf0b1a9bf [64]
                        // - 0xf0b1aa80 ... 0xf0b1aabf [64]
                        // - 0xf0b1ab80 ... 0xf0b1abbf [64]
                        // - 0xf0b1ac80 ... 0xf0b1acbf [64]
                        // - 0xf0b1ad80 ... 0xf0b1adbf [64]
                        // - 0xf0b1ae80 ... 0xf0b1aebf [64]
                        // - 0xf0b1af80 ... 0xf0b1afbf [64]
                        // - 0xf0b1b080 ... 0xf0b1b0bf [64]
                        // - 0xf0b1b180 ... 0xf0b1b1bf [64]
                        // - 0xf0b1b280 ... 0xf0b1b2bf [64]
                        // - 0xf0b1b380 ... 0xf0b1b3bf [64]
                        // - 0xf0b1b480 ... 0xf0b1b4bf [64]
                        // - 0xf0b1b580 ... 0xf0b1b5bf [64]
                        // - 0xf0b1b680 ... 0xf0b1b6bf [64]
                        // - 0xf0b1b780 ... 0xf0b1b7bf [64]
                        // - 0xf0b1b880 ... 0xf0b1b8bf [64]
                        // - 0xf0b1b980 ... 0xf0b1b9bf [64]
                        // - 0xf0b1ba80 ... 0xf0b1babf [64]
                        // - 0xf0b1bb80 ... 0xf0b1bbbf [64]
                        // - 0xf0b1bc80 ... 0xf0b1bcbf [64]
                        // - 0xf0b1bd80 ... 0xf0b1bdbf [64]
                        // - 0xf0b1be80 ... 0xf0b1bebf [64]
                        // - 0xf0b1bf80 ... 0xf0b1bfbf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0x8e && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb2) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0b28080 ... 0xf0b280bf [64]
                        // - 0xf0b28180 ... 0xf0b281bf [64]
                        // - 0xf0b28280 ... 0xf0b282bf [64]
                        // - 0xf0b28380 ... 0xf0b283bf [64]
                        // - 0xf0b28480 ... 0xf0b284bf [64]
                        // - 0xf0b28580 ... 0xf0b285bf [64]
                        // - 0xf0b28680 ... 0xf0b286bf [64]
                        // - 0xf0b28780 ... 0xf0b287bf [64]
                        // - 0xf0b28880 ... 0xf0b288bf [64]
                        // - 0xf0b28980 ... 0xf0b289bf [64]
                        // - 0xf0b28a80 ... 0xf0b28abf [64]
                        // - 0xf0b28b80 ... 0xf0b28bbf [64]
                        // - 0xf0b28c80 ... 0xf0b28cbf [64]
                        // - 0xf0b28d80 ... 0xf0b28dbf [64]
                        // - 0xf0b28e80 ... 0xf0b28ebf [64]
                        // - 0xf0b28f80 ... 0xf0b28fbf [64]
                        // - 0xf0b29080 ... 0xf0b290bf [64]
                        // - 0xf0b29180 ... 0xf0b291bf [64]
                        // - 0xf0b29280 ... 0xf0b292bf [64]
                        // - 0xf0b29380 ... 0xf0b293bf [64]
                        // - 0xf0b29480 ... 0xf0b294bf [64]
                        // - 0xf0b29580 ... 0xf0b295bf [64]
                        // - 0xf0b29680 ... 0xf0b296bf [64]
                        // - 0xf0b29780 ... 0xf0b297bf [64]
                        // - 0xf0b29880 ... 0xf0b298bf [64]
                        // - 0xf0b29980 ... 0xf0b299bf [64]
                        // - 0xf0b29a80 ... 0xf0b29abf [64]
                        // - 0xf0b29b80 ... 0xf0b29bbf [64]
                        // - 0xf0b29c80 ... 0xf0b29cbf [64]
                        // - 0xf0b29d80 ... 0xf0b29dbf [64]
                        // - 0xf0b29e80 ... 0xf0b29ebf [64]
                        // - 0xf0b29f80 ... 0xf0b29fbf [64]
                        // - 0xf0b2a080 ... 0xf0b2a0bf [64]
                        // - 0xf0b2a180 ... 0xf0b2a1bf [64]
                        // - 0xf0b2a280 ... 0xf0b2a2bf [64]
                        // - 0xf0b2a380 ... 0xf0b2a3bf [64]
                        // - 0xf0b2a480 ... 0xf0b2a4bf [64]
                        // - 0xf0b2a580 ... 0xf0b2a5bf [64]
                        // - 0xf0b2a680 ... 0xf0b2a6bf [64]
                        // - 0xf0b2a780 ... 0xf0b2a7bf [64]
                        // - 0xf0b2a880 ... 0xf0b2a8bf [64]
                        // - 0xf0b2a980 ... 0xf0b2a9bf [64]
                        // - 0xf0b2aa80 ... 0xf0b2aabf [64]
                        // - 0xf0b2ab80 ... 0xf0b2abbf [64]
                        // - 0xf0b2ac80 ... 0xf0b2acbf [64]
                        // - 0xf0b2ad80 ... 0xf0b2adbf [64]
                        // - 0xf0b2ae80 ... 0xf0b2aebf [64]
                        // - 0xf0b2af80 ... 0xf0b2afbf [64]
                        // - 0xf0b2b080 ... 0xf0b2b0bf [64]
                        // - 0xf0b2b180 ... 0xf0b2b1bf [64]
                        // - 0xf0b2b280 ... 0xf0b2b2bf [64]
                        // - 0xf0b2b380 ... 0xf0b2b3bf [64]
                        // - 0xf0b2b480 ... 0xf0b2b4bf [64]
                        // - 0xf0b2b580 ... 0xf0b2b5bf [64]
                        // - 0xf0b2b680 ... 0xf0b2b6bf [64]
                        // - 0xf0b2b780 ... 0xf0b2b7bf [64]
                        // - 0xf0b2b880 ... 0xf0b2b8bf [64]
                        // - 0xf0b2b980 ... 0xf0b2b9bf [64]
                        // - 0xf0b2ba80 ... 0xf0b2babf [64]
                        // - 0xf0b2bb80 ... 0xf0b2bbbf [64]
                        // - 0xf0b2bc80 ... 0xf0b2bcbf [64]
                        // - 0xf0b2bd80 ... 0xf0b2bdbf [64]
                        // - 0xf0b2be80 ... 0xf0b2bebf [64]
                        // - 0xf0b2bf80 ... 0xf0b2bfbf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // - 0xf0b38080 ... 0xf0b380bf [64]
                        // - 0xf0b38180 ... 0xf0b381bf [64]
                        // - 0xf0b38280 ... 0xf0b382bf [64]
                        // - 0xf0b38380 ... 0xf0b383bf [64]
                        // - 0xf0b38480 ... 0xf0b384bf [64]
                        // - 0xf0b38580 ... 0xf0b385bf [64]
                        // - 0xf0b38680 ... 0xf0b386bf [64]
                        // - 0xf0b38780 ... 0xf0b387bf [64]
                        // - 0xf0b38880 ... 0xf0b388bf [64]
                        // - 0xf0b38980 ... 0xf0b389bf [64]
                        // - 0xf0b38a80 ... 0xf0b38abf [64]
                        // - 0xf0b38b80 ... 0xf0b38bbf [64]
                        // - 0xf0b38c80 ... 0xf0b38cbf [64]
                        // - 0xf0b38d80 ... 0xf0b38dbf [64]
                        // - 0xf0b38e80 ... 0xf0b38ebf [64]
                        // - 0xf0b38f80 ... 0xf0b38fbf [64]
                        // - 0xf0b39080 ... 0xf0b390bf [64]
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x90)
                        {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // - 0xf0b39180 ... 0xf0b391b9 [58]
                        if (_pattern[_currentParticleIndex + 2] == 0x91) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xb9
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyAsciiHexDigit(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0030: 0x30 ... 0039: 0x39
        if (_pattern[_currentParticleIndex] >= 0x30 && _pattern[_currentParticleIndex] <= 0x39) {
            return (true, _currentParticleIndex);
        }

        // 0041: 0x41 ... 0046: 0x46
        if (_pattern[_currentParticleIndex] >= 0x41 && _pattern[_currentParticleIndex] <= 0x46) {
            return (true, _currentParticleIndex);
        }

        // 0061: 0x61 ... 0066: 0x66
        if (_pattern[_currentParticleIndex] >= 0x61 && _pattern[_currentParticleIndex] <= 0x66) {
            return (true, _currentParticleIndex);
        }

        return (false, 0);
    }

    function isPropertyHexDigit(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0030: 0x30 ... 0039: 0x39 [10]
        if (_pattern[_currentParticleIndex] >= 0x30 && _pattern[_currentParticleIndex] <= 0x39) {
            return (true, _currentParticleIndex);
        }

        // 0041: 0x41 ... 0046: 0x46 [6]
        if (_pattern[_currentParticleIndex] >= 0x41 && _pattern[_currentParticleIndex] <= 0x46) {
            return (true, _currentParticleIndex);
        }

        // 0061: 0x61 ... 0066: 0x66 [6]
        if (_pattern[_currentParticleIndex] >= 0x61 && _pattern[_currentParticleIndex] <= 0x66) {
            return (true, _currentParticleIndex);
        }

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // FF10: 0xefbc90 ... FF19: 0xefbc99 [10]
                // FF21: 0xefbca1 ... FF26: 0xefbca6 [6]
                if (_pattern[_currentParticleIndex + 1] == 0xbc) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x90 && _pattern[_currentParticleIndex + 2] <= 0x99)
                                || (_pattern[_currentParticleIndex + 2] >= 0xa1
                                    && _pattern[_currentParticleIndex + 2] <= 0xa6)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FF41: 0xefbd81 ... FF46: 0xefbd86 [6]
                if (_pattern[_currentParticleIndex + 1] == 0xbd) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x81 && _pattern[_currentParticleIndex + 2] <= 0x86)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyPatternSyntax(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0021: 0x21 ... 0023: 0x23 [3]
        // 0024: 0x24
        // 0025: 0x25 ... 0027: 0x27 [3]
        // 0028: 0x28
        // 0029: 0x29
        // 002A: 0x2a
        // 002B: 0x2b
        // 002C: 0x2c
        // 002D: 0x2d
        // 002E: 0x2e ... 002F: 0x2f [2]
        if (_pattern[_currentParticleIndex] >= 0x21 && _pattern[_currentParticleIndex] <= 0x2f) {
            return (true, _currentParticleIndex);
        }

        // 003A: 0x3a ... 003B: 0x3b [2]
        // 003C: 0x3c ... 003E: 0x3e [3]
        // 003F: 0x3f ... 0040: 0x40 [2]
        if (_pattern[_currentParticleIndex] >= 0x3a && _pattern[_currentParticleIndex] <= 0x40) {
            return (true, _currentParticleIndex);
        }

        // 005B: 0x5b
        // 005C: 0x5c
        // 005D: 0x5d
        // 005E: 0x5e
        if (_pattern[_currentParticleIndex] >= 0x5b && _pattern[_currentParticleIndex] <= 0x5c) {
            return (true, _currentParticleIndex);
        }

        // 0060: 0x60
        if (_pattern[_currentParticleIndex] == 0x60) {
            return (true, _currentParticleIndex);
        }

        // 007B: 0x7b
        // 007C: 0x7c
        // 007D: 0x7d
        // 007E: 0x7e
        if (_pattern[_currentParticleIndex] >= 0x7b && _pattern[_currentParticleIndex] <= 0x7e) {
            return (true, _currentParticleIndex);
        }

        // 00A1: 0xc2a1
        // 00A2: 0xc2a2 ... 00A5: 0xc2a5 [4]
        // 00A6: 0xc2a6
        // 00A7: 0xc2a7
        // 00A9: 0xc2a9
        // 00AB: 0xc2ab
        // 00AC: 0xc2ac
        // 00AE: 0xc2ae
        // 00B0: 0xc2b0
        // 00B1: 0xc2b1
        // 00B6: 0xc2b6
        // 00BB: 0xc2bb
        // 00BF: 0xc2bf
        if (_pattern[_currentParticleIndex] == 0xc2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    (_pattern[_currentParticleIndex + 1] >= 0xa1 && _pattern[_currentParticleIndex + 1] == 0xa7)
                        || _pattern[_currentParticleIndex + 1] == 0xa9 || _pattern[_currentParticleIndex + 1] == 0xab
                        || _pattern[_currentParticleIndex + 1] == 0xac || _pattern[_currentParticleIndex + 1] == 0xae
                        || _pattern[_currentParticleIndex + 1] == 0xb0 || _pattern[_currentParticleIndex + 1] == 0xb1
                        || _pattern[_currentParticleIndex + 1] == 0xb6 || _pattern[_currentParticleIndex + 1] == 0xbb
                        || _pattern[_currentParticleIndex + 1] == 0xbf
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 00D7: 0xc397
        // 00F7: 0xc3b7
        if (_pattern[_currentParticleIndex] == 0xc3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x97 || _pattern[_currentParticleIndex + 1] == 0xb7) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2010: 0xe28090 ... 2015: 0xe28095 [6]
                // 2016: 0xe28096 ... 2017: 0xe28097 [2]
                // 2018: 0xe28098
                // 2019: 0xe28099
                // 201A: 0xe2809a
                // 201B: 0xe2809b ... 201C: 0xe2809c [2]
                // 201D: 0xe2809d
                // 201E: 0xe2809e
                // 201F: 0xe2809f
                // 2020: 0xe280a0 ... 2027: 0xe280a7 [8]

                // 2030: 0xe280b0 ... 2038: 0xe280b8 [9]
                // 2039: 0xe280b9
                // 203A: 0xe280ba
                // 203B: 0xe280bb ... 203E: 0xe280be [4]
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x90 && _pattern[_currentParticleIndex + 2] <= 0xa7)
                                || (_pattern[_currentParticleIndex + 2] >= 0xb0
                                    && _pattern[_currentParticleIndex + 2] <= 0xbe)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2041: 0xe28181 ... 2043: 0xe28183 [3]
                // 2044: 0xe28184
                // 2045: 0xe28185
                // 2046: 0xe28186
                // 2047: 0xe28187 ... 2051: 0xe28191 [11]
                // 2052: 0xe28192
                // 2053: 0xe28193
                // 2055: 0xe28195 ... 205E: 0xe2819e [10]
                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x81 && _pattern[_currentParticleIndex + 2] <= 0x93)
                                || (_pattern[_currentParticleIndex + 2] >= 0x95
                                    && _pattern[_currentParticleIndex + 2] <= 0x9e)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2190: 0xe28690 ... 2194: 0xe28694 [5]
                // 2195: 0xe28695 ... 2199: 0xe28699 [5]
                // 219A: 0xe2869a ... 219B: 0xe2869b [2]
                // 219C: 0xe2869c ... 219F: 0xe2869f [4]
                // 21A0: 0xe286a0
                // 21A1: 0xe286a1 ... 21A2: 0xe286a2 [2]
                // 21A3: 0xe286a3
                // 21A4: 0xe286a4 ... 21A5: 0xe286a5 [2]
                // 21A6: 0xe286a6
                // 21A7: 0xe286a7 ... 21AD: 0xe286ad [7]
                // 21AE: 0xe286ae
                // 21AF: 0xe286af ... 21CD: 0xe2878d [31]
                if (_pattern[_currentParticleIndex + 1] == 0x86) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x90 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 21CE: 0xe2878e ... 21CF: 0xe2878f [2]
                // 21D0: 0xe28790 ... 21D1: 0xe28791 [2]
                // 21D2: 0xe28792
                // 21D3: 0xe28793
                // 21D4: 0xe28794
                // 21D5: 0xe28795 ... 21F3: 0xe287b3 [31]
                // 21F4: 0xe287b4 ... 22FF: 0xe28bbf [12 + 64 + 64 + 64 + 64 = 268]
                if (_pattern[_currentParticleIndex + 1] == 0x87) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x88) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x89) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x8a) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x8b) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2300: 0xe28c80 ... 2307: 0xe28c87 [8]
                // 2308: 0xe28c88
                // 2309: 0xe28c89
                // 230A: 0xe28c8a
                // 230B: 0xe28c8b
                // 230C: 0xe28c8c ... 231F: 0xe28c9f [20]
                // 2320: 0xe28ca0 ... 2321: 0xe28ca1 [2]
                // 2322: 0xe28ca2 ... 2328: 0xe28ca8 [7]
                // 2329: 0xe28ca9
                // 232A: 0xe28caa
                // 232B: 0xe28cab ... 237B: 0xe28dbb [5 + 16 + 16 + 16 + 16 + 12 = 81]
                if (_pattern[_currentParticleIndex + 1] == 0x8c) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 237C: 0xe28dbc
                // 237D: 0xe28dbd ... 239A: 0xe28e9a [3 + 16 + 11 = 30]
                if (_pattern[_currentParticleIndex + 1] == 0x8d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 239B: 0xe28e9b ... 23B3: 0xe28eb3 [5 + 16 + 4 = 25]
                // 23B4: 0xe28eb4 ... 23DB: 0xe28f9b [12 + 16 + 12 = 40]
                if (_pattern[_currentParticleIndex + 1] == 0x8e) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 23DC: 0xe28f9c ... 23E1: 0xe28fa1 [6]
                // 23E2: 0xe28fa2 ... 2429: 0xe290a9 [14 + 16 + 16 + 16 + 10 = 72]
                if (_pattern[_currentParticleIndex + 1] == 0x8f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 242A: 0xe290aa ... 243F: 0xe290bf [22]
                if (_pattern[_currentParticleIndex + 1] == 0x90) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2440: 0xe29180 ... 244A: 0xe2918a
                // 244B: 0xe2918b ... 245F: 0xe2919f
                if (_pattern[_currentParticleIndex + 1] == 0x91) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x9f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2500: 0xe29480 ... 25B6: 0xe296b6
                if (_pattern[_currentParticleIndex + 1] == 0x94) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x95) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 25B7: 0xe296b7
                // 25B8: 0xe296b8 ... 25C0: 0xe29780
                if (_pattern[_currentParticleIndex + 1] == 0x96) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 25C1: 0xe29781
                // 25C2: 0xe29782 ... 25F7: 0xe297b7
                // 25F8: 0xe297b8 ... 25FF: 0xe297bf
                if (_pattern[_currentParticleIndex + 1] == 0x97) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2600: 0xe29880 ... 266E: 0xe299ae
                if (_pattern[_currentParticleIndex + 1] == 0x98) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 266F: 0xe299af
                // 2670: 0xe299b0 ... 2767: 0xe29da7
                if (_pattern[_currentParticleIndex + 1] == 0x99) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9a) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9b) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9c) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2768: 0xe29da8
                // 2769: 0xe29da9
                // 276A: 0xe29daa
                // 276B: 0xe29dab
                // 276C: 0xe29dac
                // 276D: 0xe29dad
                // 276E: 0xe29dae
                // 276F: 0xe29daf
                // 2770: 0xe29db0
                // 2771: 0xe29db1
                // 2772: 0xe29db2
                // 2773: 0xe29db3
                // 2774: 0xe29db4
                // 2775: 0xe29db5
                if (_pattern[_currentParticleIndex + 1] == 0x9d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xb5)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2794: 0xe29e94 ... 27BF: 0xe29ebf
                if (_pattern[_currentParticleIndex + 1] == 0x9e) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x94 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 27C0: 0xe29f80 ... 27C4: 0xe29f84
                // 27C5: 0xe29f85
                // 27C6: 0xe29f86
                // 27C7: 0xe29f87 ... 27E5: 0xe29fa5
                // 27E6: 0xe29fa6
                // 27E7: 0xe29fa7
                // 27E8: 0xe29fa8
                // 27E9: 0xe29fa9
                // 27EA: 0xe29faa
                // 27EB: 0xe29fab
                // 27EC: 0xe29fac
                // 27ED: 0xe29fad
                // 27EE: 0xe29fae
                // 27EF: 0xe29faf
                // 27F0: 0xe29fb0 ... 27FF: 0xe29fbf
                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2800: 0xe2a080 ... 28FF: 0xe2a3bf
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa2) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2900: 0xe2a480 ... 2982: 0xe2a682
                if (_pattern[_currentParticleIndex + 1] == 0xa4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2983: 0xe2a683
                // 2984: 0xe2a684
                // 2985: 0xe2a685
                // 2986: 0xe2a686
                // 2987: 0xe2a687
                // 2988: 0xe2a688
                // 2989: 0xe2a689
                // 298A: 0xe2a68a
                // 298B: 0xe2a68b
                // 298C: 0xe2a68c
                // 298D: 0xe2a68d
                // 298E: 0xe2a68e
                // 298F: 0xe2a68f
                // 2990: 0xe2a690
                // 2991: 0xe2a691
                // 2992: 0xe2a692
                // 2993: 0xe2a693
                // 2994: 0xe2a694
                // 2995: 0xe2a695
                // 2996: 0xe2a696
                // 2997: 0xe2a697
                // 2998: 0xe2a698
                // 2999: 0xe2a699 ... 29D7: 0xe2a797
                if (_pattern[_currentParticleIndex + 1] == 0xa6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 29D8: 0xe2a798
                // 29D9: 0xe2a799
                // 29DA: 0xe2a79a
                // 29DB: 0xe2a79b
                // 29DC: 0xe2a79c ... 29FB: 0xe2a7bb
                // 29FC: 0xe2a7bc
                // 29FD: 0xe2a7bd
                // 29FE: 0xe2a7be ... 2AFF: 0xe2abbf
                if (_pattern[_currentParticleIndex + 1] == 0xa7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2B00: 0xe2ac80 ... 2B2F: 0xe2acaf
                // 2B30: 0xe2acb0 ... 2B44: 0xe2ad84
                if (_pattern[_currentParticleIndex + 1] == 0xac) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2B45: 0xe2ad85 ... 2B46: 0xe2ad86
                // 2B47: 0xe2ad87 ... 2B4C: 0xe2ad8c
                // 2B4D: 0xe2ad8d ... 2B73: 0xe2adb3
                // 2B74: 0xe2adb4 ... 2B75: 0xe2adb5
                // 2B76: 0xe2adb6 ... 2BFF: 0xe2afbf
                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xae) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2E00: 0xe2b880 ... 2E01: 0xe2b881
                // 2E02: 0xe2b882
                // 2E03: 0xe2b883
                // 2E04: 0xe2b884
                // 2E05: 0xe2b885
                // 2E06: 0xe2b886 ... 2E08: 0xe2b888
                // 2E09: 0xe2b889
                // 2E0A: 0xe2b88a
                // 2E0B: 0xe2b88b
                // 2E0C: 0xe2b88c
                // 2E0D: 0xe2b88d
                // 2E0E: 0xe2b88e ... 2E16: 0xe2b896
                // 2E17: 0xe2b897
                // 2E18: 0xe2b898 ... 2E19: 0xe2b899
                // 2E1A: 0xe2b89a
                // 2E1B: 0xe2b89b
                // 2E1C: 0xe2b89c
                // 2E1D: 0xe2b89d
                // 2E1E: 0xe2b89e ... 2E1F: 0xe2b89f
                // 2E20: 0xe2b8a0
                // 2E21: 0xe2b8a1
                // 2E22: 0xe2b8a2
                // 2E23: 0xe2b8a3
                // 2E24: 0xe2b8a4
                // 2E25: 0xe2b8a5
                // 2E26: 0xe2b8a6
                // 2E27: 0xe2b8a7
                // 2E28: 0xe2b8a8
                // 2E29: 0xe2b8a9
                // 2E2A: 0xe2b8aa ... 2E2E: 0xe2b8ae
                // 2E2F: 0xe2b8af
                // 2E30: 0xe2b8b0 ... 2E39: 0xe2b8b9
                // 2E3A: 0xe2b8ba ... 2E3B: 0xe2b8bb
                // 2E3C: 0xe2b8bc ... 2E3F: 0xe2b8bf
                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2E40: 0xe2b980
                // 2E41: 0xe2b981
                // 2E42: 0xe2b982
                // 2E43: 0xe2b983 ... 2E4F: 0xe2b98f
                // 2E50: 0xe2b990 ... 2E51: 0xe2b991
                // 2E52: 0xe2b992 ... 2E54: 0xe2b994
                // 2E55: 0xe2b995
                // 2E56: 0xe2b996
                // 2E57: 0xe2b997
                // 2E58: 0xe2b998
                // 2E59: 0xe2b999
                // 2E5A: 0xe2b99a
                // 2E5B: 0xe2b99b
                // 2E5C: 0xe2b99c
                // 2E5D: 0xe2b99d
                // 2E5E: 0xe2b99e ... 2E7F: 0xe2b9bf
                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 3001: 0xe38081 ... 3003: 0xe38083
                // 3008: 0xe38088
                // 3009: 0xe38089
                // 300A: 0xe3808a
                // 300B: 0xe3808b
                // 300C: 0xe3808c
                // 300D: 0xe3808d
                // 300E: 0xe3808e
                // 300F: 0xe3808f
                // 3010: 0xe38090
                // 3011: 0xe38091
                // 3012: 0xe38092 ... 3013: 0xe38093
                // 3014: 0xe38094
                // 3015: 0xe38095
                // 3016: 0xe38096
                // 3017: 0xe38097
                // 3018: 0xe38098
                // 3019: 0xe38099
                // 301A: 0xe3809a
                // 301B: 0xe3809b
                // 301C: 0xe3809c
                // 301D: 0xe3809d
                // 301E: 0xe3809e ... 301F: 0xe3809f
                // 3020: 0xe380a0
                // 3030: 0xe380b0
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x81 && _pattern[_currentParticleIndex + 2] <= 0x83)
                                || (_pattern[_currentParticleIndex + 2] >= 0x88
                                    && _pattern[_currentParticleIndex + 2] <= 0xa0)
                                || _pattern[_currentParticleIndex + 2] == 0xb0
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // FD3E: 0xefb4be
                // FD3F: 0xefb4bf
                if (_pattern[_currentParticleIndex + 1] == 0xb4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbe || _pattern[_currentParticleIndex + 2] == 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FE45: 0xefb985 ... FE46: 0xefb986
                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x85 || _pattern[_currentParticleIndex + 2] == 0x86)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyDiacritic(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 005E: 0x5e
        if (_pattern[_currentParticleIndex] == 0x5e) {
            return (true, _currentParticleIndex);
        }

        // 0060: 0x60
        if (_pattern[_currentParticleIndex] == 0x60) {
            return (true, _currentParticleIndex);
        }

        // 00A8: 0xc2a8
        // 00AF: 0xc2af
        // 00B4: 0xc2b4
        // 00B7: 0xc2b7
        // 00B8: 0xc2b8
        if (_pattern[_currentParticleIndex] == 0xc2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    _pattern[_currentParticleIndex + 1] == 0xa8 || _pattern[_currentParticleIndex + 1] == 0xaf
                        || _pattern[_currentParticleIndex + 1] == 0xb4 || _pattern[_currentParticleIndex + 1] == 0xb7
                        || _pattern[_currentParticleIndex + 1] == 0xb8
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 02B0: 0xcab0 ... 02C1: 0xcb81 [18]
        if (_pattern[_currentParticleIndex] == 0xca) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0xb0 && _pattern[_currentParticleIndex + 1] <= 0xbf) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 02C2: 0xcb82 ... 02C5: 0xcb85 [4]
        // 02C6: 0xcb86 ... 02D1: 0xcb91 [12]
        // 02D2: 0xcb92 ... 02DF: 0xcb9f [14]
        // 02E0: 0xcba0 ... 02E4: 0xcba4 [5]
        // 02E5: 0xcba5 ... 02EB: 0xcbab [7]
        // 02EC: 0xcbac [1]
        // 02ED: 0xcbad [1]
        // 02EE: 0xcbae [1]
        // 02EF: 0xcbaf ... 02FF: 0xcbbf [17]
        if (_pattern[_currentParticleIndex] == 0xcb) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0x80 && _pattern[_currentParticleIndex + 1] <= 0xbf) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0300: 0xcc80 ... 034E: 0xcd8e [79]
        if (_pattern[_currentParticleIndex] == 0xcc) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0x80 && _pattern[_currentParticleIndex + 1] <= 0xbf) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0350: 0xcd90 ... 0357: 0xcd97 [8]
        // 035D: 0xcd9d ... 0362: 0xcda2 [6]
        // 0374: 0xcdb4 [1]
        // 0375: 0xcdb5 [1]
        // 037A: 0xcdba [1]
        if (_pattern[_currentParticleIndex] == 0xcd) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    (_pattern[_currentParticleIndex + 1] >= 0x80 && _pattern[_currentParticleIndex + 1] <= 0x8e)
                        || (_pattern[_currentParticleIndex + 1] >= 0x90 && _pattern[_currentParticleIndex + 1] <= 0x97)
                        || (_pattern[_currentParticleIndex + 1] >= 0x9d && _pattern[_currentParticleIndex + 1] <= 0xa2)
                        || _pattern[_currentParticleIndex + 1] == 0xb4 || _pattern[_currentParticleIndex + 1] == 0xb5
                        || _pattern[_currentParticleIndex + 1] == 0xba
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0384: 0xce84 ... 0385: 0xce85 [2]
        if (_pattern[_currentParticleIndex] == 0xce) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x84 || _pattern[_currentParticleIndex + 1] == 0x85) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0483: 0xd283 ... 0487: 0xd287 [5]
        if (_pattern[_currentParticleIndex] == 0xd2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0x83 && _pattern[_currentParticleIndex + 1] <= 0x87) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0559: 0xd599
        if (_pattern[_currentParticleIndex] == 0xd5) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x99) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0591: 0xd691 ... 05BD: 0xd6bd [45]
        // 05BF: 0xd6bf
        if (_pattern[_currentParticleIndex] == 0xd6) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    (_pattern[_currentParticleIndex + 1] >= 0x91 && _pattern[_currentParticleIndex + 1] <= 0xbd)
                        || _pattern[_currentParticleIndex + 1] == 0xbf
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 05C1: 0xd781 ... 05C2: 0xd782 [2]
        // 05C4: 0xd784 ... 05C5: 0xd785 [2]
        // 05C7: 0xd787
        if (_pattern[_currentParticleIndex] == 0xd7) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    _pattern[_currentParticleIndex + 1] == 0x81 || _pattern[_currentParticleIndex + 1] == 0x82
                        || _pattern[_currentParticleIndex + 1] == 0x84 || _pattern[_currentParticleIndex + 1] == 0x85
                        || _pattern[_currentParticleIndex + 1] == 0x87
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 064B: 0xd98b ... 0652: 0xd992 [8]
        // 0657: 0xd997 ... 0658: 0xd998 [2]
        if (_pattern[_currentParticleIndex] == 0xd9) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    (_pattern[_currentParticleIndex + 1] >= 0x8b && _pattern[_currentParticleIndex + 1] <= 0x92)
                        || _pattern[_currentParticleIndex + 1] == 0x97 || _pattern[_currentParticleIndex + 1] == 0x98
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 06DF: 0xdb9f ... 06E0: 0xdba0 [2]
        // 06E5: 0xdba5 ... 06E6: 0xdba6 [2]
        // 06EA: 0xdbaa ... 06EC: 0xdbac [3]
        if (_pattern[_currentParticleIndex] == 0xdb) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    _pattern[_currentParticleIndex + 1] == 0x9f || _pattern[_currentParticleIndex + 1] == 0xa0
                        || _pattern[_currentParticleIndex + 1] == 0xa5 || _pattern[_currentParticleIndex + 1] == 0xa6
                        || (_pattern[_currentParticleIndex + 1] >= 0xaa && _pattern[_currentParticleIndex + 1] <= 0xac)
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0730: 0xdcb0 ... 074A: 0xdd8a [27]
        if (_pattern[_currentParticleIndex] == 0xdc) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0xb0 && _pattern[_currentParticleIndex + 1] <= 0xbf) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xdd) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0x80 && _pattern[_currentParticleIndex + 1] <= 0x8a) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 07A6: 0xdea6 ... 07B0: 0xdeb0 [11]
        if (_pattern[_currentParticleIndex] == 0xde) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0xa6 && _pattern[_currentParticleIndex + 1] <= 0xb0) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 07EB: 0xdfab ... 07F3: 0xdfb3 [9]
        // 07F4: 0xdfb4 ... 07F5: 0xdfb5 [2]
        if (_pattern[_currentParticleIndex] == 0xdf) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0xab && _pattern[_currentParticleIndex + 1] <= 0xb5) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 0818: 0xe0a098 ... 0819: 0xe0a099 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x98 || _pattern[_currentParticleIndex + 2] == 0x99)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0898: 0xe0a298 ... 089F: 0xe0a29f [8]
                if (_pattern[_currentParticleIndex + 1] == 0xa2) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x98 && _pattern[_currentParticleIndex + 2] <= 0x9f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 08C9: 0xe0a389
                // 08CA: 0xe0a38a ... 08D2: 0xe0a392 [9]
                // 08E3: 0xe0a3a3 ... 08FE: 0xe0a3be [28]
                if (_pattern[_currentParticleIndex + 1] == 0xa3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x89 && _pattern[_currentParticleIndex + 2] <= 0x92)
                                || (_pattern[_currentParticleIndex + 2] >= 0xa3
                                    && _pattern[_currentParticleIndex + 2] <= 0xbe)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 093C: 0xe0a4bc
                if (_pattern[_currentParticleIndex + 1] == 0xa4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 094D: 0xe0a58d
                // 0951: 0xe0a591 ... 0954: 0xe0a594 [4]
                // 0971: 0xe0a5b1
                if (_pattern[_currentParticleIndex + 1] == 0xa5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x8d
                                || (_pattern[_currentParticleIndex + 2] >= 0x91
                                    && _pattern[_currentParticleIndex + 2] <= 0x94)
                                || _pattern[_currentParticleIndex + 2] == 0xb1
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 09BC: 0xe0a6bc
                if (_pattern[_currentParticleIndex + 1] == 0xa6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 09CD: 0xe0a78d
                if (_pattern[_currentParticleIndex + 1] == 0xa7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0A3C: 0xe0a8bc
                if (_pattern[_currentParticleIndex + 1] == 0xa8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0A4D: 0xe0a98d
                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0ABC: 0xe0aabc
                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0ACD: 0xe0ab8d
                // 0AFD: 0xe0abbd ... 0AFF: 0xe0abbf [3]
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x8d
                                || (_pattern[_currentParticleIndex + 2] >= 0xbd
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0B3C: 0xe0acbc
                if (_pattern[_currentParticleIndex + 1] == 0xac) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0B4D: 0xe0ad8d
                // 0B55: 0xe0ad95
                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8d || _pattern[_currentParticleIndex + 2] == 0x95)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0BCD: 0xe0af8d
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0C3C: 0xe0b0bc
                if (_pattern[_currentParticleIndex + 1] == 0xb0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0C4D: 0xe0b18d
                if (_pattern[_currentParticleIndex + 1] == 0xb1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0CBC: 0xe0b2bc
                if (_pattern[_currentParticleIndex + 1] == 0xb2) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0CCD: 0xe0b38d
                if (_pattern[_currentParticleIndex + 1] == 0xb3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0D3B: 0xe0b4bb ... 0D3C: 0xe0b4bc [2]
                if (_pattern[_currentParticleIndex + 1] == 0xb4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbb || _pattern[_currentParticleIndex + 2] == 0xbc)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0D4D: 0xe0b58d
                if (_pattern[_currentParticleIndex + 1] == 0xa5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0DCA: 0xe0b78a
                if (_pattern[_currentParticleIndex + 1] == 0xb7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8a) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0E3A: 0xe0b8ba
                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xba) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0E47: 0xe0b987 ... 0E4C: 0xe0b98c [6]
                // 0E4E: 0xe0b98e
                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x87 && _pattern[_currentParticleIndex + 2] <= 0x8c)
                                || _pattern[_currentParticleIndex + 2] == 0x8e
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0EBA: 0xe0baba
                if (_pattern[_currentParticleIndex + 1] == 0xba) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xba) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0EC8: 0xe0bb88 ... 0ECC: 0xe0bb8c [5]
                if (_pattern[_currentParticleIndex + 1] == 0xbb) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x88 && _pattern[_currentParticleIndex + 2] <= 0x8c)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0F18: 0xe0bc98 ... 0F19: 0xe0bc99 [2]
                // 0F35: 0xe0bcb5
                // 0F37: 0xe0bcb7
                // 0F39: 0xe0bcb9
                // 0F3E: 0xe0bcbe ... 0F3F: 0xe0bcbf [2]
                if (_pattern[_currentParticleIndex + 1] == 0xbc) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x98 || _pattern[_currentParticleIndex + 2] == 0x99
                                || _pattern[_currentParticleIndex + 2] == 0xb5
                                || _pattern[_currentParticleIndex + 2] == 0xb7
                                || _pattern[_currentParticleIndex + 2] == 0xb9
                                || _pattern[_currentParticleIndex + 2] == 0xbe
                                || _pattern[_currentParticleIndex + 2] == 0xbf
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0F82: 0xe0be82 ... 0F84: 0xe0be84 [3]
                // 0F86: 0xe0be86 ... 0F87: 0xe0be87 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xbe) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x82 && _pattern[_currentParticleIndex + 2] <= 0x84)
                                || _pattern[_currentParticleIndex + 2] == 0x86
                                || _pattern[_currentParticleIndex + 2] == 0x87
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0FC6: 0xe0bf86
                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x86) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 1037: 0xe180b7
                // 1039: 0xe180b9 ... 103A: 0xe180ba [2]
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xb7 || _pattern[_currentParticleIndex + 2] == 0xb9
                                || _pattern[_currentParticleIndex + 2] == 0xba
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1063: 0xe181a3 ... 1064: 0xe181a4 [2]
                // 1069: 0xe181a9 ... 106D: 0xe181ad [5]
                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xa3 || _pattern[_currentParticleIndex + 2] == 0xa4
                                || (_pattern[_currentParticleIndex + 2] >= 0xa9
                                    && _pattern[_currentParticleIndex + 2] <= 0xad)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1087: 0xe18287 ... 108C: 0xe1828c [6]
                // 108D: 0xe1828d
                // 108F: 0xe1828f
                // 109A: 0xe1829a ... 109B: 0xe1829b [2]
                if (_pattern[_currentParticleIndex + 1] == 0x82) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x87 && _pattern[_currentParticleIndex + 2] <= 0x8d)
                                || _pattern[_currentParticleIndex + 2] == 0x8f
                                || _pattern[_currentParticleIndex + 2] == 0x9a
                                || _pattern[_currentParticleIndex + 2] == 0x9b
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 135D: 0xe18d9d ... 135F: 0xe18d9f [3]
                if (_pattern[_currentParticleIndex + 1] == 0x8d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x9d && _pattern[_currentParticleIndex + 2] <= 0x9f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1714: 0xe19c94
                // 1715: 0xe19c95
                // 1734: 0xe19cb4
                if (_pattern[_currentParticleIndex + 1] == 0x9c) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x94 || _pattern[_currentParticleIndex + 2] == 0x95
                                || _pattern[_currentParticleIndex + 2] == 0xb4
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 17C9: 0xe19f89 ... 17D3: 0xe19f93 [11]
                // 17DD: 0xe19f9d
                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x89 && _pattern[_currentParticleIndex + 2] <= 0x93)
                                || _pattern[_currentParticleIndex + 2] == 0x9d
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1939: 0xe1a4b9 ... 193B: 0xe1a4bb [3]
                if (_pattern[_currentParticleIndex + 1] == 0xa4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb9 && _pattern[_currentParticleIndex + 2] <= 0xbb)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1A60: 0xe1a9a0
                // 1A75: 0xe1a9b5 ... 1A7C: 0xe1a9bc [8]
                // 1A7F: 0xe1a9bf
                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xa0
                                || (_pattern[_currentParticleIndex + 2] >= 0xb5
                                    && _pattern[_currentParticleIndex + 2] <= 0xbc)
                                || _pattern[_currentParticleIndex + 2] == 0xbf
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1AB0: 0xe1aab0 ... 1ABD: 0xe1aabd [14]
                // 1ABE: 0xe1aabe
                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb0 && _pattern[_currentParticleIndex + 2] <= 0xbe)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1AC1: 0xe1ab81 ... 1ACB: 0xe1ab8b [11]
                // 1ACF: 0xe1ab8f ... 1ADD: 0xe1ab9d [15]
                // 1AE0: 0xe1aba0 ... 1AEB: 0xe1abab [12]
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x81 && _pattern[_currentParticleIndex + 2] <= 0x8b)
                                || (_pattern[_currentParticleIndex + 2] >= 0x8f
                                    && _pattern[_currentParticleIndex + 2] <= 0x9d)
                                || (_pattern[_currentParticleIndex + 2] >= 0xa0
                                    && _pattern[_currentParticleIndex + 2] <= 0xab)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1B34: 0xe1acb4
                if (_pattern[_currentParticleIndex + 1] == 0xac) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb4) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1B44: 0xe1ad84
                // 1B6B: 0xe1adab ... 1B73: 0xe1adb3 [9]
                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x84
                                || (_pattern[_currentParticleIndex + 2] == 0xab
                                    && _pattern[_currentParticleIndex + 2] == 0xb3)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1BAA: 0xe1aeaa
                // 1BAB: 0xe1aeab
                if (_pattern[_currentParticleIndex + 1] == 0xae) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xaa || _pattern[_currentParticleIndex + 2] == 0xab)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1BE6: 0xe1afa6
                // 1BF2: 0xe1afb2 ... 1BF3: 0xe1afb3 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xa6 || _pattern[_currentParticleIndex + 2] == 0xb2
                                || _pattern[_currentParticleIndex + 2] == 0xb3
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1C36: 0xe1b0b6 ... 1C37: 0xe1b0b7 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xb0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb6 || _pattern[_currentParticleIndex + 2] == 0xb7)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1C78: 0xe1b1b8 ... 1C7D: 0xe1b1bd [6]
                if (_pattern[_currentParticleIndex + 1] == 0xb1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb8 && _pattern[_currentParticleIndex + 2] <= 0xbd)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1CD0: 0xe1b390 ... 1CD2: 0xe1b392 [3]
                // 1CD3: 0xe1b393
                // 1CD4: 0xe1b394 ... 1CE0: 0xe1b3a0 [13]
                // 1CE1: 0xe1b3a1
                // 1CE2: 0xe1b3a2 ... 1CE8: 0xe1b3a8 [7]
                // 1CED: 0xe1b3ad
                // 1CF4: 0xe1b3b4
                // 1CF7: 0xe1b3b7
                // 1CF8: 0xe1b3b8 ... 1CF9: 0xe1b3b9 [2]
                if (_pattern[_currentParticleIndex + 1] == 0xb3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x90 && _pattern[_currentParticleIndex + 2] <= 0xa8)
                                || _pattern[_currentParticleIndex + 2] == 0xad
                                || _pattern[_currentParticleIndex + 2] == 0xb4
                                || (_pattern[_currentParticleIndex + 2] >= 0xb7
                                    && _pattern[_currentParticleIndex + 2] <= 0xb9)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1D2C: 0xe1b4ac ... 1D6A: 0xe1b5aa [63]
                if (_pattern[_currentParticleIndex + 1] == 0xb4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xac && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xaa)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1D9B: 0xe1b69b ... 1DBE: 0xe1b6be [36]
                if (_pattern[_currentParticleIndex + 1] == 0xb6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x9b && _pattern[_currentParticleIndex + 2] <= 0xbe)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1DC4: 0xe1b784 ... 1DCF: 0xe1b78f [12]
                // 1DF5: 0xe1b7b5 ... 1DFF: 0xe1b7bf [11]
                if (_pattern[_currentParticleIndex + 1] == 0xb7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x84 && _pattern[_currentParticleIndex + 2] <= 0x8f)
                                || (_pattern[_currentParticleIndex + 2] >= 0xb5
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1FBD: 0xe1bebd
                // 1FBF: 0xe1bebf ... 1FC1: 0xe1bf81 [3]
                if (_pattern[_currentParticleIndex + 1] == 0xbe) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbd || _pattern[_currentParticleIndex + 2] == 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1FCD: 0xe1bf8d ... 1FCF: 0xe1bf8f [3]
                // 1FDD: 0xe1bf9d ... 1FDF: 0xe1bf9f [3]
                // 1FED: 0xe1bfad ... 1FEF: 0xe1bfaf [3]
                // 1FFD: 0xe1bfbd ... 1FFE: 0xe1bfbe [2]
                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x8d && _pattern[_currentParticleIndex + 2] <= 0x8f)
                                || (_pattern[_currentParticleIndex + 2] >= 0x9d
                                    && _pattern[_currentParticleIndex + 2] <= 0x9f)
                                || (_pattern[_currentParticleIndex + 2] >= 0xad
                                    && _pattern[_currentParticleIndex + 2] <= 0xaf)
                                || _pattern[_currentParticleIndex + 2] == 0xbd
                                || _pattern[_currentParticleIndex + 2] == 0xbe
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 2CEF: 0xe2b3af ... 2CF1: 0xe2b3b1 [3]
                if (_pattern[_currentParticleIndex + 1] == 0xb3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xaf && _pattern[_currentParticleIndex + 2] <= 0xb1)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2E2F: 0xe2b8af
                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xaf) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 302A: 0xe380aa ... 302D: 0xe380ad [4]
                // 302E: 0xe380ae ... 302F: 0xe380af [2]
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xaa && _pattern[_currentParticleIndex + 2] <= 0xaf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // @BUG: some obscured syntax error resdies here
                // @status: resolved

                // 3099: 0xe38299 ... 309A: 0xe3829a [2]
                // 309B: 0xe3829b ... 309C: 0xe3829c [2]
                if (_pattern[_currentParticleIndex + 1] == 0x82) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x99 && _pattern[_currentParticleIndex + 2] <= 0x9c)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 30FC: 0xe383bc
                if (_pattern[_currentParticleIndex + 1] == 0x83) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xea) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // A66F: 0xea99af
                // A67C: 0xea99bc ... A67D: 0xea99bd [2]
                // A67F: 0xea99bf
                if (_pattern[_currentParticleIndex + 1] == 0x99) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xaf || _pattern[_currentParticleIndex + 2] == 0xbc
                                || _pattern[_currentParticleIndex + 2] == 0xbd
                                || _pattern[_currentParticleIndex + 2] == 0xbf
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A69C: 0xea9a9c ... A69D: 0xea9a9d [2]
                if (_pattern[_currentParticleIndex + 1] == 0x9a) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9c || _pattern[_currentParticleIndex + 2] == 0x9d)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A6F0: 0xea9bb0 ... A6F1: 0xea9bb1
                if (_pattern[_currentParticleIndex + 1] == 0x9b) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb0 || _pattern[_currentParticleIndex + 2] == 0xb1)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A700: 0xea9c80 ... A716: 0xea9c96 [23]
                // A717: 0xea9c97 ... A71F: 0xea9c9f [9]
                // A720: 0xea9ca0 ... A721: 0xea9ca1 [2]
                if (_pattern[_currentParticleIndex + 1] == 0x9c) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x9f)
                                || _pattern[_currentParticleIndex + 2] == 0xa0
                                || _pattern[_currentParticleIndex + 2] == 0xa1
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A788: 0xea9e88
                // A789: 0xea9e89 ... A78A: 0xea9e8a [2]
                if (_pattern[_currentParticleIndex + 1] == 0x9e) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x88 && _pattern[_currentParticleIndex + 2] <= 0x8a)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A7F1: 0xea9fb1
                // A7F8: 0xea9fb8 ... A7F9: 0xea9fb9 [2]
                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xb1 || _pattern[_currentParticleIndex + 2] == 0xb8
                                || _pattern[_currentParticleIndex + 2] == 0xb9
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A806: 0xeaa086
                // A82C: 0xeaa0ac
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x86 || _pattern[_currentParticleIndex + 2] == 0xac)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A8C4: 0xeaa384
                // A8E0: 0xeaa3a0 ... A8F1: 0xeaa3b1 [18]
                if (_pattern[_currentParticleIndex + 1] == 0xa3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x84
                                || (_pattern[_currentParticleIndex + 2] >= 0xa0
                                    && _pattern[_currentParticleIndex + 2] <= 0xb1)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A92B: 0xeaa4ab ... A92D: 0xeaa4ad [3]
                // A92E: 0xeaa4ae
                if (_pattern[_currentParticleIndex + 1] == 0xa4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xab && _pattern[_currentParticleIndex + 2] <= 0xae)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A953: 0xeaa593
                if (_pattern[_currentParticleIndex + 1] == 0xa5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x93) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A9B3: 0xeaa6b3
                if (_pattern[_currentParticleIndex + 1] == 0xa6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb3) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A9C0: 0xeaa780
                // A9E5: 0xeaa7a5
                if (_pattern[_currentParticleIndex + 1] == 0xa7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x80 || _pattern[_currentParticleIndex + 2] == 0xa5)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AA7B: 0xeaa9bb
                // AA7C: 0xeaa9bc
                // AA7D: 0xeaa9bd
                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xbb && _pattern[_currentParticleIndex + 2] <= 0xbd)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AABF: 0xeaaabf
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AAC0: 0xeaab80
                // AAC1: 0xeaab81
                // AAC2: 0xeaab82
                // AAF6: 0xeaabb6
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x82)
                                || _pattern[_currentParticleIndex + 2] == 0xb6
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AB5B: 0xeaad9b
                // AB5C: 0xeaad9c ... AB5F: 0xeaad9f [4]
                // AB69: 0xeaada9
                // AB6A: 0xeaadaa ... AB6B: 0xeaadab [2]
                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x9b && _pattern[_currentParticleIndex + 2] <= 0x9f)
                                || (_pattern[_currentParticleIndex + 2] >= 0xa9
                                    && _pattern[_currentParticleIndex + 2] <= 0xab)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // ABEC: 0xeaafac
                // ABED: 0xeaafad
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xac || _pattern[_currentParticleIndex + 2] == 0xad)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // FB1E: 0xefac9e
                if (_pattern[_currentParticleIndex + 1] == 0xac) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9e) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FE20: 0xefb8a0 ... FE2F: 0xefb8af [16]
                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa0 && _pattern[_currentParticleIndex + 2] <= 0xaf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FF3E: 0xefbcbe
                if (_pattern[_currentParticleIndex + 1] == 0xbc) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbe) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FF40: 0xefbd80
                // FF70: 0xefbdb0
                if (_pattern[_currentParticleIndex + 1] == 0xbd) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x80 || _pattern[_currentParticleIndex + 2] == 0xb0)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FF9E: 0xefbe9e ... FF9F: 0xefbe9f [2]
                if (_pattern[_currentParticleIndex + 1] == 0xbe) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9e || _pattern[_currentParticleIndex + 2] == 0x9f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // FFE3: 0xefbfa3
                if (_pattern[_currentParticleIndex + 1] == 0xbf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa3) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x90) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 102E0: 0xf0908ba0
                        if (_pattern[_currentParticleIndex + 2] == 0x8b) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xa0) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10780: 0xf0909e80 ... 10785: 0xf0909e85 [6]
                        // 10787: 0xf0909e87 ... 107B0: 0xf0909eb0 [42]
                        // 107B2: 0xf0909eb2 ... 107BA: 0xf0909eba [9]
                        if (_pattern[_currentParticleIndex + 2] == 0x9e) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x85)
                                        || (_pattern[_currentParticleIndex + 3] == 0x87
                                            && _pattern[_currentParticleIndex + 3] <= 0xb0)
                                        || (_pattern[_currentParticleIndex + 3] == 0xb2
                                            && _pattern[_currentParticleIndex + 3] <= 0xba)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10A38: 0xf090a8b8 ... 10A3A: 0xf090a8ba [3]
                        // 10A3F: 0xf090a8bf
                        if (_pattern[_currentParticleIndex + 2] == 0xa8) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0xb8
                                            && _pattern[_currentParticleIndex + 3] <= 0xba)
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10AE5: 0xf090aba5 ... 10AE6: 0xf090aba6 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xab) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xa5
                                        || _pattern[_currentParticleIndex + 3] == 0xa6
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10D22: 0xf090b4a2 ... 10D23: 0xf090b4a3 [2]
                        // 10D24: 0xf090b4a4 ... 10D27: 0xf090b4a7 [4]
                        if (_pattern[_currentParticleIndex + 2] == 0xb4) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xa2
                                        && _pattern[_currentParticleIndex + 3] <= 0xa7
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10D4E: 0xf090b58e
                        // 10D69: 0xf090b5a9 ... 10D6D: 0xf090b5ad [5]
                        if (_pattern[_currentParticleIndex + 2] == 0xb5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x8e
                                        || (_pattern[_currentParticleIndex + 3] >= 0xa9
                                            && _pattern[_currentParticleIndex + 3] <= 0xad)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10EFA: 0xf090bbba
                        // 10EFD: 0xf090bbbd ... 10EFF: 0xf090bbbf [3]
                        if (_pattern[_currentParticleIndex + 2] == 0xbb) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xba
                                        || (_pattern[_currentParticleIndex + 3] >= 0xbd
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10F46: 0xf090bd86 ... 10F50: 0xf090bd90 [11]
                        if (_pattern[_currentParticleIndex + 2] == 0xbd) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x86
                                        && _pattern[_currentParticleIndex + 3] <= 0x90
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10F82: 0xf090be82 ... 10F85: 0xf090be85 [4]
                        if (_pattern[_currentParticleIndex + 2] == 0xbe) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x82
                                        && _pattern[_currentParticleIndex + 3] <= 0x85
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x91) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 11046: 0xf0918186
                        // 11070: 0xf09181b0
                        if (_pattern[_currentParticleIndex + 2] == 0x81) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x86
                                        || _pattern[_currentParticleIndex + 3] == 0xb0
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 110B9: 0xf09182b9 ... 110BA: 0xf09182ba [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x82) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb9
                                        || _pattern[_currentParticleIndex + 3] == 0xba
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11133: 0xf09184b3 ... 11134: 0xf09184b4 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x84) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb3
                                        || _pattern[_currentParticleIndex + 3] == 0xb4
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11173: 0xf09185b3
                        if (_pattern[_currentParticleIndex + 2] == 0x85) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xb3) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 111C0: 0xf0918780
                        // 111CA: 0xf091878a ... 111CC: 0xf091878c [3]
                        if (_pattern[_currentParticleIndex + 2] == 0x87) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x80
                                        || (_pattern[_currentParticleIndex + 3] >= 0x8a
                                            && _pattern[_currentParticleIndex + 3] <= 0x8c)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11235: 0xf09188b5
                        // 11236: 0xf09188b6
                        if (_pattern[_currentParticleIndex + 2] == 0x88) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb5
                                        || _pattern[_currentParticleIndex + 3] == 0xb6
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 112E9: 0xf0918ba9 ... 112EA: 0xf0918baa [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x8b) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xa9
                                        || _pattern[_currentParticleIndex + 3] == 0xaa
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1133B: 0xf0918cbb ... 1133C: 0xf0918cbc [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x8c) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbb
                                        || _pattern[_currentParticleIndex + 3] == 0xbc
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1134D: 0xf0918d8d
                        // 11366: 0xf0918da6 ... 1136C: 0xf0918dac [7]
                        // 11370: 0xf0918db0 ... 11374: 0xf0918db4 [5]
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x8d
                                        || (_pattern[_currentParticleIndex + 3] >= 0xa6
                                            && _pattern[_currentParticleIndex + 3] <= 0xac)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xb4)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 113CE: 0xf0918f8e
                        // 113CF: 0xf0918f8f
                        // 113D0: 0xf0918f90
                        // 113D2: 0xf0918f92
                        // 113D3: 0xf0918f93
                        // 113E1: 0xf0918fa1 ... 113E2: 0xf0918fa2 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x8f) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x8e
                                            && _pattern[_currentParticleIndex + 3] <= 0x90)
                                        || _pattern[_currentParticleIndex + 3] == 0x92
                                        || _pattern[_currentParticleIndex + 3] == 0x93
                                        || _pattern[_currentParticleIndex + 3] == 0xa1
                                        || _pattern[_currentParticleIndex + 3] == 0xa2
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11442: 0xf0919182
                        // 11446: 0xf0919186
                        if (_pattern[_currentParticleIndex + 2] == 0x91) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x82
                                        || _pattern[_currentParticleIndex + 3] == 0x86
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 114C2: 0xf0919382 ... 114C3: 0xf0919383 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x93) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x82
                                        || _pattern[_currentParticleIndex + 3] == 0x83
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 115BF: 0xf09196bf ... 115C0: 0xf0919780 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x96) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xbf) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x80) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1163F: 0xf09198bf
                        if (_pattern[_currentParticleIndex + 2] == 0x98) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xbf) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 116B6: 0xf0919ab6
                        // 116B7: 0xf0919ab7
                        if (_pattern[_currentParticleIndex + 2] == 0x9a) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb6
                                        || _pattern[_currentParticleIndex + 3] == 0xb7
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1172B: 0xf0919cab
                        if (_pattern[_currentParticleIndex + 2] == 0x9c) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xab) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11839: 0xf091a0b9 ... 1183A: 0xf091a0ba [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xa0) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb9
                                        || _pattern[_currentParticleIndex + 3] == 0xba
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1193D: 0xf091a4bd
                        // 1193E: 0xf091a4be
                        if (_pattern[_currentParticleIndex + 2] == 0xa4) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbd
                                        || _pattern[_currentParticleIndex + 3] == 0xbe
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11943: 0xf091a583
                        if (_pattern[_currentParticleIndex + 2] == 0xa5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x83) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 119E0: 0xf091a7a0
                        if (_pattern[_currentParticleIndex + 2] == 0xa7) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xa0) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11A34: 0xf091a8b4
                        if (_pattern[_currentParticleIndex + 2] == 0xa8) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xb4) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11A47: 0xf091a987
                        if (_pattern[_currentParticleIndex + 2] == 0xa9) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x87) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11A99: 0xf091aa99
                        if (_pattern[_currentParticleIndex + 2] == 0xaa) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x99) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11C3F: 0xf091b0bf
                        if (_pattern[_currentParticleIndex + 2] == 0xb0) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xbf) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11D42: 0xf091b582
                        // 11D44: 0xf091b584 ... 11D45: 0xf091b585 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xb5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x82
                                        || _pattern[_currentParticleIndex + 3] == 0x84
                                        || _pattern[_currentParticleIndex + 3] == 0x85
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11D97: 0xf091b697
                        if (_pattern[_currentParticleIndex + 2] == 0xb6) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x97) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11DD9: 0xf091b799
                        if (_pattern[_currentParticleIndex + 2] == 0xb7) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x99) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11F41: 0xf091bd81
                        // 11F42: 0xf091bd82
                        // 11F5A: 0xf091bd9a
                        if (_pattern[_currentParticleIndex + 2] == 0xbd) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x81
                                        || _pattern[_currentParticleIndex + 3] == 0x82
                                        || _pattern[_currentParticleIndex + 3] == 0x9a
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x93) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 13447: 0xf0939187 ... 13455: 0xf0939195 [15]
                        if (_pattern[_currentParticleIndex + 2] == 0x91) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x87
                                        && _pattern[_currentParticleIndex + 3] <= 0x95
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x96) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1612F: 0xf09684af
                        if (_pattern[_currentParticleIndex + 2] == 0x84) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xaf) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16AF0: 0xf096abb0 ... 16AF4: 0xf096abb4 [5]
                        if (_pattern[_currentParticleIndex + 2] == 0xab) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb0
                                        && _pattern[_currentParticleIndex + 3] <= 0xb4
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16B30: 0xf096acb0 ... 16B36: 0xf096acb6 [7]
                        if (_pattern[_currentParticleIndex + 2] == 0xac) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb0
                                        && _pattern[_currentParticleIndex + 3] <= 0xb6
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16D6B: 0xf096b5ab ... 16D6C: 0xf096b5ac [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xb5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xab
                                        || _pattern[_currentParticleIndex + 3] == 0xac
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16F8F: 0xf096be8f ... 16F92: 0xf096be92 [4]
                        // 16F93: 0xf096be93 ... 16F9F: 0xf096be9f [13]
                        if (_pattern[_currentParticleIndex + 2] == 0xbe) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x8f
                                        && _pattern[_currentParticleIndex + 3] <= 0x9f
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16FF0: 0xf096bfb0 ... 16FF1: 0xf096bfb1 [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb0
                                        || _pattern[_currentParticleIndex + 3] == 0xb1
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9a) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1AFF0: 0xf09abfb0 ... 1AFF3: 0xf09abfb3 [4]
                        // 1AFF5: 0xf09abfb5 ... 1AFFB: 0xf09abfbb [7]
                        // 1AFFD: 0xf09abfbd ... 1AFFE: 0xf09abfbe [2]
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xb3)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb5
                                            && _pattern[_currentParticleIndex + 3] <= 0xbb)
                                        || _pattern[_currentParticleIndex + 3] == 0xbd
                                        || _pattern[_currentParticleIndex + 3] == 0xbe
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9c) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1CF00: 0xf09cbc80 ... 1CF2D: 0xf09cbcad [46]
                        // 1CF30: 0xf09cbcb0 ... 1CF46: 0xf09cbd86 [23]
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0xad)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xbd) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0x86
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1D167: 0xf09d85a7 ... 1D169: 0xf09d85a9 [3]
                        // 1D16D: 0xf09d85ad ... 1D172: 0xf09d85b2 [6]
                        // 1D17B: 0xf09d85bb ... 1D182: 0xf09d8682 [8]
                        if (_pattern[_currentParticleIndex + 2] == 0x85) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0xa7
                                            && _pattern[_currentParticleIndex + 3] <= 0xa9)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xad
                                            && _pattern[_currentParticleIndex + 3] <= 0xb2)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xbb
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1D185: 0xf09d8685 ... 1D18B: 0xf09d868b [7]
                        // 1D1AA: 0xf09d86aa ... 1D1AD: 0xf09d86ad [4]
                        if (_pattern[_currentParticleIndex + 2] == 0x86) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x85
                                            && _pattern[_currentParticleIndex + 3] <= 0x8b)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xaa
                                            && _pattern[_currentParticleIndex + 3] <= 0xad)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9e) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1E030: 0xf09e80b0 ... 1E06D: 0xf09e81ad [62]
                        if (_pattern[_currentParticleIndex + 2] == 0x80) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb0
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x81) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xad
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1E130: 0xf09e84b0 ... 1E136: 0xf09e84b6 [7]
                        if (_pattern[_currentParticleIndex + 2] == 0x84) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb0
                                        && _pattern[_currentParticleIndex + 3] <= 0xb6
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1E2AE: 0xf09e8aae
                        if (_pattern[_currentParticleIndex + 2] == 0x8a) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xae) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1E2EC: 0xf09e8bac ... 1E2EF: 0xf09e8baf [4]
                        if (_pattern[_currentParticleIndex + 2] == 0x8b) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xac
                                        && _pattern[_currentParticleIndex + 3] <= 0xaf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1E5EE: 0xf09e97ae ... 1E5EF: 0xf09e97af [2]
                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xae
                                        || _pattern[_currentParticleIndex + 3] == 0xaf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1E8D0: 0xf09ea390 ... 1E8D6: 0xf09ea396
                        if (_pattern[_currentParticleIndex + 2] == 0xa3) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x90
                                        && _pattern[_currentParticleIndex + 3] <= 0x96
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1E944: 0xf09ea584 ... 1E946: 0xf09ea586 [3]
                        // 1E948: 0xf09ea588 ... 1E94A: 0xf09ea58a [3]
                        if (_pattern[_currentParticleIndex + 2] == 0xa5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x84
                                            && _pattern[_currentParticleIndex + 3] <= 0x86)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x88
                                            && _pattern[_currentParticleIndex + 3] <= 0x8a)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyOtherAlphabetic(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0345: 0xcd85
        // 0363: 0xcda3 ... 036F: 0xcdaf
        if (_pattern[_currentParticleIndex] == 0xcd) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    _pattern[_currentParticleIndex + 1] == 0x85
                        || (_pattern[_currentParticleIndex + 1] >= 0xa3 && _pattern[_currentParticleIndex + 1] <= 0xaf)
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 05B0: 0xd6b0 ... 05BD: 0xd6bd
        // 05BF: 0xd6bf
        if (_pattern[_currentParticleIndex] == 0xd6) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    (_pattern[_currentParticleIndex + 1] >= 0xb0 && _pattern[_currentParticleIndex + 1] <= 0xbd)
                        || _pattern[_currentParticleIndex + 1] == 0xbf
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 05C1: 0xd781 ... 05C2: 0xd782
        // 05C4: 0xd784 ... 05C5: 0xd785
        // 05C7: 0xd787
        if (_pattern[_currentParticleIndex] == 0xd7) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    _pattern[_currentParticleIndex + 1] == 0x81 || _pattern[_currentParticleIndex + 1] == 0x82
                        || _pattern[_currentParticleIndex + 1] == 0x84 || _pattern[_currentParticleIndex + 1] == 0x85
                        || _pattern[_currentParticleIndex + 1] == 0x87
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0610: 0xd890 ... 061A: 0xd89a
        if (_pattern[_currentParticleIndex] == 0xd8) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0x90 && _pattern[_currentParticleIndex + 1] <= 0x9a) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 064B: 0xd98b ... 0657: 0xd997
        // 0659: 0xd999 ... 065F: 0xd99f
        // 0670: 0xd9b0
        if (_pattern[_currentParticleIndex] == 0xd9) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    (_pattern[_currentParticleIndex + 1] >= 0x8b && _pattern[_currentParticleIndex + 1] <= 0x97)
                        || (_pattern[_currentParticleIndex + 1] >= 0x99 && _pattern[_currentParticleIndex + 1] <= 0x9f)
                        || _pattern[_currentParticleIndex + 1] == 0xb0
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 06D6: 0xdb96 ... 06DC: 0xdb9c
        // 06E1: 0xdba1 ... 06E4: 0xdba4
        // 06E7: 0xdba7 ... 06E8: 0xdba8
        // 06ED: 0xdbad
        if (_pattern[_currentParticleIndex] == 0xdb) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    _pattern[_currentParticleIndex + 1] == 0x96 || _pattern[_currentParticleIndex + 1] == 0x9c
                        || _pattern[_currentParticleIndex + 1] == 0xa1 || _pattern[_currentParticleIndex + 1] == 0xa4
                        || _pattern[_currentParticleIndex + 1] == 0xa7 || _pattern[_currentParticleIndex + 1] == 0xa8
                        || _pattern[_currentParticleIndex + 1] == 0xad
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0711: 0xdc91
        // 0730: 0xdcb0 ... 073F: 0xdcbf
        if (_pattern[_currentParticleIndex] == 0xdc) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    _pattern[_currentParticleIndex + 1] == 0x91 || _pattern[_currentParticleIndex + 1] == 0xb0
                        || _pattern[_currentParticleIndex + 1] == 0xbf
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 07A6: 0xdea6 ... 07B0: 0xdeb0
        if (_pattern[_currentParticleIndex] == 0xde) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xa6 || _pattern[_currentParticleIndex + 1] == 0xb0) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0816: 0xe0a096 ... 0817: 0xe0a097
        // 081B: 0xe0a09b ... 0823: 0xe0a0a3
        // 0825: 0xe0a0a5 ... 0827: 0xe0a0a7
        // 0829: 0xe0a0a9 ... 082C: 0xe0a0ac
        if (_pattern[_currentParticleIndex] == 0xe0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x96 || _pattern[_currentParticleIndex + 2] == 0x97
                                || (_pattern[_currentParticleIndex + 2] >= 0x9b
                                    && _pattern[_currentParticleIndex + 2] <= 0xa3)
                                || (_pattern[_currentParticleIndex + 2] >= 0xa5
                                    && _pattern[_currentParticleIndex + 2] <= 0xa7)
                                || (_pattern[_currentParticleIndex + 2] >= 0xa9
                                    && _pattern[_currentParticleIndex + 2] <= 0xac)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0897: 0xe0a297
                if (_pattern[_currentParticleIndex + 1] == 0xa2) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 08D4: 0xe0a394 ... 08DF: 0xe0a39f
                // 08E3: 0xe0a3a3 ... 08E9: 0xe0a3a9
                // 08F0: 0xe0a3b0 ... 0902: 0xe0a482
                if (_pattern[_currentParticleIndex + 1] == 0xa3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x94 && _pattern[_currentParticleIndex + 2] <= 0x9f)
                                || (_pattern[_currentParticleIndex + 2] >= 0xa3
                                    && _pattern[_currentParticleIndex + 2] <= 0xa9)
                                || (_pattern[_currentParticleIndex + 2] >= 0xb0
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0903: 0xe0a483
                // 093A: 0xe0a4ba
                // 093B: 0xe0a4bb
                // 093E: 0xe0a4be ... 0940: 0xe0a580
                if (_pattern[_currentParticleIndex + 1] == 0xa4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x83
                                || (_pattern[_currentParticleIndex + 2] >= 0x80
                                    && _pattern[_currentParticleIndex + 2] <= 0x82)
                                || _pattern[_currentParticleIndex + 2] == 0xba
                                || _pattern[_currentParticleIndex + 2] == 0xbb
                                || (_pattern[_currentParticleIndex + 2] >= 0xbe
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0941: 0xe0a581 ... 0948: 0xe0a588
                // 0949: 0xe0a589 ... 094C: 0xe0a58c
                // 094E: 0xe0a58e ... 094F: 0xe0a58f
                // 0955: 0xe0a595 ... 0957: 0xe0a597
                // 0962: 0xe0a5a2 ... 0963: 0xe0a5a3
                if (_pattern[_currentParticleIndex + 1] == 0xa5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80
                                || (_pattern[_currentParticleIndex + 2] >= 0x81
                                    && _pattern[_currentParticleIndex + 2] <= 0x88)
                                || (_pattern[_currentParticleIndex + 2] >= 0x89
                                    && _pattern[_currentParticleIndex + 2] <= 0x8c)
                                || _pattern[_currentParticleIndex + 2] == 0x8e
                                || _pattern[_currentParticleIndex + 2] == 0x8f
                                || (_pattern[_currentParticleIndex + 2] >= 0x95
                                    && _pattern[_currentParticleIndex + 2] <= 0x97)
                                || _pattern[_currentParticleIndex + 2] == 0xa2
                                || _pattern[_currentParticleIndex + 2] == 0xa3
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0981: 0xe0a681
                // 0982: 0xe0a682 ... 0983: 0xe0a683
                // 09BE: 0xe0a6be ... 09C0: 0xe0a780
                if (_pattern[_currentParticleIndex + 1] == 0xa6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x81 || _pattern[_currentParticleIndex + 2] == 0x82
                                || _pattern[_currentParticleIndex + 2] == 0x83
                                || _pattern[_currentParticleIndex + 2] == 0xbe
                                || _pattern[_currentParticleIndex + 2] == 0xbf
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 09C1: 0xe0a781 ... 09C4: 0xe0a784
                // 09C7: 0xe0a787 ... 09C8: 0xe0a788
                // 09CB: 0xe0a78b ... 09CC: 0xe0a78c
                // 09D7: 0xe0a797
                // 09E2: 0xe0a7a2 ... 09E3: 0xe0a7a3
                if (_pattern[_currentParticleIndex + 1] == 0xa7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80
                                || (_pattern[_currentParticleIndex + 2] >= 0x81
                                    && _pattern[_currentParticleIndex + 2] <= 0x84)
                                || _pattern[_currentParticleIndex + 2] == 0x87
                                || _pattern[_currentParticleIndex + 2] == 0x88
                                || _pattern[_currentParticleIndex + 2] == 0x8b
                                || _pattern[_currentParticleIndex + 2] == 0x8c
                                || _pattern[_currentParticleIndex + 2] == 0x97
                                || _pattern[_currentParticleIndex + 2] == 0xa2
                                || _pattern[_currentParticleIndex + 2] == 0xa3
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0A01: 0xe0a881 ... 0A02: 0xe0a882
                // 0A03: 0xe0a883
                // 0A3E: 0xe0a8be ... 0A40: 0xe0a980
                if (_pattern[_currentParticleIndex + 1] == 0xa8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x81 || _pattern[_currentParticleIndex + 2] == 0x82
                                || _pattern[_currentParticleIndex + 2] == 0x83
                                || _pattern[_currentParticleIndex + 2] == 0xbe
                                || _pattern[_currentParticleIndex + 2] == 0xbf
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0A41: 0xe0a981 ... 0A42: 0xe0a982
                // 0A47: 0xe0a987 ... 0A48: 0xe0a988
                // 0A4B: 0xe0a98b ... 0A4C: 0xe0a98c
                // 0A51: 0xe0a991
                // 0A70: 0xe0a9b0 ... 0A71: 0xe0a9b1
                // 0A75: 0xe0a9b5
                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80 || _pattern[_currentParticleIndex + 2] == 0x81
                                || _pattern[_currentParticleIndex + 2] == 0x82
                                || _pattern[_currentParticleIndex + 2] == 0x87
                                || _pattern[_currentParticleIndex + 2] == 0x88
                                || _pattern[_currentParticleIndex + 2] == 0x8b
                                || _pattern[_currentParticleIndex + 2] == 0x8c
                                || _pattern[_currentParticleIndex + 2] == 0x91
                                || _pattern[_currentParticleIndex + 2] == 0xb0
                                || _pattern[_currentParticleIndex + 2] == 0xb1
                                || _pattern[_currentParticleIndex + 2] == 0xb5
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0A81: 0xe0aa81 ... 0A82: 0xe0aa82
                // 0A83: 0xe0aa83
                // 0ABE: 0xe0aabe ... 0AC0: 0xe0ab80
                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x81 || _pattern[_currentParticleIndex + 2] == 0x82
                                || _pattern[_currentParticleIndex + 2] == 0x83
                                || _pattern[_currentParticleIndex + 2] == 0xbe
                                || _pattern[_currentParticleIndex + 2] == 0xbf
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0AC1: 0xe0ab81 ... 0AC5: 0xe0ab85
                // 0AC7: 0xe0ab87 ... 0AC8: 0xe0ab88
                // 0AC9: 0xe0ab89
                // 0ACB: 0xe0ab8b ... 0ACC: 0xe0ab8c
                // 0AE2: 0xe0aba2 ... 0AE3: 0xe0aba3
                // 0AFA: 0xe0abba ... 0AFC: 0xe0abbc
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80
                                || (_pattern[_currentParticleIndex + 2] >= 0x81
                                    && _pattern[_currentParticleIndex + 2] <= 0x85)
                                || _pattern[_currentParticleIndex + 2] == 0x87
                                || _pattern[_currentParticleIndex + 2] == 0x88
                                || _pattern[_currentParticleIndex + 2] == 0x89
                                || _pattern[_currentParticleIndex + 2] == 0x8b
                                || _pattern[_currentParticleIndex + 2] == 0x8c
                                || _pattern[_currentParticleIndex + 2] == 0xa2
                                || _pattern[_currentParticleIndex + 2] == 0xa3
                                || _pattern[_currentParticleIndex + 2] == 0xba
                                || _pattern[_currentParticleIndex + 2] == 0xbc
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0B01: 0xe0ac81
                // 0B02: 0xe0ac82 ... 0B03: 0xe0ac83
                // 0B3E: 0xe0acbe
                // 0B3F: 0xe0acbf
                if (_pattern[_currentParticleIndex + 1] == 0xac) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x81 || _pattern[_currentParticleIndex + 2] == 0x82
                                || _pattern[_currentParticleIndex + 2] == 0x83
                                || _pattern[_currentParticleIndex + 2] == 0xbe
                                || _pattern[_currentParticleIndex + 2] == 0xbf
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0B40: 0xe0ad80
                // 0B41: 0xe0ad81 ... 0B44: 0xe0ad84
                // 0B47: 0xe0ad87 ... 0B48: 0xe0ad88
                // 0B4B: 0xe0ad8b ... 0B4C: 0xe0ad8c
                // 0B56: 0xe0ad96
                // 0B57: 0xe0ad97
                // 0B62: 0xe0ada2 ... 0B63: 0xe0ada3
                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80
                                || (_pattern[_currentParticleIndex + 2] >= 0x81
                                    && _pattern[_currentParticleIndex + 2] <= 0x84)
                                || _pattern[_currentParticleIndex + 2] == 0x87
                                || _pattern[_currentParticleIndex + 2] == 0x88
                                || _pattern[_currentParticleIndex + 2] == 0x8b
                                || _pattern[_currentParticleIndex + 2] == 0x8c
                                || _pattern[_currentParticleIndex + 2] == 0x96
                                || _pattern[_currentParticleIndex + 2] == 0x97
                                || _pattern[_currentParticleIndex + 2] == 0xa2
                                || _pattern[_currentParticleIndex + 2] == 0xa3
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0B82: 0xe0ae82
                // 0BBE: 0xe0aebe ... 0BBF: 0xe0aebf
                if (_pattern[_currentParticleIndex + 1] == 0xae) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x82 || _pattern[_currentParticleIndex + 2] == 0xbe
                                || _pattern[_currentParticleIndex + 2] == 0xbf
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0BC0: 0xe0af80
                // 0BC1: 0xe0af81 ... 0BC2: 0xe0af82
                // 0BC6: 0xe0af86 ... 0BC8: 0xe0af88
                // 0BCA: 0xe0af8a ... 0BCC: 0xe0af8c <- yeah
                // 0BD7: 0xe0af97
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80 || _pattern[_currentParticleIndex + 2] == 0x81
                                || _pattern[_currentParticleIndex + 2] == 0x82
                                || (_pattern[_currentParticleIndex + 2] >= 0x86
                                    && _pattern[_currentParticleIndex + 2] <= 0x88)
                                || (_pattern[_currentParticleIndex + 2] >= 0x8a
                                    && _pattern[_currentParticleIndex + 2] <= 0x8c)
                                || _pattern[_currentParticleIndex + 2] == 0x97
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0C00: 0xe0b080
                // 0C01: 0xe0b081 ... 0C03: 0xe0b083
                // 0C04: 0xe0b084
                // 0C3E: 0xe0b0be ... 0C40: 0xe0b180
                if (_pattern[_currentParticleIndex + 1] == 0xb0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80
                                || (_pattern[_currentParticleIndex + 2] >= 0x81
                                    && _pattern[_currentParticleIndex + 2] <= 0x83)
                                || _pattern[_currentParticleIndex + 2] == 0x84
                                || _pattern[_currentParticleIndex + 2] == 0xbe
                                || _pattern[_currentParticleIndex + 2] == 0xbf
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0C41: 0xe0b181 ... 0C44: 0xe0b184
                // 0C46: 0xe0b186 ... 0C48: 0xe0b188
                // 0C4A: 0xe0b18a ... 0C4C: 0xe0b18c
                // 0C55: 0xe0b195 ... 0C56: 0xe0b196
                // 0C62: 0xe0b1a2 ... 0C63: 0xe0b1a3
                if (_pattern[_currentParticleIndex + 1] == 0xb1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80
                                || (_pattern[_currentParticleIndex + 2] >= 0x81
                                    && _pattern[_currentParticleIndex + 2] <= 0x84)
                                || (_pattern[_currentParticleIndex + 2] >= 0x86
                                    && _pattern[_currentParticleIndex + 2] <= 0x88)
                                || (_pattern[_currentParticleIndex + 2] >= 0x8a
                                    && _pattern[_currentParticleIndex + 2] <= 0x8c)
                                || _pattern[_currentParticleIndex + 2] == 0x95
                                || _pattern[_currentParticleIndex + 2] == 0x96
                                || _pattern[_currentParticleIndex + 2] == 0xa2
                                || _pattern[_currentParticleIndex + 2] == 0xa3
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0C81: 0xe0b281
                // 0C82: 0xe0b282 ... 0C83: 0xe0b283
                // 0CBE: 0xe0b2be
                // 0CBF: 0xe0b2bf
                if (_pattern[_currentParticleIndex + 1] == 0xb2) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x81 || _pattern[_currentParticleIndex + 2] == 0x82
                                || _pattern[_currentParticleIndex + 2] == 0x83
                                || _pattern[_currentParticleIndex + 2] == 0xbe
                                || _pattern[_currentParticleIndex + 2] == 0xbf
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0CC0: 0xe0b380 ... 0CC4: 0xe0b384
                // 0CC6: 0xe0b386
                // 0CC7: 0xe0b387 ... 0CC8: 0xe0b388
                // 0CCA: 0xe0b38a ... 0CCB: 0xe0b38b
                // 0CCC: 0xe0b38c
                // 0CD5: 0xe0b395 ... 0CD6: 0xe0b396
                // 0CE2: 0xe0b3a2 ... 0CE3: 0xe0b3a3
                // 0CF3: 0xe0b3b3
                if (_pattern[_currentParticleIndex + 1] == 0xb3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x84)
                                || _pattern[_currentParticleIndex + 2] == 0x86
                                || _pattern[_currentParticleIndex + 2] == 0x87
                                || _pattern[_currentParticleIndex + 2] == 0x88
                                || _pattern[_currentParticleIndex + 2] == 0x8a
                                || _pattern[_currentParticleIndex + 2] == 0x8b
                                || _pattern[_currentParticleIndex + 2] == 0x8c
                                || _pattern[_currentParticleIndex + 2] == 0x95
                                || _pattern[_currentParticleIndex + 2] == 0x96
                                || _pattern[_currentParticleIndex + 2] == 0xa2
                                || _pattern[_currentParticleIndex + 2] == 0xa3
                                || _pattern[_currentParticleIndex + 2] == 0xb3
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0D00: 0xe0b480 ... 0D01: 0xe0b481
                // 0D02: 0xe0b482 ... 0D03: 0xe0b483
                // 0D3E: 0xe0b4be ... 0D40: 0xe0b580
                if (_pattern[_currentParticleIndex + 1] == 0xb4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80 || _pattern[_currentParticleIndex + 2] == 0x81
                                || _pattern[_currentParticleIndex + 2] == 0x82
                                || _pattern[_currentParticleIndex + 2] == 0x83
                                || _pattern[_currentParticleIndex + 2] == 0xbe
                                || _pattern[_currentParticleIndex + 2] == 0xbf
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0D41: 0xe0b581 ... 0D44: 0xe0b584
                // 0D46: 0xe0b586 ... 0D48: 0xe0b588
                // 0D4A: 0xe0b58a ... 0D4C: 0xe0b58c
                // 0D57: 0xe0b597
                // 0D62: 0xe0b5a2 ... 0D63: 0xe0b5a3
                if (_pattern[_currentParticleIndex + 1] == 0xb5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80
                                || (_pattern[_currentParticleIndex + 2] >= 0x81
                                    && _pattern[_currentParticleIndex + 2] <= 0x84)
                                || (_pattern[_currentParticleIndex + 2] >= 0x86
                                    && _pattern[_currentParticleIndex + 2] <= 0x88)
                                || (_pattern[_currentParticleIndex + 2] >= 0x8a
                                    && _pattern[_currentParticleIndex + 2] <= 0x8c)
                                || _pattern[_currentParticleIndex + 2] == 0x97
                                || _pattern[_currentParticleIndex + 2] == 0xa2
                                || _pattern[_currentParticleIndex + 2] == 0xa3
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0D81: 0xe0b681
                // 0D82: 0xe0b682 ... 0D83: 0xe0b683
                if (_pattern[_currentParticleIndex + 1] == 0xb6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x81 || _pattern[_currentParticleIndex + 2] == 0x82
                                || _pattern[_currentParticleIndex + 2] == 0x83
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0DCF: 0xe0b78f ... 0DD1: 0xe0b791
                // 0DD2: 0xe0b792 ... 0DD4: 0xe0b794
                // 0DD6: 0xe0b796
                // 0DD8: 0xe0b798 ... 0DDF: 0xe0b79f
                // 0DF2: 0xe0b7b2 ... 0DF3: 0xe0b7b3
                if (_pattern[_currentParticleIndex + 1] == 0xb7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x8f && _pattern[_currentParticleIndex + 2] <= 0x91)
                                || (_pattern[_currentParticleIndex + 2] >= 0x92
                                    && _pattern[_currentParticleIndex + 2] <= 0x94)
                                || _pattern[_currentParticleIndex + 2] == 0x96
                                || (_pattern[_currentParticleIndex + 2] >= 0x98
                                    && _pattern[_currentParticleIndex + 2] <= 0x9f)
                                || _pattern[_currentParticleIndex + 2] == 0xb2
                                || _pattern[_currentParticleIndex + 2] == 0xb3
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0E31: 0xe0b8b1
                // 0E34: 0xe0b8b4 ... 0E3A: 0xe0b8ba
                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xb1
                                || (_pattern[_currentParticleIndex + 2] >= 0xb4
                                    && _pattern[_currentParticleIndex + 2] <= 0xba)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0E4D: 0xe0b98d
                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0EB1: 0xe0bab1
                // 0EB4: 0xe0bab4 ... 0EB9: 0xe0bab9
                // 0EBB: 0xe0babb ... 0EBC: 0xe0babc
                if (_pattern[_currentParticleIndex + 1] == 0xba) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xb1
                                || (_pattern[_currentParticleIndex + 2] >= 0xb4
                                    && _pattern[_currentParticleIndex + 2] <= 0xb9)
                                || _pattern[_currentParticleIndex + 2] == 0xbb
                                || _pattern[_currentParticleIndex + 2] == 0xbc
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0ECD: 0xe0bb8d
                if (_pattern[_currentParticleIndex + 1] == 0xbb) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0F71: 0xe0bdb1 ... 0F7E: 0xe0bdbe
                // 0F7F: 0xe0bdbf
                if (_pattern[_currentParticleIndex + 1] == 0xbd) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb1 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 0F80: 0xe0be80 ... 0F83: 0xe0be83
                // 0F8D: 0xe0be8d ... 0F97: 0xe0be97
                // 0F99: 0xe0be99 ... 0FBC: 0xe0bebc
                if (_pattern[_currentParticleIndex + 1] == 0xbe) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x83)
                                || (_pattern[_currentParticleIndex + 2] >= 0x8d
                                    && _pattern[_currentParticleIndex + 2] <= 0x97)
                                || (_pattern[_currentParticleIndex + 2] >= 0x99
                                    && _pattern[_currentParticleIndex + 2] <= 0xbc)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 102B: 0xe180ab ... 102C: 0xe180ac
                // 102D: 0xe180ad ... 1030: 0xe180b0
                // 1031: 0xe180b1
                // 1032: 0xe180b2 ... 1036: 0xe180b6
                // 1038: 0xe180b8
                // 103B: 0xe180bb ... 103C: 0xe180bc
                // 103D: 0xe180bd ... 103E: 0xe180be
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xab || _pattern[_currentParticleIndex + 2] == 0xac
                                || (_pattern[_currentParticleIndex + 2] >= 0xad
                                    && _pattern[_currentParticleIndex + 2] <= 0xb6)
                                || _pattern[_currentParticleIndex + 2] == 0xb8
                                || (_pattern[_currentParticleIndex + 2] >= 0xbb
                                    && _pattern[_currentParticleIndex + 2] <= 0xbe)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1056: 0xe18196 ... 1057: 0xe18197
                // 1058: 0xe18198 ... 1059: 0xe18199
                // 105E: 0xe1819e ... 1060: 0xe181a0
                // 1062: 0xe181a2 ... 1064: 0xe181a4
                // 1067: 0xe181a7 ... 106D: 0xe181ad
                // 1071: 0xe181b1 ... 1074: 0xe181b4
                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x96 && _pattern[_currentParticleIndex + 2] <= 0x99)
                                || (_pattern[_currentParticleIndex + 2] >= 0x9e
                                    && _pattern[_currentParticleIndex + 2] <= 0xa0)
                                || (_pattern[_currentParticleIndex + 2] >= 0xa2
                                    && _pattern[_currentParticleIndex + 2] <= 0xa4)
                                || (_pattern[_currentParticleIndex + 2] >= 0xa7
                                    && _pattern[_currentParticleIndex + 2] <= 0xad)
                                || (_pattern[_currentParticleIndex + 2] >= 0xb1
                                    && _pattern[_currentParticleIndex + 2] <= 0xb4)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1082: 0xe18282
                // 1083: 0xe18283 ... 1084: 0xe18284
                // 1085: 0xe18285 ... 1086: 0xe18286
                // 1087: 0xe18287 ... 108C: 0xe1828c
                // 108D: 0xe1828d
                // 108F: 0xe1828f
                // 109A: 0xe1829a ... 109C: 0xe1829c
                // 109D: 0xe1829d
                if (_pattern[_currentParticleIndex + 1] == 0x82) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x82 && _pattern[_currentParticleIndex + 2] <= 0x8d)
                                || _pattern[_currentParticleIndex + 2] == 0x8f
                                || (_pattern[_currentParticleIndex + 2] >= 0x9a
                                    && _pattern[_currentParticleIndex + 2] <= 0x9d)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1712: 0xe19c92 ... 1713: 0xe19c93
                // 1732: 0xe19cb2 ... 1733: 0xe19cb3
                if (_pattern[_currentParticleIndex + 1] == 0x9c) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x92 || _pattern[_currentParticleIndex + 2] == 0x93
                                || _pattern[_currentParticleIndex + 2] == 0xb2
                                || _pattern[_currentParticleIndex + 2] == 0xb3
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1752: 0xe19d92 ... 1753: 0xe19d93
                // 1772: 0xe19db2 ... 1773: 0xe19db3
                if (_pattern[_currentParticleIndex + 1] == 0x9d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x92 || _pattern[_currentParticleIndex + 2] == 0x93
                                || _pattern[_currentParticleIndex + 2] == 0xb2
                                || _pattern[_currentParticleIndex + 2] == 0xb3
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 17B6: 0xe19eb6
                // 17B7: 0xe19eb7 ... 17BD: 0xe19ebd
                // 17BE: 0xe19ebe ... 17C5: 0xe19f85
                if (_pattern[_currentParticleIndex + 1] == 0x9e) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb6 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 17C6: 0xe19f86
                // 17C7: 0xe19f87 ... 17C8: 0xe19f88
                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x85)
                                || (_pattern[_currentParticleIndex + 2] >= 0x86
                                    && _pattern[_currentParticleIndex + 2] <= 0x88)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1885: 0xe1a285 ... 1886: 0xe1a286
                // 18A9: 0xe1a2a9
                if (_pattern[_currentParticleIndex + 1] == 0xa2) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x85 || _pattern[_currentParticleIndex + 2] == 0x86
                                || _pattern[_currentParticleIndex + 2] == 0xa9
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1920: 0xe1a4a0 ... 1922: 0xe1a4a2
                // 1923: 0xe1a4a3 ... 1926: 0xe1a4a6
                // 1927: 0xe1a4a7 ... 1928: 0xe1a4a8
                // 1929: 0xe1a4a9 ... 192B: 0xe1a4ab
                // 1930: 0xe1a4b0 ... 1931: 0xe1a4b1
                // 1932: 0xe1a4b2
                // 1933: 0xe1a4b3 ... 1938: 0xe1a4b8
                if (_pattern[_currentParticleIndex + 1] == 0xa4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0xa0 && _pattern[_currentParticleIndex + 2] <= 0xab)
                                || (_pattern[_currentParticleIndex + 2] >= 0xb0
                                    && _pattern[_currentParticleIndex + 2] <= 0xb8)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1A17: 0xe1a897 ... 1A18: 0xe1a898
                // 1A19: 0xe1a899 ... 1A1A: 0xe1a89a
                // 1A1B: 0xe1a89b
                if (_pattern[_currentParticleIndex + 1] == 0xa8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x97 && _pattern[_currentParticleIndex + 2] <= 0x9b)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1A55: 0xe1a995
                // 1A56: 0xe1a996
                // 1A57: 0xe1a997
                // 1A58: 0xe1a998 ... 1A5E: 0xe1a99e
                // 1A61: 0xe1a9a1
                // 1A62: 0xe1a9a2
                // 1A63: 0xe1a9a3 ... 1A64: 0xe1a9a4
                // 1A65: 0xe1a9a5 ... 1A6C: 0xe1a9ac
                // 1A6D: 0xe1a9ad ... 1A72: 0xe1a9b2
                // 1A73: 0xe1a9b3 ... 1A74: 0xe1a9b4
                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x95 && _pattern[_currentParticleIndex + 2] <= 0x9e)
                                || (_pattern[_currentParticleIndex + 2] >= 0xa1
                                    && _pattern[_currentParticleIndex + 2] <= 0xb4)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1ABF: 0xe1aabf ... 1AC0: 0xe1ab80
                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1ACC: 0xe1ab8c ... 1ACE: 0xe1ab8e
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80
                                || (_pattern[_currentParticleIndex + 2] >= 0x8c
                                    && _pattern[_currentParticleIndex + 2] <= 0x8e)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1B00: 0xe1ac80 ... 1B03: 0xe1ac83
                // 1B04: 0xe1ac84
                // 1B35: 0xe1acb5
                // 1B36: 0xe1acb6 ... 1B3A: 0xe1acba
                // 1B3B: 0xe1acbb
                // 1B3C: 0xe1acbc
                // 1B3D: 0xe1acbd ... 1B41: 0xe1ad81
                if (_pattern[_currentParticleIndex + 1] == 0xac) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x84)
                                || (_pattern[_currentParticleIndex + 2] >= 0xb5
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1B42: 0xe1ad82
                // 1B43: 0xe1ad83
                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x83)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1B80: 0xe1ae80 ... 1B81: 0xe1ae81
                // 1B82: 0xe1ae82
                // 1BA1: 0xe1aea1
                // 1BA2: 0xe1aea2 ... 1BA5: 0xe1aea5
                // 1BA6: 0xe1aea6 ... 1BA7: 0xe1aea7
                // 1BA8: 0xe1aea8 ... 1BA9: 0xe1aea9
                // 1BAC: 0xe1aeac ... 1BAD: 0xe1aead
                if (_pattern[_currentParticleIndex + 1] == 0xae) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x82)
                                || (_pattern[_currentParticleIndex + 2] >= 0xa1
                                    && _pattern[_currentParticleIndex + 2] <= 0xa9)
                                || _pattern[_currentParticleIndex + 2] == 0xac
                                || _pattern[_currentParticleIndex + 2] == 0xad
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1BE7: 0xe1afa7
                // 1BE8: 0xe1afa8 ... 1BE9: 0xe1afa9
                // 1BEA: 0xe1afaa ... 1BEC: 0xe1afac
                // 1BED: 0xe1afad
                // 1BEE: 0xe1afae
                // 1BEF: 0xe1afaf ... 1BF1: 0xe1afb1
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa7 && _pattern[_currentParticleIndex + 2] <= 0xb1)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1C24: 0xe1b0a4 ... 1C2B: 0xe1b0ab
                // 1C2C: 0xe1b0ac ... 1C33: 0xe1b0b3
                // 1C34: 0xe1b0b4 ... 1C35: 0xe1b0b5
                // 1C36: 0xe1b0b6
                if (_pattern[_currentParticleIndex + 1] == 0xb0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa4 && _pattern[_currentParticleIndex + 2] <= 0xb6)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 1DD3: 0xe1b793 ... 1DF4: 0xe1b7b4
                if (_pattern[_currentParticleIndex + 1] == 0xb7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x93 || _pattern[_currentParticleIndex + 2] == 0x94)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // 24B6: 0xe292b6 ... 24E9: 0xe293a9
                if (_pattern[_currentParticleIndex + 1] == 0x92) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x9b && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x93) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0xa9)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // 2DE0: 0xe2b7a0 ... 2DFF: 0xe2b7bf
                if (_pattern[_currentParticleIndex + 1] == 0xb7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa0 && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xea) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // A674: 0xea99b4 ... A67B: 0xea99bb
                if (_pattern[_currentParticleIndex + 1] == 0x99) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb4 && _pattern[_currentParticleIndex + 2] <= 0xbb)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A69E: 0xea9a9e ... A69F: 0xea9a9f
                if (_pattern[_currentParticleIndex + 1] == 0x9a) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9e || _pattern[_currentParticleIndex + 2] == 0x9f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A802: 0xeaa082
                // A80B: 0xeaa08b
                // A823: 0xeaa0a3 ... A824: 0xeaa0a4
                // A825: 0xeaa0a5 ... A826: 0xeaa0a6
                // A827: 0xeaa0a7
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x82 || _pattern[_currentParticleIndex + 2] == 0x8b
                                || (_pattern[_currentParticleIndex + 2] >= 0xa3
                                    && _pattern[_currentParticleIndex + 2] <= 0xa7)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A880: 0xeaa280 ... A881: 0xeaa281
                // A8B4: 0xeaa2b4 ... A8C3: 0xeaa383
                if (_pattern[_currentParticleIndex + 1] == 0xa2) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80 || _pattern[_currentParticleIndex + 2] == 0x81
                                || (_pattern[_currentParticleIndex + 2] >= 0xb4
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A8C5: 0xeaa385
                // A8FF: 0xeaa3bf
                if (_pattern[_currentParticleIndex + 1] == 0xa3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x83)
                                || _pattern[_currentParticleIndex + 2] == 0x85
                                || _pattern[_currentParticleIndex + 2] == 0xbf
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A926: 0xeaa4a6 ... A92A: 0xeaa4aa
                if (_pattern[_currentParticleIndex + 1] == 0xa4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa6 && _pattern[_currentParticleIndex + 2] <= 0xaa)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A947: 0xeaa587 ... A951: 0xeaa591
                // A952: 0xeaa592
                if (_pattern[_currentParticleIndex + 1] == 0xa5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x87 && _pattern[_currentParticleIndex + 2] <= 0x92)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A980: 0xeaa680 ... A982: 0xeaa682
                // A983: 0xeaa683
                // A9B4: 0xeaa6b4 ... A9B5: 0xeaa6b5
                // A9B6: 0xeaa6b6 ... A9B9: 0xeaa6b9
                // A9BA: 0xeaa6ba ... A9BB: 0xeaa6bb
                // A9BC: 0xeaa6bc ... A9BD: 0xeaa6bd
                // A9BE: 0xeaa6be ... A9BF: 0xeaa6bf
                if (_pattern[_currentParticleIndex + 1] == 0xa6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x83)
                                || (_pattern[_currentParticleIndex + 2] >= 0xb4
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // A9E5: 0xeaa7a5
                if (_pattern[_currentParticleIndex + 1] == 0xa7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa5) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AA29: 0xeaa8a9 ... AA2E: 0xeaa8ae
                // AA2F: 0xeaa8af ... AA30: 0xeaa8b0
                // AA31: 0xeaa8b1 ... AA32: 0xeaa8b2
                // AA33: 0xeaa8b3 ... AA34: 0xeaa8b4
                // AA35: 0xeaa8b5 ... AA36: 0xeaa8b6
                if (_pattern[_currentParticleIndex + 1] == 0xa8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa9 && _pattern[_currentParticleIndex + 2] <= 0xb6)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AA43: 0xeaa983
                // AA4C: 0xeaa98c
                // AA4D: 0xeaa98d
                // AA7B: 0xeaa9bb
                // AA7C: 0xeaa9bc
                // AA7D: 0xeaa9bd
                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x83 || _pattern[_currentParticleIndex + 2] == 0x8c
                                || _pattern[_currentParticleIndex + 2] == 0x8d
                                || (_pattern[_currentParticleIndex + 2] >= 0xbb
                                    && _pattern[_currentParticleIndex + 2] <= 0xbd)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AAB0: 0xeaaab0
                // AAB2: 0xeaaab2 ... AAB4: 0xeaaab4
                // AAB7: 0xeaaab7 ... AAB8: 0xeaaab8
                // AABE: 0xeaaabe
                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xb0
                                || (_pattern[_currentParticleIndex + 2] >= 0xb2
                                    && _pattern[_currentParticleIndex + 2] <= 0xb4)
                                || _pattern[_currentParticleIndex + 2] == 0xb7
                                || _pattern[_currentParticleIndex + 2] == 0xb8
                                || _pattern[_currentParticleIndex + 2] == 0xbe
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // AAEB: 0xeaabab
                // AAEC: 0xeaabac ... AAED: 0xeaabad
                // AAEE: 0xeaabae ... AAEF: 0xeaabaf
                // AAF5: 0xeaabb5
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0xab && _pattern[_currentParticleIndex + 2] <= 0xaf)
                                || _pattern[_currentParticleIndex + 2] == 0xb5
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                // ABE3: 0xeaafa3 ... ABE4: 0xeaafa4
                // ABE5: 0xeaafa5
                // ABE6: 0xeaafa6 ... ABE7: 0xeaafa7
                // ABE8: 0xeaafa8
                // ABE9: 0xeaafa9 ... ABEA: 0xeaafaa
                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa3 && _pattern[_currentParticleIndex + 2] <= 0xaa)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                // FB1E: 0xefac9e
                if (_pattern[_currentParticleIndex + 1] == 0xac) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9e) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x90) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 10376: 0xf0908db6 ... 1037A: 0xf0908dba
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xb6) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10A01: 0xf090a881 ... 10A03: 0xf090a883
                        // 10A05: 0xf090a885 ... 10A06: 0xf090a886
                        // 10A0C: 0xf090a88c ... 10A0F: 0xf090a88f
                        if (_pattern[_currentParticleIndex + 2] == 0xa8) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x81
                                            && _pattern[_currentParticleIndex + 3] <= 0x83)
                                        || _pattern[_currentParticleIndex + 3] == 0x85
                                        || _pattern[_currentParticleIndex + 3] == 0x86
                                        && (_pattern[_currentParticleIndex + 3] >= 0x8c
                                            && _pattern[_currentParticleIndex + 3] <= 0x8f)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10D24: 0xf090b4a4 ... 10D27: 0xf090b4a7
                        if (_pattern[_currentParticleIndex + 2] == 0xb4) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xa4
                                        && _pattern[_currentParticleIndex + 3] <= 0xa7
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10D69: 0xf090b5a9
                        if (_pattern[_currentParticleIndex + 2] == 0xb5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xa9) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10EAB: 0xf090baab ... 10EAC: 0xf090baac
                        if (_pattern[_currentParticleIndex + 2] == 0xba) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xab) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 10EFA: 0xf090bbba ... 10EFC: 0xf090bbbc
                        if (_pattern[_currentParticleIndex + 2] == 0xbb) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xba
                                        && _pattern[_currentParticleIndex + 3] <= 0xbc
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x91) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 11000: 0xf0918080
                        // 11001: 0xf0918081
                        // 11002: 0xf0918082
                        // 11038: 0xf09180b8 ... 11045: 0xf0918185
                        if (_pattern[_currentParticleIndex + 2] == 0x80) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x82)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb8
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11073: 0xf09181b3 ... 11074: 0xf09181b4
                        if (_pattern[_currentParticleIndex + 2] == 0x81) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x85)
                                        || _pattern[_currentParticleIndex + 3] == 0xb3
                                        || _pattern[_currentParticleIndex + 3] == 0xb4
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11080: 0xf0918280 ... 11081: 0xf0918281
                        // 11082: 0xf0918282
                        // 110B0: 0xf09182b0 ... 110B2: 0xf09182b2
                        // 110B3: 0xf09182b3 ... 110B6: 0xf09182b6
                        // 110B7: 0xf09182b7 ... 110B8: 0xf09182b8
                        if (_pattern[_currentParticleIndex + 2] == 0x82) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x82)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xb8)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 110C2: 0xf0918382
                        if (_pattern[_currentParticleIndex + 2] == 0x83) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x82) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11100: 0xf0918480 ... 11102: 0xf0918482
                        // 11127: 0xf09184a7 ... 1112B: 0xf09184ab
                        // 1112C: 0xf09184ac
                        // 1112D: 0xf09184ad ... 11132: 0xf09184b2
                        if (_pattern[_currentParticleIndex + 2] == 0x84) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x82)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xa7
                                            && _pattern[_currentParticleIndex + 3] <= 0xb2)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11145: 0xf0918585 ... 11146: 0xf0918586
                        if (_pattern[_currentParticleIndex + 2] == 0x85) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x85) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11180: 0xf0918680 ... 11181: 0xf0918681
                        // 11182: 0xf0918682
                        // 111B3: 0xf09186b3 ... 111B5: 0xf09186b5
                        // 111B6: 0xf09186b6 ... 111BE: 0xf09186be
                        // 111BF: 0xf09186bf
                        if (_pattern[_currentParticleIndex + 2] == 0x86) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x82)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb3
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 111CE: 0xf091878e
                        // 111CF: 0xf091878f
                        if (_pattern[_currentParticleIndex + 2] == 0x87) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x8e
                                        || _pattern[_currentParticleIndex + 3] == 0x8f
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1122C: 0xf09188ac ... 1122E: 0xf09188ae
                        // 1122F: 0xf09188af ... 11231: 0xf09188b1
                        // 11232: 0xf09188b2 ... 11233: 0xf09188b3
                        // 11234: 0xf09188b4
                        // 11237: 0xf09188b7
                        // 1123E: 0xf09188be
                        if (_pattern[_currentParticleIndex + 2] == 0x88) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0xac
                                            && _pattern[_currentParticleIndex + 3] <= 0xb4)
                                        || _pattern[_currentParticleIndex + 3] <= 0xb7
                                        || _pattern[_currentParticleIndex + 3] <= 0xbe
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11241: 0xf0918981
                        if (_pattern[_currentParticleIndex + 2] == 0x89) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x81) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 112DF: 0xf0918b9f
                        // 112E0: 0xf0918ba0 ... 112E2: 0xf0918ba2
                        // 112E3: 0xf0918ba3 ... 112E8: 0xf0918ba8
                        if (_pattern[_currentParticleIndex + 2] == 0x8b) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x9f
                                        && _pattern[_currentParticleIndex + 3] <= 0xa8
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11300: 0xf0918c80 ... 11301: 0xf0918c81
                        // 11302: 0xf0918c82 ... 11303: 0xf0918c83
                        // 1133E: 0xf0918cbe ... 1133F: 0xf0918cbf
                        if (_pattern[_currentParticleIndex + 2] == 0x8c) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x83)
                                        || _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11340: 0xf0918d80
                        // 11341: 0xf0918d81 ... 11344: 0xf0918d84
                        // 11347: 0xf0918d87 ... 11348: 0xf0918d88
                        // 1134B: 0xf0918d8b ... 1134C: 0xf0918d8c
                        // 11357: 0xf0918d97
                        // 11362: 0xf0918da2 ... 11363: 0xf0918da3
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x84)
                                        || _pattern[_currentParticleIndex + 3] == 0x87
                                        || _pattern[_currentParticleIndex + 3] == 0x88
                                        || _pattern[_currentParticleIndex + 3] == 0x8b
                                        || _pattern[_currentParticleIndex + 3] == 0x8c
                                        || _pattern[_currentParticleIndex + 3] == 0x97
                                        || _pattern[_currentParticleIndex + 3] == 0xa2
                                        || _pattern[_currentParticleIndex + 3] == 0xa3
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 113B8: 0xf0918eb8 ... 113BA: 0xf0918eba
                        // 113BB: 0xf0918ebb ... 113C0: 0xf0918f80
                        if (_pattern[_currentParticleIndex + 2] == 0x8e) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb8
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 113C2: 0xf0918f82
                        // 113C5: 0xf0918f85
                        // 113C7: 0xf0918f87 ... 113CA: 0xf0918f8a
                        // 113CC: 0xf0918f8c ... 113CD: 0xf0918f8d
                        if (_pattern[_currentParticleIndex + 2] == 0x8f) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x80
                                        || _pattern[_currentParticleIndex + 3] == 0x82
                                        || _pattern[_currentParticleIndex + 3] == 0x85
                                        || (_pattern[_currentParticleIndex + 3] >= 0x87
                                            && _pattern[_currentParticleIndex + 3] <= 0x8a)
                                        || _pattern[_currentParticleIndex + 3] == 0x8c
                                        || _pattern[_currentParticleIndex + 3] == 0x8d
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11435: 0xf09190b5 ... 11437: 0xf09190b7
                        // 11438: 0xf09190b8 ... 1143F: 0xf09190bf
                        if (_pattern[_currentParticleIndex + 2] == 0x90) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb5
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11440: 0xf0919180 ... 11441: 0xf0919181
                        // 11443: 0xf0919183 ... 11444: 0xf0919184
                        // 11445: 0xf0919185
                        if (_pattern[_currentParticleIndex + 2] == 0x91) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x80
                                        || _pattern[_currentParticleIndex + 3] == 0x81
                                        || (_pattern[_currentParticleIndex + 3] >= 0x83
                                            && _pattern[_currentParticleIndex + 3] <= 0x85)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 114B0: 0xf09192b0 ... 114B2: 0xf09192b2
                        // 114B3: 0xf09192b3 ... 114B8: 0xf09192b8
                        // 114B9: 0xf09192b9
                        // 114BA: 0xf09192ba
                        // 114BB: 0xf09192bb ... 114BE: 0xf09192be
                        // 114BF: 0xf09192bf ... 114C0: 0xf0919380
                        if (_pattern[_currentParticleIndex + 2] == 0x92) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb0
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 114C1: 0xf0919381
                        if (_pattern[_currentParticleIndex + 2] == 0x93) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x80
                                        || _pattern[_currentParticleIndex + 3] == 0x81
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 115AF: 0xf09196af ... 115B1: 0xf09196b1
                        // 115B2: 0xf09196b2 ... 115B5: 0xf09196b5
                        // 115B8: 0xf09196b8 ... 115BB: 0xf09196bb
                        // 115BC: 0xf09196bc ... 115BD: 0xf09196bd
                        // 115BE: 0xf09196be
                        if (_pattern[_currentParticleIndex + 2] == 0x96) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0xaf
                                            && _pattern[_currentParticleIndex + 3] <= 0xb5)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb8
                                            && _pattern[_currentParticleIndex + 3] <= 0xbe)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 115DC: 0xf091979c ... 115DD: 0xf091979d
                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x9c
                                        || _pattern[_currentParticleIndex + 3] == 0x9d
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11630: 0xf09198b0 ... 11632: 0xf09198b2
                        // 11633: 0xf09198b3 ... 1163A: 0xf09198ba
                        // 1163B: 0xf09198bb ... 1163C: 0xf09198bc
                        // 1163D: 0xf09198bd
                        // 1163E: 0xf09198be
                        if (_pattern[_currentParticleIndex + 2] == 0x98) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb0
                                        && _pattern[_currentParticleIndex + 3] <= 0xbe
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11640: 0xf0919980
                        if (_pattern[_currentParticleIndex + 2] == 0x99) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x80) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 116AB: 0xf0919aab
                        // 116AC: 0xf0919aac
                        // 116AD: 0xf0919aad
                        // 116AE: 0xf0919aae ... 116AF: 0xf0919aaf
                        // 116B0: 0xf0919ab0 ... 116B5: 0xf0919ab5
                        if (_pattern[_currentParticleIndex + 2] == 0x9a) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xab
                                        && _pattern[_currentParticleIndex + 3] <= 0xb5
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1171D: 0xf0919c9d
                        // 1171E: 0xf0919c9e
                        // 1171F: 0xf0919c9f
                        // 11720: 0xf0919ca0 ... 11721: 0xf0919ca1
                        // 11722: 0xf0919ca2 ... 11725: 0xf0919ca5
                        // 11726: 0xf0919ca6
                        // 11727: 0xf0919ca7 ... 1172A: 0xf0919caa
                        if (_pattern[_currentParticleIndex + 2] == 0x9c) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x9d
                                        && _pattern[_currentParticleIndex + 3] <= 0xaa
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 1182C: 0xf091a0ac ... 1182E: 0xf091a0ae
                        // 1182F: 0xf091a0af ... 11837: 0xf091a0b7
                        // 11838: 0xf091a0b8
                        if (_pattern[_currentParticleIndex + 2] == 0xa0) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xac
                                        && _pattern[_currentParticleIndex + 3] <= 0xb8
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11930: 0xf091a4b0 ... 11935: 0xf091a4b5
                        // 11937: 0xf091a4b7 ... 11938: 0xf091a4b8
                        // 1193B: 0xf091a4bb ... 1193C: 0xf091a4bc
                        if (_pattern[_currentParticleIndex + 2] == 0xa4) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xb5)
                                        || _pattern[_currentParticleIndex + 3] <= 0xb7
                                        || _pattern[_currentParticleIndex + 3] <= 0xb8
                                        || _pattern[_currentParticleIndex + 3] <= 0xbb
                                        || _pattern[_currentParticleIndex + 3] <= 0xbc
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11940: 0xf091a580
                        // 11942: 0xf091a582
                        if (_pattern[_currentParticleIndex + 2] == 0xa5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0x82
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 119D1: 0xf091a791 ... 119D3: 0xf091a793
                        // 119D4: 0xf091a794 ... 119D7: 0xf091a797
                        // 119DA: 0xf091a79a ... 119DB: 0xf091a79b
                        // 119DC: 0xf091a79c ... 119DF: 0xf091a79f
                        // 119E4: 0xf091a7a4
                        if (_pattern[_currentParticleIndex + 2] == 0xa7) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x91
                                            && _pattern[_currentParticleIndex + 3] <= 0x97)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x9a
                                            && _pattern[_currentParticleIndex + 3] <= 0x9f)
                                        || _pattern[_currentParticleIndex + 3] == 0xa4
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11A01: 0xf091a881 ... 11A0A: 0xf091a88a
                        // 11A35: 0xf091a8b5 ... 11A38: 0xf091a8b8
                        // 11A39: 0xf091a8b9
                        // 11A3B: 0xf091a8bb ... 11A3E: 0xf091a8be
                        if (_pattern[_currentParticleIndex + 2] == 0xa8) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x81
                                            && _pattern[_currentParticleIndex + 3] <= 0x8a)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb5
                                            && _pattern[_currentParticleIndex + 3] <= 0xb9)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xbb
                                            && _pattern[_currentParticleIndex + 3] <= 0xbe)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11A51: 0xf091a991 ... 11A56: 0xf091a996
                        // 11A57: 0xf091a997 ... 11A58: 0xf091a998
                        // 11A59: 0xf091a999 ... 11A5B: 0xf091a99b
                        if (_pattern[_currentParticleIndex + 2] == 0xa9) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x91
                                        && _pattern[_currentParticleIndex + 3] <= 0x9b
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11A8A: 0xf091aa8a ... 11A96: 0xf091aa96
                        // 11A97: 0xf091aa97
                        if (_pattern[_currentParticleIndex + 2] == 0xaa) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x8a
                                        && _pattern[_currentParticleIndex + 3] <= 0x97
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11B60: 0xf091ada0
                        // 11B61: 0xf091ada1
                        // 11B62: 0xf091ada2 ... 11B64: 0xf091ada4
                        // 11B65: 0xf091ada5
                        // 11B66: 0xf091ada6
                        // 11B67: 0xf091ada7
                        if (_pattern[_currentParticleIndex + 2] == 0xad) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xa0
                                        && _pattern[_currentParticleIndex + 3] <= 0xa7
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11C2F: 0xf091b0af
                        // 11C30: 0xf091b0b0 ... 11C36: 0xf091b0b6
                        // 11C38: 0xf091b0b8 ... 11C3D: 0xf091b0bd
                        // 11C3E: 0xf091b0be
                        if (_pattern[_currentParticleIndex + 2] == 0xb0) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xaf
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xb6)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb8
                                            && _pattern[_currentParticleIndex + 3] <= 0xbe)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11C92: 0xf091b292 ... 11CA7: 0xf091b2a7
                        // 11CA9: 0xf091b2a9
                        // 11CAA: 0xf091b2aa ... 11CB0: 0xf091b2b0
                        // 11CB1: 0xf091b2b1
                        // 11CB2: 0xf091b2b2 ... 11CB3: 0xf091b2b3
                        // 11CB4: 0xf091b2b4
                        // 11CB5: 0xf091b2b5 ... 11CB6: 0xf091b2b6
                        if (_pattern[_currentParticleIndex + 2] == 0xb2) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x92
                                            && _pattern[_currentParticleIndex + 3] <= 0xa7)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xa9
                                            && _pattern[_currentParticleIndex + 3] <= 0xb6)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11D31: 0xf091b4b1 ... 11D36: 0xf091b4b6
                        // 11D3A: 0xf091b4ba
                        // 11D3C: 0xf091b4bc ... 11D3D: 0xf091b4bd
                        // 11D3F: 0xf091b4bf ... 11D41: 0xf091b581
                        if (_pattern[_currentParticleIndex + 2] == 0xb4) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0xb1
                                            && _pattern[_currentParticleIndex + 3] <= 0xb6)
                                        || _pattern[_currentParticleIndex + 3] == 0xba
                                        || _pattern[_currentParticleIndex + 3] == 0xbc
                                        || _pattern[_currentParticleIndex + 3] == 0xbd
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11D43: 0xf091b583
                        // 11D47: 0xf091b587
                        if (_pattern[_currentParticleIndex + 2] == 0xb5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x80
                                        || _pattern[_currentParticleIndex + 3] == 0x81
                                        || _pattern[_currentParticleIndex + 3] == 0x83
                                        || _pattern[_currentParticleIndex + 3] == 0x87
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11D8A: 0xf091b68a ... 11D8E: 0xf091b68e
                        // 11D90: 0xf091b690 ... 11D91: 0xf091b691
                        // 11D93: 0xf091b693 ... 11D94: 0xf091b694
                        // 11D95: 0xf091b695
                        // 11D96: 0xf091b696
                        if (_pattern[_currentParticleIndex + 2] == 0xb6) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x8a
                                            && _pattern[_currentParticleIndex + 3] <= 0x8e)
                                        || _pattern[_currentParticleIndex + 3] == 0x90
                                        || _pattern[_currentParticleIndex + 3] == 0x91
                                        || (_pattern[_currentParticleIndex + 3] >= 0x93
                                            && _pattern[_currentParticleIndex + 3] <= 0x96)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11EF3: 0xf091bbb3 ... 11EF4: 0xf091bbb4
                        // 11EF5: 0xf091bbb5 ... 11EF6: 0xf091bbb6
                        if (_pattern[_currentParticleIndex + 2] == 0xbb) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb3
                                        && _pattern[_currentParticleIndex + 3] <= 0xb6
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11F00: 0xf091bc80 ... 11F01: 0xf091bc81
                        // 11F03: 0xf091bc83
                        // 11F34: 0xf091bcb4 ... 11F35: 0xf091bcb5
                        // 11F36: 0xf091bcb6 ... 11F3A: 0xf091bcba
                        // 11F3E: 0xf091bcbe ... 11F3F: 0xf091bcbf
                        if (_pattern[_currentParticleIndex + 2] == 0xbc) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x80
                                        || _pattern[_currentParticleIndex + 3] == 0x81
                                        || _pattern[_currentParticleIndex + 3] == 0x83
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb4
                                            && _pattern[_currentParticleIndex + 3] <= 0xba)
                                        || _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 11F40: 0xf091bd80
                        if (_pattern[_currentParticleIndex + 2] == 0xbd) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x80) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x96) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        // 1611E: 0xf096849e ... 16129: 0xf09684a9
                        // 1612A: 0xf09684aa ... 1612C: 0xf09684ac
                        // 1612D: 0xf09684ad ... 1612E: 0xf09684ae
                        if (_pattern[_currentParticleIndex + 2] == 0x84) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x9e
                                        && _pattern[_currentParticleIndex + 3] <= 0xae
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16F4F: 0xf096bd8f
                        // 16F51: 0xf096bd91 ... 16F87: 0xf096be87
                        if (_pattern[_currentParticleIndex + 2] == 0xbd) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x8f
                                        || (_pattern[_currentParticleIndex + 3] >= 0x91
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16F8F: 0xf096be8f ... 16F92: 0xf096be92
                        if (_pattern[_currentParticleIndex + 2] == 0xbe) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x87)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x8f
                                            && _pattern[_currentParticleIndex + 3] <= 0x92)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        // 16FF0: 0xf096bfb0 ... 16FF1: 0xf096bfb1
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb0
                                        || _pattern[_currentParticleIndex + 3] == 0xb1
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }

                    if (_pattern[_currentParticleIndex + 1] == 0x9b) {
                        if (_currentParticleIndex + 2 < _pattern.length) {
                            // 1BC9E: 0xf09bb29e
                            if (_pattern[_currentParticleIndex + 2] == 0xb2) {
                                if (_currentParticleIndex + 3 < _pattern.length) {
                                    if (_pattern[_currentParticleIndex + 3] == 0x9e) {
                                        return (true, _currentParticleIndex + 3);
                                    }
                                }
                            }
                        }
                    }

                    if (_pattern[_currentParticleIndex + 1] == 0x9e) {
                        if (_currentParticleIndex + 2 < _pattern.length) {
                            // 1E000: 0xf09e8080 ... 1E006: 0xf09e8086
                            // 1E008: 0xf09e8088 ... 1E018: 0xf09e8098
                            // 1E01B: 0xf09e809b ... 1E021: 0xf09e80a1
                            // 1E023: 0xf09e80a3 ... 1E024: 0xf09e80a4
                            // 1E026: 0xf09e80a6 ... 1E02A: 0xf09e80aa
                            if (_pattern[_currentParticleIndex + 2] == 0x80) {
                                if (_currentParticleIndex + 3 < _pattern.length) {
                                    if (
                                        (_pattern[_currentParticleIndex + 3] >= 0x80
                                                && _pattern[_currentParticleIndex + 3] <= 0x86)
                                            || (_pattern[_currentParticleIndex + 3] >= 0x88
                                                && _pattern[_currentParticleIndex + 3] <= 0x98)
                                            || (_pattern[_currentParticleIndex + 3] >= 0x9b
                                                && _pattern[_currentParticleIndex + 3] <= 0xa1)
                                            || _pattern[_currentParticleIndex + 3] == 0xa3
                                            || _pattern[_currentParticleIndex + 3] == 0xa4
                                            || (_pattern[_currentParticleIndex + 3] >= 0xa6
                                                && _pattern[_currentParticleIndex + 3] <= 0xaa)
                                    ) {
                                        return (true, _currentParticleIndex + 3);
                                    }
                                }
                            }

                            // 1E08F: 0xf09e828f
                            if (_pattern[_currentParticleIndex + 2] == 0x82) {
                                if (_currentParticleIndex + 3 < _pattern.length) {
                                    if (_pattern[_currentParticleIndex + 3] == 0x8f) {
                                        return (true, _currentParticleIndex + 3);
                                    }
                                }
                            }

                            // 1E6E3: 0xf09e9ba3
                            // 1E6E6: 0xf09e9ba6
                            // 1E6EE: 0xf09e9bae ... 1E6EF: 0xf09e9baf
                            // 1E6F5: 0xf09e9bb5
                            if (_pattern[_currentParticleIndex + 2] == 0x9b) {
                                if (_currentParticleIndex + 3 < _pattern.length) {
                                    if (
                                        _pattern[_currentParticleIndex + 3] == 0xa3
                                            || _pattern[_currentParticleIndex + 3] == 0xa6
                                            || _pattern[_currentParticleIndex + 3] == 0xae
                                            || _pattern[_currentParticleIndex + 3] == 0xaf
                                            || _pattern[_currentParticleIndex + 3] == 0xb5
                                    ) {
                                        return (true, _currentParticleIndex + 3);
                                    }
                                }
                            }

                            // 1E947: 0xf09ea587
                            if (_pattern[_currentParticleIndex + 2] == 0xa5) {
                                if (_currentParticleIndex + 3 < _pattern.length) {
                                    if (_pattern[_currentParticleIndex + 3] == 0x87) {
                                        return (true, _currentParticleIndex + 3);
                                    }
                                }
                            }
                        }
                    }

                    if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                        if (_currentParticleIndex + 2 < _pattern.length) {
                            // 1F130: 0xf09f84b0 ... 1F149: 0xf09f8589
                            if (_pattern[_currentParticleIndex + 2] == 0x84) {
                                if (_currentParticleIndex + 3 < _pattern.length) {
                                    if (
                                        _pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf
                                    ) {
                                        return (true, _currentParticleIndex + 3);
                                    }
                                }
                            }

                            // 1F150: 0xf09f8590 ... 1F169: 0xf09f85a9
                            // 1F170: 0xf09f85b0 ... 1F189: 0xf09f8689
                            if (_pattern[_currentParticleIndex + 2] == 0x85) {
                                if (_currentParticleIndex + 3 < _pattern.length) {
                                    if (
                                        (_pattern[_currentParticleIndex + 3] >= 0x80
                                                && _pattern[_currentParticleIndex + 3] <= 0x89)
                                            || (_pattern[_currentParticleIndex + 3] >= 0x90
                                                && _pattern[_currentParticleIndex + 3] <= 0xa9)
                                            || (_pattern[_currentParticleIndex + 3] >= 0xb0
                                                && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                    ) {
                                        return (true, _currentParticleIndex + 3);
                                    }
                                }
                            }

                            if (_pattern[_currentParticleIndex + 2] == 0x86) {
                                if (_currentParticleIndex + 3 < _pattern.length) {
                                    if (
                                        _pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x89
                                    ) {
                                        return (true, _currentParticleIndex + 3);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyOtherMath(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 005e: 0x5e
        if (_pattern[_currentParticleIndex] == 0x5e) {
            return (true, _currentParticleIndex);
        }

        // 03d0: 0xcf90 ... 03d2: 0xcf92
        // 03d5: 0xcf95
        // 03F0: 0xcfb0 ... 03F1: 0xcfb1
        // 03F4: 0xcfb4 ... 03F5: 0xcfb5
        if (_pattern[_currentParticleIndex] == 0xcf) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    (_pattern[_currentParticleIndex + 1] >= 0x90 && _pattern[_currentParticleIndex + 1] <= 0x92)
                        || _pattern[_currentParticleIndex + 1] == 0x95 || _pattern[_currentParticleIndex + 1] == 0xb0
                        || _pattern[_currentParticleIndex + 1] == 0xb1 || _pattern[_currentParticleIndex + 1] == 0xb4
                        || _pattern[_currentParticleIndex + 1] == 0xb5
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 2016: 0xe28096
        // 2032: 0xe280b2 ... 2034: 0xe280b4
        // 2040: 0xe28180
        // 2061: 0xe281a1 ... 2064: 0xe281a4
        // 207d: 0xe281bd
        // 207e: 0xe281be
        // 208d: 0xe2828d
        // 208e: 0xe2828e
        // 20d0: 0xe28390 ... 20dc: 0xe2839c
        // 20e1: 0xe283a1
        // 20e5: 0xe283a5 ... 20e6: 0xe283a6
        // 20eb: 0xe283ab ... 20ef: 0xe283af
        // 2102: 0xe28482
        // 2107: 0xe28487
        // 210a: 0xe2848a ... 2113: 0xe28493
        // 2115: 0xe28495
        // 2119: 0xe28499 ... 211D: 0xe2849d
        // 2124: 0xe284a4
        // 2128: 0xe284a8
        // 2129: 0xe284a9
        // 212C: 0xe284ac ... 212D: 0xe284ad
        // 212F: 0xe284af ... 2131: 0xe284b1
        // 2133: 0xe284b3 ... 2134: 0xe284b4
        // 2135: 0xe284b5 ... 2138: 0xe284b8
        // 213C: 0xe284bc ... 213F: 0xe284bf
        // 2145: 0xe28585 ... 2149: 0xe28589
        // 2195: 0xe28695 ... 2199: 0xe28699
        // 219C: 0xe2869c ... 219F: 0xe2869f
        // 21A1: 0xe286a1 ... 21A2: 0xe286a2
        // 21A4: 0xe286a4 ... 21A5: 0xe286a5
        // 21A7: 0xe286a7
        // 21A9: 0xe286a9 ... 21AD: 0xe286ad
        // 21B0: 0xe286b0 ... 21B1: 0xe286b1
        // 21B6: 0xe286b6 ... 21B7: 0xe286b7
        // 21BC: 0xe286bc ... 21CD: 0xe2878d
        // 21D0: 0xe28790 ... 21D1: 0xe28791
        // 21D3: 0xe28793
        // 21D5: 0xe28795 ... 21DB: 0xe2879b
        // 21DD: 0xe2879d
        // 21E4: 0xe287a4 ... 21E5: 0xe287a5
        // 2308: 0xe28c88
        // 2309: 0xe28c89
        // 230A: 0xe28c8a
        // 230B: 0xe28c8b
        // 23B4: 0xe28eb4 ... 23B5: 0xe28eb4
        // 23B7: 0xe28eb7
        // 23D0: 0xe28f90
        // 23E2: 0xe28fa2
        // 25A0: 0xe296a0 ... 25A1: 0xe296a1
        // 25AE: 0xe296ae ... 25B6: 0xe296b6
        // 25BC: 0xe296bc ... 25C0: 0xe29780
        // 25C6: 0xe29786 ... 25C7: 0xe29787
        // 25CA: 0xe2978a ... 25CB: 0xe2978b
        // 25CF: 0xe2978f ... 25D3: 0xe29793
        // 25E2: 0xe297a2
        // 25E4: 0xe297a4
        // 25E7: 0xe297a7 ... 25EC: 0xe297ac
        // 2605: 0xe29885 ... 2606: 0xe29886
        // 2640: 0xe29980
        // 2642: 0xe29982
        // 2660: 0xe299a0 ... 2663: 0xe299a3
        // 266D: 0xe299ad ... 266E: 0xe299ae
        // 27C5: 0xe29f85
        // 27C6: 0xe29f86
        // 27E6: 0xe29fa6
        // 27E7: 0xe29fa7
        // 27E8: 0xe29fa8
        // 27E9: 0xe29fa9
        // 27EA: 0xe29faa
        // 27EB: 0xe29fab
        // 27EC: 0xe29fac
        // 27ED: 0xe29fad
        // 27EE: 0xe29fae
        // 27EF: 0xe29faf
        // 2983: 0xe2a683
        // 2984: 0xe2a684
        // 2985: 0xe2a685
        // 2986: 0xe2a686
        // 2987: 0xe2a687
        // 2988: 0xe2a688
        // 2989: 0xe2a689
        // 298A: 0xe2a68a
        // 298B: 0xe2a68b
        // 298C: 0xe2a68c
        // 298D: 0xe2a68d
        // 298E: 0xe2a68e
        // 298F: 0xe2a68f
        // 2990: 0xe2a690
        // 2991: 0xe2a691
        // 2992: 0xe2a692
        // 2993: 0xe2a693
        // 2994: 0xe2a694
        // 2995: 0xe2a695
        // 2996: 0xe2a696
        // 2997: 0xe2a697
        // 2998: 0xe2a698
        // 29D8: 0xe2a798
        // 29D9: 0xe2a799
        // 29DA: 0xe2a79a
        // 29DB: 0xe2a79b
        // 29FC: 0xe2a7bc
        // 29FD: 0xe2a7bd
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x96
                                || (_pattern[_currentParticleIndex + 2] >= 0xb2
                                    && _pattern[_currentParticleIndex + 2] <= 0xb4)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80
                                || (_pattern[_currentParticleIndex + 2] >= 0xa1
                                    && _pattern[_currentParticleIndex + 2] <= 0xa4)
                                || _pattern[_currentParticleIndex + 2] == 0xbd
                                || _pattern[_currentParticleIndex + 2] == 0xbe
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x82) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8d || _pattern[_currentParticleIndex + 2] == 0x8e)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x83) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x90 && _pattern[_currentParticleIndex + 2] <= 0x9c)
                                || _pattern[_currentParticleIndex + 2] >= 0xa1
                                || _pattern[_currentParticleIndex + 2] >= 0xa5
                                || _pattern[_currentParticleIndex + 2] >= 0xa6
                                || (_pattern[_currentParticleIndex + 2] >= 0xab
                                    && _pattern[_currentParticleIndex + 2] <= 0xaf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x84) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x82 || _pattern[_currentParticleIndex + 2] == 0x87
                                || (_pattern[_currentParticleIndex + 2] >= 0x8a
                                    && _pattern[_currentParticleIndex + 2] <= 0x93)
                                || _pattern[_currentParticleIndex + 2] >= 0x95
                                || (_pattern[_currentParticleIndex + 2] >= 0x99
                                    && _pattern[_currentParticleIndex + 2] <= 0x9d)
                                || _pattern[_currentParticleIndex + 2] >= 0xa4
                                || _pattern[_currentParticleIndex + 2] >= 0xa8
                                || _pattern[_currentParticleIndex + 2] >= 0xa9
                                || _pattern[_currentParticleIndex + 2] >= 0xac
                                || _pattern[_currentParticleIndex + 2] >= 0xad
                                || (_pattern[_currentParticleIndex + 2] >= 0xaf
                                    && _pattern[_currentParticleIndex + 2] <= 0xb1)
                                || _pattern[_currentParticleIndex + 2] >= 0xb3
                                || _pattern[_currentParticleIndex + 2] >= 0xb4
                                || (_pattern[_currentParticleIndex + 2] >= 0xb5
                                    && _pattern[_currentParticleIndex + 2] <= 0xb8)
                                || (_pattern[_currentParticleIndex + 2] >= 0xbc
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x85) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x85 && _pattern[_currentParticleIndex + 2] <= 0x89)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x86) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x95 && _pattern[_currentParticleIndex + 2] <= 0x99)
                                || (_pattern[_currentParticleIndex + 2] >= 0x9c
                                    && _pattern[_currentParticleIndex + 2] <= 0x9f)
                                || _pattern[_currentParticleIndex + 2] == 0xa1
                                || _pattern[_currentParticleIndex + 2] == 0xa2
                                || _pattern[_currentParticleIndex + 2] == 0xa4
                                || _pattern[_currentParticleIndex + 2] == 0xa5
                                || _pattern[_currentParticleIndex + 2] == 0xa7
                                || (_pattern[_currentParticleIndex + 2] >= 0xa9
                                    && _pattern[_currentParticleIndex + 2] <= 0xad)
                                || _pattern[_currentParticleIndex + 2] == 0xb0
                                || _pattern[_currentParticleIndex + 2] == 0xb1
                                || _pattern[_currentParticleIndex + 2] == 0xb6
                                || _pattern[_currentParticleIndex + 2] == 0xb7
                                || (_pattern[_currentParticleIndex + 2] >= 0xbc
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x87) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x80 && _pattern[_currentParticleIndex + 2] <= 0x8d)
                                || _pattern[_currentParticleIndex + 2] == 0x90
                                || _pattern[_currentParticleIndex + 2] == 0x91
                                || _pattern[_currentParticleIndex + 2] == 0x93
                                || (_pattern[_currentParticleIndex + 2] >= 0x95
                                    && _pattern[_currentParticleIndex + 2] <= 0x9b)
                                || _pattern[_currentParticleIndex + 2] == 0x9d
                                || _pattern[_currentParticleIndex + 2] == 0xa4
                                || _pattern[_currentParticleIndex + 2] == 0xa5
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x8c) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x88 && _pattern[_currentParticleIndex + 2] <= 0x8b)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x8e) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xb4 || _pattern[_currentParticleIndex + 2] == 0xb5
                                || _pattern[_currentParticleIndex + 2] == 0xb7
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x8f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x90 || _pattern[_currentParticleIndex + 2] == 0xa2)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x96) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xa0 || _pattern[_currentParticleIndex + 2] == 0xa1
                                || (_pattern[_currentParticleIndex + 2] >= 0xae
                                    && _pattern[_currentParticleIndex + 2] <= 0xb6)
                                || (_pattern[_currentParticleIndex + 2] >= 0xbc
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x97) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x86 || _pattern[_currentParticleIndex + 2] == 0x87
                                || _pattern[_currentParticleIndex + 2] == 0x8a
                                || _pattern[_currentParticleIndex + 2] == 0x8b
                                || (_pattern[_currentParticleIndex + 2] >= 0x8f
                                    && _pattern[_currentParticleIndex + 2] <= 0x93)
                                || _pattern[_currentParticleIndex + 2] == 0xa2
                                || _pattern[_currentParticleIndex + 2] == 0xa4
                                || (_pattern[_currentParticleIndex + 2] >= 0xa7
                                    && _pattern[_currentParticleIndex + 2] <= 0xac)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x98) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x85 || _pattern[_currentParticleIndex + 2] == 0x86
                                || _pattern[_currentParticleIndex + 2] == 0xb7
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x99) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x80 || _pattern[_currentParticleIndex + 2] == 0x82
                                || (_pattern[_currentParticleIndex + 2] >= 0xa0
                                    && _pattern[_currentParticleIndex + 2] <= 0xa3)
                                || _pattern[_currentParticleIndex + 2] == 0xad
                                || _pattern[_currentParticleIndex + 2] == 0xae
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x85 || _pattern[_currentParticleIndex + 2] == 0x86
                                || (_pattern[_currentParticleIndex + 2] >= 0xa6
                                    && _pattern[_currentParticleIndex + 2] <= 0xaf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa6) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x83 && _pattern[_currentParticleIndex + 2] <= 0x98)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x98 && _pattern[_currentParticleIndex + 2] <= 0xbd)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xa1 || _pattern[_currentParticleIndex + 2] == 0xa3
                                || _pattern[_currentParticleIndex + 2] == 0xa8
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbc) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbc || _pattern[_currentParticleIndex + 2] == 0xbe)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 1D400: 0xf09d9080 ... 1D454: 0xf09d9194
        // 1D456: 0xf09d9196 ... 1D49C: 0xf09d929c
        // 1D49E: 0xf09d929e ... 1D49F: 0xf09d929f
        // 1D4A2: 0xf09d92a2
        // 1D4A5: 0xf09d92a5 ... 1D4A6: 0xf09d92a6
        // 1D4A9: 0xf09d92a9 ... 1D4AC: 0xf09d92ac
        // 1D4AE: 0xf09d92ae ... 1D4B9: 0xf09d92b9
        // 1D4BB: 0xf09d92bb
        // 1D4BD: 0xf09d92bd ... 1D4C3: 0xf09d9383
        // 1D4C5: 0xf09d9385 ... 1D505: 0xf09d9485
        // 1D507: 0xf09d9487 ... 1D50A: 0xf09d948a
        // 1D50D: 0xf09d948d ... 1D514: 0xf09d9494
        // 1D516: 0xf09d9496 ... 1D51C: 0xf09d949c
        // 1D51E: 0xf09d949e ... 1D539: 0xf09d94b9
        // 1D53B: 0xf09d94bb ... 1D53E: 0xf09d94be
        // 1D540: 0xf09d9580 ... 1D544: 0xf09d9584
        // 1D546: 0xf09d9586
        // 1D54A: 0xf09d958a ... 1D550: 0xf09d9590
        // 1D552: 0xf09d9592 ... 1D6A5: 0xf09d9aa5
        // 1D6A8: 0xf09d9aa8 ... 1D6C0: 0xf09d9b80
        // 1D6C2: 0xf09d9b82 ... 1D6DA: 0xf09d9b9a
        // 1D6DC: 0xf09d9b9c ... 1D6FA: 0xf09d9bba
        // 1D6FC: 0xf09d9bbc ... 1D714: 0xf09d9c94
        // 1D716: 0xf09d9c96 ... 1D734: 0xf09d9cb4
        // 1D736: 0xf09d9cb6 ... 1D74E: 0xf09d9d8e
        // 1D750: 0xf09d9d90 ... 1D76E: 0xf09d9dae
        // 1D770: 0xf09d9db0 ... 1D788: 0xf09d9e88
        // 1D78A: 0xf09d9e8a ... 1D7A8: 0xf09d9ea8
        // 1D7AA: 0xf09d9eaa ... 1D7C2: 0xf09d9f82
        // 1D7C4: 0xf09d9f84 ... 1D7CB: 0xf09d9f8b
        // 1D7CE: 0xf09d9f8e ... 1D7FF: 0xf09d9fbf
        // 1EE00: 0xf09eb880 ... 1EE03: 0xf09eb883
        // 1EE05: 0xf09eb885 ... 1EE1F: 0xf09eb89f
        // 1EE21: 0xf09eb8a1 ... 1EE22: 0xf09eb8a2
        // 1EE24: 0xf09eb8a4
        // 1EE27: 0xf09eb8a7
        // 1EE29: 0xf09eb8a9 ... 1EE32: 0xf09eb8b2
        // 1EE34: 0xf09eb8b4 ... 1EE37: 0xf09eb8b7
        // 1EE39: 0xf09eb8b9
        // 1EE3B: 0xf09eb8bb
        // 1EE42: 0xf09eb982
        // 1EE47: 0xf09eb987
        // 1EE49: 0xf09eb989
        // 1EE4B: 0xf09eb98b
        // 1EE4D: 0xf09eb98d ... 1EE4F: 0xf09eb98f
        // 1EE51: 0xf09eb991 ... 1EE52: 0xf09eb992
        // 1EE54: 0xf09eb994
        // 1EE57: 0xf09eb997
        // 1EE59: 0xf09eb999
        // 1EE5B: 0xf09eb99b
        // 1EE5D: 0xf09eb99d
        // 1EE5F: 0xf09eb99f
        // 1EE61: 0xf09eb9a1 ... 1EE62: 0xf09eb9a2
        // 1EE64: 0xf09eb9a4
        // 1EE67: 0xf09eb9a7 ... 1EE6A: 0xf09eb9aa
        // 1EE6C: 0xf09eb9ac ... 1EE72: 0xf09eb9b2
        // 1EE74: 0xf09eb9b4 ... 1EE77: 0xf09eb9b7
        // 1EE79: 0xf09eb9b9 ... 1EE7C: 0xf09eb9bc
        // 1EE7E: 0xf09eb9be
        // 1EE80: 0xf09eba80 ... 1EE89: 0xf09eba89
        // 1EE8B: 0xf09eba8b ... 1EE9B: 0xf09eba9b
        // 1EEA1: 0xf09ebaa1 ... 1EEA3: 0xf09ebaa3
        // 1EEA5: 0xf09ebaa5 ... 1EEA9: 0xf09ebaa9
        // 1EEAB: 0xf09ebaab ... 1EEBB: 0xf09ebabb
        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x9d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x90) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x91) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x94)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x96
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x92) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x9c)
                                        || _pattern[_currentParticleIndex + 3] == 0x9e
                                        || _pattern[_currentParticleIndex + 3] == 0x9f
                                        || _pattern[_currentParticleIndex + 3] == 0xa2
                                        || _pattern[_currentParticleIndex + 3] == 0xa5
                                        || _pattern[_currentParticleIndex + 3] == 0xa6
                                        || (_pattern[_currentParticleIndex + 3] >= 0xa9
                                            && _pattern[_currentParticleIndex + 3] <= 0xac)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xae
                                            && _pattern[_currentParticleIndex + 3] <= 0xb9)
                                        || _pattern[_currentParticleIndex + 3] == 0xbb
                                        || (_pattern[_currentParticleIndex + 3] >= 0xbd
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x93) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x83)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x85
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x94) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x85)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x87
                                            && _pattern[_currentParticleIndex + 3] <= 0x8a)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x8d
                                            && _pattern[_currentParticleIndex + 3] <= 0x94)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x96
                                            && _pattern[_currentParticleIndex + 3] <= 0x9c)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x9e
                                            && _pattern[_currentParticleIndex + 3] <= 0xb9)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xbb
                                            && _pattern[_currentParticleIndex + 3] <= 0xbe)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x95) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x84)
                                        || _pattern[_currentParticleIndex + 3] == 0x86
                                        || (_pattern[_currentParticleIndex + 3] >= 0x8a
                                            && _pattern[_currentParticleIndex + 3] <= 0x90)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x92
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                    // 14 + 16 + 16 = 46
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x96) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                    // 16 + 16 + 16 + 16 = 64
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                    // 16 + 16 + 16 + 16 = 64
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x98) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                    // 16 + 16 + 16 + 16 = 64
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x99) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x80
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                    // 16 + 16 + 16 + 16 = 64
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x9a) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0xa5)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xa8
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x9b) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x80
                                        || (_pattern[_currentParticleIndex + 3] >= 0x82
                                            && _pattern[_currentParticleIndex + 3] <= 0x9a)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x9c
                                            && _pattern[_currentParticleIndex + 3] <= 0xba)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xbc
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x9c) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x94)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x96
                                            && _pattern[_currentParticleIndex + 3] <= 0xb4)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb6
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x9d) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x8e)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x90
                                            && _pattern[_currentParticleIndex + 3] <= 0xae)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb0
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x9e) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x88)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x8a
                                            && _pattern[_currentParticleIndex + 3] <= 0xa8)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xaa
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x9f) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x82)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x84
                                            && _pattern[_currentParticleIndex + 3] <= 0x8b)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x8e
                                            && _pattern[_currentParticleIndex + 3] <= 0xbf)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9e) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb8) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x83)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x85
                                            && _pattern[_currentParticleIndex + 3] <= 0x9f)
                                        || _pattern[_currentParticleIndex + 3] == 0xa1
                                        || _pattern[_currentParticleIndex + 3] == 0xa2
                                        || _pattern[_currentParticleIndex + 3] == 0xa4
                                        || _pattern[_currentParticleIndex + 3] == 0xa7
                                        || (_pattern[_currentParticleIndex + 3] >= 0xa9
                                            && _pattern[_currentParticleIndex + 3] <= 0xb2)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb4
                                            && _pattern[_currentParticleIndex + 3] <= 0xb7)
                                        || _pattern[_currentParticleIndex + 3] == 0xb9
                                        || _pattern[_currentParticleIndex + 3] == 0xbb
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xb9) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x82
                                        || _pattern[_currentParticleIndex + 3] == 0x87
                                        || _pattern[_currentParticleIndex + 3] == 0x89
                                        || _pattern[_currentParticleIndex + 3] == 0x8b
                                        || (_pattern[_currentParticleIndex + 3] >= 0x8d
                                            && _pattern[_currentParticleIndex + 3] <= 0x8f)
                                        || _pattern[_currentParticleIndex + 3] == 0x91
                                        || _pattern[_currentParticleIndex + 3] == 0x92
                                        || _pattern[_currentParticleIndex + 3] == 0x94
                                        || _pattern[_currentParticleIndex + 3] == 0x97
                                        || _pattern[_currentParticleIndex + 3] == 0x99
                                        || _pattern[_currentParticleIndex + 3] == 0x9b
                                        || _pattern[_currentParticleIndex + 3] == 0x9d
                                        || _pattern[_currentParticleIndex + 3] == 0x9f
                                        || _pattern[_currentParticleIndex + 3] == 0xa1
                                        || _pattern[_currentParticleIndex + 3] == 0xa2
                                        || _pattern[_currentParticleIndex + 3] == 0xa4
                                        || (_pattern[_currentParticleIndex + 3] >= 0xa7
                                            && _pattern[_currentParticleIndex + 3] <= 0xaa)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xac
                                            && _pattern[_currentParticleIndex + 3] <= 0xb2)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb4
                                            && _pattern[_currentParticleIndex + 3] <= 0xb7)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xb9
                                            && _pattern[_currentParticleIndex + 3] <= 0xbc)
                                        || _pattern[_currentParticleIndex + 3] == 0xbe
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xba) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x80
                                            && _pattern[_currentParticleIndex + 3] <= 0x89)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x8b
                                            && _pattern[_currentParticleIndex + 3] <= 0x9b)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xa1
                                            && _pattern[_currentParticleIndex + 3] <= 0xa3)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xa5
                                            && _pattern[_currentParticleIndex + 3] <= 0xa9)
                                        || (_pattern[_currentParticleIndex + 3] >= 0xab
                                            && _pattern[_currentParticleIndex + 3] <= 0xbb)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }
        return (false, 0);
    }

    function isPropertyTerminalPunctuation(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0x 21
        if (_pattern[_currentParticleIndex] == 0x21) {
            return (true, _currentParticleIndex);
        }

        // 0x 2c
        if (_pattern[_currentParticleIndex] == 0x2c) {
            return (true, _currentParticleIndex);
        }

        // 0x 2e
        if (_pattern[_currentParticleIndex] == 0x2e) {
            return (true, _currentParticleIndex);
        }

        // 0x 3a
        if (_pattern[_currentParticleIndex] == 0x3a) {
            return (true, _currentParticleIndex);
        }

        // 0x 3b
        if (_pattern[_currentParticleIndex] == 0x3b) {
            return (true, _currentParticleIndex);
        }

        // 0x 3f
        if (_pattern[_currentParticleIndex] == 0x3f) {
            return (true, _currentParticleIndex);
        }

        // 037E: 0x cd be
        if (_pattern[_currentParticleIndex] == 0xcd) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xbe) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0387: 0x ce 87
        if (_pattern[_currentParticleIndex] == 0xce) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x87) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0589: 0x d6 89
        if (_pattern[_currentParticleIndex] == 0xd6) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x89) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 05C3: 0x d7 83
        if (_pattern[_currentParticleIndex] == 0xd7) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x83) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 060C: 0x d8 8c
        // 061B: 0x d8 9b
        // 061D: 0x d8 9d ... 061F: 0x d8 9f
        if (_pattern[_currentParticleIndex] == 0xd8) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    _pattern[_currentParticleIndex + 1] == 0x8c || _pattern[_currentParticleIndex + 1] == 0x9b
                        || (_pattern[_currentParticleIndex + 1] >= 0x9d && _pattern[_currentParticleIndex + 1] <= 0x9f)
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 06D4: 0x db 94
        if (_pattern[_currentParticleIndex] == 0xdb) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x94) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0700: 0x dc 80
        // 070A: 0x dc 8a
        // 070C: 0x dc 8c
        if (_pattern[_currentParticleIndex] == 0xdc) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (
                    (_pattern[_currentParticleIndex + 1] >= 0x80 && _pattern[_currentParticleIndex + 1] <= 0x8a)
                        || _pattern[_currentParticleIndex + 1] >= 0x8c
                ) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 07F8: 0x df b8
        // 07F9: 0x df b9
        if (_pattern[_currentParticleIndex] == 0xdf) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] >= 0xb8 || _pattern[_currentParticleIndex + 1] >= 0xb9) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0830: 0x e0 a0 b0 ... 0835: 0x e0 a0 b5
        // 0837: 0x e0 a0 b7 ... 083E: 0x e0 a0 be
        // 085E: 0x e0 a1 9e
        // 0964: 0x e0 a5 a4 ... 0965: 0x e0 a5 a5
        // 0E5A: 0x e0 b9 9a ... 0E5B: 0x e0 b9 9b
        // 0F08: 0x e0 bc 88
        // 0F0D: 0x e0 bc 8d ... 0F12: 0x e0 bc 92
        if (_pattern[_currentParticleIndex] == 0xe0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0xb0 && _pattern[_currentParticleIndex + 2] <= 0xb5)
                                || (_pattern[_currentParticleIndex + 2] >= 0xb7
                                    && _pattern[_currentParticleIndex + 2] <= 0xbe)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9e) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa4 || _pattern[_currentParticleIndex + 2] == 0xa5)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9a || _pattern[_currentParticleIndex + 2] == 0x9b)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbc) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x88) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbc) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x8d && _pattern[_currentParticleIndex + 2] <= 0x92)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 104A: 0x e1 81 8a ... 104B: 0x e1 81 8b
        // 1361: 0x e1 8d a1 ... 1368: 0x e1 8d a8
        // 166E: 0x e1 99 ae
        // 16EB: 0x e1 9b ab ... 16ED: 0x e1 9b ad
        // 1735: 0x e1 9c b5 ... 1736: 0x e1 9c b6
        // 17D4: 0x e1 9f 94 ... 17D6: 0x e1 9f 96
        // 17DA: 0x e1 9f 9a
        // 1802: 0x e1 a0 82 ... 1805: 0x e1 a0 85
        // 1808: 0x e1 a0 88 ... 1809: 0x e1 a0 89
        // 1944: 0x e1 a5 84 ... 1945: 0x e1 a5 85
        // 1AA8: 0x e1 aa a8 ... 1AAB: 0x e1 aa ab
        // 1B4E: 0x e1 ad 8e ... 1B4F: 0x e1 ad 8f
        // 1B5A: 0x e1 ad 9a ... 1B5B: 0x e1 ad 9b
        // 1B5D: 0x e1 ad 9d ... 1B5F: 0x e1 ad 9f
        // 1B7D: 0x e1 ad bd ... 1B7F: 0x e1 ad bf
        // 1C3B: 0x e1 b0 bb ... 1C3F: 0x e1 b0 bf
        // 1C7E: 0x e1 b1 be ... 1C7F: 0x e1 b1 bf
        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8a || _pattern[_currentParticleIndex + 2] == 0x8b)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x8d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa1 && _pattern[_currentParticleIndex + 2] <= 0xa8)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x99) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xae) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9b) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xab || _pattern[_currentParticleIndex + 2] == 0xad)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9c) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb5 || _pattern[_currentParticleIndex + 2] == 0xb6)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9f) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x94 && _pattern[_currentParticleIndex + 2] <= 0x96)
                                || _pattern[_currentParticleIndex + 2] == 0x9a
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x82 && _pattern[_currentParticleIndex + 2] <= 0x85)
                                || (_pattern[_currentParticleIndex + 2] >= 0x88
                                    && _pattern[_currentParticleIndex + 2] <= 0x89)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa5) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x84 && _pattern[_currentParticleIndex + 2] <= 0x85)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xaa) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa8 && _pattern[_currentParticleIndex + 2] <= 0xab)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x8e && _pattern[_currentParticleIndex + 2] <= 0x8f)
                                || (_pattern[_currentParticleIndex + 2] >= 0x9a
                                    && _pattern[_currentParticleIndex + 2] <= 0x9b)
                                || (_pattern[_currentParticleIndex + 2] >= 0x9d
                                    && _pattern[_currentParticleIndex + 2] <= 0x9f)
                                || (_pattern[_currentParticleIndex + 2] >= 0xbd
                                    && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xbb && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xbe && _pattern[_currentParticleIndex + 2] <= 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 2024: 0x e2 80 a4
        // 203C: 0x e2 80 bc ... 203D: 0x e2 80 bd
        // 2047: 0x e2 81 87 ... 2049: 0x e2 81 89
        // 2CF9: 0x e2 b3 b9 ... 2CFB: 0x e2 b3 bb
        // 2E2E: 0x e2 b8 ae
        // 2E3C: 0x e2 b8 bc
        // 2E41: 0x e2 b9 81
        // 2E4C: 0x e2 b9 8c
        // 2E4E: 0x e2 b9 8e ... 2E4F: 0x e2 b9 8f
        // 2E53: 0x e2 b9 93 ... 2E54: 0x e2 b9 94
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0xa4 || _pattern[_currentParticleIndex + 2] == 0xbc
                                || _pattern[_currentParticleIndex + 2] == 0xbd
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x87 && _pattern[_currentParticleIndex + 2] <= 0x89)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb9 && _pattern[_currentParticleIndex + 2] <= 0xbb)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xae || _pattern[_currentParticleIndex + 2] == 0xbc)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x81 || _pattern[_currentParticleIndex + 2] == 0x8c
                                || _pattern[_currentParticleIndex + 2] == 0x8e
                                || _pattern[_currentParticleIndex + 2] == 0x8f
                                || _pattern[_currentParticleIndex + 2] == 0x93
                                || _pattern[_currentParticleIndex + 2] == 0x94
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 3001: 0x e3 80 81 ... 3002: 0x e3 80 82
        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x81 || _pattern[_currentParticleIndex + 2] == 0x82)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // A4FE: 0x ea 93 be ... A4FF: 0x ea 93 bf
        // A60D: 0x ea 98 8d ... A60F: 0x ea 98 8f
        // A6F3: 0x ea 9b b3 ... A6F7: 0x ea 9b b7
        // A876: 0x ea a1 b6 ... A877: 0x ea a1 b7
        // A8CE: 0x ea a3 8e ... A8CF: 0x ea a3 8f
        // A92F: 0x ea a4 af
        // A9C7: 0x ea a7 87 ... A9C9: 0x ea a7 89
        // AA5D: 0x ea a9 9d ... AA5F: 0x ea a9 9f
        // AADF: 0x ea ab 9f
        // AAF0: 0x ea ab b0 ... AAF1: 0x ea ab b1
        // ABEB: 0x ea af ab
        if (_pattern[_currentParticleIndex] == 0xea) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x93) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbe || _pattern[_currentParticleIndex + 2] == 0xbf)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x98) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x8d && _pattern[_currentParticleIndex + 2] <= 0x8f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x9b) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xb3 && _pattern[_currentParticleIndex + 2] <= 0xb7)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa1) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb6 || _pattern[_currentParticleIndex + 2] == 0xb7)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa3) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8e || _pattern[_currentParticleIndex + 2] == 0x8f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa4) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xaf) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa7) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x87 && _pattern[_currentParticleIndex + 2] <= 0x89)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x9d && _pattern[_currentParticleIndex + 2] <= 0x9f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x9f || _pattern[_currentParticleIndex + 2] == 0xb0
                                || _pattern[_currentParticleIndex + 2] == 0xb1
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xaf) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbf) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // FE12: 0x ef b8 92
        // FE15: 0x ef b8 95 ... FE16: 0x ef b8 96
        // FE50: 0x ef b9 90 ... FE52: 0x ef b9 92
        // FE54: 0x ef b9 94 ... FE57: 0x ef b9 97
        // FF01: 0x ef bc 81
        // FF0C: 0x ef bc 8c
        // FF0E: 0x ef bc 8e
        // FF1A: 0x ef bc 9a ... FF1B: 0x ef bc 9b
        // FF1F: 0x ef bc 9f
        // FF61: 0x ef bd a1
        // FF64: 0x ef bd a4
        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x92 || _pattern[_currentParticleIndex + 2] == 0x95
                                || _pattern[_currentParticleIndex + 2] == 0x96
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            (_pattern[_currentParticleIndex + 2] >= 0x90 && _pattern[_currentParticleIndex + 2] <= 0x92)
                                || (_pattern[_currentParticleIndex + 2] >= 0x94
                                    && _pattern[_currentParticleIndex + 2] <= 0x97)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbc) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x81 || _pattern[_currentParticleIndex + 2] == 0x8c
                                || _pattern[_currentParticleIndex + 2] == 0x8e
                                || _pattern[_currentParticleIndex + 2] == 0x9a
                                || _pattern[_currentParticleIndex + 2] == 0x9b
                                || _pattern[_currentParticleIndex + 2] == 0x9f
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbd) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa1 || _pattern[_currentParticleIndex + 2] == 0xa4)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 1039F: 0x f0 90 8e 9f
        // 103D0: 0x f0 90 8f 90
        // 10857: 0x f0 90 a1 97
        // 1091F: 0x f0 90 a4 9f
        // 10A56: 0x f0 90 a9 96 ... 10A57: 0x f0 90 a9 97
        // 10AF0: 0x f0 90 ab b0 ... 10AF5: 0x f0 90 ab b5
        // 10B3A: 0x f0 90 ac ba ... 10B3F: 0x f0 90 ac bf
        // 10B99: 0x f0 90 ae 99 ... 10B9C: 0x f0 90 ae 9c
        // 10F55: 0x f0 90 bd 95 ... 10F59: 0x f0 90 bd 99
        // 10F86: 0x f0 90 be 86 ... 10F89: 0x f0 90 be 89
        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x90) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8e) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x9f) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x8f) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x90) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                        if (_pattern[_currentParticleIndex + 2] == 0xa1) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x97) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xa4) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x9f) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xa9) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x96
                                        || _pattern[_currentParticleIndex + 3] == 0x97
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xab) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb0
                                        && _pattern[_currentParticleIndex + 3] <= 0xb5
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xac) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xba
                                        && _pattern[_currentParticleIndex + 3] <= 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xae) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x99
                                        && _pattern[_currentParticleIndex + 3] <= 0x9c
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xbd) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x95
                                        && _pattern[_currentParticleIndex + 3] <= 0x99
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xbe) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x86
                                        && _pattern[_currentParticleIndex + 3] <= 0x89
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // 11047: 0x f0 91 81 87 ... 1104D: 0x f0 91 81 8d
                // 110BE: 0x f0 91 82 be ... 110C1: 0x f0 91 83 81 (0x f0 91 82 be, 0x f0 91 82 bf, 0x f0 91 83 80, 0x f0 91 83 81)
                // 11141: 0x f0 91 85 81 ... 11143: 0x f0 91 85 83
                // 111C5: 0x f0 91 87 85 ... 111C6: 0x f0 91 87 86
                // 111CD: 0x f0 91 87 8d
                // 111DE: 0x f0 91 87 9e ... 111DF: 0x f0 91 87 9f
                // 11238: 0x f0 91 88 b8 ... 1123C: 0x f0 91 88 bc
                // 112A9: 0x f0 91 8a a9
                // 113D4: 0x f0 91 8f 94 ... 113D5: 0x f0 91 8f 95
                // 1144B: 0x f0 91 91 8b ... 1144D: 0x f0 91 91 8d
                // 1145A: 0x f0 91 91 9a ... 1145B: 0x f0 91 91 9b
                // 115C2: 0x f0 91 97 82 ... 115C5: 0x f0 91 97 85
                // 115C9: 0x f0 91 97 89 ... 115D7: 0x f0 91 97 97
                // 11641: 0x f0 91 99 81 ... 11642: 0x f0 91 99 82
                // 1173C: 0x f0 91 9c bc ... 1173E: 0x f0 91 9c be
                // 11944: 0x f0 91 a5 84
                // 11946: 0x f0 91 a5 86
                // 11A42: 0x f0 91 a9 82 ... 11A43: 0x f0 91 a9 83
                // 11A9B: 0x f0 91 aa 9b ... 11A9C: 0x f0 91 aa 9c
                // 11AA1: 0x f0 91 aa a1 ... 11AA2: 0x f0 91 aa a2
                // 11C41: 0x f0 91 b1 81 ... 11C43: 0x f0 91 b1 83
                // 11C71: 0x f0 91 b1 b1
                // 11EF7: 0x f0 91 bb b7 ... 11EF8: 0x f0 91 bb b8
                // 11F43: 0x f0 91 bd 83 ... 11F44: 0x f0 91 bd 84
                if (_pattern[_currentParticleIndex + 1] == 0x91) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x81) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x87
                                        && _pattern[_currentParticleIndex + 3] <= 0x8d
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x82) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xbe
                                        || _pattern[_currentParticleIndex + 3] == 0xbf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x83) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x80
                                        || _pattern[_currentParticleIndex + 3] == 0x81
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x85) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x81
                                        && _pattern[_currentParticleIndex + 3] <= 0x83
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x87) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x85
                                        || _pattern[_currentParticleIndex + 3] == 0x86
                                        || _pattern[_currentParticleIndex + 3] == 0x8d
                                        || _pattern[_currentParticleIndex + 3] == 0x9e
                                        || _pattern[_currentParticleIndex + 3] == 0x9f
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x87) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x85
                                        || _pattern[_currentParticleIndex + 3] == 0x86
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x88) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb8
                                        && _pattern[_currentParticleIndex + 3] <= 0xbc
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x8a) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xa9) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x8f) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x94
                                        || _pattern[_currentParticleIndex + 3] == 0x95
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x91) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x8b
                                            && _pattern[_currentParticleIndex + 3] <= 0x8d)
                                        || _pattern[_currentParticleIndex + 3] == 0x9a
                                        || _pattern[_currentParticleIndex + 3] == 0x9b
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x82
                                            && _pattern[_currentParticleIndex + 3] <= 0x85)
                                        || (_pattern[_currentParticleIndex + 3] >= 0x89
                                            && _pattern[_currentParticleIndex + 3] <= 0x97)
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x99) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x81
                                        || _pattern[_currentParticleIndex + 3] == 0x82
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0x9c) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xbc
                                        && _pattern[_currentParticleIndex + 3] <= 0xbe
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xa5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x84
                                        || _pattern[_currentParticleIndex + 3] == 0x86
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xa9) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x82
                                        || _pattern[_currentParticleIndex + 3] == 0x83
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xaa) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x9b
                                        || _pattern[_currentParticleIndex + 3] == 0x9c
                                        || _pattern[_currentParticleIndex + 3] == 0xa1
                                        || _pattern[_currentParticleIndex + 3] == 0xa2
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xb1) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    (_pattern[_currentParticleIndex + 3] >= 0x81
                                            && _pattern[_currentParticleIndex + 3] <= 0x83)
                                        || _pattern[_currentParticleIndex + 3] == 0xb1
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xbb) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xb7
                                        || _pattern[_currentParticleIndex + 3] == 0xb8
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xbd) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x83
                                        || _pattern[_currentParticleIndex + 3] == 0x84
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // 12470: 0x f0 92 91 b0 ... 12474: 0x f0 92 91 b4
                if (_pattern[_currentParticleIndex + 1] == 0x92) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x91) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb0
                                        && _pattern[_currentParticleIndex + 3] <= 0xb4
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // 16A6E: 0x f0 96 a9 ae ... 16A6F: 0x f0 96 a9 af
                // 16AF5: 0x f0 96 ab b5
                // 16B37: 0x f0 96 ac b7 ... 16B39: 0x f0 96 ac b9
                // 16B44: 0x f0 96 ad 84
                // 16D6E: 0x f0 96 b5 ae ... 16D6F: 0x f0 96 b5 af
                // 16E97: 0x f0 96 ba 97 ... 16E98: 0x f0 96 ba 98
                if (_pattern[_currentParticleIndex + 1] == 0x96) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa9) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xae
                                        || _pattern[_currentParticleIndex + 3] == 0xaf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xab) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xb5) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xac) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0xb7
                                        && _pattern[_currentParticleIndex + 3] <= 0xb9
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xad) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x84) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xb5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0xae
                                        || _pattern[_currentParticleIndex + 3] == 0xaf
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xba) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] == 0x97
                                        || _pattern[_currentParticleIndex + 3] == 0x98
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // 1BC9F: 0x f0 9b b2 9f
                if (_pattern[_currentParticleIndex + 1] == 0x9b) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb2) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0x9f) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }

                // 1DA87: 0x f0 9d aa 87 ... 1DA8A: 0x f0 9d aa 8a
                if (_pattern[_currentParticleIndex + 1] == 0x9d) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xaa) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (
                                    _pattern[_currentParticleIndex + 3] >= 0x87
                                        && _pattern[_currentParticleIndex + 3] <= 0x8a
                                ) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyQuotationMark(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0x 22
        if (_pattern[_currentParticleIndex] == 0x22) {
            return (true, _currentParticleIndex);
        }

        // 0x 27
        if (_pattern[_currentParticleIndex] == 0x27) {
            return (true, _currentParticleIndex);
        }

        // 0x c2 ab
        // 0x c2 bb
        if (_pattern[_currentParticleIndex] == 0xc2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xab) {
                    return (true, _currentParticleIndex + 1);
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbb) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0x e2 80 98
        // 0x e2 80 99
        // 0x e2 80 9a
        // 0x e2 80 9b
        // 0x e2 80 9c
        // 0x e2 80 9d
        // 0x e2 80 9e
        // 0x e2 80 9f
        // 0x e2 80 b9
        // 0x e2 80 ba
        // 0x e2 b9 82
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x98 && _pattern[_currentParticleIndex + 2] <= 0x9f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xb9 || _pattern[_currentParticleIndex + 2] == 0xba)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x82) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 0x e3 80 8c
        // 0x e3 80 8d
        // 0x e3 80 8e
        // 0x e3 80 8f
        // 0x e3 80 9d
        // 0x e3 80 9e
        // 0x e3 80 9f
        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x8c && _pattern[_currentParticleIndex + 2] <= 0x8f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }

                        if (_pattern[_currentParticleIndex + 2] >= 0x9d && _pattern[_currentParticleIndex + 2] <= 0x9f)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 0x ef b9 81
        // 0x ef b9 82
        // 0x ef b9 83
        // 0x ef b9 84
        // 0x ef bc 82
        // 0x ef bc 87
        // 0x ef bd a2
        // 0x ef bd a3
        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x81 && _pattern[_currentParticleIndex + 2] <= 0x84)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbc) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x82 || _pattern[_currentParticleIndex + 2] == 0x87)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbd) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa2 || _pattern[_currentParticleIndex + 2] == 0xa3)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyHyphen(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0x 2d
        if (_pattern[_currentParticleIndex] == 0x2d) {
            return (true, _currentParticleIndex);
        }

        // 0x c2 ad
        if (_pattern[_currentParticleIndex] == 0xc2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xad) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0x d6 8a
        if (_pattern[_currentParticleIndex] == 0xd6) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x8a) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0x e1 a0 86
        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x86) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 0x e2 80 90
        // 0x e2 b8 97
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x90) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x97) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 0x e3 83 bb
        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x83) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xbb) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 0x ef b9 a3
        // 0x ef bc 8d
        // 0x ef bd a5
        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa3) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbc) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbd) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa5) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyDash(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        // 0x 2d
        if (_pattern[_currentParticleIndex] == 0x2d) {
            return (true, _currentParticleIndex);
        }

        // 0x d6 8a
        // 0x d6 be
        if (_pattern[_currentParticleIndex] == 0xd6) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x8a || _pattern[_currentParticleIndex + 1] == 0xbe) {
                    return (true, _currentParticleIndex + 1);
                }
            }
        }

        // 0x e1 90 80
        // 0x e1 a0 86
        if (_pattern[_currentParticleIndex] == 0xe1) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x90) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x80) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xa0) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x86) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 0x e2 80 90 ... 95
        // 0x e2 81 93
        // 0x e2 81 bb
        // 0x e2 82 8b
        // 0x e2 88 92
        // 0x e2 b8 97
        // 0x e2 b8 9a
        // 0x e2 b8 ba
        // 0x e2 b8 bb
        // 0x e2 b9 80
        // 0x e2 b9 9d
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0x90 && _pattern[_currentParticleIndex + 2] <= 0x95)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x93 || _pattern[_currentParticleIndex + 1] == 0xbb)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x82) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8b) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x88) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x92) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x97 || _pattern[_currentParticleIndex + 2] == 0x9a
                                || _pattern[_currentParticleIndex + 2] == 0xba
                                || _pattern[_currentParticleIndex + 2] == 0xbb
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x80 || _pattern[_currentParticleIndex + 2] == 0x9d)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 0x e3 80 9c
        // 0x e3 80 b0
        // 0x e3 82 a0
        if (_pattern[_currentParticleIndex] == 0xe3) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x9c || _pattern[_currentParticleIndex + 2] == 0xb0)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x82) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xa0) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 0x ef b8 b1
        // 0x ef b8 b2
        // 0x ef b9 98
        // 0x ef b9 a3
        // 0x ef bc 8d
        if (_pattern[_currentParticleIndex] == 0xef) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0xb8) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb1 || _pattern[_currentParticleIndex + 2] == 0xb2)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xb9) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x98 || _pattern[_currentParticleIndex + 2] == 0xa3)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0xbc) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8d) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        // 0x f0 90 b5 ae
        // 0x f0 90 ba ad
        if (_pattern[_currentParticleIndex] == 0xf0) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x90) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0xb5) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xae) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }

                        if (_pattern[_currentParticleIndex + 2] == 0xba) {
                            if (_currentParticleIndex + 3 < _pattern.length) {
                                if (_pattern[_currentParticleIndex + 3] == 0xad) {
                                    return (true, _currentParticleIndex + 3);
                                }
                            }
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyJoinControl(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0x e2 80 8c
        // 0x e2 80 8d
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] == 0x8c || _pattern[_currentParticleIndex + 2] == 0x8d)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyBidiControl(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        // 0x d8 9c
        if (_pattern[_currentParticleIndex] == 0xd8) {
            if (_currentParticleIndex + 1 < _pattern.length && _pattern[_currentParticleIndex + 1] == 0x9c) {
                return (true, _currentParticleIndex + 1);
            }
        }

        // 0x e2 80 8e
        // 0x e2 80 8f
        // 0x e2 80 aa ... ae
        // 0x e2 81 a6 ... a9
        if (_pattern[_currentParticleIndex] == 0xe2) {
            if (_currentParticleIndex + 1 < _pattern.length) {
                if (_pattern[_currentParticleIndex + 1] == 0x80) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (
                            _pattern[_currentParticleIndex + 2] == 0x8e || _pattern[_currentParticleIndex + 2] == 0x8f
                                || (_pattern[_currentParticleIndex + 2] >= 0xaa
                                    && _pattern[_currentParticleIndex + 2] <= 0xae)
                        ) {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }

                if (_pattern[_currentParticleIndex + 1] == 0x81) {
                    if (_currentParticleIndex + 2 < _pattern.length) {
                        if (_pattern[_currentParticleIndex + 2] >= 0xa6 && _pattern[_currentParticleIndex + 2] <= 0xa9)
                        {
                            return (true, _currentParticleIndex + 2);
                        }
                    }
                }
            }
        }

        return (false, 0);
    }

    function isPropertyWhiteSpace(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        bool flag;
        uint256 lastIndex;

        (flag, lastIndex) = commonWhiteSpaces(_pattern, _currentParticleIndex, false);

        if (!flag) {
            (flag, lastIndex) = propertyExcWhiteSpace(_pattern, _currentParticleIndex);
        }

        return (flag, lastIndex);
    }

    function isWhitespace(bytes memory _pattern, uint256 _currentParticleIndex, bool _negation)
        private
        pure
        returns (bool, uint256)
    {
        bool flag;
        uint256 lastIndex;
        (flag, lastIndex) = commonWhiteSpaces(_pattern, _currentParticleIndex, _negation);

        if (!flag) {
            (flag, lastIndex) = legacyWhiteSpace(_pattern, _currentParticleIndex, _negation);
        }

        return (flag, lastIndex);
    }

    function propertyExcWhiteSpace(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        if (
            _pattern[_currentParticleIndex] == 0xc2
                && (_currentParticleIndex + 1 < _pattern.length && _pattern[_currentParticleIndex + 1] == 0x85)
        ) {
            return (true, _currentParticleIndex + 1);
        }
        return (false, 0);
    }

    function commonWhiteSpaces(bytes memory _pattern, uint256 _currentParticleIndex, bool _negation)
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
                        && (_pattern[_currentParticleIndex + 2] == 0xa8
                            || _pattern[_currentParticleIndex + 2] == 0xa9
                            || _pattern[_currentParticleIndex + 2] == 0xaf
                            || (_pattern[_currentParticleIndex + 2] >= 0x80
                                && _pattern[_currentParticleIndex + 2] <= 0x8a))
                ) {
                    flag = true;
                    lastIndex = _currentParticleIndex + 2;
                }

                if (
                    _currentParticleIndex + 2 < _pattern.length && _pattern[_currentParticleIndex + 1] == 0x81
                        && (_pattern[_currentParticleIndex + 2] == 0x9f)
                ) {
                    flag = true;
                    lastIndex = _currentParticleIndex + 2;
                }
            }

            if (_targetChar == 0xe1) {
                if (
                    _currentParticleIndex + 2 < _pattern.length && _pattern[_currentParticleIndex + 1] == 0x9a
                        && (_pattern[_currentParticleIndex + 2] == 0x80)
                ) {
                    flag = true;
                    lastIndex = _currentParticleIndex + 2;
                }
            }

            if (_targetChar == 0xe3) {
                if (
                    _currentParticleIndex + 2 < _pattern.length && _pattern[_currentParticleIndex + 1] == 0x80
                        && (_pattern[_currentParticleIndex + 2] == 0x80)
                ) {
                    flag = true;
                    lastIndex = _currentParticleIndex + 2;
                }
            }
        }

        if (_negation && !flag) {
            return (true, _currentParticleIndex);
        }

        if (!_negation && flag) {
            return (true, lastIndex);
        }

        return (false, 0);
    }

    function legacyWhiteSpace(bytes memory _pattern, uint256 _currentParticleIndex, bool _negation)
        private
        pure
        returns (bool, uint256)
    {
        // @info: legacy unicode code point for backward compatibility
        bool flag;
        uint256 lastIndex;

        if (_pattern[_currentParticleIndex] == 0xef) {
            if (
                _currentParticleIndex + 2 < _pattern.length && _pattern[_currentParticleIndex + 1] == 0xbb
                    && (_pattern[_currentParticleIndex + 2] == 0xbf)
            ) {
                flag = true;
                lastIndex = _currentParticleIndex + 2;
            }
        }

        if (_negation && !flag) {
            return (true, _currentParticleIndex);
        }

        if (!_negation && flag) {
            return (true, lastIndex);
        }
        return (false, 0);
    }

    function unicodeHexToUtf8Hex(bytes memory _unicodeHex) internal pure returns (bytes memory) {
        // _unicodeHex: "\u{XXXXXX}"
        (bool isValid,) = validateBackslash_u_UnicodeEscape(_unicodeHex, 0);

        if (!isValid) {
            string memory errorMsg = string(abi.encodePacked("SyntaxError: Invalid Unicode codepoint: ", _unicodeHex));
            revert(errorMsg);
        }

        bytes memory binary;
        for (uint256 i = 3; i < _unicodeHex.length - 1; i++) {
            bytes memory bin = hexToBinary(_unicodeHex[i], 4, true);
            binary = abi.encodePacked(binary, bin);
        }

        uint256 i;
        while (true) {
            if (binary[i] == 0x30) {
                binary = trimString(binary, i + 1, -1);
            } else {
                break;
            }
        }

        if (binary.length <= 7) {
            return binToHex(binary);
        } else if (binary.length <= 11) {
            bytes memory lastByte = trimString(binary, binary.length - 6, -1);
            lastByte = abi.encodePacked("10", lastByte);
            bytes memory msbByte = trimString(binary, 0, int256(binary.length - 7));
            msbByte = msbByte.length % 5 == 4
                ? abi.encodePacked("1100", msbByte)
                : msbByte.length % 5 == 3
                    ? abi.encodePacked("11000", msbByte)
                    : msbByte.length % 5 == 2
                        ? abi.encodePacked("110000", msbByte)
                        : msbByte.length % 5 == 1
                            ? abi.encodePacked("1100000", msbByte)
                            : abi.encodePacked("110", msbByte);
            bytes memory utf8HexBytes = abi.encodePacked(msbByte, lastByte);
            return binaryToUtf8Hex(utf8HexBytes);
        } else if (binary.length <= 16) {
            if (binary.length < 13) {
                binary = abi.encodePacked("0", binary);
            }
            bytes memory lastByte = trimString(binary, binary.length - 6, -1);
            lastByte = abi.encodePacked("10", lastByte);
            bytes memory secondLastByte = trimString(binary, binary.length - 12, int256(binary.length - 7));
            secondLastByte = abi.encodePacked("10", secondLastByte);
            bytes memory msbByte = trimString(binary, 0, int256(binary.length - 13));
            msbByte = msbByte.length % 4 == 3
                ? abi.encodePacked("11100", msbByte)
                : msbByte.length % 4 == 2
                    ? abi.encodePacked("111000", msbByte)
                    : msbByte.length % 4 == 1 ? abi.encodePacked("1110000", msbByte) : abi.encodePacked("1110", msbByte);
            bytes memory utf8HexBytes = abi.encodePacked(msbByte, secondLastByte, lastByte);
            return binaryToUtf8Hex(utf8HexBytes);
        } else if (binary.length <= 21) {
            if (binary.length == 17) {
                binary = abi.encodePacked("00", binary);
            } else if (binary.length == 18) {
                binary = abi.encodePacked("0", binary);
            }
            bytes memory lastByte = trimString(binary, binary.length - 6, -1);
            lastByte = abi.encodePacked("10", lastByte);
            bytes memory secondLastByte = trimString(binary, binary.length - 12, int256(binary.length - 7));
            secondLastByte = abi.encodePacked("10", secondLastByte);
            bytes memory thirdLastByte = trimString(binary, binary.length - 18, int256(binary.length - 13));
            thirdLastByte = abi.encodePacked("10", thirdLastByte);
            bytes memory msbByte = trimString(binary, 0, int256(binary.length - 19));
            msbByte = msbByte.length % 3 == 2
                ? abi.encodePacked("111100", msbByte)
                : msbByte.length % 3 == 1 ? abi.encodePacked("1111000", msbByte) : abi.encodePacked("11110", msbByte);

            bytes memory utf8HexBytes = abi.encodePacked(msbByte, thirdLastByte, secondLastByte, lastByte);
            return binaryToUtf8Hex(utf8HexBytes);
        }
    }

    function binaryToUtf8Hex(bytes memory binary) private pure returns (bytes memory) {
        bytes memory utf8Hex;

        for (uint256 i = 0; i < binary.length; i += 8) {
            bytes memory binChunk = trimString(binary, i, int256(i + 7));
            utf8Hex = abi.encodePacked(utf8Hex, binToHex(binChunk));
        }

        return utf8Hex;
    }

    function utf8HexToUnicodeHex(bytes memory _utf8Hex) internal pure returns (bytes memory) {
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
        bytes memory byte1Binary = stripPrefixCodes(uint8(_utf8Hex[0]), 2, true);
        bytes memory byte2Binary = stripPrefixCodes(uint8(_utf8Hex[1]), 2, false);
        return concatenate2BytesBinary(byte1Binary, byte2Binary);
    }

    function threeBytesUtf8HexDecode(bytes memory _utf8Hex) private pure returns (bytes memory) {
        bytes memory byte1Binary = stripPrefixCodes(uint8(_utf8Hex[0]), 3, true);
        bytes memory byte2Binary = stripPrefixCodes(uint8(_utf8Hex[1]), 3, false);
        bytes memory byte3Binary = stripPrefixCodes(uint8(_utf8Hex[2]), 3, false);
        return concatenate3BytesBinary(byte1Binary, byte2Binary, byte3Binary);
    }

    function fourBytesUtf8HexDecode(bytes memory _utf8Hex) private pure returns (bytes memory) {
        bytes memory byte1Binary = stripPrefixCodes(uint8(_utf8Hex[0]), 4, true);
        bytes memory byte2Binary = stripPrefixCodes(uint8(_utf8Hex[1]), 4, false);
        bytes memory byte3Binary = stripPrefixCodes(uint8(_utf8Hex[2]), 4, false);
        bytes memory byte4Binary = stripPrefixCodes(uint8(_utf8Hex[3]), 4, false);
        return concatenate4BytesBinary(byte1Binary, byte2Binary, byte3Binary, byte4Binary);
    }

    function concatenate4BytesBinary(
        bytes memory byte1Binary,
        bytes memory byte2Binary,
        bytes memory byte3Binary,
        bytes memory byte4Binary
    ) private pure returns (bytes memory) {
        return concatenateBinaries(abi.encodePacked(byte1Binary, byte2Binary, byte3Binary, byte4Binary));
    }

    function concatenate3BytesBinary(bytes memory byte1Binary, bytes memory byte2Binary, bytes memory byte3Binary)
        private
        pure
        returns (bytes memory)
    {
        return concatenateBinaries(abi.encodePacked(byte1Binary, byte2Binary, byte3Binary));
    }

    function concatenate2BytesBinary(bytes memory byte1Binary, bytes memory byte2Binary)
        private
        pure
        returns (bytes memory)
    {
        return concatenateBinaries(abi.encodePacked(byte1Binary, byte2Binary));
    }

    function concatenateBinaries(bytes memory fullBinary) private pure returns (bytes memory) {
        uint256 bl = fullBinary.length;
        fullBinary = abi.encodePacked(
            bl % 8 == 1
                ? "0000000"
                : bl % 8 == 2
                    ? "000000"
                    : bl % 8 == 3
                        ? "00000"
                        : bl % 8 == 4 ? "0000" : bl % 8 == 5 ? "000" : bl % 8 == 6 ? "00" : bl % 8 == 7 ? "0" : "",
            fullBinary
        );

        bytes memory decodedHex;
        for (uint256 i = 0; i < fullBinary.length; i += 8) {
            bytes memory byteHex = binToHex(trimString(fullBinary, i, int256(i + 7)));
            decodedHex = abi.encodePacked(decodedHex, byteHex);
        }

        return decodedHex;
    }

    function binToHex(bytes memory _bin) private pure returns (bytes memory) {
        uint8 decEqv;
        bytes memory hexEqv;
        uint256 binLen = _bin.length;
        for (uint8 i = 0; i < binLen; i++) {
            // @BUG: precedence bug: uint8(2 ** (binLen - 1) - i)
            // @status: fixed uint8(2 ** ((binLen - 1) - i))
            decEqv += _bin[i] == 0x30 ? 0 : uint8(2 ** ((binLen - 1) - i));
        }
        bytes memory tempHexEqv = abi.encodePacked(decEqv);
        hexEqv = abi.encodePacked(tempHexEqv[tempHexEqv.length - 1]);

        return hexEqv;
    }

    function stripPrefixCodes(uint8 decimal, uint8 markerBytes, bool isLeadingByte)
        private
        pure
        returns (bytes memory)
    {
        bytes memory strippedBinary;
        uint8 usableBits = isLeadingByte ? 8 - (markerBytes + 1) : 6;
        for (uint8 i = 0; i < usableBits; i++) {
            strippedBinary =
                decimal % 2 == 0 ? abi.encodePacked("0", strippedBinary) : abi.encodePacked("1", strippedBinary);
            decimal = decimal >> 1;
        }
        return strippedBinary;
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
            // console2.log("departed through here...");
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
        // console2.log("departed through here also...");
        if (_pattern[_currentParticleIndex] == 0xf0) {
            // console2.log("yeah that's came true: ", _pattern[_currentParticleIndex] == 0xf0);
            // console2.logBytes1(_pattern[_currentParticleIndex]);
            (bool flag, uint256 lastMatchedParticleIndex) = secondByte90bfValidator(_pattern, _currentParticleIndex);

            if (flag) {
                (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                if (flag) {
                    (flag, lastMatchedParticleIndex) = lastByte80bfValidator(_pattern, lastMatchedParticleIndex);
                    if (flag) {
                        // console2.log("fulfilling all requirements...!");
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

    function isRangeLiteral(bytes memory _pattern, uint256 _currentParticleIndex, bytes1 _patternFlag)
        private
        pure
        returns (bool, uint256)
    {
        bool isValid;
        uint256 lastMatchedIndex;

        (isValid, lastMatchedIndex) = isCurlyBraceOfRangeEscape(_pattern, _currentParticleIndex);

        if (isValid) {
            if (uint8(_patternFlag) == SMALL_u) {
                string memory errorMsg = string(
                    abi.encodePacked(
                        "SyntaxError: Invalid regular expression: /", _pattern, "/u: Lone quantifier brackets"
                    )
                );
                revert(errorMsg);
            }

            return (true, lastMatchedIndex);
        }

        return (false, 0);
    }

    function isCurlyBraceOfRangeEscape(bytes memory _pattern, uint256 _currentParticleIndex)
        private
        pure
        returns (bool, uint256)
    {
        uint8 _targetChar = uint8(_pattern[_currentParticleIndex]);
        uint256 patternLastIndex = _pattern.length - 1;

        if (_targetChar == OPEN_CURLY_BRACE) {
            if (_currentParticleIndex == patternLastIndex) {
                return (true, _currentParticleIndex);
            }

            if (_currentParticleIndex + 1 <= patternLastIndex) {
                if (
                    uint8(_pattern[_currentParticleIndex + 1]) == CLOSE_CURLY_BRACE
                        || uint8(_pattern[_currentParticleIndex + 1]) == COMMA_SIGN
                        || !isDigit(_pattern[_currentParticleIndex + 1], false)
                ) {
                    return (true, _currentParticleIndex);
                }

                bool commaFlag;

                for (uint256 i = _currentParticleIndex + 2; i <= patternLastIndex; i++) {
                    if (isDigit(_pattern[i], false)) {
                        continue;
                    }

                    if (uint8(_pattern[i]) == COMMA_SIGN && !commaFlag) {
                        commaFlag = true;
                        continue;
                    }

                    if (uint8(_pattern[i]) == COMMA_SIGN && commaFlag) {
                        return (true, _currentParticleIndex);
                    }

                    if (uint8(_pattern[i]) == CLOSE_CURLY_BRACE) {
                        return (false, 0);
                    }

                    return (true, _currentParticleIndex);
                }
            }

            return (true, _currentParticleIndex);
        }

        if (_targetChar == CLOSE_CURLY_BRACE) {
            return (true, _currentParticleIndex);
        }

        return (false, 0);
    }

    function isEscapeLiteral(
        bytes memory _pattern,
        uint256 _currentParticleIndex,
        bytes1 _patternFlag,
        bool fromCharacterClass
    ) private pure returns (bool, uint256) {
        if (uint8(_pattern[_currentParticleIndex]) == BACK_SLASH && _currentParticleIndex < _pattern.length - 1) {
            uint8 _nextChar = uint8(_pattern[_currentParticleIndex + 1]);
            bool isValid;
            uint256 lastMatchedIndex;

            if (_nextChar == uint8(abi.encodePacked("u")[0])) {
                if (_currentParticleIndex + 2 <= _pattern.length - 1) {
                    if (
                        uint8(_patternFlag) != SMALL_u && uint8(_pattern[_currentParticleIndex + 2]) == OPEN_CURLY_BRACE
                    ) {
                        return (true, _currentParticleIndex + 1);
                    }
                }

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
                    if (uint8(_patternFlag) == SMALL_u) {
                        string memory errorMsg = string(
                            abi.encodePacked(
                                "SyntaxError: Invalid regular expression: /", _pattern, "/u: Invalid Unicode Escape"
                            )
                        );
                        revert(errorMsg);
                    }

                    return (true, _currentParticleIndex + 1);
                }
            }

            if (_nextChar == uint8(abi.encodePacked("k")[0])) {
                // @BUG: no support for escape in character class with u flag mode
                (isValid, lastMatchedIndex) = validateBackslash_k_groupEscape(_pattern, _currentParticleIndex);

                if (isValid) {
                    return (true, lastMatchedIndex);
                }
            }

            if (_nextChar == uint8(abi.encodePacked("p")[0]) || _nextChar == uint8(abi.encodePacked("P")[0])) {
                if (uint8(_patternFlag) != SMALL_u) {
                    return (true, _currentParticleIndex + 1);
                }

                (isValid, lastMatchedIndex) =
                    validateBackslash_p_propertyNameEscape(_pattern, _currentParticleIndex, fromCharacterClass);

                if (isValid) {
                    return (true, lastMatchedIndex);
                }
            }

            if (isDigit(_pattern[_currentParticleIndex + 1], false)) {
                // @BUG: octal validation functionality missing
                // @status: resolved
                (isValid, lastMatchedIndex) = validateBackslash_octal_digit(_pattern, _currentParticleIndex + 1);

                if (isValid) {
                    return (true, lastMatchedIndex);
                }

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

    function validateBackslash_octal_digit(bytes memory _pattern, uint256 _indexToStartFrom)
        private
        pure
        returns (bool, uint256)
    {
        uint256 patternLastIndex = _pattern.length - 1;
        bool flag;

        if (
            uint8(_pattern[_indexToStartFrom]) >= uint8(abi.encodePacked("0")[0])
                && uint8(_pattern[_indexToStartFrom]) <= uint8(abi.encodePacked("7")[0])
        ) {
            flag = true;
        }

        if (flag) {
            if (
                _indexToStartFrom + 1 <= patternLastIndex
                    && uint8(_pattern[_indexToStartFrom + 1]) >= uint8(abi.encodePacked("0")[0])
                    && uint8(_pattern[_indexToStartFrom + 1]) <= uint8(abi.encodePacked("7")[0])
            ) {
                flag = true;
            } else {
                if (
                    uint8(_pattern[_indexToStartFrom]) > uint8(abi.encodePacked("0")[0])
                        && uint8(_pattern[_indexToStartFrom]) < uint8(abi.encodePacked("8")[0])
                ) {
                    return (true, _indexToStartFrom);
                } else {
                    return (false, _indexToStartFrom);
                }
            }
        }

        if (flag) {
            if (
                _indexToStartFrom + 2 <= patternLastIndex
                    && uint8(_pattern[_indexToStartFrom + 2]) >= uint8(abi.encodePacked("0")[0])
                    && uint8(_pattern[_indexToStartFrom + 2]) <= uint8(abi.encodePacked("7")[0])
            ) {
                if (
                    uint8(_pattern[_indexToStartFrom]) >= uint8(abi.encodePacked("0")[0])
                        && uint8(_pattern[_indexToStartFrom]) <= uint8(abi.encodePacked("3")[0])
                ) {
                    return (true, _indexToStartFrom + 2);
                } else {
                    return (true, _indexToStartFrom + 1);
                }
            } else {
                return (true, _indexToStartFrom + 1);
            }
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

            // @patch: below LoC
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

    function validateBackslash_p_propertyNameEscape(
        bytes memory _pattern,
        uint256 _indexToStartFrom,
        bool fromCharacterClass
    ) private pure returns (bool, uint256) {
        uint256 patternLastIndex = _pattern.length - 1;

        if (_indexToStartFrom + 3 <= patternLastIndex) {
            if (
                uint8(_pattern[_indexToStartFrom + 2]) == OPEN_CURLY_BRACE
                    && uint8(_pattern[_indexToStartFrom + 3]) == CLOSE_CURLY_BRACE
            ) {
                string memory eMsg = " Invalid property name";
                string memory lastMsg = fromCharacterClass ? " in character class" : "";
                string memory errorMsg = string(
                    abi.encodePacked("SyntaxError: Invalid regular expression: /", _pattern, "/u:", eMsg, lastMsg)
                );
                revert(errorMsg);
            }

            if (uint8(_pattern[_indexToStartFrom + 2]) == OPEN_CURLY_BRACE) {
                (bool isValidPropertyName, uint256 lastMatchedIndex) =
                    validatePropertyNameAndSyntax(_pattern, _indexToStartFrom + 3, fromCharacterClass);

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

        if (_indexToStartFrom + 2 <= patternLastIndex && uint8(_pattern[_indexToStartFrom + 2]) == OPEN_CURLY_BRACE) {
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
                    uint256 decValue = hexToDec(hexString, 4, true);

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

    function validatePropertyNameAndSyntax(bytes memory _pattern, uint256 _indexToStartFrom, bool fromCharacterClass)
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

        // console2.log("property name end index: ", propertyNameEndIdx);

        // @note: impossible to hit below LoC chunk
        // if (propertyNameEndIdx == 0) {
        //     string memory errorMsg = string(
        //         abi.encodePacked("SyntaxError: Invalid regular expression: /", _pattern, "/u: Invalid property name")
        //     );
        //     revert(errorMsg);
        // }

        bytes memory propertyName = trimString(_pattern, _indexToStartFrom, int256(propertyNameEndIdx));

        bool isValidProperty = validatePropertyName(propertyName);

        if (isValidProperty) {
            return (true, propertyNameEndIdx + 1);
        } else {
            string memory eMsg = " Invalid property name";
            string memory lastMsg = fromCharacterClass ? " in character class" : "";
            string memory errorMsg =
                string(abi.encodePacked("SyntaxError: Invalid regular expression: /", _pattern, "/u:", eMsg, lastMsg));
            revert(errorMsg);
        }

        return (false, 0);
    }

    function validatePropertyName(bytes memory propertyName) private pure returns (bool) {
        int256 equalsToIndex = indexOf(string(propertyName), "=");
        bytes32 propertyValueHash;

        if (equalsToIndex > 1) {
            bytes memory propertyKey = trimString(propertyName, 0, equalsToIndex - 1);
            bytes32 propertyKeyHash = keccak256(propertyKey);
            propertyValueHash = keccak256(trimString(propertyName, uint256(equalsToIndex) + 1, -1));

            if (
                propertyKeyHash == keccak256(abi.encodePacked("General_Category"))
                    || propertyKeyHash == keccak256(abi.encodePacked("gc"))
            ) {
                return isGeneralCategoryValue(propertyValueHash);
            }

            if (
                propertyKeyHash == keccak256(abi.encodePacked("Script"))
                    || propertyKeyHash == keccak256(abi.encodePacked("sc"))
                    || propertyKeyHash == keccak256(abi.encodePacked("Script_Extensions"))
                    || propertyKeyHash == keccak256(abi.encodePacked("scx"))
            ) {
                return isScriptValue(propertyValueHash);
            }
        }

        propertyValueHash = keccak256(propertyName);

        if (!isGeneralCategoryValue(propertyValueHash)) {
            if (!isScriptValue(propertyValueHash)) {
                return isBinaryValue(propertyValueHash);
            }
        }

        return true;
    }

    function isGeneralCategoryValue(bytes32 propertyValueHash) private pure returns (bool) {
        bool flag = isLetter(propertyValueHash);

        if (!flag) {
            flag = isMark(propertyValueHash);
        }

        if (!flag) {
            flag = isNumber(propertyValueHash);
        }

        if (!flag) {
            flag = isPropertyEscapePunctuation(propertyValueHash);
        }

        if (!flag) {
            flag = isSymbol(propertyValueHash);
        }

        if (!flag) {
            flag = isSeparator(propertyValueHash);
        }

        if (!flag) {
            flag = isOther(propertyValueHash);
        }

        return flag;
    }

    function isScriptValue(bytes32 propertyValueHash) private pure returns (bool) {
        if (
            propertyValueHash == Adlam || propertyValueHash == Caucasian_Albanian || propertyValueHash == Ahom
                || propertyValueHash == Arabic || propertyValueHash == Imperial_Aramaic || propertyValueHash == Armenian
                || propertyValueHash == Avestan || propertyValueHash == Balinese || propertyValueHash == Bamum
                || propertyValueHash == Bassa_Vah || propertyValueHash == Batak || propertyValueHash == Bengali
                || propertyValueHash == Beria_Erfe || propertyValueHash == Bhaiksuki || propertyValueHash == Bopomofo
                || propertyValueHash == Brahmi || propertyValueHash == Braille || propertyValueHash == Buginese
                || propertyValueHash == Buhid || propertyValueHash == Chakma || propertyValueHash == Canadian_Aboriginal
                || propertyValueHash == Carian || propertyValueHash == Cham || propertyValueHash == Cherokee
                || propertyValueHash == Chorasmian || propertyValueHash == Coptic || propertyValueHash == Cypro_Minoan
                || propertyValueHash == Cypriot || propertyValueHash == Cyrillic || propertyValueHash == Devanagari
                || propertyValueHash == Dives_Akuru || propertyValueHash == Dogra || propertyValueHash == Deseret
                || propertyValueHash == Duployan || propertyValueHash == Egyptian_Hieroglyphs
                || propertyValueHash == Elbasan || propertyValueHash == Elymaic || propertyValueHash == Ethiopic
                || propertyValueHash == Garay || propertyValueHash == Georgian || propertyValueHash == Glagolitic
                || propertyValueHash == Gunjala_Gondi || propertyValueHash == Masaram_Gondi
                || propertyValueHash == Gothic || propertyValueHash == Grantha || propertyValueHash == Greek
                || propertyValueHash == Gujarati || propertyValueHash == Gurung_Khema || propertyValueHash == Gurmukhi
                || propertyValueHash == Hangul || propertyValueHash == Han || propertyValueHash == Hanunoo
                || propertyValueHash == Hatran || propertyValueHash == Hebrew || propertyValueHash == Hiragana
                || propertyValueHash == Anatolian_Hieroglyphs || propertyValueHash == Pahawh_Hmong
                || propertyValueHash == Nyiakeng_Puachue_Hmong || propertyValueHash == Katakana_Or_Hiragana
                || propertyValueHash == Old_Hungarian || propertyValueHash == Old_Italic
                || propertyValueHash == Javanese || propertyValueHash == Kayah_Li || propertyValueHash == Katakana
                || propertyValueHash == Kawi || propertyValueHash == Kharoshthi || propertyValueHash == Khmer
                || propertyValueHash == Khojki || propertyValueHash == Khitan_Small_Script
                || propertyValueHash == Kannada || propertyValueHash == Kirat_Rai || propertyValueHash == Kaithi
                || propertyValueHash == Tai_Tham || propertyValueHash == Lao || propertyValueHash == Latin
                || propertyValueHash == Lepcha || propertyValueHash == Limbu || propertyValueHash == Linear_A
                || propertyValueHash == Linear_B || propertyValueHash == Lisu || propertyValueHash == Lycian
                || propertyValueHash == Lydian || propertyValueHash == Mahajani || propertyValueHash == Makasar
                || propertyValueHash == Mandaic || propertyValueHash == Manichaean || propertyValueHash == Marchen
                || propertyValueHash == Medefaidrin || propertyValueHash == Mende_Kikakui
                || propertyValueHash == Meroitic_Cursive || propertyValueHash == Meroitic_Hieroglyphs
                || propertyValueHash == Malayalam || propertyValueHash == Modi || propertyValueHash == Mongolian
                || propertyValueHash == Mro || propertyValueHash == Meetei_Mayek || propertyValueHash == Multani
                || propertyValueHash == Myanmar || propertyValueHash == Nag_Mundari || propertyValueHash == Nandinagari
                || propertyValueHash == Old_North_Arabian || propertyValueHash == Nabataean || propertyValueHash == Newa
                || propertyValueHash == Nko || propertyValueHash == Nushu || propertyValueHash == Ogham
                || propertyValueHash == Ol_Chiki || propertyValueHash == Ol_Onal || propertyValueHash == Old_Turkic
                || propertyValueHash == Oriya || propertyValueHash == Osage || propertyValueHash == Osmanya
                || propertyValueHash == Old_Uyghur || propertyValueHash == Palmyrene || propertyValueHash == Pau_Cin_Hau
                || propertyValueHash == Old_Permic || propertyValueHash == Phags_Pa
                || propertyValueHash == Inscriptional_Pahlavi || propertyValueHash == Psalter_Pahlavi
                || propertyValueHash == Phoenician || propertyValueHash == Miao
                || propertyValueHash == Inscriptional_Parthian || propertyValueHash == Rejang
                || propertyValueHash == Hanifi_Rohingya || propertyValueHash == Runic || propertyValueHash == Samaritan
                || propertyValueHash == Old_South_Arabian || propertyValueHash == Saurashtra
                || propertyValueHash == SignWriting || propertyValueHash == Shavian || propertyValueHash == Sharada
                || propertyValueHash == Siddham || propertyValueHash == Sidetic || propertyValueHash == Khudawadi
                || propertyValueHash == Sinhala || propertyValueHash == Sogdian || propertyValueHash == Old_Sogdian
                || propertyValueHash == Sora_Sompeng || propertyValueHash == Soyombo || propertyValueHash == Sundanese
                || propertyValueHash == Sunuwar || propertyValueHash == Syloti_Nagri || propertyValueHash == Syriac
                || propertyValueHash == Tagbanwa || propertyValueHash == Takri || propertyValueHash == Tai_Le
                || propertyValueHash == New_Tai_Lue || propertyValueHash == Tamil || propertyValueHash == Tangut
                || propertyValueHash == Tai_Viet || propertyValueHash == Tai_Yo || propertyValueHash == Telugu
                || propertyValueHash == Tifinagh || propertyValueHash == Tagalog || propertyValueHash == Thaana
                || propertyValueHash == Thai || propertyValueHash == Tibetan || propertyValueHash == Tirhuta
                || propertyValueHash == Tangsa || propertyValueHash == Todhri || propertyValueHash == Tolong_Siki
                || propertyValueHash == Toto || propertyValueHash == Tulu_Tigalari || propertyValueHash == Ugaritic
                || propertyValueHash == Vai || propertyValueHash == Vithkuqi || propertyValueHash == Warang_Citi
                || propertyValueHash == Wancho || propertyValueHash == Old_Persian || propertyValueHash == Cuneiform
                || propertyValueHash == Yezidi || propertyValueHash == Yi || propertyValueHash == Zanabazar_Square
                || propertyValueHash == Inherited || propertyValueHash == Common || propertyValueHash == Unknown
                || propertyValueHash == Adlm || propertyValueHash == Aghb || propertyValueHash == Arab
                || propertyValueHash == Armi || propertyValueHash == Armn || propertyValueHash == Avst
                || propertyValueHash == Bali || propertyValueHash == Bamu || propertyValueHash == Bass
                || propertyValueHash == Batk || propertyValueHash == Beng || propertyValueHash == Berf
                || propertyValueHash == Bhks || propertyValueHash == Bopo || propertyValueHash == Brah
                || propertyValueHash == Brai || propertyValueHash == Bugi || propertyValueHash == Buhd
                || propertyValueHash == Cakm || propertyValueHash == Cans || propertyValueHash == Cari
                || propertyValueHash == Cher || propertyValueHash == Chrs || propertyValueHash == Copt
                || propertyValueHash == Cpmn || propertyValueHash == Cprt || propertyValueHash == Cyrl
                || propertyValueHash == Deva || propertyValueHash == Diak || propertyValueHash == Dogr
                || propertyValueHash == Dsrt || propertyValueHash == Dupl || propertyValueHash == Egyp
                || propertyValueHash == Elba || propertyValueHash == Elym || propertyValueHash == Ethi
                || propertyValueHash == Gara || propertyValueHash == Geor || propertyValueHash == Glag
                || propertyValueHash == Gong || propertyValueHash == Gonm || propertyValueHash == Goth
                || propertyValueHash == Gran || propertyValueHash == Grek || propertyValueHash == Gujr
                || propertyValueHash == Gukh || propertyValueHash == Guru || propertyValueHash == Hang
                || propertyValueHash == Hani || propertyValueHash == Hano || propertyValueHash == Hatr
                || propertyValueHash == Hebr || propertyValueHash == Hira || propertyValueHash == Hluw
                || propertyValueHash == Hmng || propertyValueHash == Hmnp || propertyValueHash == Hrkt
                || propertyValueHash == Hung || propertyValueHash == Ital || propertyValueHash == Java
                || propertyValueHash == Kali || propertyValueHash == Kana || propertyValueHash == Khar
                || propertyValueHash == Khmr || propertyValueHash == Khoj || propertyValueHash == Kits
                || propertyValueHash == Knda || propertyValueHash == Krai || propertyValueHash == Kthi
                || propertyValueHash == Lana || propertyValueHash == Laoo || propertyValueHash == Latn
                || propertyValueHash == Lepc || propertyValueHash == Limb || propertyValueHash == Lina
                || propertyValueHash == Linb || propertyValueHash == Lyci || propertyValueHash == Lydi
                || propertyValueHash == Mahj || propertyValueHash == Maka || propertyValueHash == Mand
                || propertyValueHash == Mansi || propertyValueHash == Marc || propertyValueHash == Medf
                || propertyValueHash == Mend || propertyValueHash == Merc || propertyValueHash == Mero
                || propertyValueHash == Mlym || propertyValueHash == Mong || propertyValueHash == Mroo
                || propertyValueHash == Mtei || propertyValueHash == Mult || propertyValueHash == Mymr
                || propertyValueHash == Nagm || propertyValueHash == Nand || propertyValueHash == Narb
                || propertyValueHash == Nbat || propertyValueHash == Nkoo || propertyValueHash == Nshu
                || propertyValueHash == Ogam || propertyValueHash == Olck || propertyValueHash == Onao
                || propertyValueHash == Orkh || propertyValueHash == Orya || propertyValueHash == Osge
                || propertyValueHash == Osma || propertyValueHash == Ougr || propertyValueHash == Palm
                || propertyValueHash == Pauc || propertyValueHash == Perm || propertyValueHash == Phag
                || propertyValueHash == Phli || propertyValueHash == Phlp || propertyValueHash == Phnx
                || propertyValueHash == Plrd || propertyValueHash == Prti || propertyValueHash == Rjng
                || propertyValueHash == Rohg || propertyValueHash == Runr || propertyValueHash == Samr
                || propertyValueHash == Sarb || propertyValueHash == Saur || propertyValueHash == Sgnw
                || propertyValueHash == Shaw || propertyValueHash == Shrd || propertyValueHash == Sidd
                || propertyValueHash == Sidt || propertyValueHash == Sind || propertyValueHash == Sinh
                || propertyValueHash == Sogd || propertyValueHash == Sogo || propertyValueHash == Sora
                || propertyValueHash == Soyo || propertyValueHash == Sund || propertyValueHash == Sunu
                || propertyValueHash == Sylo || propertyValueHash == Syrc || propertyValueHash == Tagb
                || propertyValueHash == Takr || propertyValueHash == Tale || propertyValueHash == Talu
                || propertyValueHash == Taml || propertyValueHash == Tang || propertyValueHash == Tavt
                || propertyValueHash == Tayo || propertyValueHash == Telu || propertyValueHash == Tfng
                || propertyValueHash == Tglg || propertyValueHash == Thaa || propertyValueHash == Tibt
                || propertyValueHash == Tirh || propertyValueHash == Tnsa || propertyValueHash == Todr
                || propertyValueHash == Tols || propertyValueHash == Tutg || propertyValueHash == Ugar
                || propertyValueHash == Vaii || propertyValueHash == Vith || propertyValueHash == Wara
                || propertyValueHash == Wcho || propertyValueHash == Xpeo || propertyValueHash == Xsux
                || propertyValueHash == Yezi || propertyValueHash == Yiii || propertyValueHash == Zanb
                || propertyValueHash == Zinh || propertyValueHash == Zyyy || propertyValueHash == Zzzz
        ) {
            return true;
        }
        return false;
    }

    function isBinaryValue(bytes32 propertyValueHash) private pure returns (bool) {
        // @Note: 👇
        // Excluded: ALL Unicode binary properties (including obscure, deprecated, informational, layout, normalization, bidi, etc.)
        // are ~75–85. However,
        // Included: Only Binary properties that are commonly exposed and meaningful for regex matching
        // (mainly from PropList.txt, DerivedCoreProperties.txt, and EmojiData.txt) ~59-61
        if (
            propertyValueHash == Alphabetic || propertyValueHash == Alpha || propertyValueHash == ASCII_Hex_Digit
                || propertyValueHash == AHex || propertyValueHash == Bidi_Control || propertyValueHash == Bidi_C
                || propertyValueHash == Case_Ignorable || propertyValueHash == CI || propertyValueHash == Cased
                || propertyValueHash == Changes_When_Casefolded || propertyValueHash == CWCF
                || propertyValueHash == Changes_When_Casemapped || propertyValueHash == CWCM
                || propertyValueHash == Changes_When_Lowercased || propertyValueHash == CWL
                || propertyValueHash == Changes_When_NFKC_Casefolded || propertyValueHash == CWKCF
                || propertyValueHash == Changes_When_Titlecased || propertyValueHash == CWT
                || propertyValueHash == Changes_When_Uppercased || propertyValueHash == CWU || propertyValueHash == Dash
                || propertyValueHash == Default_Ignorable_Code_Point || propertyValueHash == DI
                || propertyValueHash == Default_Ignorable || propertyValueHash == Deprecated || propertyValueHash == Dep
                || propertyValueHash == Diacritic || propertyValueHash == Dia || propertyValueHash == Emoji
                || propertyValueHash == Emoji_Component || propertyValueHash == Emoji_Modifier
                || propertyValueHash == Emoji_Modifier_Base || propertyValueHash == Emoji_Presentation
                || propertyValueHash == Extended_Pictographic || propertyValueHash == ExtPict
                || propertyValueHash == Extender || propertyValueHash == Ext
                || propertyValueHash == Full_Composition_Exclusion || propertyValueHash == Comp_Ex
                || propertyValueHash == Grapheme_Base || propertyValueHash == Gr_Base
                || propertyValueHash == Grapheme_Extend || propertyValueHash == Gr_Ext
                || propertyValueHash == Grapheme_Link || propertyValueHash == Gr_Link || propertyValueHash == Hex_Digit
                || propertyValueHash == Hex || propertyValueHash == Hyphen || propertyValueHash == ID_Continue
                || propertyValueHash == IDC || propertyValueHash == ID_Start || propertyValueHash == IDS
                || propertyValueHash == Ideographic || propertyValueHash == Ideo
                || propertyValueHash == IDS_Binary_Operator || propertyValueHash == IDS_BinOp
                || propertyValueHash == IDS_Trinary_Operator || propertyValueHash == IDS_TrinOp
                || propertyValueHash == Join_Control || propertyValueHash == Join_C
                || propertyValueHash == Logical_Order_Exception || propertyValueHash == LOE
                || propertyValueHash == Lowercase || propertyValueHash == Lower || propertyValueHash == Math
                || propertyValueHash == Noncharacter_Code_Point || propertyValueHash == NChar
                || propertyValueHash == Other_Alphabetic || propertyValueHash == OAlpha
                || propertyValueHash == Other_Default_Ignorable_Code_Point || propertyValueHash == ODI
                || propertyValueHash == Other_Grapheme_Extend || propertyValueHash == OGr_Ext
                || propertyValueHash == Other_ID_Continue || propertyValueHash == OIDC
                || propertyValueHash == Other_ID_Start || propertyValueHash == OIDS
                || propertyValueHash == Other_Lowercase || propertyValueHash == OLower
                || propertyValueHash == Other_Math || propertyValueHash == OMath || propertyValueHash == Other_Uppercase
                || propertyValueHash == OUpper || propertyValueHash == Pattern_Syntax || propertyValueHash == Pat_Syn
                || propertyValueHash == Pattern_White_Space || propertyValueHash == Pat_WS
                || propertyValueHash == Prepended_Concatenation_Mark || propertyValueHash == PCM
                || propertyValueHash == Quotation_Mark || propertyValueHash == QMark || propertyValueHash == Radical
                || propertyValueHash == Regional_Indicator || propertyValueHash == RI
                || propertyValueHash == Sentence_Terminal || propertyValueHash == STerm
                || propertyValueHash == Soft_Dotted || propertyValueHash == SD
                || propertyValueHash == Terminal_Punctuation || propertyValueHash == Term
                || propertyValueHash == Unified_Ideograph || propertyValueHash == UIdeo
                || propertyValueHash == Uppercase || propertyValueHash == Upper
                || propertyValueHash == Variation_Selector || propertyValueHash == VS
                || propertyValueHash == White_Space || propertyValueHash == WS || propertyValueHash == space
        ) {
            return true;
        }

        return false;
    }

    function isLetter(bytes32 propertyValueHash) private pure returns (bool) {
        if (
            propertyValueHash == LETTER || propertyValueHash == UPPERCASE_LETTER
                || propertyValueHash == LOWERCASE_LETTER || propertyValueHash == TITLECASE_LETTER
                || propertyValueHash == MODIFIER_LETTER || propertyValueHash == OTHER_LETTER
                || propertyValueHash == SH_LETTER || propertyValueHash == SH_UPPERCASE_LETTER
                || propertyValueHash == SH_LOWERCASE_LETTER || propertyValueHash == SH_TITLECASE_LETTER
                || propertyValueHash == SH_MODIFIER_LETTER || propertyValueHash == SH_OTHER_LETTER
        ) {
            return true;
        }
        return false;
    }

    function isMark(bytes32 propertyValueHash) private pure returns (bool) {
        if (
            propertyValueHash == MARK || propertyValueHash == NONSPACING_MARK || propertyValueHash == SPACING_MARK
                || propertyValueHash == ENCLOSING_MARK || propertyValueHash == SH_MARK
                || propertyValueHash == SH_NONSPACING_MARK || propertyValueHash == SH_SPACING_MARK
                || propertyValueHash == SH_ENCLOSING_MARK
        ) {
            return true;
        }
        return false;
    }

    function isNumber(bytes32 propertyValueHash) private pure returns (bool) {
        if (
            propertyValueHash == NUMBER || propertyValueHash == DECIMAL_NUMBER || propertyValueHash == LETTER_NUMBER
                || propertyValueHash == OTHER_NUMBER || propertyValueHash == SH_NUMBER
                || propertyValueHash == SH_DECIMAL_NUMBER || propertyValueHash == SH_LETTER_NUMBER
                || propertyValueHash == SH_OTHER_NUMBER
        ) {
            return true;
        }
        return false;
    }

    function isPropertyEscapePunctuation(bytes32 propertyValueHash) private pure returns (bool) {
        if (
            propertyValueHash == PUNCTUATION || propertyValueHash == CONNECTOR_PUNCTUATION
                || propertyValueHash == DASH_PUNCTUATION || propertyValueHash == OPEN_PUNCTUATION
                || propertyValueHash == CLOSE_PUNCTUATION || propertyValueHash == INITIAL_PUNCTUATION
                || propertyValueHash == FINAL_PUNCTUATION || propertyValueHash == OTHER_PUNCTUATION
                || propertyValueHash == SH_PUNCTUATION || propertyValueHash == SH_CONNECTOR_PUNCTUATION
                || propertyValueHash == SH_DASH_PUNCTUATION || propertyValueHash == SH_OPEN_PUNCTUATION
                || propertyValueHash == SH_CLOSE_PUNCTUATION || propertyValueHash == SH_INITIAL_PUNCTUATION
                || propertyValueHash == SH_FINAL_PUNCTUATION || propertyValueHash == SH_OTHER_PUNCTUATION
        ) {
            return true;
        }
        return false;
    }

    function isSymbol(bytes32 propertyValueHash) private pure returns (bool) {
        if (
            propertyValueHash == SYMBOL || propertyValueHash == MATH_SYMBOL || propertyValueHash == CURRENCY_SYMBOL
                || propertyValueHash == MODIFIER_SYMBOL || propertyValueHash == OTHER_SYMBOL
                || propertyValueHash == SH_SYMBOL || propertyValueHash == SH_MATH_SYMBOL
                || propertyValueHash == SH_CURRENCY_SYMBOL || propertyValueHash == SH_MODIFIER_SYMBOL
                || propertyValueHash == SH_OTHER_SYMBOL
        ) {
            return true;
        }
        return false;
    }

    function isSeparator(bytes32 propertyValueHash) private pure returns (bool) {
        if (
            propertyValueHash == SEPARATOR || propertyValueHash == SPACE_SEPARATOR
                || propertyValueHash == LINE_SEPARATOR || propertyValueHash == PARAGRAPH_SEPARATOR
                || propertyValueHash == SH_SEPARATOR || propertyValueHash == SH_SPACE_SEPARATOR
                || propertyValueHash == SH_LINE_SEPARATOR || propertyValueHash == SH_PARAGRAPH_SEPARATOR
        ) {
            return true;
        }
        return false;
    }

    function isOther(bytes32 propertyValueHash) private pure returns (bool) {
        if (
            propertyValueHash == OTHER || propertyValueHash == CONTROL || propertyValueHash == FORMAT
                || propertyValueHash == SURROGATE || propertyValueHash == PRIVATE_USE || propertyValueHash == UNASSIGNED
                || propertyValueHash == SH_OTHER || propertyValueHash == SH_CONTROL || propertyValueHash == SH_FORMAT
                || propertyValueHash == SH_SURROGATE || propertyValueHash == SH_PRIVATE_USE
                || propertyValueHash == SH_UNASSIGNED
        ) {
            return true;
        }
        return false;
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

    function stringDigitToDecDigit(bytes memory _hexString) internal pure returns (uint256) {
        uint256 hexStringLastIndex = _hexString.length - 1;
        bytes memory hexFullBinary;

        for (uint256 hi = hexStringLastIndex; hi >= 0; hi--) {
            bytes memory binary = hexToBinary(_hexString[hi], 4, true);
            hexFullBinary = abi.encodePacked(binary, hexFullBinary);
            if (hi == 0) break;
        }

        return binToDecDigit(hexFullBinary);
    }

    function binToDecDigit(bytes memory binary) private pure returns (uint256) {
        uint256 binExp;
        uint256 decExp;
        uint256 binBase = 2;
        uint256 decBase = 10;
        uint256 binCount;
        uint256 binDec;
        uint256 decimal;

        for (uint256 bi = binary.length - 1; bi >= 0; bi--) {
            binCount++;
            binDec += binary[bi] == 0x30 ? 0 : binBase ** binExp;
            if (binCount == 4) {
                decimal = decimal + (binDec * (decBase ** decExp));
                if (bi == 0) break;
                binDec = 0;
                binCount = 0;
                binExp = 0;
                decExp++;
                continue;
            }
            if (bi == 0) break;
            binExp++;
        }

        return decimal;
    }

    function hexToDec(bytes memory _hexString, uint8 numBits, bool isInterpolated) internal pure returns (uint256) {
        uint256 hexStringLastIndex = _hexString.length - 1;
        bytes memory hexFullBinary;

        for (uint256 hi = hexStringLastIndex; hi >= 0; hi--) {
            bytes memory binary = hexToBinary(_hexString[hi], numBits, isInterpolated);
            hexFullBinary = abi.encodePacked(binary, hexFullBinary);
            if (hi == 0) break;
        }

        return binToDec(hexFullBinary);
    }

    function binToDec(bytes memory binary) private pure returns (uint256) {
        uint256 exp;
        uint256 base = 2;
        uint256 decimal;

        for (uint256 bi = binary.length - 1; bi >= 0; bi--) {
            decimal += binary[bi] == 0x30 ? 0 : base ** exp;
            if (bi == 0) break;
            exp++;
        }

        return decimal;
    }

    function hexToBinary(bytes1 _hex, uint8 numBits, bool isInterpolated) private pure returns (bytes memory) {
        uint8 decimal;
        if (isInterpolated) {
            decimal = uint8(asciiToDigit(uint8(_hex)));
        } else {
            decimal = uint8(_hex);
        }

        bytes memory binary = decimalToBinaryAscii(decimal, numBits, isInterpolated);
        return binary;
    }

    function decimalToBinaryAscii(uint8 decimal, uint8 numBits, bool isInterpolated)
        private
        pure
        returns (bytes memory)
    {
        bytes memory binary;
        if (decimal == 0 && isInterpolated) {
            binary = abi.encodePacked("0");
        }

        while (decimal != 0) {
            binary = decimal % 2 == 0 ? abi.encodePacked("0", binary) : abi.encodePacked("1", binary);
            decimal = decimal >> 1;
        }

        uint256 bl = binary.length;

        if (numBits == 8) {
            binary = abi.encodePacked(
                bl % 8 == 1
                    ? "0000000"
                    : bl % 8 == 2
                        ? "000000"
                        : bl % 8 == 3
                            ? "00000"
                            : bl % 8 == 4 ? "0000" : bl % 8 == 5 ? "000" : bl % 8 == 6 ? "00" : bl % 8 == 7 ? "0" : "",
                binary
            );
        } else if (numBits == 4) {
            binary = abi.encodePacked(
                bl % numBits == 1 ? "000" : bl % numBits == 2 ? "00" : bl % numBits == 3 ? "0" : "", binary
            );
        }

        return binary;
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
        if (_asciiCode == uint8(abi.encodePacked("A")[0]) || _asciiCode == uint8(abi.encodePacked("a")[0])) {
            return 10;
        }
        if (_asciiCode == uint8(abi.encodePacked("B")[0]) || _asciiCode == uint8(abi.encodePacked("b")[0])) {
            return 11;
        }
        if (_asciiCode == uint8(abi.encodePacked("C")[0]) || _asciiCode == uint8(abi.encodePacked("c")[0])) {
            return 12;
        }
        if (_asciiCode == uint8(abi.encodePacked("D")[0]) || _asciiCode == uint8(abi.encodePacked("d")[0])) {
            return 13;
        }
        if (_asciiCode == uint8(abi.encodePacked("E")[0]) || _asciiCode == uint8(abi.encodePacked("e")[0])) {
            return 14;
        }
        if (_asciiCode == uint8(abi.encodePacked("F")[0]) || _asciiCode == uint8(abi.encodePacked("f")[0])) {
            return 15;
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

        // console2.log("---In findPatternStringInRangeBounds---");
        // console2.log("targetChar: ", string(abi.encodePacked(_targetChar)));
        // console2.log("targetChar ascii code: ", uint8(_targetChar));
        // console2.log("lowerBoundUnicode: ", lowerBoundUnicode);
        // console2.log("upperBoundUnicode: ", upperBoundUnicode);
        // console2.log("---");

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
