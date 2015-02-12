#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  "backbone",
  "views/printers",
  "text!../../partials/labware.html",
  "text!../../partials/labware_info_table.html"
], (Backbone, PrintersView, LabwarePartial, LabwareInfoTablePartial) ->

  class LabwareView extends Backbone.View

    initialize: (svgText) ->
      @_svg = @_createSVG(svgText)
      @model.on "change", @render

    template: _.template LabwarePartial

    tableTemplate: _.template LabwareInfoTablePartial

    parser: new DOMParser()

    _createSVG: (xmlString) ->
      @parser.parseFromString(xmlString, "image/svg+xml").documentElement

    render: () ->
      @$el.append @template()

      # The svg
      @$("#svg").append @_svg

      # The printers
      printers = new PrintersView(
        collection: S2.Printers
        labware:    @model
        el:         @$("#printing")
      )

      printers.render()

      # The information table
      info =
        attributes: @model.attributes
        labels:     @model.labels.attributes

      @$("#information")
        .append(@tableTemplate info)

      this
