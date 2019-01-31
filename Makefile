
LATEX = pdflatex

kva.pdf: $(TEX)
	$(LATEX) $< && $(LATEX) $<
