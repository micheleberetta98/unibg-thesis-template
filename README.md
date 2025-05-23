# UniBG Typst Thesis Template

A simple (unofficial) Typst template following the official
[UniBG formatting rules](https://www.unibg.it/studiare/frequentare/laurearsi/frontespizi).

*Also, checkout the LaTeX branch!*

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

- *Typst* [required] unsurprisingly

## Setup

1. Install Typst
2. Setup your work environment as you see fit. For example, you can either:
   - Use the "Use this template" button in GitHub and clone the new repo
   - Fork this repo
   - Just download the files
3. Start writing in Typst
4. Use `typst compile` to build the PDF manually, or `typst watch` to have a live
   preview

## Quick start

This is all you need, it should be self explanatory.

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
