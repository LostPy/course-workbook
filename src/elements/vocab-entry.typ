// Vocabulary Entry element
#import "@preview/elembic:1.1.1" as e: field, types

#let vocab-entry = e.element.declare(
  "vocab-entry",
  prefix: "@preview/course-workbook,v1",
  doc: "A vocabulary entry with table layout for word, synonyms, translation, and examples",
  display: it => {
    let title-fg = if it.title-color == auto { rgb("#1a1a1a") } else { it.title-color }
    let accent = if it.accent-color != auto and it.accent-color != none { it.accent-color } else { none }
    let table-fill = if accent != none { accent } else { white }
    let table-stroke = if accent != none { accent } else { luma(200) }
    
    let content = [
      // Main vocabulary table
      #table(
        columns: (1fr, 2fr, 1fr),
        stroke: table-stroke + 2pt,
        fill: (_, _) => table-fill,
        align: (left, left, left),
        
        // Row 1: Word | Synonyms | Translation
        [
          #text(weight: "bold", fill: title-fg, it.word-prefix, size: 11pt)
          #v(2mm)
          #box(width: 100%, repeat[ . ])
        ],
        [
          #text(weight: "bold", fill: title-fg, it.synonyms-prefix, size: 11pt)
          #v(2mm)
          #box(width: 100%, repeat[ . ])
        ],
        [
          #text(weight: "bold", fill: title-fg, it.translation-prefix, size: 11pt)
          #v(2mm)
          #box(width: 100%, repeat[ . ])
        ],
        
        // Row 2: Example (spans all 3 columns)
        [#table.cell(colspan: 3)[
          #text(weight: "bold", fill: title-fg, it.examples-prefix, size: 11pt)
          #v(2mm)
          #box(width: 100%, repeat[ . ])
          #v(2mm)
          #box(width: 100%, repeat[ . ])
        ]]
      )
    ]
    
    block(breakable: false, content)
  },
  
  fields: (
    field("number", int, doc: "Entry number", required: true, named: false),
    field("body", content, doc: "Additional body content", default: none),
    field("title-color", types.paint, doc: "Color for title/number", default: rgb("#1a1a1a")),
    field("accent-color", types.option(types.paint), doc: "Accent color for table", default: none),
    field("word-prefix", str, doc: "The source language word prefix / title to use", default: "Word"),
    field("synonyms-prefix", str, doc: "The source language synonyms prefix / title to use", default: "Synonyms"),
    field("translation-prefix", str, doc: "The translation to student language prefix / title to use", default: "Translation"),
    field("examples-prefix", str, doc: "The source language examples prefix / title to use", default: "Examples"),
  )
)
