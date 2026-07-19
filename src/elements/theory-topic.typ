// Theory Topic element
#import "@preview/elembic:1.1.1" as e: field, types

#let theory-topic = e.element.declare(
  "theory-topic",
  prefix: "@preview/course-workbook,v1",
  doc: "A theory/topic page for noting theory, rules, examples, and notes",
  
  display: it => {
    let heading-fg = if it.heading-color == auto { luma(120) } else { it.heading-color }
    let title-fg = if it.title-color == auto { rgb("#1a1a1a") } else { it.title-color }
    
    page[
      #grid(columns: (70%, 22%, 8%),
        align(left)[
          #text(size: 16pt, weight: "bold", fill: title-fg)[#it.title: ]
          #box(width: 1fr, line(length: 100%, stroke: 1pt + luma(150)))
        ],
        [],
        align(right)[
          #text(size: 9pt, fill: luma(150))[#it.title #it.number]
        ]
      )
      
      #v(2mm)
      
      #if it.show-theory [
        #text(size: 11pt, weight: "bold", fill: heading-fg, it.theory-title)
        #line(length: 100%, stroke: 0.5pt + luma(220))
        #v(1fr)
      ]
      
      #if it.show-examples [
        #text(size: 11pt, weight: "bold", fill: heading-fg, it.examples-title)
        #line(length: 100%, stroke: 0.5pt + luma(220))
        #v(1fr)
      ]
    ]

    if it.show-notes {
      page[
        #grid(columns: (60%, 10%, 30%),
          align(left)[
            #text(size: 11pt, weight: "bold", fill: heading-fg)[#it.notes-title]
            #line(length: 100%, stroke: 0.5pt + luma(220))
          ],
          [],
          align(right)[
            #text(size: 9pt, fill: luma(150))[#it.title #it.number (Continued)]
          ]
        )
        #v(2mm)
      ]
    }
  },
  
  reference: (
    supplement: [Topic],
    numbering: "1",
  ),
  
  fields: (
    field("number", int, doc: "Topic number", required: true, named: false),
    field("title", content, doc: "Additional body content", default: "Topic"),
    field("body", content, doc: "Additional body content", default: none),
    field("heading-color", types.paint, doc: "Color for section headings", default: luma(120)),
    field("title-color", types.paint, doc: "Color for title/number", default: rgb("#1a1a1a")),
    field("accent-color", types.option(types.paint), doc: "Accent color for this page", default: none),
    field("show-theory", bool, doc: "Show Theory/Rules section", default: true),
    field("theory-title", str, doc: "The Theory section title to display", default: "THEORY"),
    field("show-examples", bool, doc: "Show Examples section", default: true),
    field("examples-title", str, doc: "The Examples section title to display", default: "EXAMPLES"),
    field("show-notes", bool, doc: "Show Additional Notes section", default: false),
    field("notes-title", str, doc: "The Notes section title to display", default: "ADDITIONAL NOTES"),
  )
)
