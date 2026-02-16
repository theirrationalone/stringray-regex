# Full ASCII Table with Regex Status (0-127)

### Legend
- **✔ Literal** — matches itself, no regex meaning  
- **❌ Meta** — regex operator / special meaning  
- **⚠ Escape-only** — literal, but must be expressed using an escape sequence (cannot be safely typed directly)

---

# ASCII 0–31 (Control Characters)

| Dec | Hex | Char | Name | Regex Status | Notes |
|-----|-----|------|------|--------------|-------|
| 0 | 00 | NUL | Null | ⚠ | use `\0` or `\x00` |
| 1 | 01 | SOH | Start of Heading | ⚠ | use `\x01` |
| 2 | 02 | STX | Start of Text | ⚠ | use `\x02` |
| 3 | 03 | ETX | End of Text | ⚠ | use `\x03` |
| 4 | 04 | EOT | End of Transmission | ⚠ | use `\x04` |
| 5 | 05 | ENQ | Enquiry | ⚠ | use `\x05` |
| 6 | 06 | ACK | Acknowledge | ⚠ | use `\x06` |
| 7 | 07 | BEL | Bell | ⚠ | use `\x07` |
| 8 | 08 | BS | Backspace | ⚠ | MUST use `\x08` — `\b` = word boundary |
| 9 | 09 | TAB | Horizontal Tab | ⚠ | use `\t` |
| 10 | 0A | LF | Line Feed | ⚠ | use `\n` |
| 11 | 0B | VT | Vertical Tab | ⚠ | use `\v` |
| 12 | 0C | FF | Form Feed | ⚠ | use `\f` |
| 13 | 0D | CR | Carriage Return | ⚠ | use `\r` |
| 14 | 0E | SO | Shift Out | ⚠ | use `\x0E` |
| 15 | 0F | SI | Shift In | ⚠ | use `\x0F` |
| 16 | 10 | DLE | Data Link Escape | ⚠ | use `\x10` |
| 17 | 11 | DC1 | Device Control 1 | ⚠ | use `\x11` |
| 18 | 12 | DC2 | Device Control 2 | ⚠ | use `\x12` |
| 19 | 13 | DC3 | Device Control 3 | ⚠ | use `\x13` |
| 20 | 14 | DC4 | Device Control 4 | ⚠ | use `\x14` |
| 21 | 15 | NAK | Negative Ack | ⚠ | use `\x15` |
| 22 | 16 | SYN | Synchronous Idle | ⚠ | use `\x16` |
| 23 | 17 | ETB | End Trans. Block | ⚠ | use `\x17` |
| 24 | 18 | CAN | Cancel | ⚠ | use `\x18` |
| 25 | 19 | EM | End of Medium | ⚠ | use `\x19` |
| 26 | 1A | SUB | Substitute | ⚠ | use `\x1A` |
| 27 | 1B | ESC | Escape | ⚠ | use `\x1B` |
| 28 | 1C | FS | File Separator | ⚠ | use `\x1C` |
| 29 | 1D | GS | Group Separator | ⚠ | use `\x1D` |
| 30 | 1E | RS | Record Separator | ⚠ | use `\x1E` |
| 31 | 1F | US | Unit Separator | ⚠ | use `\x1F` |

---

# ASCII 32–47 (Space & Basic Punctuation)

| Dec | Hex | Char | Name | Regex Status | Notes |
|-----|-----|------|------|--------------|-------|
| 32 | 20 | ␠ | Space | ✔ | fully literal |
| 33 | 21 | ! | Exclamation | ✔ | literal |
| 34 | 22 | " | Quotation Mark | ✔ | literal |
| 35 | 23 | # | Hash | ✔ | literal |
| 36 | 24 | $ | Dollar | ❌ | end anchor |
| 37 | 25 | % | Percent | ✔ | literal |
| 38 | 26 | & | Ampersand | ✔ | literal |
| 39 | 27 | ' | Apostrophe | ✔ | literal |
| 40 | 28 | ( | Left Paren | ❌ | group start |
| 41 | 29 | ) | Right Paren | ❌ | group end |
| 42 | 2A | * | Asterisk | ❌ | quantifier |
| 43 | 2B | + | Plus | ❌ | quantifier |
| 44 | 2C | , | Comma | ✔ | literal |
| 45 | 2D | - | Hyphen | ⚠ | special in ranges |
| 46 | 2E | . | Dot | ❌ | wildcard |
| 47 | 2F | / | Slash | ⚠ | must escape inside `/.../` |

---

# ASCII 48–64 (Digits + Additional Punctuation)

| Dec | Hex | Char | Name | Regex Status | Notes |
|-----|-----|------|------|--------------|-------|
| 48–57 | 30–39 | 0–9 | Digits | ✔ | literal |
| 58 | 3A | : | Colon | ✔ | literal |
| 59 | 3B | ; | Semicolon | ✔ | literal |
| 60 | 3C | < | Less Than | ✔ | literal |
| 61 | 3D | = | Equals | ✔ | literal |
| 62 | 3E | > | Greater Than | ✔ | literal |
| 63 | 3F | ? | Question Mark | ❌ | quantifier, lookaheads |
| 64 | 40 | @ | At Sign | ✔ | literal |

---

# ASCII 65–90 (Uppercase Letters)

All literal: `A–Z`

---

# ASCII 91–96 (Brackets + Symbols)

| Dec | Hex | Char | Name | Regex Status |
|-----|-----|------|------|--------------|
| 91 | 5B | [ | Left Bracket | ❌ |
| 92 | 5C | \ | Backslash | ❌ |
| 93 | 5D | ] | Right Bracket | ❌ |
| 94 | 5E | ^ | Caret | ❌ |
| 95 | 5F | _ | Underscore | ✔ |
| 96 | 60 | ` | Backtick | ✔ |

---

# ASCII 97–122 (Lowercase Letters)

All literal: `a–z`

---

# ASCII 123–126 (Braces, Pipe, Tilde)

| Dec | Hex | Char | Name | Regex Status |
|-----|-----|------|------|--------------|
| 123 | 7B | { | Left Brace | ❌ |
| 124 | 7C | \| | Vertical Bar | ❌ |
| 125 | 7D | } | Right Brace | ❌ |
| 126 | 7E | ~ | Tilde | ✔ |

---

# ASCII 127

| Dec | Hex | Char | Name | Regex Status | Notes |
|-----|-----|------|------|--------------|--------|
| 127 | 7F | DEL | Delete | ⚠ | `\x7F` only |

---

# Summary

## ✔ Literal Atoms (no escaping needed)
- Safe punctuation: `SPACE ! " # % & ' , : ; < = > @ _ ` ~`
- Safe characters: `0–9`, `A–Z`, `a–z`

## ❌ Regex Meta Characters (must escape)
 - . ^ $ * + ? ( ) [ ] { } | \


## ⚠ Literal Atoms Requiring Explicit Escapes
- Control characters: `\0`, `\x01…\x07`, `\x08`, `\t`, `\n`, `\v`, `\f`, `\r`, `\x0E…\x1F`, `\x7F`
- Contextual punctuation: `\/`, `\-`
