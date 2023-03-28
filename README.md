# UniBG LaTeX Thesis Template

A simple LaTeX template with the official UniBG formatting rules.

## Requirements

- *LaTeX* (full): check your OS installation method
- [`latexmk`](https://miktex.org/packages/latexmk)

## Quick example

```latex
\documentclass[a4paper,12pt,twoside,openright]{report}

\usepackage[english]{babel}
\usepackage{unibg}

\title{A UniBG Thesis}
\subtitle{A UniBG Subtitle}
\advisor{Chiar.mo Prof.~John Smith}

\department{Department of Engineering}
\course{Computer Science}
\class{LM-32}

\author{John Doe}
\studentid{69420}
\year{2021/2022}

\begin{document}
  \maketitle[english]{master}
\end{document}
```

See `main.tex` for the full setup.

## Available commands

### Configuration

| Option        | Required | Description                                                                              |
| ------------- | -------- | ---------------------------------------------------------------------------------------- |
| `\title`      | ✔️        | The title of the thesis                                                                  |
| `\subtitle`   |          | The subtitle of the thesis (or a "less important" part of the title)                     |
| `\advisor`    | ✔️        | Your advisor (professor who followed you)                                                |
| `\coadvisor`  |          | Your coadvisor (if you don't know about this, then you don't need it)                    |
| `\department` | ✔️        | The [department](https://www.unibg.it/ateneo/organizzazione/dipartimenti) of your course |
| `\course`     | ✔️        | The official name of your course                                                         |
| `\class`      | ✔️        | The degree's class (check your course webpage)                                           |
| `\author`     | ✔️        | You (I hope)                                                                             |
| `\studentid`  | ✔️        | Your student number                                                                      |
| `\year`       | ✔️        | The academic year of your degree                                                         |

### Commands

| Command                        | Description                                                                                                             |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| `\maketitle[language]{degree}` | Creates the first page, degree is either `master` or `bachelor` and language is either `italian` (default) or `english` |
| `\emptypage`                   | Surprisingly, an empy page                                                                                              |
| `\toc`                         | The table of contents                                                                                                   |

## Helpful questions

- *How to create a PDF?*

  Run `make` inside this folder.

- *How to have a live preview?*

  Run `make watch` inside this folder.
  Note that you have to configure `latexmk` in order to [support live updates](https://mg.readthedocs.io/latexmk.html#configuration-files).
  Also, this is known to not work with all viewers, especially not *Adobe Reader*.

- *How to change language?*

  Change your language in `\maketitle` and in the `\usepackage[language]{babel}` command.

- *How does the table of contents work?*

  Just use `\toc`. Note that the table of contents kinda breaks the flow of opening chapters on a right page.
  So remember to check and add a `\emptypage` if necessary.