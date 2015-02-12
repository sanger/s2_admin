#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define [
  'backbone',
  'models/s2_base/s2_support_model'
], (Backbone, S2Support) ->

  class Printer extends S2Support

    baseUrl: () ->
      return super() + '/' + this.id

    print: (labware) ->
      post_data = {
        label_printer: {
          "user": "TEST_USER_1",
          "header_text": { 
            "header_text1": "Start of labels",
            "header_text2":"For TEST_USER_1 (1 labels)"
          },"footer_text":{
            "footer_text1":"End of labels",
            "footer_text2":"For TEST_USER_1 (1 labels)"
          },"labels" : [ labware.labelTemplate() ]
        }
      }

      $.ajax this.baseUrl(),
        type: 'POST'
        contentType: 'application/json; charset=UTF-8'
        dataType: 'json'
        data: JSON.stringify post_data
        headers: { "user-email": "TEST_USER_1" }
        complete: (xhr, status) ->
          S2.App.info "Label sent to the printer"
          return ""
