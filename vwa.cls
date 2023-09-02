% vwa.cls
%
% A LaTeX2e document class for VWA documents ("Vorwissenschaftliche Arbeiten",
% "Pre-scientific Papers"), which Austrian students have to write before
% graduating from secondary school.
%

%% vwa.cls
%% Copyright 2020-2023 Alexander Leithner
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Alexander Leithner.
%
% This work consists of the file vwa.cls and is based on KOMA-Script

\def\fileversion{1.0}
\def\filedate{01.IX.2023}
\def\fileurl{https://github.com/a-leithner/latex-vwa-template}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{vwa}[2023/09/01 v.\fileversion\space by Alexander Leithner]

\RequirePackage{xspace}

% Provide a sneaky way to disable colophon output (please don't use this!)
\DeclareOption{keincolophon}{\newcommand{\colophonAus}{}}

% Provide a way to disable title output in the header and enable it in the footer
%   kopfleer          The header won't contain the title
%   fusstitel         The footer will contain the author and the title
%   fussschule        The footer will contain the author and the school
%   kopftitelklein    The header will scale the title down to \scriptsize
% Note that the following options exclude each other:
%   kopftitelklein    will only work if kopfleer is unset
%   fussschule        will only work if fusstitel is unset
\DeclareOption{kopfleer}{\newcommand{\titelAus}{}}
\DeclareOption{fusstitel}{\newcommand{\titelAn}{}}
\DeclareOption{fussschule}{\newcommand{\schuleAn}{}}
\DeclareOption{kopftitelklein}{\newcommand{\titelAnKlein}{}}

% Enable wrapfig for wrap-around figures
\DeclareOption{umflussabbildungen}{%
	\IfFileExists{wrapfig.sty}{%
		\newcommand{\@load@wrapfig}{}%
		\newcommand{\umfluss@ok}{}
	}{%
		\ClassError{vwa}{wrapfig nicht installiert!}{Um Abbildungen mit Umfluss zu setzen, installieren Sie bitte das Paket wrapfig!}%
	}
}

% Option to automatically include the inclusivity statement
\DeclareOption{gendererklaerung}{\newcommand{\@gendererklaerung@auto}{}}

% Option to enable additional math shorthands
\DeclareOption{zahlenmengen}{
	\newcommand{\N}{\ensuremath{\mathbb{N}}\xspace}
	\newcommand{\R}{\ensuremath{\mathbb{R}}\xspace}
	\newcommand{\C}{\ensuremath{\mathbb{C}}\xspace}
	\newcommand{\Z}{\ensuremath{\mathbb{Z}}\xspace}
	\newcommand{\Q}{\ensuremath{\mathbb{Q}}\xspace}
	\newcommand{\K}{\ensuremath{\mathbb{K}}\xspace}
}

% Pass all other options to KOMA-Script's scrbook
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{scrbook}%
}
\ProcessOptions\relax

% Load KOMA-Script's scrbook class
\LoadClass{scrbook}

% Set header and footer heights so scrlayer-scrpage does not complain
\KOMAoption{headheight}{22pt}
\KOMAoption{footheight}{22pt}
\KOMAoption{DIV}{last}

\ifcsname @load@wrapfig\endcsname\RequirePackage{wrapfig}\fi
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage[autoenlargeheadfoot=on]{scrlayer-scrpage}
\RequirePackage[backend=biber,style=authoryear-icomp,sortlocale=de_DE,hyperref=true,natbib=true,autocite=footnote]{biblatex}
\RequirePackage[pdftex,hidelinks,unicode,pdfcreator={LaTeX 2e},pdfproducer={LaTeX mit VWA-Vorlage von A. Leithner}]{hyperref}

% Create a shortcut so we don't have to type \autocite the whole time
\let\zit\autocite

% Provide the school metadata: \schule[logo]{name}{address}
\newcommand{\schule}[3][schullogo.png]{%
	\newcommand{\theschule}{#2}%
	\newcommand{\theschuladresse}{#3}%
	\newcommand{\theschullogo}{#1}%
}

% Provide some more metadata as required by the ministry of education:
%   the class                        via \klasse
%   the advisor (and a custom label) via \betreuungsperson
%   the city or town of the school   via \ort
\newcommand{\klasse}[1]{\newcommand*{\theklasse}{#1}}
\newcommand{\betreuungsperson}[2][Betreuer*in]{\newcommand*{\thebetreuungslabel}{#1}\newcommand*{\thebetreuung}{#2}}
\newcommand{\ort}[1]{\newcommand{\theort}{#1}}

% Disclaimer command for the page after the title page.
\newcommand*{\@colophon}{
	\begingroup
		\,
		\vfill
		
		\noindent Diese Arbeit wurde mit dem Textsatzprogramm \LaTeX\ gesetzt und
		mit den Bibliographieprogammen \texttt{biber} und Bib\LaTeX\ erstellt.
		
		\noindent Die verwendete Vorlage für vorwissenschaftliche Arbeiten wurde
		von Alexander Leithner erstellt und auf \href{\fileurl}{GitHub} unter
		der \LaTeX\ Project Public License in Version 1.3 quelloffen zur
		Verfügung gestellt.
		
		{\noindent\footnotesize Diese Vorlage ist abrufbar unter \texttt{\fileurl}}
	\endgroup
}

% Macro to ensure that we have any kind of town set, so we don't run into errors
\newcommand{\@ensuretownset}{
	\ifcsname theort\endcsname\else
		\ClassWarning{vwa}{Kein Ort festgelegt! Setze "Wien"}
		\global\def\theort{Wien}
	\fi
}

% Macro to ensure that we set all footnotes with a linespread of 1 if the
% document's overall linespread is different than 1
\newcommand{\@ensuresinglelinespreadinfootnotes}{%
	\addtokomafont{footnote}{\linespread{1}\selectfont}%
}

% Macro constructing the title page
\newcommand*{\@thetitle}{
	\ifcsname theschule\endcsname\else
		\ClassError{vwa}{Keine Schule festgelegt}{Setzen Sie Ihre Schule mithilfe des Macros "\string\schule".}
	\fi
	\ifcsname theklasse\endcsname\else
		\ClassError{vwa}{Keine Klasse festgelegt}{Setzen Sie Ihre Klasse mithilfe des Macros "\string\klasse".}
	\fi
	\ifcsname thebetreuung\endcsname\else
		\ClassError{vwa}{Kein*e Betreuer*in festgelegt}{Setzen Sie Ihre*n Betreuer*in mithilfe des Macros "\string\betreuungsperson".}
	\fi
	\@ensuretownset
	\ifcsname thebetreuerlabel\endcsname\else\newcommand{\thebetreuerlabel}{Betreuer}\fi
    \begingroup 
        \begin{center}
			\vspace*{\baselineskip}
			{\Huge \@title}\,\\[\baselineskip]%
			{\Large \@subtitle}\par\,\\[2\baselineskip]%
			{\large Vorwissenschaftliche Arbeit\\verfasst von\\\textbf{\@author},\\Klasse \theklasse}\\[2\baselineskip]%
			\includegraphics[height=3cm,keepaspectratio]{\theschullogo}\\[\baselineskip]
			{\large \thebetreuungslabel: \thebetreuung}\\[2\baselineskip]
			{\large \theschule}\\
			{\theschuladresse}\\[\baselineskip]
			{\theort, \@date}
        \end{center}
    \endgroup
}

% Wrapper macro used later in \maketitle
\newcommand*{\compiletitle}{
    \begin{titlepage}
    \@thetitle
    \ifcsname colophonAus\endcsname%
	\else
		\newpage\thispagestyle{empty}\@colophon%
	\fi
    \end{titlepage}%
    \ifcsname @gendererklaerung@auto\endcsname\@frontmatter@truly\gendererklaerung\fi%
}

% Override the default KOMA-Script title layout
\renewcommand*{\maketitle}{%
	\@definehdrs%
	\compiletitle%
}

% Override the default \frontmatter command to be able to provide the inclusivity statement automatically
\let\@old@frontmatter\frontmatter
\renewcommand*{\frontmatter}{%
	\ifcsname @gendererklaerung@auto\endcsname\else\@old@frontmatter\fi%
}
\newcommand*{\@frontmatter@truly}{\@old@frontmatter}

% Sets the headers and footers based upon the options given before invocation
\newcommand{\@definehdrs}{
	\ifcsname titelAn\endcsname
		\ifoot[\textsl{\footnotesize\@author,\ \@title}]{\textsl{\footnotesize\@author,\ \@title}}
		\cfoot[]{}
	\else
		\ifcsname schuleAn\endcsname
			\ifoot[\textsl{\footnotesize\@author}]{\textsl{\footnotesize\@author}}
			\cfoot[\upshape\footnotesize\theschule]{\upshape\footnotesize\theschule}
		\else
			\cfoot[]{}
		\fi
	\fi
	\ofoot[\pagemark]{\pagemark}
	
	\ifcsname titelAus\endcsname\else
		\ifcsname titelAnKlein\endcsname
			\lohead[]{\scriptsize\@title}
		\else%
			\lohead[]{\footnotesize\@title}
		\fi
	\fi
	\rohead[]{\slshape\rightmark}
	\chead[]{}
}

% Shortcut command for the linespread which also ensures correct linespread in footnotes
\newcommand{\zeilenabstand}[1]{%
	\linespread{#1}%
	\@ensuresinglelinespreadinfootnotes%
}

% Shortcut command for figures
\newcommand{\@abbildung}[2]{%
	\begin{figure}[h]%
		\centering%
		\includegraphics{#2}%
		\caption{#1}%
		\label{abb:#2}%
	\end{figure}%
}

% Shortcut command for figures with custom LOF caption and label
\newcommand{\@abbildung@custom}[4]{%
	\begin{figure}[h]%
		\centering%
		\includegraphics{#4}%
		\caption[#1]{#2}%
		\label{#3}%
	\end{figure}%
}

% Shortcut command for figures
\newcommand*{\abbildung}{\@ifstar{\@abbildung@custom}{\@abbildung}}

% Shortcut command for figures with custom graphicx parameters
\newcommand{\@Abbildung}[3]{%
	\begin{figure}[h]%
		\centering%
		\includegraphics[#3]{#2}%
		\caption{#1}%
		\label{abb:#2}%
	\end{figure}%
}

% Shortcut command for figures with custom graphicx parameters and LOF caption
% and label
\newcommand{\@Abbildung@custom}[5]{%
	\begin{figure}[h]%
		\centering%
		\includegraphics[#5]{#4}%
		\caption[#1]{#2}%
		\label{#3}%
	\end{figure}
}

% Shortcut command for figures with custom sizes
\newcommand*{\Abbildung}{\@ifstar{\@Abbildung@custom}{\@Abbildung}}

% Internal common warning command if wrapfig is missing
\newcommand*{\@wrapfig@warning}{%
	\ifcsname @load@wrapfig\endcsname
	\ClassWarning{vwa}{Kann keine Umflussabbildungen setzen}{%
		Sie haben zwar die Option "umflussabbildung" angegeben, da aber das
		Paket "wrapfig" nicht installiert ist, werden alle Abbildungen
		normal gesetzt!%
	}\else%
	\ClassError{vwa}{Umflussabbildungen sind deaktiviert}{%
		Umflussabbildungen werden mit der Option "umflussabbildungen" aktiviert.
		Dazu muss das Paket "wrapfig" installiert sein. Stellen Sie sicher,
		dass die Option angegeben und das Paket installiert ist! Bis dahin sind
		alle Abbildungen keine Umflussabbildungen.%
	}%
	\fi
}

% Command providing simple shortcut for wrapping figures
\newcommand*{\@umflussabbildung}[2]{%
	\ifcsname umfluss@ok\endcsname
	\begin{wrapfigure}{r}{0.5\textwidth}%
		\begin{center}%
			\includegraphics[width=0.48\textwidth]{#2}%
		\end{center}%
		\caption{#1}%
		\label{abb:#2}%
	\end{wrapfigure}%
	\else%
		\@wrapfig@warning%
		\@abbildung{#1}{#2}%
	\fi%
}

% Command providing elaborate shortcut for wrapping figures
\newcommand*{\@umflussabbildung@custom}[4]{%
	\ifcsname umfluss@ok\endcsname
	\begin{wrapfigure}{r}{0.5\textwidth}%
		\begin{center}%
			\includegraphics[width=0.48\textwidth]{#4}%
		\end{center}%
		\caption[#1]{#2}%
		\label{abb:#3}%
	\end{wrapfigure}%
	\else%
		\@wrapfig@warning%
		\@abbildung@custom{#1}{#2}{#3}{#4}%
	\fi%
}

% Command providing shortcuts for wrapping figures
\newcommand*{\umflussabbildung}{\@ifstar{\@umflussabbildung@custom}{\@umflussabbildung}}

% Command providing an elaborate shortcut for wrapping figures incl. custom
% graphicx parameters
\newcommand{\@Umflussabbildung}[3]{%
	\ifcsname umfluss@ok\endcsname
	\begin{wrapfigure}{r}{0.5\textwidth}%
		\begin{center}%
			\includegraphics[#3]{#2}%
		\end{center}%
		\caption{#1}%
		\label{abb:#2}%
	\end{wrapfigure}%
	\else%
		\@wrapfig@warning%
		\@Abbildung{#1}{#2}{#3}%
	\fi%
}

% Command providing a more elaborate shortcut for wrapping figures incl. custom
% graphicx parameters, LOF captions and label parameters
\newcommand{\@Umflussabbildung@custom}[5]{%
	\ifcsname umfluss@ok\endcsname
	\begin{wrapfigure}{r}{0.5\textwidth}%
		\begin{center}%
			\includegraphics[#5]{#4}%
		\end{center}%
		\caption[#1]{#2}%
		\label{abb:#3}%
	\end{wrapfigure}%
	\else%
		\@wrapfig@warning%
		\@Abbildung@custom{#1}{#2}{#3}{#4}{#5}%
	\fi%
}

% Command providing elaborate shortcuts for wrapping figures
\newcommand*{\Umflussabbildung}{\@ifstar{\@Umflussabbildung@custom}{\@Umflussabbildung}}

% General typographic design decisions overriding KOMA-Script defaults
\KOMAoptions{toc=chapterentrydotfill}
\KOMAoptions{headings=normal}
\RedeclareSectionCommand[beforeskip=0pt,afterskip=0.5cm]{chapter}
\setkomafont{chapterentry}{\rmfamily\bfseries}
\setkomafont{partentry}{\rmfamily\bfseries}
\setkomafont{pagehead}{\upshape}

\addtokomafont{disposition}{\rmfamily}

% Command for creating the optional statement of authorship
\newcommand*{\selbststaendigkeitserklaerung}{
	\@ensuretownset
	\thispagestyle{empty}
	\chapter*{Selbstständigkeitserklärung}
	Ich, \@author, erkläre hiermit, dass ich diese
	vorwissenschaftliche Arbeit selbstständig und ohne Hilfe Dritter verfasst
	habe. Insbesondere versichere ich, dass ich alle wörtlichen und sinngemäßen
	Übernahmen aus anderen Werken als Zitate kenntlich gemacht und alle
	verwendeten Quellen angegeben habe.\\[2\baselineskip]\par
	
	\noindent%
	\begin{tabular}{rll}
	\theort, am & \makebox[3cm]{\hrulefill} & \,\makebox[6cm]{\hrulefill}\\
	& Datum & Unterschrift
	\end{tabular}
}

% Command for creating the optional-but-sometimes-required statement of inclusivity
\newcommand*{\gendererklaerung}{
	\thispagestyle{empty}
	\chapter*{Gendererklärung}
	Aus Gründen der besseren Lesbarkeit wird in dieser vorwissenschaftlichen
	Arbeit die Sprachform des generischen Maskulinums angewandt. Es wird an
	dieser Stelle ausdrücklich darauf hingewiesen, dass die ausschließliche
	Verwendung der männlichen Form geschlechtsunabhängig verstanden werden soll.
	\newpage
}

% Patch the list of figures command to actually include page numbers
\makeatletter
\renewcommand{\listoffigures}{\newpage\thispagestyle{scrheadings}\chapter*{Abbildungsverzeichnis}\@starttoc{lof}\newpage}
\makeatother
