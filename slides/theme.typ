#import "@preview/touying:0.5.2": *
#import themes.metropolis: *

#import "@preview/codly:1.0.0": *

#let config = (
  lang: sys.inputs.at("lang", default: "de"),
  handout: {
    let bools = ("true": true, "false": false)

    let handout = sys.inputs.at("handout", default: "false")
    assert(handout in bools, message: "--input handout=... must be set to true or false if present")
    bools.at(handout)
  },
)

#let metropolis-theme = metropolis-theme.with(
  aspect-ratio: "16-9",
  // footer: self => [
  //   #self.info.author, #self.info.date
  // ],
  // footer-right: self => {
  //   {
  //     set text(size: 0.8em)
  //     [made with #link("https://typst.app/")[Typst]
  //     and #link("https://touying-typ.github.io/")[Touying]]
  //     h(1em)
  //   }
  //   [#context utils.slide-counter.display() / #utils.last-slide-number]
  // },
  footer-right: self => {
    {
      set text(size: 0.8em)
      [#self.info.author, #self.info.date]
      h(1em)
    }
    [#context utils.slide-counter.display() / #utils.last-slide-number]
  },
  config-common(
    handout: config.handout,
  ),
  // config-colors(
  //   primary: rgb("#cc8833"),
  //   primary-light: rgb("#d6c6b7"),
  //   secondary: rgb("#bbbbbb"),
  //   neutral-lightest: rgb("#191919"),
  //   neutral-dark: rgb("#bbbbbb"),
  //   neutral-darkest: rgb("#dddddd"),
  // ),
  config-methods(
    init: (self: none, body) => {
      set text(self.colors.neutral-dark, font: "Liberation Sans", lang: config.lang)
      // set raw(theme: "assets/Visual Studio.tmTheme")
      show: codly-init.with()

      body
    },
  ),
)

#let title-slide = title-slide.with(
  extra: {
    set text(size: 0.8em)
    [made with #link("https://typst.app/")[Typst]
    and #link("https://touying-typ.github.io/")[Touying]]
    h(1em)
  },
)