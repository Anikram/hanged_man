# promoted to print out game's feedback
class ResultPrinter
  attr_accessor :game, :status_image
  def initialize(game)
    @game = game
    # array of images
    @status_image = []
    # full path for asset loading
    current_path = File.dirname(__FILE__)
    # load images to array
    load_images(current_path)
  end

  # print image
  def print_viselitsa(errors)
    puts @status_image[errors]
  end

  def print_status(game)
    cls
    puts game.version
    puts "\nСлово: #{get_word_for_print(game.letters, game.good_letters)}"
    puts "Ошибки: #{game.bad_letters.join(', ')}"

    print_viselitsa(game.errors)

    if game.lost?
      puts "\n\nВы проиграли :("
      puts 'Загаданное слово было: ' + game.letters.join('')
    elsif game.won?
      puts "\n\nПоздравляем, вы выиграли!"
    else
      puts "\n\nУ вас осталось ошибок: #{game.errors_left}"
    end
  end
  # print out game-word itself
  def get_word_for_print(letters, good_letters)
    result = ''
    letters.each do |item|
      result += if good_letters.include?(item)
                  item + ' '
                else
                  '__ '
                end
    end
    result
  end

  # clear screen for person-vs-person game, to hide a game-word.
  def cls
    system('clear') || system('cls')
  end

  def load_images(path)
    counter = 0
    until counter == game.max_errors
      # assemble file path to /images/ folder
      # img naming convention: 0.txt, 1.txt, 2.txt etc. 0,1,2 (errors number)
      file_name = path + "/../images/#{counter}.txt"
      begin
        file = File.new(file_name, 'r:UTF-8')
        status_image << file.read
        file.close
      rescue Errno::ENOENT
        # placeholder if file doesn't exist
        status_image << "\n [ изображение не найдено ] \n"
      end
      counter += 1
    end
  end
end
