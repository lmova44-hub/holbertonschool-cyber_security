
## Challenge 1

### Goal

Read the contents of `/home/user/flag`.

### Restriction

The filename was filtered, so using the exact filename directly was not possible.

### Solution

Used shell globbing to match the filename instead of typing it explicitly.

Example:

```bash
cat /home/user/????
```

This successfully matched the target file and revealed the flag.

---

## Challenge 2

### Additional Restrictions

The blacklist blocked:

- Space character (` `)
- Several common commands
- Multiple special characters
- Various shell keywords

### Solution

Used the Bash built-in variable `${IFS}` as a replacement for a space and split the filename using shell quoting so the blacklist would not match the exact forbidden string.

Example:

```bash
cat${IFS}/home/user/'fl'ag
```

The shell reconstructed the command during parsing, allowing the file to be read successfully.

---

## What I Learned

- How shell parsing works.
- The purpose of the `${IFS}` environment variable.
- Why simple string-based blacklists are insecure.
- How shell quoting affects command parsing.
- The difference between blacklist-based filtering and secure input validation.

---

## Key Concepts

- Bash
- Shell Parsing
- `${IFS}`
- Globbing
- Shell Quoting
- Command Blacklist
- Input Validation
