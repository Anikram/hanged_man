## Описание
Программа - игра. Имитация старой игры - "Висилица". Нужно угадывать загаданные слова по буквам.
Существует возможность играть в двоем, и против компьютера.

## Bundler
Для работы нужен gem `bundler` 
``` bash
gem install bundler
bundle
```

## Запуск
Программа запускается из коммандной строки (Терминала для MacOS). Для корректной работы - использовать префикс `bundle exec`
    Для запуска одиночного режима(против компьютера) необходимо написать в Терминале:

```bash
bundle exec ruby ./visilitsa.rb
```

Для игры в двоём, необходимо передать в качестве аргумента слово на русском или английском языке.
 Например:

```bash
bundle exec ruby ./visilitsa.rb волонтёр
```

При игре с компьютером слова берутся из файла `data/words.txt`, можно добавить своих слов в файл. Для 
запуска однопользовательского режима - нужно запустить программу без указания слова. 
Например:
```bash
bundle exec ruby ./visilitsa.rb
```
*Для запуска необходим установленный интерпретатор Ruby не ниже 2.1.0*

#### Разработал [Anikram](https://github.com:Anikram), 2018 год
