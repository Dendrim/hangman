class Game

  TOTAL_ERRORS_ALLOWED = 7
  EQUAL_LETTERS = [
    %w[Е Ё],
    %w[И Й],
    %w[Ъ Ь]
  ]

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  def normalized_guesses
    @user_guesses.map { |letter| normalize_letter(letter) }.flatten
  end

  def normalize_letter(letter)
    replacement = EQUAL_LETTERS.find { |equal_list| equal_list.include?(letter) }
    return [letter] unless replacement
    replacement
  end

  def errors
    @user_guesses - @letters.map { |letter| normalize_letter(letter) }.flatten
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    @letters.map do |letter|
      letter if normalized_guesses.include?(letter)
    end
  end

  def lost?
    errors_allowed == 0
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    @user_guesses << letter if !over? && !normalized_guesses.include?(letter)
  end

  def won?
    (@letters - normalized_guesses).empty?
  end

  def word
    @letters.join
  end
end
