# StringRay Regex

**Version:** 1.0.0

StringRay Regex is a regular expression engine designed for **Solidity**. The goal of this project is to bring a familiar and practical regex experience to smart contract development while remaining mindful of the constraints of the EVM.

## Features

- Full regular expression support for Solidity.
- Core regex constructs including literals, character classes, groups, alternation, anchors, quantifiers, and related matching behavior.
- Common string utility functions such as:
  - `includes()`
  - `indexOf()`
  - `charAt()`
  - and other foundational string helpers.

## Deliberately Unsupported

Regex **flags** (such as JavaScript's `g`, `i`, `~m`, `~s`, etc.) and **Unicode property matching** are intentionally **walled off** in this release.

This is a deliberate design decision rather than an omission. These features are currently bricked to keep the engine focused, deterministic, and better aligned with Solidity and EVM constraints.

## Project Status

This is **Version 1.0.0**.

The project is functional but still under active development.

Current limitations include:

- Additional performance optimizations are still pending.
- Internal implementation can be further refined.
- More regex capabilities and utility functions are planned for future releases.
- APIs may evolve as the project matures.

## Inspiration

StringRay Regex is heavily inspired by **JavaScript's regular expression model**. The overall syntax and developer experience are intended to feel familiar to JavaScript developers.

However, because this engine targets **Solidity**, some regex features and implementation details may intentionally differ from JavaScript where required by the execution environment or project design goals.

## License

MIT License.

## Installation

```bash
forge install https://github.com/theirrationalone/stringray-regex
```

## Usecases

Explore `test/StringrayTest.t.sol/`

- Match Characters:

```solidity
function testRegexPatternMatchCase1() public {
    string memory target = "thithing";
    string memory pattern = unicode"/thin/";

    Stringray.ReturnData memory returnedData = stringray.regex(target, pattern);
    console2.log("------------------returnedData------------------");
    console2.log("Pattern string   : ", returnedData.patternString);
    console2.log("Original string  : ", returnedData.originalString);
    console2.log("Matched string   : ", returnedData.matchedString);
    console2.log("Match start index: ", returnedData.matchStartIndex);
    console2.log("Match end index  : ", returnedData.matchEndIndex);
    console2.log("------------------------------------");
}
```

- Output:

```bash
  ------------------returnedData------------------
  Pattern string   :  /thin/
  Original string  :  thithing
  Matched string   :  thin
  Match start index:  3
  Match end index  :  6
  ------------------------------------
```

- Match escapes:

```solidity
function testRegexPatternMatchCase279() public {
    bytes memory utf8Hex = stringray.unicodeHexToUtf8Hex(abi.encodePacked("\\u{10FFFF}"));
    string memory target = string(abi.encodePacked("secResearch", utf8Hex, "0@Cyfrin"));
    string memory pattern = unicode"/\\u{10FFFF}/u";

    Stringray.ReturnData memory returnedData = stringray.regex(target, pattern);
    console2.log("------------------returnedData------------------");
    console2.log("Pattern string   : ", returnedData.patternString);
    console2.log("Original string  : ", returnedData.originalString);
    console2.log("Matched string   : ", returnedData.matchedString);
    console2.log("Match start index: ", returnedData.matchStartIndex);
    console2.log("Match end index  : ", returnedData.matchEndIndex);
    console2.log("------------------------------------");
}
```

- Output:

```bash
Ran 1 test for test/StringrayTest.t.sol:PlayStringTest
[PASS] testRegexPatternMatchCase279() (gas: 918177)
Logs:
  hex to dec init
  _hexStringLength:  6
  hex to dec end
  converted decimal init
  converted decimal end
  hex to dec init
  _hexStringLength:  6
  hex to dec end
  converted decimal init
  converted decimal end
  hex to dec init
  _hexStringLength:  6
  hex to dec end
  converted decimal init
  converted decimal end
  ------------------returnedData------------------
  Pattern string   :  /\u{10FFFF}/u
  Original string  :  secResearch􏿿0@Cyfrin
  Matched string   :  􏿿
  Match start index:  11
  Match end index  :  14
  ------------------------------------

Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 13.42ms (1.67ms CPU time)

Ran 1 test suite in 14.15ms (13.42ms CPU time): 1 tests passed, 0 failed, 0 skipped (1 total tests)
```

- Match Character Classes:

```solidity
function testRegexPatternMatchCharacterClassesCase57() public {
    bytes memory utf8Hex = stringray.unicodeHexToUtf8Hex(abi.encodePacked("\\u{3}"));
    string memory target = string(abi.encodePacked("neh", utf8Hex, "al"));
    string memory pattern = unicode"/[[\\ca\\cb\\cC]--[\\cb]]/v";

    Stringray.ReturnData memory returnedData = stringray.regex(target, pattern);
    console2.log("------------------returnedData------------------");
    console2.log("Pattern string   : ", returnedData.patternString);
    console2.log("Original string  : ", returnedData.originalString);
    console2.log("Matched string   : ", returnedData.matchedString);
    console2.log("Match start index: ", returnedData.matchStartIndex);
    console2.log("Match end index  : ", returnedData.matchEndIndex);
    console2.log("------------------------------------");
}
```

- Output:

```bash
------------------returnedData------------------
  Pattern string   :  /[[\ca\cb\cC]--[\cb]]/v
  Original string  :  nehal
  Matched string   :  
  Match start index:  3
  Match end index  :  3
  ------------------------------------
  ```

  - Match Groups:

  ```solidity
  function testRegexPatternMatchGroupsCase144() public {
      string memory target = "shaeb$ @1A@1ba 3@drishti_nehal_2008";
      string memory pattern = unicode"/(?<=_)nehal(?=_)/";

      Stringray.ReturnData memory returnedData = stringray.regex(target, pattern);
      console2.log("------------------returnedData------------------");
      console2.log("Pattern string         : ", returnedData.patternString);
      console2.log("Original string        : ", returnedData.originalString);
      console2.log("Matched string         : ", returnedData.matchedString);
      console2.log("Match start index      : ", returnedData.matchStartIndex);
      console2.log("Match end index        : ", returnedData.matchEndIndex);
      uint256 i;
      for (i = 0; i < returnedData.groupMatchedData.length; i++) {
          console2.log("Group pattern string   : ", returnedData.groupMatchedData[i].groupPatternString);
          console2.log("Group matched string   : ", returnedData.groupMatchedData[i].groupMatchedString);
          console2.log("Group match start index: ", returnedData.groupMatchedData[i].groupMatchStartIndex);
          console2.log("Group match end index  : ", returnedData.groupMatchedData[i].groupMatchEndIndex);
          console2.log("Group number           : ", returnedData.groupMatchedData[i].groupNum);
      }

      for (i = 0; i < returnedData.groupNames.length; i++) {
          console2.log("---start---");
          console2.log("Group Name             : ", string(returnedData.groupNames[i].groupName));
          console2.log("Group matched string   : ", string(returnedData.groupNames[i].matchedString));
          console2.log("---end---");
      }
      console2.log("------------------------------------");
  }
  ```

  - Output:

  ```bash
  Ran 1 test for test/StringrayTest.t.sol:PlayStringTest
  [PASS] testRegexPatternMatchGroupsCase144() (gas: 980524)
  Logs:
    ------------------returnedData------------------
    Pattern string         :  /(?<=_)nehal(?=_)/
    Original string        :  shaeb$ @1A@1ba 3@drishti_nehal_2008
    Matched string         :  nehal
    Match start index      :  25
    Match end index        :  29
    ------------------------------------

  Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 10.45ms (656.31µs CPU time)

  Ran 1 test suite in 11.43ms (10.45ms CPU time): 1 tests passed, 0 failed, 0 skipped (1 total tests)
  ```

  - Match Anchors:

  ```solidity
  function testRegexPatternMatchAnchorsCase57() public {
      string memory target = "a\nb\nc";
      string memory pattern = unicode"/^a$/m";

      Stringray.ReturnData memory returnedData = stringray.regex(target, pattern);
      console2.log("------------------returnedData------------------");
      console2.log("Pattern string         : ", returnedData.patternString);
      console2.log("Original string        : ", returnedData.originalString);
      console2.log("Matched string         : ", returnedData.matchedString);
      console2.log("Match start index      : ", returnedData.matchStartIndex);
      console2.log("Match end index        : ", returnedData.matchEndIndex);
      uint256 i;
      for (i = 0; i < returnedData.groupMatchedData.length; i++) {
          console2.log("Group pattern string   : ", returnedData.groupMatchedData[i].groupPatternString);
          console2.log("Group matched string   : ", returnedData.groupMatchedData[i].groupMatchedString);
          console2.log("Group match start index: ", returnedData.groupMatchedData[i].groupMatchStartIndex);
          console2.log("Group match end index  : ", returnedData.groupMatchedData[i].groupMatchEndIndex);
          console2.log("Group number           : ", returnedData.groupMatchedData[i].groupNum);
      }

      for (i = 0; i < returnedData.groupNames.length; i++) {
          console2.log("---start---");
          console2.log("Group Name             : ", string(returnedData.groupNames[i].groupName));
          console2.log("Group matched string   : ", string(returnedData.groupNames[i].matchedString));
          console2.log("---end---");
      }
      console2.log("------------------------------------");
  }
```

- Output:

```bash
Ran 1 test for test/StringrayTest.t.sol:PlayStringTest
[PASS] testRegexPatternMatchAnchorsCase57() (gas: 332802)
Logs:
  ------------------returnedData------------------
  Pattern string         :  /^a$/m
  Original string        :  a
b
c
  Matched string         :  a
  Match start index      :  0
  Match end index        :  0
  ------------------------------------

Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 9.65ms (225.33µs CPU time)

Ran 1 test suite in 10.22ms (9.65ms CPU time): 1 tests passed, 0 failed, 0 skipped (1 total tests)
```

- Match Character classes in negation mode:

```solidity
function testRegexPatternMatchCharacterClassNegationCase93() public {
      string memory target = unicode"PRAGMASOLIDITY=dEaD";
      string memory pattern = unicode"/[^[[^a-z]&&[A-Z]]]/v";

      Stringray.ReturnData memory returnedData = stringray.regex(target, pattern);
      console2.log("------------------returnedData------------------");
      console2.log("Pattern string         : ", returnedData.patternString);
      console2.log("Original string        : ", returnedData.originalString);
      console2.log("Matched string         : ", returnedData.matchedString);
      console2.log("Match start index      : ", returnedData.matchStartIndex);
      console2.log("Match end index        : ", returnedData.matchEndIndex);
      uint256 i;
      for (i = 0; i < returnedData.groupMatchedData.length; i++) {
          console2.log("Group pattern string   : ", returnedData.groupMatchedData[i].groupPatternString);
          console2.log("Group matched string   : ", returnedData.groupMatchedData[i].groupMatchedString);
          console2.log("Group match start index: ", returnedData.groupMatchedData[i].groupMatchStartIndex);
          console2.log("Group match end index  : ", returnedData.groupMatchedData[i].groupMatchEndIndex);
          console2.log("Group number           : ", returnedData.groupMatchedData[i].groupNum);
      }

      for (i = 0; i < returnedData.groupNames.length; i++) {
          console2.log("---start---");
          console2.log("Group Name             : ", string(returnedData.groupNames[i].groupName));
          console2.log("Group matched string   : ", string(returnedData.groupNames[i].matchedString));
          console2.log("---end---");
      }
      console2.log("------------------------------------");
  }
```

- Output:

```bash
------------------returnedData------------------
  Pattern string         :  /[^[[^a-z]&&[A-Z]]]/v
  Original string        :  PRAGMASOLIDITY=dEaD
  Matched string         :  =
  Match start index      :  14
  Match end index        :  14
  ------------------------------------
```

- Match with quantifiers:

```solidity
function testRegexPatternMatchQuantifiersCase15() public {
    string memory target = unicode"nehaaaaaaaaaaal";
    string memory pattern = unicode"/a??l/";

    Stringray.ReturnData memory returnedData = stringray.regex(target, pattern);
    console2.log("------------------returnedData------------------");
    console2.log("Pattern string         : ", returnedData.patternString);
    console2.log("Original string        : ", returnedData.originalString);
    console2.log("Matched string         : ", returnedData.matchedString);
    console2.log("Match start index      : ", returnedData.matchStartIndex);
    console2.log("Match end index        : ", returnedData.matchEndIndex);
    uint256 i;
    for (i = 0; i < returnedData.groupMatchedData.length; i++) {
        console2.log("Group pattern string   : ", returnedData.groupMatchedData[i].groupPatternString);
        console2.log("Group matched string   : ", returnedData.groupMatchedData[i].groupMatchedString);
        console2.log("Group match start index: ", returnedData.groupMatchedData[i].groupMatchStartIndex);
        console2.log("Group match end index  : ", returnedData.groupMatchedData[i].groupMatchEndIndex);
        console2.log("Group number           : ", returnedData.groupMatchedData[i].groupNum);
    }

    for (i = 0; i < returnedData.groupNames.length; i++) {
        console2.log("---start---");
        console2.log("Group Name             : ", string(returnedData.groupNames[i].groupName));
        console2.log("Group matched string   : ", string(returnedData.groupNames[i].matchedString));
        console2.log("---end---");
    }
    console2.log("------------------------------------");
}
```

- Output:

```bash
Ran 1 test for test/StringrayTest.t.sol:PlayStringTest
[PASS] testRegexPatternMatchQuantifiersCase15() (gas: 391223)
Logs:
  ------------------returnedData------------------
  Pattern string         :  /a??l/
  Original string        :  nehaaaaaaaaaaal
  Matched string         :  al
  Match start index      :  13
  Match end index        :  14
  ------------------------------------

Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 9.55ms (471.18µs CPU time)

Ran 1 test suite in 10.08ms (9.55ms CPU time): 1 tests passed, 0 failed, 0 skipped (1 total tests)
```

- Match with . wild card:

```solidity
function testRegexPatternMatchDotWildcardCase3() public {
    bytes memory utf8Hex = stringray.unicodeHexToUtf8Hex(abi.encodePacked("\\u{2029}"));
    bytes memory utf8Hex2 = stringray.unicodeHexToUtf8Hex(abi.encodePacked("\\u{1F600}"));
    bytes memory utf8Hex3 = stringray.unicodeHexToUtf8Hex(abi.encodePacked("\\u{2028}"));
    console2.log("----------------");
    console2.log("utf8Hex: ");
    console2.logBytes(utf8Hex);
    console2.log("utf8Hex2: ");
    console2.logBytes(utf8Hex2);
    console2.log("utf8Hex3: ");
    console2.logBytes(utf8Hex3);
    console2.log("----------------");
    string memory target = string(abi.encodePacked(utf8Hex, utf8Hex2, utf8Hex3, "nehal is aman's niece"));
    string memory pattern = unicode"/\\u{2029}./u";

    Stringray.ReturnData memory returnedData = stringray.regex(target, pattern);
    console2.log("------------------returnedData------------------");
    console2.log("Pattern string         : ", returnedData.patternString);
    console2.log("Original string        : ", returnedData.originalString);
    console2.log("Matched string         : ", returnedData.matchedString);
    console2.log("Match start index      : ", returnedData.matchStartIndex);
    console2.log("Match end index        : ", returnedData.matchEndIndex);
    uint256 i;
    for (i = 0; i < returnedData.groupMatchedData.length; i++) {
        console2.log("Group pattern string   : ", returnedData.groupMatchedData[i].groupPatternString);
        console2.log("Group matched string   : ", returnedData.groupMatchedData[i].groupMatchedString);
        console2.log("Group match start index: ", returnedData.groupMatchedData[i].groupMatchStartIndex);
        console2.log("Group match end index  : ", returnedData.groupMatchedData[i].groupMatchEndIndex);
        console2.log("Group number           : ", returnedData.groupMatchedData[i].groupNum);
    }

    for (i = 0; i < returnedData.groupNames.length; i++) {
        console2.log("---start---");
        console2.log("Group Name             : ", string(returnedData.groupNames[i].groupName));
        console2.log("Group matched string   : ", string(returnedData.groupNames[i].matchedString));
        console2.log("---end---");
    }
    console2.log("------------------------------------");
}
```

- Output:

```bash
Ran 1 test for test/StringrayTest.t.sol:PlayStringTest
[PASS] testRegexPatternMatchDotWildcardCase3() (gas: 802711)
Logs:
  ----------------
  utf8Hex: 
  0xe280a9
  utf8Hex2: 
  0xf09f9880
  utf8Hex3: 
  0xe280a8
  ----------------
  ------------------returnedData------------------
  Pattern string         :  /\u{2029}./u
  Original string        :   😀 nehal is aman's niece
  Matched string         :   😀
  Match start index      :  0
  Match end index        :  6
  ------------------------------------

Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 11.70ms (1.12ms CPU time)

Ran 1 test suite in 12.30ms (11.70ms CPU time): 1 tests passed, 0 failed, 0 skipped (1 total tests)
```

