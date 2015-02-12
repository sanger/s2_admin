#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
# Base model for all labware

define [
  "models/s2_base/s2_laboratory",
  "models/label",
  "models/search"
], (S2Laboratory, Label, Search) ->

  class S2LabwareModel extends S2Laboratory

    initialize: (attributes) ->
      @labels   = new Label @get("labels")

    order: () ->
      search = new Search
      search.orderByUUID(this)

    labelRole: () ->
      aliquots = this.getAliquots()
      if (aliquots.length == 0)
        return ""
      return aliquots[0].type

    labelTemplate: () ->
      template = { template: this.printerType, label_text: { role: this.labelRole() } }
      labelInfo = {}
      labels = this.get("labels")
      unless _.isUndefined labels["barcode"]
        labelInfo["ean13"] = labels["barcode"].value
      unless _.isUndefined labels["sanger label"]
        labelInfo["sanger"] = labels["sanger label"].value
      template[this.printerType] = labelInfo
      return template
