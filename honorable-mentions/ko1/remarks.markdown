### Remarks

This program shows nothing with `ruby` command:

```
$ ruby entry.rb

```

However, with `ruby -w' (enables warnings), you can see the following message:

```
$ ruby -w entry.rb
hello frozen string literal world
```

I confirmed the following implementations/platforms:

* ruby 3.4.1

### Description

This program demonstrates how many warnings are generated because of the
change of <https://bugs.ruby-lang.org/issues/20205> from Ruby 3.4 with `-w` option.

For example, `''.sub!(//,'')` shows the following warning:

```
$ ruby -we "''.sub!(//,'')"
-e:1: warning: literal string will be frozen in the future (run with --debug-frozen-string-literal for more information)
```

This program aggregates (1) which warning message (2) which method and 
(3) which line number of the warning for each warning by using 
`Warning.warn` into `$f`. (2) and (3) are collected by 
`caller_locations` and (2) utilizes new location format from Ruby 3.4.

At last, it sorts `$f` and shows a message by picking a character from 
warning messages and shows that characters.
