% vwa.cls
%
% A LaTeX2e document class for VWA documents ("Vorwissenschaftliche Arbeiten",
% "Pre-scientific Papers"), which Austrian students have to write before
% graduating from secondary school.
%

%% vwa.cls
%% Copyright 2020 Alexander Leithner
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

\def\fileversion{0.3}
\def\filedate{07.IV.2020}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{vwa}[2020/04/07 v.\fileversion\space by Alexander Leithner]

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

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage[autoenlargeheadfoot=on]{scrlayer-scrpage}
\RequirePackage[backend=biber,style=authoryear-icomp,sortlocale=de_DE,hyperref=true,natbib=true,autocite=footnote]{biblatex}
\RequirePackage[pdftex,hidelinks,unicode,pdfcreator={LaTeX 2e},pdfproducer={LaTeX mit VWA-Vorlage von A. Leithner}]{hyperref}

% Create a shortcut so we don't have to type \autocite the whole time
\let\zit\autocite

% Redefine some of the metadata macros to be able to use them later on
\let\titleoriginal\title              % Save original title macro
\renewcommand{\title}[1]{             % Define new title macro.
    \titleoriginal{#1}%
    \newcommand{\thetitle}{#1}
}

\let\subtitleoriginal\subtitle        % Save original subtitle macro
\renewcommand{\subtitle}[1]{          % Define new subtitle macro.
    \subtitleoriginal{#1}%
    \newcommand{\thesubtitle}{#1}
}

\let\authororiginal\author            % Save original author macro
\renewcommand{\author}[1]{            % Define new author macro.
    \authororiginal{#1}%
    \newcommand{\theauthor}{#1}
}

\let\dateoriginal\date
\renewcommand{\date}[1]{\dateoriginal{#1}\newcommand{\thedate}{#1}}

% Provide the school metadata: \schule[logo]{name}{address}
\newcommand{\schule}[3][schullogo.png]{%
	\newcommand{\theschule}{#2}%
	\newcommand{\theschuladresse}{#3}%
	\newcommand{\theschullogo}{#1}%
}

% Provide some more metadata as required by the ministry of education:
%   the class                      via \klasse
%   the advisor                    via \betreuer
%   a custom label for the advisor via \betreuerLabel
%   the city or town of the school via \ort
\newcommand{\klasse}[1]{\newcommand{\theklasse}{#1}}
\newcommand{\betreuer}[1]{\newcommand{\thebetreuer}{#1}}
\newcommand{\betreuerLabel}[1]{\newcommand{\thebetreuerlabel}{#1}}
\newcommand{\ort}[1]{\newcommand{\theort}{#1}}

% Provide a sneaky way to disable colophon output (please don't use this!)
\newcommand{\keinLaTeXHinweis}{\newcommand{\colophonAus}{}}

% Provide a way to disable title output in the header and enable it in the footer
%   \keinTitelImKopf     The header won't contain the title
%   \titelImFuss         The footer will contain the author and the title
%   \schuleImFuss        The footer will contain the author and the school
%   \titelImKopfKlein    The header will scale the title down to \scriptsize
% Note that the following options exclude each other:
%   \titelImKopfKlein    will only work if \keinTitelImKopf is unset
%   \schuleImFuss        will only work if \titelImFuss is unset
\newcommand{\keinTitelImKopf}{\newcommand{\titelAus}{}}
\newcommand{\titelImFuss}{\newcommand{\titelAn}{}}
\newcommand{\schuleImFuss}{\newcommand{\schuleAn}{}}
\newcommand{\titelImKopfKlein}{\newcommand{\titelAnKlein}{}}

% Disclaimer command for the page after the title page.
\newcommand*{\@colophon}{
	\begingroup
		\noindent{
			\,
			\vfill {}
			{\noindent
				Diese Arbeit wurde unter Zuhilfenahme des Bibliographieprogrammes
				\texttt{biber} erstellt und mittels des Textsatzprogrammes
				\LaTeX\ gesetzt.
			}\\[\baselineskip]{\noindent
				Die verwendete Vorlage, die auf
				\href{https://www.komascript.de}{KOMA-Script} basiert, wurde von
				Alexander Leithner erstellt und gemäß der \LaTeX\ Project Public
				License, Version 1.3, als quelloffen auf
				\href{https://github.com/a-leithner/latex-vwa-template}{GitHub}
				zur Verfügung gestellt.
			}
		}
		\par
	\endgroup
}

% Macro to ensure that we have any kind of town set, so we don't run into errors
\newcommand{\@ensuretownset}{
	\ifcsname theort\endcsname\else
		\ClassWarning{vwa}{Kein Ort festgelegt! Setze "Wien".}
		\global\def\theort{Wien}
	\fi
}

% Macro constructing the title page
\newcommand*{\@thetitle}{
	\ifcsname theschule\endcsname\else
		\ClassError{vwa}{Keine Schule festgelegt!}{Setzen Sie Ihre Schule mithilfe des Macros "schule".}
	\fi
	\ifcsname theklasse\endcsname\else
		\ClassError{vwa}{Keine Klasse festgelegt!}{Setzen Sie Ihre Klasse mithilfe des Macros "klasse".}
	\fi
	\ifcsname thebetreuer\endcsname\else
		\ClassError{vwa}{Kein Betreuer festgelegt!}{Setzen Sie Ihren Betreuer mithilfe des Macros "betreuer".}
	\fi
	\@ensuretownset
	\ifcsname thebetreuerlabel\endcsname\else\newcommand{\thebetreuerlabel}{Betreuer}\fi
    \begingroup 
        \begin{center}
        \vspace*{\baselineskip}
        {\Huge \thetitle}\ifcsname thesubtitle\endcsname%
        \\[\baselineskip]{\Large \thesubtitle}\fi\\[4\baselineskip]%
        {\large Vorwissenschaftliche Arbeit verfasst von\\\textbf{\theauthor},\\Klasse \theklasse}
        \vfill
        \includegraphics[height=3cm,keepaspectratio]{\theschullogo}\\[\baselineskip]
        {\large \thebetreuerlabel: \thebetreuer}\\[2\baselineskip]
        {\large \theschule}\\
        {\theschuladresse}\\[\baselineskip]
        {\theort, \thedate}
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
    \end{titlepage}
}

% Override the default KOMA-Script title layout
\renewcommand*{\maketitle}{
	\@definehdrs
	\compiletitle
}

% Sets the headers and footers based upon the options given before invocation
\newcommand{\@definehdrs}{
	\ifcsname titelAn\endcsname
		\ifoot[\textsl{\footnotesize\theauthor,\ \thetitle}]{\textsl{\footnotesize\theauthor,\ \thetitle}}
		\cfoot[]{}
	\else
		\ifcsname schuleAn\endcsname
			\ifoot[\textsl{\footnotesize\theauthor}]{\textsl{\footnotesize\theauthor}}
			\cfoot[\upshape\footnotesize\theschule]{\upshape\footnotesize\theschule}
		\else
			\cfoot[]{}
		\fi
	\fi
	\ofoot[\pagemark]{\pagemark}
	
	\ifcsname titelAus\endcsname\else
		\ifcsname titelAnKlein\endcsname
			\lohead[]{\scriptsize\thetitle}
		\else%
			\lohead[]{\footnotesize\thetitle}
		\fi
	\fi
	\rohead[]{\slshape\rightmark}
	\chead[]{}
}

% Shortcut command for the linespread
\newcommand{\zeilenabstand}[1]{\linespread{#1}}

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
	Ich, \theauthor, erkläre hiermit, dass ich diese
	vorwissenschaftliche Arbeit selbstständig und ohne Hilfe Dritter verfasst
	habe. Insbesondere versichere ich, dass ich alle wörtlichen und sinngemäßen
	Übernahmen aus anderen Werken als Zitate kenntlich gemacht und alle
	verwendeten Quellen angegeben habe.\\[2\baselineskip]
	\par\noindent\makebox[5cm]{\,\hfill\theort, am\hspace{5mm}}\makebox[3cm][b]{\hrulefill}\hspace{1cm}\makebox[6cm]{\hrulefill}\\[-2mm]
	\noindent\makebox[5cm]{~}\makebox[3cm][l]{Datum}\hspace{1cm}\makebox[6cm][l]{Unterschrift}
}

% Patch the list of figures command to actually include page numbers
\makeatletter
\renewcommand{\listoffigures}{\newpage\thispagestyle{scrheadings}\chapter*{Abbildungsverzeichnis}\@starttoc{lof}\newpage}
\makeatother
