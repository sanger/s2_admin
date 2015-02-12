#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  "views/labware",
  "views/slot_like",
  "views/well_table",
  "text!../../images/svgs/rack.svg"
], (LabwareView, SlotLikeView, WellTableView, TubeRackSVG) ->

  class TubeRackView extends LabwareView

    initialize: () ->
      super(TubeRackSVG)

    render: () ->
      super()

      @model.tubes.each (tube) =>
        slotLike = new SlotLikeView
          model: tube
          el   : @$ ".#{ tube.get("slot") }"

      wellTable = new WellTableView
        collection: @model.tubes
        el: @$ "#information"

      wellTable.render()

      this
