FILE = main
OUTDIR = dist

COMPILE = latexmk -pdf -outdir=$(OUTDIR) $(FILE)

build:
	@ $(COMPILE)

watch:
	@ $(COMPILE) -pvc
 
clean:
	@ $(COMPILE) -c