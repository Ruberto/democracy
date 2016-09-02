# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # Retrieve results from API
  $.get '/results'
  .done (results) ->
    console.log results
    _.each results, (result) ->
      addResult(result)

addResult = (result) ->
  template = _.template $('#result-template').html()
  resultHtml = template result
  $("#results").append resultHtml

