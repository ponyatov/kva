MODULE ?= $(notdir $(CURDIR))
CWD		= $(CURDIR)
TMP		= $(CWD)/tmp

TEX = $(MODULE).tex header.tex

IMG = img/logo63.png

TEX += quantorium.tex 

TEX += intro/intro.tex

IMG += img/lego/loom.jpg img/lego/lathe.jpg img/lego/drill.jpg

TEX += mcu/mcu.tex

TEX += ci/ci.tex

TEX += arduino/arduino.tex

TEX += msp/msp.tex

TEX += cortex/cortex.tex 

TEX += linux/linux.tex

TEX += iot/iot.tex

TEX += fpga/fpga.tex

TEX += bib/bib.tex


LATEX = pdflatex -halt-on-error --output-dir=$(TMP)

$(TMP)/kva.pdf: $(TEX) $(IMG) Makefile
	$(LATEX) $< && $(LATEX) $<

TODAY = $(shell date +%Y%m%d)

release: $(TMP)/kva_$(TODAY).pdf
	git tag $(TODAY)

$(TMP)/kva_$(TODAY).pdf: $(TMP)/kva.pdf
	cp $< $@
