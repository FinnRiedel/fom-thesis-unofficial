#import "@preview/fom-thesis-unofficial:0.1.0": project

// META INFORMATIONEN FÜLLEN:
#show: project.with(
  title: "...",
  authors: "Max Mustermann",
  studiengang: "Wirtschaftsinformatik",
  akademischer_grad: "Bachelor of Science (B.Sc.)",
  dokumentart: "Seminararbeit",
  matrikelnummer: "123456",
  betreuer: "Prof. Dr. Max Mustermann",
  abgabedatum: "01.04.2026",

  
  date: "March 16, 2026",
  abbreviations: include "abkuerzungsverz.typ",
  list-of-figures: true,
  list-of-tables: true,
)

// INHALT

= Einleitung
#lorem(60)


== Problemstellung
#lorem(20)

== Zielsetzung
#lorem(40)

== Vorgehensweise
#lorem(500)

= Erste Ebene
#lorem(500)
#figure(
  image("/media/fomLogo.pdf", width: 20%),
  caption: [FOM Logo]
) <fom_logo>

Wie man in @fom_logo sehen kann, ist das ganz Toll.

== Zweite Ebene
#lorem(500)

== Zweite Ebene
#lorem(100)
#figure(
  ```rust
  fn main() {
      println!("Hello World!");
  }
  ```,
  caption: ["Hello World" in Rust]
)
#lorem(30)

=== Dritte Ebene
#lorem(500)

=== Dritte Ebene
#lorem(500)

= Erste Ebene
#lorem(500)
#lorem(10)@unternehmensbewertung
#lorem(10)@personal
#lorem(10)@wissenschaftliches_arbeiten
#lorem(10)@investment_banking[S. 13]
#lorem(10)@private_equity
#lorem(10)@lemons
#lorem(10)@vw

= Fazit