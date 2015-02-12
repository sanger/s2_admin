#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  "backbone",
  "views/sample_table_cell",
  "text!../../partials/well_table_row.html",
  "text!../../partials/well_table.html"
], (Backbone, SampleTableCellView, WellTableRowPartial, WellTablePartial) ->

  class WellTableView extends Backbone.View

    tableTemplate: _.template WellTablePartial

    tableRowTemplate: _.template WellTableRowPartial

    render: () ->

      table = $(@tableTemplate( showLocation: true))

      @collection.each (well) =>
        tableRow = $(@tableRowTemplate well.toJSON())

        well.on "highlight", () ->
          tableRow.addClass("alert-info")

        well.on "normalize", () ->
          tableRow.removeClass("alert-info")

        sample = well.getSample()

        if sample?
          tableCellView = new SampleTableCellView
            model: sample,
            el: $("td.sample", tableRow).get(0)

          sample.fetch()

        table.append tableRow

      @$el.append(table)
