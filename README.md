# TRICK 2025 (Episode I)

## Goals of the TRICK

* To write the most Transcendental, Imbroglio Ruby program.
* To illustrate some of the subtleties (and design issues) of Ruby.
* To show the robustness and portability of Ruby interpreters.
* To stabilize the spec of Ruby by the presence of valuable but unmaintainable code.

## Rules

These rules are tentative.

1. Your entry must be a complete Ruby program.
1. The size of your program must be <= 4096 bytes in length. The number of non-space characters must be <= 2048. The total size of your compressed submission must be less than 10 MB.
1. You can submit multiple entries, and your team may consist of any number of members.
1. The entirety of your entry must be submitted under [MIT License](http://opensource.org/licenses/MIT).
1. Your entry must bring the judges a surprise, excitement, and/or laughter.

## Guidelines

These are not strict rules but hints or suggestions. You can ignore them but we'd recommend you to follow them.

* Matz Ruby Implementation (MRI) 3.3 or 3.4 is recommended.
* You can use implementations other than MRI, such as JRuby and TruffleRuby.
* The judges would prefer more stoic, more portable, and/or more funny entries.
* You are encouraged to study the winners of [previous TRICK contests](https://github.com/tric/).
* You can use gem libraries.
  * Note that we will expect such entries to be much more interesting than an entry that uses no library; hence we will judge them strictly.
  * It is highly discouraged to abuse gem to get around the size limit.
* To judge without bias, we will try to keep each entry anonymous during judgment. Do not include anything that reveal your identity (such as a signature, copyright, URL, etc.) in your program.
* **(NEW)** You can use [ruby.wasm](https://github.com/ruby/ruby.wasm).
  * Please elaborate how to run in `remarks.markdown`.
  * If your entry works on browser, please include .html and (if any) .js and media files in your submission.
    * You don't have to include .html and .js in the code size limit (up to 4096 bytes). But it would be cool if they fit in total.
    * Please care the total size limit (up to 10 MB).
    * It is ok to use ruby.wasm on CDN by a `<script>` tag. See [the quick example of ruby.wasm](https://github.com/ruby/ruby.wasm?tab=readme-ov-file#quick-example-ruby-on-web-browser). Using other files in the network is not recommended.
  * If you have any question, please send a mail to `trick-judges at googlegroups.com`.

## How to submit

* Your submission must consist of the following files:
  * `entry.rb` (program source)
  * `remarks.markdown`
  * `authors.markdown`
  * `Gemfile`, `Gemfile.lock` (if you use any gem library)
  * data files (if needed)
* `remarks.markdown` must include the following information:
  * Ruby implementation, version, platform that you use (it is a good idea to copy and paste the output of `ruby -v`)
  * How to run
* `authors.markdown` must include the following information (and the `remarks.markdown` must NOT have them):
  * Your name (handle is ok)
  * [ccTLD](https://en.wikipedia.org/wiki/Country_code_top-level_domain) of your country/region
* Compress your entry as a zip file called `entry.zip` and send it to `trick.submit at gmail.com` as an attachment.
  * You must include the words `TRICK 2025 submission` in the subject of your email.
  * See [an example of `entry.zip`](entry.zip).

If you have any question, please send a mail to `trick-judges at googlegroups.com`.

## Important Dates

* August 31st, 2024: Contest open
* February 28th, 2025: Submission deadline
* April 15th--18th, 2025: Result announcement (in RubyKaigi 2025)

## Judges

Alphabetical order.

* Yusuke Endoh ([@mametter][mametter]. Ruby committer. [The world's No.1 IOCCC player][ioccc_endoh].)
* Koichiro Eto ([@eto][eto]. Media Artist. [Chairman at NicoNicoGakkai Beta][niconicogakkai].)
* Shinichiro Hamaji ([@shinh][shinh]. [The admin of anarchy golf][golf]. [IOCCC winner][ioccc_shinh].)
* Yutaka Hara ([@yhara][yhara]. [The author of Japanese esolang book][esolangbook].)
* Tomoya Ishida ([@tompng][tompng]. [The gold and silver medalist of TRICK 2022][trick2022].)
* Yukihiro Matsumoto (a.k.a. matz. [@yukihiro_matz][yukihiro_matz]. The creator of Ruby.)
* Sun Park (a.k.a. leonid. [The 1st super Ruby golfer][golfers].)
* Darren Smith ([a.k.a. flagitious. [The author of some esolangs including GolfScript][golfscript].)

[mametter]: https://twitter.com/mametter
[eto]: https://twitter.com/eto
[shinh]: https://twitter.com/shinh
[yhara]: https://twitter.com/yhara
[tompng]: https://twitter.com/tompng
[yukihiro_matz]: https://twitter.com/yukihiro_matz
[ioccc_endoh]: http://www.ioccc.org/winners.html#Yusuke_Endoh
[ioccc_shinh]: http://www.ioccc.org/winners.html#Shinichiro_Hamaji
[niconicogakkai]: http://niconicogakkai.jp/
[golf]: http://golf.shinh.org/
[esolangbook]: http://esolang-book.route477.net/
[trick2022]: https://github.com/tric/trick2022
[golfers]: http://golf.shinh.org/u.rb?rb
[golfscript]: http://www.golfscript.com/

## Legal

This work is licensed under the MIT License.

    Copyright (c) 2024, TRICK Winners and Judges.

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
