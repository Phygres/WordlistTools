# WordlistTools (wltools)

**WordlistTools** (`wltools`) is a Linux terminal utility for processing and managing wordlists.  
It can clean, merge, normalize, and format wordlists with flexible options.

---

## Installation

You can install **wltools** system-wide with:

```bash
curl -s https://raw.githubusercontent.com/phygres/wltools/main/install.sh | sudo bash
```

This will install the executable to `/usr/local/bin/wltools`, making it available globally as `wltools`.

---

## Usage

```bash
wltools [input-wordlist] [options]
```

### Options

| Option | Description |
|--------|-------------|
| `-o [output-file]` | **Optional.** Path to the output file. If not provided, defaults to `[input-filename].output` in the same directory. |
| `-a [file1] [file2] ...` | **Optional.** One or more additional wordlist files to append. Space-separated, no commas or parentheses. |
| `-l` | **Optional.** Convert all output words to lowercase. |
| `-L` | **Optional.** Convert all output words to uppercase. |
| `-s` | **Optional.** Sort the final output alphabetically. |
| `-d` | **Optional.** Disable cleanup. Keeps duplicates, empty lines, and whitespace. |
| `-h` | **Optional.** Show help and exit. |

---

## Examples

### Basic cleanup
```bash
wltools mylist.txt
# -> Produces mylist.txt.output
```

### Merge multiple lists
```bash
wltools base.txt -a extra1.txt extra2.txt -o merged.txt
```

### Normalize to lowercase and sort
```bash
wltools passwords.txt -l -s
```

### Keep duplicates and whitespace
```bash
wltools words.txt -d
```

### Convert to uppercase
```bash
wltools input.txt -L -o upper.txt
```

---

## Error Handling

- If no input wordlist is provided, `wltools` shows help and exits.
- If both `-l` and `-L` are set, the tool exits with an error.
- Missing files listed with `-a` trigger a warning but do not stop execution.
- If the output directory does not exist, it will be created.

---

## Dependencies

- Bash (≥4.0 recommended)
- Standard GNU/Linux utilities:
  - `awk`, `sort`, `cat`, `cp`, `mkdir`
  - `iconv` (optional, for UTF-8 normalization)

---

## License

This project is released under the [MIT License](LICENSE).

---

## Author

Developed by **phygres** (2025).
