# Course Workbook

A Typst package to create digital tablet-focused course workbooks. Originally designed for reMarkable tablets, but works with any page setup.

## Features

- **Persistent Navigation Bar** - Left-side navigation on every page (configurable)
- **5 Main Sections** with configurable counts:
  - Theory Topics
  - Course Session Notes (2 pages per session)
  - Vocabulary (table layout with customizable accent color)
  - Phrasal Verbs (table layout)
  - Irregular Verbs (table layout)
- **Internal Hyperlinks** - Efficient navigation throughout
- **reMarkable-optimized defaults** - But fully configurable
- **Clean, minimalist design** - Optimized for handwriting
- **Elembic-based elements** - Type-safe with show/set rule customization

## Installation

```bash
typst pkg add course-workbook
```

Or use local development:
```typst
#import "../src/lib.typ": *
```

## Quick Start

```typst
#import "@preview/course-workbook:0.1.0": *

#set page(
  width: 156mm, 
  height: 208mm,
  margin: (left: 25mm, right: 10mm, top: 15mm, bottom: 15mm)
)

#cover-page([My English Workbook], color: rgb("#1a5f7a"))
#pagebreak()

#theory-topics(10, index: true)
#course-sessions(15, index: true)
#vocabulary-list(50)
#phrasal-verbs-list(30)
#irregular-verbs-list(30)
```

## Components

### Cover Page
```typst
#cover-page(title, color: rgb("#2B3A42"), title-size: 28pt, title-color: white)
```

### Individual Elements

Each element is customizable via parameters:

```typst
// Theory Topic (1 page)
#theory-topic(number, show-nav: true, section: "theory", 
               heading-color: luma(120), title-color: rgb("#1a1a1a"),
               show-rules: true, show-examples: true)

// Course Note (2 pages: exercises + what I learned)
#course-note(number, show-nav: true, section: "course",
             show-date: true, show-exercises: true, show-learned: true)

// Vocabulary Entry (table layout)
#vocab-entry(number, show-nav: true, section: "vocab",
             accent-color: none, show-synonym: true, 
             show-translation: true, show-example: true)

// Phrasal Verb Entry (table layout)
#phrasal-entry(number, show-nav: true, section: "phrasal",
               accent-color: none, show-meaning: true,
               show-translation: true, show-example: true)

// Irregular Verb Entry (table layout)
#irregular-entry(number, show-nav: true, section: "irregular",
                 accent-color: none, show-translation: true, show-notes: true)
```

### Collection Functions

Helper functions that generate multiple elements with optional index:

```typst
#theory-topics(count: 10, index: true, show-nav: true, section: "theory",
               heading-color: luma(120), title-color: rgb("#1a1a1a"), accent-color: none)

#course-sessions(count: 10, index: true, show-nav: true, section: "course", ...)

#vocabulary-list(count: 50, index: true, show-nav: true, section: "vocab", 
                 accent-color: none, ...)

#phrasal-verbs-list(count: 30, index: true, ...)

#irregular-verbs-list(count: 30, index: true, ...)
```

### Index Pages

```typst
#index-page(title: "Index", items: ("a", "b", "c"), cols: 2, use-links: false)
#index-list(items: ("1", "2"), cols: 2)
```

### Configuration

```typst
#let config = default-config
// Access: config.nav-bar-width, config.nav-bar-bg, etc.
```

## Show Rules Customization

You can customize elements globally using elembic show rules:

```typst
#show: set(theory-topic, heading-color: blue)
#show: set(vocab-entry, accent-color: rgb("#e8f4f8"))
#show: set(workbook-page, show-nav: false)
```

## Parameters Reference

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `show-nav` | bool | true | Show navigation bar |
| `section` | str | varies | Section identifier for nav highlighting |
| `heading-color` | paint | luma(120) | Color for section headings |
| `title-color` | paint | rgb("#1a1a1a") | Color for titles |
| `accent-color` | paint | none | Accent color for tables |

## Project Structure

```
course-workbook/
├── src/
│   ├── lib.typ              # Main entry point
│   ├── config.typ           # Default configuration
│   ├── elements/            # Elembic elements
│   │   ├── base.typ
│   │   ├── theory-topic.typ
│   │   ├── course-note.typ
│   │   ├── vocab-entry.typ
│   │   ├── phrasal-entry.typ
│   │   └── irregular-entry.typ
│   ├── components/          # Helper functions
│   │   ├── cover.typ
│   │   ├── nav-bar.typ
│   │   └── index-list.typ
│   └── collections/         # Collection helpers
│       ├── theory.typ
│       ├── sessions.typ
│       ├── vocab.typ
│       ├── phrasal.typ
│       └── irregular.typ
├── examples/
│   └── main.typ             # Complete example
└── typst.toml               # Package manifest
```

## Dependencies

- [elembic](https://typst.app/universe/package/elembic) - Required for custom elements

## License

MIT