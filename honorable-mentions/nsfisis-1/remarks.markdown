# Episode VII: The False Awakens

> A long time ago in a galaxy far,
> far away....




## Remarks

Just run it with:

```
$ ruby entry.rb
```

It will output "TRICK 2025".

It has been tested under the following environment:

```
$ ruby --version
ruby 3.4.1 (2024-12-25 revision 48d4efcb85) +PRISM [x86_64-linux]
```



## Description

The program consists of two parts:

* an interpreter of a subset of [FALSE esolang](https://esolangs.org/wiki/FALSE) and
* an obfuscated FALSE source code.

### FALSE interpreter

The interpreter part is embeeded into an ASCII art, "TRICK 2025" shaped like the Star Wars logo.
For more readable version, see `entry.clean.rb`.

### FALSE source code

The FALSE source code is encoded to the following expression:

```
  TrUE&FaLsE|TrUe&FaLse|TrUe&FAlSe|TrUE&FalSE|TrUe&FAlSe|TrUe&FaLse|TrUe&FaLse|TrUe&FaLse|TrUe&FaLse|TrUE&FAlsE|TrUe&FAlSE|TrUe&FALse|
  TrUE&FaLsE|TrUe&FAlSE|TrUe&FALse|TrUE&FalSe|TrUe&FALsE|TrUe&FALse|TrUE&FAlse|TrUe&FALsE|TrUe&FALse|TrUe&FALse|TrUE&FaLse|TrUE&FAlse|
  TrUe&FAlSe|TrUe&FALse|TrUE&FaLsE|TrUE&FalSe|TrUE&False|TrUE&FalSe|TrUe&FALSe|TrUe&FALSe|TrUe&FALSe|TrUe&FALSe|TrUE&FalSe|TrUE&FaLsE|
  TrUe&FAlSe|TrUe&FALse|false
```

Decoded version:

```
5$*3*$$$$9+,7+,2-,8-,,48*,5202....25*,
```

FALSE is a simple stack-based esolang. For instance,

* `5` pushes 5: `[5]`
* `$` duplicates the top: `[5 5]`
* `*` pushes the product: `[25]`
* `3` pushes 3: `[25 3]`
* `*` pushes the product: `[75]`
* `$$$$` duplicates the top 4 times: `[75 75 75 75 75]`
* `9` pushes 9: `[75 75 75 75 75 9]`
* `+` pushes the sum: `[75 75 75 75 84]`
* `,` writes the character: `[75 75 75 75]` (output `T`)
* `7` pushes 9: `[75 75 75 75 7]`
* `+` pushes the sum: `[75 75 75 82]`
* `,` writes the character: `[75 75 75]` (output `R`)
* ...


The source code is full of Star Wars references and homages.


```
# A long time ago in a galaxy far,
# far away....
```

This is the iconic Star Wars opening phrase.

```
# (inside the eval'ed code)

  while(c<p.size);
    if(!(i=p[c]));false;
    elsif"$"==i;s.push(s.last);
    elsif"%"==i;s.pop;
    ...
```

All comparison operations used in the program are written in the so-called "Yoda notation" (placing constants on the left hand side), referencing the Jedi Master Yoda.


```
     EPISODE_VII

  THE_FALSE_AWAKENS
```

This parodies the Star Wars Episode VII subtitle, "The Force Awakens."
"Force" refers to a supernatural power in Star Wars, but for our program, "false" has awakened instead because we used many `false`s.


```
  May.the.false.be.with.you;
```

This is a twist on one of the most famous Star Wars lines, "May the Force be with you."




## Internals

### FALSE interpreter

The interepreter is implemented as a method named `false`. In Ruby, you can use keywords as method names like this. It cannot be invoked directly, but you can call such a method via explicit receiver:`self.false()`


### Encoding the FALSE program

The FALSE program is obfuscated like this:

```
  TrUE&FaLsE|TrUe&FaLse|TrUe&FAlSe|TrUE&FalSE|TrUe&FAlSe|TrUe&FaLse|TrUe&FaLse|TrUe&FaLse|TrUe&FaLse|TrUE&FAlsE|TrUe&FAlSE|TrUe&FALse|
  TrUE&FaLsE|TrUe&FAlSE|TrUe&FALse|TrUE&FalSe|TrUe&FALsE|TrUe&FALse|TrUE&FAlse|TrUe&FALsE|TrUe&FALse|TrUe&FALse|TrUE&FaLse|TrUE&FAlse|
  TrUe&FAlSe|TrUe&FALse|TrUE&FaLsE|TrUE&FalSe|TrUE&False|TrUE&FalSe|TrUe&FALSe|TrUe&FALSe|TrUe&FALSe|TrUe&FALSe|TrUE&FalSe|TrUE&FaLsE|
  TrUe&FAlSe|TrUe&FALse|false
```

Each segment separated by `|` represents one instruction.

* `TrUE&FaLsE` => `5`
* `TrUe&FaLse` => `$`
* `TrUe&FAlSe` => `*`
* ...

This is achieved by defining `Object.const_missing`, `String#&`, and `String#|`.

First, our `const_missing `dynamically defines constants like `TrUE`:

```
# (inside the eval'ed code)

def Object.const_missing(n);
  const_set(n,n.to_s);
end;
```

With that, constant `TrUE` is resolved to string `"TrUE"`.

Second, such strings are concatenated with `&` with special decoding:

```
# (inside the eval'ed code)

class'String;
  def&(other);
    (self[1..]+other[1..])
      .chars
      .map{(_1.upcase==_1)??1:?0}
      .join
      .to_i(2)
      .chr;
  end;
end;
```

For `TrUE & FaLsE`,

```
    (self[1..]+other[1..])              # => "rUEaLsE"
      .chars                            # => ["r","U","E","a","L","s","E"]
      .map{(_1.upcase==_1)??1:?0}       # => ["0","1","1","0","1","0","1"]
      .join                             # => "0110101"
      .to_i(2)                          # => 53
      .chr;                             # => "5"
```

Finally, each FALSE instruction is concatenated by `|` operator:

```
# (inside the eval'ed code)

class'String;
  def|(other);
    (self||"")+(other||"");
  end;
end;
```


# Misc.

```
     EPISODE_VII

  THE_FALSE_AWAKENS
```

This code is equivalent to this:

```
     "EPISODE_VII"

  "THE_FALSE_AWAKENS"
```

It does nothing.

```
  May.the.false.be.with.you;
```

`May` is resolved to string `"May"` and the rest method chain is dispatched to `String#method_missing` defined here:

```
# (inside the eval'ed code)

class'String;
  def'method_missing(_);
    self;
  end;
end;
```

It does nothing too.





## Limitations

Our FALSE interpreter does not support the following instructions:

* `'c`: literal character "c"
* `ø`: pick
* `^`: input
* `"string"`: output "string"
* `ß`: flush the inout/output buffer.
* `{...}`: comments
* `\``: compile

Also, only one-digit numeric literals are supported, so `123` is interpreted as pushing `1`, `2` and `3` separately.
