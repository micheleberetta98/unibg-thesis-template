FILE = main
OUTDIR = dist

COMPILE = latexmk -pdf -outdir=$(OUTDIR) $(FILE)

build:
	@ $(COMPILE)

watch:
	@ $(COMPILE) -pvc
 
clean:
	@ rm -rf ./dist/