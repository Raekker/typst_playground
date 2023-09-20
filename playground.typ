#show link: underline
#set page(numbering:"1 of 1")

= Short Overview of Typst

Let's start with some comparison between _LaTeX_ and _Typst_


#table(
  columns: 4 * (auto,),
  align: horizon,
  [Element], [LaTeX], [Typst], [See],
  [Strong emphasis], [`\textbf{strong}`], [`*strong*`], [#link("https://typst.app/docs/reference/text/strong")[strong]],
  [Emphasis], [`\emph{emphasis}`], [`_emphasis_`], [#link("https://typst.app/docs/reference/text/emphasis")[emph]],
  [Monospace / code], [`\texttt{print(1)}`], [``print(1)``], [#link("https://typst.app/docs/reference/text/raw")[raw]],
  [Link], [`\url{https://typst.app}`], [`https://typst.app/`], [#link("https://typst.app/docs/reference/meta/link")[link]],
  [Label], [`\label{intro}`], [`<intro>`],	[#link("https://typst.app/docs/reference/meta/label")[label]],
  [Reference], [`\ref{intro}`], [`@intro`],	[#link("https://typst.app/docs/reference/meta/ref")[ref]],
  [Citation], [`\cite{humphrey97}`],	[`@humphrey97`], [#link("https://typst.app/docs/reference/meta/cite")[cite]],
  [Bullet list], [itemize environment],	[\- List], [#link("https://typst.app/docs/reference/layout/list")[list]],
  [Numbered list], [enumerate environment], [\+ List], [#link("https://typst.app/docs/reference/layout/enum")[enum]],
  [Term list], [description environment], [\/ Term: List], [#link("https://typst.app/docs/reference/layout/terms")[terms]],
  [Figure],	[figure environment],	[figure function], [#link("https://typst.app/docs/reference/meta/figure")[figure]],
  [Table], [table environment],	[table function], [#link("https://typst.app/docs/reference/layout/table")[table]],
  [Equation],	[`$x$, align / equation environments`],	[`$x$, $ x = y $`], [#link("https://typst.app/docs/reference/math/equation")[equation]],
  
)


To write this list in Typst...

```latex
\begin{itemize}
  \item Fast
  \item Flexible
  \item Intuitive
\end{itemize}
```

...just type this:
```
- Fast
- Flexible
- Intuitive
```
which then becomes

- Fast
- Flexible
- Intuitive

We can also do ordered lists easily, like so

+ This 
+ is
+ an
+ ordered
+ list

and we can set some rules for it as well
e.g.

`#set enum(numbering:"I.")`

#set enum(numbering:"I.")
+ This 
+ is
+ an
+ ordered
+ list


== Rules setting

You can set plethora of rules either for _*text*_ or _*page*_ or _*table*_ as long as the function
like _*text*_ has settable parameters
e.g.

I am starting out with small text.

`#set text(14pt)`
#set text(14pt)

This is a bit `#text(18pt)[larger,]`#text(18pt)[larger,]
don't you think?

#set text(11pt)


Let's do some page setting now

```

#set page(
  paper: "a4",
  header: rect(fill: aqua)[Header],
  footer: [
    #set align(center)
    #set text(8pt)
    #rect(fill: aqua, inset: 20pt)[
        Footer
        #counter(page).display(
        "1 of I",
        both: true,
          )
        ],
      ]
    ]
)

#set rect(
  width: 100%,
  height: 100%,
  inset: 4pt,
)

#rect(fill: aqua)[#lorem(100)]

```

#set page(
  paper: "a4",
  header: rect(fill: aqua)[Header],
  footer: [
    #set align(center)
    #set text(8pt)
    #rect(fill: aqua, inset: 20pt)[
      Footer
      #counter(page).display(
      "1 of I",
      both: true,
        )
      ],
    ]
)

#set rect(
  width: 100%,
  height: 100%,
  inset: 4pt,
)

#rect(fill: aqua)[#lorem(100)]

//#lorem(150)

#set enum(numbering: "1.a)")

=== Reasons to use Typst

From my perspective here's a few points in which Typst is better than LaTeX, at least when it comes to developer experience:

+ it's synatx is much clearer e.g. each of these is a function used with with set keyword to set rules for the document, like font and it's size, or type of page and it's margins
  + `
        #set text(
          font: "New Computer Modern",
          size: 10pt )
        #set page(
          paper: "a6",
          margin: (x: 1.8cm, y: 1.5cm),
        )
        #set par(
          justify: true,
          leading: 0.52em,
        )
   `
+ things like emphasis, lists are like markdown synatx, though that is syntactic sugar, which basically does calls to respective functions (most of them)
+ in each function we can name which params we pass, so it adds to the clarity of the document if you need to read it and check it's settings
+ typst is "batteries included" kind of thing, therefore lots of things which can be done with built-in tools in Typst, would need packages in LaTex
  + like geometry, fancyhdr packages for page setup, in typst there's page function
  + or like babel, polyglossia, in typst there the text function in which the language can be set
  + or graphicx, svg, in typst there is image function
  + and as one more example tabularx, in typst there are table and grid functions
+ typst also has packages(and a built-in package manager) in a would be case there's lack of some functionality
+ documentation is very verbose and understandable, each function has its every parameter listed and explained along with examples of usage
+ and to top it, a nice and helpful error messages from the compiler 

=== Typst current limitations and therefore perhaps reasons to not use it

What limitations does Typst currently have compared to LaTeX?
Although Typst can be a LaTeX replacement for many today, there are still features that Typst does not (yet) support. Here is a list of them which, where applicable, contains possible workarounds.

+ Native charts and plots. LaTeX users often create charts along with their documents in PGF/TikZ. Typst does not yet include tools to draw diagrams, but the community is stepping up with solutions such as cetz. You can add those to your document to get started with drawing diagrams.

+ Change page margins without a pagebreak. In LaTeX, margins can always be adjusted, even without a pagebreak. To change margins in Typst, you use the page function which will force a page break. If you just want a few paragraphs to stretch into the margins, then reverting to the old margins, you can use the pad function with negative padding.

+ Include PDFs as images. In LaTeX, it has become customary to insert vector graphics as PDF or EPS files. Typst supports neither format as an image format, but you can easily convert both into SVG files with online tools or Inkscape. We plan to add automatic conversion for these file formats to the Typst web app, too!

+ Page break optimization. LaTeX runs some smart algorithms to not only optimize line but also page breaks. While Typst tries to avoid widows and orphans, it uses less sophisticated algorithms to determine page breaks. You can insert custom page breaks in Typst using `#pagebreak(weak: true)` before submitting your document. The argument weak ensures that no double page break will be created if this spot would be a natural page break anyways. You can also use `#v(1fr)` to distribute space on your page. It works quite similar to LaTeX's \vfill.

+ Bibliographies are not customizable. In LaTeX, the packages bibtex, biblatex, and natbib provide a wide range of reference and bibliography formats. These packages also allow you to write .bbx files to define your own styles. Typst only supports a small set of citation styles at the moment, but we want to build upon this by supporting Citation Style Language (CSL), an XML-based format backed by Zotero that allows you to describe your own bibliography styles.

