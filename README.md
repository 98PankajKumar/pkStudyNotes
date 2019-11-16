# pkStudyNotes

A simple LaTeX class to be used for taking study notes. The class is created using *memoir* as a base. The fonts required for this package to run are available for free [here](https://fonts.google.com/). 

## Usage 
To call the class use `\documentclass{pkStudyNotes}` at the beginning of the document. 

To create the title page use `\createtitle` as opposed to the usual `\maketitle`. The function `\createtitle` will print the title page and include: The title, author, a foreword/summary, URL to course page and a quote. These must be defined in the preamble in the following way:
```Latex
    \title{Title}
    \foreword{Summary/Foreword }
    \author{Author}
    \titleQuote{Quote}{Quotee}
    \courseURL{www.LinkToCourse.com}
```

## Features to Implement

Additional features that I would like to add if I have time: 
- [ ] Table of Contents design 
- [ ] Header & Footer design
- [ ] Code, Theorem and Information blocks for use in text
- [ ] Change the default look of margin notes (make them more appealing and standout from main text)

