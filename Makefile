default: pdf

main.dvi: *.tex *.bib Makefile images/*
	rm -f *.toc *.lot *.lof
	latex main
	bibtex main
	latex main
	latex main

main.ps: main.dvi
	dvips main.dvi

main.pdf: *.tex *.bib Makefile images/*
	rm -f *.toc *.lot *.lof
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

main.html: *.tex *.bib Makefile images/*
	rm -f *.toc *.lot *.lof
	[ -d html ] || mkdir html
	pdflatex main
	bibtex main
	mk4ht xhlatex main.tex 'xhtml,charset=utf-8,pmathml' ' -cunihtf -utf8 -cvalidate' '-d./html/'
	# mk4ht xhlatex main.tex "myconfig" ' -cunihtf -utf8 -cvalidate' '-d./html/' 

main.zip: main.html
	zip main.zip html/*

dvi: main.dvi

ps: main.ps

pdf: main.pdf

html: main.html

htmlzip: main.zip

all: ps pdf

final: pdf
	cp main.pdf hozza-dipl.pdf

clean: 
	rm -f *.log *.aux *.toc *.bbl *.blg *.slo *.srs *.out *.lot *.lof *.html *.css *.nav *.snm

dist-clean: clean
	rm -f main.ps main.pdf html/*

booklet: main.ps
	cat main.ps | psbook | psnup -2 >main-booklet.ps

