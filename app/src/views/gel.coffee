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
