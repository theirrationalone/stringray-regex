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
    bytes32 private constant GROUP_ATOM = "GROUP_ATOM";
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
    bytes32 private constant Alpha = keccak256(abi.encodePacked(" Alpha"));
    bytes32 private constant ASCII_Hex_Digit = keccak256(abi.encodePacked("ASCII_Hex_Digit"));
    bytes32 private constant AHex = keccak256(abi.encodePacked(" AHex"));
    bytes32 private constant Bidi_Control = keccak256(abi.encodePacked("Bidi_Control"));
    bytes32 private constant Bidi_C = keccak256(abi.encodePacked(" Bidi_C"));
    bytes32 private constant Case_Ignorable = keccak256(abi.encodePacked("Case_Ignorable"));
    bytes32 private constant CI = keccak256(abi.encodePacked(" CI"));
    bytes32 private constant Cased = keccak256(abi.encodePacked("Cased"));
    bytes32 private constant Changes_When_Casefolded = keccak256(abi.encodePacked("Changes_When_Casefolded"));
    bytes32 private constant CWCF = keccak256(abi.encodePacked(" CWCF"));
    bytes32 private constant Changes_When_Casemapped = keccak256(abi.encodePacked("Changes_When_Casemapped"));
    bytes32 private constant CWCM = keccak256(abi.encodePacked(" CWCM"));
    bytes32 private constant Changes_When_Lowercased = keccak256(abi.encodePacked("Changes_When_Lowercased"));
    bytes32 private constant CWL = keccak256(abi.encodePacked(" CWL"));
    bytes32 private constant Changes_When_NFKC_Casefolded = keccak256(abi.encodePacked("Changes_When_NFKC_Casefolded"));
    bytes32 private constant CWKCF = keccak256(abi.encodePacked(" CWKCF"));
    bytes32 private constant Changes_When_Titlecased = keccak256(abi.encodePacked("Changes_When_Titlecased"));
    bytes32 private constant CWT = keccak256(abi.encodePacked(" CWT"));
    bytes32 private constant Changes_When_Uppercased = keccak256(abi.encodePacked("Changes_When_Uppercased"));
    bytes32 private constant CWU = keccak256(abi.encodePacked(" CWU"));
    bytes32 private constant Dash = keccak256(abi.encodePacked(" Dash"));
    bytes32 private constant Default_Ignorable_Code_Point = keccak256(abi.encodePacked("Default_Ignorable_Code_Point"));
    bytes32 private constant DI = keccak256(abi.encodePacked(" DI"));
    bytes32 private constant Default_Ignorable = keccak256(abi.encodePacked(" Default_Ignorable"));
    bytes32 private constant Deprecated = keccak256(abi.encodePacked("Deprecated"));
    bytes32 private constant Dep = keccak256(abi.encodePacked(" Dep"));
    bytes32 private constant Diacritic = keccak256(abi.encodePacked("Diacritic"));
    bytes32 private constant Dia = keccak256(abi.encodePacked(" Dia"));
    bytes32 private constant Emoji = keccak256(abi.encodePacked("Emoji"));
    bytes32 private constant Emoji_Component = keccak256(abi.encodePacked(" Emoji_Component"));
    bytes32 private constant Emoji_Modifier = keccak256(abi.encodePacked(" Emoji_Modifier"));
    bytes32 private constant Emoji_Modifier_Base = keccak256(abi.encodePacked("Emoji_Modifier_Base"));
    bytes32 private constant Emoji_Presentation = keccak256(abi.encodePacked(" Emoji_Presentation"));
    bytes32 private constant Extended_Pictographic = keccak256(abi.encodePacked("Extended_Pictographic"));
    bytes32 private constant ExtPict = keccak256(abi.encodePacked(" ExtPict"));
    bytes32 private constant Extender = keccak256(abi.encodePacked("Extender"));
    bytes32 private constant Ext = keccak256(abi.encodePacked(" Ext"));
    bytes32 private constant Full_Composition_Exclusion = keccak256(abi.encodePacked("Full_Composition_Exclusion"));
    bytes32 private constant Comp_Ex = keccak256(abi.encodePacked(" Comp_Ex"));
    bytes32 private constant Grapheme_Base = keccak256(abi.encodePacked("Grapheme_Base"));
    bytes32 private constant Gr_Base = keccak256(abi.encodePacked(" Gr_Base"));
    bytes32 private constant Grapheme_Extend = keccak256(abi.encodePacked("Grapheme_Extend"));
    bytes32 private constant Gr_Ext = keccak256(abi.encodePacked(" Gr_Ext"));
    bytes32 private constant Grapheme_Link = keccak256(abi.encodePacked("Grapheme_Link"));
    bytes32 private constant Gr_Link = keccak256(abi.encodePacked(" Gr_Link"));
    bytes32 private constant Hex_Digit = keccak256(abi.encodePacked("Hex_Digit"));
    bytes32 private constant Hex = keccak256(abi.encodePacked(" Hex"));
    bytes32 private constant Hyphen = keccak256(abi.encodePacked("Hyphen"));
    bytes32 private constant ID_Continue = keccak256(abi.encodePacked("ID_Continue"));
    bytes32 private constant IDC = keccak256(abi.encodePacked(" IDC"));
    bytes32 private constant ID_Start = keccak256(abi.encodePacked("ID_Start"));
    bytes32 private constant IDS = keccak256(abi.encodePacked(" IDS"));
    bytes32 private constant Ideographic = keccak256(abi.encodePacked("Ideographic"));
    bytes32 private constant Ideo = keccak256(abi.encodePacked(" Ideo"));
    bytes32 private constant IDS_Binary_Operator = keccak256(abi.encodePacked("IDS_Binary_Operator"));
    bytes32 private constant IDS_BinOp = keccak256(abi.encodePacked(" IDS_BinOp"));
    bytes32 private constant IDS_Trinary_Operator = keccak256(abi.encodePacked("IDS_Trinary_Operator"));
    bytes32 private constant IDS_TrinOp = keccak256(abi.encodePacked(" IDS_TrinOp"));
    bytes32 private constant Join_Control = keccak256(abi.encodePacked("Join_Control"));
    bytes32 private constant Join_C = keccak256(abi.encodePacked(" Join_C"));
    bytes32 private constant Logical_Order_Exception = keccak256(abi.encodePacked("Logical_Order_Exception"));
    bytes32 private constant LOE = keccak256(abi.encodePacked(" LOE"));
    bytes32 private constant Lowercase = keccak256(abi.encodePacked("Lowercase"));
    bytes32 private constant Lower = keccak256(abi.encodePacked(" Lower"));
    bytes32 private constant Math = keccak256(abi.encodePacked(" Math"));
    bytes32 private constant Noncharacter_Code_Point = keccak256(abi.encodePacked("Noncharacter_Code_Point"));
    bytes32 private constant NChar = keccak256(abi.encodePacked(" NChar"));
    bytes32 private constant Other_Alphabetic = keccak256(abi.encodePacked("Other_Alphabetic"));
    bytes32 private constant OAlpha = keccak256(abi.encodePacked(" OAlpha"));
    bytes32 private constant Other_Default_Ignorable_Code_Point =
        keccak256(abi.encodePacked("Other_Default_Ignorable_Code_Point"));
    bytes32 private constant ODI = keccak256(abi.encodePacked(" ODI"));
    bytes32 private constant Other_Grapheme_Extend = keccak256(abi.encodePacked("Other_Grapheme_Extend"));
    bytes32 private constant OGr_Ext = keccak256(abi.encodePacked(" OGr_Ext"));
    bytes32 private constant Other_ID_Continue = keccak256(abi.encodePacked("Other_ID_Continue"));
    bytes32 private constant OIDC = keccak256(abi.encodePacked(" OIDC"));
    bytes32 private constant Other_ID_Start = keccak256(abi.encodePacked("Other_ID_Start"));
    bytes32 private constant OIDS = keccak256(abi.encodePacked(" OIDS"));
    bytes32 private constant Other_Lowercase = keccak256(abi.encodePacked("Other_Lowercase"));
    bytes32 private constant OLower = keccak256(abi.encodePacked(" OLower"));
    bytes32 private constant Other_Math = keccak256(abi.encodePacked("Other_Math"));
    bytes32 private constant OMath = keccak256(abi.encodePacked(" OMath"));
    bytes32 private constant Other_Uppercase = keccak256(abi.encodePacked("Other_Uppercase"));
    bytes32 private constant OUpper = keccak256(abi.encodePacked(" OUpper"));
    bytes32 private constant Pattern_Syntax = keccak256(abi.encodePacked("Pattern_Syntax"));
    bytes32 private constant Pat_Syn = keccak256(abi.encodePacked(" Pat_Syn"));
    bytes32 private constant Pattern_White_Space = keccak256(abi.encodePacked("Pattern_White_Space"));
    bytes32 private constant Pat_WS = keccak256(abi.encodePacked(" Pat_WS"));
    bytes32 private constant Prepended_Concatenation_Mark = keccak256(abi.encodePacked("Prepended_Concatenation_Mark"));
    bytes32 private constant PCM = keccak256(abi.encodePacked(" PCM"));
    bytes32 private constant Quotation_Mark = keccak256(abi.encodePacked("Quotation_Mark"));
    bytes32 private constant QMark = keccak256(abi.encodePacked(" QMark"));
    bytes32 private constant Radical = keccak256(abi.encodePacked("Radical"));
    bytes32 private constant Regional_Indicator = keccak256(abi.encodePacked("Regional_Indicator"));
    bytes32 private constant RI = keccak256(abi.encodePacked(" RI"));
    bytes32 private constant Sentence_Terminal = keccak256(abi.encodePacked("Sentence_Terminal"));
    bytes32 private constant STerm = keccak256(abi.encodePacked(" STerm"));
    bytes32 private constant Soft_Dotted = keccak256(abi.encodePacked("Soft_Dotted"));
    bytes32 private constant SD = keccak256(abi.encodePacked(" SD"));
    bytes32 private constant Terminal_Punctuation = keccak256(abi.encodePacked("Terminal_Punctuation"));
    bytes32 private constant Term = keccak256(abi.encodePacked(" Term"));
    bytes32 private constant Unified_Ideograph = keccak256(abi.encodePacked("Unified_Ideograph"));
    bytes32 private constant UIdeo = keccak256(abi.encodePacked(" UIdeo"));
    bytes32 private constant Uppercase = keccak256(abi.encodePacked("Uppercase"));
    bytes32 private constant Upper = keccak256(abi.encodePacked(" Upper"));
    bytes32 private constant Variation_Selector = keccak256(abi.encodePacked("Variation_Selector"));
    bytes32 private constant VS = keccak256(abi.encodePacked(" VS"));
    bytes32 private constant White_Space = keccak256(abi.encodePacked("White_Space"));
    bytes32 private constant WS = keccak256(abi.encodePacked(" WS"));
    bytes32 private constant space = keccak256(abi.encodePacked(" space"));

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
                    if (uint8(_pattern[i - 1]) != BACK_SLASH || uint8(_pattern[i - 2]) == BACK_SLASH) {
                        if ((uint8(_pattern[i + 1]) != BACK_SLASH || uint8(_pattern[i + 2]) == BACK_SLASH)) {
                            bool flag;
                            uint256 firstUnicodeIndex;
                            uint256 lastUnicodeIndex;
                            if (uint8(_pattern[i - 1]) != BACK_SLASH) {
                                if (i >= 5 && _currentParticleIndex < i - 5) {
                                    firstUnicodeIndex = i - 5;
                                    (flag, lastUnicodeIndex) = fUnicodeRange(_pattern, firstUnicodeIndex);
                                } else if (i >= 4 && _currentParticleIndex < i - 4) {
                                    firstUnicodeIndex = i - 4;
                                    (flag, lastUnicodeIndex) = eUnicodeRange(_pattern, firstUnicodeIndex);
                                } else if (i >= 3 && _currentParticleIndex < i - 3) {
                                    firstUnicodeIndex = i - 3;
                                    (flag, lastUnicodeIndex) = cUnicodeRange(_pattern, firstUnicodeIndex);
                                    if (!flag) {
                                        (flag, lastUnicodeIndex) = dUnicodeRange(_pattern, firstUnicodeIndex);
                                    }
                                }
                            }

                            uint256 leftAtomDecimal;
                            if (flag) {
                                bytes memory unicodeHex = utf8HexToUnicodeHex(
                                    trimString(_pattern, firstUnicodeIndex, int256(lastUnicodeIndex))
                                );
                                leftAtomDecimal = hexToDec(unicodeHex);
                            } else {
                                leftAtomDecimal = uint8(_pattern[i - 1]);
                            }

                            if (uint8(_pattern[i + 1]) != BACK_SLASH) {
                                firstUnicodeIndex = i + 1;
                                flag = false;
                                if (i + 5 < lastMatchedParticleIndex) {
                                    (flag, lastUnicodeIndex) = fUnicodeRange(_pattern, firstUnicodeIndex);
                                } else if (i + 4 < lastMatchedParticleIndex) {
                                    (flag, lastUnicodeIndex) = eUnicodeRange(_pattern, firstUnicodeIndex);
                                } else if (i + 3 < lastMatchedParticleIndex) {
                                    (flag, lastUnicodeIndex) = cUnicodeRange(_pattern, firstUnicodeIndex);
                                    if (!flag) {
                                        (flag, lastUnicodeIndex) = dUnicodeRange(_pattern, firstUnicodeIndex);
                                    }
                                }
                            }

                            uint256 rightAtomDecimal;
                            if (flag) {
                                bytes memory unicodeHex = utf8HexToUnicodeHex(
                                    trimString(_pattern, firstUnicodeIndex, int256(lastUnicodeIndex))
                                );
                                rightAtomDecimal = hexToDec(unicodeHex);
                            } else {
                                rightAtomDecimal = uint8(_pattern[i + 1]);
                            }

                            if (leftAtomDecimal > rightAtomDecimal) {
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

    function isGroup(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, bytes, uint256) {
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
            ) {
                string memory errorMsg = string(
                    abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern, ": Unterminated group")
                );
                revert(errorMsg);
            }
        }

        if (
            (_currentParticleIndex == 0 && uint8(_pattern[_currentParticleIndex]) == OPEN_PARANTHESIS)
                || ((_currentParticleIndex > 0
                        && _currentParticleIndex < _pattern.length - 1
                        && uint8(_pattern[_currentParticleIndex]) == OPEN_PARANTHESIS)
                    && (uint8(_pattern[_currentParticleIndex - 1]) != BACK_SLASH
                        || (_currentParticleIndex > 1 && uint8(_pattern[_currentParticleIndex - 2]) == BACK_SLASH)))
        ) {
            (flag, lastMatchedParticleIndex) = validateGroup(_pattern, _currentParticleIndex + 1);
        }

        if (flag) {
            return (true, GROUP_ATOM, lastMatchedParticleIndex);
        }
        return (false, INVALID_ATOM, 0);
    }

    function validateGroup(bytes memory _pattern, uint256 _currentParticleIndex) private pure returns (bool, uint256) {
        if (uint8(_pattern[_currentParticleIndex]) == CLOSE_PARANTHESIS) {
            return (true, _currentParticleIndex);
        }

        if (uint8(_pattern[_currentParticleIndex]) == QUESTION_MARK) {
            if (_currentParticleIndex + 1 <= _pattern.length - 1) {
                if (
                    (uint8(_pattern[_currentParticleIndex + 1]) != COLON
                            && uint8(_pattern[_currentParticleIndex + 1]) != ASSIGNMENT_SIGN
                            && uint8(_pattern[_currentParticleIndex + 1]) != EXCLAMATION_MARK
                            && uint8(_pattern[_currentParticleIndex + 1]) != LESS_THAN_SIGN)
                        || uint8(_pattern[_currentParticleIndex + 1]) == LESS_THAN_SIGN
                ) {}
            }
        }

        uint256 numOpenParanthesis = 1;
        uint256 numCloseParanthesis;

        for (uint256 i = _currentParticleIndex + 1; i < _pattern.length; i++) {
            if (uint8(_pattern[i]) == OPEN_PARANTHESIS) {
                numOpenParanthesis++;
            }

            if (uint8(_pattern[i]) == CLOSE_PARANTHESIS) {
                numCloseParanthesis++;
            }

            if (
                numOpenParanthesis == numCloseParanthesis && uint8(_pattern[i]) == CLOSE_PARANTHESIS
                    && (uint8(_pattern[i - 1]) != BACK_SLASH || uint8(_pattern[i - 2]) == BACK_SLASH)
            ) {
                return (true, i);
            }
        }

        string memory errorMsg =
            string(abi.encodePacked("SyntaxError: Invalid regular expression: ", _pattern, ": Unterminated group"));
        revert(errorMsg);
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

        if (propertyName.length < 2) {
            return (false, 0);
        }

        bool isValidProperty = validatePropertyName(propertyName);

        if (isValidProperty) {
            return (true, propertyNameEndIdx + 1);
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

        return isBinaryValue(propertyValueHash);
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

    function hexToDec(bytes memory _hexString) internal pure returns (uint256) {
        uint256 hexStringLastIndex = _hexString.length - 1;
        bytes memory hexFullBinary;

        for (uint256 hi = hexStringLastIndex; hi >= 0; hi--) {
            bytes memory binary = hexToBinary(_hexString[hi]);
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

    function hexToBinary(bytes1 _hex) private pure returns (bytes memory) {
        uint8 decimal = uint8(_hex);
        bytes memory binary = decimalToBinaryAscii(decimal);
        return binary;
    }

    function decimalToBinaryAscii(uint8 decimal) private pure returns (bytes memory) {
        console2.log("decccc: ", decimal);
        bytes memory binary;
        while (decimal != 0) {
            binary = decimal % 2 == 0 ? abi.encodePacked("0", binary) : abi.encodePacked("1", binary);
            decimal = decimal >> 1;
        }

        uint256 bl = binary.length;
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

        console2.logBytes(binary);
        console2.log("---");
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
