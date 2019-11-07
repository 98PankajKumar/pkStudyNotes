\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pkStudyNotes}[2019/10/24 Template for study notes]

\LoadClass[10pt,oneside,a4paper]{memoir}

% ~~ Required Packages ~~
\RequirePackage{fontspec} % To manage document fonts
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor} % For coloring purposes




% ~~ Page Layout ~~

\setlrmargins{0.8in}{*}{*}
\setulmargins{27mm}{*}{*}
\setmarginnotes{8mm}{52mm}{10pt}
\setheadfoot{12pt}{27mm}
\checkandfixthelayout[nearest]


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

% ~~ Colour ~~ 
\definecolor{mainColour}{RGB}{211, 47, 47}



% ~~ Title ~~ 
\newlength{\drop}

\newcommand*{\createTitle}{\begingroup
\drop = 0.12\textheight
\vspace*{\drop}
\hspace*{0.3\textwidth}
{\Huge The Title}\\[\baselineskip]
\hspace*{0.3\textwidth}
{\Huge Extended?}\par
\vspace*{3\drop}
{\large By Me and Professor?}
\vfill
{\scshape Extra}
\vspace*{0.5\drop}
\endgroup}