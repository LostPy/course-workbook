// Vocabulary collection helper
// Generates vocab-entry elements with nav bar - multiple per page

#import "../elements/vocab-entry.typ": vocab-entry
#import "../elements/nav-bar.typ": nav-bar
#import "../components/index-list.typ": index-page

#let vocabulary-list(
  count: 50,
  index: true,
  title: "Vocabularies",
  section: "vocab",
  title-color: rgb("#1a1a1a"),
  accent-color: none,
  word-prefix: "Word",
  synonyms-prefix: "Synonyms",
  translation-prefix: "Translation",
  examples-prefix: "Examples",
  index-label: "vocab-index",
) = {
  // Generate index page if requested
  if index {
    let items = range(1, count + 1).map(_ => "")
    let cols = if count <= 20 { 2 } else { 3 }
    index-page(
      title: title,
      items: items,
      cols: cols,
      use-links: true,
      get-target: (i) => section + "-" + str(i),
      index-label: index-label
    )
    pagebreak(weak: true)
  }

  for i in range(1, count + 1) {
    let vocab-label = section + "-" + str(i)
    vocab-entry(
      i,
      title-color: title-color,
      accent-color: accent-color,
      label: label(vocab-label),
      word-prefix: word-prefix,
      synonyms-prefix: synonyms-prefix,
      translation-prefix: translation-prefix,
      examples-prefix: examples-prefix,
    )
  }
}
