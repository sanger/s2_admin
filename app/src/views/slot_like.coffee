#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [ "backbone" ], (Backbone) ->

  class SlotLikeView extends Backbone.View

    initialize: () ->
      aliquot = @model.aliquots.find (aliquot) ->
        aliquot.has "sample"

      # Cause you can't use $.addClass() with svgs DAWG
      oldClass = @$el.attr "class"
      newClass = aliquot.get("type").replace(/[^\w-]+/g, '_').toLowerCase()
      @$el.attr("class", "#{ newClass } #{ oldClass } #{ "slotLike" if @model.get("uuid")? } ")

    events:
      mouseover: "highlightSlot"
      mouseout:  "normalizeSlot"
      click:     "goToSample"

    highlightSlot: (e) ->
      @model.trigger "highlight"

    normalizeSlot: () ->
      @model.trigger "normalize"

    goToSample: () ->
      uuid = @model.get("uuid")
      if (uuid?)
        S2.Router.navigate "labware/" + uuid, { trigger: true } 
