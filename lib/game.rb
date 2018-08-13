require 'unicode'
# game mechanics class
class Game
  attr_reader :errors, :letters, :good_letters, :bad_letters
  attr_accessor :version, :status
  MAX_ERRORS = 7

  # takes `word` variable as the game-word
  def initialize(word)
    @letters = get_letters(word)
    @errors = 0
    @good_letters = [] # storage for right guesses
    @bad_letters = [] # storage for wrong guesses
    @status = :in_progress # :won, :lost
  end

  # convert into array of letters
  def get_letters(word)
    abort 'Загадано пустое слово, нечего отгадывать.' if word.nil? || word == ''
    word.encode('UTF-8').split('')
  end

  def max_errors
    MAX_ERRORS
  end

  def errors_left
    MAX_ERRORS - @errors
  end

  def good_letter?(letter)
    letters.include?(letter) ||
      (letter == 'Е' && letters.include?('Ё')) ||
      (letter == 'Ё' && letters.include?('Е')) ||
      (letter == 'И' && letters.include?('Й')) ||
      (letter == 'Й' && letters.include?('И'))
  end

  def add_letter_to(letters, letter)
    letters << letter

    case letter
    when 'И' then letters << 'Й'
    when 'Й' then letters << 'И'
    when 'Е' then letters << 'Ё'
    when 'Ё' then letters << 'Е'
    end
  end

  def solved?
    (@letters - good_letters).empty?
  end

  def repeated?(letter)
    good_letters.include?(letter) || bad_letters.include?(letter)
  end

  def lost?
    status == :lost || errors >= MAX_ERRORS
  end

  def in_progress?
    status == :in_progress
  end

  def won?
    status == :won
  end

  # game's step
  def next_step(letter)
    # 'end-of-the-game' check
    return if status == :lost || status == :won
    # 'guess-repeated' check
    return if repeated?(letter)
    # update right and wrong storages
    if good_letter?(letter)
      add_letter_to(good_letters, letter)
      self.status = :won if solved?
    else
      add_letter_to(bad_letters, letter)
      @errors += 1
      # game errors limit
      self.status = :lost if lost?
    end
  end

  # main-game-circle
  def ask_next_letter
    puts "\nВведите следующую букву"
    letter = ''
    letter = STDIN.gets.encode('UTF-8').chomp.slice(0) until letter != ''
    # call game's step
    if letter
      next_step(Unicode.upcase(letter))
    else
      next_step(letter)
    end
  end
end
