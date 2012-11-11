# PostgreSQL книга



## Генерация HTML

Нужно закоментировать "\RequirePackage{pdfpages}" и "\includepdf{cover}" из-за конфликтов и запустить команду:

    htlatex postgresql.tex "postgresql.cfg,xhtml,mathml" "" "-d/Users/leo/Documents/postgresql_book/html/" 