## What Is This?

This is an EAN-13 Barcode generator.
Give it an International Standard Book Number (ISBN), and it will output the corresponding barcode.

Running it normally won't produce any output. That would be too easy!
Instead, this program encodes the barcode **as its code coverage**.

## How to Run It

Enable code coverage measurement and executing entry.rb as follows:

```sh
$ ruby -rcoverage -e "Coverage.start; load 'entry.rb'; p Coverage.result" 978-0201710892
{"entry.rb"=>[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0]}
```

Lines executed 0 times are white; those executed once are black.

## How to Test It

We tested the generated barcode by using the [zbarimg command](https://zbar.sourceforge.net/).

We attached `barcov2png.rb`, a tool that converts code coverage data into a PNG barcode image.
Use it as follows:

```
$ ruby -rcoverage -e "Coverage.start; load 'entry.rb'; p Coverage.result" 978-0201710892 > out

$ ruby barcov2png.rb out > 978-0201710892.png

$ zbarimg 978-0201710892.png
EAN-13:9780201710892
scanned 1 barcode symbols from 1 images in 0 seconds
```

## The Implementation

Using code coverage as output imposes unusual constraints on how the Ruby code is written.

Each line of code is carefully designed to execute at most once. We avoid using constructs like `1.times { p }`, which Ruby's coverage library counts as executing twice. In other words, we must not use blocks.

At the same time, every line must be recognized as "executable" by the coverage library. Blank lines or lines containing only comments are reported as `nil` (not executable) rather than `0` (executable but not executed). This is easy to work around: wrapping an expression in parentheses, like `(p)`, convinces the coverage library that the line is executable. However, this also means we cannot use parentheses indiscriminately, as the coverage library may count an expression wrapped in parentheses as "executed."

In addition to these quirks, we must also adhere to the TRICK competition's 2048-character limit. This inevitably results in some delightful obfuscation.

## Miscellaneous

* The last digit of a 13-digit barcode is a check digit. Our program calculates it automatically.
* Running `entry.rb` with no arguments will show usage.
* 978-0201710892 is the ISBN of Dave Thomas's *Programming Ruby: A Pragmatic Programmer's Guide*.
* I have tested it with Ruby 3.3.6 and 3.4.2.
