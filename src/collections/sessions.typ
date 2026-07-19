// Course Sessions collection helper
// Generates course-note elements (each is 2 pages) with optional index and nav bar

#import "../elements/course-note.typ": course-note
#import "../elements/nav-bar.typ": nav-bar
#import "../components/index-list.typ": index-page

#let course-sessions(
  count: 10,
  index: true,
  title: "Course sessions",
  entry-title: "Session",
  section: "course",
  heading-color: luma(120),
  title-color: rgb("#1a1a1a"),
  accent-color: none,
  exercises-title: "EXERCISE NOTES",
  learned-title: "WHAT I LEARNED",
  index-label: "course-index",
) = {
  // Generate index page if requested (links disabled for now)
  if index {
    let items = range(1, count + 1).map(_ => "")
    index-page(
      title: title,
      items: items,
      cols: 2,
      use-links: false,
      index-label: index-label,
    )
    pagebreak(weak: true)
  }
  
  // Generate course note pages (each is 2 pages)
  for i in range(1, count + 1) {
    let page-label = section + "-" + str(i)
    
    course-note(
      i,
      title: entry-title,
      heading-color: heading-color,
      title-color: title-color,
      accent-color: accent-color,
      label: label(page-label),
      exercises-title: exercises-title,
      learned-title: learned-title,
    )
  }
}
