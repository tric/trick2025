# Remarks

Run `entry.rb` as a ruby script.

```
ruby entry.rb
```

Rename `entry.rb` as a HTML file.

```
mv entry.rb index.html
```

Open `index.html` with a browser.

## running environments

```
% ruby -v
ruby 3.3.4 (2024-07-09 revision be1089c8ec) [arm64-darwin23]
```

Google chrome

バージョン: 133.0.6943.98（Official Build） （arm64）

# Description

I tried the golf of the game of life taken 311 charactors  => https://gist.github.com/youchan/ff191eed286fab7929a730e61d999e95

It is embedded in `entry.rb`. 

The wasm version supports display in the browser by overriding `Kernel` methods such as `puts`.
