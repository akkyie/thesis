SRCS = $(shell ls src/*.tex)
TEXS = $(foreach SRC, $(SRCS), $(SRC:src/%.tex=build/%.tex))

.PHONY: build
build: build/thesis.pdf

build/%.tex: src/%.tex
	cp $^ $@

build/thesis.pdf: $(TEXS)
	@latexmk -pdfdvi build/thesis.tex

.PHONY: redpen
redpen: $(TEXS)
	redpen $^ -c redpen-conf.xml 2>/dev/null

.PHONY: clean
clean:
	@$(RM) build/*
