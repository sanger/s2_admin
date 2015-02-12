#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
#/*global require*/
'use strict'

window.S2 = {};

require [
  'backbone',
  'jquery',
  'lib/ajax',
  'controllers/app_controller',
  'collections/printers',
  'views/app_view',
  'views/search',
  'router'
], (Backbone, $, Ajax, AppController, Printers, AppView, SearchView, Router) ->

  Backbone.ajax = Ajax

  appView = new AppView;
  searchView = new SearchView({ el: $("#search") })

  S2.Dispatch = _.extend({}, Backbone.Events)
  S2.App      = new AppController(appView)
  S2.Printers = new Printers()

  S2.Printers.fetch().then(() ->
    $(() ->
      S2.Router = new Router();
      Backbone.history.start();
    )    
  )
