SRCS = $(shell ls src/*.tex)
TEXS = $(foreach SRC, $(SRCS), $(SRC:src/%.tex=build/%.tex))

REDPEN := $(if $(REDPEN),$(REDPEN),redpen)

.PHONY: build
build: build/thesis.pdf

build/%.tex: src/%.tex
	cp $^ $@

build/thesis.pdf: $(TEXS)
	@latexmk -pdfdvi build/thesis.tex

.PHONY: redpen
redpen: $(TEXS)
	$(REDPEN) $^ --conf redpen-conf.xml --result-format xml > build/redpen.xml

.PHONY: clean
clean:
	@$(RM) build/*
