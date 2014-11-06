define ["models/s2_base/s2_labware_model", "collections/wells"], (S2Labware, Wells) ->

  class Gel extends S2Labware

    getAliquots: () ->
      _.chain(this.get('windows')).pairs().first().value()[1]

    initialize: (attributes) ->
      super arguments...

      wells = _.reduce @get("windows"), (memo, aliquots, slot) ->

        if aliquots.length is 0
          return memo

        well =
          slot: slot
          aliquots: aliquots

        memo.push well
        memo
      , []

      this.wells = new Wells wells      
    
    urlRoot: () ->
      @baseUrl() + "/gels"

    printerType: 'tube_rack'