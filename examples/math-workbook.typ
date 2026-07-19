// Course Workbook - Math Example
// This demonstrates how to build a complete math learning workbook

#import "@local/course-workbook:0.1.0": *

// User's page setup (the package doesn't force this)
#set page(
  width: 156mm, 
  height: 208mm,
  margin: (left: 20mm, right: 8mm, top: 10mm, bottom: 8mm)
)

// Define navigation sections
#let nav-sections = (
  (id: "theorems", label: "THEOREMS"),
  (id: "problems", label: "PROBLEMS"),
)
#let nav-buttons = nav-buttons(..nav-sections)
#nav-buttons.insert(0, ("home", emoji.house, label("cover-page")))

// Apply nav bar with custom sections
#set page(background: nav-bar(buttons: nav-buttons))

// Build the workbook

// 1. Cover page
#cover-page(
  [Calculus\ I Workbook],
  color: rgb("#2a4a6a")
) <cover-page>
#pagebreak()

// 2. Theory Topics Section (theorems & proofs)
#theory-topics(
  count: 5,
  index: true,
  title: "Theorems",
  entry-title: "Theorem",
  section: "theorem",
  theory-title: "THEOREMS",
  examples-title: "EXAMPLES",
  notes-title: "PROOF NOTES",
  show-notes: true,
  index-label: "theorems-index",
)
#pagebreak()

// 3. Course Sessions Section (problem sets)
#course-sessions(
  count: 4,
  index: true,
  title: "Problems",
  entry-title: "Problem",
  section: "problem",
  exercises-title: "PROBLEM SET",
  learned-title: "SOLUTIONS",
  index-label: "problems-index"
)
