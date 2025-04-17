# 3x3 Sliding Puzzle Quine



## Remarks

This is a quine-like program.

When run without arguments, it outputs `entry.rb` itself:

```
$ ruby entry.rb
$ ruby entry.rb | ruby
$ ruby entry.rb | ruby | ruby
```

It has been tested with the following environment:

```
$ ruby --version
ruby 3.4.1 (2024-12-25 revision 48d4efcb85) +PRISM [x86_64-linux]
```



## Description

This program is not only a quine but also a 3x3 sliding puzzle.


### How to Play

You can move a tile adjacent to the empty slot using `h` (left), `j` (down), `k` (up), `l` (right).
For example:

```
$ ruby entry.rb l
```

This command moves `8` to right.
Of course, the output source code is still a quine. These two commands' output are identical:

```
$ ruby entry.rb l
$ ruby entry.rb l | ruby
```


### How to Shuffle

You can shuffle the board by passing a seed as an argument:

```
$ ruby entry.rb 2025
```

The output puzzle can be solved using the following move sequence:

```
$ ruby entry.rb 2025 | \
    ruby - k | ruby - l | ruby - k | ruby - j | ruby - h | \
    ruby - j | ruby - l | ruby - k | ruby - h | ruby - j | \
    ruby - h | ruby - l | ruby - k | ruby - k | ruby - l | \
    ruby - j | ruby - h | ruby - h | ruby - k | ruby - j | \
    ruby - l | ruby - l | ruby - k | ruby - h | ruby - h > solved.rb
$ diff entry.rb solved.rb
```


### Interactive mode

In addition, it supports interactive mode. Simply run:

```
$ ruby entry.rb i
```

It will display the current board and ask for your next move.
You can exit by typing `q` in interactive mode.



## Internals

* `entry.pretty.rb` is a human-readable version.
* `$b` represents the board's current state.
* `$s` is the program's own source code for quine generation. It contains no "padding" characters, such as unnecessary parentheses, semicolons, or comments.
* Font data is encoded in the variables `n` and `m`.
* The string "TRICK EPISODE I" shown in the empty slot is removed using `gsub(/[[:upper:]]/)`. This works because there are no uppercase letters in `$s` except for that.
* The size of the `entry.rb` is 2025 byte.
