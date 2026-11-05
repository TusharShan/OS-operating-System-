# Shell Redirection & the `sed` Stream Editor

A classroom-friendly reference to Linux shell redirection and the `sed`
(Stream Editor) command, with practical examples for printing, deleting,
substituting, matching, capturing, and swapping text.

## Contents

1.  [Shell Redirection](#1-shell-redirection)
2.  [What Is sed?](#2-what-is-sed)
3.  [Printing Lines](#3-printing-lines)
4.  [Deleting Lines](#4-deleting-lines)
5.  [Substituting Text](#5-substituting-text)
6.  [Editing Files and Creating
    Backups](#6-editing-files-and-creating-backups)
7.  [Patterns and Regular
    Expressions](#7-patterns-and-regular-expressions)
8.  [Capturing Groups and Swapping
    Words](#8-capturing-groups-and-swapping-words)
9.  [Quick Reference](#9-quick-reference)

## 1. Shell Redirection

Run commands sequentially with `;` or conditionally with `&&`.

``` bash
date; who > logged_users.txt
```

-   `date` displays the current date and time.
-   `;` runs the next command after the previous command finishes.
-   `who` lists currently logged-in users.
-   `>` redirects the output of `who` into `logged_users.txt`.

The availability and reliability of `who` depend on the system
environment. The source notes suggest `w` or `whoami` as alternatives.

## 2. What Is sed?

`sed` stands for **Stream Editor**. It is a Linux command-line utility
that reads text, applies specified operations, and produces transformed
output. It can print selected lines, delete lines from output, search
for text, replace text, and perform pattern-based transformations.

Unlike an interactive editor such as Nano, `sed` normally processes text
without opening an interactive editing screen.

General form:

``` bash
sed [options] 'expression' FILE
```

## 3. Printing Lines

Display all lines using `sed`:

``` bash
sed -n 'p' Names.txt
```

-   `-n` suppresses automatic printing.
-   `p` explicitly prints selected lines.
-   `Names.txt` is the input file.

Print only line 2:

``` bash
sed -n '2p' Names.txt
```

Print lines 2 through 4:

``` bash
sed -n '2,4p' Names.txt
```

## 4. Deleting Lines

Delete line 2 from the output:

``` bash
sed '2d' Names.txt
```

Delete the first line or last line from the output:

``` bash
sed '1d' Names.txt
sed '$d' Names.txt
```

These commands do not change the original file. To apply the deletion to
the original file, use `-i`:

``` bash
sed -i '2d' Names.txt
```

## 5. Substituting Text

Basic substitution syntax:

``` bash
sed 's/old_text/new_text/' FILE
```

Example:

``` bash
sed 's/John/Amit/' Names.txt
```

By default, only the first matching occurrence on each line is replaced.
Add `g` to replace all occurrences on each line:

``` bash
sed 's/John/Amit/g' Names.txt
```

## 6. Editing Files and Creating Backups

Without `-i`, `sed` displays the modified result but leaves the original
file unchanged.

Modify the original file:

``` bash
sed -i 's/John/Amit/g' Names.txt
```

Create a backup before modifying:

``` bash
sed -i.bak 's/John/Amit/g' Names.txt
```

This creates the modified `Names.txt` and a backup named
`Names.txt.bak`.

## 7. Patterns and Regular Expressions

### Beginning and end of a line

-   `^` matches the beginning of a line.
-   `$` matches the end of a line.

``` bash
sed 's/^John/Amit/' Names.txt
sed 's/John$/Amit/' Names.txt
```

### Replacing spaces

Replace every space with an underscore:

``` bash
sed 's/ /_/g' Names.txt
```

Replace only the first space on each line:

``` bash
sed 's/ /_/' Names.txt
```

### Other patterns

-   `.` matches any single character.
-   `*` means zero or more occurrences of the preceding pattern.
-   `[^ ]` matches any character except a space.
-   `[^ ]*` matches zero or more non-space characters.

Example: match a three-character pattern whose last two characters are
`at`:

``` bash
sed 's/.at/XXX/' file.txt
```

Replace the first word on each line:

``` bash
sed 's/[^ ]*/WORD/' Names.txt
```

## 8. Capturing Groups and Swapping Words

In basic `sed` regular expressions, parentheses are escaped to create
capturing groups:

``` bash
\(...\)
```

Capture the first word and wrap it in braces:

``` bash
sed 's/\([^ ]*\)/{\1}/' Names.txt
```

Capture the first two words and refer to them as `\1` and `\2`:

``` bash
sed 's/\([^ ]*\) \([^ ]*\)/\1-\2/' Names.txt
```

### Swap the first two words on every line

``` bash
sed 's/^\([^ ]*\) \([^ ]*\)/\2 \1/' Names.txt
```

For example:

``` text
John Doe
Alice Smith
Rahul Sharma
```

Becomes:

``` text
Doe John
Smith Alice
Sharma Rahul
```

To save the swapped result in the original file:

``` bash
sed -i 's/^\([^ ]*\) \([^ ]*\)/\2 \1/' Names.txt
```

To keep a backup first:

``` bash
sed -i.bak 's/^\([^ ]*\) \([^ ]*\)/\2 \1/' Names.txt
```

How the pattern works:

1.  `^` starts matching at the beginning of the line.
2.  `\([^ ]*\)` captures the first word as Group 1.
3.  The literal space matches the separator.
4.  `\([^ ]*\)` captures the second word as Group 2.
5.  `\2 \1` writes the second word followed by the first word.

### Complete practice example

Create a file:

``` bash
nano Names.txt
```

Add:

``` text
John Doe
Alice Smith
Rahul Sharma
Aniket Singh
```

Run:

``` bash
sed 's/^\([^ ]*\) \([^ ]*\)/\2 \1/' Names.txt
```

The output is:

``` text
Doe John
Smith Alice
Sharma Rahul
Singh Aniket
```

## 9. Quick Reference

  Symbol / command   Meaning
  ------------------ -----------------------------------
  `sed`              Stream Editor
  `-n`               Suppress automatic printing
  `p`                Print
  `d`                Delete from output
  `s`                Substitute
  `g`                Replace all matches on each line
  `-i`               Edit the original file in place
  `-i.bak`           Edit in place and create a backup
  `^`                Beginning of line
  `$`                End of line
  `.`                Any single character
  `*`                Zero or more occurrences
  `[^ ]`             Any character except a space
  `\(...\)`          Capture a group
  `\1`               First captured group
  `\2`               Second captured group

**Key idea:** `sed` identifies text using a pattern, then applies an
operation such as printing, deleting, or substituting. Capturing groups
let you reuse matched text in a replacement.

------------------------------------------------------------------------

These notes are based on the supplied classroom material and are
intended as a quick study and command reference.

