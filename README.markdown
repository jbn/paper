# What is this?

This repository is my initialization script for starting a new pandoc document. It's a skeleton. It features a preamble, uses a bibliography, and renders `html`, `pdf`, and `docx`. 

The `Makefile` favors `html` generation because it's the fastest, so it's easiest for iteration. The `pdf` generation requires `pdflatex`. I'm on OSX, so I use [MacTex](https://tug.org/mactex/). The `docx` generation requires a firm commitment to being an ass. Or, more likely, an employer who requires Word. 

I write and use `SVG` a lot. This is fine when rendering to `html` but complicates embedding in `PDF` and `DOCX`. To make it seamless, I use a modified version of [Jerome Robert's](https://gist.github.com/jeromerobert) [`pandoc-svg.py`](https://gist.github.com/jeromerobert/3996eca3acd12e4c3d40). It requires `inkscape`. 

## General Usage

Start a new project by executing:

```BASH
git clone https://github.com/jbn/paper.git && cd paper && rm -rf .git/ && rm README.markdown
```

Write each markdown file as '#-##-description.md'. The first octothorpe (fun word points) refers to the section number. The second pair refers to the sub-section, with a suggested leading zero for numbers less than 10. The `Makefile` implicitly assembles the document in lexicographic order. If you stick to this convention, you don't have to modify the rules. 

You will have to modify the `Makefile` for each new document to set up the `OUTPUT_NAME`, the `PUBLISH_DIR`, and, sometimes, the `OUTPUT_DIR`. The `PUBLISH_DIR` is useful for Dropbox users. Executing `make publish` will compile all documents and copy them to your dropbox directory. If you set it to a subfolder in DropBox, you can share it with your team, and they get instant notifications. 

Oh, and make sure your markdown files are newline terminated. Most broken rendering is just improper file concatination.

## Installation

1. Install [Pandoc](http://pandoc.org/installing.html). 
2. Install [pandoc-citeproc](http://pandoc.org/installing.html).
3. Install [pandocfilters](https://github.com/jgm/pandocfilters) for `pandoc-svg.py`. 
4. Install [inkscape](https://inkscape.org/en/) because SVG.

### For OSX Users

You can pretty much copy, (edit,) and, paste the following: 

```bash
brew install pandoc
brew install pandoc-citeproc
pip install pandocfilters # In your virtual environment, hopefully...
brew install homebrew/x11/inkscape
```
