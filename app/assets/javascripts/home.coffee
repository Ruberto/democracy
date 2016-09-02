# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # Post topic to API
  $('#new-topic-form').on 'submit', (e) ->
    formdata = $(this).serialize()

    e.preventDefault()
    console.log formdata
    $.ajax
      type: 'post'
      url: $(this).attr('action')
      datatype: 'JSON'
      success: (e) ->
        console.log e.message
      error: (e) ->
        console.log e.message

  # Retrieve topics from API
  $.get '/lol'
  .done (topics) ->
    console.log topics
    _.each topics, (topic) ->
      template = _.template $('#topic-template').html()
      topicHtml = template topic
      $("#topics").append topicHtml
      
      
