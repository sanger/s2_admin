#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  "views/labware",
  "views/aliquot",
  "views/sample_table_cell",
  "text!../../partials/well_table_row.html",
  "text!../../partials/well_table.html",
  "text!../../images/svgs/spin_column.svg"
], (LabwareView, AliquotView, SampleTableCellView, WellTableRowPartial, WellTablePartial, spinColumnSVG) ->

  class SpinColumnView extends LabwareView

    initialize: () ->
      super(spinColumnSVG)

    aliquotTableTemplate: _.template WellTablePartial

    aliquotTableRowTemplate: _.template WellTableRowPartial

    render: () ->
      super()

      this
