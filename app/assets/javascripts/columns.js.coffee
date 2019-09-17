# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  UI = new SquireUI(
    replace: 'textarea#seditor'
    buildPath: "/"
    height: 300)

$('form').submit ->
  $('#squire_description').val(UI.getHTML()).change()
  return