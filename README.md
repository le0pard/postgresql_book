# Работа с PostgreSQL: настройка и масштабирование [postgresql.leopard.in.ua](http://postgresql.leopard.in.ua/)

## Готовые pdf, epub, html5

[Последнии сборки](https://github.com/le0pard/postgresql_book/releases)

## Генерация HTML

    pandoc -s -S -c pandoc.css --toc --latexmathml --listings --highlight-style pygments -t html5 -s postgresql.tex -o postgresql.html

## Генерация Epub

    pandoc --smart -t epub3 -s postgresql.tex -o postgresql.epub --epub-cover-image=cover/cover.jpg --epub-chapter-level=2

Если хочется, чтобы в выводе были нормальные кавычки (`U+00ab` &laquo;, `U+00bb` &raquo;), нужно их сначала проставить вручную, потому что pandoc пока это не умеет (https://github.com/jgm/pandoc/issues/84). Например, c помощью vim:

    vim -e - $(find . -name "*.tex") << EOF
    :bufdo %s/<</\\=nr2char("0x00ab")/ge | %s/>>/\\=nr2char("0x00bb")/ge | update
    EOF


## Mobi

http://www.online-convert.com/

## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.
