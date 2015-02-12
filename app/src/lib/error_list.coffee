#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [], () ->

  class ErrorList

    _errors: [],

    add: (message) ->
      @_errors.push message

    empty: () ->
      @_errors = []

    format: () ->
      @_errors.join("\n")

    isEmpty: () ->
      @_errors.length is 0
