#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [ "backbone", "text!../../partials/search.html" ], (Backbone, SearchPartial) ->

  class SearchView extends Backbone.View

    initialize: () ->
      @render()

    events:
      "submit form": "navigateToLabware"

    template: _.template SearchPartial

    render: () ->
      @$el.append @template()
      this

    inputValue: () ->
      @$('input').val()

    searchType: () ->
      @$('select option:selected').val()

    navigateToLabware: (e) ->
      e.preventDefault()

      S2.Router.navigate "labware/#{ @searchType() }/#{ @inputValue() }", { trigger: true }

