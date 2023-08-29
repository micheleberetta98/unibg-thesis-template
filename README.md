# UniBG LaTeX Thesis Template

A simple (unofficial) LaTeX template following the official
[UniBG formatting rules](https://www.unibg.it/studiare/frequentare/laurearsi/frontespizi).

## Important note

This template is completely free of use.
However, as highlighted in the MIT license, you have to give credit in your thesis
acknowledgements:
- To the *UniBG Seclab* if you're doing your thesis with them
- Or to me, *Michele Beretta*, in every other case

Remember to also include a link to this repository for reference.
An example sentence you can use is the following:

> I would like to thank *[INSERT NAME]* for providing the LaTeX template [1] used
> during the writing of this thesis.
>
> [1] *Link to this repo*

## Requirements

If you want to use this offline you need:

- *LaTeX* (required): this project is tested with TeX Live 2023/Arch Linux, the reference
  packages are [`texlive`](https://archlinux.org/groups/x86_64/texlive/) and
  [`biber`](https://archlinux.org/packages/community/any/biber/)
- [*latexmk*](https://mg.readthedocs.io/latexmk.html): not required, but recommended

`latexmk` could be installed alongside TeX Live if you go for the full version.

Other LaTeX flavours should work, but it's not guaranteed.

## Step-by-step setup

1. Make sure the requirements are installed
2. Setup your repository with the LaTeX code
   - Either use the "Use this template" button in GitHub
   - Or fork (or make your own copy) of the repo
3. Start writing in LaTeX, the structure is already setup for you
4. Use `make` to create the PDF

You can also copy the files to Overleaf or any other LaTeX editing software you
like. Note however that there could be some problems with some editors (see FAQs).

## Usage and options

Main usage is done through `\documentclass[language,degreetype]{unibg}`. You can set:
- *Lanuage*, either `italian` or `english`
- *Degree type*, either `master` or `bachelor`

### Quick example

```latex
\documentclass[english,master]{unibg}

\title{A Seclab Thesis}
\subtitle{A Seclab Subtitle}
\advisor{Prof.~John Smith}

\department{Department of Engineering}
\course{Computer Science}
\class{LM-32}

\author{John Doe}
\studentid{177013}
\academicyear{2021/2022}

\begin{document}
  \maketitle
\end{document}
```

See `main.tex` for the full setup.

### Title page options

| Option          | Required | Description                                                                              |
| --------------- | -------- | ---------------------------------------------------------------------------------------- |
| `\title`        | ✔️        | The title of the thesis                                                                  |
| `\subtitle`     |          | The subtitle of the thesis (or a "less important" part of the title)                     |
| `\advisor`      | ✔️        | Your advisor (professor who followed you)                                                |
| `\coadvisor`    |          | Your coadvisor (if you don't know about this, then you don't need it)                    |
| `\department`   | ✔️        | The [department](https://www.unibg.it/ateneo/organizzazione/dipartimenti) of your course |
| `\course`       | ✔️        | The official name of your course                                                         |
| `\class`        | ✔️        | The degree's class (check your course webpage)                                           |
| `\author`       | ✔️        | You (I hope)                                                                             |
| `\studentid`    | ✔️        | Your student number                                                                      |
| `\academicyear` | ✔️        | The academic year of your degree                                                         |

### Commands

| Command      | Description                | Options                                                                       |
| ------------ | -------------------------- | ----------------------------------------------------------------------------- |
| `\maketitle` | Creates the first page     | -                                                                             |
| `\emptypage` | Surprisingly, an empy page | -                                                                             |
| `\toc[opts]` | The table of contents      | Comma-separated list of zero or more among `figures`, `tables` and `listings` |

## FAQs

- *How to create a PDF?*

  Run `make` inside this folder.

- *How to have a live preview?*

  Run `make watch` inside this folder.
  Note that you have to configure `latexmk` in order to [support live updates](https://mg.readthedocs.io/latexmk.html#configuration-files).
  Also, this is known to not work with all viewers, especially not *Adobe Reader*.

- *I don't have make*/*I use Windows*

  Sorry about that. The files should be working without problems with any
  other editor (suggested Overleaf). You may have to copy files around. Note that
  there is a known problem with TeXstudio (see next FAQ).

- *The bibliography doesn't show up in TeXstudio*

  If the bibliography doesn't show up, try changing `backend=biber` into
  `backend=bibtex` in `unibg.cls` (should be around line 26) and then look at
  [this StackExchange answer](https://tex.stackexchange.com/questions/135102/biblatex-doesnt-show-bibliography-when-compiling).

- *How to change language?*

  Write your desired language in the options of `\documentclass{unibg}`.

- *How does the table of contents work?*

  Just use `\toc`. Note that the table of contents kinda breaks the flow of opening chapters on a right page.
  So remember to check and add a `\emptypage` if necessary.

- *How can I show other tables of contents, like figures?*

  Use the optional argument to `\toc`. If you want to show all supported table of contents,
  do `\toc[figures,tables,listings]`. You can also mix and match how you prefer.
  The chapter/section/subsection table of contents will always be printed though.
