# match "module foobar() { // makeme"
TARGETS=$(shell sed '/module [a-zA-Z0-9_-].*().*makeme/!d;s/module //;s/().*/.stl/' CuccRendezo.scad)

all: ${TARGETS}

# auto-generated .scad files with .deps make make re-build always. keeping the
# scad files solves this problem. (explanations are welcome.)
.SECONDARY: $(shell echo "${TARGETS}" | sed 's/\.stl/.scd/g')

# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)

%.scd:
	echo -n 'use <CuccRendezo.scad>\n$*();' > $@

%.stl: %.scd
	openscad -m make -o $@ -d $@.deps $<

clean:
	rm ${TARGETS} *.deps *.scd
