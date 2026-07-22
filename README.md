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