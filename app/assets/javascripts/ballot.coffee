$ ->
  $('#ballot-form').on 'submit', (e) ->
    e.preventDefault()
    formdata = $(this).serialize()
    $.ajax
      type: 'post'
      url: $(this).attr('action')
      dataType: 'json'
      data: formdata
      success: (topic) ->
        window.location = 'https://www.elections.org.za/LGEDashBoard2016/'
      error: (e) ->
        if typeof(e.responseJSON.ip_address) == 'undefined'
          alert("You should vote for 3 options!")
        else
          alert("You have already voted!")
          window.location = 'https://www.elections.org.za/LGEDashBoard2016/'


  return if $('#ballot-form').length == 0
  $.get '/topics'
  .done (topics) ->
    _.each $('#ballot-form select'), (input) ->
      _.each topics, (topicOption) ->
        addTopicOptionToSelect(topicOption, input)

addTopicOptionToSelect = (topicOption, input) ->
  template = _.template $('#topic-option-template').html()
  topicHtml = template topicOption
  $(input).prepend topicHtml

