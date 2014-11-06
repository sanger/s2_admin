define [
  "models/s2_base/s2_labware_model",
  "collections/tubes"
], (S2LabwareModel, Tubes) ->

  class TubeRack extends S2LabwareModel

    urlRoot: () ->
      @baseUrl() + "/tube_racks"

    getAliquots: () ->
      _.chain(this.get('tubes')).pairs().first().value()[1].aliquots

    initialize: (attributes) ->
      super arguments...

      tubes = _.reduce @get("tubes"), (memo, tube, slot) ->
        if not tube.aliquots?
          return memo

        tube.slot = slot

        memo.push tube
        memo
      , []

      this.tubes = new Tubes tubes

    printerType: "tube_rack"