# PostgreSQL книга



## Генерация HTML

    htlatex postgresql.tex "postgresql.cfg,xhtml,mathml" "" "-d/Users/leo/Documents/postgresql_book/html/"

## Генерация Epub

    pandoc -t epub3 -s postgresql.tex -o postgresql.epub --epub-cover-image=images/cover.jpg

## Mobi

http://www.epub2mobi.com/