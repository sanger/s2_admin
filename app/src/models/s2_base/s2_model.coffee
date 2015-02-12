#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
# Top parent model for all models in S2

define [
  "backbone",
  "config",
  "lib/errors",
  "lib/error_list"
], (Backbone, Config, Errors, ErrorList) ->

  class S2Model extends Backbone.Model

    constructor: () ->
      @config = Config
      @errors = Errors
      super(arguments...)

    idAttribute: "uuid"

    baseUrl: () ->
      @config.baseUrl

    sync: (method, model, options) ->
      options["url"] = model.baseUrl() + "/" + model.id if method is "read"
      Backbone.sync method, model, options

    validate: (attributes, options) ->
      @_errorList = new ErrorList
      undefined
