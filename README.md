# UniBG Typst Thesis Template

A simple (unofficial) Typst template following the official
[UniBG formatting rules](https://www.unibg.it/studiare/frequentare/laurearsi/frontespizi).

## :warning: Important note

This template is completely free of use.
However, as highlighted in the MIT license, you have to give credit in your thesis
acknowledgements:
- To the *UniBG Seclab* if you're doing your thesis with them
- Or to me, *Michele Beretta*, in every other case

Remember to also include a link to this repository for reference.
An example sentence you can use is the following:

> I would like to thank *[INSERT NAME]* for providing the Typst template [1] used
> during the writing of this thesis.
>
> [1] *Link to this repo*

You can use the "Cite this repository" button on the right.

## Requirements

If you want to use this offline you need:

- *Typst* (required)

## Step-by-step setup

1. Make sure the requirements are installed
2. Setup your repository with the Typst code
   - Either use the "Use this template" button in GitHub
   - Or fork (or make your own copy) of the repo
3. Start writing in Typst, the structure is already setup for you
4. Use `typst compile` and `typst watch`

## Usage and options

This is all that you need.

```typst
#import "unibg.typ": *

#set text(lang: "en")

#show: unibg.with(
  title: "A Seclab Thesis",
  subtitle: "A Seclab Subtitle",
  author: (
    name: "John Doe",
    number: 177013,
  ),
  degree: (
    name: "Ingegneria Informatica",
    department: "Ingegneria Gestionale, dell'Informazione e della Produzione",
    class: "LM-32",
    master: true,
    year: "2021/2022",
  ),
  advisor: "Chiar.mo Prof. John Smith",
  // coadvisor: "Chiar.mo Prof. Ed Smith",
  abstract: lorem(150),
  show-outline: (
    figures: true,
    tables: true,
  )
)

= First chapter

#bibliography("bibliography.bib", full: true)
```
