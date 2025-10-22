
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spec}[UCF Spec Class]

% Pass through any extra options specified to the base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extreport}}

% Process class options
\ProcessOptions\relax

% Load the base class
\LoadClass{extarticle}

\usepackage[top=1in, bottom=0.5in, left=0.75in, right=0.75in]{geometry}
\usepackage{graphicx}
\usepackage{array}

% Increase the space between table rows
\renewcommand{\arraystretch}{1}

% Define a new right-aligned column type
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}

% Define a new left-aligned (no justification) column type
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}

% Define a new centered column type
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}

% Decrease default padding between columns (6pt is the default)
\setlength{\tabcolsep}{4pt}
\usepackage{booktabs}

% Adds microtypography features: character protrusion, for XeTeX.
\usepackage{microtype}

% Required for customizing headers and footers
\usepackage{fancyhdr}

% Reference to last page number
\usepackage{lastpage}

\usepackage{lmodern}

\usepackage{fontspec}
\setmainfont{texgyrepagella}[
  Extension = .otf,
  UprightFont = *-regular,
  BoldFont = *-bold,
  ItalicFont = *-italic,
  BoldItalicFont = *-bolditalic,
]

% Left align all text in the document (i.e. have a ragged right margin)
\usepackage[document]{ragged2e}

% Allows more precisely positioning floats e.g. \begin{figure}[H]
\usepackage{float}

\usepackage{enumitem}

% Required for currency symbols
\usepackage{textcomp}

% Required for the rupee symbol
\usepackage{tfrupee}

% Required for tables that can span multiple pages
\usepackage{longtable}

% Whitespace above longtables
\setlength{\LTpre}{0pt}

% Whitespace below longtables
\setlength{\LTpost}{0pt}

% Whitespace to the left of longtables
\setlength{\LTleft}{0pt}

\usepackage[many]{tcolorbox}

% Allows links.
\usepackage[bookmarks, colorlinks, breaklinks]{hyperref}
\hypersetup{colorlinks=true, urlcolor=blue, linkcolor=blue}

\urlstyle{rm}

% Remove extra spaces after periods.
\frenchspacing{}

\newcommand{\SpecName}{Universal Complain Format}
\newcommand{\SpecWebsite}{}
\newcommand{\SpecVersion}{v0.1}
\newcommand{\SpecEmail}{prathubaronia2011@gmail.com}
\newcommand{\SpecLogoPath}{./logo.png}
\newcommand{\SpecLocation}{Bengaluru, India}

\tcbset{
    sharp corners,
    colback = white,
    before skip = 0.2cm,
    after skip = 0.5cm
}

%----------------------------------------------------------------------------------------
% SPEC COLOR BOX SETUP
%----------------------------------------------------------------------------------------
\newtcolorbox{specboxc}{
    % better drop shadow
    sharpish corners,
    boxrule = 0pt,
    % top rule weight
    toprule = 4.5pt,
    enhanced,
    % {xshift}{yshift}{offset}{step}{options}
    fuzzy shadow = {0pt}{-2pt}{-0.5pt}{0.5pt}{black!35}
}

%----------------------------------------------------------------------------------------
% SPEC DOCUMENT HEADER DEFINITION
%----------------------------------------------------------------------------------------
\newcommand{\specheader}{
  % Set the unit length to millimeters
  \setlength{\unitlength}{1mm}

  % Adjusts the distance between the frameboxes and the borderlines
  \setlength\fboxsep{0mm}

  % Increase the thickness of the border line
  \setlength\fboxrule{0.5mm}

  \fcolorbox{black}{black!10}{%

    \begin{minipage}[c]{0.5\textwidth}
      \includegraphics[width=0.3\textwidth]{\SpecLogoPath}
    \end{minipage}\hfill

    \begin{minipage}[c]{0.48\textwidth}
      \raggedleft
      \begin{tabular}{@{}l@{}}
        Date: \today \\
        \SpecName \\
        Version: \SpecVersion \\
      \end{tabular}
    \end{minipage}
  }
}

%----------------------------------------------------------------------------------------
% SPEC HEADER AND FOOTER SETUP
%----------------------------------------------------------------------------------------
\fancypagestyle{firstpage}{%
  % Clear default headers/footers
  \fancyhf{}

  % No header rule on first page
  \renewcommand{\headrulewidth}{0pt}

  % Subtle footer rule
  \renewcommand{\footrulewidth}{0.5pt}

  % Email in footer left side
  \fancyfoot[L]{\small \SpecEmail}

  % Centered page numbering
  \fancyfoot[C]{\small Page \thepage}

  % Location on the footer right side
  \fancyfoot[R]{\small \SpecLocation}

  % no header space
  \setlength{\headheight}{0pt}

  % no header separation space
  \setlength{\headsep}{0pt}
}

\fancypagestyle{subsequentpages}{%
  % Clear default headers/footers
  \fancyhf{}

  % Header rule thickness
  \renewcommand{\headrulewidth}{0.5pt}

  % Footer rule thickness
  \renewcommand{\footrulewidth}{0.5pt}

  % Spec name in header left side
  \fancyhead[L]{\small \SpecName}

  % Spec version in header right side
  \fancyhead[R]{\small \SpecVersion}

  % Email in footer left side
  \fancyfoot[L]{\small \SpecEmail}

  % Centered page numbering
  \fancyfoot[C]{\small Page \thepage}

  % Location on the footer right side
  \fancyfoot[R]{\small \SpecLocation}

  \setlength{\headheight}{13.59999pt}
}

%----------------------------------------------------------------------------------------
%	SPEC TABLE ENVIRONMENT
%----------------------------------------------------------------------------------------
\newenvironment{spectable}[2]{
  \renewcommand{\arraystretch}{1.5}
  % Fixed vertical whitespace in case the table uses up all the stretch space
  \vspace{0.02\textheight} %

  % Define table column widths and alignments (L, R or C for left, right or center alignment)
  \begin{longtable}[H]{@{} L{0.25\textwidth} L{0.65\textwidth}}%
    \toprule
    % Header row
    \textbf{#1} & \textbf{#2} \\
    \midrule
  }{
    \bottomrule
  \end{longtable}

  % Fixed vertical whitespace in case the table uses up all the stretch space
  \vspace{0.02\textheight}
}

%----------------------------------------------------------------------------------------
%	SPEC TABLE ROW DEFINITION
%----------------------------------------------------------------------------------------
% Arguments: 1) description 2) quantity 3) unit price 4) note
\newcommand{\spectabelrow}[2]{%
  #1 & #2 \\
}

%----------------------------------------------------------------------------------------
%	SPEC SECTION ENVIRONMENT
%----------------------------------------------------------------------------------------
\newenvironment{specsection}[3]{
        \textbf{#1} \hfill \textbf{#2} \\
        \textit{#3}
        \begin{itemize}[itemsep=0pt, parsep=0pt]
}{
        \end{itemize}
        \hrule
        \bigskip
}

%----------------------------------------------------------------------------------------
%	SPEC PARAGRAPH ENVIRONMENT
%----------------------------------------------------------------------------------------
% Arguments: 1) paragraph title
\newenvironment{specpara}[1]{
        \textbf{#1} \\
        \smallskip
        \begin{minipage}{0.95\textwidth}
          \noindent
}{
        \end{minipage}
        \bigskip
}

%----------------------------------------------------------------------------------------
%	SPEC LIST ENVIRONMENT
%----------------------------------------------------------------------------------------
\newenvironment{specitemize}[1]{
        {\large{\textbf{#1}}}
        \begin{itemize}[itemsep=1pt, parsep=0pt, leftmargin=*]
}{
        \end{itemize}
}

%----------------------------------------------------------------------------------------
%	SPEC TITLE DEFINITION
%----------------------------------------------------------------------------------------
\newcommand{\spectitle}[2]{
  % Vertical whitespace
  \vspace{0.015\textheight}

  % Document title
  {\Large\MakeUppercase{#1}}

  % Vertical whitespace
  \vspace{0.015\textheight}

  % Spec date (won't be output if empty)
  \expandafter\ifstrequal\expandafter{#2}{}{}{{\large #2}}

  % Vertical whitespace
  \vspace{0.025\textheight}
}

%----------------------------------------------------------------------------------------
%	SPEC SUB-TITLE DEFINITION
%----------------------------------------------------------------------------------------
\newcommand{\specsubtitle}[2]{
  % Vertical whitespace
  \vspace{0.01\textheight}
 
  % Document subtitle
  {\textbf{Dear #1,}}

  % Spec subtitle#2 (won't be output if empty)
  \expandafter\ifstrequal\expandafter{#2}{}{}{{\textbf{#2}}}

  % Vertical whitespace
  \vspace{0.025\textheight}
}

%----------------------------------------------------------------------------------------
%	SPEC NOTE DEFINITION
%----------------------------------------------------------------------------------------
% Arguments: 1) description
\newcommand{\specnote}[1]{%
        \begin{specboxc}
        \begin{minipage}{0.95\textwidth}
                \textbf{Note:} #1
        \end{minipage}
        \end{specboxc}
}

%----------------------------------------------------------------------------------------
%	SPEC ANNEXURE DEFINITION
%----------------------------------------------------------------------------------------
% Arguments: 1) description 2) quantity 3) unit price 4) note
\newcommand{\specannexure}[1]{%
        \newpage
        \begin{center}
        \textbf{#1}
        \end{center}
}

%----------------------------------------------------------------------------------------
%	SPEC JUSTIFIED TEXT DEFINITION
%----------------------------------------------------------------------------------------
\newcommand{\specjust}[1]{
        \noindent
        {\justifying #1}
}

% Use first page style on first page
\AtBeginDocument{\thispagestyle{firstpage}}

% Use subsequent pages style on other pages
\pagestyle{subsequentpages}
