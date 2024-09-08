#let multi-lang(..translations) = {
  assert(translations.pos().len() == 0, message: "only named arguments allowed")
  let translations = translations.named()
  context translations.at(text.lang)
}

#let de-en(de, en) = multi-lang(de: de, en: en)
