default: prez

prez.pdf: prez.tex images/*
	pdflatex prez
	bibtex prez
	pdflatex prez
	pdflatex prez

prez_handout.pdf: prez.tex images/*
	pdflatex prez_handout
	bibtex prez_handout
	pdflatex prez_handout
	pdflatex prez_handout

prez: prez.pdf

handout: prez_handout.pdf

all: prez

final: prez handout
	cp prez.pdf ../hozza-dipl-prez.pdf
	cp prez_handout.pdf ../hozza-dipl-prez-handout.pdf

clean:
	rm -f *.log *.aux *.toc *.bbl *.blg *.slo *.srs *.out *.lot *.lof *.html *.css *.nav *.snm

dist-clean: clean
	rm -f prez.pdf prez_handout.pdf


