.PHONY: all clean

TEX_FILES := $(wildcard * .tex)
PDF_FILES := $(TEX_FILES:.tex=.pdf)

all: $(PDF_FILES)

%.pdf: %.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $<

clean:
	latexmk -C
