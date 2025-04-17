# Ruby Tags



## Remarks

This program utilizes `ruby.wasm`. To run it, first launch an HTTP server:

```
$ bundle install
$ bundle exec ruby -run -e httpd
```

Then access <http://127.0.0.1:8080/>.

NOTE: gems are used only for the server.

It has been tested under the following environment:

```
$ ruby --version
ruby 3.4.1 (2024-12-25 revision 48d4efcb85) +PRISM [x86_64-linux]
```

`ruby.wasm` version:

```
<script src="https://cdn.jsdelivr.net/npm/@ruby/3.4-wasm-wasi@2.7.1/dist/browser.script.iife.js"></script>
```



## Description

This is a quine-like program that renders its own source code as HTML elements in browser.
In addition, it highlights the source code and adds "ruby" annotations for each token.

Example for `<ruby>` tag: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ruby

> ```
> <ruby> 明日 <rp>(</rp><rt>Ashita</rt><rp>)</rp> </ruby>
> ```

The pronounciation table is compressed and hard-coded to `entry.rb`.



## Internals

### Syntax Highlighting

Syntax highlighting is powered by Prism, a recently introduced parser/lexer ecosystem. The program calls `Prism.lex()` and iterates over the resulting token stream to apply highlighting.

### Ruby Annotations

Initially, I tried adding ruby annotations to *every* token. However, the pronounciation data for all tokens was too large to fit within the size limit. Although I implemented a simple compression algorithm (see `kana()` function), I finally had to reduce the table size.

### Compression Algorithm for the Pronounciation Table

The compression algorithm is fairly simple: each Katakana letter is encoded as a two-digit integer, offset by U+30A0.
There are certainly more sophisticated approaches.

Because the `index.html` has no strict size limit according to the regulation, the table data could be embedded there instead. However, that approach was not very elegant.
