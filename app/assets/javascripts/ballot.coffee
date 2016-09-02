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
        window.location.replace('/ballot/results')
      error: (e) ->
        alert("You should vote for 3 options!")


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

