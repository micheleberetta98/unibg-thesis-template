.PHONY: all pdf thumbnail zip read clean watch

FILE = main

# colors
RED = '\033[0;31m'
ORG = '\033[0;33m'
NOC = '\033[0m'

# commands
WATCH := latexmk -pdf -pvc
PDFCMD = pdflatex -interaction=nonstopmode ${FILE}

ifeq ($(shell grep -q '^[^%]*\\bibliography{' ${FILE}.tex; echo $$?),1)
	BIBCMD = true
else
	BIBCMD = bibtex ${FILE}
endif

UNAME := $(shell uname)

all: $(FILE).tex | clean pdf

pdf: $(FILE).pdf

watch:
	@$(WATCH) $(FILE)

$(FILE).pdf: . $(FILE).tex
	@$(PDFCMD) &>/dev/null || true
	@$(BIBCMD) &>/dev/null || (echo -e ${ORG} && $(BIBCMD) || printf ${NOC} || true)
	@$(PDFCMD) &>/dev/null || (echo -e ${RED} && $(PDFCMD) || printf ${NOC} && false)
	@$(PDFCMD) &>/dev/null

read: $(FILE).pdf
ifeq ($(UNAME),Darwin)
	@open ${FILE}.pdf &>/dev/null &
else ifeq ($(UNAME),Linux)
	@xdg-open ${FILE}.pdf &>/dev/null &
endif

clean:
	@rm -f *.{pdf,dvi,ps,jpg,log,aux,out,bbl,blg,synctex.gz,toc,vrb,snm,nav,zip,tdo}
	@rm -f *.{bcf,fdb_latexmk,fls,run.xml}
	@rm -f chapters/*.{pdf,dvi,ps,jpg,log,aux,out,bbl,blg,synctex.gz,toc,vrb,snm,nav,zip,tdo}
	@rm -f chapters/*.{bcf,fdb_latexmk,fls,run.xml}

