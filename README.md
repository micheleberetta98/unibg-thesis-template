# UniBG LaTeX Thesis Template

A simple LaTeX template with the official UniBG formatting rules.

## Requirements

- *LaTeX*: check your OS installation method
- [`latexmk`](https://miktex.org/packages/latexmk)

## Quick example

```latex
\documentclass[a4paper,12pt,openright]{report}

\usepackage[english]{babel}

\title{A UniBG Thesis}
\subtitle{A UniBG Subtitle}
\advisor{Chiar.mo Prof.~John Smith}

\department{Department of Engineering}
\class{LM-32}

\author{John Doe}
\studentid{69420}
\year{2021/2022}

\begin{document}
  \maketitle[english]{master}
\end{document}
```

See `main.tex` for the full setup.

## How to

- *Create a PDF?*

  Run `make` inside this folder.

- *Live preview?*

  Run `make watch` inside this folder.

- *Change language?*

  Set your language (*italian* or *english*) like this: `\maketitle[english]{master}`.
  Italian is default.

- *Change between bachelor and master?*

  Use the first parameter to `\maketitle`, either `\maketitle{master}` or `\maketitle{bachelor}`.

- *Setup a table of contents?*

  Use `\toc`.