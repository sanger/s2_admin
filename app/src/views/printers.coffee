#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  "backbone",
  "text!../../partials/printing.html"
], (Backbone, PrintingPartial) ->

  class PrintersView extends Backbone.View

    initialize: (options) ->
      @_labware = options.labware;
      @validPrinters = S2.Printers.where label_type: @_labware.printerType

    events:
      "click button": "printLabel"

    template: _.template PrintingPartial

    render: () ->
      @$el.html @template({ printers: @validPrinters })
      this

    printLabel: () ->
      event.preventDefault()      
      printer = S2.Printers.findWhere({ name: @_selectedPrinter()})
      printer.print(@_labware)

    _selectedPrinter: () ->
      @$('select option:selected').val()
