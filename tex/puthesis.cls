\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{puthesis}
         [2015/11/02 v1.4 Inburex Phitec Report class]
\RequirePackage{setspace}
\RequirePackage{ccicons}
\RequirePackage{ifthen}
\RequirePackage{float}
\RequirePackage{fancyhdr}
\usepackage{lastpage}
\usepackage{etoolbox}
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}
%%%
\usepackage[scaled]{helvet}
\renewcommand*{\familydefault}{\sfdefault}
\newcounter{subyear}
\setcounter{subyear}{\number\year}
\def\submitted#1{\gdef\@submitted{#1}}
\def\@submittedyear{\ifnum\month>10 \stepcounter{subyear}\thesubyear
  \else\thesubyear\fi}
\def\@submittedmonth{\ifnum\month>10 January\else\ifnum\month>5 November
  \else June\fi\fi}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}}
\def\@copyrightyear{\number\year}
\def\adviser#1{\gdef\@adviser{#1}}
\long\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}
\newcommand*{\frontmatter}{
  %%%\pagenumbering{roman}
  }
\newcommand*{\mainmatter}{\pagenumbering{arabic}}
\newcommand*{\makelot}{}
\newcommand*{\makelof}{}
\newcommand*{\makelos}{}
\newcommand*{\maketoc}{
  % Add ToC to the pdfbookmarks as a section, but not to the ToC itself.
  % only if we have the hyperref command that is necessary
  \ifdefined\pdfbookmark
     \phantomsection
     \pdfbookmark[1]{\contentsname}{Contents}
  \else
  \fi

  \tableofcontents
  \clearpage
}
%% Setup a command to add extra space only if in singlespacing mode
\newcommand*{\extravspace}[1]{\vspace{0in}}
%% Setup a command to set spacing for body text; also used to restore spacing after long tables in document
\newcommand*{\bodyspacing}{
  \doublespacing
}
%% boolean for twosided/onesided
\newboolean{@myopt@oneside}
\setboolean{@myopt@oneside}{true}
%% Setup a command to set spacing for long tables, to be used manually in document
\newcommand*{\tablespacing}{
  \singlespacing
}
%% Command inserted into the document immediately after \begin{document} to place all frontmatter
%%   This was formerly named 'begincmd' and called below in \AtBeginDocument{}
%%   However, that is not compatible with package 'hyperref'. \tableofcontents needs
%%   to be declared from within the document itself. 
\newcommand*{\makefrontmatter}{
\pagestyle{fancy}
%%% Kopf und Fusszeilen
\fancyhead[R]{ }
\fancyhead[L]{ }
\fancyhead[C]{\includegraphics[width=0.98\textwidth]{Kopfzeile_neu.png}}
\fancyfoot[C]{Laborbericht TL/10716/16}
\fancyfoot[R]{\thepage\  von \pageref{LastPage}}
\fancypagestyle{meinstyle}{\renewcommand{\headrulewidth}{0pt}\fancyfoot[C]{}\fancyfoot[R]{}} 
\bodyspacing
\let\ps@plain\ps@fancy
\fancyfoot[C]{}\fancyfoot[R]{}
\frontmatter\maketitlepage\makeabstract
\maketoc\clearpage\makelof\clearpage\makelos
\fancyfoot[C]{Laborbericht TL/10716/16}
\fancyfoot[R]{\thepage\  von \pageref{LastPage}}
\clearpage
\mainmatter
}
\def\@submitted{\@submittedmonth~\@submittedyear}
\def\@dept{Labor}
\def\@deptpref{Abteilung}
\def\departmentprefix#1{\gdef\@deptpref{#1}}
\def\department#1{\gdef\@dept{#1}}
\long\def\acknowledgements#1{\gdef\@acknowledgements{#1}}
\def\dedication#1{\gdef\@dedication{#1}}

\newcommand{\maketitlepage}{{
  \thispagestyle{meinstyle}
  \sc
  \vspace*{1.5in}
  Leere Seite

  }}
\newcommand*{\makecopyrightpage}{
  \thispagestyle{meinstyle}
  \vspace*{0in}
  \begin{center}
    \copyright\ Verfasst von \@author, \@copyrightyear. \\
    \hspace{0.1cm}
    \begin{minipage}[c]{0.7\linewidth}
      Inburexlogo \\
    \end{minipage}
  \end{center}
  \clearpage}
\newcommand*{\makeabstract}{
  \thispagestyle{meinstyle}
  \newpage
  \thispagestyle{meinstyle}
  \addcontentsline{toc}{section}{Titelseite}
  \begin{center}
  \Large \textbf{Hinweis}
  \end{center}
  \@abstract
  \\
  \\
  \\
  \\
  \clearpage
  }
  
\def\makeacknowledgements{
  \ifx\@acknowledgements\undefined
  \else
    \ifdefined\phantomsection
     % makes hyperref recognize this section properly for pdf links
     \phantomsection
    \else
    \fi

    \addcontentsline{toc}{section}{Acknowledgements}
    \begin{center}
      \Large \textbf{Abk\"urzungsverzeichnis}
    \end{center}
    \@acknowledgements
    \clearpage
  \fi
  }
\def\makededication{
  \ifx\@dedication\undefined
  \else
    \vspace*{1.5in}
    \begin{flushright}
      \@dedication
    \end{flushright}
    \clearpage
  \fi
  }
\DeclareOption{lot}{\renewcommand*{\makelot}{
  \ifdefined\phantomsection
    % makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
  \addcontentsline{toc}{section}{Tabellenverzeichnis}\listoftables}}
\DeclareOption{lof}{\renewcommand*{\makelof}{\thispagestyle{meinstyle}
  \ifdefined\phantomsection
    % makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
  \addcontentsline{toc}{section}{Grafikverzeichnis}\listoffigures}}
\DeclareOption{los}{
  \renewcommand*{\makelos}{
    \RequirePackage{losymbol}
    \section*{List of Symbols\@mkboth {Symbolverzeichnis}{LIST OF SYMBOLS}}
    \@starttoc{los}
  \ifdefined\phantomsection
    % makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
    \addcontentsline{toc}{section}{List of Symbols}
  }
}
\DeclareOption{singlespace}{
  \renewcommand*{\bodyspacing}{
  \singlespacing
  }
  %% Add extra space only if in singlespacing mode
  \renewcommand*{\extravspace}[1]{\vspace{#1}}
}
%% Doublespacing is the default for the thesis -- need not be declared.
\DeclareOption{doublespacing}{
  \renewcommand*{\bodyspacing}{
  \doublespacing
  }
}
%% oneside/twoside options
\DeclareOption{oneside}{\setboolean{@myopt@oneside}{true}}
\DeclareOption{twoside}{\setboolean{@myopt@oneside}{false}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\ifthenelse{\boolean{@myopt@oneside}}
    {\PassOptionsToClass{oneside}{report}}
    {\PassOptionsToClass{twoside}{report}}

%% Not necessary to specify the point size - we inherit it from above
%% \LoadClass[11pt]{report}
\LoadClass{report}
\ifthenelse{\boolean{@myopt@oneside}}
    {
\setlength{\oddsidemargin}{.3in}   %{.4375in}
\setlength{\evensidemargin}{.3in} %{.4375in}
}{
\setlength{\oddsidemargin}{.3in}   %{.4375in}
\setlength{\evensidemargin}{0in} %{.4375in}
}
\setlength{\topmargin}{-.5in}  %{-.5625in}
\setlength{\footskip}{.25in} % to put page number 3/4" from the bottom of the page (1/4" from bottom of body text)
\setlength{\textheight}{9in}
\setlength{\textwidth}{6in}

%%% Alter LaTeX defaults to try to eliminate all widows and orphans
\clubpenalty=10000
\widowpenalty=10000

%%% try to avoid overfull lines by limiting how far it is okay to exceed the margins
%%% http://www.tex.ac.uk/cgi-bin/texfaq2html?label=overfull
\setlength{\emergencystretch}{3em}

\long\def\abstract#1{\gdef\@abstract{#1}}
%% 'begincmd' no longer used -- insert \makefrontmatter in the document instead. See above. 
%\AtBeginDocument{\begincmd}
\endinput
%% 
%% End of file `puthesis.cls'.
