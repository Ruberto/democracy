# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $.get '/lol'
  .done (topics) ->
    console.log topics
    _.each topics, (topic) ->
      template = _.template $('#topic-template').html()
      topicHtml = template topic
      $("#topics").append topicHtml
      
      
