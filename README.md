<h1>Console version of hangman game</h1>


<h1>Install required gems before launch with:</h1>

```
bundle install
```

<h1>How to run</h1>

```
bundle exec ruby main.rb
```

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

Add a new sub-array to an initial array of `EQUAL_LETTERS`.

Example: `%w[O Ö]`
