SHELL := /bin/bash

report: report.tex
	@pdflatex -interaction=nonstopmode report.tex > .tmp || (cat .tmp; exit 1)
	@scp report.pdf host:~/Desktop/ > /dev/null # optional
	@rm .tmp

clean:
	@rm -f report.{aux,log,out,pdf,toc}
