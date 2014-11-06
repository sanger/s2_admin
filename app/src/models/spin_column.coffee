define ["models/s2_base/s2_labware_model"], (S2LabwareModel) ->

  class SpinColumn extends S2LabwareModel

    initialize: (attributes) ->
      super arguments...

    getAliquots: () ->
    	this.get('aliquots')

    urlRoot: () ->
      @baseUrl() + "/spin_columns"

    printerType: "tube"