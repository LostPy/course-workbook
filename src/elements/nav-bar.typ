// Navigation bar element
#import "@preview/elembic:1.1.1" as e: field, types
#import "../config.typ": default-config

#let nav-bar = e.element.declare(
  "nav-bar",
  prefix: "@preview/course-workbook,v1",
  doc: "Navigation bar displayed in left margin with links to section index pages. Use nav-buttons() helper to build buttons array.",
  
  display: it => {
    let cfg = default-config
    
    let buttons = if type(it.buttons) == array {
      it.buttons
    } else {
      ()
    }
    
    place(
      top + left,
      rect(
        width: cfg.nav-bar-width,
        height: 100%,
        fill: cfg.nav-bar-bg,
        stroke: none,
        stack(
          dir: ttb,
          v(cfg.nav-bar-v-space),
          ..buttons.map(((id, btn-label, target)) => {
            let button-fg = cfg.nav-bar-fg

            link(target)[
              #block(
                width: 100%,
                height: cfg.nav-bar-button-height,
                align(center + horizon)[
                  #rotate(-90deg)[
                    #text(
                      fill: button-fg,
                      weight: "bold",
                      size: 9pt,
                      tracking: 1pt,
                      btn-label
                    )
                  ]
                ]
              )
            ]
          })
        )
      )
    )
  },
  
  fields: (
    field("buttons", types.any, doc: "Array of buttons: ((id, label, target), ...). Use nav-buttons() helper to build.", default: none),
  )
)