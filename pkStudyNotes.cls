\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pkStudyNotes}[2019/10/24 Template for study notes]

\LoadClass[12pt,oneside,a4paper]{memoir}

% ~~ Required Packages ~~
\RequirePackage{fontspec} % To manage document fonts
\RequirePackage{xcolor} % For coloring purposes

% ~~ Page Layout ~~

\setlength{\marginparwidth}{52mm}
\setlength{\marginparsep}{8mm}
\setlength{\uppermargin}{27mm}
\setlength{\headheight}{27mm} % Requires changing
\setlength{\headsep}{7mm}
\setlength{\footskip}{14mm}

% ~~ Fonts ~~

\defaultfontfeatures{Ligatures=TeX}

\setmainfont{Fira Sans Light}[
	Numbers=OldStyle,
	BoldFont=Fira Sans Medium,
	ItalicFont=Fira Sans Light Italic,
	BoldItalicFont=Fira Sans Medium Italic
]
\newfontfamily{\titleFont}{Philosopher Bold}
\newfontfamily{\subtitleFont}{Fira Sans Extra Condensed Light}
\newfontfamily{\chapterFont}{Philosopher Italic}
\newfontfamily{\chapternumberFont}{Fira Sans Extra Condensed Black}
\newfontfamily{\sectionFont}{Fira Sans Extra Condensed}
\newfontfamily{\sectionNumbers}{Fira Sans Extra Condensed Bold}
\newfontfamily{\smallFont}{Fira Sans}
\newfontfamily{\marginNoteFont}{Fira Sans Condensed}

