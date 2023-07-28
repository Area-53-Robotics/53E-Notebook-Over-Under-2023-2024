#import "./globals.typ": appendix_page_counter

#let nb_frontmatter_footer() = {
  appendix_page_counter.step()
  align(
    right,
    appendix_page_counter.display("i"),
  )
}
