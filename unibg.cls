\ProvidesClass{unibg}

\makeatletter

\newcommand{\@lang}{}
\newcommand{\@degtype}{}

\DeclareOption{italian}{\renewcommand{\@lang}{italian}}
\DeclareOption{english}{\renewcommand{\@lang}{english}}

\DeclareOption{master}{\renewcommand{\@degtype}{master}}
\DeclareOption{bachelor}{\renewcommand{\@degtype}{bachelor}}

\ExecuteOptions{italian,master}

\ProcessOptions\relax

\LoadClass[a4paper,12pt,twoside,openright]{report}

\RequirePackage[utf8]{inputenc}
\RequirePackage{biblatex}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[T1]{fontenc}
\RequirePackage[\@lang]{babel}
\RequirePackage{amsmath}
\RequirePackage{caption}
\RequirePackage{csquotes}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{import}
\RequirePackage{listings}
\RequirePackage{multicol}
\RequirePackage{xifthen}
\RequirePackage{xstring}

\DeclareStringOption[italian]{lang}

% ----------------------- Bibliography
\addbibresource{bibliography.bib}

% ----------------------- Graphics
\graphicspath{{./images/}}

% ----------------------- Page style
\fancypagestyle{plain}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[CE,CO]{}
  \fancyfoot[LE,RO]{\thepage}
}
\pagestyle{plain}

% ----------------------- Geometry and measures
\geometry{margin=3cm}
\renewcommand{\baselinestretch}{1.5}
\setcounter{tocdepth}{4}

% ----------------------- New commands
\newcommand{\emptypage}{
  \clearpage
  \thispagestyle{empty}
  \pagenumbering{gobble}
  \mbox{}
}
\newcommand{\toc}[1][]{
  \clearpage
  \pagenumbering{Roman}
  \tableofcontents
  \IfSubStr{#1}{figures}{\listoffigures}{}
  \IfSubStr{#1}{tables}{\listoftables}{}
    \ifthenelse{\equal{\@lang}{italian}}
      {\renewcommand{\lstlistlistingname}{Elenco dei Codici}}
      {\renewcommand{\lstlistlistingname}{List of Listings}}
  \IfSubStr{#1}{listings}{\lstlistoflistings}{}
}

% ----------------------- Title page
\newcommand{\@subtitle}{}
% \newcommand{\@coadvisor}{}

\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\department}[1]{\newcommand{\@department}{#1}}
\newcommand{\course}[1]{\newcommand{\@course}{#1}}
\newcommand{\class}[1]{\newcommand{\@class}{#1}}
\newcommand{\advisor}[1]{\newcommand{\@advisor}{#1}}
\newcommand{\coadvisor}[1]{\renewcommand{\@coadvisor}{#1}}
% \newcommand{\studentid}[1]{\newcommand{\@studentid}{#1}}
\newcommand{\academicyear}[1]{\newcommand{\@academicyear}{#1}}

% ----------------------- Multi author support
\newcounter{@authorcount}
\newcommand{\@authors}{}

\newcounter{@studentidcount}
\newcommand{\@studentids}{}

\renewcommand{\author}[1]{
  \ifthenelse{\equal{\@authors}{}}
    {\renewcommand{\@authors}{#1}}
    {\g@addto@macro{\@authors}{, #1}}
  \stepcounter{@authorcount}
}

\newcommand{\studentid}[1]{
  \ifthenelse{\equal{\@studentids}{}}
    {\renewcommand{\@studentids}{#1}}
    {\g@addto@macro{\@studentids}{, #1}}
  \stepcounter{@studentidcount}
}

% ----------------------- Multi co-advisor support
\newcommand{\@coadvisor}{}
\newcounter{@coadvisorcount}

\renewcommand{\coadvisor}[1]{
  \ifthenelse{\equal{\@coadvisor}{}}
    {\renewcommand{\@coadvisor}{#1}}
    {\g@addto@macro{\@coadvisor}{\newline #1}}
  \stepcounter{@coadvisorcount}
}

\newenvironment{changemargin}[2]{
  \list{}{\rightmargin#2\leftmargin#1}\item[]
}{
  \endlist
}

\renewcommand{\maketitle}{
  \input{translations/\@lang.tex}
  \begin{titlepage}
    \input{templates/\@degtype.tex}
  \end{titlepage}
}

\makeatother

\endinput
