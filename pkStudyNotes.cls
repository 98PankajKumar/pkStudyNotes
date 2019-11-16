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
\newfontfamily{\chapterFont}{Philosopher Italic}
\newfontfamily{\sectionFont}{Fira Sans Extra Condensed}
\newfontfamily{\sectionNumbers}{Fira Sans Extra Condensed Bold}

\setfontfamily{\FA}{Font Awesome 5 Free Regular}
\setfontfamily{\FASolid}{Font Awesome 5 Free Solid}[AutoFakeBold=1]

% ~~ Colour ~~ 
\definecolor{mainColour}{RGB}{211, 47, 47}
\colorlet{complementColour}{-mainColour}

\definecolor{sectionNumbersColour}{gray}{.8}

% ~~ Title ~~ 
\newlength{\drop}
\newcommand{\titlepageIcon}[1]{{\fontsize{28pt}{0pt}#1}\\[2mm]}
\newcommand{\titleQuoteIcon}[1]{{\fontsize{28pt}{0pt}#1}}

\newcommand{\@foreword}{}
\newcommand{\foreword}[1]{\renewcommand{\@foreword}{\textit{#1}}}
\newcommand{\@courseURL}{}
\newcommand{\courseURL}[1]{\renewcommand{\@courseURL}{\href{#1}{Course Website}}}
\newcommand{\@titleQuote}{}
\newcommand{\titleQuote}[2]{\renewcommand{\@titleQuote}{\titleQuoteIcon{\FASolid\symbol{"F10D}} \hspace{1cm} \titleQuoteIcon{\FASolid\symbol{"F10E}} \\[2mm] \textit{ #1 }  \\ \hspace*{5mm}  \textsc{#2}}}

\newcommand*{\createtitle}{
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


% ~~ Chapter Styling ~~
\newlength{\numberheight} 
\newlength{\chaprule}

\makechapterstyle{pkChapter}{%
	\setlength{\afterchapskip}{40pt}
	\renewcommand*{\chapterheadstart}{\vspace*{40pt}}
	\renewcommand*{\afterchapternum}{\par\nobreak\vskip 25pt}
	\renewcommand*{\chapnamefont}{\normalfont\LARGE\flushright}
	\renewcommand*{\chapnumfont}{\normalfont\fontsize{42pt}{60pt}\selectfont}
	\renewcommand*{\chaptitlefont}{\chapterFont\fontsize{42pt}{60pt}\selectfont}
	\renewcommand*{\printchaptername}{%
		\chapnamefont\MakeUppercase{\raisebox{0.4ex}{\@chapapp}} \hspace*{8mm}}
	\renewcommand*{\chapternamenum}{}
	\setlength{\beforechapskip}{8mm}
	\setlength{\midchapskip}{\paperwidth}
	\addtolength{\midchapskip}{-\textwidth}
	\addtolength{\midchapskip}{-\spinemargin}
	\setlength{\chaprule}{\textwidth}
	\renewcommand*{\printchapternum}{%
		\makebox[0pt][l]{\hspace{.5em}%
			\resizebox{!}{\numberheight}{\hspace*{-8mm}\chapnumfont \thechapter}%
			\hspace{.8em}%
			%
			}
			\raisebox{3mm}{\par\noindent{\color{mainColour} \rule{\chaprule}{1pt}}}}%
		\makeoddfoot{plain}{}{}{\thepage}


	}


\chapterstyle{pkChapter}

% ~~ Section Headings Style ~~
\setsecnumdepth{subsection}
\setsecnumformat{%
	\fontsize{48pt}{72pt}\sectionNumbers\selectfont {%
		\color{sectionNumbersColour}\raisebox{-0.25ex}{\thesection} \hspace*{-6mm}
		}}

\setsecheadstyle{ \fontsize{20pt}{30pt}\sectionFont\selectfont}	

% Subsection
\setsubsechook{\setsecnumformat{%
	\fontsize{30pt}{57pt}\sectionNumbers\selectfont {%
		\color{sectionNumbersColour}\raisebox{-0.25ex}{\thesubsection} \hspace*{-3mm}
		}}}

\setsubsecheadstyle{ \fontsize{14pt}{24pt}\sectionFont\selectfont}	