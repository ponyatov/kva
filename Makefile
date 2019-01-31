MODULE ?= $(notdir $(CURDIR))
CWD		= $(CURDIR)
TMP		= $(CWD)/tmp

TEX = $(MODULE).tex header.tex

IMG = img/logo63.png

TEX += quantorium.tex 

TEX += intro/intro.tex

IMG += img/lego/loom.jpg img/lego/lathe.jpg img/lego/drill.jpg

LATEX = pdflatex -halt-on-error --output-dir=$(TMP)

kva.pdf: $(TEX) $(IMG) Makefile
	$(LATEX) $< && $(LATEX) $<
