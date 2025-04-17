## Remarks

Gem install:

    gem install processing


Just run it with no argument:

    ruby entry.rb


I confirmed the following implementations/platforms:

* ruby 3.4.2 (2025-02-15 revision d2930f8e7a) +PRISM [arm64-darwin23]

## Description
"Four Seasons"

Japan has four seasons, and they repeat in a continuous cycle.

This Ruby program, using processing gem (Processing compatible Creative Coding Framework), creates an animated seasonal falling effect where different symbols fall based on the current season. 

### Internals

Seamless Seasonal Transitions

The background color smoothly interpolates (lerpColor) between two seasonal colors.
Every time a transition completes, the next season starts automatically.

Falling Objects (Flakes)

Each season has its own type of falling object (✿, ;, ♠, *).
These objects have different sizes, colors, and behaviors based on the season.
They fall down the screen at varying speeds and disappear when they reach the bottom.