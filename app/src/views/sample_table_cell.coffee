#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [ "backbone" ], (Backbone) ->

  class SampleTableCellView extends Backbone.View
  
    initialize: (attributes) ->
      @model.on "change", () =>
        @render()

    render: () ->
      @$el.html @model.get("sanger_sample_id")
      this
