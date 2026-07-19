#import "../config.typ": default-config

#let index-list(
  items: (),
  cols: 2,
  item-height: 8mm,
  use-links: false,
  target-prefix: "",
  get-target: none,
) = {
  let cfg = default-config

  columns(cols)[
    #for i in range(1, items.len() + 1) {
      let item = items.at(i - 1)
      
      let content = [
        #block(width: 100%, height: item-height)[
          #text(weight: "bold")[#i)]
          #if type(item) == str and item != "" [
            #text(size: 10pt)[ #item]
          ]
          #box(width: 1fr, repeat[ . ])
        ]
      ]
      
      if use-links {
        let label-target = if get-target != none {
          get-target(i)
        } else {
          target-prefix + str(i)
        }
        link(label(label-target))[#content]
      } else {
        content
      }
    }
  ]
}

#let index-page(
  title: "Index",
  items: (),
  cols: 2,
  item-height: 8mm,
  use-links: false,
  target-prefix: "",
  get-target: none,
  index-label: none
) = {
  if index-label != none {
    heading(level: 1)[#title #label(index-label)]
  } else {
    heading(level: 1, title)
  }

  v(5mm)

  index-list(
    items: items,
    cols: cols,
    item-height: item-height,
    use-links: use-links,
    target-prefix: target-prefix,
    get-target: get-target,
  )
}
