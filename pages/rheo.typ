#import "index.typ": banner
#banner 

= Rheo

Rheo (_ray-oh_) is a static site engine based on #link("https://typst.app/")[typst].
It allows you to write books, blogs, documentation, and papers by produces three concurrent outputs from a single typst source:
- A static site (html)
- A pdf (or set of pdfs)
- An epub

TODO: include an example.

For why we built rheo and how it relates to typst, read: #link("./what-and-why-is-rheo.typ")[What and why is rheo?] 

== Installing
The easiest way to install rheo is from #link("https://crates.io/")[crates.io], the Rust language's package manager:

```rs
cargo install rheo
```

== Contributing 
Rheo is written in Rust and developed in public through #link("https://github.com/breezykermo/rheo")[Github].
