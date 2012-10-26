default: pdf

main.dvi: *.tex *.bib Makefile images/*
	rm -f *.toc
	cslatex main
	bibtex main
	cslatex main
	cslatex main

main.ps: main.dvi
	dvips main.dvi

main.pdf: *.tex *.bib Makefile images/*
	rm -f *.toc
	pdfcslatex main
	bibtex main
	pdfcslatex main
	pdfcslatex main

dvi: main.dvi

ps: main.ps

pdf: main.pdf

all: ps pdf

final: pdf
	cp main.pdf hozza-bc.pdf

clean: 
	rm -f *.log *.aux *.toc *.bbl *.blg *.slo *.srs *.out *.lot *.lof

dist-clean:
	rm -f *.log *.aux *.toc *.bbl *.blg *.slo *.srs *.out *.lot *.lof main.ps main.pdf

booklet: main.ps
	cat main.ps | psbook | psnup -2 >main-booklet.ps

