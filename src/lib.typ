// Course Workbook - A Typst package for digital tablet workbooks

// Elembic import for elements
#import "@preview/elembic:1.1.1" as elembic: field, types

// Re-export elembic for users who want @ references
#let e = elembic

// Import base element
#import "elements/base.typ": workbook-page

// Import individual elements
#import "elements/theory-topic.typ": theory-topic
#import "elements/course-note.typ": course-note
#import "elements/vocab-entry.typ": vocab-entry
#import "elements/nav-bar.typ": nav-bar

// Import collection helpers
#import "collections/theory.typ": theory-topics
#import "collections/sessions.typ": course-sessions
#import "collections/vocab.typ": vocabulary-list

// Import and re-export components
#import "components/index-list.typ": index-list, index-page

// Config
#let default-config = (
  nav-bar-width: 12mm,
  nav-bar-bg: rgb("#f5f5f5"),
  nav-bar-fg: rgb("#888888"),
  nav-bar-button-height: 25mm,
  nav-bar-v-space: 10mm,

  font-family: ("Open Sans", "Helvetica Neue", "Arial", "sans-serif"),
  font-size: 11pt,
  content-fg: rgb("#1a1a1a"),
  heading-fg: luma(120),
  subtle-fg: luma(150),
  light-border: 0.5pt + luma(220),
  medium-border: 1pt + luma(200),

  default-heading-color: luma(120),
  default-title-color: rgb("#1a1a1a"),
  default-accent-color: none,
)

#let config = default-config

// Cover page component
#let cover-page(
  title,
  color: rgb("#2B3A42"),
  title-size: 28pt,
  title-color: white,
) = {
  page(
    background: {
      place(
        left + top,
        rect(
          width: 100%,
          height: 100%,
          fill: color
        )
      )
    }
  )[
    #align(center + horizon)[
      #text(
        size: title-size,
        weight: "bold",
        fill: title-color,
        title
      )
    ]
  ]
}

// Navigation helpers

// Get the index page label for a section
// Usage: nav-index("theory") => "theory-index"
#let nav-index(section) = section + "-index"

// Build buttons array for nav-bar from section configs
// Each section should be a dictionary: (id: "theory", label: "THEORY")
// Usage: #set page(background: nav-bar(buttons: nav-buttons((id: "theory", label: "THEORY"), (id: "vocab", label: "VOCAB"))))
#let nav-buttons(..sections) = {
  sections.pos().map(s => (
    s.id,
    s.label,
    label(nav-index(s.id))
  ))
}
