// Attribute und Variablen ===================================================
#let project(
  title: "",
  authors: (),
  dokumentart: "",
  studiengang: "",
  akademischer_grad: "",
  matrikelnummer: "",
  betreuer: "",
  abgabedatum: "",
  
  date: none,
  logo: "template/media/fomLogo.pdf",
  bib-file: "template/references.yaml",
  abbreviations: none,
  list-of-figures: false,
  list-of-tables: false,
  body,
) = {

// Grundlegende Formateinstellungen ==========================================
  
  // Seiteneinstellungen
  set document(author: authors, title: title)
  
  set page(
    // Blattgröße (1.2 Layout: 1.)
    paper: "a4",
    // Seitenrand (1.2 Layout: 9.)
    margin: (left: 40mm, right: 20mm, top: 40mm, bottom: 20mm),

    // Nummerierung oben rechts (1.2 Layout: 10)
    number-align: top + right,
  )
  
  // Zeilenabstand (1.2 Layout: 2a)
  set par(
    leading: 1.2em,
    spacing: 1.2em + 6pt
  )

  // Schriftart und -größe (1.2 Layout: 2a)
  set text(
    font: "Libertinus Serif", 
    size: 12pt,
    lang: "de"
  )

  // Überschriften (1.2 Layout: 2b) + (1.2 Layout: 8)
  show heading: set text(weight: "bold") 
  show heading: set block(above: 12pt + 1.2em, below: 6pt + 1.2em)


  show figure.caption: set align(left)
  show figure.caption: set text(weight: "bold")
  show figure: set block(above: 12pt + 1.2em, below: 6pt + 1.2em)

  // Fußnoten (1.2 Layout: 2c)
  show footnote.entry: set text(size: 10pt) 
  show footnote.entry: set par(leading: 0.65em)

  // Blocksatz (1.2 Layout: 3)
  set par(justify: true)

  // Autom. Silbentrennung (1.2 Layout: 5)
  set text(hyphenate: true)
  
  set heading(numbering: "1.1")




  
// Titelseite ================================================================
  
  // Titelblatt ohne Nummerierung (1.2 Layout: 10)
  set page(numbering: none)
  
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  if logo != none {
    align(center, image(logo, width: 26%))
  }

  align(center)[
    #text(16pt, weight: "bold")[FOM Hochschule für Oekonomie & Management]
  
  #v(1fr)
  #text(14pt)[#dokumentart]
  \ im Studiengang #studiengang

  #v(1fr)
  zur Erlangung des Grades eines 
  \ #akademischer_grad

  #v(1.5cm)
  über das Thema
  \ #text(16pt, weight: "bold")[#title]

  #v(1fr)
  von
  \ #authors
  ]

  v(1fr)
  align(center)[
    #grid(
      columns: (4cm, 1fr),
      align: left,
      row-gutter: 1em,
      [Prüfer], [#betreuer],
      [Matrikelnummer], [#matrikelnummer],
      [Abgabedatum], [#abgabedatum]
    )
  ]

  pagebreak()


// Table of contents =========================================================
  
  // Verzeichnisse mit römischen Zahlen (1.2 Layout: 10)
  set page(numbering: "I") 
  outline(depth: 3)
  pagebreak()

// Abkürzungsverzeichnis =====================================================
  if abbreviations != none {
    heading(level: 1, numbering: none)[Abkürzungsverzeichnis]
    v(1em)
    abbreviations
    pagebreak()
  }

// Tabellenverzeichnis =======================================================
  if list-of-tables {
    heading(level: 1, numbering: none)[Tabellenverzeichnis]
    v(1em)
    outline(title: none, target: figure.where(kind: table))
    pagebreak()
  }

// Abbildungsverzeichnis =====================================================
  if list-of-figures {
    heading(level: 1, numbering: none)[Abbildungsverzeichnis]
    v(1em)
    outline(title: none, target: figure.where(kind: image))
    pagebreak()
  }

  [#label("end-of-preface")]
  // Label, um römische Seitenzahl zu merken und später dort weiter zu zählen

// Inhalt ====================================================================

  counter(page).update(1)
  // Inhalt mit arabischen Ziffern (1.2 Layout: 10)
  set page(numbering: "1")
  body
  pagebreak()
  
// Literaturverzeichnis ======================================================
  counter(page).update(loc => {
    let end-page = counter(page).at(loc.select(<end-of-preface>)).first()
    return end-page + 1
  })
  // Letzte römische Seitenzahl wird abgefragt und als aktuelle Seitenzahl+1 gesetzt
  set page(numbering: "I")
  if bib-file != none {
    bibliography(bib-file, title: "Literaturverzeichnis", style: "fom-chigaco-citation.csl")}

// Internetquellen ======================================================
  //pagebreak()
  //bibliography("literature_web.yaml", title: "Internetquellen", style: "fom-chigaco.csl")
  
}