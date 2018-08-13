require_relative 'lib/game'
require_relative 'lib/result_printer'
require_relative 'lib/word_reader'
VERSION = 'Игра виселица. Версия 3. Anikram'
VERSION.freeze

sleep 0.5

word_reader = WordReader.new

words_file_name = File.dirname(__FILE__) + '/data/words.txt'

game = Game.new(word_reader.read_from_file(words_file_name))

game.version = VERSION

printer = ResultPrinter.new(game)

while game.in_progress?
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
