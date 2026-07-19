# Course Workbook

A Typst package to create digital tablet-focused course workbooks. Originally designed for reMarkable tablets, but works with any page setup.

This package use [elembic](https://pgbiel.github.io/elembic/index.html) to define different elements of a workbook.

## Features

- **Persistent Navigation Bar** - Left-side navigation on every page (configurable)
- **Internal Hyperlinks** - Efficient navigation throughout
- **reMarkable-optimized defaults** - But fully configurable
- **Clean, minimalist design** - Optimized for handwriting
- **Elembic-based elements** - Type-safe with show/set rule customization

## Installation

Currently the package is not published in Typst Universe.

 1. Create directoties to store the source of repository in this directory: `{data-dir}/typst/packages/{namespace}/{name}/{version}` (see [typst/packages readme](https://github.com/typst/packages) for more information).
 2. Download and extract the source of repository in the `{data-dir}/typst/packages/{namespace}/{name}/{version}` directory:

```bash
curl -L https://github.com/LostPy/course-workbook/archive/refs/heads/main.zip | tar -xz
```

## Quick Start

```typst
#import "@local/course-workbook:0.1.0": *

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
```

## Credits

Thanks to PgBiel for the great [elembic](https://pgbiel.github.io/elembic/index.html) package.
