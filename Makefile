SHELL := /bin/bash

all: report memo

report: report.tex
	@pdflatex -interaction=nonstopmode report.tex > .tmp || (cat .tmp; exit 1)
	@pdflatex -interaction=nonstopmode report.tex > .tmp || (cat .tmp; exit 1)
	@scp report.pdf host:~/Desktop/ > /dev/null
	@rm .tmp

memo: memo.tex
	@pdflatex -interaction=nonstopmode memo.tex > .tmp || (cat .tmp; exit 1)
	@pdflatex -interaction=nonstopmode memo.tex > .tmp || (cat .tmp; exit 1)
	@scp memo.pdf host:~/Desktop/ > /dev/null
	@rm .tmp

clean:
	@rm -f report.{aux,log,out,pdf,toc}
