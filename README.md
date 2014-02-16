# Работа с PostgreSQL: настройка и масштабирование [postgresql.leopard.in.ua](http://postgresql.leopard.in.ua/)

## Генерация HTML

    htlatex postgresql.tex "postgresql.cfg,xhtml,mathml" "" "-d/Users/leo/Documents/postgresql_book/html/"

## Генерация Epub

    pandoc --smart -t epub3 -s postgresql.tex -o postgresql.epub --epub-cover-image=images/cover.jpg --epub-chapter-level=3

Если хочется, чтобы в выводе были нормальные кавычки (`U+00ab` &laquo;,
`U+00bb` &raquo;), нужно их сначала проставить вручную, потому что pandoc
пока это не умеет (https://github.com/jgm/pandoc/issues/84). Например,
c помощью vim:

    vim -e - $(find -name "*.tex") << EOF
    :bufdo %s/<</\\=nr2char("0x00ab")/ge | %s/>>/\\=nr2char("0x00bb")/ge | update
    EOF


## Mobi

http://www.epub2mobi.com/
