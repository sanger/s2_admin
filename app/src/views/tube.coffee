#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  "views/labware",
  "views/aliquot",
  "views/sample_table_cell",
  "text!../../partials/well_table_row.html",
  "text!../../partials/well_table.html",
  "text!../../images/svgs/tube.svg"
], (LabwareView, AliquotView, SampleTableCellView, WellTableRowPartial, WellTablePartial, tubeSVG) ->

  class TubeView extends LabwareView

    initialize: () ->
      super(tubeSVG)

    aliquotTableTemplate: _.template WellTablePartial

    aliquotTableRowTemplate: _.template WellTableRowPartial

    render: () ->
      super()
      aliquot = @model.aliquots.find (aliquot) ->
        aliquot.has "sample"

      if _.isUndefined aliquot
        return this

      oldClass = $(".aliquot", @_svg).attr "class"
      newClass = aliquot.get("type").replace(/[^\w-]+/g, '_').toLowerCase()
      $(".aliquot", @_svg).attr("class", "#{ newClass }  #{ oldClass }")

      tableRow = $(@aliquotTableRowTemplate(@model.toJSON()))
      table = $(@aliquotTableTemplate())

      sample = aliquot.getSample()

      if sample?
        tableCellView = new SampleTableCellView
          model: sample,
          el: $("td.sample", tableRow).get(0)

        sample.fetch()

      table.append(tableRow)

      @$("#information").append table

      this
