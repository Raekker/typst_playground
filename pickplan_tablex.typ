#import "@preview/tablex:0.0.5": tablex, rowspanx, colspanx, cellx

#set page(
  paper: "a4",
  margin: (
      top: 5cm
    ),
  header: [
    #set text(13pt)
    #text(20pt)[*Pickplan*]
    #h(1fr) #box()[_Imagine Logo Here_]

    Tour: PU101-Dummy-230427044_1 \
    // box is an inline-level container that sizes content.
    // All elements except inline math, text, and boxes are block-level 
    // therefore if we need to include an image in the same line just use box()
    // e.g here for the barcode or above for the logo
    #box()[_Imagine Barcode here_]
    ],
  footer: [
      print: 09/21/2023 13:40
      #h(1fr)
      Page
      #counter(page).display(
          "1 / 1",
          both: true,
        )
  ]
)

// use the tablex from tablex package to create a long table
// with repeatable header
// unfortunately the default table in typst isn't capabale of doing this
// or would involve some time to write build blocks for it and script it in typst to make it work
// while this package is letting us achive our goal, due to that very goal it's taking longer to compile :(
#tablex(
   columns: (0.4fr, 1fr, 3.5fr, 1fr, 0.5fr, 1.5fr, 1fr),
   repeat-header: true,
   header-rows: 3,

   // (given a row index and all cells in it, return a new array of cells
   // In this case use it to color rows gray excpet for header rows
   // but note that the cells in the cells parameter can be none 
   // if they're some position occupied by a colspan or rowspan of another cell.
   // Ensure you return the cells in the order you were given, including the nones, for best results.
   map-rows: (row, cells) => cells.map(c => 
      if row in (0,1,2) or c == none or c.fill == white {
         c
      } else {
         (..c, fill: rgb("#bfbfbf"))
      }
   ),

   colspanx(4)[], colspanx(3)[Sequence: 0], 
   [*PL*], [*Item*], [*Description*], [*Qty*], [*Lay.*], [*Lot No.*], [*Location*],
   colspanx(7)[*SO21489905 Super Value - Lipa, SO21490548 SM Hypermarket - Rosario, SO21490585* …],
   ..for i in range(40) {
      ([1],[31021795],[NESTLE MP 4s Tropicon Faves],[△ 5 SU],[0],[PU3108110202],[Picked],
      [1],[31021795],[OREO Ice Cream Tub 450ml ],[△ 13 SU],[0.1],[PU3075212601],[Picked],)
   },
   cellx(fill:white)[], cellx(colspan:2, fill:white)[Total],cellx(fill:white)[56 CR 376 SU 2.3 LA], cellx(fill:white)[], cellx(fill:white)[], cellx(fill:white)[],
)

