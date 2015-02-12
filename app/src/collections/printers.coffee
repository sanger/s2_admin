#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  'backbone',
  'collections/s2_collection',
  'models/printer'
], (Backbone, S2Collection, Printer) ->

  class Printers extends S2Collection

    model: Printer

    baseUrl: () ->
      super() + '/lims-support/label_printers'

    fetch: (action = 'first') ->
      Backbone.ajax({ url: @baseUrl() })
        .then((res) =>
          @url = res['label_printers']['actions'][action]
          super()
        )

    parse: (res) =>
      res.label_printers
