// Theory Topics collection helper
// Generates theory-topic elements with optional index and nav bar

#import "../elements/theory-topic.typ": theory-topic
#import "../elements/nav-bar.typ": nav-bar
#import "../components/index-list.typ": index-page

#let theory-topics(
  count: 10,
  index: true,
  title: "Theory topics",
  entry-title: "Topic",
  section: "theory",
  heading-color: luma(120),
  title-color: rgb("#1a1a1a"),
  accent-color: none,
  show-notes: false,
  theory-title: "THEORY",
  examples-title: "EXAMPLES",
  notes-title: "ADDITIONAL NOTES",
  index-label: "theory-index",
) = {
  // Generate index page if requested
  if index {
    let items = range(1, count + 1).map(_ => "")
    index-page(
      title: title,
      items: items,
      cols: 2,
      use-links: true,
      target-prefix: section + "-",
      index-label: index-label,
    )
    pagebreak(weak: true)
  }
  
  // Generate theory topic pages with dynamic labels
  for i in range(1, count + 1) {
    let label-name = section + "-" + str(i)
    theory-topic(
      i,
      title: entry-title,
      label: label(label-name),
      heading-color: heading-color,
      title-color: title-color,
      accent-color: accent-color,
      show-notes: show-notes,
      theory-title: theory-title,
      examples-title: examples-title,
      notes-title: notes-title,
    )
  }
}
