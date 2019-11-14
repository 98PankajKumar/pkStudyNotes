\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pkStudyNotes}[2019/10/24 Template for study notes]

\LoadClass[10pt,oneside,a4paper]{memoir}

% ~~ Required Packages ~~
\RequirePackage{fontawesome}
\RequirePackage{fontspec} % To manage document fonts
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor} % For colouring purposes
\RequirePackage{tikz}
\usetikzlibrary{positioning}
\usetikzlibrary{fit}
\RequirePackage{etoolbox}
\RequirePackage{hyperref}
\hypersetup{
	pdftoolbar=false,
	pdfmenubar=true,
	pdffitwindow=false,
	pdfborder={0 0 0},
	pdfcreator=LaTeX,
	colorlinks=true,
	linkcolor=complementColour,
	linktoc=all,
	urlcolor=complementColour,
	citecolor=complementColour,
	filecolor=complementColour,
	breaklinks
}

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
\newfontfamily{\condensedFont}{Fira Sans Condensed}
\newfontfamily{\subtitleFont}{Fira Sans Extra Condensed Light}
\newfontfamily{\chapterFont}{Philosopher Italic}
\newfontfamily{\chapternumberFont}{Fira Sans Extra Condensed Black}
\newfontfamily{\sectionFont}{Fira Sans Extra Condensed}
\newfontfamily{\sectionNumbers}{Fira Sans Extra Condensed Bold}
\newfontfamily{\smallFont}{Fira Sans}

\setfontfamily{\FA}{Font Awesome 5 Free Regular}
\setfontfamily{\FASolid}{Font Awesome 5 Free Solid}[AutoFakeBold=1]

% ~~ Colour ~~ 
\definecolor{mainColour}{RGB}{211, 47, 47}
\colorlet{complementColour}{-mainColour}


% ~~ Title ~~ 
\newlength{\drop}
\newcommand{\titlepageIcon}[1]{{\fontsize{28pt}{0pt}#1}\\[2mm]}
\newcommand{\titleQuoteIcon}[1]{{\fontsize{28pt}{0pt}#1}}

\newcommand{\@foreword}{}
\newcommand{\foreword}[1]{\renewcommand{\@foreword}{\textit{#1}}}
\newcommand{\@courseURL}{}
\newcommand{\courseURL}[1]{\renewcommand{\@courseURL}{\href{#1}{Course Website}}}
\newcommand{\@titleQuote}{}
\newcommand{\titleQuote}[2]{\renewcommand{\@titleQuote}{\titleQuoteIcon{\FASolid\symbol{"F10D}} \hspace{1cm} \titleQuoteIcon{\FASolid\symbol{"F10E}} \\[2mm] \textit{ #1 }  \\ \hspace*{5mm} - #2}}

\newcommand*{\createTitle}{
	\begin{tikzpicture}[remember picture,overlay]		
		\node[right=10.4cm of current page.center] (A) {};
		\node[left=6cm of current page.north east] (B) {};
		\draw [remember picture,fill = mainColour, draw=black, line width = 1mm] (B) -- (current page.north east) -- (current page.south east) -- cycle;
		\draw [remember picture,fill = mainColour, draw=black, line width = 1mm] (A) -- (current page.south east) -- (current page.south west) -- cycle;
		\node[above left= 12cm and 4cm of current page.south east] (C) {};
		\node[fit=(C) (current page.south east), color=white] {
			\titlepageIcon{\faUser}
			\@author \\
			\vspace*{1cm}
			\titlepageIcon{\faCalendar}
			\@date \\			
			\vspace*{1cm}
			\ifdefempty{\@courseURL}{}{
			\titlepageIcon{\FASolid\symbol{"F245}}
			\@courseURL	\\
			}
			\vspace*{1cm}
		};	
		\node [above= 2cm of current page.south east] (D) {};
		\node [right= 2cm of current page.south west] (E) {};	
		\node[fit = (D) (E)] {
			\ifdefempty{\@titleQuote}{}{
			\color{white}
			%\titlepageIcon{\FASolid\symbol{"F10D}}
			\@titleQuote
			%\titlepageIcon{\FASolid\symbol{"F10E}}
			}};
	\end{tikzpicture}%
\begingroup
\thispagestyle{empty}
\drop = 0.12\textheight
{\Huge
\fontsize{48pt}{75pt}\selectfont
\titleFont \color{mainColour} \@title}\\[0.12\drop]
\hspace*{0.1\textwidth}
{\begin{flushleft}
\fontsize{14pt}{30pt}\selectfont \@foreword\par
\end{flushleft}}
\endgroup

}