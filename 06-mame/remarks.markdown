The evolution of IRB in recent years has been nothing short of remarkable.
The latest "masterstroke" that has me hooked? Syntax highlighting.
It quite literally adds color to the world!

---

This tool is here to bring a splash of color to the world through IRB.
Ready to give it a go? Wait! Don't launch IRB just yet. First, run this:

```
$ cat trick.txt

$ ruby entry.rb trick.txt
```

At this point, the output still looks pretty bland.

Now, fire up IRB and paste the output in that output.
And voilà -- watch the colors come to the world!

(I have attached a screenshot trick2025-in-irb.png just in case.
Please refer to it if you don't understand what it means.)

---

Having trouble starting IRB? No worries, we've got `color.rb` to save your day.
Just run this instead:

```
$ ruby entry.rb trick.txt | ruby color.rb
```

Still not seeing colors? Your terminal emulator or environment might need some tweaking.
To check if IRB supports colors, run this command:

```
$ ruby -rirb/color -e 'p IRB::Color.colorable?'
true
```

If it returns true, you’re all set. Otherwise, check your terminal settings.

---

Need more fun? Here are a few extra examples for you to try out:

```
$ ruby entry.rb great-wave.txt | ruby color.rb
$ ruby entry.rb vermeer.txt | ruby color.rb
$ ruby entry.rb us-flag.txt | ruby color.rb
$ ruby entry.rb fr-flag.txt | ruby color.rb
$ ruby entry.rb ja-flag.txt | ruby color.rb
```

---

Basic algorithm.

The program reads a color placement pattern and replaces each character with a corresponding Ruby literal to generate colors.

* Consecutive `b`'s are replaced with an integer literal, `111...1`, which appears *blue*.
* `r`'s are replaced with a string literal, `";;;...;"`, which appears *red*.
* `g`'s are replaced with a global variable, `$iii...i`, which appears *green*.
* `y`'s are replaced with a symbol literal, `:iii...i`, which appears *yellow*.
* `m`'s are replaced with a floating-point literal, `1e111...1`, which appears *magenta*.
* `c`'s are replaced with a clever combination of `nil, `self`, and `false`, which appears *cyan*.
* Other consecutive letters are replaced with a generic sequence, `;;;...;`.

However, the color placement may be ignored in two cases:

* To prevent syntax errors – A direct sequence of literals (e.g., `11111 $iiiii`) would cause an error, so semicolons (`;`) may be inserted to separate them.
* When there isn’t enough space – Some replacements require multiple characters (e.g., a single `r` cannot be replaced with a valid string literal). In such cases, a semicolon may be used instead.

---

By the way, did you find it boring that entry.rb is just a square blob of code? Don't worry, here's a bonus challenge: try pasting entry.rb itself into IRB, or simply:

```
$ cat entry.rb | ruby color.rb
```

This bonus comes with strict constraints -- literal values (strings, numbers), keywords, and symbols can’t be used willy-nilly because IRB will color them. So, automatic code generation? Not an option. Every character of this program was meticulously crafted by hand.

---

This program was tested with Ruby versions 3.3.6 and 3.4.1. That said, the version of IRB probably matters more. I've confirmed that the program behaves as expected across all IRB releases from 0.9.6 to 1.15.1. However, the future of IRB's coloring behavior is... well, a bit uncertain.
