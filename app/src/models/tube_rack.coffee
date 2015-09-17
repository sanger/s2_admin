#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  "models/s2_base/s2_labware_model",
  "collections/tubes"
], (S2LabwareModel, Tubes) ->

  class TubeRack extends S2LabwareModel

    urlRoot: () ->
      @baseUrl() + "/tube_racks"

    getAliquots: () ->
      val = _.chain(this.get('tubes')).pairs().first().value()
      if !(val?)
        return []
      return val[1].aliquots

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
