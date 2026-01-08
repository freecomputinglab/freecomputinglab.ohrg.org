#let person(name, imgurl, url) = html.elem("a", attrs: (href: url, target: "_blank"))[#html.elem("div", attrs: (class: "person"))[
  #image(imgurl)
  #html.elem("div", attrs: (class: "title"))[#name]
]]

#let banner = html.elem("div", attrs: (class: "banner"))[
  #html.elem("a", attrs: (href: "/"))[
    #image("img/the-fcl.png")
  ]
]

#banner

The free computing lab researches the nature of computing freedom.
Our research aims to demonstrate the role that the computer could and _should_ play in a society where freedom is flourishing rather than deprecated, and to cultivate a critically grounded practice of software production, development, and maintenance.

See our #link("https://github.com/free-computing-lab")[GitHub page] for code and more information.
You can also #link("https://freecomputinglab.zulipchat.com/join/dit724hcwgbhic3xxwkdpkqs/")[join our Zulip] to ask questions and follow our research, or drop us a note at #link("mailto:hi@ohrg.org")[hi\@ohrg.org].

Our *projects* include:
- #link("https://rheo.ohrg.org")[Rheo], a typesetting and static site engine based on Typst.
- #link("https://maths.ohrg.org")[Math(s), Philosophy, History], a long-running online \~bi-weekly reading group.

// - #link("./capital-for-tech-workers.typ")[Capital for tech workers], an introduction to Marx's 1867 book _Capital Volume I_ for software engineers, designers, and product managers.

==== People

#html.elem("div", attrs: (class: "people"))[
  #person([Lachlan Kermode], "./img/lachlankermode.jpg", "https://lachlankermode.com")
  #person([Will Crichton], "./img/willcrichton.jpg", "https://willcrichton.net")
]

#linebreak()


