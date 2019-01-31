MODULE ?= $(notdir $(CURDIR))
CWD		= $(CURDIR)
TMP		= $(CWD)/tmp

TEX = $(MODULE).tex header.tex

IMG = img/logo63.png

TEX += quantorium.tex 


LATEX = pdflatex -halt-on-error --output-dir=$(TMP)

kva.pdf: $(TEX) $(IMG) Makefile
	$(LATEX) $< && $(LATEX) $<
