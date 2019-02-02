MODULE ?= $(notdir $(CURDIR))
CWD		= $(CURDIR)
TMP		= $(CWD)/tmp

TEX = $(MODULE).tex header.tex version.tex

IMG = $(TMP)/logo63.png

TEX += quantorium.tex 

TEX += intro/intro.tex intro/open.tex
IMG += img/OpenHardware.png img/CHBZ.png img/LinuxPowered.png 

IMG += img/lego/loom.jpg img/lego/lathe.jpg img/lego/drill.jpg

TEX += mcu/mcu.tex

TEX += ci/ci.tex

TEX += arduino/arduino.tex

TEX += diy/diy.tex

TEX += pcb/pcb.tex

TEX += msp/msp.tex

TEX += cortex/cortex.tex 

TEX += linux/linux.tex

TEX += iot/iot.tex

TEX += fpga/fpga.tex

TEX += lib/lib.tex 

TEX += lib/power/snubber/snubber.tex
IMG += lib/power/snubber/snubber.png

TEX += bib/bib.tex
IMG += bib/deitel.jpg bib/kernigan.jpg
IMG += bib/gololob.jpg bib/bachinin.png bib/ermishin.jpg
IMG += bib/perelman1.jpg


LATEX = pdflatex -halt-on-error --output-dir=$(TMP)

$(TMP)/kva.pdf: $(TEX) $(IMG) Makefile
	$(LATEX) $< && $(LATEX) $<

TODAY = $(shell date +%Y%m%d)

HASH = $(shell git rev-parse --short HEAD)
NOW  = $(shell date +%d.%m.%Y)
release:
	echo "\\date{версия $(HASH) $(NOW)\\\\\\\\ \\licence}" > version.tex
	$(MAKE) $(TMP)/kva_$(TODAY).pdf
	git tag $(TODAY) && git push -v --tags

pdf: $(TMP)/kva_$(TODAY).pdf

$(TMP)/kva_$(TODAY).pdf: $(TMP)/kva.pdf Makefile
	ghostscript -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$@ $<
# prepress
# ebook	

$(TMP)/logo63.png: img/logo63.png Makefile
	convert $< -resize 11% $@
