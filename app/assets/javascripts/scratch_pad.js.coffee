window.ScratchPad =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    alert('Hello from Backbone!')

window.App = window.ScratchPad

$(document).ready ->
  ScratchPad.initialize()
