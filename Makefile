FILE = main

COMPILE = latexmk -pdf $(FILE)

build:
	@ $(COMPILE)

watch:
	@ $(COMPILE) -pvc
 
clean:
	@ $(COMPILE) -c
