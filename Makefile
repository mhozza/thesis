default: pdf

main.dvi: *.tex *.bib Makefile images/*
	rm -f *.toc
	latex main
	bibtex main
	latex main
	latex main

main.ps: main.dvi
	dvips main.dvi

main.pdf: *.tex *.bib Makefile images/*
	rm -f *.toc
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

main.html: *.tex *.bib Makefile images/*
	[ -d html ] || mkdir html
	mk4ht htlatex main.tex 'xhtml,charset=utf-8,pmathml' ' -cunihtf -utf8 -cvalidate' '-d./html/'

dvi: main.dvi

ps: main.ps

pdf: main.pdf

html: main.html

all: ps pdf

final: pdf
	cp main.pdf hozza-dipl.pdf

clean: 
	rm -f *.log *.aux *.toc *.bbl *.blg *.slo *.srs *.out *.lot *.lof *.html *.css *.nav *.snm

dist-clean: clean
	rm -f main.ps main.pdf html/*

booklet: main.ps
	cat main.ps | psbook | psnup -2 >main-booklet.ps

