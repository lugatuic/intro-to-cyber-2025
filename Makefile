all: coreutils_and_filesystem.pdf coreutils_and_filesystem.handout.pdf

coreutils_and_filesystem.pdf: coreutils_and_filesystem.tex

coreutils_and_filesystem.handout.pdf: coreutils_and_filesystem.handout.tex

coreutils_and_filesystem.handout.tex: coreutils_and_filesystem.tex
	sed '1s/\documentclass{beamer}/\documentclass[handout]{beamer}/' $^ > $@

%.pdf: %.tex
	latexmk -pdf -shell-escape -use-make $^

clean:
	latexmk -CA
	rm -f coreutils_and_filesystem.handout.tex *.snm *.nav *.vrb *.pyg
	rm -rf _minted-*/ svg-inkscape/

.PHONY: all clean
