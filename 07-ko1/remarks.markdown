### Remarks

Just run it with no argument:

    $ ruby entry.rb

and you will see the current time.

I confirmed the following implementations/platforms:

* ruby 3.4.1

### Description

This program only shows the current time.

This program has many `it`. However the article 
<https://dev.to/ko1/reading-the-ruby-34-news-with-professionals-english-translation-47a4>
says:

> Even though it is allowed, it is better to avoid using it in anything other than one-line blocks, as it makes it difficult to understand what it refers to.

and this program only uses `it` with one-line blocks, so I believe this program does not have any problem.

### Internals

This program contains an encoded Ruby program that includes the `it` method and the `it` keyword.

(1) The first `it` saves the argument string into `@it`.
(2) The rest of `it` makes numbers into `It`.

The outermost `it` method call adds a number calculated in the block (and append to `It`).
The nested `it` methods and blocks represent a binary number.

```ruby
it do
  it it do # 1
    it do  # 0
      it   # 1
    end
  end
end
```

This code appends 0b101 to `It`.

(3) At last, eval the constructed Ruby program with `@it` and `It`.
