
TEX = pdflatex
VIEWER = evince
EDITOR = gedit

MAIN = Template
SLIDES = $(MAIN)_slides
NOTES = $(MAIN)_notes
HANDOUT = $(MAIN)_handout
SVG=$(patsubst %.svg, %.pdf, $(wildcard *.svg))


all: $(SLIDES).pdf

%.pdf : %.svg
	@/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=inkscape --file-forwarding org.inkscape.Inkscape $(basename $@).svg --export-pdf=$@

clean:
	@rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof *.glo *.nav *.snm *.ist *.vrb $(SLIDES).pdf $(NOTES).pdf $(HANDOUT).pdf $(SVG)

clean_junk:
	@rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof *.glo *.nav *.snm *.ist *.vrb

view:  $(SLIDES).pdf
	@$(VIEWER) $(SLIDES).pdf >> /dev/null 2>&1 &

view_notes: $(SLIDES).pdf
	@$(VIEWER) $(NOTES).pdf >> /dev/null 2>&1 &

view_handout: $(HANDOUT).pdf
	@$(VIEWER) $(HANDOUT).pdf >> /dev/null 2>&1 &

view_all: view view_notes view_handout

edit:
	@$(EDITOR) $(MAIN).tex >> /dev/null 2>&1 &

$(SLIDES).pdf: $(SLIDES).tex $(MAIN).tex $(SVG)
	$(TEX) $(SLIDES).tex
	$(TEX) $(SLIDES).tex

$(HANDOUT).pdf: $(HANDOUT).tex $(MAIN).tex $(SVG)
	$(TEX) $(HANDOUT).tex
	$(TEX) $(HANDOUT).tex

$(NOTES).pdf: $(NOTES).tex $(MAIN).tex $(SVG)
	$(TEX) $(NOTES).tex
	$(TEX) $(NOTES).tex

notes: $(NOTES).pdf
slides: $(SLIDES).pdf
handout: $(HANDOUT).pdf
