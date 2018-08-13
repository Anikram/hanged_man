# word loader from directory
class WordReader
  def read_from_args
    ARGV[0]
  end

  # get random word from a file
  def read_from_file(file_name)
    if !read_from_args
      begin
        file = File.new(file_name, 'r:UTF-8')
      rescue Errno::ENOENT
        abort 'Ошибка. Игра завершена. Файл со словами не найден.'
      end

      lines = file.readlines
      file.close
      Unicode.upcase(lines.sample.chomp)
    else
      line = read_from_args
      Unicode.upcase(line)
    end
  end

  def exist?(file_name)
    nil unless File.exist?(file_name)
  end
end
