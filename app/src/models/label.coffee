#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  "models/s2_base/s2_laboratory",
  "models/labellable",
  "models/search",
  "collections/labellables"
  ], (S2Laboratory, Labellable, Search, Labellables) ->

  class Label extends S2Laboratory

    initialize: (attributes) ->
      @set("labellable", new Labellable { uuid: attributes.uuid}) if attributes.uuid?

    validate: (attributes, options) ->
      # If it's a 2D barcode
      if _.isString(attributes.value) and attributes.value.substring(0,2) is 'FR'
        res = /^FR\d{8}$/.exec(attributes.value)
        return "Validation Error: EAN13 barcode <strong>#{attributes.value}</strong> is not valid" if not res?

      else if attributes.type is 'ean13'
        res =  /^\d{12,13}$/.exec(attributes.value)
        return "Validation Error: EAN13 barcode <strong>#{attributes.value}</strong> is not valid" if not res?

      else if attributes.type is 'sanger label'
        res = /^[A-Z]{2}\d{7}[A-Z]{1}$/i.exec(attributes.value)
        return "Validation Error: Sanger Label <strong>#{attributes.value}</strong> is not valid" if not res?

      undefined

    searchForLabware: (labwareType, action = "first") ->
      search = new Search()
      search.labwareByLabel this, labwareType, action

    searchForLabellable: (action = "first") ->
      search = new Search()
      search.labellableByLabel(this, action)
        .then((result) ->
          new Labellables result.labellables
        )
