# match "module foobar() { //makeme"
TARGETS=$(shell sed '/module [a-z0-9_-].*().*makeme/!d;s/module //;s/().*/.stl/' duplos_cuboro.scad)

all: ${TARGETS}

# auto-generated .scad files with .deps make make re-build always. keeping the
# scad files solves this problem. (explanations are welcome.)
.SECONDARY: $(shell echo "${TARGETS}" | sed 's/\.stl/.scad/g')

# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)

%.scad:
	echo -n 'use <duplos_cuboro.scad>\n$*();' > $@

%.stl: %.scad
	openscad -m make -o $@ -d $@.deps $<
