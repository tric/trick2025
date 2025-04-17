## Remarks

### Ruby version

```
$ ruby -v
ruby 3.4.1 (2024-12-25 revision 48d4efcb85) +PRISM [arm64-darwin24]
```

### How to run the code

you can run the code by running the following command in the terminal.

```
ruby entry.rb Number
ruby entry.rb Kanji
ruby entry.rb RubyKaigi
```

and, all the outputs are ASCII art. The arguments are as follows:
- Number: prints the number 2025
- Kanji: prints the Kanji (Chinese character) "二〇二五" in Japanese calligraphy style
  - (someome may doubt that 〇 is not a kanji, but it is a kanji in the sense of "a character used in the Japanese writing system")
- RubyKaigi: prints the logo, and Date of RubyKaigi 2025

And, they are also a kind of quine, the output can be interpreted as the code itself.

> example1
```
ruby entry.rb Kanji > kanji.rb
ruby kanji.rb Kanji > kanji2.rb
diff -s kanji.rb kanji2.rb
```

> example2
```  example2
ruby entry.rb Number > number.rb
ruby number.rb Kanji > kanji.rb
ruby kanji.rb RubyKaigi > rubykaigi.rb
ruby rubykaigi.rb Number > number2.rb
diff -s number.rb number2.rb
```

And what’s particularly noteworthy is **2025 == 45 × 45**.   
Finding this characteristic intriguing, I decided to submit entry.rb in a 45 × 45 character format (2070 bytes).

## Internals

entry.rb might look complicated at first glance, but it’s essentially divided into two parts, Layout definition and Output logic.
Inside entry.rb, three critical variables are defined: l1, l2, and l3. Each corresponds to a 2D array that represents the ASCII art for:

- `l1`: Number(2025) ASCII art
- `l2`: Kanji(二〇二五) ASCII art
- `l3`: RubyKaigi logo ASCII art

The first dimension of these 2D arrays represents the line number, and the second dimension represents an alternating sequence of whitespace and characters.

However, reading and maintaining these layouts can be very challenging because they are heavily compressed to fit within the 2025-character code limit.

### Code Shortening Techniques
1. ASCII Encoding
  - Characters in the range 0–127 can be represented by single bytes. However, control characters (0–31), space (32), and DEL (127) proved troublesome.
  - Consequently, the range 33–126 was utilized, and through a mapping (126 – number), values in the range 0–93 were represented. This compression somewhat reduced the code size.
2. Eliminationg Duplication
  - Common fragments like the Kanji character 「二」 (for “2”) appear multiple times.
  - Assigning such strings to a variable and reusing them avoids repeating the same literal multiple times, further shrinking the code length.
3. Using `String#split`
  - In Ruby, `split` method can be used to split a string into an array of characters. By using this method, the code length can be reduced.
  - For instance, `['a','b','c','d','e','f','g','h','i','j','k']` is 45 characters, while `'a,b,c,d,e,f,g,h,i,j,k'.split(',')` can be written in 34 characters.


### Challenges

1.	Drawing ASCII Art
  -	The RubyKaigi logo Art was created with a script that merged two donut-shaped figures to outline the shape, and was then manually refined to achieve the desired look.
2.	Incorporating Three Layouts Under the Code Length Limit (2025 chars)
  -	Managing all three ASCII art layouts (Number, Kanji, RubyKaigi) within the 2025-character limit was quite restrictive.
  -	The compression techniques listed above were essential in keeping the code size below this limit.


ChatGPT was very helpful in shortening the code.

