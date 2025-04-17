# Ruby implementation

Tested with Ruby 3.2.2 but should work with other environment

# How to run

> ruby entry.rb

# What it does

It prints entry.rb itself (Quine) and also generates `rubi.mp3` at the current directory.

That song (titled "The Rubi Song") consists of two sounds, "ru" and "bi".
When you replace "ru" with 0 and "bi" with 1, you may notice the first eight bytes
equals to the ascii code of `e', and then `v', `a', `l', ... and so on.

In that sense, this program emits itself as two ways - stdout and mp3 (Two-way Quine).

# Notes

- mp3 is now patent free
- mp3's high compression rate is good for shortcoding especially sounds that is
  difficult to make with calculation (like human voice.)
- It is very easy to combine mp3 data (just concatenate.)
