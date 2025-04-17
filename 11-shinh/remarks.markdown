### Remarks

Run it with some text files like this document:

    ruby entry.rb rem?rks.m?rkdown

You might wonder why `?` is used where there should be `97.chr`. I decided not to use `97.chr` for some stupid motive, which I'll describe.

By feeding the code itself, it shows how the number of distinct letters diminishes

    ruby entry.rb entry.rb

### Description

Two themes of this entry (here, 'A' is used for `97.chr`):

* HorizontAl Alignment
* VAnishing letters

I'm not sure if it's just me but I like code like this:

```
for level in levels:
   score = compute_score(level)
   if best_score < score
      best_score = score
      best_level = level
   end
end
```

Why? The leftmost position of `best` or `score` lines up nicely. So, in my code, English letters fit only in specific spots. `w` sits in the first position of every line, `q` comes next.

The second theme is inspired by JP novel [ZANZOU NI KUCHIBENI WO](https://JA.wikipediA.org/wiki/%E6%AE%8B%E5%83%8F%E3%81%AB%E5%8F%A3%E7%B4%85%E3%82%92) for which no English entry in the site. In this novel, JP letters get removed one by one. Since the novel does not use "あ", the first letter of JP, my code does not use the first letter of English. My code ends with `?n` since the novel finishes with "ん", which is pronounced `n` in English.

The novel inspired one episode in [YU-YU-HAKUSYO](https://en.wikipediA.org/wiki/YuYu_H%61kusho), which would be more well known in JP. English

### Something more which I tried

Restricting the leftmost position is tougher, more so I expected.

If I tried to keep it concise.

This document is tougher, of course.

I tried to use lots of "the".

I didn't use big letters.

to let it be more interesting.

I think it's not nothing interesting.

I think here's interesting thing...

I like this: "m thend"

I dislike its end.

the end lies here.

the end is here.

end is here.

end's here.

he's end.

ends.

end.

en

n?

