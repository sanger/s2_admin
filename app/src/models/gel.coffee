#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
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
