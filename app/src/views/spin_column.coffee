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
