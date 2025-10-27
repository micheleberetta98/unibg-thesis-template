# UniBG LaTeX Thesis Template

A simple (unofficial) LaTeX template following the official
[UniBG formatting rules](https://www.unibg.it/studiare/frequentare/laurearsi/frontespizi).

:tada: *Also, checkout the [Typst branch](https://github.com/micheleberetta98/unibg-thesis-template/tree/typst)!* :tada:

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

You can use the "Cite this repository" button on the right.

## Requirements

- *LaTeX* [required] unsurprisingly
- [*latexmk*](https://mg.readthedocs.io/latexmk.html) [optional] if you want
  live preview with `make watch`

The project has been tested with TeX Live.

## Setup

1. Install LaTeX
2. Setup your work environment as you see fit. For example, you can either:
   - Use the "Use this template" button in GitHub and clone the new repo
   - Fork this repo
   - Download the files and upload them to Overleaf
3. Start writing in LaTeX
4. Use `make` to build the PDF manually

## Quick start

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

## Options

You can choose between:
- *bachelor* or *master*, depending on your degree
- *italian* or *english* as the language

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
| `\author`       | ✔️        | You (I hope), you can put multiple authors, see FAQ                                      |
| `\studentid`    | ✔️        | Your student number                                                                      |
| `\academicyear` | ✔️        | The academic year of your degree                                                         |

### Commands

| Command      | Description                | Options                                                                       |
| ------------ | -------------------------- | ----------------------------------------------------------------------------- |
| `\maketitle` | Creates the first page     | -                                                                             |
| `\emptypage` | Surprisingly, an empy page | -                                                                             |
| `\toc[opts]` | The table of contents      | Comma-separated list of zero or more among `figures`, `tables` and `listings` |

## FAQs

- *Can I have multiple authors?*

  Yes, you can. Just use multiple `\author` and `\studentid`, such as
  ```latex
  \author{Author 1}
  \studentid{First number}

  \author{Author 2}
  \studentid{Second number}
  ```

- *Live preview doesn't work*

  If you use `latexmk`, you have to configure it in order to [support live updates](https://mg.readthedocs.io/latexmk.html#configuration-files).
  Also, this is known to not work with all viewers, especially not *Adobe Reader*.

- *I don't have make*

  Files can be compiled however you prefer (even when copied in Overleaf).
  You can also use other IDEs, such as TeX Studio.

- *I use Windows*

  Don't. Just don't. Save yourself massive headaches and just use a serious
  operating system. If you can't fire up a VM or dual boot a distro, use
  Overleaf.

- *I use macOS*

  As long as you have everything installed, should work out of the box.
  You should even have `make` already installed.

- *I use Linux*

  You probably know already what to do tbh.

- *How does the table of contents work?*

  Just use `\toc`. Note that the table of contents kinda breaks the flow of opening chapters on a right page.
  So **remember to check and add a `\emptypage` if necessary**.

- *How can I show other tables of contents, like figures?*

  Use the optional argument to `\toc`. If you want to show all supported table of contents,
  do `\toc[figures,tables,listings]`. You can also mix and match how you prefer.
  The chapter/section/subsection table of contents will always be printed though.
