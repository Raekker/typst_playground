#import "@preview/tablex:0.0.5": tablex, rowspanx, colspanx, cellx, hlinex, vlinex, gridx
#set page(
  header-ascent: 0%,
  footer-descent: 0%,
  margin: (top: 5mm, bottom: 5mm, left: 5mm, right: 5mm)
)

/* unfortunately we can't just change column widths willy nilly in here 
  so replaction of the label table layout isn't exactly doable, at least with one function call
  here's an example of label layout with varying columns width using stack and tablex function calls
*/
#stack(dir: ttb, spacing: none,
  tablex(columns: (5fr, 4fr), rows: (3cm,),
    [Item Code #v(1fr) #text(20pt)[*31000428*]],
    [#align(center)[#rect(width:75%,height:2cm)[_Imagine Barcode Here_] #v(1fr) Charge: *BK3264232401*]]
  ),
  tablex(columns: (1fr,), rows: (2cm,),
    [#align(left + horizon)[#text(20pt)[*NE Van Swch MP 6(6x3.5fz)*]]]
  ),
  tablex(columns: (1fr,), rows: (7mm,),
    [Storage: DFR]
  ),
  tablex(columns: (5fr, 4fr), rows: (2cm,),
    [BBD #h(1fr) #text(20pt)[*30.09.2024*] \ (DD.MM.YYYY)], rowspanx(2)[Daily Coding \ #align(left + horizon)[#text(18pt)[*3264*]]],
    [placeholder]
  ),
  tablex(columns: 2 * (1fr,),
    [Lot \ #text(20pt)[*BK3264232401*]],
    [Remark/Line],
  ),
  tablex(columns: (1fr,), rows: (2cm,),
    [Supplier],
  ),
  tablex(columns: (2fr,1fr,), rows: (2cm,),
    [Order Number], [Original Amount \ #h(1fr) #text(20pt)[*275.000 CR*]],
  )
)

// here's an example of table layout with varying column widths
// using one main tablex call and then subsequent rows with tablex calls
// we need to set inset to 0pt in the main tablex call to not have padding in each cell
/*
#tablex(
  columns: (1fr,),
  header-rows:0,
  inset: 0pt,
  tablex(columns: (5fr, 4fr), rows: (3cm,),
    [Item Code #v(1fr) #text(20pt)[*31000428*]],
    [#align(center)[#rect(width:75%,height:2cm)[_Imagine Barcode Here_] #v(1fr) Charge: *BK3264232401*]]
  ),
  tablex(columns: (1fr,), rows: (2cm,),
    [#align(left + horizon)[#text(20pt)[*NE Van Swch MP 6(6x3.5fz)*]]]
  ),
  tablex(columns: (1fr,), rows: (7mm,),
    [Storage: DFR]
  ),
  tablex(columns: (5fr, 4fr), rows: (2cm,),
    [BBD #h(1fr) #text(20pt)[*30.09.2024*] \ (DD.MM.YYYY)], rowspanx(2)[Daily Coding \ #align(left + horizon)[#text(18pt)[*3264*]]],
    [placeholder]
  ),
  tablex(columns: 2 * (1fr,),
    [Lot \ #text(20pt)[*BK3264232401*]],
    [Remark/Line],
  ),
  tablex(columns: (1fr,), rows: (2cm,),
    [Supplier],
  ),
  tablex(columns: (2fr,1fr,), rows: (2cm,),
    [Order Number], [Original Amount \ #h(1fr) #text(20pt)[*275.000 CR*]],
  )
)
*/

#text(20pt)[
  Sample taken at: `________________` (date/signature) \
  2nd Invest at:\u{0020} \u{0020}  \u{0020}  `________________` (date/signature) // added space unicode chars

  #align(center)[
    #rect(width: 80%, height: 2cm)[_Imagine Barcode Here_]
    *(00)312001097001032515*
  ]
]

#pagebreak()

#set page(
  header-ascent: 0%,
  footer-descent: 0%,
  margin: (left: 1cm, right: 1cm),
)

#text(38pt)[
  #align(center)[
    *Dreyer’s Grand Ice Cream*
  ]
]
#tablex(
  columns: 3 * (1fr,),
  header-rows: 0,
  repeat-header: false,
  vlinex(stroke: black + 2pt),
  hlinex(stroke: black + 2pt),
  colspanx(3)[SSCC \ #align(center)[*#text(30pt)[3] #text(38pt)[12 00109 700103251] #text(30pt)[5]*]], vlinex(stroke: black + 2pt), 
  colspanx(3)[Item #h(1fr) 31000428 #h(1fr) \ #align(center)[#text(20pt)[*NE Van Swch MP 6(6x3.5fz)*]]],
  colspanx(3)[
    #gridx(
      columns: 3 * (1fr,),
      [GTIN], [#align(center)[QTY/Pal.]], [#align(right)[Num.GTIN/Layer x Num.Layer]],
      [00072554753718], [#align(center)[275.0]], [#align(right)[( 25 x 11 )]],
    )
  ],
  colspanx(3)[
    #gridx(
      columns: 2 * (1fr,),
      [Included GTIN],[#align(right)[QTY/Pal.]],
      [00072554111860],[#align(right)[1650.0]],
      )

  ],
  [BBD/DDM (MM/DD/YY) \ #text(18pt)[*09/30/24*]],[Lot \ BK3264232401],[Gr.Wt./Pal. (KG) \ #text(18pt)[*782.05*]], hlinex(stroke: black + 2pt),
)

#rect(width: 90%, height: 2cm)[_Imagine Barcode Here_]
(02)00072554753718(15)240930(37)275
#rect(width: 100%, height: 2cm)[_Imagine Barcode Here_]
(3302)078205(10)BK3264232401(20)00
#rect(width: 70%, height: 2cm)[_Imagine Barcode Here_]
(00)312001097001032515
