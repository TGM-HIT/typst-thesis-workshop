#import "@preview/touying:0.5.2": *
#import "theme.typ": *

#import "@preview/tiaoma:0.2.0"

#import "utils.typ": *
#import "assets/mod.typ" as assets

#set document(date: none)


#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [
      Diplomarbeit schreiben mit Typst
      #h(1fr)
      #place(right, dy: 1.5cm, {
        let url = "https://github.com/TGM-HIT/typst-thesis-workshop/blob/main/slides/typst-workshop-handout.pdf"
        link(url, {
          tiaoma.qrcode(url, options: (
            scale: 1.8,
          ))
          v(-0.8cm)
          set text(0.4em)
          set align(left)
          block(width: 4.4cm)[#url]
        })
      })
    ],
    // subtitle: [],
    author: [Clemens Koza],
    date: [2024],
    institution: [TGM, HIT],
    // logo: emoji.city,
  ),
)

#title-slide()

== Anforderungen an die Diplomarbeit

=== Inhalt

- aussagekräftig
- nachvollziehbar: *Quellenangaben*, *Verweise*

=== Form

- übersichtlich: *Gliederung*, *Inhaltsverzeichnis*
- ansprechend: *Qualität der Darstellung*
- einheitlich: *Farben*, *Schriften*, *Abstände*, ... zentral festgelegt

=== Aufwand -- ihr wollt (vermutlich) ...

- ... Formatierungen nicht häufig anpassen/korrigieren müssen
- ... dass Bilder verschieben das Dokument nicht zerstört
- ... ein leicht zu verwendendes Werzeug mit Features zur Kollaboration

== Die Optionen

#grid(
  columns: 3 * (1fr,),
  column-gutter: 0.6em,
  [
    #set align(top)
    === Microsoft Word

    #pro-con-list[
      - WYSIWYG

      - einfache Bedienung

      - Kollaboration (Office~365)
    ][
      - Bilder verschieben

      - keine "Erweiterbarkeit"

      - kein automatisches Syntax-Highlighting

      - wegen WYSIWYG: "unsichtbare" Formatierungen
    ]
  ],
  [
    #set align(top)
    === LaTeX

    #pro-con-list[
      - hohe Output-Qualität

      - Programmiersprache: Features anpassbar

      - Kollaboration (Overleaf, git-Versionierung)
    ][
      - langsam

      - schwer zu erlernende Sprache (Makro-basiert)

      - schwer verständliche Fehlermeldungen
    ]
  ],
  [
    #set align(top)
    === Typst

    #pro-con-list[
      - gute Output-Qualität

      - Programmiersprache mit vertrauterem Aufbau

      - schnell

      - Kollaboration (Typst~App, git-Versionierung)
    ][
      - weniger Lernunterlagen

      // - kleinere Community

      - manche App-Features nur mit Typst Pro

      - keine deutsche Rechtschreibprüfung
    ]
  ],
)

== Typst-Beispiel -- fast wie Markdown

#example(
  ````typ
  = Überschrift
  Ein Code-Beispiel:
  ```java
  private int i; // Syntax Highlighting
  ```

  == Auflistungen
  - Liste
    - mit Bullets

  + Liste
    + geschachtelt
  + mit Numerierung
  ````
)

== Typst-Beispiel -- programmierbar

#example(
  ```typ
  #for i in array.range(1, 5) [
    - Nummer #i
      #if calc.odd(i) [(wichtig!)]
  ]

  Blindtext: #lorem(8)

  #table(
    columns: 3,
    [Col 1], [Col 2], [Col 3],
    ..array.range(9).map(i => {
      let num = i + 1
      [\##num]
    })
  )
  ```
)

== Typst-Beispiel -- Formatierung

#show table.cell.where(y: 0): set table.cell(stroke: (bottom: 1pt))

#example(
  ```typ
  = zu unscheinbar ...

  #show heading: set text(1.4em, red)

  === ... besser

  #set table(stroke: (x, y) => (
    bottom: if y == 0 { 1pt },
  ))

  #table(
    columns: 4,
    align: right,
    ..array.range(12).map(i => [#i])
  )
  ```
)

== Typst-Beispiel -- Mathematik

#example(
  ```typ
  #set math.equation(numbering: "(1)")

  Nehmen wir den Satz
  des Pythagoras:

  $ a^2 + b^2 = c^2 $ <pythagoras>

  In @pythagoras sind $a$ und $b$ die
  Katheten und $c$ ist die Hypothenuse.
  ```
)

== Typst-Beispiel -- LaTeX-Vergleich

#quote(
  block: true,
  attribution: [https://tex.stackexchange.com/questions/712967/command-for-multiplying-integers]
)[
  How do I create a command, say ```latex \multiply{<first_number>}{<last_number>}```, using LaTeX3, that multiplies all the integers from `<first_number>` to `<last_number>`?
]

=== LaTeX

#[
  #set text(0.8em)
  ```latex
  \def\xmultiply#1#2{%
    \ifnum#1=\numexpr#2\relax\the\numexpr#1\relax\else
    \the\numexpr(#2)*\xmultiply{#1}{#2-1}\relax\fi}

  \xmultiply{4}{9}
  ```

  (die akzeptierte Antwort, die LaTeX3 konform war, hatte 10 statt 3 Zeilen für die Funktion)
]

#pause

=== Typst

#[
  #set text(0.8em)
  ```typ
  #let xmultiply(a, b) = array.range(a, b+1).product()

  #xmultiply(4, 9)
  ```
]

== Tooling

=== Typst App

- https://typst.app
  - ähnliche Bedienung wie z.B. Overleaf (aber schneller)

=== Lokale Installation

- Compiler: https://github.com/typst/typst
  - `typst init` -- Projekt initialisieren
  - `typst compile` -- pdf/svg/png exportieren
  - `typst watch` -- bei Änderungen automatisch kompilieren
- Editor-Plugin: Tinymist -- https://myriad-dreamin.github.io/tinymist/
  - für VS Code, NeoVim, ...
  - Syntax Highlighting, Live Preview, Export, ...

== TGM-HIT Vorlage

#grid(
  columns: (1fr, auto),
  column-gutter: 1em,
  [
    #v(2em)

    - der existierenden LaTeX-Vorlage nachempfunden
    - kann mit wenigen Klicks/Befehlen verwendet werden
    - enthält als "Vorwort" Anleitungen zu Literatur, Verweisen, Abbildungen, ...

    === Links
    - https://typst.app/universe/package/tgm-hit-thesis
    - https://github.com/TGM-HIT/typst-diploma-thesis

    #v(3em)

    *jetzt: Demo!*
  ],
  assets.thesis-thumbnail(height: 95%)
)

== Zusammenfassung

- Formatierung
- Quellen hinzufügen, verwenden
- Abbildungen/Gleichungen/Codebeispiele einfügen, verwenden
- Daten einlesen
- Wichtige/nützliche Pakete: \
  #link("https://typst.app/universe/package/cetz")[CeTZ],
  #link("https://typst.app/universe/package/fletcher")[Fletcher],
  #link("https://typst.app/universe/package/timeliney")[Timeliney],
  #link("https://typst.app/universe/package/subpar")[Subpar],
  #link("https://typst.app/universe/package/physica")[Physica],
  #link("https://typst.app/universe/package/mitex")[MiTeX],
  #link("https://typst.app/universe/package/touying")[(Touying)]
- weitere Unterlagen:
  - Dokumentation: https://typst.app/docs/
  - Bibliotheken: https://typst.app/universe/
  - Discord: https://discord.gg/2uDybryKPe
