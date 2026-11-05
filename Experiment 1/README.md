# Linux System Administration & Process Management

A concise command-line reference covering essential Linux directory and
file operations, input/output redirection, pipes, text searching, file
discovery, terminal editors, and process management.

## Contents

1.  [Directory Operations](#1-directory-operations)
2.  [File Operations](#2-file-operations)
3.  [I/O Redirection](#3-io-redirection)
4.  [Pipes and Text Processing](#4-pipes-and-text-processing)
5.  [Finding Files](#5-finding-files)
6.  [Text Editors](#6-text-editors)
7.  [Linux Process Management](#7-linux-process-management)
8.  [Quick Process-Management
    Summary](#8-quick-process-management-summary)

## 1. Directory Operations

  -----------------------------------------------------------------------
  Command                             Purpose
  ----------------------------------- -----------------------------------
  `pwd`                               Print the current working directory

  `cd DIRECTORY`                      Change the current directory

  `cd ..`                             Move one directory up

  `cd -`                              Return to the previous directory

  `cd ~`                              Go to the home directory

  `mkdir DIRECTORY`                   Create a directory

  `mkdir -p PATH`                     Create parent directories when
                                      needed

  `mkdir -v DIRECTORY`                Show created directories

  `mkdir -m 700 DIRECTORY`            Create a directory with specified
                                      permissions

  `rmdir DIRECTORY`                   Remove an empty directory

  `rmdir -p PATH`                     Remove empty parent directories too
  -----------------------------------------------------------------------

## 2. File Operations

  -----------------------------------------------------------------------
  Command                             Purpose
  ----------------------------------- -----------------------------------
  `ls -lah`                           List files, including hidden files,
                                      with readable sizes and details

  `touch FILE`                        Create an empty file or update
                                      timestamps

  `cp SOURCE DEST`                    Copy a file

  `cp -r SOURCE DEST`                 Copy a directory recursively

  `cp -i SOURCE DEST`                 Ask before overwriting

  `cp -p SOURCE DEST`                 Preserve file attributes

  `mv SOURCE DEST`                    Move or rename a file/directory

  `mv -i SOURCE DEST`                 Ask before overwriting

  `mv -n SOURCE DEST`                 Do not overwrite an existing
                                      destination

  `rm FILE`                           Remove a file

  `rm -r DIRECTORY`                   Remove a directory and its contents

  `rm -i FILE`                        Ask before deleting

  `cat FILE`                          Display file contents

  `cat -n FILE`                       Display contents with line numbers

  `head -n 10 FILE`                   Display the first 10 lines

  `tail -n 10 FILE`                   Display the last 10 lines
  -----------------------------------------------------------------------

**Caution:** `rm` permanently deletes files. Check paths carefully,
especially when using recursive or force options such as `rm -rf`.

## 3. I/O Redirection

Linux processes use three standard streams:

  File descriptor   Stream   Purpose
  ----------------- -------- -----------------
  `0`               stdin    Standard input
  `1`               stdout   Standard output
  `2`               stderr   Standard error

Common redirection operators:

  --------------------------------------------------------------------------
  Operator                Purpose                 Example
  ----------------------- ----------------------- --------------------------
  `>`                     Write output, replacing `echo "hello" > myfile`
                          existing content        

  `>>`                    Append output to a file `echo "buddy" >> myfile`

  `<`                     Read input from a file  `cat < data1`

  `2>`                    Redirect errors         `command 2> error.txt`

  `&>`                    Redirect output and     `command &> output.txt`
                          errors together         
  --------------------------------------------------------------------------

Combine files or filter data into a new file:

``` bash
cat data1 data2 > data3
grep "Doctor" users.csv > doctor_data
```

## 4. Pipes and Text Processing

A pipe (`|`) sends the output of one command to another command.

``` bash
cat names.txt countries.txt | sort
cat names.txt | sort | uniq
cat data.txt | head -n 37 | tail -n 7
ls | tee test.txt
cat file_names.txt | xargs touch
```

-   `sort`: Sort lines.
-   `uniq`: Remove adjacent duplicate lines; sorting first helps group
    duplicates.
-   `tee`: Display input and write it to a file at the same time.
-   `xargs`: Convert standard input into command arguments.
-   `grep`: Search text using a pattern.

Useful `grep` examples:

``` bash
grep -i "error" logs.txt       # Ignore case
grep -v "error" logs.txt       # Exclude matching lines
grep -c "Doctor" users.csv     # Count matching lines
grep -w "Carly" users.csv      # Match a whole word
grep -n "Carly" users.csv      # Show line numbers
```

## 5. Finding Files

General syntax:

``` bash
find [path] [expression]
```

Examples:

``` bash
find . -size 4M
find . -name "a123"
find . -iname "a123"
find . -user root
find . -empty
```

-   `.` represents the current directory.
-   `-name` performs a case-sensitive name search.
-   `-iname` performs a case-insensitive name search.
-   `-size` searches by file size.
-   `-user` filters by owner.
-   `-empty` finds empty files and directories.

## 6. Text Editors

### Vi / Vim

Open a file:

``` bash
vim FILE
```

  Key/command   Action
  ------------- -----------------------------
  `i`           Enter Insert mode
  `Esc`         Return to Normal mode
  `:w`          Save
  `:q`          Quit
  `:wq`         Save and quit
  `:q!`         Quit without saving
  `dd`          Delete/cut the current line
  `yy`          Copy the current line
  `p`           Paste below the cursor
  `u`           Undo
  `/pattern`    Search forward

### Nano

Open a file:

``` bash
nano FILE
```

  Shortcut     Action
  ------------ -----------------------
  `Ctrl + O`   Save/write the file
  `Ctrl + X`   Exit
  `Ctrl + W`   Search
  `Ctrl + K`   Cut the current line
  `Ctrl + U`   Paste/uncut
  `Ctrl + _`   Jump to a line number

## 7. Linux Process Management

### Job control

  Command   Purpose
  --------- ----------------------------------------
  `jobs`    Show jobs managed by the current shell
  `bg`      Resume a stopped job in the background
  `bg %2`   Resume job 2 in the background
  `fg`      Bring a job to the foreground
  `fg %2`   Bring job 2 to the foreground

Example:

``` bash
sleep 100
# Press Ctrl + Z to stop it
jobs
bg
fg
```

A **Job ID** is managed by the shell (for example, `%1`); a **PID**
identifies a process system-wide.

### Inspecting processes

  Command              Purpose
  -------------------- ----------------------------------------------------
  `ps`                 Show processes associated with the current session
  `ps -e`              Show all processes
  `ps -ef`             Show all processes in full-format detail
  `ps -p PID`          Inspect a specific process
  `ps -p PID -f`       Inspect a specific process in full format
  `ps -o pid,ni,cmd`   Select specific output columns
  `ps aux`             Show processes with CPU and memory information
  `top`                Monitor processes and resource usage live

Important process fields include `PID` (process ID), `PPID` (parent
process ID), `UID` (owner), `%CPU`, `%MEM`, `TTY`, `TIME`, and `CMD`.

### Signals and process control

  Command            Purpose
  ------------------ -----------------------------------
  `kill PID`         Send the default `SIGTERM` signal
  `kill -15 PID`     Request graceful termination
  `kill -9 PID`      Force immediate termination
  `kill -l`          List available signals
  `kill -STOP PID`   Stop/pause a process
  `kill -CONT PID`   Continue a stopped process

**Important:** Prefer `SIGTERM` (`kill PID` or `kill -15 PID`) first so
an application can clean up. Use `SIGKILL` (`kill -9 PID`) only when
necessary; it does not allow the process to handle cleanup.

### Process priority

  Command                Purpose
  ---------------------- --------------------------------------------
  `nice -n 10 COMMAND`   Start a process with a chosen nice value
  `renice 10 -p PID`     Change the nice value of a running process

Nice values range from `-20` (more favorable scheduling priority)
through `0` (default) to `+19` (less favorable priority). A nice value
is not a CPU-percentage limit.

## 8. Quick Process-Management Summary

-   **Job control:** `jobs`, `bg`, `fg`
-   **Process inspection:** `ps`, `ps -e`, `ps -ef`, `ps -p PID`,
    `ps aux`
-   **Process control:** `kill`, `kill -15`, `kill -9`, `kill -STOP`,
    `kill -CONT`, `kill -l`
-   **Priority:** `nice`, `renice`
-   **Live monitoring:** `top`

------------------------------------------------------------------------

These notes are intended as a quick reference for Linux system
administration and process-management practice. Run commands carefully
and verify paths and PIDs before making changes.
