# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # Post topic to API
  $('#new-topic-form').on 'submit', (e) ->
    e.preventDefault()
    formdata = $(this).serialize()
    console.log formdata
    $.ajax
      type: 'post'
      url: $(this).attr('action')
      dataType: 'json'
      data: formdata
      success: (topic) ->
        addTopic(topic)
        $('#new-topic-form input[type=text]').val('')
      error: (e) ->
        alert("Both name and author needs to be present!")

  # Retrieve topics from API
  $.get '/topics'
  .done (topics) ->
    console.log topics
    _.each topics, (topic) ->
      addTopic(topic)

addTopic = (topic) ->
  template = _.template $('#topic-template').html()
  topicHtml = template topic
  $("#topics").prepend topicHtml

