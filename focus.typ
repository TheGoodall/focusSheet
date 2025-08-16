#let contents = yaml("data.yml")
#let data = contents.instruments

#set table.cell(breakable: false)
#set page(margin: 2%)

= #contents.show

#table(
  columns: (7%, 3fr, 10%, 2fr, 10%, 7%),
  stroke: none,
  table.header([Unit], [Type], [Wattage], [Purpose], [Gel], [Chn], table.hline()),
  ..for fix in data {( 
    [#fix.unit], [#fix.instrumentType], [#fix.wattage], [#fix.purpose], if fix.gel != "" [#fix.gel] else [O/W], [#fix.channel],
    table.cell(colspan:1)[],
    table.cell(colspan:5)[
      #table(columns: 2, stroke: none,
        table(
          columns: 2,
          stroke: none,
          [#fix.location.at(0) #sym.arrow.l.r],
          [#fix.location.at(1) #sym.arrow.t],
        ),
        fix.focus
      )
    ],
    table.cell(colspan:1)[],
    table.cell(colspan:5)[
      #table(
        columns: (2fr, 2fr, 5fr),
        rows: 18pt,
        stroke: none,
        [US: #fix.shutterCuts.US], [SR: #fix.shutterCuts.SR],
          table(stroke: none, columns: 3,
            if fix.edge.SfHd == 1 {circle(inset: 0pt, outset: 10pt, [Sf])} else {[Sf]},
            if fix.edge.SfHd == 2 {circle(inset: 0pt, outset: 10pt, [+])} else {[+]},
            if fix.edge.SfHd == 3 {circle(inset: 0pt, outset: 10pt, [Hd])} else {[Hd]},
            ),
        [UD: #fix.shutterCuts.DS], [SL: #fix.shutterCuts.SL],
          table(stroke: none, columns: 3,
            if fix.edge.SpFl == 1 {circle(inset: 0pt, outset: 10pt, [Sp])} else {[Sp]},
            if fix.edge.SpFl == 2 {circle(inset: 0pt, outset: 10pt, [+])} else {[+]},
            if fix.edge.SpFl == 3 {circle(inset: 0pt, outset: 10pt, [Fl])} else {[Fl]},
            ),
        [TP: #fix.shutterCuts.TP], [BT: #fix.shutterCuts.BT],
          table(stroke: none, columns: 4,
            if fix.edge.Axis == 1 {circle(inset: 0pt, outset: 10pt, [---])} else {[---]},
            if fix.edge.Axis == 2 {circle(inset: 0pt, outset: 10pt, [|])} else {[|]},
            if fix.edge.Axis == 3 {circle(inset: 0pt, outset: 10pt, [UsDs])} else {[UsDs]},
            if fix.edge.Axis == 4 {circle(inset: 0pt, width: 30pt, [sLsR])} else {[sLsR]},
            ),
      )
    ],
    table.hline(stroke: (dash: "dashed"))
  )}
)

