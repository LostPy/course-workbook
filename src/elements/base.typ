// Base element for all workbook elements using elembic
#import "@preview/elembic:1.1.1" as e: field, types

#let workbook-page = e.element.declare(
  "workbook-page",
  prefix: "@preview/course-workbook,v1",
  doc: "Base element for workbook pages with common styling options",
  
  display: it => {
    let nav-bar-width = 12mm
    let nav-bar-bg = rgb("#f5f5f5")
    let nav-bar-active-bg = rgb("#e0e0e0")
    let nav-bar-fg-active = black
    let nav-bar-fg-inactive = rgb("#888888")
    
    let nav-buttons = (
      ("index", "INDEX", "theory-1"),
      ("theory", "THEORY", "theory-1"),
      ("course", "SESSIONS", "session-1"),
      ("vocab", "VOCAB", "vocab-1"),
      ("phrasal", "PHRASALS", "phrasal-1"),
      ("irregular", "VERBS", "irregular-1"),
    )
    
    // Build nav bar content with buttons
    let nav-content = if it.show-nav {
      let current-section = it.section
      
      stack(
        dir: ttb,
        v(10mm),
        ..nav-buttons.map(((id, label, target)) => {
          let is-active = current-section == id
          let button-bg = if is-active { nav-bar-active-bg } else { none }
          let button-fg = if is-active { nav-bar-fg-active } else { nav-bar-fg-inactive }
          
          link(target)[
            #block(
              width: 100%,
              height: 25mm,
              fill: button-bg,
              align(center + horizon)[
                #rotate(-90deg)[
                  #text(
                    fill: button-fg,
                    weight: "bold",
                    size: 8pt,
                    tracking: 0.5pt,
                    label
                  )
                ]
              ]
            )
          ]
        })
      )
    }
    
    page(background: {
      if it.show-nav {
        place(
          top + left,
          rect(
            width: nav-bar-width,
            height: 100%,
            fill: nav-bar-bg,
            stroke: none,
            nav-content
          )
        )
      }
    })[
      // Page content
      #it.body
    ]
  },
  
  fields: (
    field("body", content, doc: "Page content", required: true, named: false),
    field("show-nav", bool, doc: "Show navigation bar", default: true),
    field("section", str, doc: "Section identifier for nav bar", default: "index"),
    field("heading-color", types.paint, doc: "Color for section headings", default: luma(120)),
    field("title-color", types.paint, doc: "Color for title/number", default: rgb("#1a1a1a")),
    field("accent-color", types.option(types.paint), doc: "Accent color for this page", default: none),
  )
)