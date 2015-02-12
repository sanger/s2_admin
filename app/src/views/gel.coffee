#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  "views/labware",
  "views/slot_like",
  "views/well_table",
  "text!../../images/svgs/96_gel.svg"
], (LabwareView, SlotLikeView, WellTableView, GelSVG) ->

  class PlateView extends LabwareView
    
    initialize: () ->
      super(GelSVG)
      @model.on "change", @render

    render: () ->

      super()

      this
