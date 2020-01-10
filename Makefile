
TEX = pdflatex
VIEWER = evince
EDITOR = gedit

MAIN = Template
SLIDES = $(MAIN)_slides
NOTES = $(MAIN)_notes
HANDOUT = $(MAIN)_handout


all: $(SLIDES).pdf

clean:
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof *.glo *.nav *.snm *.ist *.vrb $(SLIDES).pdf $(NOTES).pdf $(HANDOUT).pdf

clean_junk:
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof *.glo *.nav *.snm *.ist *.vrb

view:  $(NOTES).pdf
	$(VIEWER) $(SLIDES).pdf >> /dev/null 2>&1 &

view_notes: $(SLIDES).pdf
	$(VIEWER) $(NOTES).pdf >> /dev/null 2>&1 &

view_handout: $(HANDOUT).pdf
	$(VIEWER) $(HANDOUT).pdf >> /dev/null 2>&1 &

view_all: view view_notes view_handout

edit:
	$(EDITOR) $(MAIN).tex

$(SLIDES).pdf: $(SLIDES).tex $(MAIN).tex
	$(TEX) $(SLIDES).tex
	$(TEX) $(SLIDES).tex

$(HANDOUT).pdf: $(HANDOUT).tex $(MAIN).tex
	$(TEX) $(HANDOUT).tex
	$(TEX) $(HANDOUT).tex

$(NOTES).pdf: $(NOTES).tex $(MAIN).tex
	$(TEX) $(NOTES).tex
	$(TEX) $(NOTES).tex

notes: $(NOTES).pdf
slides: $(SLIDES).pdf
handout: $(HANDOUT).pdf
