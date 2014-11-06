define [
  "models/tube",
  "models/plate",
  "models/tube_rack",
  "models/filter_paper",
  "models/gel",
  "models/spin_column",

  "views/tube",
  "views/plate",
  "views/tube_rack",
  "views/filter_paper",
  "views/spin_column",
  "views/gel"
], (
  TubeModel,
  PlateModel,
  TubeRackModel,
  FilterPaperModel,
  GelModel,
  SpinColumnModel,
  
  TubeView,
  PlateView,
  TubeRackView,
  FilterPaperView,
  SpinColumnView
  GelView
) ->

  labware =
    tube: 
      model: TubeModel
      view: TubeView
    plate:
      model: PlateModel
      view: PlateView
    tube_rack:
      model: TubeRackModel
      view: TubeRackView
    filter_paper:
      model: FilterPaperModel
      view: FilterPaperView
    spin_column:
      model: SpinColumnModel
      view: SpinColumnView
    gel:
      model: GelModel
      view: GelView

  (name) ->

    if not labware[name]?
      throw new Error "Labware #{name} does not exist"

    labware[name]
