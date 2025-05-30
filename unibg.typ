#let tiny         = 6pt
#let scriptsize   = 8pt
#let footnotesize = 10pt
#let small        = 10.95pt
#let normalsize   = 12pt
#let large        = 14.4pt
#let Large        = 17.28pt
#let LARGE        = 20.74pt
#let huge         = 24.88pt
#let Huge         = 24.88pt

#let translations = (
  abstract:       (it: "Sommario",                      en: "Abstract"),
  figures:        (it: "Figure",                        en: "Figures"),
  tables:         (it: "Tabelle",                       en: "Tables"),
  listings:       (it: "Codici",                        en: "Listings"),
  department-of:  (it: "Dipartimento di",               en: "Department of"),
  bachelor-in:    (it: "Corso di Laurea in",            en: "Bachelor Degree in"),
  master-in:      (it: "Corso di Laurea Magistrale in", en: "Master Degree in"),
  class:          (it: "Classe",                        en: "Class"),
  advisor:        (it: "Relatore",                      en: "Advisor"),
  coadvisor:      (it: "Correlatore",                   en: "Co-advisor"),
  thesis:         (it: "Tesi di Laurea",                en: "Thesis"),
  master-thesis:  (it: "Tesi di Laurea Magistrale",     en: "Master thesis"),
  student-number: (it: "Matricola n.",                  en: "Student number"),
  academic-year:  (it: "Anno Accademico",               en: "Academic Year"),
  candidate:      (it: "Candidato",                     en: "Candidate"),
)

#let tr(s) = context {
  translations.at(s).at(text.lang)
}

#let master-front-page(
  title,
  subtitle,
  degree,
  advisor,
  coadvisor,
  author,
) = page[
      #align(center)[
        #text(size: large)[UNIVERSITÀ DEGLI STUDI DI BERGAMO]
        #v(0.5cm)
        #tr("department-of") #degree.department

        #tr("master-in") #degree.name

        #tr("class") #degree.class

        #v(1fr)

        #text(Huge)[*#title*]

        #text(LARGE, subtitle)
      ]

      #v(1fr)

      #tr("advisor")

      #advisor

      #if coadvisor != none [
        #v(0.5cm)
        #tr("coadvisor")

        #coadvisor
      ]

      #align(right, block(align(left)[
        #tr("master-thesis")

        #author.name

        #tr("student-number") #author.number
      ]))

      #v(1fr)

      #align(center)[
        #upper(tr("academic-year")) #degree.year
      ]
    ]

#let bachelor-front-page(
  title,
  subtitle,
  degree,
  advisor,
  coadvisor,
  author,
) = page[
  #set par(first-line-indent: 0pt)
  #image("images/unibg-logo-wide.png", width: 8.79cm)
  #v(0.5cm)
  #block(inset: (left: 4cm))[
    #tr("department-of")

    #degree.department

    #v(0.5cm)

    #tr("bachelor-in")

    #degree.name

    #v(0.1cm)

    #tr("class") #degree.class

    #v(1fr)

    #text(Huge)[*#title*] \
    #text(LARGE, subtitle)

    #v(1fr)

    #columns[
      #tr("candidate"):

      #author.name

      #tr("student-number") #author.number

      #colbreak()

      #tr("advisor")

      #emph(advisor)

      #if coadvisor != none [
        #v(0.5cm)

        #tr("coadvisor")

        #emph(coadvisor)
      ]
    ]

    #v(1fr)

    #tr("academic-year")

    #degree.year
  ]
]

#let unibg(
  title: none,
  subtitle: none,
  abstract: [],
  degree: (
    name: none,
    department: none,
    type: none,
    class: none,
    year: none,
  ),
  advisor: none,
  coadvisor: none,
  author: (
    name: none,
    number: none,
  ),
  show-outline: (
    figures: false,
    tables: false,
  ),
  doc
) = {
  set text(font: ("New Computer Modern", "Libertinus Serif"), size: normalsize)
  set par(justify: true, leading: 1.5em, first-line-indent: 1.5em)
  set page(
    "a4",
    margin: 3cm,
    footer: context {
      let c = counter(page)
      if page.numbering != none {
        if calc.even(c.get().at(0)) {
          align(left, c.display(page.numbering))
        } else {
          align(right, c.display(page.numbering))
        }
      }
    },
  )

  set bibliography(style: "ieee")

  set heading(numbering: "1.1")
  show heading.where(level: 1): set text(size: huge)
  show heading.where(level: 1): set par(leading: 1.5em, first-line-indent: 0em)
  show heading.where(level: 1): it => {
    v(3cm)
    if it.numbering == none [
      #it.body
    ] else [
      Chapter #counter(heading).display(it.numbering) \
      #it.body
    ]
    v(1cm)
  }

  show heading.where(level: 2): set text(size: Large)
  show heading.where(level: 2): set block(above: 2em, below: 1.5em)
  show heading.where(level: 2): it => block[#counter(heading).display(it.numbering)#h(0.65cm)#it.body]

  set outline(indent: auto)
  set outline.entry(fill: repeat[~.])
  show outline.entry.where(level: 1): it => [#show repeat: none; #it]
  show outline.entry.where(level: 1): strong

  // ------ Actual document starts here

  let deg = degree.at("type", default: "master")
  if deg == "master" {
    master-front-page(title, subtitle, degree, advisor, coadvisor, author)
  } else if deg == "bachelor" {
    bachelor-front-page(title, subtitle, degree, advisor, coadvisor, author)
  }

  align(horizon)[
    #pagebreak(to: "odd", weak: true)
    #align(center, block[*#tr("abstract")*])
    #v(1.5em)

    #abstract
  ]

  // Do this manually to avoid numbering an empty page
  pagebreak(to: "odd", weak: true)
  set page(numbering: "I")
  outline()


  if show-outline.at("figures", default: false) {
    pagebreak(to: "odd")
    outline(title: tr("figures"), target: figure.where(kind: image))
  }

  if show-outline.at("tables", default: false) {
    pagebreak(to: "odd")
    outline(title: tr("tables"), target: figure.where(kind: table))
  }

  set page(numbering: none)

  show heading.where(level: 1): it => [
    // #context { counter(heading).get() }
    #context {
      if counter(heading).get() == (1,) {
        set page(numbering: none)
        pagebreak(to: "odd", weak: true)
        set page(numbering: "1")
      } else {
        pagebreak(to: "odd", weak: true)
      }
    }
    #it
  ]

  counter(page).update(0)
  set page(numbering: "1")
  doc
}
