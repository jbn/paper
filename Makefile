OUTPUT_NAME=turing_50
OUTPUT_DIR=target/
PUBLISH_DIR=~/Dropbox/

.PHONY: html
html: *.md
	pandoc *.md --filter pandoc-citeproc --smart --mathjax --include-in-header custom.css -s -o $(OUTPUT_DIR)$(OUTPUT_NAME).html

.PHONY: pdf
pdf: *.md
	pandoc  *.md --filter=./pandoc-svg.py --filter pandoc-citeproc --smart -s -o $(OUTPUT_DIR)$(OUTPUT_NAME).pdf

.PHONY: word
word: *.md
	pandoc  *.md --filter=./pandoc-svg.py --filter pandoc-citeproc --smart -s -o $(OUTPUT_DIR)$(OUTPUT_NAME).docx

.PHONY: publish
publish: html pdf word
	cp $(OUTPUT_DIR)$(OUTPUT_NAME).* $(PUBLISH_DIR)
