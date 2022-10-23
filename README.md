Console version of hangman game
----------
>Target Ruby version: 3.1.2

>Works on windows 10, ubuntu 22.04.1

>Language: RU
----------

<h1>How to run</h1>

```
ruby main.rb
```

<h1>How to add words</h1>

1) Go to data/words.txt
2) Add a new line with a word on it. Case insensitive!

<h1>How to add equal letters</h1>

If your language has any groups of letters which considered equal and you want
game to consider them as one letter, you can do so in `lib/game.rb`

Add a new sub-array to an array `EQUAL_LETTERS`.

Example: `%w[O Ö]`
CASE SENSITIVE!!! All letters must be in upper case!!!
