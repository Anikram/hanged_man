# encoding: utf-8
#
# Класс WordReader, отвечающий за чтение слова для игры.
class WordReader
  # Так как, подобно классу ResultPrinter, экземляр этого класса не хранит
  # в себе никаких данных, конструктор отсутствует.

  # Сохраним старую возможность читать слово из аргументов командной строки. В
  # качестве отедльного метода read_from_args для обратной совместимости.
  def read_from_args
    ARGV[0]
  end

  # Метод read_from_file, возвращающий случайное слово, прочитанное из файла,
  # имя которого нужно передать методу в качестве единственного аргумента.
  def read_from_file(file_name)
    if !read_from_args
      # Если файла не существует, сразу выходим из метода
      #is_exist?(file_name)

      # Открываем файл, явно указывая его кодировку, читаем все строки в массив и
      # закрываем файл.
      #
      begin
        file = File.new(file_name, "r:UTF-8")
      rescue Errno::ENOENT
        abort "Ошибка. Игра заверщена. Файл со словами не найден"
      end

      lines = file.readlines
      file.close


      # Возвращаем случайную строчку (слово) из прочитанного массива, не забывая
      # удалить в конце символ перевода строки методом chomp.
      Unicode::upcase(lines.sample.chomp)
    else
      line = read_from_args
      Unicode::upcase(line)
    end

  end

  def is_exist?(file_name)
    nil if !File.exist?(file_name)
  end
end
