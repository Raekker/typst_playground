#show link: underline
#set page(numbering:"1 of 1")

= Short Overview of Typst

Let's start with some comparison between _LaTeX_ and _Typst_


#table(
  columns: (auto, auto, auto, auto),
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

#rect(fill: aqua)

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

#rect(fill: aqua)

#lorem(150)

