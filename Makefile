
TEX = pdflatex
VIEWER = evince
EDITOR = gedit

MAIN = Template
SLIDES = $(MAIN)_slides
NOTES = $(MAIN)_notes


all: $(SLIDES).pdf $(NOTES).pdf

clean::
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof $(SLIDES).pdf $(NOTES).pdf

clean_junk::
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof *.glo *.nav *.snm *.ist *.vrb

view:  $(NOTES).pdf $(SLIDES).pdf
	$(VIEWER) $(SLIDES).pdf >> /dev/null 2>&1 &
	$(VIEWER) $(NOTES).pdf >> /dev/null 2>&1 &

edit:
	$(EDITOR) $(MAIN).tex

$(SLIDES).pdf: $(SLIDES).tex $(MAIN).tex
	$(TEX) $(SLIDES).tex
	$(TEX) $(SLIDES).tex

$(NOTES).pdf: $(NOTES).tex $(MAIN).tex
	$(TEX) $(NOTES).tex
	$(TEX) $(NOTES).tex

slides: $(SLIDES).tex $(MAIN).tex
	$(TEX) $(SLIDES).tex
	$(TEX) $(SLIDES).tex
