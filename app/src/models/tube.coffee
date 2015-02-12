#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  "models/s2_base/s2_labware_model",
  "collections/aliquots"
], (S2LabwareModel, Aliquots) ->

  class Tube extends S2LabwareModel

    initialize: (attributes) ->
      super arguments...
      @aliquots = new Aliquots @get("aliquots")

    urlRoot: () ->
      @baseUrl() + "/tubes"

    parse: (response, options) ->
      attr = response.tube

    getAliquots: () ->
      this.get('aliquots')

    getSample: () ->
      if @aliquots?
        @aliquots.getSample()

    printerType: "tube"
