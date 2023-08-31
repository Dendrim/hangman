class Game
  TOTAL_ERRORS_ALLOWED = 7
  EQUAL_LETTERS = [
    %w[Е Ё],
    %w[и Й],
    %w[Ъ ь]
  ].map { |letters| letters.map(&:upcase) }

  def initialize(word)
    @letters = word.upcase.chars
    @user_guesses = []
  end

  def equals_of_letter(letter)
    EQUAL_LETTERS.find { |equal_list| equal_list.include?(letter) } || letter
  end

  def implied_guesses
    @user_guesses.map { |letter| equals_of_letter(letter) }.flatten
  end

  def errors
    @user_guesses - @letters.map { |letter| equals_of_letter(letter) }.flatten
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    @letters.map { |letter| letter if implied_guesses.include?(letter) }
  end

  def lost?
    errors_allowed == 0
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    @user_guesses << letter if !over? && !implied_guesses.include?(letter)
  end

  def won?
    (@letters - implied_guesses).empty?
  end

  def word
    @letters.join
  end
end
