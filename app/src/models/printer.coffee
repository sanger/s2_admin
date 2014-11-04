define ['models/s2_base/s2_support_model'], (S2Support) ->

  class Printer extends S2Support

    baseUrl: () ->
      return super() + '/' + this.id

    onSuccessPrinting: () ->
      return ""

    onErrorPrinting: () ->
      return ""

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
        type: 'post'
        contentType: 'application/json; charset=UTF-8'
        dataType: 'json'
        data: JSON.stringify post_data
        headers: { "user-email": "TEST_USER_1" }
        context: this
        complete: (xhr, status) ->
          S2.App.info "Label sent to the printer"
          return ""