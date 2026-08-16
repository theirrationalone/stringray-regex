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
  Original string        :  😀nehal is aman's niece
  Matched string         :  😀
  Match start index      :  0
  Match end index        :  6
  ------------------------------------

Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 11.70ms (1.12ms CPU time)

Ran 1 test suite in 12.30ms (11.70ms CPU time): 1 tests passed, 0 failed, 0 skipped (1 total tests)
```


## Acknowledgements


This project was inspired by the simplicity and expressiveness of **JavaScript's string and byte manipulation APIs especially the regex**. The goal was to bring some of that familiar developer experience into Solidity while respecting the constraints and characteristics of the EVM.

I would like to sincerely acknowledge the tools, platforms, documentation, and communities that contributed to the development of this project.

Special thanks to **JavaScript** and **MDN Web Docs** for inspiring the API design and developer experience behind this library. The familiar and expressive nature of JavaScript's string and byte-related APIs strongly influenced the philosophy of this project.

I would also like to acknowledge **OpenAI's ChatGPT**, which served as a development assistant, research companion, debugging partner, and sounding board throughout the development process. Beyond technical assistance, it was especially valuable during the more difficult moments of development—helping break down complex problems, explore alternative approaches, challenge assumptions, and keep the development process moving forward.

I am also grateful to **DeepSeek, Phind, Claude, GitHub Copilot, and Brave Search** for providing additional perspectives, research assistance, code exploration, and development support throughout the project.

These tools did not replace the underlying engineering, experimentation, testing, or decision-making involved in the project; rather, they served as assistants throughout the development journey.

To everyone who builds and maintains the open-source ecosystem, documentation, programming languages, developer tools, and research resources that make projects like this possible:

A special thanks to **MDN Web Docs** for its excellent documentation and clear explanations of JavaScript's `String`, `Array`, and related APIs. MDN served as an important reference for understanding and designing the API philosophy behind this tool.

This project is an independent implementation for Solidity and is **not affiliated with, endorsed by, or derived from the source code of JavaScript or MDN Web Docs**.

* **JavaScript** — inspiration for the API and developer experience.
* **MDN Web Docs** — reference and documentation for JavaScript behavior and APIs.
* **unicode org** - reference and documentation for property escapes.

**Thank you.** ❤️

## References

The following resources were consulted throughout the design, research, implementation, testing, and documentation of this project.

### Technical References

* **JavaScript** — inspiration for string/byte manipulation APIs and developer ergonomics.
  https://developer.mozilla.org/en-US/docs/Web/JavaScript

* **MDN Web Docs** — primary reference for JavaScript strings, arrays, typed arrays, encoding/decoding, and related APIs.
  https://developer.mozilla.org/

* **Unicode Consortium** — reference for Unicode standards, code points, character properties, encoding concepts, and Unicode terminology.
  https://unicode.org/

* **Solidity Documentation** — reference for Solidity language behavior, `string`, `bytes`, memory, calldata, ABI encoding, and related concepts.
  https://docs.soliditylang.org/

* **Ethereum Documentation** — reference for EVM concepts, execution, memory, calldata, and low-level Ethereum architecture.
  https://ethereum.org/developers/docs/

* **OpenZeppelin** — reference for Solidity development patterns, libraries, and established smart-contract engineering practices.
  https://docs.openzeppelin.com/

### Development & Research Assistance

* **ChatGPT — OpenAI** — conceptual exploration, debugging assistance, API design discussions, research, code reasoning, and development support.
  https://chatgpt.com/

* **DeepSeek** — supplementary reasoning, research, and code exploration.
  https://www.deepseek.com/

* **Phind** — developer-focused technical research and exploration.
  https://www.phind.com/

* **Claude — Anthropic** — supplementary reasoning, code review, research, and alternative perspectives.
  https://claude.ai/

* **GitHub Copilot** — code completion and development assistance.
  https://github.com/features/copilot

* **Brave Search** — web research and technical resource discovery.
  https://search.brave.com/

> These resources were used for learning, research, inspiration, experimentation, debugging, and development assistance. They do not imply endorsement of this project by any of the organizations or services listed above.

### Web3 & Educational Resources

* **Alchemy** — blockchain infrastructure, developer tooling, and ecosystem resources.
  https://www.alchemy.com/

* **Alchemy University** — Web3 education, developer learning resources, and hands-on blockchain development opportunities.
  https://www.alchemy.com/university

* **Cyfrin** — Web3 security education, smart-contract development resources, auditing methodologies, and blockchain security tooling.
  https://www.cyfrin.io/

* **Cyfrin Updraft** — hands-on learning resources for smart-contract development and Web3 security.
  https://updraft.cyfrin.io/

## 🚀 Next Career Advancement: Boarding Into Web3 Security

This project is not the destination. It is another step toward a much deeper goal: **building a career in Web3 security, with Solidity and EVM security at the core.**

My next phase is focused on going deeper into the security side of blockchain development—moving beyond simply writing smart contracts toward understanding **how they can fail, how they can be attacked, and how they can be designed to resist those attacks.**

The journey ahead includes:

* 🔐 **Solidity Security** — deeply understanding Solidity semantics, compiler behavior, storage, memory, calldata, ABI encoding, inheritance, modifiers, upgradeability, and low-level execution.
* ⚙️ **EVM Internals** — going beneath Solidity into opcodes, stack, memory, storage, gas, call frames, `delegatecall`, `CREATE/CREATE2`, returndata, revert mechanics, and execution flow.
* 🕵️ **Smart Contract Auditing** — developing the ability to systematically review protocols, identify vulnerabilities, reason about attack paths, and distinguish real security issues from theoretical concerns.
* 💥 **DeFi Security** — studying economic attacks, oracle manipulation, flash-loan attacks, accounting vulnerabilities, precision issues, liquidation mechanisms, governance attacks, MEV, and protocol-specific invariants.
* 🧪 **Security Research & Testing** — building stronger skills with Foundry, fuzzing, invariant testing, symbolic reasoning, differential testing, and adversarial test design.
* 🧠 **Protocol-Level Reasoning** — learning to understand an entire protocol's architecture, trust assumptions, invariants, state transitions, and economic model rather than analyzing isolated functions.
* 🛠️ **Low-Level Solidity & Yul** — continuing deeper into assembly and EVM-level programming to understand what Solidity ultimately becomes.
* 📚 **Security Research** — studying real-world exploits, audit reports, competitive audit findings, bug bounty disclosures, and post-mortems to develop practical vulnerability intuition.

### The Direction

> **Solidity Developer → Smart Contract Security Researcher → Web3 Security Researcher**

The objective is not merely to become someone who can write Solidity.

The objective is to understand Solidity **deeply enough to break it, reason about it, and ultimately secure it.**

Every project I build from here is intended to contribute toward that direction—one contract, one vulnerability, one audit, and one layer deeper into the EVM at a time.

I am also looking forward to exploring whether Alchemy offers a similar program for newcomers. For now, I have jumped into Cyfrin—thriving, struggling, breaking things, fixing them, and learning through every challenge along the way.

**The next chapter begins here.** 🚀🔐

## ❤️ A Final Thank You

A special and heartfelt **thank you to Alchemy and Alchemy University**.

Thank you for creating an opportunity that allowed me to step into Web3, learn, experiment, build, fail, rebuild, and keep going. What started as an opportunity to learn became a reason to challenge myself far beyond what I thought I could do.

The journey has not always been easy. There have been moments of confusion, frustration, self-doubt, and countless things that simply refused to work. But there have also been those moments when something finally clicks—and those moments make the struggle worth it.

I am deeply grateful for the opportunity to **learn, build, struggle, and thrive** within this ecosystem.

This project is one small representation of that journey.

**Thank you, Alchemy.
Thank you, Alchemy University.**

And now, onward to the next challenge. 🚀🔐

Regards,
theirrationalone
aka Anil Kushwaha

;`)
