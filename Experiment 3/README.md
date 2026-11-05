# Experiment 3: Bash Scripting, Conditionals & Loops

## Overview
A technical guide covering Bash scripting fundamentals, command-line arguments, positional parameters, conditional testing, loops, command substitution, arithmetic operations, and file-system manipulation in Linux.

## 1. What is a Shell Script?

A shell script is a text file containing commands executed by a shell such as Bash. It is useful for automating repetitive tasks.

**Example:**
```bash
#!/bin/bash
echo "Hello, Linux!"
date
pwd
```

## 2. Command-Line Arguments

Command-line arguments are values supplied to a script when it starts.

**Example:**
```bash
./myscript.sh hello.txt notes folder1
```

### Positional Parameters

| Parameter | Purpose |
|---|---|
| `$0` | Script name or path |
| `$1` | First argument |
| `$2` | Second argument |
| `$3` | Third argument |
| `$#` | Total number of arguments |
| `$@` | All supplied arguments |

## 3. Conditional Testing

Bash uses `test` or `[ ]` to check conditions.

### Integer Comparison Operators

| Operator | Meaning |
|---|---|
| `-eq` | Equal |
| `-ne` | Not equal |
| `-lt` | Less than |
| `-le` | Less than or equal |
| `-gt` | Greater than |
| `-ge` | Greater than or equal |

### File Attribute Operators

| Operator | Meaning |
|---|---|
| `-e` | Checks whether path exists |
| `-f` | Checks regular file |
| `-d` | Checks directory |
| `-s` | Checks whether file is non-empty |
| `-r` | Checks read permission |
| `-w` | Checks write permission |
| `-x` | Checks execute permission |

## 4. Command Substitution

Command substitution captures the output of a command.

```bash
current_date=$(date)
echo "$current_date"
```

## 5. Filename Manipulation

The `tr` command converts lowercase characters into uppercase.

```bash
echo "hello world" | tr '[:lower:]' '[:upper:]'
```

**Output:** `HELLO WORLD`

The `mv` command renames or moves files.

```bash
mv old.txt new.txt
```

## 6. Conditional Statements

### if Statement

Executes commands when the condition is true.

```bash
#!/bin/bash
if [ -f "notes.txt" ]
then
    echo "notes.txt is a regular file."
fi
```

### if-else Statement

Executes one block if the condition is true and another if it is false.

```bash
#!/bin/bash
if [ -f "notes.txt" ]
then
    echo "notes.txt is a regular file."
else
    echo "notes.txt is not a regular file."
fi
```

### How to Run

```bash
nano check.sh
touch notes.txt
chmod +x check.sh
./check.sh
```

## 7. Loops in Bash

### for Loop

Repeats commands for multiple values.

```bash
#!/bin/bash
for name in Ali Rahul Aman
do
    echo "Hello $name"
done
```

### while Loop

Repeats commands while the condition remains true.

```bash
#!/bin/bash
count=1
while (( count <= 5 ))
do
    echo "$count"
    ((count++))
done
```

### Numeric for Loop

```bash
#!/bin/bash
for i in {1..5}
do
    echo "Count: $i"
done
```

A step increment can also be used, such as `{1..10..2}`.

### C-style for Loop

```bash
#!/bin/bash
for (( i=1; i<=5; i++ ))
do
    echo "Number: $i"
done
```

### Loop Through Files

```bash
#!/bin/bash
for file in *.sh
do
    echo "Found script: $file"
done
```

### Loop Through File Contents

```bash
for item in $(cat fruits.txt)
do
    echo "Fruit: $item"
done
```

## 8. Arithmetic Operations

Bash uses `$(( ))` for arithmetic calculations.

```bash
a=10
b=3

echo "Addition: $((a + b))"
echo "Subtraction: $((a - b))"
echo "Multiplication: $((a * b))"
echo "Division: $((a / b))"
echo "Modulus: $((a % b))"
echo "Exponentiation: $((a ** b))"
```

## 9. Creating and Running a Shell Script

1. Create a file using `nano script_name.sh`.
2. Write Bash commands and save the file.
3. Give execute permission using `chmod +x script_name.sh`.
4. Run the script using `./script_name.sh`.
5. Pass arguments after the script name when required.

## 10. Practical Task: Check Whether an Argument Is a File or Directory

**Script:**

```bash
#!/bin/bash

if [ $# -ne 1 ]; then
    echo "No Argument passed, Try Again with an Argument"
    exit 1
fi

target="$1"

if [ -f "$target" ]; then
    echo "$target is a regular file."
elif [ -d "$target" ]; then
    echo "$target is a directory."
elif [ -e "$target" ]; then
    echo "$target exists, but is neither a regular file nor a directory."
else
    echo "Error: $target does not exist."
fi
```

**How to Run:**

```bash
chmod +x check_type.sh
./check_type.sh /etc/passwd
./check_type.sh /var/log
```

## 11. Practical Task: Rename Files to Uppercase

**Script:**

```bash
#!/bin/bash

# Loop through all arguments
for file in "$@"
do
    # Convert filename to uppercase and rename
    mv "$file" "$(echo "$file" | tr '[:lower:]' '[:upper:]')"
done
```

**How to Run:**

```bash
nano rename.sh
chmod +x rename.sh
touch notes.txt report.txt hello.txt
./rename.sh notes.txt report.txt hello.txt
```

**Expected filenames:**
- NOTES.TXT
- REPORT.TXT
- HELLO.TXT

**Important:** This script changes only filenames, not the contents of files.

## 12. Quick Reference

| Command / Concept | Purpose |
|---|---|
| `#!/bin/bash` | Specifies Bash interpreter |
| `$@` | All command-line arguments |
| `$#` | Number of arguments |
| `if`, `else`, `elif` | Conditional statements |
| `for`, `while` | Loops |
| `do`, `done` | Loop body |
| `$(command)` | Command substitution |
| `$(( ))` | Arithmetic expansion |
| `mv` | Rename or move files |
| `tr` | Translate characters |
| `chmod +x` | Give execute permission |

---

**Experiment 3: Bash Scripting, Conditionals & Loops**
