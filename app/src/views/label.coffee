#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  "backbone",
], (Backbone) ->

  class LabelView extends Backbone.View

    tagName: 'ul'

    template: _.template "<% if (label.barcode) { %><li><b>EAN13 Barcode: </b><%= label.barcode.value %></li><% } if (label['sanger label']) { %><li><b>Sanger Barcode: </b><%= label['sanger label'].value %></li><% } %>"

    render: () ->
      @$el.html @template({ label: @model.attributes })
      this
