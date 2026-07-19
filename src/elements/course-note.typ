// Course Note element
#import "@preview/elembic:1.1.1" as e: field, types

#let course-note = e.element.declare(
  "course-note",
  prefix: "@preview/course-workbook,v1",
  doc: "A course session note - 2 pages: exercises and what I learned",
  
  display: it => {
    let heading-fg = if it.heading-color == auto { luma(120) } else { it.heading-color }
    let title-fg = if it.title-color == auto { rgb("#1a1a1a") } else { it.title-color }
    
    // Page 1: Exercise Notes
    page[
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        text(size: 16pt, weight: "bold", fill: title-fg, it.title + " " + str(it.number)),
        if it.show-date [
          #text(size: 12pt)[Date: #box(width: 35mm, repeat[ . ])]
        ]
      )
      
      #v(4mm)
      
      #if it.show-exercises [
        #text(size: 11pt, weight: "bold", fill: heading-fg, it.exercises-title)
        #v(1mm)
        #line(length: 100%, stroke: 0.5pt + luma(220))
        #v(1fr)
      ]
    ]
    
    // Page 2: What I Learned
    page[
      #grid(columns: (50%, 50%),
        align(left)[
          #text(size: 11pt, weight: "bold", fill: heading-fg, it.learned-title)
          #line(length: 100%, stroke: 0.5pt + luma(220))
        ],
        align(right)[
          #text(size: 9pt, fill: luma(150))[#it.title #it.number (Continued)]
        ]
      )
      
      #v(4mm)
      
      #if it.show-learned [
        #v(1fr)
      ]
    ]
  },
  
  fields: (
    field("number", int, doc: "Session number", required: true, named: false),
    field("title", str, doc: "The title to display", default: "Session"),
    field("body", content, doc: "Additional body content", default: none),
    field("heading-color", types.paint, doc: "Color for section headings", default: luma(120)),
    field("title-color", types.paint, doc: "Color for title/number", default: rgb("#1a1a1a")),
    field("accent-color", types.option(types.paint), doc: "Accent color for this page", default: none),
    field("show-date", bool, doc: "Show date field", default: true),
    field("show-exercises", bool, doc: "Show Exercise Notes section", default: true),
    field("exercises-title", str, doc: "The exercises section title to display", default: "EXERCISE NOTES"),
    field("show-learned", bool, doc: "Show What I Learned section", default: true),
    field("learned-title", str, doc: "The learned section title to display", default: "WHAT I LEARNED"),
  )
)
