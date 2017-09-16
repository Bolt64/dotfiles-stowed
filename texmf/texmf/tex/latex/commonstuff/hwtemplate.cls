%=====================================================================
% jhwhw.cls
% Provide jhwhw.cls class
%=====================================================================

%=====================================================================
% Identification
%=====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hwtemplate}[2009/02/11 Justin Wilson's forked Homework Class]

\LoadClass[letterpaper, 12pt]{report}

\RequirePackage{fancyhdr}
\RequirePackage[top=1in,bottom=2cm,left=1in,right=1in]{geometry}
\RequirePackage{graphicx}
\RequirePackage{empheq}
\RequirePackage{ifthen}
\RequirePackage[nodayofweek]{datetime}


%=====================================================================
% Commands
%=====================================================================

  \setlength{\headheight}{15pt}
  \lhead{\@author}\chead{\@title}\rhead{\usdate\@date}
  
  \renewcommand{\footrulewidth}{0.4pt}  
  \rfoot{SR number: \srnumber}
  \pagestyle{fancy}

\ifx\pdfoutput\undefined                         %LaTeX
  \RequirePackage[ps2pdf,bookmarks=true]{hyperref}
  \hypersetup{ %
    pdfauthor   = {\@author},
    pdftitle    = {\@title},
    pdfcreator  = {LaTeX with hyperref package},
    pdfproducer = {dvips + ps2pdf}
  }
\else                                            %PDFLaTeX
  \RequirePackage[pdftex,bookmarks=true]{hyperref}
  \hypersetup{ %
    pdfauthor   = {\@author},
    pdftitle    = {\@title},
    pdfcreator  = {LaTeX with hyperref package},
    pdfproducer = {dvips + ps2pdf}
  }
\pdfadjustspacing=1
\fi

% Set up counters for problems and subsections

\newcounter{ProblemNum}
\newcounter{SubProblemNum}[ProblemNum]

\renewcommand{\theProblemNum}{\arabic{ProblemNum}}
\renewcommand{\theSubProblemNum}{\alph{SubProblemNum}}


\newcommand*{\anyproblem}[1]{\subsection*{#1}}
\newcommand*{\problem}[1]{\stepcounter{ProblemNum} %
   \anyproblem{Problem \theProblemNum. \; #1}}
\newcommand*{\soln}[1]{\subsubsection*{#1}}
\newcommand*{\solution}{\soln{Solution}}
\renewcommand*{\part}{\stepcounter{SubProblemNum} %
  \soln{Part (\theSubProblemNum)}}

\renewcommand{\theenumi}{(\alph{enumi})}
\renewcommand{\labelenumi}{\theenumi}
\renewcommand{\theenumii}{\roman{enumii}}

% Custom titlepage

\renewcommand{\maketitle} {
\begin{titlepage}
  \vspace*{\fill}
\begin{center}
 {\huge\bfseries \@title \\}
 \vspace{1.5cm}
 {\Large\bfseries \@author}\\[5pt]
 SR Number: \srnumber \\[14pt]
 \@date
\vfill
\end{center}
\end{titlepage}
}
