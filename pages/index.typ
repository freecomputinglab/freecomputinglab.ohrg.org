#let person(name, imgurl) = html.elem("div", attrs: (class: "person"))[
  #image(imgurl)
  #html.elem("div", attrs: (class: "title"))[#name]
]

#let banner = html.elem("div", attrs: (class: "banner"))[
  #html.elem("a", attrs: (href: "/"))[
    #image("img/the-fcl.png")
  ]
]

#banner

The free computing lab researches the nature of computing freedom.
Our research aims to demonstrate the role that the computer could and _should_ play in a society where freedom is flourishing rather than deprecated, and to cultivate a critically grounded practice of software production, development, and maintenance.

// Much of FCL's research can be found on our #link("https://github.com/free-computing-lab")[Github], where many of the projects below have corresponding pages.

Our *research projects* include:
- #link("https://rheo.ohrg.org")[rheo], a static site and epub engine based on typst.

// - #link("./capital-for-tech-workers.typ")[Capital for tech workers], an introduction to Marx's 1867 book _Capital Volume I_ for software engineers, designers, and product managers.

==== People

#html.elem("div", attrs: (class: "people"))[
  #person([Lachlan Kermode], "./img/lachlankermode.jpg")
  // #person([Will Crichton], "./img/willcrichton.webp")
]

#linebreak()

If you're interested in what we do, you can drop us a note at #link("mailto:hi@ohrg.org")[hi\@ohrg.org].
