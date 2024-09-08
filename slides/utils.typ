#import "@preview/codly:1.0.0": *

#let multi-lang(..translations) = {
  assert(translations.pos().len() == 0, message: "only named arguments allowed")
  let translations = translations.named()
  context translations.at(text.lang)
}

#let de-en(de, en) = multi-lang(de: de, en: en)

#let _pro_con_list_options = (
  spacing: 0.9em,
)

#let pro-list() = body => {
  set list(marker: text(green.darken(20%), sym.plus), .._pro_con_list_options)
  show list.item: set block(spacing: 0em)
  body
}

#let con-list() = body => {
  set list(marker: text(red.darken(10%), sym.minus), .._pro_con_list_options)
  body
}

#let pro-con-list(pros, cons) = {
  {
    show: pro-list()
    pros
  }
  v(0.2em)
  {
    show: con-list()
    cons
  }
}

#let example(code, code-width: 1.2fr, preview-width: 1fr) = {
  grid(
    columns: (code-width, preview-width),
    column-gutter: 1em,
    {
      set align(top)
      code
    },
    {
      set align(top)
      show: block.with(inset: (y: 0.3em))

      let mode = if code.lang == "typc" { "code" } else { "markup" }
      no-codly({
        eval(code.text, mode: mode)
      })
    },
  )
}
