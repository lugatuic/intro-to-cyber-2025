all: intro-to-cyber.pdf intro-to-cyber.handout.pdf intro-to-cyber.md

intro-to-cyber.pdf: intro-to-cyber.tex

intro-to-cyber.handout.pdf: intro-to-cyber.handout.tex

intro-to-cyber.handout.tex: intro-to-cyber.tex
	sed '1s/\documentclass{beamer}/\documentclass[handout]{beamer}/' $^ > $@

%.pdf: %.tex
	latexmk -pdf -shell-escape -use-make $^

%.md: %.tex
	pandoc -s -t markdown $^ | sed -r '/:::.*$$/d;/Table of Contents/d;s/^0\.[0-9]+\s*//g' | cat -s > $@

clean:
	latexmk -CA
	rm -f intro-to-cyber.handout.tex *.snm *.nav *.vrb *.pyg *.md
	rm -rf _minted-*/ svg-inkscape/

.PHONY: all clean
